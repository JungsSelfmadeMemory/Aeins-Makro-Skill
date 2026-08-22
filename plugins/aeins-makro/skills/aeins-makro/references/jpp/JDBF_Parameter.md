# Dokumentation: JDBF_Parameter

**Datei:** `a1aeins/jdbf_parameter.cpp`  
**Klasse:** `JDBF_Parameter`  
**Zweck:** Pfleger für Parameterübergaben an Datenbankfunkionen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Pfleger für Parameterübergaben an Datenbankfunkionen

---

## Methodenübersicht

### Abfragen

**Kurzbeschreibung:**  
Parameter Verteilung abfragen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DBF_NAME | string | ja | `—` |
| Format | string | ja | `—` |
| ParamBits | long | ja | `0` |
| PruefMethode | string | optional | `—` |
| PruefParams | string | optional | `—` |
| FunktionsTyp | string | optional | `—` |
| FunktionsReturn | string | optional | `—` |

**Rückgabe:** long

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
