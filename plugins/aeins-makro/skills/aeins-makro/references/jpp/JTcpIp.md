# Dokumentation: JTcpIp

**Datei:** `a1aeins/ah_jtcpip.cpp`  
**Klasse:** `JTcpIp`  
**Zweck:** TCPIP-Clienten für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

TCPIP-Clienten für JPL

---

## Methodenübersicht

### Open

**Kurzbeschreibung:**  
Prüft Port/Host, ruft m_JTcpIp->Execute() in den Modi CLOSE, OPEN und READ; legt gelesene Daten via JVARS::SET ab; gibt Erfolg zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Port | long | optional | `0` |
| Host | string | optional | `localhost` |
| Log | string | optional | `—` |
| LogMode | long | optional | `AH::LOGMODE_OFF` |
| Read | string | optional | `—` |
| Owner | long | optional | `0` |
| UDP | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Close

**Kurzbeschreibung:**  
Setzt Fnc auf TPCIP_MODE_CLOSE und ruft m_JTcpIp->Execute(); gibt Erfolg zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Rcv

**Kurzbeschreibung:**  
Setzt READ-Modus mit Wait, ruft Execute(); löscht altes Ergebnis per JVARS::UNSET und legt Gelesenes via JVARS::SET ab; gibt Erfolg zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Read | string | optional | `—` |
| Owner | long | optional | `0` |
| Wait | long | optional | `500` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Snd

**Kurzbeschreibung:**  
Prüft SendTyp/Wait, baut Sendepuffer per GetSnd(), optional Unix-Zeilenenden, führt Execute() im SEND-Modus aus; gibt Erfolg zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Send | string | optional | `—` |
| SendTyp | long | optional | `AH::GETMODE_DIREKT` |
| unix | bool | optional | `FALSE` |
| Owner | long | optional | `0` |
| Wait | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PortPing

**Kurzbeschreibung:**  
Prüft Port/Host (kein UDP), erzeugt eigene JTcpIp_Extension-Instanz, führt Execute() im CHECK-Modus aus, löscht sie; gibt Erfolg zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Port | long | optional | `0` |
| Host | string | optional | `localhost` |
| Log | string | optional | `—` |
| LogMode | long | optional | `AH::LOGMODE_OFF` |
| UDP | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Talk

**Kurzbeschreibung:**  
Eigene JTcpIp_Extension-Instanz; optional Translate/RegExp-Ersetzung (Zeit-Platzhalter, BCC), Execute() im TALK-Modus, übermittelt Ergebnis an Maskenfeld oder JVARS; gibt Erfolg zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Port | long | optional | `0` |
| Host | string | optional | `localhost` |
| Log | string | optional | `—` |
| Send | string | optional | `—` |
| SendTyp | long | optional | `AH::GETMODE_DIREKT` |
| Wait | long | optional | `500` |
| unix | bool | optional | `FALSE` |
| LogMode | long | optional | `AH::LOGMODE_OFF` |
| Owner | long | optional | `0` |
| UDP | bool | optional | `FALSE` |
| tname | string | optional | `—` |
| towner | long | optional | `0` |
| tocc | long | optional | `1` |
| translate | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
