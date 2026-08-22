# Dokumentation: JFiBuBuchen

**Datei:** `a1aeins/fibujpp.cpp`  
**Klasse:** `JFiBuBuchen`  
**Zweck:** Methoden zum Buchen von Zinsabrechnungen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Methoden zum Buchen von Zinsabrechnungen

---

## Methodenübersicht

### Buchen

**Kurzbeschreibung:**  
Buchen. Erwartet wird die FiBuV_Id als Parameter

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| FiBuV_Id | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Journalisieren

**Kurzbeschreibung:**  
Gebuchten Beleg in Journal eintragen(Fehlerbehebung). Erwartet wird die FiBuV_Id als Parameter

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| FiBuV_Id | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
