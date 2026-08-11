<#
.SYNOPSIS
    Exportiert saemtliche A.eins-Makros aus einer SQL-Anywhere-Datenbank in einzelne Textdateien.

.DESCRIPTION
    Verbindet sich per ODBC (System.Data.Odbc) auf eine A.eins-Datenbank und schreibt jedes
    Makro (Tabellen ScriptStamm + ScriptZeile) in eine eigene .amic-Datei.

    WICHTIG: Der eindeutige Schluessel eines Makros ist ScriptId + ScriptBesitzer,
    NICHT ScriptId allein. Es gibt ScriptIds, die je einmal mit Besitzer 0 und 1
    existieren, mit voellig unterschiedlichem Inhalt. Der Export beruecksichtigt das.

.PARAMETER Dsn
    Name der ODBC-DSN (Default: DEMO_FOOD).

.PARAMETER ConnectionString
    Alternativ zur DSN ein vollstaendiger ODBC-Connection-String
    (z.B. "Driver={SQL Anywhere 17};Server=...;DBN=...;UID=...;PWD=...").
    Ueberschreibt -Dsn, wenn gesetzt.

.PARAMETER OutDir
    Zielverzeichnis fuer die Textdateien. Default: <Skriptverzeichnis>\Makros_Export

.PARAMETER IncludeEmpty
    Auch (nahezu) leere Makros ohne Inhalt exportieren.

.EXAMPLE
    .\Export-AeinsMakros.ps1
    Exportiert alle Makros aus DSN DEMO_FOOD nach .\Makros_Export

.EXAMPLE
    .\Export-AeinsMakros.ps1 -Dsn MEINE_DB -OutDir C:\Temp\Makros
#>

[CmdletBinding()]
param(
    [string]$Dsn,
    [string]$ConnectionString,
    [string]$OutDir,
    [ValidateSet('Privat', 'Standard')]
    [string]$Besitzer,
    [switch]$IncludeEmpty
)

$ErrorActionPreference = 'Stop'

# =============================================================================
# KONFIGURATION - hier die Datenbank festlegen (oder per Parameter uebergeben)
# -----------------------------------------------------------------------------
# Entweder eine ODBC-DSN ...
$DEFAULT_DSN = 'DEMO_FOOD'
# ... ODER einen vollstaendigen ODBC-Connection-String (hat Vorrang, wenn gesetzt):
# z.B. 'Driver={SQL Anywhere 17};Server=MeinServer;DBN=MeineDB;UID=user;PWD=pass'
$DEFAULT_CONNECTIONSTRING = ''
# =============================================================================

# Parameter haben Vorrang vor den Defaults aus dem Konfig-Block oben.
if (-not $Dsn)              { $Dsn = $DEFAULT_DSN }
if (-not $ConnectionString) { $ConnectionString = $DEFAULT_CONNECTIONSTRING }

if (-not $ConnectionString -and -not $Dsn) {
    throw "Keine Datenbank angegeben. Bitte -Dsn oder -ConnectionString uebergeben " +
          "oder im KONFIGURATION-Block oben `$DEFAULT_DSN bzw. `$DEFAULT_CONNECTIONSTRING setzen."
}

# --- Zielverzeichnis bestimmen -------------------------------------------------
if (-not $OutDir) {
    $scriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { (Get-Location).Path }
    $OutDir = Join-Path $scriptDir 'Makros_Export'
}
if (-not (Test-Path $OutDir)) {
    New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
}
Write-Host "Zielverzeichnis: $OutDir" -ForegroundColor Cyan

# --- Verbindung aufbauen -------------------------------------------------------
if (-not $ConnectionString) {
    $ConnectionString = "DSN=$Dsn"
}

Write-Host "Verbinde: $ConnectionString" -ForegroundColor Cyan
$conn = New-Object System.Data.Odbc.OdbcConnection $ConnectionString
$conn.Open()

# Hilfsfunktion: verbotene Dateinamen-Zeichen ersetzen
$invalid = [System.IO.Path]::GetInvalidFileNameChars()
function ConvertTo-SafeName([string]$name) {
    if ([string]::IsNullOrWhiteSpace($name)) { return '_unbenannt' }
    $sb = New-Object System.Text.StringBuilder
    foreach ($ch in $name.ToCharArray()) {
        if ($invalid -contains $ch) { [void]$sb.Append('_') }
        else { [void]$sb.Append($ch) }
    }
    return $sb.ToString().Trim()
}

try {
    # --- 1) Kopfdaten aller Makros laden ---------------------------------------
    # Optionaler Besitzer-Filter: Privat = ScriptBesitzer 1, Standard = ScriptBesitzer 0,
    # ohne Parameter = alle.
    $where = ''
    switch ($Besitzer) {
        'Privat'   { $where = "`n WHERE ScriptBesitzer = 1"; Write-Host "Filter: nur Privat (ScriptBesitzer = 1)" -ForegroundColor Cyan }
        'Standard' { $where = "`n WHERE ScriptBesitzer = 0"; Write-Host "Filter: nur Standard (ScriptBesitzer = 0)" -ForegroundColor Cyan }
        default    { Write-Host "Filter: alle Besitzer" -ForegroundColor Cyan }
    }

    $headCmd = $conn.CreateCommand()
    $headCmd.CommandText = @"
SELECT ScriptId, ScriptBesitzer, ScriptName
  FROM ScriptStamm$where
 ORDER BY ScriptName, ScriptId, ScriptBesitzer
"@
    $reader = $headCmd.ExecuteReader()

    $makros = @()
    while ($reader.Read()) {
        $makros += [PSCustomObject]@{
            ScriptId       = $reader['ScriptId']
            ScriptBesitzer = $reader['ScriptBesitzer']
            ScriptName     = if ($reader['ScriptName'] -is [DBNull]) { '' } else { [string]$reader['ScriptName'] }
        }
    }
    $reader.Close()
    Write-Host "Gefundene Makros: $($makros.Count)" -ForegroundColor Green

    # --- 2) Vorbereiteter Befehl fuer den Makrotext ----------------------------
    $textCmd = $conn.CreateCommand()
    $textCmd.CommandText = @'
SELECT ScriptZ_Text
  FROM ScriptZeile
 WHERE ScriptId = ? AND ScriptBesitzer = ?
 ORDER BY ScriptZ_Sortier
'@
    $parId  = $textCmd.Parameters.Add((New-Object System.Data.Odbc.OdbcParameter))
    $parBes = $textCmd.Parameters.Add((New-Object System.Data.Odbc.OdbcParameter))

    # UTF-8 ohne BOM zum Schreiben
    $utf8 = New-Object System.Text.UTF8Encoding($false)

    $exported = 0
    $skipped  = 0
    $usedNames = @{}

    foreach ($m in $makros) {
        $parId.Value  = $m.ScriptId
        $parBes.Value = $m.ScriptBesitzer

        $lines = New-Object System.Collections.Generic.List[string]
        $tr = $textCmd.ExecuteReader()
        while ($tr.Read()) {
            $t = if ($tr[0] -is [DBNull]) { '' } else { [string]$tr[0] }
            $lines.Add($t)
        }
        $tr.Close()

        $content = [string]::Join("`r`n", $lines)

        if (-not $IncludeEmpty -and [string]::IsNullOrWhiteSpace($content)) {
            $skipped++
            continue
        }

        # Dateiname: <ScriptName>__id<ScriptId>_bes<ScriptBesitzer>.pas
        $safe = ConvertTo-SafeName $m.ScriptName
        $baseName = "{0}__id{1}_bes{2}" -f $safe, $m.ScriptId, $m.ScriptBesitzer
        $fileName = "$baseName.pas"

        # Kollisionsschutz (sollte durch id+bes eindeutig sein, aber sicher ist sicher)
        if ($usedNames.ContainsKey($fileName)) {
            $usedNames[$fileName]++
            $fileName = "{0}_{1}.pas" -f $baseName, $usedNames[$fileName]
        } else {
            $usedNames[$fileName] = 0
        }

        $path = Join-Path $OutDir $fileName
        [System.IO.File]::WriteAllText($path, $content, $utf8)
        $exported++

        if ($exported % 50 -eq 0) {
            Write-Host "  ... $exported exportiert" -ForegroundColor DarkGray
        }
    }

    Write-Host ""
    Write-Host "Fertig. Exportiert: $exported   Uebersprungen (leer): $skipped" -ForegroundColor Green
    Write-Host "Dateien liegen in: $OutDir" -ForegroundColor Green
}
finally {
    $conn.Close()
    $conn.Dispose()
}

# --- ZIP mit Zeitstempel erzeugen ---------------------------------------------
# Name: <DSN>_YYYYMMDD_HHMMSS.zip, abgelegt neben dem Export-Ordner.
# Statt Compress-Archive (oeffnet Dateien exklusiv und scheitert an AV-/Indexer-
# Sperren) wird hier manuell gezippt: Quelldateien mit FileShare.ReadWrite lesen
# und pro Datei kurz wiederholen, falls sie momentan gesperrt ist.
if ($exported -gt 0) {
    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem

    $stamp   = Get-Date -Format 'yyyyMMdd_HHmmss'
    $zipName = "{0}_{1}.zip" -f $Dsn, $stamp
    $zipDir  = Split-Path -Parent $OutDir
    if ([string]::IsNullOrEmpty($zipDir)) { $zipDir = $OutDir }
    $zipPath = Join-Path $zipDir $zipName

    if (Test-Path $zipPath) { Remove-Item $zipPath -Force }

    $zipFs = [System.IO.File]::Open($zipPath, [System.IO.FileMode]::Create)
    $zip   = New-Object System.IO.Compression.ZipArchive($zipFs, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        foreach ($f in Get-ChildItem -Path $OutDir -Filter '*.pas' -File) {
            # Quelldatei tolerant oeffnen, mit bis zu 5 Versuchen bei Sperre.
            $src = $null
            for ($try = 1; $try -le 5; $try++) {
                try {
                    $src = [System.IO.File]::Open($f.FullName, [System.IO.FileMode]::Open,
                            [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
                    break
                }
                catch {
                    if ($try -eq 5) { throw }
                    Start-Sleep -Milliseconds 300
                }
            }

            $entry = $zip.CreateEntry($f.Name, [System.IO.Compression.CompressionLevel]::Optimal)
            $es = $entry.Open()
            try   { $src.CopyTo($es) }
            finally {
                $es.Dispose()
                $src.Dispose()
            }
        }
    }
    finally {
        $zip.Dispose()
        $zipFs.Dispose()
    }

    Write-Host "ZIP erstellt: $zipPath" -ForegroundColor Green

    # Einzeldateien nach erfolgreichem Zippen wieder loeschen.
    Get-ChildItem -Path $OutDir -Filter '*.pas' -File | Remove-Item -Force
    Write-Host "Einzeldateien geloescht (nur ZIP verbleibt)." -ForegroundColor DarkGray
}
else {
    Write-Host "Keine Dateien exportiert - kein ZIP erstellt." -ForegroundColor Yellow
}
