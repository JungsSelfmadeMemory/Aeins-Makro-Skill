# Dokumentation: JFiZiBu

**Datei:** `a1aeins/fibujpp.cpp`  
**Klasse:** `JFiZiBu`  
**Zweck:** Methoden zum Buchen von Zinsabrechnungen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Methoden zum Buchen von Zinsabrechnungen

---

## Methodenübersicht

### Execute

**Kurzbeschreibung:**  
Buchen: Parameter sind m_KontoNummer, m_ZinsListNummer und m_FiBuVP_ValDatum ).

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| m_KontoNummer | ? | ja | `—` |
| m_ZinsListNummer | ? | ja | `—` |
| m_FiBuVP_ValDatum | ? | ja | `—` |
| m_NumKreisNummer | ? | ja | `—` |
| m_JahrNummer | ? | ja | `—` |
| m_PeriNummer | ? | ja | `—` |
| m_ZinsGutschrift | ? | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetError

**Kurzbeschreibung:**  
Fehler wird zurückgeben

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
