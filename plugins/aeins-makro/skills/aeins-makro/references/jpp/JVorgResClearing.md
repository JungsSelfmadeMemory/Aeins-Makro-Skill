# Dokumentation: JVorgResClearing

**Datei:** `a1aeins/DHJVorgResClearing.cpp`  
**Klasse:** `JVorgResClearing`  
**Zweck:** JPL-Unterstützung, Vorgangsnummern zu abgebrochenen Vorgängen in die Reserveliste zu übernehmen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPL-Unterstützung, Vorgangsnummern zu abgebrochenen Vorgängen in die Reserveliste zu übernehmen

---

## Methodenübersicht

### SetValue

**Kurzbeschreibung:**  
Schreibe Daten in den Kontext (TOPIC, Wert, PARAM)

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValue

**Kurzbeschreibung:**  
Lese Daten aus dem Kontext (IN TOPIC, PARAM, WOHIN) IN Topic, Param OUT Value

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Neu

**Kurzbeschreibung:**  
Neu-Initialisierung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DoIt

**Kurzbeschreibung:**  
Behandlung der Nummern abgebrochener Vorgänge des aktuellen Users

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
