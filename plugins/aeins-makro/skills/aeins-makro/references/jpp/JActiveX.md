# Dokumentation: JActiveX

**Datei:** `a1aeins/ah_jactivex.cpp`  
**Klasse:** `JActiveX`  
**Zweck:** Organisierter ActiveX-Anschluss für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Organisierter ActiveX-Anschluss für JPL

---

## Methodenübersicht

### Init

**Kurzbeschreibung:**  
Anbindung ActiveX-Control

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| widget | string | ja | `—` |
| file | string | optional | `—` |
| append | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Set

**Kurzbeschreibung:**  
Property setzen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| prop | string | ja | `—` |
| value | string | optional | `—` |
| hdl | long | optional | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Get

**Kurzbeschreibung:**  
Property lesen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| prop | string | ja | `—` |
| to | string | optional | `—` |
| towner | long | optional | `-1` |
| tocc | long | optional | `1` |
| hdl | long | optional | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### OnEvent

**Kurzbeschreibung:**  
Ereignis anbinden

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| event | string | ja | `—` |
| hook | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Call

**Kurzbeschreibung:**  
Methode aufrufen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| method | string | ja | `—` |
| to | string | optional | `—` |
| towner | long | optional | `-1` |
| tocc | long | optional | `1` |
| hdl | long | optional | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CallJ

**Kurzbeschreibung:**  
Methode aufrufen, Par JVAR

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| method | string | ja | `—` |
| to | string | optional | `—` |
| towner | long | optional | `-1` |
| tocc | long | optional | `1` |
| hdl | long | optional | `-1` |
| p | string | ja | `—` |
| jOwner | long | optional | `0` |
| jName | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Transport

**Kurzbeschreibung:**  
Daten transportieren

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| method | string | ja | `—` |
| hdl | long | optional | `-1` |
| jOwner | long | optional | `0` |
| jName | string | optional | `—` |
| var | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetImages

**Kurzbeschreibung:**  
Imageslist verbinden

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| prop | string | ja | `—` |
| images | string | ja | `—` |
| activeX | string | ja | `—` |
| hdl | long | optional | `-1` |
| reporting | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Listen

**Kurzbeschreibung:**  
Liest die Parameter 'file' und 'append' und ruft m_JActiveX->SetListen(datei, append) auf, das Logdatei und Append-Modus des Listeners setzt. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| file | string | optional | `—` |
| append | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
