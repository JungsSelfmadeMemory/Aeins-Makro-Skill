# A.eins Makro – Einbindung & Ausführungskontexte

> Quelle: AMIC-Schulungen „Makro-Schulung" (Teil 1/2) und „A.eins Akademie – MAKRO"
> (Transkripte). Ergänzt die code-nahe Referenz (Entwicklerhandbuch) um das **„Wo/Wie läuft
> ein Makro"** und die dahinterliegende Architektur. Transkript-basiert; unsichere
> Funktionsnamen sind mit **(?)** markiert und bei Bedarf in der Ziel-DB/CHM zu verifizieren.

## 0. Grundverständnis (Hintergrund)

- A.eins-Makro ist eine **AMIC-Eigenentwicklung**, prozedural, Pascal-artig, **interpretiert**
  (keine EXE) und läuft **nur innerhalb der A.eins-EXE**, zeilenweise von oben nach unten.
- Es sitzt auf den **JPP-Objekten** auf (objektorientierter Unterbau). Makro-Funktionen wie
  `StartVorgang` nutzen intern JPP (z. B. Objekt `CVorgang`/`CVorgangsHelper`). „Mit Makro kann
  man alles ausführen, was JPP bietet."
- **Vorgang = Maske + Unterbau (Vorgangsobjekt).** Die Maske ist nur die Steuerung. Ein in die
  Maske gesetzter Wert ist **nicht automatisch** im Unterbau – und umgekehrt. Beim Setzen ggf.
  **beides** setzen (`SetValue`/`SetValPos` **und** Maskenfeld).
- **Rollensystem:** Makro-Ausführung ist „alles oder nichts" – gibt man „Makro" frei, hat der
  Anwender **alle** Makros. Einbindung daher besser über **Button/Menüfunktion** (Private
  Funktion + Control-String), deren Recht das Rollensystem steuert.
- **Übersetzen (F6/F10) prüft nur Syntax** – Laufzeitfehler (fehlendes `ALLOC`, offene Cursor)
  werden **nicht** erkannt.

## 1. Wo ein Makro angebunden wird

| Kontext | Auslöser | Zweck |
|---|---|---|
| **Auswahlliste** | Button/Menü auf einer Liste | markierte Datensätze verarbeiten (`InitGetId`/`GetNextId`) |
| **Direkter Datenbankzugriff** | Makro liest/schreibt per SQL | Daten beschaffen/ändern |
| **Maske/Feld (Standard)** | Maskenpfleger **Shift+F3** | Screen-/Feld-Ereignisse an Standardmasken |
| **Maske/Feld (AIS)** | AIS-Pfleger **Strg+Rechtsklick** | eigenständige Datenpfleger, AIS-Felder |
| **Kontrollmakro** | Standard-Vorgangsbearbeitung | mächtigste Manipulation im Beleg |
| **Test-Unit/Check-Makro** | Verlassen Kopf/Position (nur UI) | Pflichtfeld-/Validierung, Speichern verhindern |
| **Nachlauf-Makro** | nach Speichern eines Vorgangs | Nacharbeit (Client oder Mandantenserver) |
| **Vorgangsimport / FAI** | Import/Datenstrom | Belege automatisiert anlegen |

Diagnose: **„Wer bin ich?"** zeigt die aktuelle Anwendung/Maske; **F11** auf einer Menüfunktion
zeigt den Control-String (steht dort `^makro`/`^jpl … pascal`, ist es ein Makro).

## 2. Masken-/Feldmakros (Shift+F3 / AIS)

- **Standardmaske** → Manipulation über **Shift+F3**-Pfleger. **AIS-Maske/-Feld** → AIS-Pfleger
  (**Strg+Rechtsklick**; öffnet manchmal erst beim zweiten Versuch).
- **Screen-Makro** (maskenspezifisch, 1× pro Maske): reagiert auf **Öffnen/Speichern**, Modi
  **Ändern** und **Neuerfassung (Entry)**. Hooks: **Screen Entry**, **Screen Exit**, sowie die
  neueren, mächtigeren **OnSave**-Hooks: `OnSaveValid`, `OnSaveJa`, `OnSaveNein`,
  `OnSaveAbbruch` (laufen z. T. **nach** dem DB-Schreiben, aber mit Maskenzugriff). Screen Exit
  gilt dadurch als weitgehend abgelöst.
- **Feld-Makro** (feldspezifisch): **Field Entry / Field Exit / Field Valid** (+ Tab-Reihenfolge).
  `Field Valid` läuft nur bei tatsächlicher Eingabe (reines Durchtabben ⇒ kein Valid).
- **Signaturen** (per **F3** „Zeige SQL" im Pfleger ablesbar; müssen exakt passen, sonst
  erscheint das Makro nicht in der Auswahl):
  - Feld-Makro: Rückgabe **integer**; `function(sFeldname; i1; sFeldwert; iZeile; i3):integer`.
    Rückgabe steuert Verhalten (z. B. `0` = Feld nicht verlassen, `1` = verlassen).
  - Screen (Entry/Vorlauf): Rückgabe **integer**; ein String = **Maskenname**.
  - Screen (Prüfung vor Speichern): Rückgabe **integer**; **zwei** Strings; **`1` = Maske kann
    NICHT gespeichert werden**, `0` = speicherbar.
- Ein Feld-Makro hat **keinen Hauptteil**, nur Funktionen.
- **Speichern unterbinden** geht bei **eigenständigen Pflegern** (Screen/OnSaveValid), **nicht**
  bei „AIS auf Standardmaske" (dort Shift+F3-Weg).
- Eigenständige Pfleger nutzen intern die Maske **`AEZ_Addon.jam`** (`AEZ_Addon_D`,
  `AEZ_Addon_T1..T10`) → deckt sich mit der CtrlString-Form `^jpl aisload '' Aendern <PK> 0 AEZADDONT<n>`.
- **AIS-Refresh** (z. B. Rückkehr aus F3-Dialog) ruft das **Screen-Makro (Änderungsfall) erneut**
  → Code, der nur beim ersten Öffnen laufen soll, per Flag absichern (z. B. JWAS/Formularfeld).

**Maskenfelder lesen/schreiben:** `GetLDBArray("Feld", index, sZiel)` / `SetLDBArray(...)`
(ohne Index: `GetLDB`/`SetLDB`). Feldnamen/Werte einer Maske anzeigen: **Strg+Shift+F5**
(z. B. `H.Kundennummer$` mit Array-Index). **Groß-/Kleinschreibung der Feldnamen ist relevant.**
- **Numerikfelder** liefern/erwarten das **deutsche Anzeigeformat** (Tausenderpunkt, Komma).
  Zum Rechnen umwandeln (Punkt raus, Komma→Punkt, dann `StrToReal`); zum Setzen selbst ins
  deutsche Format bringen — im Korpus via SQL-Proc `p_GS_NumericToString(wert, nachk)`
  (GS-/kundenspezifisch, per `GetDBWert`).
- **Datumsfelder** auf Masken im **deutschen Format mit Punkt** setzen (mit Minus wird nicht
  gesetzt); für DB-Vergleiche Punkte→Minus ersetzen.

## 3. Kontrollmakro (Vorgangsbearbeitung)

- Mächtigstes Werkzeug: bekommt den **Vorgangs-Handle**, kann Kopf/Positionen lesen/setzen,
  über Positionen iterieren, Positionen anlegen/löschen/mischen. **Nur EIN Kontrollmakro pro
  Vorgangsart** (Eintrag in **FAZ**).
- **Food-Lösung `GSKM`**: Rahmen-Kontrollmakro, das eine AIS-Steuertabelle liest und je nach
  Vorgangsklasse/-unterklasse, Einstiegspunkt, Modus und Sortierung **kleine Fachmakros**
  aufruft (aktiv/inaktiv, Reihenfolge einstellbar). **Wichtig:** GSKM muss in **FAZ** als
  Kontrollmakro der Vorgangsart eingetragen sein, sonst wird die Steuertabelle nicht verwendet.

**Bearbeitungsart (Belegmodus, Übergabe ans Kontrollmakro):**
`1` = Neuerfassung · `11` = Korrektur · `21` = Umwandlung (aus Quellbeleg) · `22` = Storno · `23` = Kopie.

**Einstiegspunkte (Funktionsnummern):**
- Kopf: `1` nach Init (noch kein Kunde) · `2` nach Kundenauswahl · `3` Abbruch · `4` vor Speichern ·
  `5` nach Speichern · `6` Eintritt Positionsteil · `7` Verlassen Positionsteil.
- Position: `8` neue Warenposition (F4/F11 Wertpos.) · `9` Position zur Korrektur (F5) ·
  `10` nach Artikelauswahl · `13` Position wird überprüft · `14` Verlassen neue Position (ok) ·
  `16` Verlassen korrigierte Position (+ Abbruch-Einstiege; eigene Einstiege für **Marktkasse**
  und **Artikelstapel/Ordersatz**; Teildispo/Stapel evtl. nachzuliefern).

## 4. Test-Unit / Check-Makro · Nachlauf-Makro

- **Test-Unit/Check-Makro** (in FAZ): **zwei** Funktionen – eine beim Verlassen von **SV_Main**
  (Kopf), eine beim Verlassen von **SV_Ware** (Position). Rückgabe **boolean**. Zweck:
  Pflichtfeld-/Validierung, Verlassen/Speichern verhindern. **Nur am User-Interface** (nicht bei
  Import) → installationsweite Prüfungen gehören ins **Kontrollmakro** (Einstieg „vor Speichern").
- **Nachlauf-Makro**: läuft **nach** Speichern; je nach Übergabe **Client** oder
  **Mandantenserver**. Nachteil: eben gespeicherter Beleg kann gesperrt sein. **Empfehlung:
  Nachlauf-Makro möglichst durch Kontrollmakro (Einstieg „nach Speichern") ersetzen.**

## 5. Import: FAI, Datenstrom & Mandantenserver

- **Datei-Importe (CSV/TXT) über den FAI-Import**, nicht über Makro-Dateihandling: Dateihandling
  wird abgenommen und alle Dateien **automatisch archiviert**. FAI-Konfig: Pfad (aus Sicht des
  **Mandantenservers**), Filter, Automatik + **Wartezeit ≥ 1 Minute**, „Datei nach Import löschen".
  Das **SQL-Ereignis** ist eine DB-Prozedur, die `FAI_ID` + Archiv-PK bekommt und die Datei per
  SQL ausliest. **XML kann das Makro nicht parsen** → XML über SQL auslesen.
- **Reine SQL-Änderungen an Vorgangsdaten rechnen den Vorgang nicht neu** (Bestände/Umsätze
  falsch). Belege daher über die **Makro-/Vorgangsmodell-Funktionen** anlegen/ändern.
- **Datenstrom → Makro über Mandantenserver:** einen Datenstrom-Eintrag mit Status/Funktion
  **`12`** erzeugen; der Mandantenserver führt daraufhin ein **Makro per JPL-String** aus
  (z. B. `^makro <ScriptName> <Modus> %s ...`). So läuft die Verarbeitung **nicht** in der
  aktuellen Instanz, sondern serverseitig.
- Neu: **A.eins Worker** übernimmt Automatik-/Importprozesse (eigenes Thema).

## 6. Zusätzliche Funktionen aus den Schulungen

| Funktion (Name ggf. verifizieren) | Zweck |
|---|---|
| `GetLDBArray` / `SetLDBArray`, `GetLDB` / `SetLDB` | Maskenfelder lesen/setzen (mit/ohne Array-Index) |
| `SQL("…")` + `commit;` | Datenänderung; `commit` als Makro-Kurzform ODER `SQL("commit")` |
| `SQL("rollback")` | Rollback — **nur** als SQL-Statement möglich |
| `DBSetErrorDisplay(flag)` | SQL-Fehlermeldungen aus (`0`) / an (`1`) — Prozedur |
| `DBError() : integer` | Fehlercode der letzten DB-Anweisung (**0 = kein Fehler**) |
| `p_GS_NumericToString(wert, nachk)` | Zahl → deutsches Anzeigeformat, **SQL-Proc** (via `GetDBWert`); GS-/kundenspezifisch |
| `Umsetzen(typ, sEin, sErg)` | Umschlüsselung über Schlüsselklassen (Importumsetzer `IPIMPUM`) |
| `EscState(state) : integer` | ESC-Modus: `0` = unterbricht Makro (Standard), `1` = abgefragt ohne Unterbrechung, `2` = ESC nicht abgefragt; liefert alten Status |
| `StringAllTrim` / `StringLTrim` / `StringRTrim` | Strings trimmen (DB-Strings haben oft Leerzeichen) |
| `InitGetId` | Auswahllisten-Zugriff initiieren; Rückgabe **1 = ok, 0 = fehlgeschlagen** (keine Auswahlliste da) |
| `AWGetSelCount() : integer` | Anzahl **markierter** Zeilen (-1 = Fehler); vor Massenaktionen `> 0` prüfen (gegen „nichts markiert = alles markiert") |
| `GetNextIdStr(buf)` / `GetIdxStr(n, buf)` | String-Pendants zu `GetNextId`/`GetIdx(n)`, wenn der Ident ein **String** ist (Rückgabe 0/1 prüfen) |

## 7. Wichtige Regeln & Gotchas aus den Schulungen

- **`MessageBox` nur am User-Interface.** Vorher **Feld-ID 469 `ID_SV_INTERFACE`** prüfen:
  `GetValue(iVorgang, 469, sBuf, 0)` → **`0` = UI, `1` = intern** (Makro/Import/Mandantenserver).
  Sonst hängt der Mandantenserver an einer unsichtbaren Box („Mandantenserver läuft nicht mehr").
- **Fibu/Belegerfassung nicht per Maskenmakro manipulieren** – Weiterschaltungen brechen.
  Tab-Reihenfolge im Vorgangswesen/der Fibu-Belegerfassung **nie** ändern.
- **`StrToReal` erwartet Punkt** als Dezimaltrennzeichen (Komma-Eingabe → Fehlkonvertierung).
- **`DBWert`/`GetDBWert` nullt bei leerem Ergebnis NICHT** – Zielvariable vorher initialisieren.
- **String-`ALLOC` fehlt / `FREE` an falscher Stelle / Cursor nicht geschlossen** → Makro
  „schaukelt sich hoch" und stürzt **unauffindbar** ab. Ressourcen sofort nach dem Öffnen
  freigeben notieren.
- **Rückgabewert jeder Funktion setzen** (Default am Anfang, z. B. `Ergebnis := 0`), sonst
  „Variable out of range" in der Standardapplikation.
- **Commit-Pflicht** nach Änderung; bei großen Mengen **zwischendurch** committen (Locks/Deadlocks).
- **„Nichts markiert = alles markiert"** – vor Lösch-/Änderungsaktionen die Anzahl markierter
  Datensätze prüfen.
- **`REPEAT … UNTIL Fetch/GetNextId <> 0`** ist ein bekannter, bewusster „Designfehler" der
  Sprache („müssen wir mit leben") — deckt sich mit dem korpusweit verwendeten Idiom. (Betrifft
  sowohl die Fetch-Schleife als auch die Auswahllisten-Schleife `UNTIL iGrundId <> 0`.)
- **`StrCopy(sZiel, quelle)`-NULL-Falle:** ist die **Quelle NULL** (z. B. NULL-bares DB-Feld),
  bleibt der **alte Wert** in `sZiel` stehen (nicht leer!). → Zielvariable vor dem Auslesen
  NULL-barer Felder immer auf leer setzen (`STRCPY(sZiel,"")`).
- **`SPRINTF`-Platzhalter passend zum Typ:** `%d`=Integer, `%s`=String, `%f`=Real. Typ und
  Platzhalter vertauschen (`%s` ↔ Integer) → Fehlverhalten/Absturz.

## 9. Entwicklungsumgebung, Transport & Werkzeuge (Erst-Schulung)

**Customizing-/Entwicklungslandschaft (Einordnung):** AIS (Maskenmanipulation) + Sprachen nach
Alter: **Makro (älteste, meistgenutzt) → VBA → C# → Python (geplant)**. VBA ist veraltet, aber
**nicht abgekündigt**; **C# soll im Consulting nicht eingesetzt werden** (nur wenn Makro/VBA an
Grenzen stoßen). **Grundsatz: erst prüfen, ob der Standard es kann.**

**Editor einrichten (Direktsprung `OPT`):**
- Externer Editor (z. B. Notepad++) ist **bedienerspezifisch** wählbar; die EXE muss im PATH
  liegen. Änderung greift erst nach **komplettem Neustart** von A.eins. Der Editor wird
  **synchron** gestartet (A.eins wartet, bis er geschlossen ist → Tab/Datei vorher speichern).
- **⚠ Pflicht-Einstellung: Dateinamen-Präfix aktivieren.** Standardmäßig heißt jede Makrodatei
  beim Editieren `IMP_Run.pas`. In **mehreren Datenbanken** überschreiben sich Makros so
  gegenseitig. Mit der Option wird eine **DB-Kennung vor den Dateinamen + Makroname** gehängt.
  „Hat schon 500-Zeilen-Makros zerschossen."

**Versionsverwaltung im Makro-Editor:** „Version speichern" (vor jeder Änderung), „Version
vergleichen" (Diff via **WinMerge**), „Version wiederherstellen". Bekannter Bug: WinMerge wird
bei Neuinstallation z. T. **nicht ins BIN** ausgeliefert → „Vergleichen" funktioniert dann nicht
(WinMerge manuell ins BIN kopieren).

**Makro-Transport zwischen Mandanten/DBs:**
- **NICHT** über „Skript-Export"/OSQL — der Export arbeitet hart über die **Script-ID**; IDs
  kollidieren zwischen DBs und werden **gnadenlos überschrieben**.
- **Korrekt:** Makro **„Datei entladen"** → im Ziel neu anlegen → **„Aus Datei laden"** (bzw.
  Text in den Editor kopieren). In der Auswahlliste öffnet **Shift+F6** den Editor mit dem
  Makronamen als Dateiname. *(Ausblick: künftige Version zieht die Script-ID über den Makronamen
  → dann wieder zuverlässig per OSQL.)*

**Auditing/Änderungsprotokoll (Direktsprung `SUPP`, Variante „Protokoll"):** zeigt mit Zeitstempel
und Bediener, welche DB-Objekte geändert wurden (Makros mit ID, Trigger, Prozeduren, AIS/Formate,
Steuer-/Einrichterparameter, Varianten). Dahinter Tabelle **`Supporterprotokoll`**, Spalte
**`ChangeSet`** (XML) = **vorherige Definition** des Objekts (ansehbar, aber derzeit **nicht**
automatisch wiederherstellbar). Nutzen: „ging bis vor 5 Tagen" → nachsehen, wer was geändert hat.

**Makro-Debugger (Direktsprung `MDBG`):** „Debugger umschalten" verbindet/trennt; Durchsteppen
zeigt **Variablenwerte pro Zeile**. Warnungen wie **„nicht abgeräumter Speicher"** (mit
Zeilennummer, Klick springt hin), „ungültiger Makrostring", „Ausnahme bei Free". **Empfehlung:
jedes Makro einmal komplett durchsteppen — am Ende sollte nur „Makroende" stehen.**

**Makro schnell testen:** im **OSQL** (nicht ISQL) den JPL-String eintragen:
`^makro <Makroname> "P1" P2 …`. Einbinden als **Private Funktion** (Direktsprung **Shift+F4**,
Name beginnt mit `PF`, Control-String `^makro <Name>`), optional als Menüfunktion/Direktsprung.

**Konstanten:** Zuweisung mit `=` (nicht `:=`); dürfen — anders als Variablen — **Strings direkt**
erhalten. Typische Nutzung: Message-Box-Titel, Debug-Schalter (`CI_DEBUG = 0/1`), sprechende
Feld-ID-Namen (`CID_MENGE = 1000`).

## 8. Noch zu verifizieren / offen

> **✅ Namen verifiziert** (Korpus + Makrobibliothek.chm): `AWGetSelCount()`, `EscState(state)`,
> `DBError()`, `DBSetErrorDisplay(flag)`, `Umsetzen(typ,in,out)`, `GetNextIdStr`/`GetIdxStr`,
> `GetLDBArray`/`SetLDBArray`, `GetLDB`/`SetLDB`. Zahl-Formatierung erfolgt über die SQL-Proc
> `p_GS_NumericToString` (kein Makro-Builtin `AmicNumericToString`). `GetLDBRE`/`SetLDBRE`
> existieren nicht (Verhörer).

Weiterhin offen:
- Exakte **Datenstrom-Status-Prozedur** (Status `12`) und deren Name.
- `OnSaveValid`-Verhalten (verhindert es das Verlassen oder greift es erst nach dem Speichern?) —
  im Live-Test der Schulung unklar geblieben.
- Zusätzliche Kontrollmakro-Einstiegspunkte (nach Teildispo, nach Stapelverarbeitung).
- Name/Ort der OPT-Dateinamen-Präfix-Option; automatische Wiederherstellung aus `Supporterprotokoll`.
