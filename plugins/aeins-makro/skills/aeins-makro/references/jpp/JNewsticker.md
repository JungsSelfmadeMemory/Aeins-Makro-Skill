# Dokumentation: JNewsticker

**Datei:** `a1aeins/ah_jnewsticker.cpp`  
**Klasse:** `JNewsticker`  
**Zweck:** Newsticker  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Newsticker

---

## Methodenübersicht

### Check

**Kurzbeschreibung:**  
Verwaltung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| action | long | ja | `0` |
| bediener | long | optional | `0` |
| bmp | string | optional | `newsticker.bmp` |
| news | string | optional | `news_default` |
| widget | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
