# Dokumentation: JPPAnwendGrid

**Datei:** `a1aeins/JPPAnwendGrid.cpp`  
**Klasse:** `JPPAnwendGrid`  
**Zweck:** Methoden zum Anzeigen eines Grids nach Auswahllistenefinition  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Methoden zum Anzeigen eines Grids nach Auswahllistenefinition

---

## Methodenübersicht

### SetOptionBox

**Kurzbeschreibung:**  
AW_FSEL braucht den name der Optionbox

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| OptionBoxFeldName | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### InfragisticsInit

**Kurzbeschreibung:**  
Infragistics hat sein eigenes Grid. Hier werden nur ein paar Variablen initialisiert.

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| ANWID | string | optional | `—` |
| ANWVARID | string | optional | `—` |
| anwvarsystemprofil | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### AnsichtInit

**Kurzbeschreibung:**  
Erstellt eine komplette Ansicht anhand der vorgegebenen Variante

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| ANWID | string | optional | `—` |
| ANWVARID | string | optional | `—` |
| ANWVARSYSTEMPROFIL | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### FelderAufbauen

**Kurzbeschreibung:**  
Aufbauen des Grids. Erwarte wird AnwVarAWBox als Parameter

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| ANWID | string | optional | `—` |
| ANWVARID | string | optional | `—` |
| OnClick | string | optional | `—` |
| OnEntry | string | optional | `—` |
| OnExit | string | optional | `—` |
| ColumnClick | string | optional | `—` |
| GridName | string | optional | `—` |
| UseHandle | long | optional | `—` |
| MnuToggle | long | ja | `—` |
| BreakDisabled | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### DatenAnZeigen

**Kurzbeschreibung:**  
Listet die Daten im Grid. Kein Parameter

_Keine Parameter._

**Rückgabe:** bool

---

### AddHiddenField

**Kurzbeschreibung:**  
Fügt ein zusätzliches verstecktes Feld zur Auswahlliste hinzu,. Parameter :FeldName, FeldTyp,FeldLaenge

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| FeldName | string | ja | `—` |
| FeldTyp | string | ja | `—` |
| FeldLaenge | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ZeileAnzeigen

**Kurzbeschreibung:**  
Listet eine Zeile im Grid. Parameter Cursor und Zeile(default)

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Zeile | long | ja | `—` |
| CURSOR | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ZeileLoeschen

**Kurzbeschreibung:**  
Loescht alle Zeilen bei denen das Identfeld einen Bestimmten Wert hat. Parameter FeldName und FeldWert

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| FeldWert | string | ja | `—` |
| FeldName | string | ja | `—` |
| FeldWert2 | string | optional | `—` |
| FeldName2 | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ZeileAendern

**Kurzbeschreibung:**  
Aender / fügt für ein IdentFeld Zeilen ein oder ändert sie. Parameter FeldName und FeldWert und Cursor

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| FeldWert | string | ja | `—` |
| FeldName | string | ja | `—` |
| Cursor | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SelectZeile

**Kurzbeschreibung:**  
Zeile auswählen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Occurence | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### DeSelectZeile

**Kurzbeschreibung:**  
Zeile entmarkieren

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Occurence | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### IsSelected

**Kurzbeschreibung:**  
Abfrage ob Zeile markiert

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Occurence | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetValue

**Kurzbeschreibung:**  
Liefert den Wert eine Hiddenfields

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Ziel | string | ja | `—` |
| FeldName | string | ja | `—` |
| Occurence | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Callaw_fsel

**Kurzbeschreibung:**  
Ruft aw_fsel auf

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| AnwId | string | ja | `—` |
| AnwVarId | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ExecuteDoubleClick

**Kurzbeschreibung:**  
Ruft die definierte Doppelclickfunktion auf

_Keine Parameter._

**Rückgabe:** bool

---

### MaskToFeldAuswahl

**Kurzbeschreibung:**  
aw_sel füllen

_Keine Parameter._

**Rückgabe:** bool

---

### FeldAuswahlToMask

**Kurzbeschreibung:**  
aw_sel füllen

_Keine Parameter._

**Rückgabe:** bool

---

### RestoreFeldAuswahl

**Kurzbeschreibung:**  
Original Feldauswahl wieder herstellen!

_Keine Parameter._

**Rückgabe:** bool

---

### RestoreFeldColor

**Kurzbeschreibung:**  
Original Feldfarben wieder herstellen!

_Keine Parameter._

**Rückgabe:** bool

---

### RestoreSummierung

**Kurzbeschreibung:**  
Original Summierung wieder herstellen!

_Keine Parameter._

**Rückgabe:** bool

---

### ShowIBVariables

**Kurzbeschreibung:**  
ItemboxVariablen in AW_FSEL anzeigen

_Keine Parameter._

**Rückgabe:** bool

---

### ShowIBVariable

**Kurzbeschreibung:**  
EINE ItemboxVariable in AW_FSEL_IBVAR anzeigen

_Keine Parameter._

**Rückgabe:** bool

---

### StoreIBVariable

**Kurzbeschreibung:**  
EINE ItemboxVariable aus AW_FSEL_IBVAR zurück in den Speicher

_Keine Parameter._

**Rückgabe:** bool

---

### ShowIBDefaults

**Kurzbeschreibung:**  
IBDEFAULTS in AW_FSEL anzeigen

_Keine Parameter._

**Rückgabe:** bool

---

### ShowIBDefault

**Kurzbeschreibung:**  
EIN Default in AW_FSEL_DEFAULT anzeigen

_Keine Parameter._

**Rückgabe:** bool

---

### StoreIBDefault

**Kurzbeschreibung:**  
EIN Default aus AW_FSEL_DEFAULT zurück in den Speicher

_Keine Parameter._

**Rückgabe:** bool

---

### TextToFile

**Kurzbeschreibung:**  
Schreibt den aktuelle SQL-Text in eine Datei!

_Keine Parameter._

**Rückgabe:** bool

---

### SqlinXML

**Kurzbeschreibung:**  
Sql-Text als XML aufbereiten

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwID

**Kurzbeschreibung:**  
Liefert die AnwID

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwVarID

**Kurzbeschreibung:**  
Liefert die aktuelle AnwendVariante

_Keine Parameter._

**Rückgabe:** bool

---

### GetFiBuInfo

**Kurzbeschreibung:**  
Liefert die hinter FIBU_INFO ( IB ) stehnden Werte

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwVarBesitzer

**Kurzbeschreibung:**  
Liefert den aktuellen Besitzer ( 0 oder 1 )

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
