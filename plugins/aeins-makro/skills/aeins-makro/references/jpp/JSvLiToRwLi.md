# Dokumentation: JSvLiToRwLi

**Datei:** `a1aeins/DHJSvLiToRwLi.cpp`  
**Klasse:** `JSvLiToRwLi`  
**Zweck:** JPL-Unterstützung zum Wandeln von StandardVorgangs-Lieferungen in Rohware-Lieferungen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPL-Unterstützung zum Wandeln von StandardVorgangs-Lieferungen in Rohware-Lieferungen

---

## Methodenübersicht

### SetValue

**Kurzbeschreibung:**  
Schreibe daten in JPP-Onjekt (TOPIC, PARAM, Wert)

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| TOPIC | long | ja | `—` |
| VALUE | string | ja | `—` |
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetValue

**Kurzbeschreibung:**  
Lese daten aus JPP-Objekt (IN TOPIC, PARAM, WOHIN) IN Topic, Param OUT Value

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

### RW_Aktion

**Kurzbeschreibung:**  
SV-Lieferschein in Rohwarelieferung wandeln

_Keine Parameter._

**Rückgabe:** bool

---

### AnzeigeFehler

**Kurzbeschreibung:**  
Fehlerbildschirm anzeigen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
