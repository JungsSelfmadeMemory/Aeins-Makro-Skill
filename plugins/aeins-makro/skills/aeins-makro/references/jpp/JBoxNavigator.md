# Dokumentation: JBoxNavigator

**Datei:** `a1aeins/boxnavigator.cpp`  
**Klasse:** `JBoxNavigator`  
**Zweck:** Box-Navigator  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Box-Navigator

---

## Methodenübersicht

### MoveTo

**Kurzbeschreibung:**  
Moves Box To (Tab, x, y)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Box | string | optional | `—` |
| TabCard | string | optional | `—` |
| NewX | real | optional | `0.0` |
| NewY | real | optional | `0.0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Hide

**Kurzbeschreibung:**  
Hides Box

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Box | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Show

**Kurzbeschreibung:**  
Shows hidden Boxes again

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Box | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Restore

**Kurzbeschreibung:**  
Moves Box to original Coordinates

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Box | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
