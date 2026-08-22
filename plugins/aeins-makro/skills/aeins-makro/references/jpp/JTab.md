# Dokumentation: JTab

**Datei:** `a1aeins/ah_jtab.cpp`  
**Klasse:** `JTab`  
**Zweck:** Tabcontrol  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Tabcontrol

---

## Methodenübersicht

### Set

**Kurzbeschreibung:**  
Setzt für alle Widgets in m_Widgets per sm_prop_set_str die PR_NEXT_TAB_STOP/PR_PREV_TAB_STOP-Verzeigerung (vor/rückwärts), bestimmt das aktive Feld; gibt true zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| active | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Add

**Kurzbeschreibung:**  
Splittet den Parameter 'Widgets' via Tools->Split an |;, und hängt die Teile an m_Widgets an; gibt true zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Widgets | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
