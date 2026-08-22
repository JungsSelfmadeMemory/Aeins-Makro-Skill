# Dokumentation: JFileSystem

**Datei:** `a1aeins/ah_filesystem.cpp`  
**Klasse:** `JFileSystem`  
**Zweck:** Filesystem-Unterstützung für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Filesystem-Unterstützung für JPL

---

## Methodenübersicht

### FileExistsMask

**Kurzbeschreibung:**  
Iteriert über per COM::Tools->FileExistsMask(Maske,Pfad,Rekursiv,Schreibschutz) ermittelte Trefferliste; gibt pro Aufruf den nächsten Dateinamen zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Maske | string | ja | `—` |
| Pfad | string | ja | `—` |
| Rekursiv | long | ja | `—` |
| Schreibschutz | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### FileExists

**Kurzbeschreibung:**  
Prüft via COM::Tools->FileExists(datei) Existenz lokal; optional JVARS-Ein/Ausgabe; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool

---

### DirectoryExists

**Kurzbeschreibung:**  
Prüft via COM::Tools->DirectoryExists(dir); optional JVARS-Ein/Ausgabe; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DIR | string | ja | `—` |
| jvars | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool

---

### DirectoryCreate

**Kurzbeschreibung:**  
Legt Verzeichnis via COM::Tools->DirectoryCreate(dir) an; optional JVARS-Ein/Ausgabe; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DIR | string | ja | `—` |
| jvars | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool

---

### DirectoryRename

**Kurzbeschreibung:**  
Benennt Verzeichnis via COM::Tools->DirectoryRename(source,target) um; optional JVARS; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SOURCE | string | ja | `—` |
| TARGET | string | ja | `—` |
| jvars | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool

---

### DirectoryRemove

**Kurzbeschreibung:**  
Entfernt Verzeichnis via COM::Tools->DirectoryRemove(source); optional JVARS; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SOURCE | string | ja | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool

---

### DirectoryAccessAble

**Kurzbeschreibung:**  
Prüft Verzeichnis/Datei auf Schreibzugriff: DirectoryExists + Testdatei via ReserveUniqueFilename/DeleteFile bzw. WriteToFile; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DIR | string | ja | `—` |
| ispath | bool | optional | `TRUE` |
| dirjvars | long | optional | `-1` |

**Rückgabe:** bool

---

### PrepareFileAndDirectory

**Kurzbeschreibung:**  
Stellt Pfad sicher (DirectoryExists/Create), testet Schreibrecht (ReserveUniqueFilename), prüft Readonly/AccessAble; liefert HRESULT-Code. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** long

---

### DeleteFile

**Kurzbeschreibung:**  
Löscht Datei via COM::Tools->DeleteFile(datei,delit); optional JVARS-Ein/Ausgabe; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| DEL | bool | optional | `TRUE` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteFiles

**Kurzbeschreibung:**  
Holt Dateiliste aus JVARS-Array und löscht jede via COM::Tools->DeleteFile; liefert UND-verknüpften Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILES | string | ja | `—` |
| DEL | bool | optional | `TRUE` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetTempFile

**Kurzbeschreibung:**  
Normalisiert Endung/Pfad (ggf. GetTempPath), reserviert eindeutigen Dateinamen via COM::Tools->ReserveUniqueFilename; liefert Pfad. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| prefix | string | optional | `a1t_` |
| ext | string | optional | `.txt` |
| path | string | optional | `—` |
| guid | bool | optional | `FALSE` |
| path_is_jvarname | bool | optional | `FALSE` |

**Rückgabe:** string

---

### GetFileSize

**Kurzbeschreibung:**  
Ermittelt Dateigröße via COM::Tools->GetFileSize; liefert long (-1 bei Fehler). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |

**Rückgabe:** long

---

### WriteToFile

**Kurzbeschreibung:**  
Schreibt Inhalt via COM::Tools->WriteToFile(datei,inhalt) (überschreibend); optional JVARS-Ein/Ausgabe. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| content | string | optional | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AppendToFile

**Kurzbeschreibung:**  
Hängt Inhalt via COM::Tools->AppendToFile(datei,inhalt) an; optional JVARS-Ein/Ausgabe. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| content | string | optional | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetModusTime

**Kurzbeschreibung:**  
Liest Zeitstempel via COM::Tools->GetModusTime(datei,stamp,modus) und schreibt ihn per glb->SetzeMaskenFeld in ein Maskenfeld. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| STAMP | bool | optional | `FALSE` |
| MODUS | long | optional | `MODUS_FTLASTWRITETIME` |
| lwt$ | string | ja | `—` |
| occ | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FileAccessAble

**Kurzbeschreibung:**  
Holt Dateinamen aus Maskenfeld/JVARS und prüft Zugriff via COM::Tools->AccessAble; liefert bool. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool

---

### FileIsReadOnly

**Kurzbeschreibung:**  
Prüft via COM::Tools->IsLocationReadonly(File); optional JVARS-Ein/Ausgabe; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool

---

### DOS_Name

**Kurzbeschreibung:**  
Ermittelt DOS-Kurznamen via COM::Tools->GetDos(loc,2); liefert String. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LOC | string | ja | `—` |

**Rückgabe:** string

---

### MoveHTML

**Kurzbeschreibung:**  
Verschiebt HTML-Datei samt _Images-Ordner ins Ziel, patcht BASE/IMG-Tags per RegExp, kopiert via COM::Tools-Datei/Verzeichnisfunktionen und löscht Quelle. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| source | string | ja | `—` |
| target | string | ja | `—` |
| newname | string | optional | `—` |
| delete | bool | optional | `TRUE` |
| tender | string | optional | `_Images` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CopyFile

**Kurzbeschreibung:**  
Kopiert via COM::Tools->CopyFile(source,target,fail); optional JVARS-Ein/Ausgabe; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SOURCE | string | ja | `—` |
| TARGET | string | ja | `—` |
| FAIL | bool | optional | `FALSE` |
| owner | long | optional | `0` |
| jvars | bool | optional | `FALSE` |

**Rückgabe:** bool

---

### MoveFile

**Kurzbeschreibung:**  
Verschiebt via COM::Tools->MoveFile(source,target,fail); optional JVARS-Ein/Ausgabe; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SOURCE | string | ja | `—` |
| TARGET | string | ja | `—` |
| FAIL | bool | optional | `FALSE` |
| jvars | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool

---

### MoveFiles

**Kurzbeschreibung:**  
MoveFile

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SOURCES | string | ja | `—` |
| ASTARGET | string | ja | `—` |
| TARGET | string | ja | `—` |
| owner | long | optional | `0` |
| RESULT | string | optional | `—` |
| RESULTWOP | string | optional | `—` |
| KLAMMER | string | optional | `\` |
| JOIN | string | optional | ` ` |
| JOINEDWOP | string | optional | ` ` |
| JOINED | string | optional | ` ` |
| COUNT | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RenameFile

**Kurzbeschreibung:**  
Benennt via COM::Tools->RenameFile um, loggt bei Fehler optional per smx_fehlp; optional JVARS; liefert int-Code. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SOURCE | string | ja | `—` |
| TARGET | string | ja | `—` |
| FAIL | bool | optional | `FALSE` |
| jvars | bool | optional | `FALSE` |
| errorLog | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** long

---

### SearchInFile

**Kurzbeschreibung:**  
Liest Suchparameter aus JVARS, ruft COM::Tools->SearchInFile(loc,ab_position,kennungen,max_read) auf und schreibt ergebnis/found_at/result zurück in JVARS. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SrvFileExists

**Kurzbeschreibung:**  
Server-seitig: ruft DB-Funktion ext_filesystem(EXT_FS_EXISTFILE) per Cursor auf; liefert bool aus IsWahr(Result). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |

**Rückgabe:** bool

---

### SrvFileRunning

**Kurzbeschreibung:**  
Iteriert über DB-Dateien via db_property('FILE',db) und vergleicht (strikt/per Name) mit datei via COM::Tools->IsEqual; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| STRICT | bool | optional | `TRUE` |

**Rückgabe:** bool

---

### SrvCopyFile

**Kurzbeschreibung:**  
Server-seitig: ruft DB-Funktion ext_filesystem(EXT_FS_COPYFILE) mit Source/Target per Cursor auf; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SOURCE | string | ja | `—` |
| TARGET | string | ja | `—` |
| FAIL | bool | optional | `FALSE` |

**Rückgabe:** bool

---

### SrvMoveFile

**Kurzbeschreibung:**  
Server-seitig: ruft DB-Funktion ext_filesystem(EXT_FS_MOVEFILE) mit Source/Target per Cursor auf; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SOURCE | string | ja | `—` |
| TARGET | string | ja | `—` |
| FAIL | bool | optional | `FALSE` |

**Rückgabe:** bool

---

### SrvDirectoryExists

**Kurzbeschreibung:**  
Server-seitig: ruft DB-Funktion ext_filesystem(EXT_FS_EXISTDIR) per Cursor auf; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DIR | string | ja | `—` |

**Rückgabe:** bool

---

### SrvDirectoryCreate

**Kurzbeschreibung:**  
Server-seitig: ruft DB-Funktion ext_filesystem(EXT_FS_CREATEDIR) per Cursor auf; liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DIR | string | ja | `—` |

**Rückgabe:** bool

---

### SrvGetCurrentDir

**Kurzbeschreibung:**  
Server-seitig: ruft DB-Funktion ext_filesystem(EXT_FS_CURRENTDIR) per Cursor auf; liefert Verzeichnis-String. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### SrvGetModulDir

**Kurzbeschreibung:**  
Server-seitig: ruft DB-Funktion ext_filesystem(EXT_FS_MODULDIR) per Cursor auf; liefert Modulverzeichnis-String. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### GetFileExt

**Kurzbeschreibung:**  
Liefert Dateiendung via COM::Tools->GetFileExt(datei); optional JVARS-Ein/Ausgabe. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** string

---

### GetFileName

**Kurzbeschreibung:**  
Liefert Dateinamen via COM::Tools->GetFileName(datei); optional JVARS-Ein/Ausgabe. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** string

---

### GetFileNameOhneExt

**Kurzbeschreibung:**  
Liefert Dateinamen ohne Endung via COM::Tools->GetFileNameOhneExt(datei); optional JVARS-Ein/Ausgabe. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** string

---

### GetPath

**Kurzbeschreibung:**  
Liefert Pfadanteil via COM::Tools->GetPath(datei); optional JVARS-Ein/Ausgabe. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | ja | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** string

---

### BuildPath

**Kurzbeschreibung:**  
Setzt Pfad+Datei via COM::Tools->BuildPath zusammen (%temp% -> GetTempPath); optional JVARS-Ein/Ausgabe. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FILE | string | optional | `—` |
| PATH | string | optional | `—` |
| JVARS | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** string

---

### ReserveUniqueTemppath

**Kurzbeschreibung:**  
Reserviert eindeutiges Temp-Verzeichnis via COM::Tools->ReserveUniqueTemppath und legt es in JVARS unter name ab (sonst UNSET). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ShowDialog

**Kurzbeschreibung:**  
Datei- oder Verzeichnisdialog

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PATH | string | optional | `—` |
| MASK | string | optional | `*.*` |
| TITLE | string | optional | `—` |
| MODE | string | ja | `FB_OPEN` |
| EXTENSIONS | string | optional | `—` |
| TYPENAMES | string | optional | `—` |
| DELIMITER | string | optional | `|` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
