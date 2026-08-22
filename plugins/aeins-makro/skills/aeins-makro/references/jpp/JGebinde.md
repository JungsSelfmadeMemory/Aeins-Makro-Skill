# Dokumentation: JGebinde

**Datei:** `a1aeins/DHGEBI.CPP`  
**Klasse:** `JGebinde`  
**Zweck:** Gebinde-Unterstützung für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Gebinde-Unterstützung für JPL

---

## Methodenübersicht

### SetMaskField

**Kurzbeschreibung:**  
Gebindespezifische Maskenfeldnamen übergeben IN = FldId, FldName

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValue

**Kurzbeschreibung:**  
Schreibe daten in Gebindekontext (TOPIC, Wert)

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| TOPIC | long | ja | `—` |
| VALUE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetValue

**Kurzbeschreibung:**  
Lese daten aus Gebindekontext (IN TOPIC, PARAM, WOHIN) IN Topic, Param OUT Value

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| TOPIC | long | ja | `—` |
| PARAM | long | ja | `—` |
| WOHIN | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Neu

**Kurzbeschreibung:**  
Neu-Initialisierung

_Keine Parameter._

**Rückgabe:** bool

---

### Vorbelegung

**Kurzbeschreibung:**  
Daten vorbelegen

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
