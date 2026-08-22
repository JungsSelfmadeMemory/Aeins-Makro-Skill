# Dokumentation: JModulSequencer

**Datei:** `a1aeins/JPfleger.cpp`  
**Klasse:** `JModulSequencer`  
**Zweck:** Aufruf Steuerung von Modulen in einer JPL Anwendung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Aufruf Steuerung von Modulen in einer JPL Anwendung

---

## Methodenübersicht

### Register

**Kurzbeschreibung:**  
Ein Modul samt seiner Behanlungsmethoden registieren

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Modul | string | ja | `—` |
| Proc | string | ja | `—` |
| Aktiv | long | ja | `1` |
| MengenBezug | long | ja | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Init_Neu

**Kurzbeschreibung:**  
Scharfmachen bei neuem Datensatz

_Keine Parameter._

**Rückgabe:** bool

---

### Init_Korrektur

**Kurzbeschreibung:**  
Entschärfen, da alles schon zugeordnet

_Keine Parameter._

**Rückgabe:** bool

---

### ModulScharfmachen

**Kurzbeschreibung:**  
Dies Modul wird wieder aktiviert

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Modul | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ModulErledigen

**Kurzbeschreibung:**  
Dies Modul ist zunächst erledigt

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Modul | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ModulAbwaehlen

**Kurzbeschreibung:**  
Dies Modul nicht mehr abfragen, da abgewählt

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Modul | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ModulSkippen

**Kurzbeschreibung:**  
Einmal aussetzen und dann wieder wie gehabt

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Modul | string | ja | `—` |
| Feldname | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BezugsMengeNeu

**Kurzbeschreibung:**  
Die Bezugsmenge ändert sich, alle mengenabhägingen Module rücksetzen

_Keine Parameter._

**Rückgabe:** bool

---

### FeldEntry

**Kurzbeschreibung:**  
Ein neues Feld wird betreten, Aktion der Module ausführen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FeldNummer | long | ja | `0` |
| Occ | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ArtikelAbschluss

**Kurzbeschreibung:**  
Der Artikel soll beendet werden

_Keine Parameter._

**Rückgabe:** bool

---

### GetLastZielFeld

**Kurzbeschreibung:**  
Feldnamen des letzten betretbaren Feldes vor LASTFIELD

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddZielFelder

**Kurzbeschreibung:**  
Feldnamen  durch Komma getrennt, die als Zielfelder angesprochen werden könne, falls eigened Feld protected

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ZielFelder | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GoField

**Kurzbeschreibung:**  
Ausführen eines Gofields aber ohne Test, so wie JAm es macht, aber per Event  gegen mehrfachaufruf gesichtert

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feldname | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GoToField

**Kurzbeschreibung:**  
gehe zum Feld mit Name Feldname, wenn nicht beretabr dan zum nächstenn Feld

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feldname | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GoToNextField

**Kurzbeschreibung:**  
gehe zum Feld nach dem Feld mit Namen in Feldname

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feldname | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GoToLastField

**Kurzbeschreibung:**  
gehe zum zuöletzt in FeldEntry gemerkten Feld

_Keine Parameter._

**Rückgabe:** bool

---

### GoToLastFieldNext

**Kurzbeschreibung:**  
Gehe zum nächte Feld nnach dem zuletzt betretenden Feld

_Keine Parameter._

**Rückgabe:** bool

---

### GoToLastFieldPrev

**Kurzbeschreibung:**  
Gehe zum vorherigen Feld nnach dem zuletzt betretenden Feld

_Keine Parameter._

**Rückgabe:** bool

---

### DefineFlag

**Kurzbeschreibung:**  
Definieren eines Bool Merkers, DP = Name

_Keine Parameter._

**Rückgabe:** bool

---

### SetFlag

**Kurzbeschreibung:**  
Setzen eines vordefiniertet Merkers, DP = Name

_Keine Parameter._

**Rückgabe:** bool

---

### ResetFlag

**Kurzbeschreibung:**  
Rücksetzen eines vordefinierten Merkers, DP = Name

_Keine Parameter._

**Rückgabe:** bool

---

### GetFlag

**Kurzbeschreibung:**  
Abfragen eines vordefinierten Merkers, DP = Name

_Keine Parameter._

**Rückgabe:** bool

---

### ResetAllFlags

**Kurzbeschreibung:**  
Ale Flags löschen

_Keine Parameter._

**Rückgabe:** bool

---

### Show

**Kurzbeschreibung:**  
Anzeige internen Status

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Titel | string | optional | `ModulSequencer` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
