# Dokumentation: JHalter

**Datei:** `a1aeins/LvsHalter.cpp`  
**Klasse:** `JHalter`  
**Zweck:** JPP-Klasse zur Produktionserfassung/-korrektur: startet via SVMAIN modale Erfassungs-/Korrektur-Dialoge (ProduktionErfassungModal/ProduktionKorrekturModal) und liefert deren Ergebnisfelder (SAVED, BELEGNUMMER, KLASSE, UKLASSE, JAHRNUMMER). _(ergänzt)_  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Klasse zur Produktionserfassung/-korrektur: startet via SVMAIN modale Erfassungs-/Korrektur-Dialoge (ProduktionErfassungModal/ProduktionKorrekturModal) und liefert deren Ergebnisfelder (SAVED, BELEGNUMMER, KLASSE, UKLASSE, JAHRNUMMER). _(ergänzt)_

---

## Methodenübersicht

### StartProdErfassungModal

**Kurzbeschreibung:**  
Start der Produktion im Erfassungsmodus (MODAL)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| UKlasse | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HoleProdErfassungDaten

**Kurzbeschreibung:**  
Daten aus der letzten Produktionserfassung holen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartProdKorrekturModal

**Kurzbeschreibung:**  
Startet die Produktion im Korrekturmodus der übergebenen V_ID

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| vID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
