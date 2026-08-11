---
name: aeins-makro
description: >-
  A.eins-Makros (AMIC ERP) schreiben, lesen und analysieren. Pascal-artige
  Skriptsprache mit JPP-Objekten, Feld-ID-API (FormPosition), Vorgängen/Belegen,
  CtrlString-Steuerung und Marktkasse. Nutzen, wenn es um A.eins-/AMIC-Makros,
  ".pas"-Makros aus einer A.eins-DB (SQL Anywhere/ODBC), ScriptStamm/ScriptZeile,
  GetValue/SetValPos, CVorgangsHelper, aisload/CtrlString oder den Makro-Export geht.
---

# A.eins Makro – Schreiben & Analysieren

**A.eins Makro** (AMIC ERP, www.amic.de) ist eine Pascal-artige, interpretierte
Skriptsprache. Makros liegen in der Datenbank (`ScriptStamm` = Kopf, `ScriptZeile` = Text).
Diese Anleitung fasst die verbindlichen Konventionen und die wichtigsten APIs zusammen.
Für Tiefe siehe `references/` (Entwicklerhandbuch = Hauptreferenz, komplette Sprachreferenz,
Feldkatalog, Marktkasse, offene Punkte).

> **Zwei Grundregeln vorweg**
> 1. **Nur lesend** auf produktive A.eins-DBs zugreifen. `UPDATE/INSERT/DELETE` nie
>    selbstständig ausführen. Makros, die Belege anlegen/ändern, schreiben – aber
>    **nicht** gegen die DB ausführen; das macht der Anwender in einer Testumgebung.
> 2. **Installationsspezifische Werte immer gegen die Ziel-DB prüfen** (Feld-IDs,
>    AIS-Gruppen, Kassen-Aktionen, Vorgangsklassen). Die mitgelieferten Kataloge/CSVs
>    stammen aus einer Demo-DB und dienen nur als Orientierung.

---

## Hausregeln (verbindlich für NEUE Makros)

Das bestehende Korpus hält diese Regeln nicht durchgängig ein – sie sind die **Zielkonvention**.

1. **Variablen-Präfix nach Typ**, dann CamelCase: `s`=string, `i`=integer, `r`=real,
   `d`=date, `b`=boolean. **Kein eigenes `h`-Präfix** – Handles/Referenzen (Vorgang, Position,
   Produkt …) sind Integer und beginnen mit `i`. Beispiele: `sBelegNr`, `iAnzahl`, `rPreis`,
   `iVorgang`, `iWaPos`.
2. **Alle Schlüsselwörter GROSS** – Sprache (`PROGRAM/VAR/BEGIN/IF/WHILE/REPEAT/UNTIL…`)
   und SQL (`SELECT/FROM/JOIN/WHERE/ORDER BY`).
3. **SELECT-Format:** erste Spalte hinter `SELECT`, weitere je Zeile mit führendem Komma;
   `FROM/JOIN/WHERE/ORDER BY` rechtsbündig untereinander; Aliase in einer Spalte.
4. **Jede String-Variable** mit `ALLOC(n)` holen und mit `FREE(...)` freigeben – gebündelt in
   `Init()` (alle ALLOC, zuerst aufgerufen) und `Cleanup()` (alle FREE, zuletzt).
5. **Einrückung nur mit Leerzeichen, keine Tabs.**
6. Doku-Kopf optional im POD-Stil (`=pod … =cut` in `/* */`).
7. **Funktions-Rückgabe** per Zuweisung an den Funktionsnamen (`FunktionsName := <Wert>;`),
   **nie** `RETURN`. Diese Zuweisung **beendet die Funktion sofort** → muss die **letzte**
   ausgeführte Zeile sein.
8. **String-Variablen NIE mit `:=` setzen** (weder Literal noch `sA := sB`). Strings sind
   `ALLOC`-Puffer/Zeiger → immer `STRCPY`/`STRCAT`/`SPRINTF`. Einzige erlaubte `:=`-Zuweisung
   an einen String ist `sBuf := ALLOC(n);`.

---

## Programmgerüst

```pascal
/*------------------------------------------------------------
=pod
=head1 Muster_Name
 Kurzbeschreibung.
=cut
------------------------------------------------------------*/
PROGRAM Muster_Name;            // optional bis zu 4 String-Parameter: (p1;p2;p3;p4)
CONST
   ID_MENGE = 1001;
VAR
   sSql  : STRING;
   iAnz  : INTEGER;

   PROCEDURE Init();  BEGIN  sSql := ALLOC(4*1024);  END;
   PROCEDURE Cleanup(); BEGIN  FREE(sSql);           END;

BEGIN
   Init();
   // ... Logik ...
   Cleanup();
END.                            // abschließender Punkt ist Pflicht
```
Reihenfolge: `PROGRAM → CONST → VAR → PROCEDURE/FUNCTION → BEGIN … END.`
Kontrollfluss: `IF/THEN/ELSE`, `FOR..TO|DOWNTO..DO`, `WHILE..DO`, `REPEAT..UNTIL`
(kein `;` vor `UNTIL`), `EXIT`=break, `LOOP`=continue. Keine Records.

---

## Datenzugriff

**Einzelwert / direktes SQL**
```pascal
SPRINTF(sSql, "SELECT COUNT(*) AS wert FROM Artikel WHERE ArtikelId = %d", iId);
GetDBWert(sWert, sSql);  iAnz := STRTOINT(sWert);
SQL("INSERT INTO ... VALUES (...)");  SQL("COMMIT");   // DML: nur wenn ausdrücklich gewünscht
```

**Cursor-Schleife** (`Select`=1 wenn Daten/0 keine|Fehler; `Fetch` action 2=OD_NEXT):
```pascal
iRet := SELECT("cur", sSql);
IF iRet <> 0 THEN BEGIN
   REPEAT BEGIN
      Get("cur", "Spalte", sZiel);      // Puffer >= Attributlänge+1 !
   END UNTIL Fetch("cur", 2, 0) <> 0;   // endet, wenn keine weitere Zeile
   CloseCursor("cur");
END;
```
`Fetch`-action: 2=nächster, 3=vorheriger, 4=erster, 5=letzter, 6=absolut, 7=relativ (Offset in
Param 3, sonst 0). **DBX-Satzschicht (`Put/dbx_ident`) nicht nutzen** – Datenänderung per SQL.

---

## Belege/Vorgänge – Feld-ID-API

Feld-IDs stehen in Tabelle **`FormPosition`**: `FormPosNummer`=ID, `FormPosGatterDefine`=Konstante,
`FormPosCSharpTyp`=Datentyp, `FormPosLenMax`=Länge, `FormPosNachkDef`=Nachkommastellen.
Kopf **und** Position teilen die Tabelle. Lookup:
`SELECT FormPosNummer, FormPosBezeich, FormPosGatterDefine, FormPosCSharpTyp FROM FormPosition WHERE FormPosBezeich LIKE '%…%'`.

- **Kopf:** `GetValue(iVorg, id, sBuf, 0)` / `SetValue(...)`. **Position:** `GetValPos(iWaPos, id, sBuf, 0)` / `SetValPos(...)`.
- **4. Argument** = Instanzindex (meist `0`; `1/2/3` nur bei mehreren gleichartigen Objekten).
- Konvertierung nach `FormPosCSharpTyp`: `int/short`→`STRTOINT`/`%d`, `double`→`STRTOREAL`/`%.Nf`
  (N=`FormPosNachkDef`), `DateTime`→**immer deutsch `TT.MM.JJJJ`**, `string`→direkt.
- Kernfelder: 100 `ID_V_KLASSNUMMER` (100=Angebot, 400=Auftrag), 102 Kund-ID, 103 `ID_V_DATUM`,
  109 `ID_V_ID`, 1000 `ID_PREIS`, 1001 `ID_MENGE`, 1002 `ID_ARTIKELID`, 1272 `ID_V_DATUM_PLAN`,
  1439 `ID_WABEWPLANDAT`, **7100 `ID_GUID`**.

**Artikel-Prüfung vor dem Erfassen:** `PositionNeu`/`ProduktNeu`/`Komponente` referenzieren den
Artikel über **Artikelnummer + Lagernummer**. Vorher prüfen (Helfer `GetGueltigeArtikelId`, s.
`assets/`): (1) existiert der Artikel im Ziellager, sonst `call AMIC_ArtikelKopie(ArtikelId,
Lager)`; (2) Sperre je Vorgangsklasse: **`V_Klassnummer < 1000` = Verkauf → `ArtikelFaktSperr`**,
**`>= 1000` = Einkauf UND interne Belege (Produktion/Umbuchung wie Einkauf) → `ArtikelBestSperr`**;
(3) Belegdatum zwischen `ArtikelAbDatum`..`ArtikelBisDatum`. Rückgabe = buchbare `ArtikelId` bzw. `0`.

**Addon-Felder (`…ByName`):** Zusatzfelder in Addon-Tabellen über Basis-ID + Spaltenname.
Position → `WarenBewegungAddon`, Basis-ID **425 `ID_WARENBEWEGUNG_ADDON`** (string):
`SetValPosByName(iWaPos, 425, sWert, "ProdAuftragNummer")` /
`GetValPosByName(iWaPos, 425, sWert, "ProdAuftragNummer")`. Wert immer String; letzter Parameter =
Spaltenname in `WarenBewegungAddon` (installationsspezifisch). Kopf-Analogon: `SetValueByName`/
`GetValueByName` auf `VorgangAddon`.

**Versionierung / stabile Referenzen:** `BeendeVorgang` liefert `V_ID` (integer). **Jede
Bearbeitung erzeugt eine neue `V_ID`** → aktueller Stand über Join auf `VorgReservierung.V_Id`.
Dauerhafte Referenz = **GUID** (Feld-ID 7100): `GetValue(…,7100,…)`→`V_GUID`,
`GetValPos(…,7100,…)`→`WaBew_GUID`. `Vorgangaddon` (Join über `V_ID`) hält individuelle Felder.

---

## Vorgang anlegen – JPP-Objekt `CVorgangsHelper`

```pascal
STRCPY(sHdl, "vh");
IF JPPNEW(sHdl, "CVorgangsHelper") = 1 THEN BEGIN
   JPPINI(sHdl, "KundNummer", iKundNr);
   JPPINI(sHdl, "Klasse", 400);           // = V_KLASSNUMMER (Auftrag); ggf. anpassen!
   JPPINI(sHdl, "UnterKlasse", 0);
   IF JPPEX(sHdl, "StartVorgang") = 1 THEN BEGIN
      JPPINI(sHdl, "ID", 103); JPPINS(sHdl, "VALUE", sDatum); JPPINI(sHdl, "PARAMETER", 0);
      JPPEX(sHdl, "SetValue");            // Kopffeld (Datum TT.MM.JJJJ)
      JPPINI(sHdl, "ArtikelId", iArt); JPPINR(sHdl, "Menge", rMenge);
      IF JPPEX(sHdl, "PositionNeu") = 1 THEN JPPEX(sHdl, "PositionAdd");
      JPPINI(sHdl, "Speichern", 1);
      JPPDO(sHdl, "BeendeVorgang", sErg, 64);   // -> V_ID
   END;
   JPPDELETE(sHdl);
END;
```
**JPP-Funktionen:** `JPPNEW(hdl,"Klasse")` (1=ok) · **`JPPINI`=Integer**, `JPPINR`=Real,
`JPPINS`=String (`JPPIN`=generisch) · `JPPEX(hdl,"Methode")` (1=ok, kein Puffer) ·
`JPPDO(hdl,"Methode",buf,len)` (Ergebnis im Puffer) · `JPPDELETE(hdl)`.
Vollständiges Beispiel: `assets/KM_AuftraegeGenerieren.pas`.

---

## Oberfläche steuern – `CtrlString`

Keine offizielle Gesamtreferenz; wichtigste Kommandos:
- `^jpl aisload <AISGruppe> Aendern|Ansehen <PK>` – AIS-Maske (Datenpfleger) für Datensatz;
  Gruppe muss in `AmicInfoSysstamm` stehen. `^jpl sd_ais <n> &<Maske> <AISGruppe>` = Neuerfassung.
- `^jpl vba <Name>` – VB-Script (aus Tabelle `Scripting`, `s_name`).
- `^jpl fa_viewer_id <FA_Id>` – Archiveintrag anzeigen (`FormularArchiv`).
- `^jpl Kassen_Funktion('<CODE>','<PARAM>')` – Marktkasse (siehe `references/marktkasse-kassenfunktionen.md`).
- `^crw <Nr> <LILAID>` – Report/Etikett (102=Druck mit Dialog, 106=Direktdruck, 111=PDF …).
- `^smx_con_exec SDINTERFACE <a> <b>` – in offener Maske durch Auswahlmenge blättern
  (`1 12`=Speichern+weiter, `6 0`=Zwischenspeichern).
- `^dbx_io('AISREFRESH'[,'<Feld>'])` – Maske (oder nur ein Feld) aktualisieren.
- `^jm_keys EXIT` – Maske verlassen. `^makro <Name> <p1..p4>` bzw. Funktion
  `Makro(n, r, p1,p2,p3,p4):integer` (`r` = Rückgabepuffer).

**Jvars** (benannte Variablen, owner=Namespace, 7100=AIS): `JVarsSet(owner, name, wert)`,
`JVarsGet(owner, name, ergebnis, bufflen)` – **owner immer zuerst**.

---

## Werkzeuge (siehe `scripts/`)

- **`Export-AeinsMakros.ps1`** – zieht alle Makros einer ODBC-DSN in einzelne `.pas`-Dateien
  und packt sie mit Zeitstempel in ein ZIP. Schlüssel ist `ScriptId` + `ScriptBesitzer`
  (0=Standard, 1=Privat) – nie `ScriptId` allein joinen. Aufruf z. B.:
  `powershell -ExecutionPolicy Bypass -File .\Export-AeinsMakros.ps1 -Dsn MEINE_DB`
- **Originaldoku nachschlagen:** die CHMs lokal dekompilieren:
  `hh -decompile <zielordner> "A:\Aeins2402\Makrobibliothek.chm"` (Sprachkern, je Funktion eine
  `htm`) bzw. `iHilfe.chm` (JPP-Klassen). Online: **www.amic.de/hilfe**.
- **Kataloge gegen die eigene DB** abfragen: `FormPosition` (Feld-IDs), `AmicInfoSysstamm`
  (AIS-Gruppen), `Scripting` (VB-Scripts), `MusterAmicInfoSysPosition` (Kassen-Aktionen).

---

## Referenzen (`references/`)

- `entwicklerhandbuch.md` – **Hauptreferenz** mit Beispielen (Abschnitte 0–10).
- `sprachreferenz-komplett.md` – vollständige Sprach-/Funktions-/JPP-Referenz aus den CHMs.
- `formposition-feldkatalog.md` (+ `formposition_beispiel.csv`) – Feld-ID-Katalog.
- `marktkasse-kassenfunktionen.md` (+ `kassenfunktion_beispiel.csv`) – Kassen-Aktionen.
- `fragenkatalog-offene-punkte.md` – noch offene Semantik-Fragen (F11/F12/F13/F15/F17 …).
