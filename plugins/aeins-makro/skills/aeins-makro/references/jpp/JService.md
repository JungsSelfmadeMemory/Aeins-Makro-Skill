# Dokumentation: JService

**Datei:** `a1aeins/ah_jservice.cpp`  
**Klasse:** `JService`  
**Zweck:** Aeins Service-Dienste  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Aeins Service-Dienste

---

## Methodenübersicht

### Install

**Kurzbeschreibung:**  
Installiert einen Windows-Dienst via PROVIDER::SVC_Install (Name, Info, exe, param), baut Parameter aus JVar-Connect/Param-Split (mit GetDos-Auflösung) und schreibt sie in den Registry-Key Services\<name>\Parameters; ruft Log(); gibt Erfolg zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| exe | string | optional | `executable` |
| info | string | optional | `service_name` |
| jvar_connect | string | optional | `—` |
| jvar_owner | long | optional | `0` |
| param | string | optional | `—` |
| dostries | long | optional | `2` |
| servicecontrol | string | optional | `—` |
| trenner | string | ja | `|` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLog

**Kurzbeschreibung:**  
Setzt m_TxHdl auf den JPP-Parameter 'Hdl' (Ziel-Handle für Log-Ausgaben); gibt true zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Hdl | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Run

**Kurzbeschreibung:**  
Startet den Dienst per PROVIDER::SVC_Run(name), schreibt bei gesetztem 'thread' die PID via glb->fld_put; gibt zurück, ob pid != 0. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| thread | string | optional | `—` |
| occ | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Kill

**Kurzbeschreibung:**  
Kill

_Implementierung nicht gefunden — Parameter nicht ermittelbar._

---

### IsActiv

**Kurzbeschreibung:**  
Delegiert an PROVIDER::SVC_IsActiv(NULL) und gibt dessen Ergebnis zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
