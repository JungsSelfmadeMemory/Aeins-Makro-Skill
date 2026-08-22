# Dokumentation: JppPartiePositionVerfolgung

**Datei:** `a1aeins/JppPartiePositionVerfolgung.cpp`  
**Klasse:** `JppPartiePositionVerfolgung`  
**Zweck:** Partie-Positions-Verfolgung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Partie-Positions-Verfolgung

---

## Methodenübersicht

### Neu

**Kurzbeschreibung:**  
Initialisierung

_Keine Parameter._

**Rückgabe:** bool

---

### Datengenerierung

**Kurzbeschreibung:**  
Daten der Partiepositionsverfolgung zur Warenbewegung bestimmen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| WABEWID | long | ja | `—` |
| PARTIEID | long | optional | `—` |
| RICHTUNG | long | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetLoginID

**Kurzbeschreibung:**  
Die LoginId abrufen

_Keine Parameter._

**Rückgabe:** bool

---

### GetTitelStartZeile

**Kurzbeschreibung:**  
Infozeile zur Startbewegung zusammenstellen und abrufen

_Keine Parameter._

**Rückgabe:** bool

---

### GetMaxTiefe

**Kurzbeschreibung:**  
Schachtelungstiefe der Ergebnisliste abrufen

_Keine Parameter._

**Rückgabe:** bool

---

### GetMaxZeilen

**Kurzbeschreibung:**  
Anzahl der generierten Zeilen der Ergebnisliste

_Keine Parameter._

**Rückgabe:** bool

---

### GetMaxZeilenTiefe

**Kurzbeschreibung:**  
Anzahl der Stufen der aktuellen Zeile der Ergebnisliste

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstTextZeile

**Kurzbeschreibung:**  
Anzahl der Stufen der aktuellen Zeile der Ergebnisliste

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextTextZeile

**Kurzbeschreibung:**  
Anzahl der Stufen der aktuellen Zeile der Ergebnisliste

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstPosition

**Kurzbeschreibung:**  
Daten der 1. Zeile bereitstellen

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextPosition

**Kurzbeschreibung:**  
Daten der nächsten Zeile bereitstellen

_Keine Parameter._

**Rückgabe:** bool

---

### GetPositionZeile

**Kurzbeschreibung:**  
Zeilennummer der aktuellen Zeile

_Keine Parameter._

**Rückgabe:** bool

---

### GetPositionTiefe

**Kurzbeschreibung:**  
Maximale Stufe der aktuellen Zeile

_Keine Parameter._

**Rückgabe:** bool

---

### GetPositionStartSpalte

**Kurzbeschreibung:**  
Stufe des Beginns der relevanten Daten der Zeile

_Keine Parameter._

**Rückgabe:** bool

---

### GetVorgangID

**Kurzbeschreibung:**  
V_Id des Vorgangs zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetFA_Ref

**Kurzbeschreibung:**  
Archiv-Referenz des Vorgangs zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetQUFA_Ref

**Kurzbeschreibung:**  
Archiv-Referenzen der Quellvorgänge zum Vorgang zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetRWSFA_Ref

**Kurzbeschreibung:**  
Archiv-Referenz des RohwareSammeldrucks zum Vorgang zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetRWS_Nummer

**Kurzbeschreibung:**  
Nummer des RohwareSammeldrucks zum Vorgang zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetPartieNummer

**Kurzbeschreibung:**  
Partienummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetPartieNummerNach

**Kurzbeschreibung:**  
Ziel-Partienummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetArtikelNummer

**Kurzbeschreibung:**  
Artikelnummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetArtikelNummerNach

**Kurzbeschreibung:**  
Ziel-Artikelnummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetLagerNummer

**Kurzbeschreibung:**  
Lagernummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetLagerNummerNach

**Kurzbeschreibung:**  
Ziel-Lagernummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetLagerPlatzNummer

**Kurzbeschreibung:**  
Lagerplatznummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetLagerPlatzNummerNach

**Kurzbeschreibung:**  
Ziel-Lagerplatznummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetVorgangsKlasse

**Kurzbeschreibung:**  
Vorgangsklasse zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetVorgangsUnterKlasse

**Kurzbeschreibung:**  
Vorgangsunterklasse zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetVorgangsDatum

**Kurzbeschreibung:**  
Vorgangsnummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetDruckDatum

**Kurzbeschreibung:**  
Druckdatum zur Vorgangsnummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetRWSammelDruckDatum

**Kurzbeschreibung:**  
Rohware-Sammel-Druckdatum zur Vorgangsnummer zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetVorgangsNummer

**Kurzbeschreibung:**  
Vorgangsdatum zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetKundenNummer

**Kurzbeschreibung:**  
Vorgangsdatum zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetMenge

**Kurzbeschreibung:**  
Bewegungsmenge zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetME_Text

**Kurzbeschreibung:**  
Mengeneinheitskurztext der Bewegungsmenge zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetWaBewTyp

**Kurzbeschreibung:**  
Warenbewegungstyp der Bewegungsmenge zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetBewegungsDatum

**Kurzbeschreibung:**  
Warenbewegungsdatum der Bewegungsmenge zur Stufe in der aktuellen Ergebniszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetWaBewIDVon

**Kurzbeschreibung:**  
WarenbewegungsID VON

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetPartieIDVon

**Kurzbeschreibung:**  
PartieID VON

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetPartieIDNach

**Kurzbeschreibung:**  
PartieID NACH

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| STUFE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### DeleteAWL_Daten

**Kurzbeschreibung:**  
Erzeugte Daten der temporären Auswahlliste wieder entfernen

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
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### AnzeigeFehler

**Kurzbeschreibung:**  
Fehlerbildschirm anzeigen

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
