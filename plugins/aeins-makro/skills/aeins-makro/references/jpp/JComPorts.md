# Dokumentation: JComPorts

**Datei:** `a1aeins/ah_jcomports.cpp`  
**Klasse:** `JComPorts`  
**Zweck:** Ports für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Ports für JPL

---

## Methodenübersicht

### Open

**Kurzbeschreibung:**  
Schliesst ggf. offenen Port, legt m_ComPort an und ruft m_ComPort->Open(port, parameter, escape, erg); gibt Fehlertext als JPP-String zurueck, liefert IsOpen(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| port | string | ja | `—` |
| parameter | string | ja | `—` |
| escape | bool | optional | `FALSE` |
| protokoll | bool | optional | `FALSE` |

**Rückgabe:** string

---

### Close

**Kurzbeschreibung:**  
Schliesst bei offenem Port via m_ComPort->Close(escape) und gibt m_ComPort frei (DeleteO); liefert true wenn nicht offen oder erfolgreich geschlossen. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| escape | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Write

**Kurzbeschreibung:**  
Sendet daten ueber m_ComPort->Write(); wendet ah::Translate sowie <>-Platzhalter (Zeit hh/mi/dd/mo/y/wait) und ()-BCC-Pruefsumme via RegExp an, optional Sleep nach Senden. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| daten | string | ja | `—` |
| mode | long | optional | `Overlapped::E_VERBATIM_COPY` |
| wait | long | optional | `0` |
| translate | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Read

**Kurzbeschreibung:**  
Liest bis 255 Byte via m_ComPort->Read(wait); optional ah::Translate, schreibt Ergebnis per JVARS::SET(owner,result); gibt Fehlertext als JPP-String zurueck, liefert read>0. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| wait | long | optional | `0` |
| translate | string | optional | `—` |
| result | string | optional | `—` |
| owner | long | optional | `0` |

**Rückgabe:** string

---

### Flush

**Kurzbeschreibung:**  
Gibt false zurueck wenn Port nicht offen, sonst ruft m_ComPort->Flush() und liefert true. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool

---

### Read2

**Kurzbeschreibung:**  
Schliesst offenen Port, parst port/parameter (Baud,Paritaet,Data,Stopbits) und liest via COM::System->Comport_Read(); optional Translate und JVARS::SET, liefert read>0. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| wait | long | optional | `0` |
| translate | string | optional | `—` |
| result | string | optional | `—` |
| owner | long | optional | `0` |
| port | string | ja | `—` |
| parameter | string | ja | `—` |
| max | long | optional | `128` |

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
