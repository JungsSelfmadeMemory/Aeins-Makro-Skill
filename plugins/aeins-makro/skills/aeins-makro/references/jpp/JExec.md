# Dokumentation: JExec

**Datei:** `a1aeins/ah_jexec.cpp`  
**Klasse:** `JExec`  
**Zweck:** JPL und Makro-Routinen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPL und Makro-Routinen

---

## Methodenübersicht

### CtrlString

**Kurzbeschreibung:**  
CrlString ausführen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ctrl | string | ja | `—` |
| modal | bool | optional | `TRUE` |

**Rückgabe:** long

---

### Makro

**Kurzbeschreibung:**  
Pascal-Makro ausführen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| p1 | string | optional | `—` |
| p2 | string | optional | `—` |
| p3 | string | optional | `—` |
| p4 | string | optional | `—` |

**Rückgabe:** long

---

### MakroDebuggerConnection

**Kurzbeschreibung:**  
Pascal-Makro Debugger an/ausmachen oder testen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| command | string | ja | `—` |
| param | string | optional | `—` |

**Rückgabe:** long

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
