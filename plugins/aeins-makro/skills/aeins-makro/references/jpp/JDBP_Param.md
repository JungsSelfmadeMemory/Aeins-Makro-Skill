# Dokumentation: JDBP_Param

**Datei:** `a1aeins/jdbf_parameter.cpp`  
**Klasse:** `JDBP_Param`  
**Zweck:** JPP-Objekt zum Aufbau eines Aufrufs privater DB-Prozeduren: legt per StartProzedurname ein DBP_Parameter mit Prozedurnamen an, setzt mit SetzeParameter Parameterwerte und erzeugt mit StartErstellung via DBP_Parameter::MakeCall() den Aufruf-String, den es in JVAR_PRIVATEDBPROZEDUR ablegt. _(ergänzt)_  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Objekt zum Aufbau eines Aufrufs privater DB-Prozeduren: legt per StartProzedurname ein DBP_Parameter mit Prozedurnamen an, setzt mit SetzeParameter Parameterwerte und erzeugt mit StartErstellung via DBP_Parameter::MakeCall() den Aufruf-String, den es in JVAR_PRIVATEDBPROZEDUR ablegt. _(ergänzt)_

---

## Methodenübersicht

### StartProzedurname

**Kurzbeschreibung:**  
Start der Starten der Prozedur Erstellungsparameter

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ProdName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetzeParameter

**Kurzbeschreibung:**  
Die zu übergebenden Parameter setzten

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ParaName | string | ja | `—` |
| ParaWert | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartErstellung

**Kurzbeschreibung:**  
Die Zusammensetzung der AufrufParameter

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
