# Dokumentation: JGDIFiBu

**Datei:** `a1aeins/fibujpp.cpp`  
**Klasse:** `JGDIFiBu`  
**Zweck:** Methoden zum Einlesen einer Datei der GDI-Finanzbuchhaltung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Methoden zum Einlesen einer Datei der GDI-Finanzbuchhaltung

---

## Methodenübersicht

### Open

**Kurzbeschreibung:**  
Datei öffen. Parameter sind m_FielName und optional m_SatzArt.

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| m_FileName | ? | ja | `—` |
| m_SatzArt | ? | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Read

**Kurzbeschreibung:**  
Daten lesen. Keine Parameter.

_Keine Parameter._

**Rückgabe:** bool

---

### Close

**Kurzbeschreibung:**  
Datei close. Keine Parameter.

_Keine Parameter._

**Rückgabe:** bool

---

### GetData

**Kurzbeschreibung:**  
Einzelne Daten, Parameter ist m_Kennz.

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| m_Kennz | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetIndexedData

**Kurzbeschreibung:**  
Einzelne Daten, Parameter ist m_Kennz und m_index.

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| m_Kennz | ? | ja | `—` |
| m_Index | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetErrorText

**Kurzbeschreibung:**  
FehlerText wird zurückgeben

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
