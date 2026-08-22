# Dokumentation: CRwVorgHelper

**Datei:** `a1aeins/RwVorgHelper.cpp`  
**Klasse:** `CRwVorgHelper`  
**Zweck:** Rohware-Vorgangs Unterstützung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Rohware-Vorgangs Unterstützung

---

## Methodenübersicht

### DatenSafeErzeugen

**Kurzbeschreibung:**  
Eine Datensafe-Liste erzeugen

_Keine Parameter._

**Rückgabe:** long

---

### DatenSafeDeleteAll

**Kurzbeschreibung:**  
Alle Datensafe-Listen löschen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DatenSafeClear

**Kurzbeschreibung:**  
Alle Werte einer Datensafe-Liste löschen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DatenSafeIstWertGesetzt

**Kurzbeschreibung:**  
Test, ob Wert in der Datensafe-Liste vorhanden ist

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | optional | `1` |

**Rückgabe:** long

---

### DatenSafeGetValue

**Kurzbeschreibung:**  
Wert zu TOPIC+PARAM aus Datensafe-Liste lesen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DatenSafePutValue

**Kurzbeschreibung:**  
Wert zu TOPIC+PARAM in Datensafe-Liste speichern

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | optional | `1` |
| WERT | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetVorgangAbbruch

**Kurzbeschreibung:**  
Abbruchmerker für aktuellen Vorgang setzen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeVorgang

**Kurzbeschreibung:**  
aktuellen Vorgang beenden

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartRwVorgang

**Kurzbeschreibung:**  
Initialisiere einen neuen RW-Vorgang

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KundNummer | long | ja | `0` |
| NumNummer | long | optional | `0` |
| Klasse | long | ja | `0` |
| ArtikelId | long | ja | `0` |
| Schemanummer | long | optional | `0` |
| Sortennummer | long | optional | `0` |
| Lieferdatum_RWPACheck | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartRwKorrektur

**Kurzbeschreibung:**  
Initialisiere RW-Vorgang zur Korrektur

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| V_ID | long | ja | `0` |
| force | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetKeepLocked

**Kurzbeschreibung:**  
Legt beim Speichern des Vorgangs automatisch einen neuen Lock an, der von Hand gelöscht werden muss.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| VALUE | bool | ja | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKeepLocked

**Kurzbeschreibung:**  
Gibt zurück ob beim Speichern des Vorgangs automatisch einen neuer Lock angelegt wird.

_Keine Parameter._

**Rückgabe:** long

---

### GetLastNewVid

**Kurzbeschreibung:**  
aktuellen Vorgang beenden

_Keine Parameter._

**Rückgabe:** long

---

### GetErrorCount

**Kurzbeschreibung:**  
Anzahl der Fehlertexte in der Fehlerliste ermitteln

_Keine Parameter._

**Rückgabe:** long

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

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### TestPeriodeBuchbar

**Kurzbeschreibung:**  
Test ob Periode bebuchbar ist

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PERI | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Set_Message_Anzeige

**Kurzbeschreibung:**  
Fehlermeldungen, Warnungen und Hinweise werden nur für die Anzeige erzeugt

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Set_Message_Protokoll

**Kurzbeschreibung:**  
Fehlermeldungen, Warnungen und Hinweise werden zum Eintrag in das Fehlerprotokoll erzeugt

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Set_Message_Anzeige_Protokoll

**Kurzbeschreibung:**  
Fehlermeldungen, Warnungen und Hinweise werden für die Anzeige und zum Eintrag in das Fehlerprotokoll erzeugt

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

### SetMenge

**Kurzbeschreibung:**  
Menge einer Position setzen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| MENGE | real | ja | `RC_0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetMenge

**Kurzbeschreibung:**  
Menge einer Position lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetPos_INT

**Kurzbeschreibung:**  
Item vom Typ INTEGER einer Position lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |
| ID | long | ja | `—` |
| PARAM | long | ja | `—` |
| PARAMNAME | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetPos_REAL

**Kurzbeschreibung:**  
Item vom Typ REAL einer Position lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |
| ID | long | ja | `—` |
| PARAM | long | ja | `—` |
| PARAMNAME | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetPos_STRING

**Kurzbeschreibung:**  
Item vom Typ REAL einer Position lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |
| ID | long | ja | `—` |
| PARAM | long | ja | `—` |
| PARAMNAME | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetVorg_INT

**Kurzbeschreibung:**  
Item vom Typ INTEGER des Vorgangs lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| ID | long | ja | `—` |
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetVorg_REAL

**Kurzbeschreibung:**  
Item vom Typ REAL des Vorgangs lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| ID | long | ja | `—` |
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetVorg_STRING

**Kurzbeschreibung:**  
Item vom Typ REAL des Vorgangs lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| ID | long | ja | `—` |
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ArtikelSchemaAendern

**Kurzbeschreibung:**  
Lieferartikel oder Abrechnungsschema ändern

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | optional | `0` |
| Schemanummer | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### VorgWertPut_erlaubt

**Kurzbeschreibung:**  
Item-Änderung auf Vorgangsebene erlaubt?

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PutVorgWert

**Kurzbeschreibung:**  
Item des Vorgangs setzen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WERT | string | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFirstRefPos

**Kurzbeschreibung:**  
Erste Positionszeile per Referenznummer suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextRefPos

**Kurzbeschreibung:**  
Nächste Positionszeile per Referenznummer suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstRef2Pos

**Kurzbeschreibung:**  
Erste Positionszeile per Referenznummer 2 suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextRef2Pos

**Kurzbeschreibung:**  
Nächste Positionszeile per Referenznummer 2 suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstRef3Pos

**Kurzbeschreibung:**  
Erste Positionszeile per Referenznummer 3 suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextRef3Pos

**Kurzbeschreibung:**  
Nächste Positionszeile per Referenznummer 3 suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstErfPos

**Kurzbeschreibung:**  
Erste Positionszeile per Erfassungsposition suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextErfPos

**Kurzbeschreibung:**  
Nächste Positionszeile per Erfassungsposition suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstAbrPos

**Kurzbeschreibung:**  
Erste Positionszeile per Abrechnungsposition suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextAbrPos

**Kurzbeschreibung:**  
Nächste Positionszeile per Abrechnungssposition suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstAuswPos

**Kurzbeschreibung:**  
Erste Positionszeile per Auswertungsnummer suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextAuswPos

**Kurzbeschreibung:**  
Nächste Positionszeile per Auswertungsnummer suchen

_Keine Parameter._

**Rückgabe:** bool

---

### GetAktPosTyp

**Kurzbeschreibung:**  
Positionszeilentyp zur Referenznummer bestimmen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAktPosRWTyp

**Kurzbeschreibung:**  
PositionszeilenRohwaretyp zur Referenznummer bestimmen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAktPosBezeichnung

**Kurzbeschreibung:**  
Positionsbezeichnung zur Referenznummer bestimmen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAktPosMassEinheit

**Kurzbeschreibung:**  
Masseinheit zur Referenznummer bestimmen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### PosWertPut_erlaubt

**Kurzbeschreibung:**  
Item-Änderung auf Positionszeilenebene erlaubt?

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PutPosWert

**Kurzbeschreibung:**  
Item-Änderung auf Positionszeilenebene

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WERT | string | ja | `0` |
| PARAMNAME | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosKlammer_MethodeStart

**Kurzbeschreibung:**  
Start Klammerbehandlung auf Positionszeilenebene

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosKlammer_MethodeAbbrechen

**Kurzbeschreibung:**  
Abbruch Klammerbehandlung auf Positionszeilenebene

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosKlammer_MethodeBeenden

**Kurzbeschreibung:**  
Ende Klammerbehandlung auf Positionszeilenebene

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosKlammer_Anzahl

**Kurzbeschreibung:**  
Klammeranzahl zur Positionszeile

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### PosKlammer_ListeLeeren

**Kurzbeschreibung:**  
Klammern zur Positionszeile löschen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosKlammer_Add

**Kurzbeschreibung:**  
Klammer zur Positionszeile hinzufügen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |
| TYP | long | ja | `0` |
| MENGE | real | ja | `0` |
| WERT | real | ja | `0` |
| MANUELL | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosKlammer_MengeManuelRuecksetzen

**Kurzbeschreibung:**  
Manuelle Klammermenge zur Positionszeile zurücksetzen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosKlammer_HoleNummer

**Kurzbeschreibung:**  
i-te Klammernummer zur Positionszeile lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### PosKlammer_HoleTyp

**Kurzbeschreibung:**  
i-ten Klammertyp zur Positionszeile lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### PosKlammer_HoleMengeManuell

**Kurzbeschreibung:**  
i-tes Klammermengemanuell-Kennzeichen zur Positionszeile lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### PosKlammer_HoleMenge

**Kurzbeschreibung:**  
i-te Klammermenge zur Positionszeile lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### PosKlammer_HoleWert

**Kurzbeschreibung:**  
i-ten Klammerwert zur Positionszeile lesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| REFNR | long | ja | `—` |
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnzahlErgZeilen

**Kurzbeschreibung:**  
Anzahl der definierten Ergänzungswert/text-Zeilen ermitteln

_Keine Parameter._

**Rückgabe:** long

---

### GetNummerzuErgIndex

**Kurzbeschreibung:**  
Definitionsnummer der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** long

---

### GetPositionzuErgIndex

**Kurzbeschreibung:**  
Positionsnummer der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** long

---

### GetEbenezuErgIndex

**Kurzbeschreibung:**  
Definitionsebene (1: RWGR, 2: SORTE) der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** long

---

### GetLabelTextzuErgIndex

**Kurzbeschreibung:**  
Labeltext der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetTypzuErgIndex

**Kurzbeschreibung:**  
Feldtyp (1: INT, 2: TEXT) der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** long

---

### GetLaengezuErgIndex

**Kurzbeschreibung:**  
Eingabefeldlänge (für Typ TEXT) der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** long

---

### GetItemBoxzuErgIndex

**Kurzbeschreibung:**  
Itemboxname (für Typ INT) der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValSqlzuErgIndex

**Kurzbeschreibung:**  
Validierungs-SOL-Text (für Typ INT) der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValTxtFeldzuErgIndex

**Kurzbeschreibung:**  
Validierungs-Ergebnistextfeld (für Typ INT) der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetMinWertzuErgIndex

**Kurzbeschreibung:**  
Minimaleingabewert (für Typ INT) der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** long

---

### GetMaxWertzuErgIndex

**Kurzbeschreibung:**  
Maximaleingabewert (für Typ INT) der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** long

---

### GetPositionzuErgNummer

**Kurzbeschreibung:**  
Positionsnummer zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** long

---

### GetEbenezuErgNummer

**Kurzbeschreibung:**  
Definitionsebene (1: RWGR, 2: SORTE) zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** long

---

### GetIndexzuErgNummer

**Kurzbeschreibung:**  
Index zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** long

---

### GetLabelTextzuErgNummer

**Kurzbeschreibung:**  
Labeltext zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetTypzuErgNummer

**Kurzbeschreibung:**  
Feldtyp (1: INT, 2: TEXT) zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** long

---

### GetLaengezuErgNummer

**Kurzbeschreibung:**  
Eingabefeldlänge (für Typ TEXT) zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** long

---

### GetItemBoxzuErgNummer

**Kurzbeschreibung:**  
Itemboxname (für Typ INT) zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValSqlzuErgNummer

**Kurzbeschreibung:**  
Validierungs-SOL-Text (für Typ INT) zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValTxtFeldzuErgNummer

**Kurzbeschreibung:**  
Validierungs-Ergebnistextfeld (für Typ INT) zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetMinWertzuErgNummer

**Kurzbeschreibung:**  
Minimaleingabewert (für Typ INT) zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** long

---

### GetMaxWertzuErgNummer

**Kurzbeschreibung:**  
Maximaleingabewert (für Typ INT) zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** long

---

### GetErgWertzuIndex

**Kurzbeschreibung:**  
Wert/Text zur i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** long

---

### GetErgWertzuNummer

**Kurzbeschreibung:**  
Wert/Text zur Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** long

---

### GetErgWertValTextzuIndex

**Kurzbeschreibung:**  
Ergebnis des Validierungs-SQL's zum Wert der i-ten Ergänzungswert/text-Zeile ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetErgWertValTextzuNummer

**Kurzbeschreibung:**  
Ergebnis des Validierungs-SQL's zum Wert der Ergänzungswert/text-Zeile mit Definitionsnummer ermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PutErgWertzuIndex

**Kurzbeschreibung:**  
Eingabewert der i-ten Ergänzungswert/text-Zeile übermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| INDEX | long | ja | `0` |
| WERT | long | ja | `0` |
| WERT | string | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PutErgWertzuNummer

**Kurzbeschreibung:**  
Eingabewert der Ergänzungswert/text-Zeile mit Definitionsnummer übermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUMMER | long | ja | `0` |
| WERT | long | ja | `0` |
| WERT | string | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPosKommentarID

**Kurzbeschreibung:**  
ID des Positions-Kommentars (Bemerkung) zur Referenznummer bestimmen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPosKommentarTyp

**Kurzbeschreibung:**  
Positionierungstyp des Positions-Kommentars (Bemerkung) zur Referenznummer bestimmen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPosKommentarZeilenZahl

**Kurzbeschreibung:**  
Zeilenanzahl des Positions-Kommentars (Bemerkung) zur Referenznummer bestimmen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPosKommentar

**Kurzbeschreibung:**  
Kommentartextzeile des Positions-Kommentars (Bemerkung) zur Referenznummer bestimmen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PutPosKommentarID

**Kurzbeschreibung:**  
BemerkID des Positions-Kommentars (Bemerkung) zur Referenznummer übermitteln

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PutPosKommentarTyp

**Kurzbeschreibung:**  
Positionierungstyp des Positions-Kommentars (Bemerkung) zur Referenznummer ändern

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Add_V_Id

**Kurzbeschreibung:**  
Eine V_Id in die ID-Liste aufnehmen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Clear_V_Id_List

**Kurzbeschreibung:**  
Die ID-Liste abräumen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RW_Umwandel_Abschlag

**Kurzbeschreibung:**  
Abschlagvorbereitung: Umwandlung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RW_Umwandel_Folgeabschlag

**Kurzbeschreibung:**  
Folgeabschlagvorbereitung: Umwandlung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RW_Umwandel_Finale

**Kurzbeschreibung:**  
Finalvorbereitung: Umwandlung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_GetValDatBehandlung

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool

---

### RWUMW_PutValDatBehandlung

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_GetValDatum

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool

---

### RWUMW_PutValDatum

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_GetUmwandelFunc

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool

---

### RWUMW_GetFolgeFunc

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool

---

### RWUMW_PutFolgeFunc

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_PutPeriManWare

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_PutPeriManFibu

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_PutPeriWare

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_WERT | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_PutJahrWare

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_PutPeriFibu

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PAR_WERT | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_PutJahrFibu

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_GetZiel_V_Id

**Kurzbeschreibung:**  
V_id des neuen Belegs zu einer Quellbeleg-V_Id bestimmen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Quell_V_ID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RWUMW_exec

**Kurzbeschreibung:**  
Für interne Kommunikation reserviert!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Test_Routine

**Kurzbeschreibung:**  
Für interne Testroutine reserviert!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| EKVK | string | ja | `—` |
| GRUPPE | long | ja | `0` |

**Rückgabe:** long

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
