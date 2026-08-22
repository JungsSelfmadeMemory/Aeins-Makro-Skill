# Dokumentation: JFA_View

**Datei:** `a1aeins/JFA_View.cpp`  
**Klasse:** `JFA_View`  
**Zweck:** FA Viewer  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

FA Viewer

---

## Methodenübersicht

### View

**Kurzbeschreibung:**  
FA Viewer Parameter: Sql, Sql2

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Sql | string | optional | `—` |
| Sql2 | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Anzeige

**Kurzbeschreibung:**  
FA Anzeige

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fa_id | long | optional | `0` |
| fa_mandant | string | optional | `—` |
| fa_mndnr | long | optional | `0` |
| modus | long | optional | `SW_NORMAL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Print

**Kurzbeschreibung:**  
FA Print

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fa_id | long | optional | `0` |
| fa_mandant | string | optional | `—` |
| fa_mndnr | long | optional | `0` |
| asciiprinter | string | optional | `—` |
| jvars | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PrintPdf

**Kurzbeschreibung:**  
FA PrintPdf

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fa_id | long | optional | `0` |
| fa_mndnr | long | optional | `-1` |
| printer | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SaveToDisk

**Kurzbeschreibung:**  
FA SaveToDisk

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fa_id | long | optional | `0` |
| fa_mndnr | long | optional | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
