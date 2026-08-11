# Onboarding: A.eins-Makroprogrammierung

Willkommen! Diese Seite bringt dich in ~15 Minuten auf Stand, um **A.eins-Makros** (AMIC ERP)
zu lesen, zu schreiben und zu analysieren. Für die Tiefe verweist sie auf die Detail-Docs.

---

## 1. In 60 Sekunden: Was ist ein A.eins-Makro?

- Eine **AMIC-Eigenentwicklung**: prozedurale, Pascal-artige, **interpretierte** Skriptsprache.
  Kein Compilat – ein Makro läuft **nur in der A.eins-EXE**, zeilenweise von oben nach unten.
- Es sitzt auf den **JPP-Objekten** auf (der objektorientierte Unterbau). „Mit Makro kann man
  alles ausführen, was JPP bietet."
- Makros liegen **in der Datenbank** (`ScriptStamm` = Kopf, `ScriptZeile` = Text). Eindeutiger
  Schlüssel: **`ScriptId` + `ScriptBesitzer`** (0 = Standard, 1 = Privat).
- Einordnung der Customizing-Wege (nach Alter): **AIS-Masken · Makro (meistgenutzt) · VBA · C# ·
  Python (geplant)**. Grundsatz: **erst prüfen, ob der Standard es kann.**

## 2. Setup & Plugin (einmalig)

Das gesammelte Wissen ist als **Claude-Code-Plugin** verfügbar. Installieren:

```bash
/plugin marketplace add JungsSelfmadeMemory/Aeins-Makro-Skill
/plugin install aeins-makro@amic-plugins
```

Danach lädt der Skill automatisch bei Makro-Themen. Updates: `/plugin marketplace update amic-plugins`.

**Editor einrichten (Direktsprung `OPT`):** externen Editor (z. B. Notepad++) wählen (EXE im PATH),
A.eins **neu starten**. **⚠ Pflicht: Dateinamen-Präfix aktivieren** – sonst heißt jede Makrodatei
`IMP_Run.pas` und Makros überschreiben sich über Datenbanken hinweg („hat schon 500-Zeilen-Makros
zerschossen").

## 3. Das mentale Modell

- **Vorgang = Maske + Unterbau (Vorgangsobjekt).** Die Maske ist nur die Steuerung. Ein
  Maskenwert ist **nicht automatisch** im Unterbau – beim Setzen ggf. **beides** setzen.
- **Vorgangsklassen** (`V_KlassNummer`): **< 1000 = Verkauf**, **1000–1999 = Einkauf**,
  **≥ 2000 = interne Belege** (Umbuchung/Produktion, z. B. 5220).
- **Versionierung:** Jede Bearbeitung eines Vorgangs erzeugt eine **neue `V_ID`**. Stabile
  Referenz = **GUID** (Feld-ID 7100); aktueller Stand via `VorgReservierung`.

## 4. Hausregeln (verbindlich für neue Makros)

1. **Typ-Präfix** an Variablen: `s`=String, `i`=Integer (auch Handles!), `r`=Real, `d`=Date, `b`=Boolean.
2. **Schlüsselwörter GROSS** (Sprache + SQL).
3. **SELECT** mit führendem Komma, `FROM/WHERE/…` untereinander.
4. **Jede String-Variable** `ALLOC`en und `FREE`n – gebündelt in `Init()`/`Cleanup()`.
5. **Nur Leerzeichen**, keine Tabs.
6. Kopf-Doku optional im POD-Stil.
7. **Funktions-Rückgabe** per `FunktionsName := <Wert>;` (nie `RETURN`) – beendet die Funktion
   sofort, muss die **letzte** Zeile sein.
8. **Strings nie mit `:=`** setzen → immer `STRCPY`/`STRCAT`/`SPRINTF` (nur `ALLOC` per `:=`).
9. **Vor `PositionNeu`/`ProduktNeu`/`Komponente`** immer `GetGueltigeArtikelId(...)` prüfen, bei `0` abbrechen.
10. **Vor `StartVorgang`** immer `KundeGueltig(KundNummer, Klasse)` prüfen, bei `0` nicht anlegen.
11. **`MessageBox` nur am User-Interface** – vorher Feld-ID **469 `ID_SV_INTERFACE`** prüfen
    (`0` = UI, `1` = intern/Import/Mandantenserver), sonst hängt der Mandantenserver.

## 5. Kern-How-tos (Kurzform)

**Programmgerüst**
```pascal
PROGRAM Muster_Name(p1;p2;p3;p4);   // bis 4 String-Parameter
CONST ID_MENGE = 1001;
VAR sSql : STRING; iAnz : INTEGER;
   PROCEDURE Init();    BEGIN sSql := ALLOC(4*1024); END;
   PROCEDURE Cleanup(); BEGIN FREE(sSql);            END;
BEGIN Init(); ... Cleanup(); END.    // Punkt am Ende!
```

**Datenbank** – `Select`=1/0, Idiom mit dem bekannten „Designfehler" `UNTIL … <> 0`:
```pascal
IF SELECT("cur", sSql) <> 0 THEN BEGIN
   REPEAT Get("cur","Feld",sZiel); UNTIL Fetch("cur",2,0) <> 0;
   CloseCursor("cur");
END;
```
Einzelwert: `GetDBWert(sZiel, "SELECT … AS wert …")`. Ändern: `SQL("…")` + `SQL("COMMIT")`
(`rollback` nur als SQL). **DBX-Satzschicht nicht nutzen.**

**Feld-IDs** stehen in Tabelle **`FormPosition`** (`FormPosNummer`=ID, `FormPosGatterDefine`=Konstante,
`FormPosCSharpTyp`=Typ). Kopf: `Get/SetValue(iVorg, id, sBuf, 0)`; Position: `Get/SetValPos(iWaPos, …)`.
Datum immer **`TT.MM.JJJJ`**.

**Vorgang anlegen** – JPP `CVorgangsHelper` oder Builtins (`StartVorgang`/`ProduktNeu`/`Komponente`/
`BeendeVorgang`). Beispiele im Plugin unter `assets/` (u. a. `KM_AuftraegeGenerieren.pas`,
`KM_ProduktionAnlegen_mitPruefung.pas`).

## 6. Wo ein Makro läuft (Kontexte)

Auswahlliste · direkter DB-Zugriff · **Masken-/Feldmakro** (Standard: Shift+F3, AIS: Strg+Rechtsklick;
Screen-/Feld-/OnSave-Hooks) · **Kontrollmakro** (mächtigste Vorgangs-Manipulation, nur eines pro
Vorgangsart, in FAZ; Food: **GSKM**-Rahmenmakro) · **Test-Unit/Check-Makro** (nur UI) ·
**Nachlauf-Makro** · **Vorgangsimport/FAI**. Details: `Makro-Einbindung-Kontexte.md`.

## 7. Werkzeuge & Transport

- **Debugger `MDBG`** – jedes Makro einmal durchsteppen; am Ende muss „Makroende" stehen,
  „nicht abgeräumter Speicher" ernst nehmen.
- **Versionierung** im Editor: „Version speichern/vergleichen (WinMerge)/wiederherstellen".
- **Transport zwischen DBs:** **nie** Skript-Export/OSQL (Script-ID kollidiert!) →
  „Datei entladen" → im Ziel „Aus Datei laden" (Shift+F6 öffnet den Editor).
- **Auditing `SUPP`** (Tabelle `Supporterprotokoll`) zeigt, wer welche DB-Objekte geändert hat.
- **Schnelltest:** im **OSQL** `^makro <Name> "P1" P2 …`.

## 8. Top-Gotchas

- Fehlendes `ALLOC` / zu kleiner Puffer / offener Cursor → **unauffindbarer Absturz** (Übersetzen
  F6/F10 findet das **nicht**, prüft nur Syntax).
- `StrCopy`/`GetDBWert` bei **NULL/leerem Ergebnis** → alter Wert bleibt stehen → vorher leeren.
- `StrToReal` erwartet **Punkt** als Dezimaltrennzeichen.
- **Fibu/Belegerfassung** nicht per Maskenmakro manipulieren.
- **„Nichts markiert = alles markiert"** → vor Massenaktionen `AWGetSelCount() > 0` prüfen.

## 9. Wo finde ich was? (Referenz-Landkarte)

| Doku | Inhalt |
|---|---|
| `Makro-Entwicklerhandbuch.md` | **Hauptreferenz** mit Beispielen (Hausregeln, DB, Feld-ID-API, JPP, CtrlString) |
| `Makro-Einbindung-Kontexte.md` | Kontrollmakro, Masken-/Feldmakro, Test-Unit, FAI/Import, Entwicklungsumgebung |
| `FormPosition-Feldkatalog.md` (+CSV) | Feld-IDs für Get/SetValue + Get/SetValPos |
| `Marktkasse-Kassenfunktionen.md` (+CSV) | alle `^jpl Kassen_Funktion`-Aktionen |
| `Aeins_Makro_Referenz.md` | vollständige Sprach-/Funktions-/JPP-Referenz aus den CHMs |
| `Fragenkatalog.md` | Stand geklärter/offener Fragen |
| `assets/*.pas` | lauffähige Beispielmakros |

**Doku-Quellen:** dekompilierbare CHMs (`hh -decompile … Makrobibliothek.chm` / `iHilfe.chm`) und
die Online-Hilfe **www.amic.de/hilfe**. Kataloge (`FormPosition`, `AmicInfoSysstamm`, `Scripting`,
`MusterAmicInfoSysPosition`) immer **gegen die eigene DB** abfragen – installationsspezifische Werte.

---

*Fragen oder etwas fehlt? Ergänze es im Plugin (`skills/aeins-makro/`) und pushe – so bleibt der
Skill die zentrale Quelle für alle.*
