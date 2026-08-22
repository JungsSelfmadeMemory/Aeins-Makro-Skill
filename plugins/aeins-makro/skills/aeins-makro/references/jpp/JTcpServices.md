# Dokumentation: JTcpServices

**Datei:** `a1aeins/ah_jtcpip.cpp`  
**Klasse:** `JTcpServices`  
**Zweck:** TCPIP-Services für A.eins  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

TCPIP-Services für A.eins

---

## Methodenübersicht

### Start

**Kurzbeschreibung:**  
Liest Parameter port, loops, WaitAccept, owner und ruft TCP_SERVICE.Start(...) auf; gibt dessen bool-Ergebnis zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| port | long | optional | `0` |
| loops | long | optional | `0` |
| WaitAccept | long | optional | `50` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Stop

**Kurzbeschreibung:**  
Setzt JVARS_TCPIP_SERVER/DISCO via JVARS::SET auf TRUE (Stopp-Signal); gibt true zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Pause

**Kurzbeschreibung:**  
Ohne Implementierung; gibt nur true zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Resume

**Kurzbeschreibung:**  
Ohne Implementierung; gibt nur true zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
