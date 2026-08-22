# Dokumentation: JFormat

**Datei:** `a1aeins/ah_jformat.cpp`  
**Klasse:** `JFormat`  
**Zweck:** j! Format-Spezialitäten  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

j! Format-Spezialitäten

---

## Methodenübersicht

### Value

**Kurzbeschreibung:**  
Ermittelt per ah::GetWertFromFormat(format,string,owner) den Wert zum Format; gibt ihn als JPP_LONG_RET zurück, true wenn Ergebnis > -1. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| format | string | ja | `—` |
| string | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** long

---

### String

**Kurzbeschreibung:**  
Holt per ah::GetBezeichnungFromFormat(format,value,owner) die Bezeichnung; bei gesetztem zielowner Ablage via JVARS::SET; liefert String, true wenn nicht leer. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| format | string | ja | `—` |
| value | long | ja | `-1` |
| owner | long | optional | `0` |
| zielowner | long | optional | `-1` |
| zielname | string | optional | `—` |

**Rückgabe:** string

---

### Bemerkung

**Kurzbeschreibung:**  
Holt per ah::GetBemerkungFromFormat(format,value,owner) die Bemerkung; bei gesetztem zielowner Ablage via JVARS::SET; liefert String, true wenn nicht leer. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| format | string | ja | `—` |
| value | long | ja | `-1` |
| owner | long | optional | `0` |
| zielowner | long | optional | `-1` |
| zielname | string | optional | `—` |

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
