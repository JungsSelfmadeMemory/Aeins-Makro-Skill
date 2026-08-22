# Dokumentation: JFA_Import

**Datei:** `a1aeins/JFA_Import.cpp`  
**Klasse:** `JFA_Import`  
**Zweck:** FA externe Datei importieren  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

FA externe Datei importieren

---

## Methodenübersicht

### SetCol

**Kurzbeschreibung:**  
FA Spaltenwert versorgen Parameter Col, Val

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Col | string | ja | `—` |
| Val | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetFile

**Kurzbeschreibung:**  
FA Datei angeben         Parameter File

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| File | string | ja | `—` |
| dir | string | optional | `workdir` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Import

**Kurzbeschreibung:**  
FA Import durchführen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| del | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Update

**Kurzbeschreibung:**  
FA Update durchführen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fa_id | long | optional | `0` |
| fa_mandant | string | optional | `—` |
| fa_mndnr | long | optional | `-1` |
| del | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Free_Import

**Kurzbeschreibung:**  
FA Dokumenten-Import durchführen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fai_id | long | ja | `0` |
| fai_pfad | string | optional | `...` |
| receiver | string | optional | `...` |
| mandser | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Auto_Import

**Kurzbeschreibung:**  
FA Automatik -Import durchführen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| mandser | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### JVAR_IMPORT

**Kurzbeschreibung:**  
FA Daten kommen aus JVAR_IMPORT

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Zugabe

**Kurzbeschreibung:**  
FA Zugabe -Import durchführen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| belegklasse | long | optional | `8003` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPath

**Kurzbeschreibung:**  
FA Pfad

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fai_id | long | ja | `0` |

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
