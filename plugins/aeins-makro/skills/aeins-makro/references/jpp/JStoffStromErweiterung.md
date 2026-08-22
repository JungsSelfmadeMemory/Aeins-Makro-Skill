# Dokumentation: JStoffStromErweiterung

**Datei:** `a1aeins/Warenpos_Stoffstrom.cpp`  
**Klasse:** `JStoffStromErweiterung`  
**Zweck:** StoffstromDaten-Helper  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

StoffstromDaten-Helper

---

## Methodenübersicht

### Init

**Kurzbeschreibung:**  
Initialisierung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CleanMem

**Kurzbeschreibung:**  
Speicher wieder freimachen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Read

**Kurzbeschreibung:**  
Lesen der Stoffstrom-Daten zur Warenbewegung, Parameter: WABEWID

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WABEWID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetDatenAnzahl

**Kurzbeschreibung:**  
Anzahl der Stoffstrom-Datensaetze

_Keine Parameter._

**Rückgabe:** long

---

### Write

**Kurzbeschreibung:**  
Speichern der Stoffstrom-Daten zur Warenbewegung, Parameter: WABEWID

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WABEWID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Delete

**Kurzbeschreibung:**  
Löschen der Stoffstrom-Daten zur Warenbewegung, Parameter: WABEWID

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WABEWID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SaveToBackup

**Kurzbeschreibung:**  
Aktuelle Daten merken

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SaveFromBackup

**Kurzbeschreibung:**  
Gemerkte bzw. ursprünglich gelesene Daten wiederherstellen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DatenStammGeaendert

**Kurzbeschreibung:**  
1: Daten nicht durch Ergänzung geändert, 0: Daten durch Ergänzung aus Artikelstamm geändert

_Keine Parameter._

**Rückgabe:** long

---

### GetValue

**Kurzbeschreibung:**  
Einen Datenwert auslesen, Parameter: ID=TOPIC, Art=Stoffstrom-Art

_Keine Parameter._

**Rückgabe:** string

---

### PutValue

**Kurzbeschreibung:**  
Einen Datenwert setzen, Parameter: ID=TOPIC, Art=Stoffstrom-Art, Wert=Inhalt

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Wert | string | ja | ` ` |

**Rückgabe:** long

---

### SetArtiStammId

**Kurzbeschreibung:**  
Setzen des Artikelstamms, Parameter: Wert=ID des Artikelstamms

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Wert | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetWaBewId

**Kurzbeschreibung:**  
Setzen der Warenbewegung, Parameter: Wert=ID der Warenbewegung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Wert | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetOriMenge

**Kurzbeschreibung:**  
Originalmenge (Teildispo!) der Position übermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Wert | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetGewicht

**Kurzbeschreibung:**  
Normgewicht der Position übermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Wert | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetMenge

**Kurzbeschreibung:**  
Positionsmenge übermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Wert | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetMENummer

**Kurzbeschreibung:**  
Positionsmengeneinheit übermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Wert | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLieferantID

**Kurzbeschreibung:**  
Setzen eines Lieferanten in Verkaufsposition per ID, Parameter: Wert=ID aus Kunden-/Lieferantenstamm

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Wert | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLieferantID

**Kurzbeschreibung:**  
Lesen der ID des Lieferanten in Verkaufsposition

_Keine Parameter._

**Rückgabe:** string

---

### GetVorgangTyp

**Kurzbeschreibung:**  
Typ des Vorgangs ermitteln

_Keine Parameter._

**Rückgabe:** string

---

### ReadStromstoffZusammensetzung

**Kurzbeschreibung:**  
Lesen der Stoffstrom-Zusammensetzungsliste zum Artikelstamm, Parameter: ARTSTID=ID des Artikelstamms

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ARTSTID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### NewWertSatz

**Kurzbeschreibung:**  
Erzeugen eines neuen Stoffstromwert-Satzes zur Stoffstromart, Parameter: Art = Stoffstromart

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### NewZusammensetzungsSatz

**Kurzbeschreibung:**  
Erzeugen eines neuen Stoffstromart-Satzes zur Stoffstromart, Parameter: Art = Stoffstromart

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddAusZusammensetzung

**Kurzbeschreibung:**  
Stoffstrom-Werte aus Artikelstamm ergänzen

_Keine Parameter._

**Rückgabe:** long

---

### Berechnen

**Kurzbeschreibung:**  
Berechnung durchführen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetInitOrChanged

**Kurzbeschreibung:**  
nur für internes Handling

_Keine Parameter._

**Rückgabe:** string

---

### SetInitOrChanged

**Kurzbeschreibung:**  
nur für internes Handling

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetNoDataLoaded

**Kurzbeschreibung:**  
nur für internes Handling

_Keine Parameter._

**Rückgabe:** string

---

### SetNoDataLoaded

**Kurzbeschreibung:**  
nur für internes Handling

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetStoffStromArt

**Kurzbeschreibung:**  
i-te Stoffstromart aus Zusammensetzung lesen, Parameter: Index = Zeilennummer

_Keine Parameter._

**Rückgabe:** long

---

### GetArtWaBewId

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |

**Rückgabe:** string

---

### SetArtWaBewId

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtAnteil

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |

**Rückgabe:** string

---

### SetArtAnteil

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtMenge

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |

**Rückgabe:** string

---

### SetArtMenge

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtMEAnteil

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |

**Rückgabe:** string

---

### SetArtMEAnteil

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |
| Wert | string | ja | ` ` |

**Rückgabe:** long

---

### GetArtMEMenge

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |

**Rückgabe:** string

---

### SetArtMEMenge

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtHerkunft

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |

**Rückgabe:** string

---

### SetArtHerkunft

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtOriMenge

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |

**Rückgabe:** string

---

### SetArtOriMenge

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtOriME

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |

**Rückgabe:** string

---

### SetArtOriME

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtMEGrundNummer

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `1` |

**Rückgabe:** string

---

### SetArtMEGrundNummer

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `1` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtMengenMEGrundNummer

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `1` |

**Rückgabe:** string

---

### SetArtMengenMEGrundNummer

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `1` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtMETextAnteil

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |

**Rückgabe:** string

---

### SetArtMETextAnteil

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `0` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtMETextMenge

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `1` |

**Rückgabe:** string

---

### SetArtMETextMenge

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `1` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtMEStoffArtText

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `1` |

**Rückgabe:** string

---

### SetArtMEStoffArtText

**Kurzbeschreibung:**  
nur für internes Handling

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GetPutTyp | long | optional | `1` |
| Wert | string | ja | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
