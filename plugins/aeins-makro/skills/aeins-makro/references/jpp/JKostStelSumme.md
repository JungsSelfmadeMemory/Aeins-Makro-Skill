# Dokumentation: JKostStelSumme

**Datei:** `a1aeins/fibujpp.cpp`  
**Klasse:** `JKostStelSumme`  
**Zweck:** Methoden zum bebuchen der Kostenstellen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Methoden zum bebuchen der Kostenstellen

---

## Methodenübersicht

### UpdKostStel

**Kurzbeschreibung:**  
Kostenstellen summen bebuchen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| m_KontoNummer | ? | ja | `—` |
| m_KostStelNummer | ? | ja | `—` |
| m_KostStelNumQuelle | ? | ja | `—` |
| m_SollHaben | ? | ja | `—` |
| m_Betrag | ? | ja | `—` |
| m_JahrNummer | ? | ja | `—` |
| m_PeriNummer | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### UpdKostenStelle

**Kurzbeschreibung:**  
Kostenstellen summen Belegorientiert bebuchen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| m_KontoNummer | ? | ja | `—` |
| m_KostStelNummer | ? | ja | `—` |
| m_KostStelVertKennz | ? | ja | `—` |
| m_SollHaben | ? | ja | `—` |
| m_Betrag | ? | ja | `—` |
| m_FiBuV_Id | ? | ja | `—` |
| m_FiBuV_PosZaehler | ? | ja | `—` |
| m_JahrNummer | ? | ja | `—` |
| m_PeriNummer | ? | ja | `—` |
| m_FiBuV_Datum | ? | ja | `—` |
| m_AusReorganisation | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Cancel

**Kurzbeschreibung:**  
Alle Daten aus dem Speicher löschen!

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
