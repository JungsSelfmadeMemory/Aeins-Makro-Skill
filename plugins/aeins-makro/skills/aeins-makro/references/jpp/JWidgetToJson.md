# Dokumentation: JWidgetToJson

**Datei:** `a1aeins/WidgetToJson.cpp`  
**Klasse:** `JWidgetToJson`  
**Zweck:** JWidgetToJson: Maskendaten als Json-String  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JWidgetToJson: Maskendaten als Json-String

---

## Methodenübersicht

### Exec

**Kurzbeschreibung:**  
Ausfuehren

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Target | string | ja | `—` |
| Owner | long | ja | `NULL` |
| MaskenName | string | optional | `—` |
| TypPrefix | string | optional | `—` |
| AsContainer | long | optional | `0` |
| WithSdValues | long | optional | `0` |
| WithAisGroup | long | optional | `0` |
| WithScreen | long | optional | `0` |
| WithApplication | long | optional | `0` |
| WithJplInfoMaps | long | optional | `0` |
| WithJplKeys | long | optional | `0` |
| WithNumOcc | long | optional | `0` |
| WithScreenWidgets | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
