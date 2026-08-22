# Dokumentation: JSon

**Datei:** `a1aeins/json.cpp`  
**Klasse:** `JSon`  
**Zweck:** JPP-Wrapper um JsonMaker zum schrittweisen Aufbau eines JSON-Strings (_json) aus JVars und zum Zurueckschreiben in eine JVar. _(ergänzt)_  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Wrapper um JsonMaker zum schrittweisen Aufbau eines JSON-Strings (_json) aus JVars und zum Zurueckschreiben in eine JVar. _(ergänzt)_

---

## Methodenübersicht

### AddString

**Kurzbeschreibung:**  
Liest JPP-Param key/value, ruft JsonMaker::AddString auf: escaped Backslash/Anfuehrungszeichen und haengt "key": "value" an _json. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| key | string | ja | `—` |
| value | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Add

**Kurzbeschreibung:**  
Liest key/value, ruft JsonMaker::Add auf: haengt "key": value (ohne Escapen/Tuetteln) an _json an. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| key | string | ja | `—` |
| value | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddStringArray

**Kurzbeschreibung:**  
Liest key, name, owner; holt JVARS::GET_ARRAY(owner,name) und ruft JsonMaker::AddStringArray: haengt "key": [..] mit escapten/getuettelten Eintraegen an. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| key | string | ja | `—` |
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddArray

**Kurzbeschreibung:**  
Liest key, name, owner; holt JVARS::GET_ARRAY(owner,name) und ruft JsonMaker::AddArray: haengt "key": [..] ohne Escapen/Tuetteln an. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| key | string | ja | `—` |
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddVanilla

**Kurzbeschreibung:**  
Liest name, owner; ruft JsonMaker::AddVanilla, das den Inhalt der JVar JVARS::GET(owner,key) plain an _json anhaengt. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Indent

**Kurzbeschreibung:**  
Liest key; ruft JsonMaker::Indent, das den bisherigen _json-Inhalt als Child unter "key" : { .. } verschachtelt. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| key | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Set

**Kurzbeschreibung:**  
Liest name, owner; schreibt {_json} per JsonMaker::Set/JVARS::SET in die JVar und leert danach _json fuer Weiterarbeit. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
