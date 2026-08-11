# Fragenkatalog – A.eins Makro-Dokumentation

Bitte je Frage kurz beantworten (Nummer genügt). Danach arbeite ich die Antworten ins
[Makro-Entwicklerhandbuch](Makro-Entwicklerhandbuch.md) ein und ersetze die ❓Fx-Marker.

---

## Konventionen

**F1 — Variablen-Präfixe.** ✅ **BEANTWORTET:** `s`=string, `i`=integer, `r`=real,
`d`=date, `b`=boolean; Rest CamelCase (`sBelegNr`, `iAnzahl`). **Kein `h`-Präfix** –
Handles/Referenzen sind Integer → `i` (`iVorgang`, `iWaPos`).
Rest-Detailfragen (offen, niedrige Prio): Präfix für Konstanten/globale Jvars?

**F2 — Einrückung/Format.** ✅ **BEANTWORTET:** immer Leerzeichen, nie Tabs.
`ALLOC` gebündelt in Prozedur `Init()` am Anfang, `FREE` in `Cleanup()` am Ende;
beide werden als erstes/letztes im Hauptprogramm aufgerufen (siehe `vorlage_allgm_script`).

---

## Sprache / Laufzeit

**F3 — Feld-ID-Katalog. ✅ GELÖST.** Die vollständige Zuordnung ID → Feld steht in der
DB-Tabelle **`FormPosition`** (Kopf- und Positionsfelder gemeinsam): `FormPosNummer`=ID,
`FormPosGatterDefine`=Konstante, `FormPosCSharpTyp`=Datentyp, `FormPosLenMax`/`FormPosNachkDef`
=Länge/Nachkommastellen. Doku: `FormPosition-Feldkatalog.md`, Export `FormPosition_DEMO_FOOD.csv`,
Beispiele in Handbuch Abschnitt 6/6a–6d.

**F4 — 4. Parameter von `GetValue`/`SetValue`/`GetValPos`/`SetValPos`. ✅ BEANTWORTET.**
Instanz-/Belegungsindex bei **mehrfach vorhandenen gleichartigen Objekten**. Standardfall
`0` (genau ein Objekt). Gibt es mehrere gleichartige Objekte im Vorgang/in der Position
(z. B. mehrere **Zahlungsbedingungen**, oder **Gebinde-Informationen** in der Warenposition),
adressiert `1`/`2`/`3` … die erste/zweite/dritte Instanz. Selten benötigt.

**F5 — `Fetch(cursor, action, position)`. ✅ BEANTWORTET** (Makrobibliothek.chm + Korpus).
`action`: 2=`OD_NEXT`, 3=`OD_PRIOR`, 4=`OD_FIRST`, 5=`OD_LAST`, 6=`OD_ABSOLUTE`, 7=`OD_RELATIVE`.
`position` = Offset, nur bei ABSOLUTE/RELATIVE, sonst `0`. Kanonisches Idiom (96× im Korpus):
`REPEAT … UNTIL Fetch(cur, 2, 0) <> 0;` – Schleife endet, sobald keine weitere Zeile.
**Korrektur:** `SELECT(...)` gibt **`1`=Ergebnismenge / `0`=keine Daten oder Fehler** (nicht „0=ok").

**F6 — Cursor-Feldnamen bei `Get(cursor,"Feld",ziel)`. ✅ BEANTWORTET.**
Prototyp `Get(cursor, attribut, buf) : integer` (1=Wert in buf, 0=fehlt). `attribut` = Spalten-/
Aliasname **wie in der Ergebnismenge** (kein festes Satzschema); bei Ausdrücken/Aggregaten Alias
vergeben (`… AS wert`). **Wichtig:** `buf` muss ≥ (Attributlänge + 1) fassen, sonst ggf. Absturz.

**F7 — DBX-Satzschicht. ✅ ERLEDIGT (Regel: nicht verwenden).**
Die DBX-Satzschicht (`dbx_ident`, `Put("c",…)`, `^dbx_io`) wird für neue Makros **nicht**
genutzt. Datenänderungen erfolgen **generell über SQL** (`INSERT`/`UPDATE`/`DELETE` per
`SQL("…")`). DBX bleibt nur der Vollständigkeit halber in der Doku (Altmakros). Detailfragen
zum ersten Parameter/Satztypen daher nicht weiter verfolgt.

**F8 — JPP-Methodenaufrufe. ✅ BEANTWORTET** (iHilfe.chm).
`JPPNEW(hdl,"Klasse")` anlegen (1=ok). Eingaben typisiert: **`JPPINI`=Integer**, `JPPINR`=Real,
`JPPINS`=String (`JPPIN` = generische/String-Form). `JPPEX(hdl,"Methode")` führt aus (1=ok/0,
kein Puffer); `JPPDO(hdl,"Methode",buf,len)` mit Ergebnis im Puffer. `JPPDELETE(hdl)` gibt frei.
**Korrektur:** `JPPINI` ist NICHT „Init/Kontext", sondern die **Integer-Eingabe**.
Klassen/Methoden sind in `iHilfe.chm` dokumentiert (Namespace `JPP`, ~150 Klassen; je Methode
Syntax + Beispiel in Pascal/JPL/VBA).

**F9 — `CtrlString`-Kommandosprache. ✅ WEITGEHEND BEANTWORTET** (keine offizielle Gesamtreferenz;
aus Korpus + `www.amic.de/hilfe` erschlossen). Dokumentiert in Handbuch Abschnitt 8 und
`ctrlstring-kommandos.md` (Memory):
- `^jpl aisload <AISGruppe> Aendern|Ansehen <PK>` (AIS-Maske bearbeiten), `^jpl sd_ais <n> &<Maske> <AISGruppe>` (Neu-Erfassung), `^jpl vba <ScriptName>` (VB-Script aus `Scripting`), `^jpl fa_viewer_id <FA_Id>` (Archiv-Viewer), `^jpl Kassen_Funktion('<CODE>','<PARAM>')` (Marktkasse, s. `Marktkasse-Kassenfunktionen.md`).
- `^crw <Nr> <LILAID> …` (Report/Etikett; 102=Druck-Dialog, 106=Direkt, …).
- `^smx_con_exec SDINTERFACE <a> <b>` (in Auswahlmenge blättern/speichern; `1 12`=Speichern+weiter, `6 0`=Zwischenspeichern).
- `^dbx_io('AISREFRESH'[,'<Feld>'])` (Maske/Feld aktualisieren).
- `^jm_keys EXIT` (Maske verlassen). `^makro <Name> <p1..p4>` bzw. Funktion `Makro(n,r,p1..p4)`.

**Noch offen (mit weiteren Makros nachziehen):** `^jpl dhiprevk EK`, `^jpl svposi_artikelstapel`,
`^clear`/`^clear_mdts`, `&Name` (Direktaufruf ohne `^`).

**F10 — `Jvars`. ✅ BEANTWORTET** (iHilfe.chm). `JVarsSet(owner:int, name:string, wert:string)`,
`JVarsGet(owner:int, name:string, ergebnis:string, bufflen:int)` — **`owner` steht immer zuerst**
(die Merge-Referenz `JVarsGet(name,owner,…)` war falsch). Erstes Argument `owner` = **Namespace**;
**`7100` = AIS-Masken**, weitere Namespaces existieren (im Detail noch zu klären).
*Offen (niedrige Prio):* Aufzählung der weiteren Namespaces + genaue Lebensdauer der Werte.

**F11 — Rückgabewert eines Makros. ⏳ TEILWEISE (Setz-Mechanismus offen).**
Aufrufer-Seite geklärt: `Makro(n, r, p1..p4) : integer` — `r` nimmt den Rückgabewert auf,
Funktions-Rückgabe `1`=ok/`0`=Fehler.
**Negativbefunde (nicht erneut prüfen):** `ScriptStamm.ScriptResult` ist bei ALLEN 667 Makros
leer → kein Rückgabekanal; `ScriptParam1..4` = nur Test-Default-Parameter. In der
`Makrobibliothek.chm` gibt es KEINE `SetResult`/`Result`-Funktion. Im Korpus übergeben Aufrufer
meist einen Dummy-Puffer und ignorieren `r`.
**Offen:** Wie setzt das *aufgerufene* Makro seinen Rückgabewert in `r`? (Kandidat: eine
LDB-Transfer-Variable / interne Konvention — vom User zu erklären.)

**F12 — `X(...)`-Funktion.** `X` kommt in zwei völlig verschiedenen Formen vor:
- `X(sBuf, "Debug", 1)` – sieht nach Trace/Debug aus.
- `X(v, 0, 0, "P_EDI_NACHRICHT", NACHRICHT_ID, "S")` – sieht nach EDI-Segment-Schreiben aus.
Ist `X` eine Stdlib-Funktion, oder jeweils lokal im Makro definiert? Was macht sie?

**F13 — `set "underscore",0;`.** Was bewirkt diese Compiler-Direktive am Makro-Anfang?
Welche weiteren `set`-Direktiven gibt es?

---

## Organisation / Betrieb

**F14 — `ScriptBesitzer`.** Was bedeuten die Werte (`0` vs. `1`)? System/Standard vs.
Kunde/Mandant? Warum existieren Makros doppelt (gleiche `ScriptId`, Besitzer 0 und 1)?

**F15 — Ausführungskontext.** Woran erkenne ich, ob ein Makro nur in einem bestimmten
Kontext läuft (z. B. `FindKontext("SVPOSI")` = nur im Positionsteil der Belegerfassung)?
Welche Kontexte gibt es? Wie teste ich ein neues Makro am besten?

**F16 — Weitere Makros.** Du wolltest ggf. weitere Makros bereitstellen – aus derselben
DSN (dann lade ich sie automatisch nach) oder als separate Dateien?
