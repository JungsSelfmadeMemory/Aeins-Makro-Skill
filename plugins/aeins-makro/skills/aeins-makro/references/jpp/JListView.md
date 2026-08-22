# Dokumentation: JListView

**Datei:** `a1aeins/ah_listview.cpp`  
**Klasse:** `JListView`  
**Zweck:** ListView-Unterstützung für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

ListView-Unterstützung für JPL

---

## Methodenübersicht

### SetError

**Kurzbeschreibung:**  
Fehlerstatus von extern setzen

_Keine Parameter._

**Rückgabe:** bool

---

### GetLastError

**Kurzbeschreibung:**  
Fehlerstatus abfragen

_Keine Parameter._

**Rückgabe:** bool

---

### GetLastErrorStr

**Kurzbeschreibung:**  
Fehlerstatus als String abfragen

_Keine Parameter._

**Rückgabe:** bool

---

### Init

**Kurzbeschreibung:**  
Initialisierung

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Name | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Header

**Kurzbeschreibung:**  
Header anfügen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Titel | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Add

**Kurzbeschreibung:**  
Node hinzufügen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Key | string | ja | `—` |
| Text | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### AddRow

**Kurzbeschreibung:**  
Node hinzufügen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Item | string | ja | `—` |
| Text | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Event

**Kurzbeschreibung:**  
Event anbinden

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Proc | string | ja | `—` |
| Which | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Set

**Kurzbeschreibung:**  
Property setzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Item | long | ja | `—` |
| Prop | string | ja | `—` |
| Value | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Get

**Kurzbeschreibung:**  
Property auslesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Item | long | ja | `—` |
| Prop | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Clear

**Kurzbeschreibung:**  
Listeninhalt löschen

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
