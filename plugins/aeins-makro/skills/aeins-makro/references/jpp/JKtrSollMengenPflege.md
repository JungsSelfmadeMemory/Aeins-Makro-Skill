# Dokumentation: JKtrSollMengenPflege

**Datei:** `a1aeins/JKtrSollMengenPflege.cpp`  
**Klasse:** `JKtrSollMengenPflege`  
**Zweck:** Stellt Methoden zur Pflege von Kontraktsollmengen im Kontraktpflegemodul bereit  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Stellt Methoden zur Pflege von Kontraktsollmengen im Kontraktpflegemodul bereit

---

## Methodenübersicht

### SetGlobals

**Kurzbeschreibung:**  
Initialisierung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_KTRID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetErrorCount

**Kurzbeschreibung:**  
Anzahl der Fehlertexte in der Fehlerliste ermitteln

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLastErrorStr

**Kurzbeschreibung:**  
Den letzten Fehlertext abrufen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetErrorListStr

**Kurzbeschreibung:**  
den i-ten Fehlertext der Fehlerliste abrufen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AnzeigeFehler

**Kurzbeschreibung:**  
Fehlerbildschirm anzeigen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PARAM | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DatenLesen

**Kurzbeschreibung:**  
Einlesen der Sollmengendaten zum Kontrakt

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_SICHERN | bool | optional | `FALSE` |
| PAR_ERSTMALIG | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Clear

**Kurzbeschreibung:**  
JPP-Modul-DAten löschen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFirstZR_SollMenge

**Kurzbeschreibung:**  
Ersten SollMengenZeitraumsatz suchen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetNextZR_SollMenge

**Kurzbeschreibung:**  
Den nächsten SollMengenZeitraumsatz suchen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DatenSpeichern

**Kurzbeschreibung:**  
Speichern der Daten in der Datenbank

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AenderungsProtokoll

**Kurzbeschreibung:**  
Mengen-Änderungen protokollieren

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ZeitraumLoeschen

**Kurzbeschreibung:**  
Einen Zeitraum aus dem Kontrakt löschen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtikelAnzahl

**Kurzbeschreibung:**  
Anzahl der Kontraktartikel ermitteln

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetZeitraumAnzahl

**Kurzbeschreibung:**  
Anzahl der Kontraktzeiträume ermitteln

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetSpeicherFlag

**Kurzbeschreibung:**  
Kennzeichen, ob sich seit dem Einlesen oder Speichern etwas geändert wurde.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValue

**Kurzbeschreibung:**  
Einen Gesamt-Wert zum aktuellen Zeitraum abrufen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_ART | string | optional | `ZRSOLL` |
| PAR_FELD | string | ja | `—` |
| PAR_ARTIPOSIT | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AktivZrAbDatum

**Kurzbeschreibung:**  
Aktiviern eines Zeitraums per Ab-Datum

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFirstArInfo

**Kurzbeschreibung:**  
Den ersten Artikelinfosatz zum aktuellen Zeitraum bereitstellen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetNextArInfo

**Kurzbeschreibung:**  
Den nächsten Artikelinfosatz zum aktuellen Zeitraum bereitstellen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFirstArMengenSatz

**Kurzbeschreibung:**  
Den ersten Artikelmengensatz zum aktuellen Artikel bereitstellen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_ARTIPOSIT | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetNextArMengenSatz

**Kurzbeschreibung:**  
Den nächsten Artikelmengensatz zum aktuellen Artikel bereitstellen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AktivArMeZeile

**Kurzbeschreibung:**  
Aktivieren einer Artikelmengenzeile per Zeitraum-Abdatum

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AktivArZeile

**Kurzbeschreibung:**  
Aktivieren einer Artikelmengenzeile per Zeilennummer

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_ARZEILE | long | ja | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetZeitraumValue

**Kurzbeschreibung:**  
Einen Wert an die Gesamt-Zeitraum-Zeile übermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_FELD | string | ja | `MENGE` |
| PAR_WERT | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetArValue

**Kurzbeschreibung:**  
Einen Wert an die aktive Artikelzeile übermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_ARTIPOSIT | long | ja | `0` |
| PAR_FELD | string | ja | `MENGE` |
| PAR_WERT | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetErledigungsStatus

**Kurzbeschreibung:**  
Erledigungdstatus des Kontrakts bezüglich der Restmengenbehandlung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKontraktId

**Kurzbeschreibung:**  
Die Id des Kontrakts abfragen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetEinzelTyp

**Kurzbeschreibung:**  
Frei-,Gesamt-, Einzel-,Gesamt-Mengen/Wert-Kontrakt abfragen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetZeitraumTyp

**Kurzbeschreibung:**  
Zeitraumtyp des Kontrakt abfragen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetNachkommastellen

**Kurzbeschreibung:**  
Anzahl der eingestellten Nachkommastellen abfragen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKtrBisDatum

**Kurzbeschreibung:**  
Enddatum des Kontrakts

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKtrAbDatum

**Kurzbeschreibung:**  
Anfangsdatum des Kontrakts

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKtrBisDatumFix

**Kurzbeschreibung:**  
Enddatum der maximalen Laufzeit des Kontrakts

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetMengeWertTyp

**Kurzbeschreibung:**  
Mengen/Wert-Typ des Kontrakt abfragen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetNeuZRAbDatum

**Kurzbeschreibung:**  
Abdatum für neuen Zeitraum generieren

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ZeitraumExists

**Kurzbeschreibung:**  
Test der Existenz eines Zeitraums mit gegebenem Abdatum

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### InsertZeitraum

**Kurzbeschreibung:**  
Einen neuen Kontraktmengenzeitraum einfügen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_SOLLMENGE | real | optional | `RC_0` |
| PAR_SOLLWERT | real | optional | `RC_0` |
| PAR_MARKIERIDENT | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### TestZR_Bebucht

**Kurzbeschreibung:**  
Test, ob ein Zeitraum bebucht ist.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FindBestBisDatum

**Kurzbeschreibung:**  
Passendes BisDatum zum (neuen) AbDatum eines neuen Zeitraum bestimmen.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
