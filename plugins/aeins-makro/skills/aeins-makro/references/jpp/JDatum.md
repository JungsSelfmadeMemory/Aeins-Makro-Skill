# Dokumentation: JDatum

**Datei:** `a1aeins/ah_jdatum.cpp`  
**Klasse:** `JDatum`  
**Zweck:** Geordnete Datumtrivialitäten  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Geordnete Datumtrivialitäten

---

## Methodenübersicht

### AnzahlTage

**Kurzbeschreibung:**  
Liest Parameter von/bis (Default heutiges Datum via COM::Tools->GetDate), parst beide per F_DATUM.from_string, bildet Differenz fd_bis-fd_von; bei abs=TRUE Betrag; gibt Tageszahl als LONG zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| von | string | optional | `.` |
| bis | string | optional | `.` |
| abs | bool | optional | `TRUE` |

**Rückgabe:** long

---

### String2Date

**Kurzbeschreibung:**  
Liest Parameter expression (Default TODAY), wertet ihn per F_DATUM.DTFormat aus; bei Erfolg formatiertes Datum, sonst SetConditionValue; gibt String zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| expression | string | optional | `TODAY` |

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
