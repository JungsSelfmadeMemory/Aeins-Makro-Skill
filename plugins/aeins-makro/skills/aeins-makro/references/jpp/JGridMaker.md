# Dokumentation: JGridMaker

**Datei:** `a1aeins/JGridMaker.cpp`  
**Klasse:** `JGridMaker`  
**Zweck:** Grids mit daten füllen und für Anwender erweitern  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Grids mit daten füllen und für Anwender erweitern

---

## Methodenübersicht

### Setup

**Kurzbeschreibung:**  
Grid und Defintionen verbinden und alles für die Anzeige vorbereiten. Parameter: 'Definition' = Name aus GriddefStamm, 'GridName' = Name des Grids auf der Maske

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Definition | string | ja | `—` |
| GridName | string | ja | `—` |
| TestModus | long | optional | `0` |
| SystemHandle | string | optional | `h` |
| UserHandle | string | optional | `u` |
| CreateFields | long | optional | `1` |
| AfterFill | string | optional | `—` |
| ColClick | string | optional | `—` |
| CopyFeld | string | optional | `—` |
| TestInsertOcc | string | optional | `—` |
| TestDeleteOcc | string | optional | `—` |
| AfterInsertOcc | string | optional | `—` |
| AfterDeleteOcc | string | optional | `—` |
| AppKeyInsert | long | optional | `APP23` |
| ApKeyDelete | long | optional | `APP24` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FetchData

**Kurzbeschreibung:**  
Sql Ausführen und Date ins Grid befördern, Parameter: alle im Pfleger erfassten Parametern Parameter

_Keine Parameter._

**Rückgabe:** bool

---

### FetchDataDefault

**Kurzbeschreibung:**  
Sql Ausführen mit den Defaultparametern und Date ins Grid befördern, Parameter: alle im Pfleger erfassten Parametern Parameter

_Keine Parameter._

**Rückgabe:** bool

---

### Clear

**Kurzbeschreibung:**  
Alte Spalten Löschen

_Keine Parameter._

**Rückgabe:** bool

---

### ToggleHidden

**Kurzbeschreibung:**  
Zum Testen unsichtabe Felder Anzeigen / verbergen

_Keine Parameter._

**Rückgabe:** bool

---

### SwitchRows

**Kurzbeschreibung:**  
Vertausche Zeilen : Parameter Row1 und Row2

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Row1 | long | ja | `0` |
| Row2 | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RowUp

**Kurzbeschreibung:**  
Zeile ( optisch ) nach oben schieben = kleinerer Index. Parameter Row

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Row | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RowDown

**Kurzbeschreibung:**  
Zeile ( optisch ) nach unten schieben = größerer Index. Parameter Row

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Row | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetName

**Kurzbeschreibung:**  
Name der Griddefinition

_Keine Parameter._

**Rückgabe:** bool

---

### GetBeschreibung

**Kurzbeschreibung:**  
Beschreibung der Griddefinition

_Keine Parameter._

**Rückgabe:** bool

---

### SourceTemplate

**Kurzbeschreibung:**  
Erstelle einen Source Rahmen für JPL

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Definition | string | ja | `—` |
| ST_ModulName | string | optional | `—` |
| ST_GridName | string | ja | `—` |
| ST_JPP_Handle | string | ja | `—` |
| ST_SystemHandle | string | optional | `h` |
| ST_UserHandle | string | optional | `u` |
| ST_CheckBits | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AutoSpaltenAnlegen

**Kurzbeschreibung:**  
Erstelle Spalten aus aktuelem SQL, damit's schneller geht !

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Definition | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ShowStatistics

**Kurzbeschreibung:**  
Ausgabe von internen Satatustiken, wird nur  für interne Zwecke gebraucht !

_Keine Parameter._

**Rückgabe:** bool

---

### SortColumn

**Kurzbeschreibung:**  
Sortier nach dieser Spalte Parameter WidgetId = Id der Spalte

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WidgetId | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ShowSystemSQL

**Kurzbeschreibung:**  
Zeige das zuletzt ausgeführte System SQL Statement

_Keine Parameter._

**Rückgabe:** bool

---

### ShowUserSQL

**Kurzbeschreibung:**  
Zeige das zuletzt ausgeführte User SQL Statement

_Keine Parameter._

**Rückgabe:** bool

---

### FastRepeat

**Kurzbeschreibung:**  
Wurde  seit dem letztn Aufrauf ein Zeiltlimit unterschritten : PAR: LIMIT ( in ms )

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Limit | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### InsertOccHandler

**Kurzbeschreibung:**  
Interne Behandlung Zeileneinfügen, nicht selbst aufrufen

_Keine Parameter._

**Rückgabe:** bool

---

### DeleteOccHandler

**Kurzbeschreibung:**  
Interne Behandlung ZeileneLöschen, nicht selbst aufrufen

_Keine Parameter._

**Rückgabe:** bool

---

### ToolBox

**Kurzbeschreibung:**  
Einige Spezialfunktionen dieses Grids

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
