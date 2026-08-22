# Dokumentation: JWatchDog

**Datei:** `a1aeins/ah_jwatchdog.cpp`  
**Klasse:** `JWatchDog`  
**Zweck:** Watchdog für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Watchdog für JPL

---

## Methodenübersicht

### TimeOut

**Kurzbeschreibung:**  
Startet via Prepare einen Watchdog-Thread (BeendeVorstellung), der nach 'Secs' den Prozess per TerminateProcess beendet; optionaler Stopper-Maskenfeld bricht ab. Gibt true bei erfolgreichem Thread-Start. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Secs | long | ja | `0` |
| Stopper | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Jpl

**Kurzbeschreibung:**  
Startet via Prepare einen Thread (JplCall), der nach 'Secs' die JPL-Prozedur 'Proc' per sm_jplcall aufruft. Gibt immer true zurück (Kommentar: JPL nicht reentrant). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Secs | long | ja | `0` |
| Proc | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
