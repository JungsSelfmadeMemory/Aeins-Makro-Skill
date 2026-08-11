# A.eins Makro – Entwicklerhandbuch (mit Beispielen)

> Zweck: Referenz zum **selbst Schreiben** von A.eins-Makros. Alle Beispiele sind aus echten
> Makros der DSN `DEMO_FOOD` abgeleitet und auf die **Hausregeln** (Abschnitt 0) umgeschrieben.
> Offene Punkte stehen im [Fragenkatalog](Fragenkatalog.md) und sind hier mit ❓Fx markiert.

---

## 0. Hausregeln (verbindlich für neue Makros)

Diese vier Regeln gelten für **alles**, was ich neu schreibe:

### R1 – Variablen-Präfix nach Datentyp  ✅ bestätigt
Jeder Variablenname beginnt mit einem Kleinbuchstaben, der den Datentyp anzeigt;
der Rest des Namens ist CamelCase (`sBelegNr`, `iVorgang`).

| Präfix | Typ | Beispiel |
|---|---|---|
| `s` | string | `sBuf`, `sSql`, `sBelegNr` |
| `i` | integer | `iAnzahl`, `iVorgang`, `iErr` |
| `r` | real | `rMenge`, `rPreis` |
| `d` | date | `dLiefer` |
| `b` | boolean | `bGefunden` |

> **Kein `h`-Präfix:** Handles/Referenzen (Vorgang, Position, Produkt …, z. B. Rückgaben von
> `StartVorgang`/`LadeVorgangId`/`ProduktNeu`/`GetFirstWaPos`) sind Integer und beginnen mit
> `i` (`iVorgang`, `iWaPos`, `iProdukt`).

### R2 – Schlüsselwörter GROSS
`PROGRAM, CONST, VAR, BEGIN, END, IF, THEN, ELSE, WHILE, DO, REPEAT, UNTIL, CASE, PROCEDURE, FUNCTION` – immer groß. SQL-Schlüsselwörter (`SELECT, FROM, JOIN, WHERE, ORDER BY …`) ebenfalls groß.

### R3 – SELECT-Formatierung (führendes Komma, Blöcke untereinander)
```sql
SELECT ArtikelId
     , ArtikelNr
     , Bezeichnung
  FROM Artikel          art
  JOIN ArtikelStamm     ars ON ars.ArtiStammId  = art.ArtiStammId
  JOIN MengEinhGruppe   meg ON meg.ME_GrupNummer = ars.ME_GrupNummer
 WHERE art.ArtikelId = 4711
 ORDER BY art.ArtikelNr
```
Regeln: erster Spaltenwert hinter `SELECT`, jede weitere Spalte in eigener Zeile mit **führendem Komma**; `FROM/JOIN/WHERE/ORDER BY` rechtsbündig aufeinander ausgerichtet; Tabellen-Aliase in einer Spalte untereinander.

Im Makro-String (Literale werden aneinandergereiht = verkettet) sieht das so aus:
```pascal
STRCPY(sSql, "SELECT ME_NummerLager AS wert "
             "  FROM Artikel          art "
             "  JOIN ArtikelStamm     ars ON ars.ArtiStammId  = art.ArtiStammId "
             "  JOIN MengEinhGruppe   meg ON meg.ME_GrupNummer = ars.ME_GrupNummer "
             " WHERE art.ArtikelId = %d");
```

### R4 – Jede String-Variable mit `Alloc` holen und mit `free` freigeben
Allokieren **immer am Anfang**, freigeben **immer am Ende** – gebündelt in zwei
Prozeduren `Init()` (alle `ALLOC`) und `Cleanup()` (alle `FREE`), die als erstes bzw.
letztes im Hauptprogramm aufgerufen werden (siehe Vorlage in Abschnitt 10).

### R5 – Nur Leerzeichen, keine Tabs
Einrückung ausschließlich mit Leerzeichen.

### R7 – Funktions-Rückgabe per Funktionsname, kein `RETURN`  ✅ bestätigt
Rückgabe **immer** über Zuweisung an den Funktionsnamen (`FunktionsName := <Wert>;`),
**nie** `RETURN`. Die Zuweisung **beendet die Funktion sofort** (anders als Standard-Pascal)
und muss daher die **letzte ausgeführte Zeile** sein.
```pascal
FUNCTION GetAnzahl(iId : INTEGER) : INTEGER;
BEGIN
   SPRINTF(sSql, "SELECT COUNT(*) AS wert FROM Artikel WHERE ArtikelId = %d", iId);
   GetDBWert(sBuf, sSql);
   GetAnzahl := STRTOINT(sBuf);      // letzte Zeile – beendet die Funktion
END;
```

### R8 – String-Variablen nie mit `:=` setzen  ✅ bestätigt
Strings sind `ALLOC`-Puffer (Zeiger). `:=` überschreibt den **Zeiger**, kopiert **nicht**
den Inhalt. Daher **verboten**: `sBuf := "text";` und `sBuf := sSql;`.
Immer `STRCPY`/`STRCAT`/`SPRINTF` verwenden. Einzige erlaubte `:=`-Zuweisung an einen
String ist `sBuf := ALLOC(n);`.
```pascal
// FALSCH:  sBuf := "Hallo";      sBuf := sSql;
STRCPY(sBuf, "Hallo");            // richtig
STRCPY(sBuf, sSql);              // richtig (Inhalt kopieren)
```

### R9 – Artikel-Prüfung vor dem Erfassen ist Pflicht  ✅ bestätigt
**Immer** vor `PositionNeu`/`ProduktNeu`/`Komponente` die Funktion `GetGueltigeArtikelId(...)`
aufrufen und bei Rückgabe `0` abbrechen. Details/Beispiel: Abschnitt **6f**.

### R10 – KundNummer-Prüfung vor StartVorgang ist Pflicht  ✅ bestätigt
**Immer** vor `StartVorgang` (bzw. im `CVorgangsHelper` vor `jppex "StartVorgang"`)
`KundeGueltig(KundNummer, Vorgangsklasse)` aufrufen und bei `0` keinen Vorgang anlegen.
Details/Beispiel: Abschnitt **6g**.

---

## 1. Programmgerüst & Parameter

Minimalmakro (aus `KM_Test_Messagebox`):
```pascal
PROGRAM KM_Test_MessageBox;
BEGIN
   MessageBox("Testmakro", "Test", 1);
END.
```

Mit Parametern – bis zu 4, immer `string` (aus `ProduktionEinlesen`, `Vorlage`):
```pascal
PROGRAM ProduktionEinlesen(param1; param2; param3; param4);
```
> Der Programmkopf ist optional – viele kurze Makros bestehen nur aus Statements
> (z. B. `AMIC_IncludeHierRein` ist reines `SQL(...)`). Endet ein `PROGRAM`-Block,
> ist der abschließende **Punkt** `END.` Pflicht.

Aufbau-Reihenfolge (aus der Sprachdoku): `PROGRAM` → `CONST` → `VAR` →
`PROCEDURE`/`FUNCTION` → `BEGIN … END.`

---

## 2. Variablen, Typen, Speicher

```pascal
PROGRAM AMIC_SV_RohErtrag;
CONST
   ID_MENGE     = 1001;     // benannte Feld-IDs als Konstanten
   ID_ARTIKELID = 1002;
   HDL          = "JA1Extern";
VAR
   sBuf     : STRING;
   iVorgang : INTEGER;
   rEkKosten: REAL;
BEGIN
   sBuf := ALLOC(8*1024);   // R4: string allokieren
   ...
   FREE(sBuf);
END.
```
Typen: `STRING` (Zeiger auf Puffer, **kein** `array of char`), `INTEGER` (32 Bit),
`REAL` (64 Bit), `CHAR`, `DATE`, `BOOLEAN`. **Keine Records** – dafür gibt es die
DBX-Satzschicht (Abschnitt 5c).

Verschachtelte Prozeduren sind erlaubt (Beispiel `AMIC_SV_RohErtrag.CalcEkKosten`).

---

## 3. Strings & Formatierung

| Funktion | Zweck | Beispiel |
|---|---|---|
| `SPRINTF(ziel,"fmt",…)` | formatiert (wie C: `%d %s %f %15.2f`) | `SPRINTF(sBuf,"Menge %d",iN)` |
| `STRCPY(ziel,quelle)` | kopieren | `STRCPY(sSql, "SELECT …")` |
| `STRCAT(ziel,quelle)` | anhängen | `STRCAT(sBuf, sRest)` |
| `SUBSTR(ziel,quelle,pos,len)` | Teilstring (1-basiert) | `SUBSTR(sTag, sDatum, 9, 2)` |
| `STRALLTRIM(s)` | links+rechts trimmen | `STRALLTRIM(sWert)` |
| `STRLTRIM`/`STRRTRIM` | einseitig trimmen | |
| `STRCMP(a,b)` | vergleichen | `IF STRCMP(sA,sB)=0 THEN …` |
| `STRLEN(s)` / `STRPAT` | Länge / Muster | |
| `STRTOINT`/`STRTOREAL`/`STRTODATE` | parsen | `iN := STRTOINT(sBuf)` |
| `INTTOSTR`/`REALTOSTR`/`DATETOSTR` | formatieren | |

Beispiel (aus `AMIC_SV_RohErtrag`, auf Regeln umgeschrieben):
```pascal
GetValue(iVorgang, ID_JAHRNUMMER, sBuf, 0);
iJahr := STRTOINT(sBuf);
SPRINTF(sSql, "SELECT AMIC_BEWERTUNGSPREIS(%d,%d,%d,-1) AS wert", iArtikel, iJahr, iPeriode);
GetDBWert(sWert, sSql);
rPreisEk := STRTOREAL(sWert);
```

---

## 4. Kontrollfluss

```pascal
IF iErr = 0 THEN BEGIN
   ...
END ELSE BEGIN
   ...
END;

WHILE iWaPos <> 0 DO BEGIN
   ...
   iWaPos := GetNextWaPos(iVorgang);
END;

REPEAT BEGIN
   ...
END UNTIL Fetch("BELEG", 2, 0) <> 0;   // vor UNTIL kein Semikolon
```
Weiteres: `FOR i := 1 TO n DO`, `CASE … OF`, `EXIT` (= break), `LOOP` (= continue).
Blöcke sind `BEGIN … END`; im Korpus werden teils `{ … }` als Blockklammern benutzt –
für neue Makros nutze ich einheitlich `BEGIN … END`. Kommentare: `//` bzw. `/* */`.

---

## 5. Datenbankzugriff (drei Wege)

### 5a. Einzelwert & direktes SQL
```pascal
// genau ein Wert:
SPRINTF(sSql, "SELECT COUNT(*) AS wert FROM Artikel WHERE ArtikelId = %d", iArtikel);
GetDBWert(sWert, sSql);
iAnzahl := STRTOINT(sWert);

// Ausführen ohne Ergebnis:
SQL("INSERT amic_key(ak_was, ak_wert) ON EXISTING UPDATE VALUES ('Test','Hallo')");
SQL("COMMIT");
```

### 5b. Cursor: `Select` → `Fetch` → `Get` → `CloseCursor`  ✅ verifiziert (Makrobibliothek.chm + Korpus)
Prototypen (aus `Makrobibliothek.chm`):
- `Select(name, sql) : integer` → **`1` = Ergebnismenge vorhanden, `0` = keine Daten oder Fehler** (Fehlerdetails via `DBError()`). Positioniert auf die 1. Zeile.
- `Get(cursor, attribut, buf) : integer` → `1` = Wert steht in `buf`, `0` = Attribut/Cursor fehlt. **`buf` muss ≥ (Attributlänge + 1) Zeichen** fassen, sonst undefiniertes Verhalten/Absturz.
- `Fetch(cursor, action, position) : integer` → Navigation (action-Tabelle unten). `position` = Offset, **nur** bei `OD_ABSOLUTE`/`OD_RELATIVE`, sonst `0`.
- `CloseCursor(cursor) : integer` → `1` = ok.

| action | Konstante | Bedeutung |
|---|---|---|
| 2 | `OD_NEXT` | nächster Datensatz *(Standard in der Schleife)* |
| 3 | `OD_PRIOR` | vorheriger Datensatz |
| 4 | `OD_FIRST` | erster Datensatz |
| 5 | `OD_LAST` | letzter Datensatz |
| 6 | `OD_ABSOLUTE` | x-ter Datensatz (x = `position`) |
| 7 | `OD_RELATIVE` | relativ zur aktuellen Zeile (± `position`) |

Kanonisches Schleifen-Muster (offizielles CHM-Beispiel; im Korpus 96×, action `2` = `OD_NEXT`,
teils als selbstdefinierte Konstante `NEXT_REC`/`DB_NEXTRECORD` = 2):
```pascal
STRCPY(sSql, "SELECT BelegId"
             "     , BelegNr"
             "     , BelegDatum"
             "  FROM KassenBeleg"
             " WHERE BelegStatus = 1");

iRet := SELECT("BELEG", sSql);              // 1 = Daten da, 0 = keine/Fehler
IF iRet <> 0 THEN BEGIN
   REPEAT BEGIN
      Get("BELEG", "BelegId",    sBelegId); // Spalte -> Zielpuffer (Puffer groß genug!)
      Get("BELEG", "BelegNr",    sBelegNr);
      Get("BELEG", "BelegDatum", sBelegDatum);
      ...
   END UNTIL Fetch("BELEG", 2, 0) <> 0;     // Ende, sobald keine weitere Zeile
   CloseCursor("BELEG");
END ELSE BEGIN
   FehlerProtokoll(30, "DATA_IMPORT", "Keine Belege gefunden");
END;
```
> `"BELEG"` ist ein frei gewählter **Cursorname**. `Get(cursor, "Name", ziel)` liest die Spalte
> der aktuellen Zeile; der Name ist der **Spalten-/Aliasname wie in der Ergebnismenge** (bei
> Ausdrücken/Aggregaten daher Alias vergeben, z. B. `COUNT(*) AS wert`). Die Schleife endet,
> sobald `Fetch` ≠ 0 liefert (keine weitere Zeile).

### 5c. DBX-Satzschicht — ⛔ NICHT verwenden (nur zur Kenntnis)
> **Regel (F7):** Die DBX-Satzschicht (`dbx_ident`, `Put("c",…)`, `^dbx_io`) wird **nicht**
> für neue Makros genutzt. Datenänderungen erfolgen **generell über SQL** — `INSERT`/`UPDATE`/
> `DELETE` per `SQL("…")` (bzw. Lesen per `SELECT`/`GetDBWert`). Der folgende Block ist nur
> der Vollständigkeit halber dokumentiert, weil er in Altmakros (`waagenimport`,
> `export_normalware`) vorkommt.
```pascal
iSatzId := dbx_ident("RohwareHauptSatz_Waage", sDummy);  // neue Satz-ID (LEGACY, nicht nutzen)
Put("c", "SatzId",        sSatz);        // Feld im Satz "c" setzen
Put("c", "Analysewert",   rHelp);
Put("c", "Datum_VonWaage", sDatum);
```
Bevorzugt stattdessen:
```pascal
SQL("INSERT INTO ... VALUES (...)");     // bzw. UPDATE / DELETE
SQL("COMMIT");
```

**Meistgenutzte Tabellen:** `Artikel`/`ArtikelStamm`(`Addon`), `VorgangStamm`/`VorgangAddon`,
`KundenStamm`, `WarenBewegung`(`Addon`), `V_PosiWare`, `VorgReservierung`, `AnschriftStamm`,
`PartieStamm`, `MengEinh`/`MengEinhGruppe`, `BedienerStamm`, `MandantStamm`, `P_EDI_*`, `P_JRC_*`.

---

## 6. Belege / Vorgänge – Feld-ID-API

Belegkopf und Positionen werden über **numerische Feld-IDs** gelesen/geschrieben
(in `CONST` benannt).

> **✅ F3 gelöst – Feld-ID-Katalog = Tabelle `FormPosition`.** Alle IDs (Kopf **und**
> Position) stehen dort: `FormPosNummer` = ID, `FormPosGatterDefine` = Konstantenname,
> `FormPosCSharpTyp` = Datentyp (int/short/double/string/DateTime), `FormPosLenMax` = Länge,
> `FormPosNachkDef` = Nachkommastellen. Vollständige Doku:
> [`FormPosition-Feldkatalog.md`](FormPosition-Feldkatalog.md) + Export
> [`FormPosition_DEMO_FOOD.csv`](FormPosition_DEMO_FOOD.csv).
>
> Lookup: `SELECT FormPosNummer, FormPosBezeich, FormPosGatterDefine, FormPosCSharpTyp
> FROM FormPosition WHERE FormPosBezeich LIKE '%Menge%'`.
> Kernfelder: 100 `ID_V_KLASSNUMMER`, 102 Kund-ID, 103 `ID_V_DATUM`, 109 `ID_V_ID`,
> 1000 `ID_PREIS`, 1001 `ID_MENGE`, 1002 `ID_ARTIKELID`, 1272 `ID_V_DATUM_PLAN`,
> 1439 `ID_WABEWPLANDAT`, 7100 `ID_GUID`.

```pascal
CONST
   ID_WUNSCHLIEFERDAT = 1272;   // Kopf   (Beispiel)
   ID_PLANDATUM_POS   = 1439;   // Position
VAR
   iVorgang, iWaPos : INTEGER;
   sDatum           : STRING;
BEGIN
   sDatum := ALLOC(1024);

   GetValue(iVorgang, ID_WUNSCHLIEFERDAT, sDatum, 0);   // Kopf lesen  (4. Arg = Instanzindex, s.u.)
   STRALLTRIM(sDatum);

   iWaPos := GetFirstWaPos(iVorgang);                    // Positionen iterieren
   WHILE iWaPos <> 0 DO BEGIN
      SetValPos(iWaPos, ID_PLANDATUM_POS, sDatum, 0);    // Positionsfeld schreiben
      iWaPos := GetNextWaPos(iVorgang);                  // 0 = keine weitere Position
   END;

   FREE(sDatum);
END.
```
API-Übersicht: `GetValue`/`SetValue` (Kopf), `GetValPos`/`SetValPos` (Position),
`GetFirstWaPos`/`GetNextWaPos` (Iteration), `PositionAdd`/`PositionNeu` (anlegen),
`BeendeVorgang` (abschließen), `GetNextId`/`InitGetId` (IDs), `MengeNormalisieren`
(ME-Umrechnung).

> **4. Argument (Instanzindex)** von `GetValue`/`SetValue`/`GetValPos`/`SetValPos`:
> normalerweise `0` (genau ein Objekt). Nur wenn es mehrere gleichartige Objekte gibt
> (z. B. mehrere Zahlungsbedingungen im Vorgang oder Gebinde-Infos in der Warenposition),
> adressiert `1`/`2`/`3` … die erste/zweite/dritte Instanz. Selten.

### 6a. Datentyp → Konvertierung (aus `FormPosCSharpTyp`)
Get/Set arbeiten immer mit **String-Puffern**; der Datentyp sagt nur, wie man parst/formatiert:

| CSharpTyp | Lesen | Schreiben |
|---|---|---|
| `int`/`short` | `STRTOINT(sBuf)` | `SPRINTF(sBuf,"%d",iX)` |
| `double` | `STRTOREAL(sBuf)` | `SPRINTF(sBuf,"%.2f",rX)` (Nachk. aus `FormPosNachkDef`) |
| `DateTime` | `STRTODATE(sBuf)` | **immer** deutsches Format `TT.MM.JJJJ` (s. 6c) |
| `string` | direkt | direkt (max. `FormPosLenMax`) |

### 6b. Vorgang anlegen mit `CVorgangsHelper`  ✅ verifiziert (LegeVorgangAn/HauVoll/sem_umwandel)
Ein **einziges** JPP-Objekt, dann pro Beleg ein `StartVorgang…BeendeVorgang`-Zyklus:
```pascal
STRCPY(sHdl, "vh");
IF JPPNEW(sHdl, "CVorgangsHelper") = 1 THEN BEGIN
   JPPINI(sHdl, "KundNummer",  iKundNr);      // Kopf vorbelegen
   JPPINI(sHdl, "Klasse",      400);          // = V_KLASSNUMMER (100=Angebot, 400=Auftrag)
   JPPINI(sHdl, "UnterKlasse", 0);
   IF JPPEX(sHdl, "StartVorgang") = 1 THEN BEGIN

      // -- Kopffeld setzen (SetValue): ID / VALUE / PARAMETER, dann jppex --
      JPPINI(sHdl, "ID",        103);         // ID_V_DATUM
      JPPINS(sHdl, "VALUE",     sDatum);      // jppins = String; TT.MM.JJJJ
      JPPINI(sHdl, "PARAMETER", 0);
      JPPEX (sHdl, "SetValue");

      // -- Position anlegen --
      JPPINI(sHdl, "ArtikelId", iArtikelId);
      JPPINR(sHdl, "Menge",     rMenge);      // jppinr = Real  (jppini = Integer)
      IF JPPEX(sHdl, "PositionNeu") = 1 THEN BEGIN
         JPPEX(sHdl, "PositionAdd");

         // -- Positionsfeld setzen (SetValPos) --
         JPPINI(sHdl, "ID",        1358);     // ID_ZUSATZINFO2
         JPPINS(sHdl, "VALUE",     sInfo);
         JPPINI(sHdl, "PARAMETER", 0);
         JPPEX (sHdl, "SetValPos");
      END;

      JPPINI(sHdl, "Speichern", 1);
      STRCPY(sErgebnis, "");
      JPPDO(sHdl, "BeendeVorgang", sErgebnis, 64);   // -> V_ID (integer) als Text
      iVID := STRTOINT(sErgebnis);
   END;
   JPPDELETE(sHdl);                                   // immer freigeben
END;
```
**Eingabe-Varianten:** `JPPINI`=Integer, `JPPINR`=Real, `JPPINS`=String;
Ergebnis holen: `JPPDO(hdl,"GetValPos",buf,n)` (mit `ID`/`PARAMETER` vorher gesetzt).
Vollständiges Praxis-Makro: [`KM_AuftraegeGenerieren.pas`](KM_AuftraegeGenerieren.pas).

### 6c. Vorgangs-Versionierung & stabile Referenzen  ✅ bestätigt
- `BeendeVorgang` liefert die **`V_ID` (integer)** aus `Vorgangstamm`.
- **Jede Bearbeitung erzeugt eine neue `V_ID`** (Server bucht alt zurück, neu positiv).
  Aktueller Stand nur über Join auf **`VorgReservierung.V_Id`**.
- **Dauerhafte Referenz = GUID**, Feld-ID **7100 `ID_GUID`**:
  `GetValue(iVorg,7100,buf,0)` → `V_GUID` (Kopf), `GetValPos(iWaPos,7100,buf,0)` →
  `WaBew_GUID` (Position). `WaBewId` wechselt ebenfalls beim Bearbeiten → nie als Referenz.
- **`Vorgangaddon`** (Join über `V_ID`) hält oft individuelle/kundenspezifische Felder.

### 6d. Datum immer deutsch `TT.MM.JJJJ` — Zufallsdatum im laufenden Jahr
```pascal
STRCPY(sSql, "SELECT DATEFORMAT("
             "  DATEADD(day, CAST(RAND() * DATEDIFF(day, YMD(YEAR(TODAY(*)),1,1),"
             "                                            YMD(YEAR(TODAY(*))+1,1,1)) AS INT),"
             "          YMD(YEAR(TODAY(*)),1,1)), 'DD.MM.YYYY') AS wert FROM dummy");
GetDBWert(sDatum, sSql);      // z. B. "25.07.2026"
```

### 6e. Addon-Felder (`…ByName`)  ✅ verifiziert (Korpus)
Zusatz-/Erweiterungsfelder liegen in Addon-Tabellen und werden **nicht** über eine eigene
Feld-ID je Spalte gesetzt, sondern **generisch über eine Basis-ID + den Spaltennamen**:

- **Position → `WarenBewegungAddon`:** Basis-ID **425 `ID_WARENBEWEGUNG_ADDON`** (string).
```pascal
CONST ID_WARENBEWEGUNG_ADDON = 425;
// Schreiben (Wert IMMER String):
STRCPY(sWert, "12345");
SetValPosByName(iWaPos, ID_WARENBEWEGUNG_ADDON, sWert, "ProdAuftragNummer");
// Lesen:
STRCPY(sWert, "");
GetValPosByName(iWaPos, ID_WARENBEWEGUNG_ADDON, sWert, "ProdAuftragNummer");
```
Parameter: `iWaPos` = Positions-Referenz (aus `PositionNeu`/`ProduktNeu`/`Komponente` bzw.
`GetFirstWaPos`/`GetNextWaPos`); `425` = Basis-ID aus `FormPosition`; `sWert` = zu setzender/
gelesener Wert (String → Zahlen/Datum mit `SPRINTF`); letzter Parameter = **Spaltenname in
`WarenBewegungAddon`** (installationsspezifisch, z. B. `"PartieMHD"`, `"PartieChargenNummer"`,
`"ZugangsOrt"`, `"StickstoffProzent"`).

- **Kopf → `VorgangAddon`:** analog `SetValueByName`/`GetValueByName` mit Vorgangs-Referenz.

> Die Addon-Spalte muss in der Ziel-DB existieren (`SELECT * FROM WarenBewegungAddon`).

### 6f. Artikel-Prüfung vor dem Erfassen — PFLICHT  ✅ verifiziert (Korpus)
> **Regel:** **Immer** wenn eine Position über `PositionNeu`/`ProduktNeu`/`Komponente` auf einen
> Vorgang erfasst wird, **vorher** `GetGueltigeArtikelId(...)` aufrufen und bei `0` abbrechen.

`PositionNeu`/`ProduktNeu`/`Komponente` referenzieren den Artikel über **Artikelnummer +
Lagernummer**. Vor dem Erfassen prüfen, ob der Artikel dort **buchbar** ist:

1. **Existenz im Ziellager** (Muster `CheckArtikel`): gibt es `Artikel` mit dieser
   `Artikelnummer` + `Lagernummer` (`ArtikelLoeKennz = 0`)? Wenn nicht, ggf. aus einem anderen
   Lager kopieren: `call AMIC_ArtikelKopie(ArtikelId, Lagernummer)`.
2. **Klassenabhängige Sperre** (Muster `JRC_VorgangImport.ArtikelCheck`) — nach
   Vorgangsklassen-Bereich:
   - **`V_Klassnummer < 1000` = Verkauf** → `Artikel.ArtikelFaktSperr` darf nicht `1` sein.
   - **`V_Klassnummer >= 1000` = Einkauf UND interne Belege** (Produktion/Umbuchung werden
     **wie Einkauf** behandelt) → `Artikel.ArtikelBestSperr` darf nicht `1` sein.
3. **Gültigkeitszeitraum:** Belegdatum muss zwischen `ArtikelAbDatum` und `ArtikelBisDatum`
   liegen.

> **Wiederverwendbar:** Die Helferfunktion `GetGueltigeArtikelId(sArtNr, iLager, sDatum,
> iKlasse)` kombiniert alle drei Schritte und liefert die buchbare `ArtikelId` bzw. `0`.
> Beispiel: `assets/KM_GetGueltigeArtikelId.pas`; eingebaut in
> `assets/KM_ProduktionAnlegen_mitPruefung.pas`.
>
> **Fehlerprotokoll:** Liefert die Prüfung `0`, wird immer ein Eintrag geschrieben —
> `FehlerProtokoll(30, <Makroname>, <Text>)`, wobei der Text die Übergabeparameter und die
> gelesenen Artikel-Werte (ArtikelId, Fakt-/BestSperr, Ab-/BisDatum) enthält. So ist im
> Protokoll erkennbar, **warum** ein Artikel nicht gebucht werden konnte.

### 6g. KundNummer-Prüfung vor StartVorgang — PFLICHT  ✅ verifiziert (Korpus/Regel)
> **Regel:** **Immer** vor `StartVorgang` bzw. im `CVorgangsHelper` (vor `jppex "StartVorgang"`)
> `KundeGueltig(KundNummer, Vorgangsklasse)` aufrufen und bei `0` keinen Vorgang anlegen.

Zulässige KundNummer je Vorgangsklasse:
- **Interne Belege (Klasse 5100..5220):** KundNummer **muss 0** sein.
- **Verkauf (`V_Klassnummer < 1000`):** Debitor → `KundTyp IN (1,3)`.
- **Einkauf (`V_Klassnummer >= 1000`):** Kreditor → `KundTyp IN (2,3)`.
- In VK/EK zusätzlich: `KundLoeKennz = 0` **und** `KundLiefSperr <= 1` **und** `KundFaktSperr <= 1`.

```pascal
// Verkauf: KundTyp IN (1,3); Einkauf: KundTyp IN (2,3)
SELECT KundTyp, KundLoeKennz, KundFaktSperr, KundLiefSperr
  FROM Kundenstamm WHERE KundNummer = <nr>
// erlaubt, wenn: KundLoeKennz=0 AND KundLiefSperr<=1 AND KundFaktSperr<=1 AND KundTyp passend
```
> **Fehlerprotokoll:** Ist die KundNummer nicht erlaubt (oder Kunde nicht gefunden), schreibt die
> Prüfung `FehlerProtokoll(30, <Makroname>, <Text>)` mit der KundNummer und den Werten
> `KundLoeKennz`, `KundFaktSperr`, `KundLiefSperr` (+ `KundTyp`). Helfer + Beispiel:
> `assets/KM_KundeGueltig.pas`, eingebaut in `assets/KM_AuftraegeGenerieren.pas`.

---

## 7. JPP-Objekte (`JPP_im_Makro`)

Brücke in die C++-Objektwelt (~150 Klassen). Fester Lebenszyklus:
```pascal
CONST
   PHDL = "vorgang";               // frei gewählter Objekt-Handle-Name
BEGIN
   IF JPPNEW(PHDL, "CVorgangsHelper") = 1 THEN BEGIN
      IF JPPEX(PHDL, "CatchSVMAIN") = 1 THEN BEGIN     // Methode ausführen (bool)
         JPPDO(PHDL, "GetVorgangHandle", sBuf, 200);   // Methode mit Rückgabe in Puffer
         iVorgang := STRTOINT(sBuf);
         ...
      END ELSE BEGIN
         MessageBox("SVMAIN-Kontext nicht gefunden.", "!", 1);
      END;
      JPPDELETE(PHDL);                                 // immer freigeben
   END;
END.
```
### JPP-Funktionen ✅ F8 gelöst (iHilfe.chm)

| Funktion | Zweck |
|---|---|
| `JPPNEW(hdl, "Klasse")` | Objekt anlegen, an frei gewähltes `hdl` binden. Rückgabe `1`=ok/`0`. |
| `JPPINI(hdl, "Name", iWert)` | **Integer**-Eingabewert setzen |
| `JPPINR(hdl, "Name", rWert)` | **Real**-Eingabewert setzen |
| `JPPINS(hdl, "Name", sWert)` | **String**-Eingabewert setzen |
| `JPPIN(hdl, "Name", sWert)` | generische (String-)Eingabe – ältere/allgemeine Form |
| `JPPEX(hdl, "Methode")` | Methode **ohne** Ergebnispuffer ausführen. Rückgabe `1`=ok/`0`. |
| `JPPDO(hdl, "Methode", puffer, len)` | Methode mit **Ergebnis in `puffer`** (Länge `len`) |
| `JPPDELETE(hdl)` | Objekt/Ressourcen freigeben (JPP sind an Masken gebunden) |

Muster: Objekt `JPPNEW` → Eingaben per `JPPINI/JPPINR/JPPINS` → `JPPEX`/`JPPDO` → `JPPDELETE`.
Werte-Rückgabe eines Feldes typischerweise: `JPPINS(hdl,"Feld","…"); JPPDO(hdl,"GetValue…",buf,n)`.
`FindKontext("SVPOSI")` liefert den aktuellen Erfassungskontext.
> Andere Aufruf-Dialekte in der Doku: JPL `JPP_NEW/JPP_IN/JPP_EXP/JPP_DO/JPP_DELETE`,
> VBA `Aeins.jpp_new/jpp_in/jpp_do/jpp_delete` — im Makro gelten die `JPP…`-Namen oben.

**Im Korpus vorkommende Klassen:** `CVorgangsHelper`, `JAnwendReport`, `JTeilUmwandlung`,
`JSystem`, `JFA_View`, `JEAI_Metis`, `JFileSystem`, `JEtikettenDruck`, `JVars`, `JPfleger`,
`JExec`, `JWaagenprofil`, `JLvsHalter`, `JElara`, `JEAI_Thebe/Telesto`, `JA1Extern`, `CHelper`.

---

## 8. Steuerung & Umgebung

**CtrlString** – steuert die ERP-Oberfläche/Engine über `^`-Kommandos. Es gibt keine
offizielle Gesamtreferenz; die folgenden sind aus dem Korpus + `www.amic.de/hilfe` belegt (F9):

**`^jpl …` – Programm/Maske/Liste aufrufen**
```pascal
CtrlString("^jpl aisload GS_AU_TeilDispo Aendern 12345"); // AIS-Maske (Datenpfleger) fuer Datensatz
                                                          //  <AISGruppe> Aendern|Ansehen <PrimaryKey>
                                                          //  Gruppe muss in AmicInfoSysstamm stehen
CtrlString("^jpl aisload '' Aendern 12345 0 AEZADDONT3"); // leere Gruppe + Tab-Container AEZADDONT1..T9
CtrlString("^jpl sd_ais 8 &AEZADDON GS_CRM_Besuchsbericht"); // NEUEN Datensatz erfassen (&Maske + AISGruppe)
CtrlString("^jpl vba GS_AIS_OutlookMail");                // VB-Script (aus Tabelle Scripting, s_name)
CtrlString("^jpl fa_viewer_id 987");                      // Archiveintrag anzeigen (FormularArchiv.FA_Id)
CtrlString("^jpl Kassen_Funktion('ZHL_BAR','')");         // Marktkasse, s. eigene Referenz unten
```

**`^crw <Nr> <LILAID> [Prozeduraufruf] [Druckerprofil]` – List&Label/Crystal-Report/Etikett**
Nr: 101=Designer, **102=Druck mit Dialog**, **106=Direktdruck**, 103=Vorschau, 104=HTML,
111=PDF, 112=Bitmap, 114=RTF, 116=Archiv. `<LILAID>` = Funktionsident (Administration →
Werkzeuge → AMIC Etikettendruck). Doku: amic.de/hilfe → `definitioninaeins.htm`.
```pascal
CtrlString("^crw 102 Partieeingangsprotokoll");
```

**`^smx_con_exec SDINTERFACE <a> <b>` – in geöffneter Maske durch die Auswahlmenge blättern**
`1 10`=Anfang, `1 11`=Ende, `1 9`=nächster, `1 8`=vorheriger, **`1 12`=Speichern+weiter**,
**`6 0`=Zwischenspeichern**. Doku: amic.de/hilfe → `ntzlichecontrolstringsfrbutton.htm`.

**`^dbx_io('AISREFRESH'[,'<Feld>'])` – geöffnete Maske aktualisieren**
ohne 2. Param: komplette Maske neu laden; mit Feldname: nur dieses Feld.

**Kurzkommandos**
```pascal
CtrlString("^jm_keys EXIT");                   // Tasten-/Menükommando an Maske; EXIT = Maske verlassen
CtrlString("^makro GS_ETIKETT_DRUCK %d 0 %s"); // anderes Makro aufrufen, p1..p4 positionsweise
CtrlString("^clear_mdts()");                   // MDTs leeren
```

**Anderes Makro aufrufen – Funktion `Makro(...)`** (Alternative zu `^makro`, mit Ergebnis):
```pascal
// function Makro(n, r, p1, p2, p3, p4 : string) : integer;   1=ok / 0=Fehler
iRes := Makro(sName, sErgebnis, sP1, sP2, sP3, sP4);
//   n = Makroname; r = Ergebnispuffer (nimmt den RÜCKGABEWERT des Makros auf, s. F11);
//   p1..p4 = die 4 Parameter (wie PROGRAM name(p1;p2;p3;p4))
```
> Spezialvariante `CallMakro(makro:string; paras,x1,y1,x2,y2:integer)` nur für Report/Export-Events.
> **Marktkasse:** die ~79 `^jpl Kassen_Funktion('<CODE>','<PARAM>')`-Aktionen sind separat
> dokumentiert in [`Marktkasse-Kassenfunktionen.md`](Marktkasse-Kassenfunktionen.md)
> (Export [`KassenFunktion_DEMO_FOOD.csv`](KassenFunktion_DEMO_FOOD.csv)).

**Jvars** – benannte Makro-Variablen mit Owner/Namespace (✅ F10, iHilfe.chm):
```pascal
// JVarsSet(owner:int; name, wert : string)
// JVarsGet(owner:int; name, ergebnis : string; bufflen : int)   -- owner IMMER zuerst!
JVarsSet(7100, "GS_AU_TEILDISPO_STARTEN", "1");
JVarsGet(7100, "GS_AU_TEILDISPO_STARTEN", sWert, 512);
```
> `owner` = Namespace. **`7100` = AIS-Masken**; weitere Namespaces existieren (noch zu klären).
> Achtung: Bei `JVarsGet` steht `owner` **vor** `name` (die alte Referenz `(name, owner, …)` war falsch).

**ReadScriptParam** – Makro-Parameter aus der Konfiguration lesen:
```pascal
iRes := ReadScriptParam("DATUMFORMAT", SCRIPTPID, sWert1, sWert2, sWert3);
```

---

## 9. Meldungen, Trace, Protokoll

```pascal
MessageBox("Text", "Titel", 1);                 // 1=OK, 4=Ja/Nein → Rückgabe 6=Ja
IF MessageBox("Übernehmen?", "Frage", 4) = 6 THEN BEGIN ... END;

TracePrintf("Wert iN=%d  rPreis=%f", iN, rPreis);   // Debug-Trace (formatierbar)
Trace(sBuf, "Label", 1);
SetTraceOpt(...);                                   // Trace steuern

Statuszeile("Verarbeite Beleg %s ...", sBelegNr);   // Statuszeile im ERP

FehlerProtokoll(30, "DATA_IMPORT", "Fehler bei Belegauswahl");   // Fehler-Log
ProtokollEintrag(...);
```

---

## 10. Muster-Makro (Vorlage nach Hausregeln)

Diese Struktur folgt der offiziellen `Vorlage`-Makro-Vorlage (`vorlage_allgm_script`):
Kopf-Doku, `Init()` allokiert alle Puffer, `Cleanup()` gibt sie frei, das
Hauptprogramm ruft beide als erstes/letztes auf.

```pascal
/*------------------------------------------------------------
=pod
=head1 Muster_BeispielVerarbeitung
 Zählt offene Vorgänge und zeigt das Ergebnis an.
 bearbeitet: 2026-08-10 | KJ | Erstanlage
=cut
------------------------------------------------------------*/
PROGRAM Muster_BeispielVerarbeitung;
CONST
   ID_NETTO = 1003;
VAR
   sSql    : STRING;
   sWert   : STRING;
   iAnzahl : INTEGER;

   PROCEDURE Init();                 // R4: alle Puffer am Anfang holen
   BEGIN
      sSql  := ALLOC(4*1024);
      sWert := ALLOC(1024);
   END;

   PROCEDURE Cleanup();              // R4: alle Puffer am Ende freigeben
   BEGIN
      FREE(sSql);
      FREE(sWert);
   END;

BEGIN
   Init();

   STRCPY(sSql, "SELECT COUNT(*) AS wert"
                "  FROM VorgangStamm  vs"
                " WHERE vs.VorgStatus = 1");
   GetDBWert(sWert, sSql);
   iAnzahl := STRTOINT(sWert);

   SPRINTF(sWert, "Es sind %d offene Vorgänge vorhanden.", iAnzahl);
   MessageBox(sWert, "Info", 1);

   Cleanup();
END.
```
> Doku-Kommentare im Kopf nutzen die POD-Konvention (`=pod … =cut` innerhalb `/* */`)
> wie die AMIC-Standardvorlage – optional, aber hausüblich.

---

## Anhang – Artefakte
- `Makro-Analyse_DEMO_FOOD.md` – Korpusüberblick & Statistik
- Scratchpad `makros/` – alle 667 Makros, `funktionsliste.txt` – Aufrufhäufigkeit (473 Fkt. ≥10×)
