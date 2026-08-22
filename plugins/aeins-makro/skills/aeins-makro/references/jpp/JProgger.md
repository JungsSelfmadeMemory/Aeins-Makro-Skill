# Dokumentation: JProgger

**Datei:** `a1aeins/JJam.cpp`  
**Klasse:** `JProgger`  
**Zweck:** Jam Progger Funktionen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Jam Progger Funktionen

---

## Methodenübersicht

### Add

**Kurzbeschreibung:**  
Liest JPP-String 'Watchers', zerlegt ihn per COM::Tools->Split an |;, und haengt jeden Eintrag an m_Widgets an; gibt true zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Watchers | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Watch

**Kurzbeschreibung:**  
Liest JPP-Strings 'Target' und 'Proc' und speichert sie in m_Watch bzw. m_Proc; gibt true zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Target | string | ja | `—` |
| Proc | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetOhneMaskenKontrolle

**Kurzbeschreibung:**  
Setzt m_MaskenBeschraenkt auf false (Ueberwachung ohne Maskenbindung); gibt true zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetMitMaskenKontrolle

**Kurzbeschreibung:**  
Setzt m_MaskenBeschraenkt auf true (Ueberwachung an aktuelle Maske gebunden); gibt true zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
