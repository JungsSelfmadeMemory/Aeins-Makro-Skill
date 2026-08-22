# Dokumentation: JDBX

**Datei:** `a1aeins/ah_jdbx.cpp`  
**Klasse:** `JDBX`  
**Zweck:** DBX  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

DBX

---

## Methodenübersicht

### Exec

**Kurzbeschreibung:**  
Schliesst ggf. offenen Cursor, erhoeht CURNR, fuehrt dbx_select(SQL) aus (silent: DISPLAYERRORMESSAGE/CONTINUEONERROR via dbx_io); gibt Ergebniscode als String zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| sql | string | ja | `—` |
| silent | bool | optional | `FALSE` |

**Rückgabe:** string

---

### Get

**Kurzbeschreibung:**  
Liest Spalte (col) per dbx_get bzw. dbx_get_wrap in Maskenfeld (fld); ohne wrap glb->HoleMaskenFeld, mit wrap COM::Jam->sm_n_gwrap; gibt Feldwert zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | string | ja | `—` |
| fld | string | ja | `—` |
| wrap | bool | optional | `FALSE` |

**Rückgabe:** string

---

### Next

**Kurzbeschreibung:**  
Fuehrt dbx_fetch(NEXT) auf aktuellem Cursor (GetCurNo) aus und gibt den Ergebniscode als String zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### DBERR

**Kurzbeschreibung:**  
Holt das Maskenfeld 'DBERR' via glb->HoleMaskenFeld und gibt dessen Wert als String zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
