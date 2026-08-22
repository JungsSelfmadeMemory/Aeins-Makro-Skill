# Dokumentation: JAnwCond

**Datei:** `a1aeins/AnwJPP.cpp`  
**Klasse:** `JAnwCond`  
**Zweck:** Methoden zum bebuchen der Kostenstellen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Methoden zum bebuchen der Kostenstellen

---

## Methodenübersicht

### Init

**Kurzbeschreibung:**  
Einlesen der ReportInfos Profil, CondId, Besitzer

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Profil | ? | ja | `—` |
| CondId | ? | ja | `—` |
| Besitzer | ? | ja | `—` |
| WITHLASTPROF | long | optional | `—` |
| CondAktiv | long | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetVon

**Kurzbeschreibung:**  
Den Wert einer VON[] Variablen übeschreiben

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| idx | ? | ja | `—` |
| von | ? | ja | `—` |
| vorbel | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetBis

**Kurzbeschreibung:**  
Den Wert einer BIS[] Variablen übeschreiben

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| idx | ? | ja | `—` |
| bis | ? | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Finit

**Kurzbeschreibung:**  
Wegschreiben der geänbderten Werte

_Keine Parameter._

**Rückgabe:** bool

---

### Push

**Kurzbeschreibung:**  
Die Werte für KontoNummer, Artikelnummer und Lagernummer der anwendcondition zur verfügung Stellen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| KUNDNUMMER | ? | optional | `—` |
| ARTIKELNUMMER | ? | optional | `—` |
| LAGERNUMMER | ? | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Pop

**Kurzbeschreibung:**  
Die Werte für KontoNummer, Artikelnummer und Lagernummer wieder abräumen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| KUNDNUMMER | ? | optional | `—` |
| ARTIKELNUMMER | ? | optional | `—` |
| LAGERNUMMER | ? | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
