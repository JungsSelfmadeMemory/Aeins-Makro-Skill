# Dokumentation: JAnwendReport

**Datei:** `a1aeins/AnwJPP.cpp`  
**Klasse:** `JAnwendReport`  
**Zweck:** Methoden zum bebuchen der Kostenstellen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Methoden zum bebuchen der Kostenstellen

---

## Methodenübersicht

### Read

**Kurzbeschreibung:**  
Einlesen der ReportInfos Parameter: m_AnwRptId

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ReadByFileName

**Kurzbeschreibung:**  
Setz den Dateinamen. Aufruf ohne Tabelle Anwendreport. Parameter: m_AnwRptId

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FeldFormat

**Kurzbeschreibung:**  
Werte ins Crystalfromat überführen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| FeldWert | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### CreateViews

**Kurzbeschreibung:**  
View Anlegen

_Keine Parameter._

**Rückgabe:** bool

---

### SetFileName

**Kurzbeschreibung:**  
Dateinamen überschreiben. Parameter FILENAME

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| FileName | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ListenStart

**Kurzbeschreibung:**  
Startet den Report. Parameter : Device

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Device | ? | optional | `—` |
| NurArchivieren | ? | optional | `—` |
| immerArchivieren | ? | optional | `—` |
| ASK | ? | optional | `—` |
| NumberOfCopies | ? | optional | `—` |
| TestMode | ? | optional | `—` |
| askAfterExport | ? | optional | `—` |
| fa_KundNummer | ? | optional | `—` |
| fa_BelegNummer | ? | optional | `—` |
| fa_BelegReferenz | ? | optional | `—` |
| fa_BelegDatum | ? | optional | `—` |
| fa_BelegTypText | ? | optional | `—` |
| fa_BelegKlasse | ? | optional | `—` |
| SetSelectFormula | ? | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetFormular

**Kurzbeschreibung:**  
Setzt eines eigenen Formelfeldes. Parameter: formula , value

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Archivieren

**Kurzbeschreibung:**  
Ruft die Methode CrystalArchivieren auf.  Nur aus A.eins.Report!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteProfile

**Kurzbeschreibung:**  
löscht das aktuelle Profil

_Keine Parameter._

**Rückgabe:** bool

---

### ToggleProfile

**Kurzbeschreibung:**  
Profile Blättern

_Keine Parameter._

**Rückgabe:** bool

---

### SaveProfileAs

**Kurzbeschreibung:**  
Profile speichern unter. Parameter: Profile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Profile | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ReadAllProfiles

**Kurzbeschreibung:**  
Alle Profile neu Einlesen

_Keine Parameter._

**Rückgabe:** bool

---

### LoadProfile

**Kurzbeschreibung:**  
Ausgewähltes Profile laden. Parameter: Profile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Profile | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ShowProfile

**Kurzbeschreibung:**  
Alle Profile anzeigen. Parameter: Arrayname

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Array | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### LastCondToMem

**Kurzbeschreibung:**  
Die Letzten Werte vom Bildschirm lesen

_Keine Parameter._

**Rückgabe:** bool

---

### SetPrinterByNumber

**Kurzbeschreibung:**  
Hohlt sich anhand der DruckerNummer den Drucker, auf dem der Report gedruckt werden soll

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PrinterNumber | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetPrinterByName

**Kurzbeschreibung:**  
Hohlt sich anhand des DruckerNamen den Drucker, auf dem der Report gedruckt werden soll

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PrinterName | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetSelectedPrinter

**Kurzbeschreibung:**  
Liefert den Ausgewählten Drucker

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| FeldName | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SelectPrinter

**Kurzbeschreibung:**  
Öffnet den Standarddruckdialog

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| FeldName | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetVon

**Kurzbeschreibung:**  
Den Wert einer VON[] Variablen übeschreiben

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| idx | ? | ja | `—` |
| von | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetBis

**Kurzbeschreibung:**  
Den Wert einer BIS[] Variablen übeschreiben

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| idx | ? | ja | `—` |
| bis | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnwRptVorlaufOB

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptVorherMask

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptVorherFun

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptNachherJPL

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptFilename

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptFullFilename

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptArchivGruppe

**Kurzbeschreibung:**  
Liefert die ArchivGruppe

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptDir

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptDSN

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwLastProf

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwCondId

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptBezeich

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetFunktionErlaubt

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptArchivSelect

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptArchivCondition

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptArchivFormat

**Kurzbeschreibung:**  
PDF = 0 / Word = 1

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptFeld_BelegDatum

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptFeld_BelegNummer

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptFeld_KundenNummer

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwRptId

**Kurzbeschreibung:**  
Liefert was

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwCondVariable

**Kurzbeschreibung:**  
Liefert was

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| OCC | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnwCondNummer

**Kurzbeschreibung:**  
Liefert was

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| OCC | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetCondVon

**Kurzbeschreibung:**  
Liefert was

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| OCC | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetCondBis

**Kurzbeschreibung:**  
Liefert was

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| OCC | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnwCondVon

**Kurzbeschreibung:**  
Liefert was

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| OCC | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnwCondBis

**Kurzbeschreibung:**  
Liefert was

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| OCC | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnwCondStat

**Kurzbeschreibung:**  
Liefert was

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| OCC | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnwCondExpr

**Kurzbeschreibung:**  
Liefert was

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| OCC | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetVersion

**Kurzbeschreibung:**  
Liefert die Version von Crystal Report

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| MaskenFeld | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetRequiredVersion

**Kurzbeschreibung:**  
Liefert die erwartete Version von Crystal Report

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| MaskenFeld | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetWaehrung

**Kurzbeschreibung:**  
Überschreibt die Währung

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Waehrung | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetExportPfad

**Kurzbeschreibung:**  
Überschreibt den ExportPfad!

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| ExportPfad | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetFileRefresh

**Kurzbeschreibung:**  
Setz das Änderungsdatum des Reports in der Datenbank

_Keine Parameter._

**Rückgabe:** bool

---

### FromXMLFile

**Kurzbeschreibung:**  
liest Parametrisierung aus XML-Steuerdatei

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| xml | string | optional | `COM::Tools->Param( "crwxml" )` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetVorbelegung

**Kurzbeschreibung:**  
Ersetzt #YEAR u.ä durch den Wert!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFormatedValue

**Kurzbeschreibung:**  
Formatiert ein Feld

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
