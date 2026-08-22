# Dokumentation: JVorgPosMarkier

**Datei:** `a1aeins/JTeilUmwandlung.cpp`  
**Klasse:** `JVorgPosMarkier`  
**Zweck:** Warenpositionszeilen und Partien markieren  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Warenpositionszeilen und Partien markieren

---

## Methodenübersicht

### MarkiereBeleg

**Kurzbeschreibung:**  
Alles in einem Beleg marieren per V_Id

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| V_Id | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MarkiereWarenPosition

**Kurzbeschreibung:**  
Eine Warenbewegung markieren per WabewId

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WaBewId | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MarkiereInSVWARE

**Kurzbeschreibung:**  
Überhalb von SVWARE markieren

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
