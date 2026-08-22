# Dokumentation: JSockets

**Datei:** `a1aeins/ah_jsockets.cpp`  
**Klasse:** `JSockets`  
**Zweck:** Sockets für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Sockets für JPL

---

## Methodenübersicht

### Talk

**Kurzbeschreibung:**  
Schleift den UDP-Aufruf über JTcpIp ein (JPP_NEW/IN/EX 'Talk'), liest das Ergebnis aus der JVar, optional Translate, setzt es ins result-JVar; True bei nicht-leerem Ergebnis. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| translate | string | optional | `—` |
| result | string | optional | `—` |
| owner | long | optional | `0` |
| connection | string | ja | `—` |
| wait | long | optional | `1000` |
| send | string | ja | `—` |

**Rückgabe:** string

---

### Connect

**Kurzbeschreibung:**  
Delegiert an COM::System->Sockets_UDP_Check(host, port, &error) zum UDP-Verbindungsaufbau; gibt dessen Erfolg (bool) zurück und liefert error zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| connection | string | ja | `—` |

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
