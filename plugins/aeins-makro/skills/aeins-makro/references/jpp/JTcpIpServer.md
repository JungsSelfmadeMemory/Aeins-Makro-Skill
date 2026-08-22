# Dokumentation: JTcpIpServer

**Datei:** `a1aeins/ah_jtcpip.cpp`  
**Klasse:** `JTcpIpServer`  
**Zweck:** TCPIP-Server für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

TCPIP-Server für JPL

---

## Methodenübersicht

### Open

**Kurzbeschreibung:**  
Liest Port/Log/WaitAccept/LogMode/UDP/Provider; prueft per JTcpIp.PortPing ob Port belegt, setzt Server-Felder und ruft m_JTcpIpServer->Execute() im SERVER_OPEN-Modus. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Port | long | optional | `0` |
| Log | string | optional | `—` |
| WaitAccept | long | optional | `500` |
| LogMode | long | optional | `AH::LOGMODE_OFF` |
| LogPing | bool | optional | `FALSE` |
| UDP | bool | optional | `FALSE` |
| PROVIDER | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Close

**Kurzbeschreibung:**  
Setzt m_Fnc auf TCPIP_MODE_SERVER_CLOSE und ruft m_JTcpIpServer->Execute(); gibt dessen Ergebnis zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Rcv

**Kurzbeschreibung:**  
Empfaengt im SERVER_READ-Modus per Execute(); loescht alte JVar und schreibt bei Erfolg m_Read via JVARS::SET in die Read-Variable des Owners. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Read | string | optional | `—` |
| Owner | long | optional | `0` |
| Wait | long | optional | `500` |
| ClientIP | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Snd

**Kurzbeschreibung:**  
Baut Sendepuffer per GetSnd (Send/SendTyp/Owner), optional CR-Anhang und Unix-Trenner, setzt ClientIP/Wait, fuehrt Execute() im SERVER_SEND-Modus aus. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Send | string | optional | `—` |
| SendTyp | long | optional | `AH::GETMODE_DIREKT` |
| unix | bool | optional | `FALSE` |
| Owner | long | optional | `0` |
| ClientIP | string | optional | `—` |
| Wait | long | optional | `0` |
| Append | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CloseClient

**Kurzbeschreibung:**  
Setzt ClientIP und ruft m_JTcpIpServer->ClientClose() zum Trennen des angegebenen Clients; gibt dessen Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ClientIP | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
