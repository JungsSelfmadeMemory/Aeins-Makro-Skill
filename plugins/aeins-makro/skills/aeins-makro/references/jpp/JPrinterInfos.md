# Dokumentation: JPrinterInfos

**Datei:** `a1aeins/JPrinterInfos.cpp`  
**Klasse:** `JPrinterInfos`  
**Zweck:** Drucker Schnittstellen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Drucker Schnittstellen

---

## Methodenübersicht

### SetDruckerNummer

**Kurzbeschreibung:**  
Setzen der Druckernummer

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DruckerNummer | long | ja | `0` |
| MitMeldung | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EffektiverAusgabeKanal

**Kurzbeschreibung:**  
Rückgabe Ausgabekanal als String

_Keine Parameter._

**Rückgabe:** bool

---

### EffektiveDruckerNummer

**Kurzbeschreibung:**  
Rückgabe der effektiven DruckerNummer

_Keine Parameter._

**Rückgabe:** bool

---

### EffektiveDruckerWinDr

**Kurzbeschreibung:**  
Handelt es sich Ausgabe auf Windowsdrucker?

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
