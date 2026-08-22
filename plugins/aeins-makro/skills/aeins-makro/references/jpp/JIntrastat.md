# Dokumentation: JIntrastat

**Datei:** `a1aeins/Intrastat.cpp`  
**Klasse:** `JIntrastat`  
**Zweck:** Intrastat  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Intrastat

---

## Methodenübersicht

### IstAktiv

**Kurzbeschreibung:**  
Liest force-Param, ruft Intrastat::IstAktiv(); cached per Scalar-Query auf amic_intrastatstamm (intrastat_warenbewegung==1) und liefert bool, ob Intrastat aktiv ist. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| force | bool | optional | `FALSE` |

**Rückgabe:** bool

---

### TouchAktiv

**Kurzbeschreibung:**  
Setzt den statischen Cache INTRASTAT_ISTAKTIV auf -1 zurück, sodass IstAktiv beim nächsten Aufruf neu aus der DB liest; gibt true zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
