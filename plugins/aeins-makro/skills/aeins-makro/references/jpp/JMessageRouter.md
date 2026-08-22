# Dokumentation: JMessageRouter

**Datei:** `a1aeins/JMessageRouter.cpp`  
**Klasse:** `JMessageRouter`  
**Zweck:** Jam Message Routing  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Jam Message Routing

---

## Methodenübersicht

### SetTimerProc

**Kurzbeschreibung:**  
Holt M_INFO via JAM::ms().GetMinfo(); ruft bei vorhandenem m_info SetTimerJplProc(proc, interval, name) auf und gibt true zurueck, sonst false. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| JPL | string | ja | `—` |
| Interval | long | optional | `10` |
| Name | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
