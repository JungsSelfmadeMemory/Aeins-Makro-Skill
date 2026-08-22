# Dokumentation: JFiZaBu

**Datei:** `a1aeins/fibujpp.cpp`  
**Klasse:** `JFiZaBu`  
**Zweck:** Methoden zum Buchen von Zinsabrechnungen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Methoden zum Buchen von Zinsabrechnungen

---

## Methodenübersicht

### Open

**Kurzbeschreibung:**  
Initialisierung des Zahlungslaufes.

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| m_FiBuV_Datum | ? | ja | `—` |
| m_FiBuVP_ValDatum | ? | ja | `—` |
| m_NumKreisNummer | ? | ja | `—` |
| m_AuchUngedruckt | ? | ja | `—` |
| m_SammelBuchung | ? | ja | `—` |
| m_ScheckNrAlsBelegNr | ? | ja | `—` |
| m_RefNrBelegung | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Execute

**Kurzbeschreibung:**  
Buchen: Parameter sind m_ZahlungId.

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| m_ZahlungId | ? | ja | `—` |
| m_KursDiff | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Close

**Kurzbeschreibung:**  
Gegebenefalls beleg noch abschliessen.

_Keine Parameter._

**Rückgabe:** bool

---

### GetError

**Kurzbeschreibung:**  
Fehler wird zurückgeben

_Keine Parameter._

**Rückgabe:** bool

---

### GetZahlungId

**Kurzbeschreibung:**  
Zu bearbeitender Zahlungsbeleg

_Keine Parameter._

**Rückgabe:** bool

---

### GetFiBuV_NumNummer

**Kurzbeschreibung:**  
Zu bearbeitender Zahlungsbeleg

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
