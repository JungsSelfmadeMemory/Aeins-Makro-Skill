# Dokumentation: KontraktAnlage

**Datei:** `a1aeins/KontraktAnlage.cpp`  
**Klasse:** `KontraktAnlage`  
**Zweck:** Anlegen von Kontrakten  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Anlegen von Kontrakten

---

## Methodenübersicht

### Neu

**Kurzbeschreibung:**  
Initialisierung

_Keine Parameter._

**Rückgabe:** bool

---

### GetErrorCount

**Kurzbeschreibung:**  
Anzahl der Fehlertexte in der Fehlerliste ermitteln

_Keine Parameter._

**Rückgabe:** bool

---

### GetLastErrorStr

**Kurzbeschreibung:**  
Den letzten Fehlertext abrufen

_Keine Parameter._

**Rückgabe:** bool

---

### GetErrorListStr

**Kurzbeschreibung:**  
den i-ten Fehlertext der Fehlerliste abrufen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| IN_INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### AnzeigeFehler

**Kurzbeschreibung:**  
Fehlerbildschirm anzeigen

_Keine Parameter._

**Rückgabe:** bool

---

### SetKtrNummer

**Kurzbeschreibung:**  
die Kontraktnummer festlegen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| IN_WERT | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetKtrNummer

**Kurzbeschreibung:**  
die Kontraktnummer lesen

_Keine Parameter._

**Rückgabe:** bool

---

### SetKtrGruppe

**Kurzbeschreibung:**  
die Kontraktgruppe festlegen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| IN_WERT | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetKtrGruppe

**Kurzbeschreibung:**  
die Kontraktgruppe lesen

_Keine Parameter._

**Rückgabe:** bool

---

### GetKtrId

**Kurzbeschreibung:**  
die Kontrakt-Id lesen

_Keine Parameter._

**Rückgabe:** bool

---

### SetArtikelId

**Kurzbeschreibung:**  
die nächste Kontrakt-Artikel-Id festlegen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| IN_WERT | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetArtikelId

**Kurzbeschreibung:**  
die i-te Kontrakt-Artikel-Id lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| IN_INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ErzeugeKontrakt

**Kurzbeschreibung:**  
Kontrakt anlegen

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
