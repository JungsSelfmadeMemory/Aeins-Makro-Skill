# Dokumentation: JRegistry

**Datei:** `a1aeins/ah_jregistry.cpp`  
**Klasse:** `JRegistry`  
**Zweck:** Server-Registry-Unterstützung für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Server-Registry-Unterstützung für JPL

---

## Methodenübersicht

### AeinsRegWrite

**Kurzbeschreibung:**  
Schreibe Key mit Value in die Aeins-Registry

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| USER | bool | optional | `TRUE` |
| SECTION | string | ja | `—` |
| KEY | string | ja | `—` |
| VALUE | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AeinsRegDel

**Kurzbeschreibung:**  
Lösche Key aus Aeins-Registry

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| USER | bool | optional | `TRUE` |
| SECTION | string | ja | `—` |
| KEY | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Exists

**Kurzbeschreibung:**  
Prüfe Existenz eines Keys

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| user | bool | optional | `TRUE` |
| KEY | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Create

**Kurzbeschreibung:**  
Anlegen eines Keys mit Value

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| USER | bool | optional | `TRUE` |
| CREATE | bool | optional | `TRUE` |
| KEY | string | ja | `—` |
| STRING | string | optional | `—` |
| VALUE | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ReadString

**Kurzbeschreibung:**  
Lesen des Values eines Keys

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| keyhdl | long | optional | `1` |
| KEY | string | ja | `—` |
| STRING | string | optional | `—` |
| tname | string | optional | `—` |
| towner | long | optional | `0` |
| tocc | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteKey

**Kurzbeschreibung:**  
Löschen eines Keys

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KEY | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### KeyNames

**Kurzbeschreibung:**  
Keynamen iterieren

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| keyhdl | long | optional | `1` |
| KEY | string | ja | `—` |
| TNAME | string | ja | `—` |
| TOWNER | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ValueNames

**Kurzbeschreibung:**  
Valuenamen iterieren

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| keyhdl | long | optional | `1` |
| KEY | string | ja | `—` |
| TNAME | string | ja | `—` |
| TOWNER | long | optional | `0` |
| VALUE | string | optional | `—` |
| TKEYFIELD | string | optional | `—` |
| TKEYOCC | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Srv_ReadString

**Kurzbeschreibung:**  
Lesen des Values eines Keys

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ROOT | string | ja | `—` |
| KEY | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Srv_Exists

**Kurzbeschreibung:**  
Prüfe Existenz eines Keys

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KEY | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Srv_Create

**Kurzbeschreibung:**  
Anlegen eines Keys mit Value

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ROOT | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Srv_WriteString

**Kurzbeschreibung:**  
Schreiben des Values eines Keys

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KEY | string | ja | `—` |
| VALUE | string | optional | `—` |
| ROOT | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
