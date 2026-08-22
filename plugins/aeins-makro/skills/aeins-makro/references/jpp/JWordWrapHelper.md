# Dokumentation: JWordWrapHelper

**Datei:** `a1aeins/HELPER.CPP`  
**Klasse:** `JWordWrapHelper`  
**Zweck:** Word-Wrap Helper  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Word-Wrap Helper

---

## Methodenübersicht

### InsertLineIntoBuffer

**Kurzbeschreibung:**  
Zeile in den Buffer lesen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LINE | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ReadLineFromBuffer

**Kurzbeschreibung:**  
Zeile in der gewünschten Länge aus dem Buffer lesen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LINENO | long | optional | `0` |

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
