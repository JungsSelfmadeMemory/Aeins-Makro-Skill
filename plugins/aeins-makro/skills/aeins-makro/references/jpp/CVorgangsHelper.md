# Dokumentation: CVorgangsHelper

**Datei:** `a1aeins/UmbuchungsHelper.cpp`  
**Klasse:** `CVorgangsHelper`  
**Zweck:** Vorgangs Unterstützung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Vorgangs Unterstützung

---

## Methodenübersicht

### Korrektur

**Kurzbeschreibung:**  
Korrigiere einen Beleg;  V_ID kann direkt übergeben werden

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Ansicht | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Stornieren

**Kurzbeschreibung:**  
Storniere einen Beleg; DP =  mit V_ID (?? was ist ein DP??)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| OHNE_WAAGE | bool | optional | `FALSE` |
| Messages_ins_Protokoll | bool | optional | `TRUE` |
| NUR_TESTEN | bool | optional | `FALSE` |
| FORCE_STORNO | bool | optional | `FALSE` |
| QUELLBELEG_AKTIVIERUNG_ERLAUBT | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BelegDruck

**Kurzbeschreibung:**  
Drucke einen Belege;   DP =  mit V_ID

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ANGEPASST | bool | optional | `FALSE` |
| VORSCHAU | bool | optional | `FALSE` |
| ForceRahmen | bool | optional | `FALSE` |
| FORMULAR | long | ja | `0` |
| DRUCKER | long | ja | `0` |
| ANZEIGE | bool | optional | `FALSE` |
| KEIN_ARCHIV | bool | optional | `FALSE` |
| KEIN_DRUCKMERKER | bool | optional | `FALSE` |
| SQLK_FEHLER | bool | optional | `FALSE` |
| InternesImage | bool | optional | `FALSE` |
| NurArchivieren | bool | optional | `FALSE` |
| IstLieblingsdrucker | bool | optional | `FALSE` |
| LieblingsdruckerMakroScript | string | optional | `—` |
| NACHARCHIVIERUNGS_MODUS | bool | optional | `FALSE` |
| LieblingsdruckerNurdrucken | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartVorgang

**Kurzbeschreibung:**  
Initialisiere einen neuen Vorgang, kein DP

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KundNummer | long | ja | `0` |
| NumNummer | long | optional | `0` |
| v_NumNummer | long | optional | `NumNummer` |
| Klasse | long | optional | `0` |
| v_KlassNummer | long | optional | `0` |
| Unterklasse | long | optional | `0` |
| v_UklassNummer | long | optional | `0` |
| NoSperrLiefer | bool | optional | `FALSE` |
| NoSperrFakturier | bool | optional | `FALSE` |
| NoSperrErfass | bool | optional | `FALSE` |
| NoSperrNHPruefung | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LadeVorgang

**Kurzbeschreibung:**  
Initialisiere einen Vorgang per ID, DP=V_ID. Es können auch gesperrte Vorgänge geladen werden(FORCE)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fremdw_in_buchw | bool | optional | `FALSE` |
| Aenderung_Zulassen | bool | optional | `TRUE` |
| force | bool | optional | `FALSE` |
| NoSperrExport | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### VorgangsKopie

**Kurzbeschreibung:**  
Kopiere einen Vorgang per Handle

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ZIELKLASSE | long | optional | `0` |
| ZIELUKLASSE | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFirstWaPos

**Kurzbeschreibung:**  
Lade die erste Warenposition,   DP

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFirstPos

**Kurzbeschreibung:**  
Lade die erste Position,   DP

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteWaPosMethode

**Kurzbeschreibung:**  
Lösche Warenposition,   DP

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeletePosMethode

**Kurzbeschreibung:**  
Lösche Position     ,   DP

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### VorgangDruck

**Kurzbeschreibung:**  
Druckt den aktuellen Vorgang

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DRUCK_ART | long | ja | `0` |
| UNGEDRUCKT | long | ja | `0` |

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

### GetNextPos

**Kurzbeschreibung:**  
Lade die nächste Position, DP

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPosType

**Kurzbeschreibung:**  
Ermittle den Positionstyp, DP

_Keine Parameter._

**Rückgabe:** long

---

### Teildispo

**Kurzbeschreibung:**  
Prueft HANDLE_Vorgang, ruft PetersenCopyMethodeIntern() mit Liefer-/Kund-/Positions-/Artikel-/Mengendaten auf, setzt HANDLE_Position; bei unlock+m_v_id_src ruft glb->UnlockVorgang(); liefert true, wenn HANDLE_Position belegt. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| liefnr | long | ja | `0` |
| kundnr | long | ja | `0` |
| posinr | long | ja | `0` |
| artinr | string | ja | `—` |
| lagernr | long | ja | `0` |
| menge | real | ja | `0.0` |
| preis | real | ja | `0.0` |
| full | bool | optional | `FALSE` |
| stufe | long | optional | `0` |
| jahrnr | long | ja | `0` |
| klassnr | long | optional | `600` |
| v_id | long | optional | `-1` |
| mg_einheit | long | optional | `-1` |
| artikelid | long | optional | `-1` |
| artikelstammid | long | optional | `-1` |
| unlock | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ErsetzePos

**Kurzbeschreibung:**  
ersetzen einer Position durch eine andere

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NebenBuchFlags | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ErsetzeProdPos

**Kurzbeschreibung:**  
ersetzen einer ProduktPosition durch eine andere

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NebenBuchFlags | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosAusPos

**Kurzbeschreibung:**  
Kopie einer Warenposition erstellen zum Ersetzen derselben

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosCopy

**Kurzbeschreibung:**  
Kopie einer Warenposition erstellen als neue Position zum Einfügen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SV_SetOption

**Kurzbeschreibung:**  
Vorgangsoption setzten und getten

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| OPTID | long | ja | `0` |
| Wert | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SV_GetOption

**Kurzbeschreibung:**  
Vorgangsoption setzten und getten

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| OPTID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeVorgang

**Kurzbeschreibung:**  
Schließe einen neuen angelegten Vorgang, kein DP

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | optional | `TRUE` |
| Speichern_original | bool | optional | `TRUE` |
| OriginalbleibtimSpeicher | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeVorgangId

**Kurzbeschreibung:**  
Schließe einen neuen angelegten Vorgang, gebe ID zurück

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | optional | `TRUE` |
| Speichern_original | bool | optional | `TRUE` |

**Rückgabe:** long

---

### SetValue

**Kurzbeschreibung:**  
Schreibe Wert in Vorgangskopf

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| PARAMETER | long | optional | `0` |
| VALUE | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValue

**Kurzbeschreibung:**  
Lese Wert aus Vorgangskopf

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `0` |
| WOHIN | string | optional | `—` |
| PARAMETER | long | optional | `0` |
| JVARS | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetTempVal

**Kurzbeschreibung:**  
Lese Temp-Wert Vorgang

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FELDNAME | string | ja | `0` |
| WOHIN | string | optional | `—` |
| JVARS | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetTempValPos

**Kurzbeschreibung:**  
Lese Temp-Wert Position

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FELDNAME | string | ja | `0` |
| WOHIN | string | optional | `—` |
| PARAMETER | long | optional | `0` |
| JVARS | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetAnzeigeModus

**Kurzbeschreibung:**  
Auslesen, ob der Vorgang im ReadOnly-Modus geladen wurde

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WOHIN | string | optional | `—` |
| JVARS | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PositionsSort

**Kurzbeschreibung:**  
Positionen eines Vorgangs sortieren

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| variante | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PositionNeu

**Kurzbeschreibung:**  
Neue Warenposition vorbereiten

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| Menge | real | optional | `0` |
| Variante | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WarenpositionAusWabewid

**Kurzbeschreibung:**  
Neue Warenposition aus einer WArenbewegung mit Wabewid erzeugen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WaBewId | long | ja | `0` |
| Optionen | long | optional | `0` |
| AndereArtikelid | long | optional | `0` |
| AbweichendeMenge | real | optional | `0` |
| AbweichendeGebinde | real | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### OpenFolgeArtikelInfo

**Kurzbeschreibung:**  
Mach einen Artikel zu einem FolgeHauptArtikel

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NUR_TEST | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CloseFolgeArtikelInfo

**Kurzbeschreibung:**  
Schließen der aktuellen Folgeinfos

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PositionAdd

**Kurzbeschreibung:**  
Neue Warenposition anlegen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NebenBuchFlags | long | optional | `0` |
| Folgeartikel | bool | optional | `FALSE` |
| FA_BerechTyp | long | optional | `1` |
| FA_BerechWert | real | optional | `1.0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HSL_Nachbehandlung

**Kurzbeschreibung:**  
Nachbehandlung für Stücklisten

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| STL_VARIANTE | string | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValPos

**Kurzbeschreibung:**  
Neuen Wert in Warenposition anlegen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `0` |
| VALUE | string | ja | `—` |
| PARAMETER | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValPosByName

**Kurzbeschreibung:**  
Neuen Wert in Warenbewegung-Addon per Name anlegen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |
| VALUE | string | ja | `—` |
| FIELDNAME | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValPosByName

**Kurzbeschreibung:**  
Wert aus Warenbewegung-Addon per Name lesen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |
| FIELDNAME | string | ja | `—` |

**Rückgabe:** string

---

### GetValPos

**Kurzbeschreibung:**  
Lese Wert aus Warenposition!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| WOHIN | string | optional | `—` |
| PARAMETER | long | optional | `0` |
| JVARS | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WaPosArtikelAenderung

**Kurzbeschreibung:**  
Änderung Lagernummer oder / und Artikelnummer einer Warenposition!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ARTIKELNUMMER | string | ja | `—` |
| LAGERNUMMER | long | ja | `0` |
| LAGERPLATZ | long | ja | `0` |
| SCHEMA | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WaPosSetPruefFehler

**Kurzbeschreibung:**  
Setzt den Schalter für eine erfolglose Warenpositionsüberprüfung durch ein Kontrollmakro

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LA_ZU_RELI_Nachbehandlung

**Kurzbeschreibung:**  
Nachbehandlung der Umwandlung Ladeschein zu Rechnung/ Lieferschein

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PER_TEILUMWANDLUNG | bool | ja | `0` |
| WABEWID_QUELLE | long | ja | `0` |
| WABEWID_LADESCHEIN | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LA_ZU_RELI_Kontrollmakro

**Kurzbeschreibung:**  
Kontrollmakroaufruf nach der vollständigen Abarbeitung der Umwandlung Ladeschein zu Rechnung/ Lieferschein

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GUID_LADE | string | ja | `0` |
| GUID_RELI | string | ja | `0` |
| GUID_VIMP | string | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### InitNachhaltigkeit

**Kurzbeschreibung:**  
Initialisierung der Nachhaltigkeit

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| observeChanges | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ResetNachhaltigkeit

**Kurzbeschreibung:**  
Reset der Nachhaltigkeit

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ReInit | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddZeilenZuAbschlag

**Kurzbeschreibung:**  
Erzeugt zur letzten erzeugten Position des Vorgangs einen Zu-/Abschlag

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| TEXT | string | ja | `—` |
| WERT | real | ja | `0` |
| TYP | long | ja | `0` |
| FORMEL | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetZeilenZuAbschlagValue

**Kurzbeschreibung:**  
Holt den Wert des aktuellen Zu-/Abschlagshandles

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `0` |
| WOHIN | string | optional | `—` |
| PARAMETER | long | optional | `0` |
| JVARS | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetZeilenZuAbschlagValue

**Kurzbeschreibung:**  
Setzt den Wert des aktuellen Zu-/Abschlagshandles

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| VALUE | string | ja | `—` |
| PARAMETER | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetZeilenZuAbschlagHandle

**Kurzbeschreibung:**  
Setzt das aktuelle Positionshandle als Zu-/Abschlagshandle

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddGruppenZuAbschlag

**Kurzbeschreibung:**  
Erzeugt zur letzten erzeugten Position des Vorgangs einen Gruppen-Zu-/Abschlag

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| TEXT | string | ja | `—` |
| WERT | real | ja | `0` |
| TYP | long | ja | `0` |
| FORMEL | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetGruppenZuAbschlagValue

**Kurzbeschreibung:**  
Holt den Wert des aktuellen Gruppen-Zu-/Abschlagshandles

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `0` |
| WOHIN | string | optional | `—` |
| PARAMETER | long | optional | `0` |
| JVARS | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetGruppenZuAbschlagValue

**Kurzbeschreibung:**  
Setzt den Wert des aktuellen Gruppen-Zu-/Abschlagshandles

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| VALUE | string | ja | `—` |
| PARAMETER | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetGruppenZuAbschlagHandle

**Kurzbeschreibung:**  
Setzt das aktuelle Positionshandle als Gruppen-Zu-/Abschlagshandle

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SwitchVorgangsMakro

**Kurzbeschreibung:**  
Ausführung von VorgangsMakros unterdrücken/ wiederzulassen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### UmbuchungNeu

**Kurzbeschreibung:**  
Neue Umbuchung vorbereiten

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId_abg | long | ja | `0` |
| ArtikelId_zug | long | ja | `0` |
| Menge | real | optional | `0` |
| Variante | long | optional | `1` |
| fremdlagerzwang | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### TextNeu

**Kurzbeschreibung:**  
Lege neue Textzeile im Vorgang an!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Text | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### TexteNeu

**Kurzbeschreibung:**  
Lege neue Textzeilen im Vorgang an!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| sql | string | ja | `—` |
| stufe | string | ja | `—` |
| text | string | ja | `—` |
| trenner | string | optional | ` \n\r` |
| abposition | long | optional | `60` |

**Rückgabe:** long

---

### Zwischensumme

**Kurzbeschreibung:**  
Fügt eine Zwischensumme an der aktuellen Position an

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Text | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ProduktNeu

**Kurzbeschreibung:**  
Lege neue Produktzeile im Vorgang an!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| ArtikelMenge | real | optional | `0` |
| LagerNummer | long | optional | `0` |
| Variante | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetProduktHandle

**Kurzbeschreibung:**  
Das Aktuelle PositionsHandle als ProduktHandle setzen!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### KomponenteNeu

**Kurzbeschreibung:**  
Lege neue Komponentenzeile im Vorgang an!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| ArtikelMenge | real | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetRezept

**Kurzbeschreibung:**  
Sucht das Rezept zu dieser Produktion!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RezeptBewTyp

**Kurzbeschreibung:**  
Setzt den Bewertungstyp in dieser Rezeptur!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BewertungsTyp | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetRezeptValue

**Kurzbeschreibung:**  
Setzen von Rezeptdaten.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| PARAMETER | long | optional | `0` |
| VALUE | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetRezeptValue

**Kurzbeschreibung:**  
Holen von Rezeptdaten

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `0` |
| PARAMETER | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ProduktPreisErmittlung

**Kurzbeschreibung:**  
Berechne das Produkt ( Mengen/ Preisee) neu

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartKompIterator

**Kurzbeschreibung:**  
Starten des Komponenten Iterators

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteKompIterator

**Kurzbeschreibung:**  
Löschen des Komponenten Iterators

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RestartKompIterator

**Kurzbeschreibung:**  
Restarten des Komponenten Iterators

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetNextKomp

**Kurzbeschreibung:**  
Nächste Komponente holen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKompIndex

**Kurzbeschreibung:**  
Holen der Komponente des übergebene Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetCountKomp

**Kurzbeschreibung:**  
Anzahl der Komponenten des aktuellen Rezeptes holen

_Keine Parameter._

**Rückgabe:** long

---

### GetKompValue

**Kurzbeschreibung:**  
Holt Werte der aktuellen Komponente

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `0` |
| PARAMETER | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetKompValue

**Kurzbeschreibung:**  
Setzt Werte der aktuellen Komponente

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| PARAMETER | long | optional | `0` |
| VALUE | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RemoveKomp

**Kurzbeschreibung:**  
entfernt die aktuelle Komponente

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GebindeWapos

**Kurzbeschreibung:**  
Ermittelt das Gebindekennzeichen der Positionszeile

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GebindeInfoAdd

**Kurzbeschreibung:**  
Erweitert eine WarenPosition um eine Gebindezeile

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Menge | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValGI

**Kurzbeschreibung:**  
setzen von GebindeInfo-Eigenschaften

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| VALUE | string | ja | `—` |
| PARAMETER | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValGI

**Kurzbeschreibung:**  
auslesen von GebindeInfo-Eigenschaften

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| WOHIN | string | ja | `—` |
| PARAMETER | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Umwandlung

**Kurzbeschreibung:**  
Umwandlung in verschiedensten Formen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| v_id | long | ja | `0` |
| umwandel_code | long | ja | `0` |
| fehler_behandlung | long | optional | `2` |
| datum_original | long | optional | `0` |

**Rückgabe:** long

---

### KorrigiereVorgangDlg

**Kurzbeschreibung:**  
Korrigiere Vorgang Dialog

_Keine Parameter._

**Rückgabe:** long

---

### ZeigeVorgangFehler

**Kurzbeschreibung:**  
Anzeige aufgelaufener Fehlerhinweise im Vorgang

_Keine Parameter._

**Rückgabe:** bool

---

### VorgangFehlerInProtokoll

**Kurzbeschreibung:**  
Das Verhalten der Nachlaufsteuerung beeinflussen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ja_nein | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartPartie

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle(mit_komponente) und ruft je nach 'Hinzu' StartPartieVerteilungHinzuMethode(reset) oder StartPartieVerteilungMethode(); gibt deren Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Hinzu | bool | optional | `FALSE` |
| mit_komponente | bool | optional | `FALSE` |
| Reset | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddPartieMenge

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle; bei partienummer!=0 ruft AddPartieMengeNummerMethode(), sonst AddPartieMengeMethode() mit partieid/partieartiposit/menge; gibt Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| partienummer | long | optional | `0` |
| partieid | long | optional | `0` |
| partieartiposit | long | optional | `0` |
| menge | real | optional | `0.0` |
| artikel_hinzufuegen | bool | optional | `TRUE` |
| mit_komponente | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddPartieMengeNummer

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle und ruft AddPartieMengeNummerMethode(partienummer, menge, artikel_hinzufuegen); gibt Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| partienummer | long | ja | `0` |
| menge | real | optional | `0.0` |
| artikel_hinzufuegen | bool | optional | `TRUE` |
| mit_komponente | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EndPartie

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle und ruft EndPartieVerteilungMethode(); gibt Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| mit_komponente | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPartieAnzahl

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle, ruft GetPartieAnzahlMethode(&anzahl); gibt anzahl als JPP_LONG_RET und das Methodenergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| mit_komponente | bool | optional | `FALSE` |

**Rückgabe:** long

---

### GetPartieId

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle, ruft GetPartieIdMethode(index, &partieid); gibt partieid als JPP_LONG_RET und das Methodenergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `1` |
| mit_komponente | bool | optional | `FALSE` |

**Rückgabe:** long

---

### GetPartieMarkierIdent

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle, ruft GetPartieMarkierIdentMethode(index, &id); gibt id als JPP_LONG_RET und das Methodenergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `1` |
| mit_komponente | bool | optional | `FALSE` |

**Rückgabe:** long

---

### GetPartieMenge

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle, ruft GetPartieMengeMethode(index, &menge); gibt menge als F_REAL via JPP_Return und das Methodenergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `1` |
| mit_komponente | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPartieArtiPosit

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle, ruft GetPartieArtiPositMethode(index, &arti_posit); gibt arti_posit als F_LONG via JPP_Return und das Methodenergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `1` |
| mit_komponente | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LoeschePartieZuordnung

**Kurzbeschreibung:**  
Holt Positionshandle via GetPosHandle und ruft LoeschePartieZuordnungMethode(); gibt Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| mit_komponente | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartKlammerWabew

**Kurzbeschreibung:**  
Starten des Klammerhalters

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AnzahlElementeWabew

**Kurzbeschreibung:**  
Anzahl der Elemente im Klammerhalter

_Keine Parameter._

**Rückgabe:** long

---

### ListeLeerenWabew

**Kurzbeschreibung:**  
Leeren der Liste des Klammerhalters

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### KlammerHinzufuegenWabew

**Kurzbeschreibung:**  
Klammerhalter an das ende der Liste anfügen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KlammerNr | long | ja | `0` |
| Menge | real | ja | `0.0` |
| Wert | real | ja | `0.0` |
| Klammertyp | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MengeManuelRuecksetzenWabew

**Kurzbeschreibung:**  
Rücksetzen des MengeManuel Kennzeichens und anpassen der Menge an die WaPos

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AbbrechenKlammerWabew

**Kurzbeschreibung:**  
Abbrechen des Klammerhalters

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeKlammerWabew

**Kurzbeschreibung:**  
Beenden des Klammerhalters

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HoleNummerWabew

**Kurzbeschreibung:**  
Holen der Klammernummer des übergeben Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `0` |

**Rückgabe:** long

---

### HoleMengeWabew

**Kurzbeschreibung:**  
Holen der Menge des übergeben Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `0` |

**Rückgabe:** real

---

### HoleWertWabew

**Kurzbeschreibung:**  
Holen des Wertes des übergeben Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `0` |

**Rückgabe:** real

---

### HoleKlammertypWabew

**Kurzbeschreibung:**  
Holen des Klammertyps des übergeben Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `0` |

**Rückgabe:** long

---

### HoleMengeManuelWabew

**Kurzbeschreibung:**  
Gibt zurück ob die Menge Manuel ist (Index)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `0` |

**Rückgabe:** long

---

### Sv_Rohware_abrechnen

**Kurzbeschreibung:**  
Einen Rohwarevorgang abrechnen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetVorgangHandle

**Kurzbeschreibung:**  
Handle des aktuellen Vorgangs holen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPositionHandle

**Kurzbeschreibung:**  
Handle der aktuellen Position holen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddGebindeZeile

**Kurzbeschreibung:**  
Gebindezeile für Teilumwandlung erfassen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GebindeAnzahl | real | ja | `0` |
| GebindeFaktor1 | real | ja | `0` |
| GebindeFaktor2 | real | optional | `0` |
| GebindeFaktor3 | real | optional | `0` |
| GebindeFaktor4 | real | optional | `0` |
| GebindeME | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EchteTeilUmwandlung

**Kurzbeschreibung:**  
Teilumwandlung mit WabewId als Parameter

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WaBewId | long | ja | `0` |
| Teilmenge | real | optional | `0` |
| RestAusbuchen | bool | optional | `FALSE` |
| MitGebinde | bool | optional | `FALSE` |
| LagerNummer | long | optional | `-9999999` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### NormalZuFremdKontrakt

**Kurzbeschreibung:**  
Umwandlung eines Normalkontraktes in einen FremdwareLagerKontrakt

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KtrId | long | ja | `0` |
| Mit_KtrBuchTyp | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetSVWAREWaposHandle

**Kurzbeschreibung:**  
Zugriff auf WArenpositionshändel über einem SVWARE Context

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Add_V_Id

**Kurzbeschreibung:**  
Eins V_Id in interner Liste hinzufügen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Clear_V_Id_List

**Kurzbeschreibung:**  
Löschen LIste aller V_Ids

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### VorgangStapelKorrektur

**Kurzbeschreibung:**  
Mit allen Elemete der V_Id Liste Korrektur des Beleges Aufrufen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RohwareStapelKorrektur

**Kurzbeschreibung:**  
Mit allen Elemete der V_Id Liste Korrektur des Beleges Aufrufen, nur ROHWARE!!

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CSharpTestGetDBString

**Kurzbeschreibung:**  
NUR ZUM TEST VON C#

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SelectStatement | string | ja | `—` |
| Variable | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CSharpTestPutDBString

**Kurzbeschreibung:**  
NUR ZUM TEST VON C#

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| UpdateStatement | string | ja | `—` |
| Variable | string | ja | `—` |
| Value | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DoNotCommit

**Kurzbeschreibung:**  
Commitbehandlung jetzt temporär abschalten!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DoNotCommit | bool | optional | `false` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CatchSVMAIN

**Kurzbeschreibung:**  
Verbindung mit Vorgang des obersten SVMAIN Context

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CatchSVPOSI

**Kurzbeschreibung:**  
Verbindung mit Vorgang des obersten SVPOSI Context

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CatchSVWARE

**Kurzbeschreibung:**  
Verbindung mit Vorgang und WArenposition  des obersten SVWARE Context

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CatchHANDLE

**Kurzbeschreibung:**  
Verbindung mit Vorgang via Handle ODER Pointer

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| vHdl | handle | ja | `0` |
| pHdl | handle | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CatchSV_Refresh

**Kurzbeschreibung:**  
Den  mit CATCHSV.. verbunden Kontext neu anzeigen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Parameter | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### TesteKundNummerAenderung

**Kurzbeschreibung:**  
Machbarkeit von Änderungen der KundenNummer anhand des Behandlungsschemas testen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BehandlungsSchemaName | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### KundNummerAenderung

**Kurzbeschreibung:**  
Machbarkeit von Änderungen der KundenNummer anhand des Behandlungsschemas testen und ggf. durchführen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BehandlungsSchemaName | string | ja | `—` |
| KundNummer | long | ja | `0` |
| NurPruefen | bool | ja | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### TestRechnungsDatumAendern

**Kurzbeschreibung:**  
Machbarkeit von Änderung des Rechnungsdatums testen

_Keine Parameter._

**Rückgabe:** long

---

### AbfrageTestRechDatToPos

**Kurzbeschreibung:**  
Meldungen des Tests für der Methode TestRechnungsDatumAendern anzeigen und ggf. Abfrage ausführen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RechDatToPos

**Kurzbeschreibung:**  
Das Belegdatum des bereits instanzierten Vorgangs an die Positionen weiterleiten

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ClearLeergutSammelListe

**Kurzbeschreibung:**  
Löscht die aktuelle Leergut Sammelliste

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddLeergutartikel

**Kurzbeschreibung:**  
Fügt eine Leergut artikel zur Liste hinzu. Falls schon vorhanden werden die Mengen addiert

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| ArtikelNummer | string | optional | `—` |
| ArtikelBezeich | string | optional | `—` |
| OriginalMenge | real | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddLeergutMenge

**Kurzbeschreibung:**  
LeergutMenge draufaddieren zu schon bestehden Einträgen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| Menge | real | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LoadLeergutMenge

**Kurzbeschreibung:**  
Läd die Leergutmengen aus der Liste der Warenpositionen des Vorgangs.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RemoveLeergutartikel

**Kurzbeschreibung:**  
Wieder wegnehmen, falls schon im Beleg vorhanden, durch Subtraktion, bei < = ganz entfernen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| Menge | real | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FillLeergutGrid

**Kurzbeschreibung:**  
Füllt ein vorgegebens Grid mit den Leergut zeilen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld_ArtikelId | string | ja | `—` |
| Feld_ArtikelNummer | string | optional | `—` |
| Feld_ArtikelBezeich | string | optional | `—` |
| Feld_Menge | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### VorgangSofortDruck

**Kurzbeschreibung:**  
Setzt das Flag damit der Vorgang nach dem Speichern ausgedruckt wird.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetVorgangStufe

**Kurzbeschreibung:**  
Gibt die Stufe der Klasse zurück.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Klasse | long | ja | `0` |
| Fehlerausgabe | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKundIdAuftragBeiLadeschein

**Kurzbeschreibung:**  
Gibt die Kundenidentifikation des Auftrags zurück, wenn es sich um einen Ladeschein handelt, welcher aus einem Auftrag entstanden ist. Ansonsten werden die übergebenen Kundenidentifikation zurückgegeben.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | ja | `0` |
| jvarsNameKundId | string | optional | `KUNDID` |
| jvarsNameKundIdKontrakt | string | optional | `KUNDIDKONTRAKT` |
| Klasse | long | ja | `0` |
| WabewErfassId | long | ja | `0` |
| WabewId | long | ja | `0` |
| KundId | long | ja | `0` |
| KundIdKontrakt | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetAbgrenzungsDatum

**Kurzbeschreibung:**  
Gibt das Datum für die Abgrenzung von Zu- und Abeschlägen, Partien und Kontrakten zurück.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Klasse | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPlanOderLieferDatum

**Kurzbeschreibung:**  
Gibt das Plan- oder Lieferdatum zurück.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Klasse | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetSetupValuesForContractBehavior

**Kurzbeschreibung:**  
Gibt den Steuerparameterwert für das Kontraktverhalten, abhängig von der Einstellung, zurück.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |
| SETTINGVALUE | bool | ja | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FibuUebertrag

**Kurzbeschreibung:**  
Übergibt den Angegebenen Vorgang zum Fibuübertrag. Gibt zurück, ob dieser erfolgreich war.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKassenBarcode

**Kurzbeschreibung:**  
Individuell auf´bereiteter Barcode eines Kassenbons

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BelegId | long | ja | `0` |
| BelegKs | long | ja | `0` |
| FilialNummer | long | ja | `0` |
| ID | string | optional | `—` |
| PutPos_Variable | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetTSE_Infos

**Kurzbeschreibung:**  
Diverse Pflichtangaben auf Kassenbon aus TSE Daten

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BelegId | long | ja | `0` |
| BelegKs | long | ja | `0` |
| FilialNummer | long | ja | `0` |
| ID | string | ja | `—` |
| PutPos_Variable | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MailVersand

**Kurzbeschreibung:**  
Versendet eine Mail aus dem Vorgang

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FA_ID | long | ja | `0` |
| FA_MNDNR | long | ja | `0` |
| MAILTYP | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
