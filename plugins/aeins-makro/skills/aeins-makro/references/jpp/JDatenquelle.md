# Dokumentation: JDatenquelle

**Datei:** `a1aeins/ah_jdatenquelle.cpp`  
**Klasse:** `JDatenquelle`  
**Zweck:** Datenquelle  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Datenquelle

---

## Methodenübersicht

### Bind

**Kurzbeschreibung:**  
Setzt aus JPP-Parametern Beleg-Quelle/Kunden-/Belegnummer/Referenz/Id, merkt sich GetFixValue-Proc und Owner und ruft Druck() mit CFormularDruckParam (Formular, Drucker); gibt true zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetFixValue | string | ja | `—` |
| owner | long | optional | `0` |
| formular | long | ja | `0` |
| drucker | long | ja | `0` |
| BelegQuelle | long | optional | `-1` |
| KundenNummer | string | optional | `—` |
| BelegNummer | string | optional | `—` |
| FA_BelegReferenz | string | optional | `—` |
| BelegId | long | optional | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
