# Dokumentation: CWidgetNavigator

**Datei:** `a1aeins/WidgetNavigator.cpp`  
**Klasse:** `CWidgetNavigator`  
**Zweck:** Klasse für die Positionierung von Widgets  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Klasse für die Positionierung von Widgets

---

## Methodenübersicht

### BtnLeft

**Kurzbeschreibung:**  
nach links

_Keine Parameter._

**Rückgabe:** bool

---

### BtnRight

**Kurzbeschreibung:**  
nach rechts

_Keine Parameter._

**Rückgabe:** bool

---

### BtnUp

**Kurzbeschreibung:**  
nach oben

_Keine Parameter._

**Rückgabe:** bool

---

### BtnDown

**Kurzbeschreibung:**  
nach unten

_Keine Parameter._

**Rückgabe:** bool

---

### moveToNextTab

**Kurzbeschreibung:**  
Feld einen Tab weiter schieben

_Keine Parameter._

**Rückgabe:** bool

---

### MoveTabDeck

**Kurzbeschreibung:**  
Verschieben eines Tabdecks

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Tabdeck | string | ja | `—` |
| Row | real | ja | `0.0` |
| Column | real | ja | `0.0` |
| Flush | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MoveAllItemsOnTabCard

**Kurzbeschreibung:**  
Verschiebt alle Elemente der Tabcard an eine bestimmte Position

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| TabCard | string | ja | `—` |
| Row | real | ja | `0.0` |
| Column | real | ja | `0.0` |
| Flush | long | optional | `0` |
| AbsolutPosition | long | optional | `0` |
| MinimizeItems | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetMaskenID

**Kurzbeschreibung:**  
MaskenID setzen;

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| MaskenID | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetFeldID

**Kurzbeschreibung:**  
FeldID setzen; Name = FeldIF, ID des Feldes

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FeldID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetColor

**Kurzbeschreibung:**  
Feld wird farblich hervorgehoben

_Keine Parameter._

**Rückgabe:** bool

---

### ResetColor

**Kurzbeschreibung:**  
Feldfarben werden zurückgesetzt

_Keine Parameter._

**Rückgabe:** bool

---

### RestoreFields

**Kurzbeschreibung:**  
Einstellungen für die Felder aus der Datenbank herstellen

_Keine Parameter._

**Rückgabe:** bool

---

### PrepareFields

**Kurzbeschreibung:**  
Felder fürs Verschieben vorbereiten

_Keine Parameter._

**Rückgabe:** bool

---

### saveFieldsStatus

**Kurzbeschreibung:**  
Feldeinstellungen in der Datenbank speichern

_Keine Parameter._

**Rückgabe:** bool

---

### saveFields

**Kurzbeschreibung:**  
Feldverschiebung in der Datenbank speichern;

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BedienerID | long | ja | `0` |
| Init | bool | optional | `false` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### loadFields

**Kurzbeschreibung:**  
Feldverschiebung aus der Datenbank laden;

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BedienerID | long | ja | `0` |
| Init | bool | optional | `false` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### deleteFields

**Kurzbeschreibung:**  
Feldverschiebung in der Datenbank löschen;

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BedienerID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### addField

**Kurzbeschreibung:**  
Feld zur Feldliste hinzufügen;

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FeldID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### clearFieldList

**Kurzbeschreibung:**  
Feldliste leeren

_Keine Parameter._

**Rückgabe:** bool

---

### fontUP

**Kurzbeschreibung:**  
Schrift vergrößern

_Keine Parameter._

**Rückgabe:** bool

---

### fontDOWN

**Kurzbeschreibung:**  
Schrift verkleinern

_Keine Parameter._

**Rückgabe:** bool

---

### getPointSize

**Kurzbeschreibung:**  
Schriftgröße

_Keine Parameter._

**Rückgabe:** bool

---

### getStepsize

**Kurzbeschreibung:**  
Schrittweite

_Keine Parameter._

**Rückgabe:** bool

---

### setStepsize

**Kurzbeschreibung:**  
Schrittweite

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Stepsize | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### lengthUP

**Kurzbeschreibung:**  
Breite vergrößern

_Keine Parameter._

**Rückgabe:** bool

---

### lengthDOWN

**Kurzbeschreibung:**  
Breite verkleinern

_Keine Parameter._

**Rückgabe:** bool

---

### getDataLength

**Kurzbeschreibung:**  
Breite

_Keine Parameter._

**Rückgabe:** bool

---

### getFieldOrder

**Kurzbeschreibung:**  
Feldreihenfolgeindex

_Keine Parameter._

**Rückgabe:** bool

---

### setFieldOrder

**Kurzbeschreibung:**  
Feldreihenfolgeindex setzen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Sortierung | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### saveFieldOrder

**Kurzbeschreibung:**  
Feldreihenfolge in der Datenbank speichern.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BedienerID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### loadFieldOrder

**Kurzbeschreibung:**  
Feldreihenfolge aus der Datenbank laden.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BedienerID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### fieldOrderToMask

**Kurzbeschreibung:**  
Feldreihenfolge vom Objekt in die Maske überführen.

_Keine Parameter._

**Rückgabe:** bool

---

### fieldOrderFromMask

**Kurzbeschreibung:**  
Feldreihenfolge von der Maske ins Objekt überführen.

_Keine Parameter._

**Rückgabe:** bool

---

### prepareFieldsforOrder

**Kurzbeschreibung:**  
Felder für das Festlegen der Feldreihenfolge vorbereiten.

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
