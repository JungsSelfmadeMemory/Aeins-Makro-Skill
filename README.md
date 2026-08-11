# AMIC-Plugins für Claude Code

Interner Marketplace mit dem Plugin **`aeins-makro`** – bündelt das gesammelte Wissen zum
Schreiben, Lesen und Analysieren von **A.eins-Makros** (AMIC ERP) als Claude-Code-Skill.

## Inhalt des Plugins `aeins-makro`

- **Skill** `aeins-makro` – lädt automatisch, wenn es um A.eins-/AMIC-Makros geht
  (Hausregeln, Sprachgerüst, Datenzugriff, Feld-ID-API, Vorgänge/CVorgangsHelper,
  CtrlString/AIS, Marktkasse).
- **References** – Entwicklerhandbuch (Hauptreferenz), komplette Sprach-/Funktions-/JPP-Referenz,
  FormPosition-Feldkatalog (+CSV), Marktkasse-Kassenfunktionen (+CSV), offene Punkte.
- **Script** `Export-AeinsMakros.ps1` – zieht alle Makros einer ODBC-DSN als `.pas`-Dateien
  und packt sie mit Zeitstempel in ein ZIP.
- **Beispielmakro** `KM_AuftraegeGenerieren.pas`.

## Installation (für Kollegen)

Voraussetzung: Claude Code. Dann:

```bash
# 1. Marketplace hinzufügen (Git-Repo, hier owner/repo oder Git-URL einsetzen)
/plugin marketplace add <owner>/aeins-makro-plugin

# 2. Plugin installieren
/plugin install aeins-makro@amic-plugins
```

Alternativen zum Repo-Bezug:
```bash
/plugin marketplace add https://<git-host>/<pfad>/aeins-makro-plugin.git
/plugin marketplace add ./aeins-makro-plugin        # lokaler Pfad zum Testen
```

Der Skill triggert danach automatisch bei Makro-Themen; explizit aufrufbar als
`/aeins-makro:aeins-makro`.

## Updates

Das Plugin nutzt **keine feste Version** → Claude Code bezieht den jeweils neuesten
Git-Commit. Ablauf:

1. Änderungen committen und ins Git-Repo pushen.
2. Kollegen holen sich den neuen Stand mit:
   ```bash
   /plugin marketplace update amic-plugins
   ```

## Pflegehinweise

- **Installationsspezifische Werte** (Feld-IDs, AIS-Gruppen, Kassen-Aktionen, Vorgangsklassen)
  sind DB-abhängig. Die mitgelieferten CSVs stammen aus einer Demo-DB und dienen nur als
  Orientierung – im Zweifel per `SELECT` gegen die Ziel-DB prüfen.
- Neue Erkenntnisse gehören in `plugins/aeins-makro/skills/aeins-makro/` (SKILL.md kurz halten,
  Details in `references/`).
- Struktur validieren: `claude plugin validate ./plugins/aeins-makro`.
