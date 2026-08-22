# Dokumentation: JComportCommunication

**Datei:** `a1aeins/ComportCommunication.cpp`  
**Klasse:** `JComportCommunication`  
**Zweck:** JPP-Klasse zur COM-Port-Kommunikation, die Befehle (Set/Open/Close/Write/Read) über einen owner-JVars-Kontext sammelt und per NET::CS("Communication", owner) an den CS-Teil delegiert. _(ergänzt)_  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Klasse zur COM-Port-Kommunikation, die Befehle (Set/Open/Close/Write/Read) über einen owner-JVars-Kontext sammelt und per NET::CS("Communication", owner) an den CS-Teil delegiert. _(ergänzt)_

---

## Methodenübersicht

### Init

**Kurzbeschreibung:**  
Setzt owner per JVARS::IDENT(), löscht ihn via JVARS::ERASE; gibt bei nicht leerem Return den owner als Long zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### Set

**Kurzbeschreibung:**  
Liest JPP-Strings key/value, schreibt sie via JVARS::SET in owner und ruft Communication("Set"); meldet sonst fehlendes Init. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| key | string | ja | `—` |
| value | string | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Open

**Kurzbeschreibung:**  
Ruft bei gesetztem owner Communication("Open") auf; meldet sonst fehlendes Init via MeldeKeinInit. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Close

**Kurzbeschreibung:**  
Ruft bei gesetztem owner Communication("Close") auf; meldet sonst fehlendes Init via MeldeKeinInit. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Write

**Kurzbeschreibung:**  
Liest JPP-String daten, schreibt ihn via JVARS::SET in owner und ruft Communication("Write"); meldet sonst fehlendes Init. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| daten | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Read

**Kurzbeschreibung:**  
Liest JPP-Longs wait_for_first_read_ms/tries_after_first_read/wait_between_tries, setzt sie via JVARS::SET und ruft Communication("Read"); sonst Init-Meldung. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| wait_for_first_read_ms | long | optional | `0` |
| tries_after_first_read | long | optional | `0` |
| wait_between_tries | long | optional | `500` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
