# A.eins Makro — Komplette Sprach- und Bibliotheksreferenz

> **Quellen:** dekompiliert aus `Makrobibliothek.chm` (Sprachkern + klassische Funktionsbibliothek) und `iHilfe.chm` (a1net-.NET-Klassenbibliothek, Namespaces *Makrobibliothek* und *JPP*), Firma **AMIC** (www.amic.de), Stand Aeins 2402.
>
> **Aufbau dieses Dokuments**
> - **Teil I — Sprachreferenz**: Aufbau, Datentypen, Operatoren, Kontrollfluss.
> - **Teil II — Funktionsbibliothek**: alle Standardfunktionen mit Prototyp/Parameter/Ergebnis/Beispiel, nach Themen gruppiert.
> - **Teil III — JPP-Objektframework**: wie man aus einem Makro heraus JPP-Objekte anspricht, plus vollständiger Objektkatalog.
>
> Terminologie: „Makro", „A.eins-Script" und „A.eins-Makro" bezeichnen dieselbe Sprache.

---

# Teil I — Sprachreferenz

## 1. Überblick / Makroverarbeitung

A.eins Makro ist eine **Pascal-artige, interpretierte Skriptsprache**, die in das ERP-System A.eins eingebettet ist. Damit lassen sich „vor Ort" viele Dinge realisieren, die der Standard nicht vorsieht: Datenbankzugriffe, Anlegen/Ändern von Vorgängen (Belegen), FiBu-Export, Druck-/Formularausgaben, Dialoge, Dateioperationen und die Ansteuerung von .NET-Komponenten (JPP).

## 2. Programmaufbau

Ein Makro hat **immer** folgenden Aufbau; die Reihenfolge der Deklarationssektionen ist **strikt** einzuhalten, die Aufrufparameter sind optional:

```pascal
program name( p1; p2; p3; p4 );   // bis zu 4 Aufrufparameter (optional)

const
   // Vereinbarung von Konstanten
type
   // Vereinbarung benutzerdefinierter Datentypen
external
   // Vereinbarung externer (DLL-)Funktionen
var
   // Vereinbarung von Variablen

procedure name( Formalparameter );
   // lokale Vereinbarungen
begin
   // Prozedur-Anweisungen
end;

function name( Formalparameter ) : Datentyp;
   // lokale Vereinbarungen
begin
   // Funktions-Anweisungen
end;

begin
   // Programm-Anweisungen (Hauptteil)
end.        // <-- Punkt am Ende ist Pflicht!
```

- Funktionen und Prozeduren sind **schachtelbar**; maximale Schachtelungstiefe **50**.
- Der Hauptteil endet mit `end.` (Punkt), Prozedur-/Funktionsrümpfe mit `end;` (Semikolon).

## 3. Aufrufparameter

Einem Makro können **bis zu 4** Aufrufparameter übergeben werden. Sie sind **immer vom Typ `string`**.

```pascal
program Beispiel( p1; p2; p3; p4 );
begin
   Print(p1);
   Print(p2);
   Print(p3);
   Print(p4);
end.
```

## 4. Zeichensatz

- ASCII-Zeichensatz. Umlaute (ä, ö, ü, ß) sind in **Bezeichnern nicht erlaubt**.
- **Groß-/Kleinschreibung wird nicht unterschieden** (case-insensitive).
- **Ausnahme:** Bei der Deklaration von Funktionen aus externen Modulen (DLL) **wird** zwischen Groß- und Kleinschreibung unterschieden, da der Funktionsname beim dynamischen Binden in der Modul-Exporttabelle gesucht wird.

## 5. Bezeichner

Namen von Variablen, Konstanten und Funktionen. Beginnen **immer mit einem Buchstaben**. Die Bezeichnerlänge ist nicht begrenzt und hat keinen Einfluss auf die Laufzeit (nur auf die Übersetzungszeit).

## 6. Kommentare

- **Form 1:** Alle Zeichen nach `//` bis zum Zeilenende.
- **Form 2:** Blockkommentar mit `/* … */` **oder** `(* … *)`.

## 7. Datentypen

| Typ | Beschreibung |
|-----|--------------|
| `integer` | ganze Zahl, 32-Bit |
| `short`   | ganze Zahl, 16-Bit — **nur** für Deklarationen externer Funktionen. Intern unterscheidet der Interpreter nicht zwischen `integer` und `short` (beide 32-Bit). |
| `boolean` | logischer Wert `true` / `false` |
| `real`    | Fließkommazahl, 64-Bit (ca. 23 signifikante Dezimalstellen) |
| `char`    | ein Zeichen im ASCII-Code |
| `date`    | Datumsvariable |
| `string`  | **Zeiger** auf eine Zeichenkette |

**Wichtige Hinweise:**
- Der Typ `string` ist — anders als in Pascal — ein **Zeiger** und kein `array[1..256] of char`.
- A.eins Makro unterstützt (Stand dieser Doku) **keine Records**.

## 8. Vereinbarung von Konstanten

```pascal
const
   Bezeichner = konstanter Wert;
   // ...
```

**Besonderheiten:**
- Längere Zeichenketten dürfen über **mehrere Zeilen** verteilt werden: der Übersetzer **verkettet alle aufeinanderfolgenden String-Literale** zu einer einzigen Zeichenkette (praktisch für lange SQL-Befehle).
- Innerhalb von Zeichenketten ist `\` das **Fluchtsymbol**:

| Sequenz | Bedeutung |
|---------|-----------|
| `\n`   | Zeilenvorschub (Zeilenumbruch) |
| `\r`   | Wagenrücklauf |
| `\hh`  | Sonderzeichen, `h` = Sedezimalzahl (0–9, a–f, A–F) |
| `\ooo` | Sonderzeichen, `o` = Oktalzahl (0–7) |
| `\\`   | Backslash (Fluchtsymbol selbst) |

## 9. Vereinbarung von Variablen

```pascal
var
   Bezeichner : Datentyp;
```

## 10. Vereinbarung von externen Funktionen (DLL)

A.eins Makro kann externe Funktionen aus DLLs einbinden und danach wie normale Funktionen aufrufen. Benötigt werden: Modulname (DLL, ggf. mit Pfad), Aufrufkonvention (`stdcall`, `pascal` oder `cdecl`), Parametertypen und Rückgabewert.

```pascal
EXTERNAL
   MODUL "Modulname" BEGIN
      FUNCTION  stdcall|pascal|cdecl Name ( Parameterliste ) : DatenTyp;
      PROCEDURE stdcall|pascal|cdecl Name ( Parameterliste );
   END
```

## 11. Operatoren

Es gilt „Punkt vor Strich". Zuweisung ist `:=`.

| Operator | Erklärung | Beispiel | Priorität |
|----------|-----------|----------|-----------|
| `( )` | Klammern um Ausdrücke | `( 2 + 3 ) * 12` | 10 (höchste) |
| `+` `-` | Vorzeichen | `-3`, `+10.23` | 9 |
| `NOT` | logisches Nicht | `NOT true` | 9 |
| `~` | Einerkomplement (bitweise) | `~a` | 9 |
| `*` `/` `DIV` `MOD` | Multiplikation, Division, Ganzzahl-Div., Modulo | `(2*3/10) MOD 2` | 8 |
| `+` `-` | additive Operatoren | `2 + 3 - 4` | 7 |
| `<<` `>>` | Bitverschiebung links/rechts | `1 << 2`, `128 >> 2` | 6 |
| `<` `>` `<=` `>=` | relationale Operatoren | `3 < x` | 5 |
| `=` `!=` `<>` | gleich / ungleich | `x = y`, `x <> y` | 4 |
| `&` `\|` `^` | bitweise UND / ODER / XOR | `x & 3` | 3 |
| `&&` `AND` `\|\|` `OR` | logisches UND / ODER | `x && y`, `x or y` | 2 |
| `:=` | Zuweisung | `a := 10` | 1 (niedrigste) |

## 12. Schlüsselwörter

Reservierte Bezeichner (nicht als Variablen-, Konstanten- oder Funktionsnamen verwendbar):

```
__cdecl  __pascal  __stdcall  _cdecl  _pascal  _stdcall
and  array  begin  case  cdecl  close
const  create  default  dispose  div  do
downto  else  end  exit  external  false
finalization  for  forward  from  function  goto
if  implementation  in  initialization  interface  label
loop  mod  modul  new  nil  not
of  open  or  pascal  procedure  program
read  readln  record  repeat  seek  set
sizeof  sprintf  stdcall  then  to  traceprintf
true  type  unit  until  uses  var
while  with  write  writeln
```

> Hinweis: Einige Schlüsselwörter (z. B. `case`, `record`, `goto`, `uses`, `unit`, `interface`) stammen aus dem allgemeinen Pascal-Vorrat; nicht alle sind zwingend im Interpreter implementiert (Records werden laut Datentyp-Kapitel nicht unterstützt).

## 13. Anweisungen und Ausdrücke

### Arithmetische Ausdrücke
`Ausdruck Operator Ausdruck`, z. B. `a + 2 - c / 15`, `x + funcname() / 2`.

Für `date` gilt ein **eingeschränkter** Operatorvorrat:
- **Erlaubt:** `<date> + <integer>` (addiert n Tage), `<date> - <date>` (Differenz in Tagen), `<date> rel_op <date>` (alle Vergleiche `= < > <> <= >=`).
- **Nicht erlaubt:** `date + date`, `date * date`, `date / date`, `date mod date`, `date div date`, `integer + date`.

### Einfache Anweisungen
Ein Ausdruck mit nachfolgendem Semikolon: `a := 16;`

### Logische Ausdrücke
`Ausdruck log.Operator Ausdruck` (z. B. `a < b`, `a = b`) oder `unärer log.Operator Ausdruck` (z. B. `NOT b`). Ergebnis ist wahr/falsch.

### Blockanweisung
Mehrere Anweisungen mit `begin … end` zusammenfassen:
```pascal
begin
   a := a * 10;
   b := a / b;
end
```

## 14. Verzweigungen

```pascal
if log.Ausdruck then
   Anweisung;
else
   Anweisung;
```
Beispiel:
```pascal
if i < 10 then begin
   i := 15;
end
else begin
   i := 9;
end
```

## 15. Schleifen

```pascal
for BEZEICHNER := start_wert to|downto endwert do
   Anweisung;

while log.Ausdruck do
   Anweisung;

repeat
   Anweisung          // ACHTUNG: kein Semikolon vor 'until'!
until log.Ausdruck;
```

### Besondere Schleifenkommandos

- **`exit`** — verlässt die umgebende `while`/`repeat`/`for`-Schleife; die Ausführung wird hinter dem Schleifenblock fortgesetzt. (Entspricht `break`.) Nur innerhalb von Schleifen zulässig.
- **`loop`** — springt zum Testausdruck der umgebenden Schleife (nächster Durchlauf). (Entspricht `continue`.) Nur innerhalb von Schleifen zulässig.

```pascal
i := 1;
while i < 10 do begin
   .. mach was (1) ..
   if i > 5 then
      exit;            // verlässt die Schleife
   .. mach was (2) ..  // nur für i <= 5 ausgeführt
end
```

---

# Teil II — Funktionsbibliothek

Alle Standardfunktionen der klassischen A.eins-Makro-Bibliothek, nach Themen gruppiert. Jede Funktion mit **Prototyp**, **Parameter**, **Ergebnis**, **Zweck** und ggf. **Beispiel** (aus der Original-Hilfe uebernommen).

## Datenbankfunktionen


### Commit

```pascal
procedure Commit();
```

Parameter: -/-

Ergebnis:  -/-

Zweck:     Führt ein Datenbank-Commit aus.

### Sql

```pascal
function Sql( sql_anweisung : string ) : integer;
```

Parameter: sql_anweisung ... die auszuführende SQL-Anweisung

Ergebnis:  liefert den SQL-Fehlercode zurück.

Kodierung siehe dbeng50w.hlp der Sybase Dokumentation

Zweck:     Datenbankaktionen ausführen

```pascal
SQL( "update Tabelle_A set Attribut_x = 123 where Attribut_y = 10");
```

### GetCurIdx

```pascal
function GetCurIdx( Name : string ) : integer;
```

Parameter: Name ... der zu untersuchende Cursorname

Ergebnis:  liefert den Index des Cursors

Zweck:     Ermittelt den Cursorindex für schnellen Cursorzugriff über die

ISelect,IFetch,IGet,... Funktionen.

### Umsetzen

```pascal
function Umsetzen( typ:integer; s1,s2:string ) : integer;
```

Parameter: typ ... numerischer Schlüssel in der Umsetztabelle.

s1 .... EingangsWert ( Suchschlüssel )

s2 .... Ergebnispuffer

Ergebnis:  0: Eingangsschlüsselpaar ( typ/s1 ) nicht gefunden

1: s2 enthält die Umschlüsselung

Zweck:     Abbilden von Eingangsschlüssel auf Ausgangsschlüssel.

Diese Funktion liefert zu einem Suchschlüsselpaar (typ/s1) in der

Relation 'ImportUmsetzer' den dazugehörigen Wert in 's2' ab.

Anmerkung: Die Relation 'ImportUmsetzer' kann per Direktsprung 'IMPUM'

gepflegt werden. Es handelt sich um ein einfaches Umschlüsselwerk

auf Zeichenkettenbasis.

### GetDBWert

```pascal
function GetDBWert( s,sql:string ) : integer;
```

Parameter: s ..... Ergebnispuffer

sql ... Select-Ausdruck

Ergebnis:  0 : Attribut oder Cursor nicht vorhanden

Genauere Fehleranalyse über DBError()

1 : der Wert steht in 's' bereit

Liefert in 's' den Attributwert von 'wert' ab.

Zweck:     Einzelne Werte aus Datenbank abrufen

Anmerkung: Im Select-Ausdruck muss der Alias 'wert' benutzt werden!

```pascal
GetDBWert( buf, "select v_id as wert "
```

"  from Vorgangstamm "

" where v_klassnummer=600"

```pascal
"   and v_numnummer=4711");
```

### DBError

```pascal
function DBError() : integer;
```

Parameter: -/-

Ergebnis:  liefert den Fehlercode der letzten Datenbankanweisung.

Zweck:     Fehleranalyse bei Datenbankzugriffen

### DBSetErrorDisplay

```pascal
procedure DBSetErrorDisplay(flag:integer);
```

Parameter: flag ... 0: DB-Fehlermeldungen abschalten

1: DB-Fehlermeldungen wieder anschalten

Ergebnis:  -/-

Zweck:     Fehlermeldungen der Datenbank-Schnittstelle ein oder ausschalten.

### Select

```pascal
function Select( name, sql : string ) : integer;
```

Parameter: name ... frei vergebbarer Cursorname

sql .... die auszuführende Select-Anweisung

Ergebnis:  0: keine Daten gefunden oder Fehler aufgetreten

Genauere Analyse über DBError().

1: Select liefert eine Ergebnismenge

#### Einfaches Beispiel für die Anwendung von 'Select()':

```pascal
r := Select("c", "select * from RelationXYZ" );
if r <> 0 then begin
.. mach was mit dem Ergebnis ..
end
```

#### Auslesen einer Datenbank-Relation in einer Schleife:

```pascal
program rel_read;
const
NEXT_REC = 2;
var
r,count   : integer;
name      : string;
count_buf : string;
begin
name := alloc(50);   // Puffer der Größe 50 Bytes holen
count_buf := "                   ";
count := 0;
r := Select("c", "select * from MeineRelation" );
if r <> 0 then begin
repeat begin
Get("c","Name",name);
MessageBox(name,"gelesener Name",1);
count := count + 1;
end until Fetch("c",NEXT_REC,0) <> 0;
end
IntToStr(count,count_buf);
MessageBox(count_buf,"gelesene Namen",1);
Free( name );
end.
```

### Fetch

```pascal
function Fetch( cursor : string; action,position : integer ) : integer;
```

Parameter: cursor ... der im Select benutzte Cursorname

action ... steuert das Verhalten von Fetch

OD_NEXT     = 2   den nächsten Datensatz          (position=0)

OD_PRIOR    = 3   den vorhergehenden Datensatz    (position=0)

OD_FIRST    = 4   der 1. Datensatz im Cursor       (position=0)

OD_LAST     = 5   den letzten Datensatz im Cursor (position=0)

OD_ABSOLUTE = 6   den x. Datensatz im Cursor, Offset in position

OD_RELATIVE = 7   relativ zum aktuellen Datensatz, Offset in

position je nach action-Wert

Ergebnis:  0 : keine Daten übertragen

1 : die gewünschte Aktion lieferte Daten

Zweck:     Navigation innerhalb einer Ergebnismenge (Cursor).

```pascal
für die Anwendung der Funktion Fetch()
```

### Get

```pascal
function Get( cursor,attribut,buf : string ) : integer;
```

Parameter: cursor .... der im Select benutzte Cursorname

attribut .. der auszulesende Attributwert

buf ....... der Ergebnispuffer

Ergebnis:  0 : Attribut oder Cursor nicht vorhanden

Genauere Fehleranalyse über DBError()

1 : der Wert steht in buf bereit

Zweck:     Auslesen einzelner Datensätze aus Datenbank-Cursorn.

Anmerkung: Der Ergebnispuffer muss genügend groß gewählt werden.

Maßgeblich ist die Länge des Attributes wie in der Datenbankrelation

festgelegt! Ist ein Relationsattribut z.B. als char(255)

definiert, so muss 'buf' mind. 256 Zeichen aufnehmen können.

Andernfalls ist das Programmverhalten undefiniert, kann sogar

zum Systemabsturz führen!

### Put

```pascal
function Put( cursor,attribut,value : string) : integer;
```

Parameter: cursor .... der im Select/InitRecord benutzte Cursorname

attribut .. das zu setzende Attribut

value ..... Attributwert

Ergebnis:  0: Cursor oder Attributname nicht gefunden

1: ok

Zweck:     Relationsattribute setzen.

Anmerkung: Die Werte werden erst durch den Funktionsaufruf Insert(cursor)

in die Datenbank übernommen! Für jeden Attributwerrt ist

also ein eigener Datenpuffer nötig.

Folgender Code ist falsch!

==========================

```pascal
program test
```

var

```pascal
t : string;
begin
t := alloc(100);
InitRecord("c","Tabelle");
strcpy(t,"1");
put("c","Attrib1",t);
strcpy(t,"2");
put("c","Attrib2",t);    // hier wird der selbe Datenpuffer 't' benutzt!
Insert("c");
free(t);
end.
```

Attrib1 & Attrib2 erhalten hier BEIDE den Wert '2' !

so ist es richtig:

==================

```pascal
program test
```

var

```pascal
t1,t2 : string;
begin
t1 := alloc(100);
t2 := alloc(100);
InitRecord("c","Tabelle");
strcpy(t1,"1");
put("c","Attrib1",t1);
strcpy(t2,"2");
put("c","Attrib2",t2);
Insert("c");
free(t);
end.
```

### InitRecord

```pascal
function InitRecord( cursor, rel : string ) : integer;
```

Parameter: cursor ... frei zu vergebener Name

rel ...... Name der Relation

Ergebnis:  0: Fehler

1: ok

Zweck:     Diese Funktion dient der Vorbereitung einer Insert-Operation.

Sie erzeugt einen leeren Datensatz für eine gegebene Relation

#### Beispiel für Insert/InitRecord/Put

```pascal
InitRecord ("c", "RelationXYZ" );         // leerer Datensatz
Put        ("c", "Attribut1", "wert" );   // einen Wert füllen
Insert     ("c");                         // das Ganze einfügen
CloseCursor("c");                         // Cursor schließen nicht vergessen
```

### Insert

```pascal
function Insert( cursor : string ):integer;
```

Parameter: cursor ... Cursorname wie in InitRecord() benutzt

Ergebnis:  0: Datensatz konnte nicht eingefügt werden.

1: ok

Zweck:     Die Funktion fügt einen Datensatz in die Datenbank ein.

### Delete

```pascal
function Delete( cursor : string ) : integer;
```

Parameter: cursor ... Cursorname

Ergebnis:  0: Fehler

1: ok

Zweck:     Den aktuellen Datensatz im Cursor löschen.

### Lock

```pascal
function Lock( cursor : string ) : integer;
```

Parameter: cursor ... Cursorname

Ergebnis:  0: Fehler

1: ok

Zweck:     Den aktuellen Datensatz im Cursor sperren.

#### Beispiel für Select/Lock/Put/Update

```pascal
Select     ("c", "select Attribut1 from RelationXYZ" );   // auswählen
Lock       ("c");                                         // sperren
Put        ("c", "Attribut1", "Wert" );                   // zuweisen
Update     ("c");                                         // übernehmen
CloseCursor("c");
```

### Update

```pascal
function Update( cursor : string ) : integer;
```

Parameter: cursor ... Name des Cursors wie in Select benutzt

Ergebnis:  0: Fehler

1: ok

Zweck:     Änderungen am aktuellen Datensatz in die Datenbank übertragen.

### CloseCursor

```pascal
function CloseCursor( cursor : string ): integer;
```

Parameter: cursor ... Name des zu schließenden Cursors

Ergebnis:  0 : Fehler

1 : ok

Zweck:     Ressourcen des Cursor freigeben.

## Zugriff auf SQL- Texte


### SQLTCreate

```pascal
function SQLTCreatePriv(name:string;cond:integer):integer;
```

```pascal
function SQLTCreateAmic(name:string;cond:integer):integer;
```

Parameter: name ... der gewünschte private SQL-Text (SQLK)

cond ... Flag 0: Variablen des Auswahlbereichs nicht übernehmen

1: Variablen übernehmen

Ergebnis:  liefert ein Handle auf den SQL-Text

Zweck:     Auflösen eines SQL-Text Namen und dessen SQL-Anweisung

durchführen.

Anmerkung: SQLTCreatePriv löst SQLK-Anweisungen auf, SQLTCreateAmic

benutzt die System-SQL-Texte.

Wird diese Funktion innerhalb einer Auswahllisten-Umgebung

benutzt und das Flag 'cond' auf 1 gesetzt, dann werden alle

Werte des aktuellen Auswahlbereichs mit übernommen. Der SQLK

Ausdruck kann also z.B. ':VON[1]' benutzen.

### SQLTDelete

```pascal
procedure SQLTDelete(hdl:integer);
```

Parameter: hdl ... Handle des zu löschenden SQL-Textes

Zweck:     Resourcenfreigabe eines SQL-Textes

Für 'hdl' ist der Rückgabewert der Funktionen

SQLTCreateAmic' oder 'SQLTCreatePriv' anzugeben.

### SQLTFieldCount

```pascal
function SQLTFieldCount(hdl:integer):integer;
```

Parameter: hdl ... Handle des SQL-Textes

Ergebnis:  liefert die Menge der Cursor-Attribute

### SQLTHdrName

```pascal
function SQLTHdrName(hdl,pos:integer;str:string;len:integer):integer;
```

Parameter: hdl ... Handle des SQL-Textes

pos ... Rückgabewert des letzten Aufrufs von SQLTHdrName()

str ... Ergebnispuffer

len ... und dessen Länge

Ergebnis:  liefert ein Handle auf den intern benutzten Iterator

Zweck:     Die Namen der Ergebnisspalten auslesen.

Anmerkung: Der Rückgabewert MUß dem nächsten Funktionsaufruf wieder übergeben werden.

Liefert die Funktion NULL, dann ist die Iteration abgeschlossen.

Beim ersten Aufruf MUß 'pos' den Wert NULL enthalten

### SQLTData

```pascal
function SQLTData(hdl,pos:integer;str:string;len:integer):integer;
```

Parameter: hdl ... Handle des SQL-Textes

pos ... Rückgabewert des letzten Aufrufs von SQLTData()

str ... Ergebnispuffer

len ... und dessen Länge

Ergebnis:  liefert ein Handle auf den intern benutzten Iterator

Zweck:     Die Daten des aktuellen Records auslesen.

Anmerkung: Der Rückgabewert MUß dem nächsten Funktionsaufruf wieder übergeben werden.

Liefert die Funktion NULL, dann ist die Iteration abgeschlossen.

Beim ersten Aufruf MUß 'pos' den Wert NULL enthalten

### SQLTNext

```pascal
function SQLTNext(hdl:integer):integer;
```

Parameter: hdl ... Handle des SQL-Textes

Ergebnis:  1 : es sind gültige Werte im Cursor

0 : keine weiteren Daten

Zweck:     Einlesen des nächsten Datensatzes

### SQLTStatement

```pascal
function SQLTStatement(hdl:integer;str:string;len:integer):integer;
```

Parameter: hdl ... Handle des SQL-Textes

str ... Ergebnispuffer

len ... und dessen Länge

Ergebnis:  liefert die expandierte SQL-Anweisung

### SQLTFieldType

```pascal
function SQLTFieldType(hdl:integer):integer;
```

Parameter: hdl ..... Handle des zu untersuchenden Feldes

Ergebnis:  ft_undef   = 0

ft_short   = 1

ft_long    = 2

ft_real    = 3

ft_string  = 4

ft_vstring = 5

ft_datum   = 6

ft_uhr     = 7

Anmerkung: Im Parameter hdl ist der Rückgabewert der Funktion SQLTData()

zu übergeben.

Daten holen und den Typ bestimmen:

...

```pascal
hdl := SQLTData(handle,hdl,buf,512);
if hdl <> 0 then begin
typ := SQLTFieldType(res);
```

...

```pascal
end
```

### Dos2Win

```pascal
function Dos2Win(rel,des : string; dir : integer) : integer;
```

Parameter: rel ... der Relationsname

des ... Dateipfad mit Ersetzungsliste, z.B.: ..\\bin\\umlaut.txt

dir ... 1: DOS nach Windows; 0: Windows -> DOS

Zweck:     Umwandeln von Zeichensätzen in Datenbank-Relationen

```pascal
Dos2Win("MyTable","..\\bin\\umlaut.txt",1);
```

## sonstiges


### ExcelRange

```pascal
procedure ExcelRange(buf : string; x1,y1,x2,y2 : integer);
```

Parameter: buf ..... Ergebnispuffer

x1,y1 ... Koordinate 1

x2,y2 ... Koordinate 2

Zweck:     Aus Koordinaten Zeile/Spalte einen Excel-Range-Ausruck

erzeugen.

z.B. 1,1,2,2 -> "A1:B2"

## FiBu Interface

Grundsätzlicher Programmaufbau/Programmschritte:

1. FiBu-Schnittstelle initialisieren

Hierfür reicht ein einmaliger Aufruf der Funktion FiBuInit.

2. FiBu-Schnittstelle konfigurieren

Es gilt hier zwischen Standard-Parametern und optionalen Parametern der

FiBu-Belege zu unterscheiden. Sollen neben den Standard-Parametern auch

andere Werte übergeben werden, so muss die Schnittstelle hierfür

Konfiguriert werden. siehe FiBuConf()

3. FiBu-Übernahme starten

Sind die Schritte 1 + 2 beendet, so kann jetzt die Einrichtung der

FiBu-Schnittstelle abgeschlossen werden. Dazu ist ein Aufruf der Prozedur

FiBuStart() nötig.

4. FiBu-Belege erzeugen

Zum Erzeugen von Belegen sind die drei Funktionen FiBuNew

( neuen Beleg beginnen ), FiBuSetVal (Werte in die Schnittstelle schreiben )

und FiBuAdd ( die Werte in die FiBu übernehmen ) nacheinander aufzurufen.

5. Fibu-Schnittstelle schließen

An Programmende sollte die Schnittstelle mittels FiBuEnd() wieder geschlossen

werden, damit auch der letzte noch in der Schnittstelle stehende Datensatz

übernommen wird.

Die Standard-Parameter sind immer in der Schnittstelle konfiguriert.

Sollen Parameter aus den folgenden Gruppen übergeben werden, so ist hierfür zunächst die

FiBu-Schnittstelle mittels  FiBuConf() einzurichten.


### Beispielprogramm für die FiBu-Schnittstelle

```pascal
program fibu_ex;
const  ID_SteuerKlasse        = 12;
ID_FiBuV_Klasse        =  0;
begin
// Initialisierung der FiBu-Schnittstelle
FiBuInit();
// Jetzt noch die Steuerklasse zusätzlich zu
// den Standard-Parametern einrichten:
FiBuConf(ID_SteuerKlasse);
// Initialisierung abschließen
FiBuStart();
// einen neuen Beleg anfangen
FiBuNew();
// Werte für den Beleg setzen
FiBuSetVal(ID_FiBuV_Klasse,"1");
..usw. mit den anderen Werten..
// Werte in die FiBu übernehmen
FiBuAdd();
// FiBu-Schnittstelle schließen
FiBuEnd();
end.
```

## Standard-Parameter

**FiBuV_Klasse**

Anmerkung zum Soll/Habenkennzeichen:

1 Zahlung,

2 Ausgangsrechnung,     FiBuVP_SollHaben=2 setzen!

3 Ausgangsgutschrift,   FiBuVP_SollHaben=1 setzen!

4 Eingangsrechnung,     FiBuVP_SollHaben=1 setzen!

5 Eingangsgutschrift,   FiBuVP_SollHaben=2 setzen!

6 sonstige Belege,

13 Eingangsrechnung und Gutschrift gemischt,

14 Ausgangsrechnung und Gutschrift gemischt,

Ist die Klasse mit 2,3 oder. 4,5 angegeben, so wird trotzdem

noch einmal anhand des Sollhabenkennzeichen geprüft, ob es sich um

eine Gutschrift oder eine Rechnung handelt.

**Hauptkonto, Gegenkonto**

Die angegebenen Konten müssen im System als Konto

( Sach- bzw. Personenkonto) existieren.

**FiBuVP_Betrag**

Betrag des Beleges oder der einzelnen Position.

**FiBuVP_SollHaben**

Sollhabenkennzeichen. Ändert es sich bei Rechnungen

bzw. Gutschriften innerhalb eines Beleges, wird automatisch ein

Folgebeleg mit der selben Belegnummer erstellt, der dann die

entsprechende Klasse besitzt. Alle bis dahin verarbeiteten Belege

werden als Verarbeitete gekennzeichnet.

**FiBuV_Datum**

das Belegdatum.

**FiBuV_NumNummer**

Eindeutige numerische Zuordnung zu einem Beleg. Hiermit wird

gekennzeichnet, zu welchem Beleg eine Position gehören.

**FiBuV_Herktyp**

Dieser Wert gibt die Herkunft der Belege an. Für die FiBu-Schnittstelle

innerhalb der Script-Verarbeitung sind hier nur die Werte im

Bereich [40 .. 49] zulässig. Standardwert ist 40.


## Parameter mit Standard-Vorbelegungen

**BedieneridNeu**

Wird mit der Bedienerid des Benutzers vorbelegt, der diesen

Auftrag gestartet hat.

**FiBuV_ErfDatum**

Das Erfassungsdatum wird mit dem Tagesdatum vorbelegt.

**JahrNummer, PeriNummer**

Ist JahrNummer nicht im View vorhanden, so wird die Periode

zu dem aktuellen Belegdatum (FiBuV_Datum) herangezogen.

Diese Periode muss offen sein ansonsten wird der Beleg abgewiesen.

Ist Jahrnummer vorhanden, muss auch die PeriNummer im View

vorhanden sein.

**SteuerKlasse**

Wenn das Feld SteuerKlasse nicht im View eingetragen ist,

wird die SteuerKlasse entsprechend der Vorbelegung aus

dem Sachkontenstamm eingetragen.

**SteuerSchluessel**

Wenn das Feld SteuerSchluessel nicht im View eingetragen ist,

wird der SteuerSchluessel entsprechend der Vorbelegung aus

dem Sachkontenstamm eingetragen.

**KostStelNummer**

Wenn das Feld KostStelNummer nicht im View eingetragen ist,

wird die Vorbelegung aus dem  Sachkontenstamm eingetragen.

**FiBuVP_SteuSatz**

Steuersatz. Existiert diese Feld nicht im View, wird es aus

dem entsprechendem SteuerSatz gelesen.

**KontoNummerSte**

SteuerKonto. Existiert diese Feld nicht im View, wird es aus

dem entsprechendem SteuerSatz gelesen.

**KontoNummerSko**

SkontoKonto. Existiert diese Feld nicht im View, wird es aus

dem entsprechendem SteuerSatz gelesen.

**FiBuVP_SteuWert**

SteuerBetrag. Existiert diese Feld nicht im View, wird der

Betrag entsprechend des Satzes berechnet.

**ZahlBedNummer**

Nummer der Zahlungsbedingung. Vorbelegung aus dem Kundenstamm

für FiBuVorgangsKlassen 2 bis 5. Wird nicht ausgewertet.

**FiBuVP_SkoDatum**

ist FiBuVP_ValDatum wenn nicht anders eingetragen. Wird laut

Zahlungsbedingung hoch gerechnet, falls

eine Gültige Zahlungsbedingung angegeben wurde.

**FiBuVP_SkoSatz**

existiert eine gültige Zahlungsbedingung, wird der Skontosatz,

falls nicht anders angegeben, aus dieser  gelesen

**FiBuVP_SkoBetrag**

existiert ein gültiger Skontosatz, wird der Skonto, falls

nicht direkt angegeben, aus diesem errechnet.


## Parameter mit Vorbelegungen aus dem  Datenbestand der Datenbank

**Parameter mit Vorbelegungen aus dem 
Datenbestand der Datenbank**

**SteuerGrNummer**

SteuerGruppe aus dem Kundenstamm.

**SteuerAbDatum, SteuerKlNetKennz, SteuerFormel**

Werden aus dem Steuersatz gelesen, der sich aus Klasse,

Gruppe und Schlüssel ergibt. Wird dieser Steuersatz nicht

im A.eins- System gefunden,  wird dieser Beleg abgewiesen.

Das NettoKennzeichen dient dazu, um erkennen zu können ob

es sich bei dem Betrag um einen Netto oder einen Bruttobetrag handelt.

**FiBuVP_Text der SteuerPosition**

Falls eine SteuerPosition geschrieben wird, wird der Text mit

der Steuerschlüsselbezeichnung belegt.


## sonstige Parameter

**FiBuV_FremdNr**

Nummer des Fremdbeleges (bei Eingangs Rechnungen bzw. Gutschriften).

**FiBuVP_Text**

Ein beliebiger Text.

**FiBuVP_HauptText**

Ein beliebiger Text.

**Waehrnummer**

Nummer der Währung, wie im Währungsstamm hinterlegt. Ist

standardmäßig 0 und wird noch nicht ausgewertet.


### Kennzahlen für die FiBu-Schnittstelle.

```pascal
ID_FiBuV_Klasse          = 0;  ID_KontoNummerSte       = 16;
ID_HauptKonto              = 1;  ID_KontoNummerSko      = 17;
ID_GegenKonto             = 2;  ID_FiBuVP_SteuWert         18;
ID_FiBuVP_Betrag         = 3;  ID_ZahlBedNummer       =  19;
ID_FiBuVP_SollHaben   = 4;  ID_FiBuVP_SkoDatum    = 20;
ID_FiBuV_Datum            = 5;  ID_FiBuVP_SkoSatz       = 21;
ID_FiBuV_NumNummer = 6;  ID_FiBuVP_SkoBetrag    = 22;
ID_FiBuV_Herktyp          =  7;  ID_SteuerGrNummer           = 23;
ID_BedieneridNeu          =  8;  ID_SteuerAbDatum              = 24;
ID_FiBuV_ErfDatum       =  9;  ID_SteuerKlNetKennz          = 25;
ID_JahrNummer             = 10; ID_SteuerFormel                  = 26;
ID_PeriNummer              = 11; ID_FiBuV_FremdNr              = 27;
ID_SteuerKlasse             = 12; ID_Waehrnummer                = 28;
ID_SteuerSchluessel      = 13; ID_ID_FiBuVP_AuszKennz  = 29;
ID_KostStelNummer       = 14; ID_FiBuVP_Text                  = 30;
ID_FiBuVP_SteuSatz     = 15;  ID_FiBuVP_HauptText    = 31;
```

Die Kennzahlen werden in Verbindung mit den Funktionen FiBuConf und FiBuSetVal benötigt.

Sie geben das zu manipulierende FiBu-Merkmal an.

ACHTUNG:

Bei Brutto-Buchungen KEINEN Steuerwert mit übergeben!

### FiBuInit

```pascal
function FibuInit():integer
```

Parameter: -/-

Ergebnis:  0: Fehler beim Initialisieren

1: ok

Zweck:     Initialisieren der Fibu-Schnittstelle.

### FiBuConf

```pascal
function FiBuConf( id : integer ) : integer;
```

Parameter: id ... ID des zu konfigurierenden Merkmals

Ergebnis:  0: Fehler

1: ok

Zweck:     Der Schnittstelle weitere Merkmale hinzufügen.

Anmerkung: Beispielprogramm

Parameter mit Standard-Vorbelegungen

Parameter mit Vorbelegungen aus dem Datenbestand der Datenbank

sonstige Parameter

siehe auch Kennzahlen für die FiBu-Schnittstelle.

### FiBuConfStr

```pascal
function  FiBuConfStr( param, datentyp : string ) : integer;
```

Parameter: param ...... Schnittstellenparameter

datentyp ... Datentyp des Schnittstellenparameters

I..........Integer-Parameter

S..........SmallInt

N..........Numeric

D..........Date

C..........char(100)  Achtung: großes 'C'

c..........char(20)   Achtung: kleines 'c'

Ergebnis:  0: Fehler

1: ok

Zweck: Mit dieser Funktionen können zu den immer vorhandenen

Standard-Parameter der Schnittstelle noch optionale

Werte eingerichtet werden. Dies muss nach dem Aufruf der

Funktion FiBuInit und vor der Funktion FiBuStart geschehen!

Anders als bei der Funktion FiBuConf werden hier die

Schnittstellenparameter nicht über ihre Kennzahlen sondern

über ihren Namen konfiguriert.

### FiBuStart

```pascal
procedure FiBuStart();
```

Parameter: -/-

Ergebnis:  -/-

Zweck:     Die Einrichtung der FiBu-Schnittstelle wird mit dieser

Funktion abgeschlossen. Nach dem Aufruf ist die

FiBu-Schnittstelle bereit Daten zu übernehmen.

### FiBuAdd

```pascal
function FiBuAdd() : integer;
```

Parameter: -/-

Ergebnis:  -1  Schnittstelle ist nicht Konfiguriert - FiBuStart() aufrufen!

0  die Übernahme der Daten ist einwandfrei verlaufen

>0  bei der Datenübernahme sind Fehler aufgetreten

Zweck:     Mit dieser Funktionen werden die per FiBuSetVal übergebenen Daten in die FiBu übernommen.

### FiBuSetValStr

```pascal
function FiBuSetValSt( name, value : string ) : integer;
```

Parameter: name ... Bezeichnung des Parameters

value .. der zu übernehmende Wert

Ergebnis:  0 : Daten konnten nicht übernommen werden

1 : ok, Daten sind übernommen

Zweck:     Parameterübergabe an die Fibu-Schnittstelle.

Anmerkung: Parameternamen siehe:

Parameter mit Standard-Vorbelegungen

Parameter mit Vorbelegungen aus dem Datenbestand der Datenbank

sonstige Parameter

### FiBuSetVal

```pascal
function  FiBuSetVal(f:integer; value:string  ) : integer
```

Parameter: f ....... Kennzahl des Parameters

value ... zu übernehmender Wert für diesen Parameter

Ergebnis:  0 : Daten konnten nicht übernommen werden

1 : ok, Daten sind übernommen

Zweck:     Parameterübergabe an die Fibu-Schnittstelle. mittels Kennzahlen.

Anmerkung: siehe auch Kennzahlen für die FiBu-Schnittstelle

### FiBuNew

```pascal
procedure FiBuNew();
```

Parameter: -/-

Ergebnis:  -/-

Zweck:     Diese Funktion erzeugt einen Belegwechsel.

### FiBuEnd

```pascal
procedure FiBuEnd();
```

Parameter: -/-

Ergebnis:  -/-

Zweck: Diese Funktion beendet die Schnittstellen-Komunikation.

Will man neue Belege einlesen, so muss diese zunächst wieder

neu Konfiguriert werden.

### FiBuNoAZK

```pascal
procedure FiBuNoAZK();
```

Parameter: -/-

Ergebnis:  -/-

Zweck: Teilt der Schnittstelle mit, dass die jetzt folgenden Datensätze kein Auszifferungskennzeichen erhalten sollen.

### FiBuNewAZK

```pascal
procedure FiBuNewAZK();
```

Parameter: -/-

Ergebnis:  -/-

Zweck: Die Funktion fordert von der FiBu-Schnittstelle ein neues Auszifferungskennzeichen an. Dies AZK gilt für alle folgenden Datensätze bis entweder ein erneuter FiBuNewAZK-Aufruf erfolgt, oder die Auszifferung mit FiBuNoAZK() beendet wird.

## Benutzerschnittstelle


### Print

```pascal
procedure Print( s : string );
```

Parameter: s ... der auszugebende Text

Ergebnis:  -/-

Zweck:     Textausgabe in der Makro-Maske

### Clear

```pascal
procedure Clear();
```

Parameter: -/-

Ergebnis:  -/-

Zweck:     löscht das Ausgabefeld der Makromaske

### StatusZeile

```pascal
procedure StatusZeile( text : string );
```

Parameter: text ... der auf der Statuszeile anzuzeigende Text.

Ergebnis:  -/-

Zweck:     Textausgabe auf der Statuszeile.

### WaitCursor

```pascal
procedure WaitCursor( b : boolean );
```

Parameter: b ... Status

false : Stundenglas ausschalten

true  : Stundenglas einschalten

Ergebnis:  -/-

Zweck:     Setzt das Stundenglas-Icon als Mousecursor.

### InputBox

```pascal
function InputBox ( titel,text,buffer :string; len:integer ) : integer
```

Parameter: title ... Titel der Input-Box

text ... der Text innerhalb der Input-Box

buffer. Puffer zur Aufnahme der Eingabe

len ..... Länge des Eingabepuffers

Ergebnis:  1: Eingabedialog wurde durch OK beendet

2: durch ABBRUCH beendet

Zweck:     Mit dieser Funktion können Eingaben vom Benutzer abgefragt werden.

Anmerkung: Beispielprogramm

### MakroScreen

```pascal
procedure MakroScreen();
```

Parameter: -/-

Ergebnis:  -/-

Zweck:     Anzeigen der Makromaske

Anmerkung: Wird ein Makro nicht über den Direktsprung 'Makro'

gestartet, so fehlt die Ausgabemöglichkeit für

```pascal
Print(),SetComment(), SetComment2(), ...
```

Mit dieser Funktion wird eine Ersatzmaske zur Anzeige

gebracht, auf der die Ausgaben erfolgen können.

### SelectDlg

```pascal
function SelectDlg( titel,text:string ; sel:integer; bezeich:string ) : integer;
```

Parameter: title ... Titel des Auswahl-Dialogs

text .... Der Text innerhalb des Auswahl-Dialogs angezeigt wird

sel ..... Welcher soll zu erst angewählt sein?

bezeich . Bezeichnungen der Auswahlmöglichkeiten

Format:

Bezeichnung1>Bezeichnung2>...>Bezeichnung8

Ergebnis:  Nummer der ausgewählten Möglichkeit.

Zweck:     Mit der Funktion wird ein Auswahl-Dialog angezeigt,

in dem der Benutzer eine 1 aus 8 Auswahl treffen kann.

#### Beispiel für InputBox, SelectDlg und CheckDlg

```pascal
program DialogTest;
var
buf     : string;
hlp     : string;
i,k,m   : integer;
begin
//--einfaches Eingabefeld--
buf:=alloc(1024);
hlp:=alloc(128);
inputbox("Titel","Text",buf,10);
MessageBox(buf,"Ergebnis",1);
//--Auswahl aus bis zu 1 aus 8 Möglichkeiten--
i := SelectDlg( "titel", "text", 4, "Zeile1>Zeile2>Zeile3>Zeile4" );
sprintf(buf,"Es wurde %d. gewählt",i);
MessageBox(buf,"Ergebnis",1);
//--Anwahl von bis zu 8 Möglichkeiten--
i := CheckDlg( "titel", "text", 4, "Zeile1>0>Zeile2>1>Zeile3>1>Zeile4>0" );
m := 1;
strcpy(buf, "");
for k:= 1 to 4 do begin
if  (i & m) <> 0 then begin
sprintf(hlp,"Zeile %d ist gewählt\n",k);
end
else begin
sprintf(hlp,"Zeile %d ist nicht gewählt\n",k);
end
strcat(buf,hlp);
m := m << 1;
end
MessageBox(buf,"Ergebnis",1);
free(buf);
free(hlp);
end.
```

### CheckDlg

```pascal
function CheckDlg( titel,text:string ; anzahl:integer; bezeich_state:string ) : integer;
```

Parameter: title ..........       Titel des Auswahl-Dialogs

text ...........       Der Text innerhalb des Auswahl-Dialogs angezeigt wird

anzahl .....      ..Menge der Auswahlmöglichkeiten (max = 8)

bezeich_state .Bezeichnungen der Auswahlmöglichkeiten und dessen

Status

Format:

Bezeichnung1>Status1>Bezeichnung2>Status2>...>Bezeichnung8>Status8

Ergebnis: Die Funktion liefert ein Bitfeld mit den Stati der Auswahlmöglichkeiten. Bit 0 korrespondiert mit der 1. Auswahlmöglichkeit, usw. (siehe Beispielprogramm)

Zweck: Mit der Funktion wird ein Auswahl-Dialog angezeigt, in dem der Benutzer bis zu 8 Eigenschaften auswählen kann.

### StdErr / StdOut

```pascal
procedure StdErr( text : string );
```

```pascal
procedure StdOut( text : string );
```

Parameter: text .... der Ausgabetext in den DOS IO-Kanal

Ergebnis:  -/-

Zweck: Die Prozeduren dienen der Ausgabe vom Meldungen auf den DOS Standard-Kanälen stdout bzw. stderr.

### MessageBox, WMessageBox

```pascal
function MessageBox ( text:string, titel:string, mode:integer ) : integer
```

```pascal
function WMessageBox( text:string, titel:string, mode:integer ) : integer
```

Parameter: text .... der Text innerhalb der Meldungs-Box

title ... Titel der Meldungs-Box

mode .... für MessageBox:

1:Es wird eine Meldung mit einem OK--Schalter angezeigt

2:Die Meldung enthält einen OK- und Cancel-Schalter

3:Die Meldung enthält einen Retry- und Cancel-Schalter

4:Die Meldung enthält einen Yes-,No und Cancel-Schalter

für WMessageBox:

siehe Windows-SDK

Ergebnis:  Der Rückgabewert entspricht dem gedrückten Schalter der Meldungsbox

gedrückter Schalter     Rückgabewert

OK                      1

Cancel                2

Retry                   4

Yes                     6

No                      7

Zweck: Die Funktion dient der Ausgabe vom Meldungen auf dem Bildschirm und liefert den vom Benutzer gedrückten Schalter der Meldungsbox zurück.

## Fehlerprotokoll


### SetFehlpBereich

```pascal
procedure SetFehlpBereich( b : string );
```

Parameter: b ... Bereichsname für Fehlerprotokoll-Ausgaben

Ergebnis:  -/-

### FehlerProtokoll

_(Beispiel/Inhalt in der Original-Hilfe nur als Screenshot vorhanden.)_

### SetCounter

```pascal
procedure SetCounter( w : integer );
```

Parameter: w ... anzuzeigender Wert

Ergebnis:  -/-

Zweck:     Counter-Feld auf der 'Makro-ausführen' Maske setzen

### SetRCounter

```pascal
procedure SetRCounter( w : integer );
```

Parameter: w ... anzuzeigender Wert

Ergebnis:  -/-

Zweck: Datensatzzähler-Feld auf der 'Makro-ausführen' Maske setzen

### SetFunctionMethod

```pascal
procedure SetFunctionMethod( s : string );
```

Parameter: s ... der anzuzeigende Funktionsname

Ergebnis:  -/-

Zweck:     Anzeigen des Funktionsnamen auf der Makro-Maske

### SetComment

```pascal
procedure SetComment( s : string );
```

Parameter: s ... der anzuzeigende Kommentar

Ergebnis:  -/-

Zweck:     Kommentar auf der 'Makro-ausführen' Maske ausgeben.

### SetComment2

```pascal
procedure SetComment2( s : string );
```

Parameter: s ... der anzuzeigende Kommentar

Ergebnis:  -/-

Zweck: Kommentar Zeile2 auf der 'Makro-ausführen' Maske ausgeben.

## DBX - Interface


### dbx_import

```pascal
procedure dbx_import( dateiname,count : string );
```

Parameter: dateiname .die zu verarbeitende SQL-Datei

count .... ... Verarbeitungsmenge

Ergebnis:  -/-

Zweck: Importe im ASQL-Format erledigen

### dbx_ident

```pascal
function dbx_ident( rel,buf:string):integer
```

Parameter: rel ... Name der Relation, für die die nächste Ident geholt werden soll

buf .. Puffer für das Ergebnis in ASCII-Darstellung.

Ergebnis:  Liefert die nächste Ident für einen Eintrag in 'rel' als Integer-Wert.

buf' enthält der Identwert zusätzlich auch als String.

Zweck:     Schlüssel für Datenbankrelationen mehrplatzfähig erzeugen.

```pascal
für dbx_ident:
program dbx_ident_ex;
```

var

```pascal
buf : string;
id  : integer;
begin
buf := alloc(50);
```

...

```pascal
id := dbx_ident("tabellen_name", buf );
MessageBox(buf,"die nächste ID:",1);
```

...

```pascal
free(buf);
end.
```

## JAM-Schnittstelle

WARNUNG:

Diese Funktionen haben mitunter starke Nebenwirkungen und dürfen nur von geschulten Mitarbeitern eingesetzt werden.

Zusätzlich zu den hier aufgeführten Funktionen/Prozeduren sind auch

alle JAM-Funclist Funktionen aufrufbar. Parameteranzahl und Typ wie

in der Funclist beschrieben.

Dokumentation der Funktionen: siehe Entwicklerdoku/Funclist


### SetJAMField

```pascal
procedure SetJAMField( field,text:string );
```

Parameter: field ... der Maskenfeld-Name

text ... der zu setzende Inhalt

Ergebnis:  -/-

Zweck: Füllt ein Maskenarray mit einem Text.

### SetJAMArray

```pascal
procedure SetJAMArray( field,text:string; pos:integer );
```

Parameter: field ... der Maskenfeld-Name

text .... der zu setzende Inhalt

pos ..... die zu füllende Arrayzeile

Ergebnis:  -/-

Zweck:     Füllt ein Maskenarray mit einem Text.

### ScrollJAMArray

```pascal
procedure ScrollJAMArray( field:string; pos:integer );
```

Parameter: field .. der Maskenfeld-Name

pos ... Nummer der obersten Zeile

Ergebnis:  -/-

Zweck: Ein Maskenarray scrollen.

### SetLDBArray

```pascal
procedure SetLDBArray(name:string;idx:integer;value:string);
```

Parameter: name ... Name des LDB-Arrays

idx ....    Index des zu ändernden Eintrages im Array

value .   zu setzender Wert

Ergebnis:  -/-

Zweck:     LDB-Variablen ändern

### SetLDB

```pascal
procedure SetLDB(name,value:string);
```

Parameter: name ... Name der LDB-Variablen

value .. zu setzender Wert

Ergebnis:  -/-

Zweck:     LDB-Variablen ändern

### GetLDB

```pascal
procedure GetLDB(name,buf:string);
```

Parameter: name ... Name der abzufragenden LDB-Variablen

buf .... Ergebnispuffer

Ergebnis:  -/-

Zweck:     Auslesen von LDB-Variablen

### GetLDBArray

```pascal
procedure GetLDBArray(name:string;idx:integer;buf:string);
```

Parameter: name ... Name der abzufragenden LDB-Variablen

idx ....    Index im Array

buf ....   Ergebnispuffer

Ergebnis:  -/-

Zweck:     Auslesen von LDB-Variablen

### smx_call

```pascal
function smx_call(p1,p2,p3,p4:string):integer;
```

Parameter: p1..p4 siehe smx_call-Dokumentation

Ergebnis:  je nach Funktion

Zweck:     smx_call-Interface

### JplCall

```pascal
procedure JplCall( s:string );
```

Parameter: s ... JPL-Anweisung

Ergebnis:  -/-

Zweck:     JPL-Procedur ausführen

### CtrlString

```pascal
procedure CtrlString( s : string );
```

Parameter: s ... der auszuführende JPL-Controlstring

Ergebnis:  -/-

Zweck:     JPL-Anweisungen ausführen.

### GetSPA

```pascal
function GetSPA(nr:integer):integer;
```

Parameter: nr ... die SPA Nummer

Ergebnis:  liefert den Wert des Steuerungsparameters

Zweck:     SPA Auslesen

### EscState

```pascal
function EscState(state : integer) : integer;
```

Parameter: state  .. der zu setzende ESC-Abfragestatus

0: ESC-Taste unterbricht den Makro (Standard)

1: ESC-Taste wird abgefragt, die Unterbrechungsfunktion

jedoch abgeschaltet

2: ESC-Taste wird NICHT abgefragt

Ergebnis:  liefert den alten Status zurück.

Zweck: Modus der ESC-Tastenverarbeitung während der Makroausführung manipulieren.

### SysMaske

```pascal
function SysMaske( buf: string; len: integer):integer;
```

Parameter: buf ... Ergebnispuffer

len ... und dessen Länge

Ergebnis:  0: Fehler

1: buf enthält gültige Daten

Zweck: Liefert den Namen der aktuellen Maske.

### SysAnw

```pascal
function SysAnw( buf: string; len: integer) : integer;
```

Parameter: buf ... Ergebnispuffer

len ... und dessen Länge

Ergebnis:  0: Fehler

1: buf enthält gültige Daten

Zweck: Liefert den Namen der aktuellen Anwendung.

### SysAnwVar

```pascal
function SysAnwVar( buf: string; len: integer) : integer;
```

Parameter: buf ... Ergebnispuffer

len ... und dessen Länge

Ergebnis:  0: Fehler

1: buf enthält gültige Daten

Zweck: Liefert den Namen der aktuellen Anwendungsvariante.

## Kontext-Zugriffe

Makrointerface zu den Kontext-Objekten der Belegerfassung.


### FindKontext

```pascal
function FindKontext(ktx:string):integer;
```

Parameter: ktx ... Name des zu suchenden Kontext

Ergebnis:  0 : Kontext nicht auffindbar

>0: Handle für den angegebenen Kontext.

Zweck:     Handle auf eine Kontext besorgen.

Version:   Diese Funktion ist ab Version 4.3.1.14 verfügbar.

Beispiel:  Handle auf den Belegkopf-Kontext in der Belegerfassung holen

und die KundenId des soeben erfassten Belegs auslesen.

```pascal
program kontext;
var buf    : string;
ktx    : integer;
kundid : integer;
begin
buf := "                    ";
ktx := FindKontext("SVMAIN");
if ktx <> 0 then begin
GetKtxVal(ktx,ID_KUNDID,buf,0);
kundid := StrToInt(buf);
```

...

```pascal
end
end.
```

### SetKtxVal

```pascal
function SetKtxVal(ktx,topic:integer;value:string;param:integer):integer;
```

Parameter: ktx ..... Handle auf den Kontext

topic ... ID des zu setzenden Attributs

value ... zu setzender Attributwert

param ... Topicparameter ( fast immer auf 0 setzen! )

Ergebnis:  0 : Fehler

>0: der Wert wurde gesetzt

Zweck:     Attribute im Kontext setzen

Version:   Diese Funktion ist ab Version 4.3.1.14 verfügbar.

### GetKtxVal

```pascal
function GetKtxVal(ktx,topic:integer;value:string;param:integer):integer;
```

Parameter: ktx ..... Handle auf den Kontext

topic ... ID des zu setzenden Attributs

value .. Ergebnispuffer

param  Topicparameter ( fast immer auf 0 setzen! )

Ergebnis:  0 : Fehler

>0: Werte im Ergebnispuffer sind gültig.

Zweck: Kontext-Attribute auslesen

Version: Diese Funktion ist ab Version 4.3.1.14 verfügbar.

### KtxExec

```pascal
function KtxExec(ktx,func,param:integer):integer;
```

Parameter: ktx ..... Handle auf den Kontext

func .... ID der auszuführenden Funktion

param ... Funktionsparameter

Ergebnis: 0 : Fehler

>0: Funktion wurde ausgeführt

Zweck: Im Kontext eine Funktion ausführen lassen.

Version: Diese Funktion ist ab Version 4.3.1.14 verfügbar.

## numerische Funktionen


### abs

```pascal
function abs( a : real ) : real;
```

Parameter: a ... Argument

Ergebnis:  Liefert den Absolutbetrag des Arguments.

### min

```pascal
function min(a,b:real):real
```

Parameter: a,b ... Argumente

Ergebnis:  Liefert den Mimimalwert der Argumente.

### max

```pascal
function max(a,b:real):real
```

Parameter: a,b ... Argumente

Ergebnis:  Liefert den Maximalwert der Argumente.

### absi

```pascal
function absi(a:integer):integer;
```

Parameter: a ... Argument

Ergebnis:  Liefert den Absolutbetrag des Arguments.

### mini

```pascal
function mini(a,b:integer):integer;
```

Parameter: a,b ... Argumente

Ergebnis:  Liefert den Minimalwert der Argumente.

### maxi

```pascal
function maxi(a,b:integer):integer;
```

Parameter: a,b ... Argumente

Ergebnis:  Liefert den Maximalwert der Argumente.

### rand

```pascal
function rand():integer;
```

Parameter: -/-

Ergebnis:  liefert eine Pseudo-Zufallszahl

Zweck:     Zufallsgenerator

### random

```pascal
procedure random();
```

Parameter: -/-

Ergebnis:  Pseudo-Zufallengenerator initialisieren

Zweck:     Zufallsgenerator

## Funktionen zum Bereich 'Auswahlliste'

Diese Funktionen dienen alle der Ansteuerung von Auswahllisten.

Hiermit sind Makros möglich, die auf Auswahllisten-Selektionen

agieren. (z.B. Datenexport zum Programm Excel über DDE oder OLE)


### InitGetId

```pascal
function InitGetId() : integer;
```

Parameter: keine

Ergebnis:   0: AWListeninitialisierung ist fehlgeschlagen

1: ohne Fehler

Zweck: Die Funktion initialisiert die Übernahme aus Auswahllisten. Diese Funktion MUß vor allen Zugriffen auf Auswahllisten ausgeführt werden!

### RefreshAWList

```pascal
function RefreshAWList() : integer;
```

Parameter: keine

Ergebnis:    0: Funktionsfehler

1: Funktion wurde erfolgreich ausgeführt

Zweck:       Die aktuelle Auswahlliste wird neu erzeugt bzw. aufgefrischt.

### GetNextId

```pascal
function GetNextId() : integer
```

Parameter:   keine

Ergebnis:    Id-Wert des nächsten markierten Eintrags in der Auswahlliste

Zweck: Iteration durch Auswahllisten. Um den 2..4 ID-Wert des Datensatzes zu bekommen ist die Funktion GetIdx(n) zu benutzen

### GetNextIdStr

```pascal
function GetNextIdStr(s : string) : integer
```

Parameter:   s ... Ergebnispuffer für den ID-Wert des nächsten

markierten Eintrags in der Auswahlliste

Ergebnis:    0: Fehler

1: der Pufferinhalt ist gültig

Zweck: Iteration durch Auswahllisten. Um den 2..4 ID-Wert des Datensatzes zu bekommen ist die Funktion GetIdx(n) zu benutzen

### GetIdx

```pascal
function GetIdx( n: integer ) : integer
```

Parameter:   n ... Nummer der gewünschten Id ( 2..4 )

Ergebnis:    Wert der angegebenen Folge-Id

Zweck: Iteration durch Auswahllisten. Auswahllisten-Einträge liefern bis zu 4 Id-Werte, was diese im einzelnen beinhalten ist von der Auswahlliste abhängig!

### GetIdxStr

```pascal
function GetIdxStr( n: integer, s:string ) : integer
```

Parameter: n ... Nummer der gewünschten Id ( 2..4 )

s ... Ergebnispuffer zur Aufnahme des ID-Wertes

Ergebnis:    0: es ist ein Fehler aufgetreten

1: der Wert in s ist gültig

Zweck: Iteration durch Auswahllisten. Auswahllisten-Einträge liefern bis zu 4 Id-Werte, was diese im einzelnen  beinhalten ist von der Auswahlliste abhängig!

### AWGetFieldCount

```pascal
function AWGetFieldCount() : integer;
```

Parameter:   keine

Ergebnis: liefert die Anzahl der angezeigten Felder (Spalten) in der aktuellen Auswahlliste. Im Fehlerfall wird -1 geliefert.

Zweck: AWListen Informationen abfragen.

### AWGetSelCount

```pascal
function AWGetSelCount() : integer;
```

Parameter:   keine

Ergebnis: liefert die Anzahl der markierten Zeilen in der aktuellen Auswahlliste. Im Fehlerfall wird -1 geliefert.

Zweck: AWListen Informationen abfragen.

### AWGetSqlStatement

```pascal
function AWGetSqlStatement( sql:string; len:integer ) : integer;
```

Parameter:  sql ... Ergebnispuffer für den SQL-Ausdruck

len ... die Größe des Puffers

Ergebnis: 0: es sind Fehler aufgetreten

1: der SQL-Ausdruck wurde korrekt übergeben

Zweck: Ermittelt den SQL-Ausdruck der aktuellen Auswahlliste.

### AWCreateFieldDescr

```pascal
function AWCreateFieldDescr() : integer;
```

Parameter:   keine

Ergebnis:    Referenz auf ein FieldDescrObjekt.

Zweck:       Vorbereitung für einen detaillierten Zugriff auf Auswahl-

Listen Daten.

Die von dieser Funktion generierte Referenz ist den Funktionen

AWGetFieldData

AWGetFieldType

AWGetFieldHeader

AWGetFieldName

als jeweils 1. Parameter zu übergeben.

### AWDeleteFieldDescr

```pascal
procedure AWDeleteFieldDescr( fd : integer);
```

Parameter:   fd ... Referenz des FieldDescr-Objekts

Ergebnis:    keins

Zweck:       Freigeben von Resourcen.

### AWFetchNextSelRecord

```pascal
function AWFetchNextSelRecord() : integer;
```

Parameter:   keine

Ergebnis:    0: keine weiteren Daten

1: es wurden weitere Daten geliefert

Zweck:       Iteration über Auswahllisten

### AWGetFieldDataForm

```pascal
function AWGetFieldDataForm(fd,idx:integer;s:string;len:integer):integer;
```

Parameter: fd .... Referenz auf das zugehörige FieldDescriptor-Objekt

(siehe idx ... Spaltennummer (1...AWGetFieldCount())

s ..... Ergebnispuffer für den Namen

len ... Größe des Puffers

Ergebnis: 0: Fehler

1: die Daten im Puffer sind gültig

Zweck: Auslesen einer Auswahllistenspalte im formatierter Art.

### AWGetFieldData

```pascal
function AWGetFieldData(fd,idx:integer;s:string;len:integer):integer;
```

Parameter:   fd .... Referenz auf das zugehörige FieldDescriptor-Objekt

(siehe

idx ... Spaltennummer (1...AWGetFieldCount())

s ..... Ergebnispuffer für den Namen

len ... Größe des Puffers

Ergebnis:    0: Fehler

1: die Daten im Puffer sind gültig

Zweck: Auslesen einer Auswahllistenspalte.

### AWGetFieldType

```pascal
function AWGetFieldType(idx:integer;s:string;len:integer):integer;
```

Parameter: idx ... Spaltennummer (1...AWGetFieldCount())

s ..... Ergebnispuffer für den Namen

len ... Größe des Puffers

Ergebnis: 0: Fehler

1: die Daten im Puffer sind gültig

Zweck: Ermittelt den Datentyp der Auswahllistenspalte.

### AWGetFieldHeader

```pascal
function AWGetFieldHeader(idx:integer;s:string;len:integer):integer;
```

Parameter: idx ... Spaltennummer (1...AWGetFieldCount())

s ..... Ergebnispuffer für den Namen

len ... Größe des Puffers

Ergebnis: 0: Fehler

1: die Daten im Puffer sind gültig

Zweck: Abfrage der Spaltenüberschrift in der Auswahlliste.

### AWGetFieldName

```pascal
function AWGetFieldName(idx:integer;s:string;len:integer):integer;
```

Parameter: idx ... Spaltennummer (1...AWGetFieldCount())

s ..... Ergebnispuffer für den Namen

len ... Größe des Puffers

Ergebnis: 0: Fehler

1: die Daten im Puffer sind gültig

Zweck: Name der AWList-Spalte im Datenbank-Cursor.

### AWGetFieldLength

```pascal
function AWGetFieldLength(idx:integer):integer;
```

Parameter:  idx ... Spaltennummer (1...AWGetFieldCount())

Ergebnis:    die Breite der Auswahllistenspalte

Zweck:       Abfrage der Spaltenbreite

## Datumsfunktionen


### WeekOfYear

```pascal
function WeekOfYear( d : date ) : integer;
```

Parameter: d ... das zu prüfende Datum

Ergebnis:  Liefert die Kalenderwoche des Datums zurück.

Zweck:     Kalenderwochenbestimmung

### Leap

```pascal
function Leap( y : integer ) : integer;
```

Parameter: y ... das zu prüfende Jahr

Ergebnis:  0 : y ist kein Schaltjahr

1 : y ist ein Schaltjahr

Zweck:     Schaltjahre ermitteln

### AddMonth

```pascal
function AddMonth( d: date; m : integer ) : date;
```

Parameter: d ... Datum, auf das die Monate drauf gerechnet werden sollen

m ... Anzahl der Monate

Ergebnis: Liefert das resultierende Datum

Zweck: Datumsberechnung

### AddYear

```pascal
function AddYear( d:date; y:integer ) : date;
```

Parameter: d das Startdatum

y .Anzahl der Jahre, die hinzu addiert werden sollen

Ergebnis: Liefert das resultierende Datum

Zweck: Datumsberechnung

### Ostern

```pascal
function Ostern( J : integer) : date;
```

Parameter: J ... das zu prüfende Jahr

Ergebnis:  liefert das Osterdatum des übergebenen Jahrs

Zweck:     Datumsberechnung für Ostern im Jahre J

Anmerkung: Ostern fällt auf den Sonntag nach dem ersten Vollmond im Frühling.

gaußsche Osterformel:

```pascal
Jahreszahl := J
a := J mod 19
b := J mod 4
c := J mod 7
d := (19a + m) mod 30
e := ( 2b + 4c + 6d + n ) mod 7
```

m,n aus Tabelle:

Jahr      | m  | n     Jahr      | m  | n     Jahr      | m  | n

----------+----+-----------------+----+-----------------+----+------

1583..1699| 22 | 2     1800..1899| 23 | 4     2100..2199| 24 | 6

1700..1799| 23 | 3     1900..2099| 24 | 5     2200..2299| 25 | 0

Ostern fällt entweder auf den ( 22+d+e )ten März

oder ( d+e-9 )ten April.

Zwei Ausnahmen:

1. Für den 26.April ist immer der 19. April zu setzten.

2. Für den 25.April ist der 18.April zu setzen,

wenn (d==28)&&(e==6)&&(a>10) gilt.

### DayOfYear

```pascal
function DayOfYear( d : date ) : integer;
```

Parameter: d ... das zu prüfende Datum

Ergebnis:  liefert die Tageszahl des übergebenen Datums zurück.

Zweck:     Datumsberechnung

### DayOfWeek

```pascal
function DayOfWeek( d : date ) : integer;
```

Parameter: d ... das zu prüfende Datum

Ergebnis:  liefert den Wochentag des übergebenen Datums (Mo:1..So:7)

Zweck:     Datumsberechnung

### Today

```pascal
function Today():date;
```

Parameter: -/-

Ergebnis:  liefert das aktuelle Datum

Zweck:     Datumsberechnung

### SetDay

```pascal
function SetDay( d:date; n:integer):date;
```

Parameter: d ... zu manipulierendes Datum

n ... gewünschte Tageszahl

Ergebnis:  Liefert das resultierende Datum nach Austausch der Tageszahl.

Zweck: Datumseinstellung

### SetMonth

```pascal
function SetMonth( d:date; n:integer):date;
```

Parameter: d ... zu manipulierendes Datum

n ... gewünschter Monat

Ergebnis:  Liefert das resultierende Datum nach Austausch des Monats.

Zweck:     Datumseinstellung

### SetYear

```pascal
function SetYear( d:date; n:integer):date;
```

Parameter: d ... zu manipulierendes Datum

n ... gewünschtes Jahr

Ergebnis:  Liefert das resultierende Datum nach Austausch des Jahres.

Zweck:      Datumseinstellung

### GetDay

```pascal
function GetDay( d : date ) : integer;
```

Parameter: d ... das zu untersuchende Datum

Ergebnis:  Liefert die Tageszahl im Datum

Zweck:     Datumsanalyse

### GetMonth

```pascal
function GetMonth( d : date ) : integer;
```

Parameter: d ... das zu untersuchende Datum

Ergebnis:  Liefert die Monatszahl im Datum

Zweck:     Datumsanalyse

### GetYear

```pascal
function GetYear( d : date ) : integer;
```

Parameter: d ... das zu untersuchende Datum

Ergebnis:  Liefert die Jahreszahl im Datum

Zweck:     Datumsanalyse

### Ultimo

```pascal
function Ultimo(d:date):date;
```

Parameter: d ... zu prüfendes Datum

Ergebnis:  liefert Ultimo des zum Datum gehörenden Monats

Zweck: Datumsberechnung

### Diff30

```pascal
function Diff30( d1,d2:date ):integer;
```

Parameter: d1 ... Datum 1

d2 ... Datum 2

Ergebnis:  Liefert die Differenz zwischen d1 und d2 auf 30-Tage Basis.

Zweck: Datumsberechnung

### StrToDate

```pascal
function StrToDate(s:string):date;
```

Parameter: s ... Datum als String

Ergebnis: Liefert das Datum im Datentyp 'date'

Zweck: Stringkonvertierung zu Datum

### DateToStr

```pascal
procedure DateToStr(d:date;s:string);
```

Parameter: d ... das zu konvertierende Datum

s ... der Ergebnispuffer

Ergebnis:  -/-

Zweck:     Datumskonvertierung in String

## Crystal Reports / List und Label


### CRW

```pascal
function CRW(func,p1,p2,p3,p4 : string):integer;
```

Parameter: func ... Funktionscode

p1 ..... Parameter 1

p2 ..... Parameter 2

p3 ..... Parameter 3

p4 ..... Parameter 4

Ergebnis:

Zweck:     Interface für CristalReports und List&Label

Funktionscodes:

CRW_GETVERSION_DLL ....... 16

liefert die CrystalReport DLL-Version.

alle Parameter werden ignoriert

CRW_GETVERSION_ENGINE .... 17

liefert die CrytalReport Engine Version.

alle Parameter werden ignoriert

CRW_OPENJOB .............. 5

p1 enthält den Reportnamen

p2 bis p4 werden ignoriert

CRW_SETLOCATION .......... 19

p1 Creator Name

p2 bis p4 werden ignoriert

CRW_SETFORMULA ........... 8

p1 Feldname

p2 Wert

p3 + p4 werden ignoriert

CRW_SETSELECTFORM ........ 9

p1 die where-Bedingung

p2 bis p4 werden ignoriert

CRW_SETORDER ............. 10

p1 Ordernummer

p2 Feldname

p3 Sort order

p4 wird ignoriert

CRW_SETGROUPORDER ........ 15

p1 Ordernummer

p2 Feldname

p3 Sort order

p4 wird ignoriert

CRW_EXESQLTEXT ........... 21

p1 Textname

p2 Besitzer

p3 + p4 werden ignoriert

CRW_SETSQLQUERY .......... 14

p1 SQL-Anweisung

p2 bis p4 werden ignoriert

CRW_HIDESECTION .......... 18

p1 Sectionname

p2 bis p4 werden ignoriert

CRW_OUTPUT ............... 6

p1 PRINTER oder WINDOW

p2 bis p4 werden ignoriert

CRW_EXECUTE .............. 7

alle Parameter werden ignoriert

CRW_BUILDSQLQUERY ........ 20

p1 SQL-Anweisung

p2 bis p4 werden ignoriert

CRW_GETSELECTEDPRINTER.... 23

p1 ist der Ergebnispuffer

p2 bis p4 werden ignoriert

CRW_SELECTPRINTER ........ 22

p1 zu selektierender Drucker

p2 bis p4 werden ignoriert

List & Label

LILA_EDIT_LABEL  ......... 101

LILA_PRINT_LABEL ......... 102

LILA_PREVIEW_LABEL ....... 103

p1 enthält den LILA-Dateinamen

p2 bis p4 werden ignoriert

## Formular Export

Direktes ansprechen von Formularen.

Diese Funktionen machen nur Sinn, falls das Makro direkt von der

Vorgangs-Auswahlliste (z.B. REB) oder aus SVMAIN heraus aufgerufen

wird.


### Beispiel Formular-Export

```pascal
program ExportSV(formular_id);
var
handle : integer;   // HANDLE des ExportFormulars
res    : integer;   // div. Resultate
z      : integer;
s,sc   : integer;   // Menge der Seiten und Seitenzähler
hs     : integer;   // Handle auf die aktuelle Seite
len    : integer;   // Länge der Seite
i      : integer;
buf    : string;    // Puffer für die Textzeilen
begin
buf := alloc(512);
handle := FXCreate();           // HANDLE des Formulars besorgen
if handle <> 0 then begin
res := FXPrepare( handle, strtoint(formular_id) );
if res <> 0 then begin
s  := FXSeiten(handle);     // Menge der Seiten bestimmen
sc := 0;                    // mit Seite 0 beginnen
while sc < s do begin
hs := FXSeite(handle,sc); // HANDLE der Seite holen
if hs <> 0 then begin
len := FXLaenge(hs);    // Menge der Zeilen
i := 1;                 // in Zeile 1 beginnen
FXZeile(hs,i,buf,512);
//.... Mach was mit der 1. Textzeile
while i < len do begin
FXNextZeile(hs,buf,512);
//.... Mach was mit der n. Textzeile
i := i + 1; // nächste Zeile
end
end
sc := sc + 1;   // nächste Seite
end
end
FXDelete(handle);
handle := 0;
end
end;
```

### FXCreate

```pascal
function FXCreate() : integer;
```

Ergebnis:  -1 : Fehler

>0 : HANDLE des Formular Exports

Zweck:     erzeugen eines Formular Exports

siehe Beispiel Formularexport

### FXDelete

```pascal
procedure FXDelete( ref : integer);
```

Parameter: fx ... HANDLE des Formular Exports

Zweck:     Resourcen für den Formular-Export freigeben.

siehe Beispiel Formularexport

### FXPrepare

```pascal
function FXPrepare(ref,typ : integer):integer;
```

Parameter: ref .. HANDLE des Formular Exports

typ .. der Formular-Typ

1031 : das Druckformular

1035 : das Vorschauformular

Zweck: Formular des Vorgangs füllen

siehe Beispiel Formularexport

### FXPrepareNr

```pascal
function FXPrepareNr(ref,f_nr : integer):integer;
```

Parameter: ref .. HANDLE des Formular Exports

f_nr.. die Formularnummer

Zweck:     Formular des Vorgangs füllen

### FXSeite

```pascal
function FXSeite(ref,no : integer):integer;
```

Parameter: ref ... HANDLE des Formular Exports

no .... Nummer der Seite

Ergebnis:  0 : Fehler

>0 : HANDLE der Seite

Zweck:    Eine bestimmte Seite im Formular ansprechen

siehe Beispiel Formularexport

### FXSeiten

```pascal
function FXSeiten( ref : integer ) : integer;
```

Parameter: ref ... HANDLE des Formular Exports

Ergebnis:   -1 : Fehler

>0 : Anzahl der Seiten im Formular

Zweck:       Bestimmung der Seitenanzahl eines Formulars.

siehe Beispiel Formularexport

### FXLaenge

```pascal
function FXLaenge( ref : integer ) : integer;
```

Parameter: ref ... HANDLE der Seite

Ergebnis:   -1 : Fehler

>0 : Anzahl der Zeilen dieser Seite

Zweck:      Länge von Formularseiten bestimmen

siehe Beispiel Formularexport

### FXNextZeile

```pascal
function FXNextZeile( ref:integer; buf : string; size:integer):integer;
```

Parameter: ref ... HANDLE der Seite

buf ... Puffer für die Textzeile

size .. Größe des Puffers

Ergebnis:  false : Fehler

true  : die Daten im Puffer sind gültig

Zweck:      Die nächste Textzeile des Formulars auslesen.

siehe Beispiel Formularexport

### FXZeile

```pascal
function FXZeile( ref,idx:integer; buf : string; size:integer):integer;
```

Parameter: ref ... HANDLE der Seite

idx ... Index der Zeile ( zählt ab 0 )

buf ... Puffer für die Textzeile

size .. Größe des Puffers

Ergebnis:    false : Fehler

true  : die Daten im Puffer sind gültig

Zweck:        Eine bestimmte Textzeile des Formulars auslesen.

siehe Beispiel Formularexport

### FXGetDQ .. Handle auf die Datenquelle des Formular Exports

```pascal
function FXGetDQ(fx:integer):integer;
```

Parameter:   fx ...... HANDLE des Formular Exports

Ergebnis:     0  : Fehler

>0 : Handle auf die dem Formular zugeordnete Datenquelle.

Zweck:        Zugriff auf die Datenquelle des Formular Exports bekommen.

## Dateifunktionen

Alles für das Dateisystem....


### Eof

```pascal
function Eof(kanal:integer):integer;
```

Parameter: kanal ... Nummer des IO-Kanals, der geprüft werden soll.

Ergebnis:  0: noch Zeichen in der Eingabe

1: Kanal ist am Ende angelangt

Zweck:     Dateistatus erfragen

### Remove

```pascal
function Remove(path:string):integer;
```

Parameter: path ... Pfad der zu löschenden Datei

Ergebnis:  0: Datei konnte nicht gelöscht werden

1: Datei wurde gelöscht

Zweck:     Dateien entfernen

### CreateDirectory

```pascal
function CreateDirectory(dirname:string):integer;
```

Parameter: dirname ... Pfad/Name für das neue Verzeichnis

Ergebnis:   =0: Fehler -> Verzeichnis konnte NICHT angelegt werden

<>0: Verzeichnis wurde erstellt

Zweck: ein neues Verzeichnis anlegen

### Rename

```pascal
function Rename(o_name,n_name:string):integer;
```

Parameter: o_name ... der alte Dateiname

n_name ... der neue Dateiname

Ergebnis:    0: Datei konnte nicht umbenannt werden

1: Datei wurde umbenannt

Zweck:       Dateien umbenennen

### Read

```pascal
procedure Read( kanal : integer; Bezeichner: pos integer : len integer;... );
```

Parameter: kanal ......... die bei der Funktion Open() für diesen Kanal angebebene Nummer

Bezeichner  ... Name einer Variablen, in die gelesen werden soll

pos ........... Startposition im Einlesepuffer, ab der gelesen werden soll

len ........... Menge der Zeichen, die eingelesen werden sollen

Zweck: Einlesen von Werten aus dem Einlesepuffer

### ReadLn

```pascal
procedure ReadLn( kanal : integer );
```

Parameter: kanal ... die bei der Funktion Open() für diesen Kanal angebebene Nummer

Ergebnis:  -/-

Zweck:

Einlesen in den Lesepuffer aus einem E/A-Kanal.

Ist keine fest vorgegebene Puffergröße über die Prozedur 'RecordSize'

angegeben, so wird die nächste Zeile eingelesen - andernfalls genau

die mit RecordSize angegebene Menge.

Anmerkung: 
A.eins Makro liest Daten aus einer Datei zunächst in einen Eingabe-Puffer

ein. Durch die Prozedur ReadLn wird dieser Puffer mit Daten aus der

Eingabe gefüllt.

Wieweit ReadLn nun in der Eingabe ließt kann durch folgende Funktionen

gesteuert werden:

RecordSize(kanal,size : integer)

Aus dem Eingabekanal 'kanal' werden immer genau 'size' Zeichen entnommen.

SetRecordDelim(kanal:integer;c:char)

Aus dem Eingabekanal 'kanal' werden solange Zeichen entnommen, bis das

Trennzeichen 'c' gelesen wird.

Das Trennzeichen wird nicht in den Puffer übertragen.

Wird weder die Datensatzlänge über 'RecordSize()' noch ein Trennzeichen per            SetRecordDelim() angegeben, so ließt ReadLn() genau eine Zeile (\r\n getrennt)

aus der Eingabe in den Puffer ein.

### Write

```pascal
procedure Write( kanal:integer; Variable:pos:size:nk; ... );
```

Parameter: kanal die bei der Funktion Open() für diesen Kanal angebebene Nummer

Variable

pos ........ Startposition der Ausgabe im Puffer

Bei direkter Ausgabe wird dieser Parameter ignoriert und

sollte auf Null gesetzt werden!

size .  ...... Anzahl der auszugebenden Stellen

nk .   ....... nur bei Realzahlen sonst ignoriert

gibt die Menge der Nachkomma-Stellen an. Standard ist 4

Ergebnis:    -/-

Zweck: Ausgeben von Daten in einen E/A-Kanal. Ist keine fest vorgegebene Puffergröße über die Prozedur 'RecordSize' angegeben, so wird direkt auf dem Kanal ausgegeben - andernfalls wird in einen internen Puffer ausgegeben. Erst der Aufruf von WriteLn gibt diesen Puffer auf dem Kanal aus.

### WriteLn

```pascal
Form 1  procedure WriteLn( kanal:integer );
```

```pascal
Form 2  procedure WriteLn( kanal:integer; Variable:pos:size:nk; ... );
```

Parameter: kanal ...... die bei der Funktion Open() für diesen Kanal angebebene Nummer

Variable ...

pos ........ Startposition der Ausgabe im Puffer

Bei direkter Ausgabe wird dieser Parameter ignoriert und

sollte auf Null gesetzt werden!

size ....  .. Anzahl der auszugebenden Stellen

nk .  ........ nur bei Realzahlen sonst ignoriert

gibt die Menge der Nachkomma-Stellen an. Standard ist 4

Ergebnis:     -/-

Zweck:        Form 1

Ausgeben eines Zeilenumbruchs im E/A-Kanal.

Bei einem E/A-Kanal mit festgelegter Recordlänge (über die Prozedur

'RecordSize')  wird der interne Ausgabepuffer auf dem Kanal

ausgegeben.

Form 2

Dies ist die Kurzform von

```pascal
Write(IO_KANAL, x);
Write(IO_KANAL, y);
Write(IO_KANAL, z);
WriteLn(IO_KANAL);
```

==>

```pascal
WriteLn(IO_KANAL,x,y,z);
```

### Open

```pascal
procedure Open(kanal:integer; name:string; mode:integer);
```

Parameter: kanal ... Nummer des IO-Kanals, der geprüft werden soll.

name .... Name der zu öffnenden Datei

mode .... Zugriffsmodus

RDONLY = 0x0000   (nur lesend)

WRONLY = 0x0001   (nur schreibend)

RDWR   = 0x0002   (lesend UND schreibend)

APPEND = 0x0008   (Positionierung aufs Dateiende)

TRUNC  = 0x0200   (öffnen und auf Länge Null kürzen)

TEXT   = 0x4000   (öffnen im Textmodus)

BINARY = 0x8000   (öffnen im Binärmodus)

Ergebnis:  -/-

```pascal
Zweck: Öffnen einer Datei mit bestimmten Zugriffsmodi. Ggf. die Fehlercodes über GetLastError() abfragen. Die Mode-Eigenschaften können per oder ('|') verknüpft werden. Beispiel: open(10,"test.txt",WRONLY|TEXT|TRUNC);
```

### Close

```pascal
procedure Close(kanal:integer);
```

Parameter: kanal ... Nummer des IO-Kanals, der geschlossen werden soll.

Ergebnis:  -/-

Zweck:     Schließen einer Datei.

Ggf. die Fehlercodes über GetLastError() abfragen.

### Seek

```pascal
procedure Seek(kanal,offset,base:integer);
```

Parameter: kanal .... Nummer des IO-Kanals

offset  ... Positionierung um x Bytes

base ..... Bezugspunkt der Positionierung

SEEK_SET = 0 - vom Anfang der Datei

SEEK_CUR = 1 - von der aktuellen Position

SEEK_END = 2 - vom Ende der Datei

Ergebnis:     -/-

Zweck:         Wahlfreie Positionierung innerhalb einer Datei

Ggf. die Fehlercodes über GetLastError() abfragen.

### RecordSize

```pascal
procedure RecordSize(kanal,size:integer);
```

Parameter: kanal ... Nummer des IO-Kanals

size ....  Größe des IO-Puffers

Ergebnis:    -/-

Zweck:      Einstellen einer festen Recordgröße in einem IO-Kanal.

ReadLn und WriteLn lesen/schreiben so immer die gleiche

Anzahl Bytes vom/in den Kanal.

### RecordSizeEx

```pascal
procedure RecordSizeEx(kanal,size:integer);
```

Parameter: kanal ... Nummer des IO-Kanals

size .... Größe des IO-Puffers

Ergebnis:     -/-

Zweck:        Einstellen einer festen Recordgröße in einem IO-Kanal.

ReadLn und WriteLn lesen/schreiben so immer die gleiche

Anzahl Bytes vom/in den Kanal.

Im Gegensatz zu RecordSize bleiben die Daten des Ausgabepuffers,

soweit sie in die neue Recordgröße passen, erhalten.

### BackupMethod

```pascal
function BackupMethod(filename,backupdir:string) : integer;
```

Parameter: filename .... Name der zu sichernden Datei

backupdir ... Sicherungsverzeichnis

Ergebnis:     0 Fehler, Datei wurde NICHT gesichert.

1 ok

Zweck:        Erstellt von der Datei 'filename' im Verzeichnis 'backupdir'

eine 10-Stufige Sicherung.

```pascal
der Datei test.dat:
```

test.dat wird zu backupdir\test.bk0

backupdir\test.bk0 wird zu backupdir\test.bk1 (falls vorhanden)

backupdir\test.bk1 wird zu backupdir\test.bk2

backupdir\test.bk2 wird zu backupdir\test.bk3

backupdir\test.bk3 wird zu backupdir\test.bk4

backupdir\test.bk4 wird zu backupdir\test.bk5

backupdir\test.bk5 wird zu backupdir\test.bk6

backupdir\test.bk6 wird zu backupdir\test.bk7

backupdir\test.bk7 wird zu backupdir\test.bk8

backupdir\test.bk8 wird zu backupdir\test.bk9

backupdir\test.bk9 wird gelöscht

### WantFileFromDisk

```pascal
function WantFileFromDisk(filename:string):integer;
```

Parameter: filename

Ergebnis:  0 die angeforderte Datei konnte nicht gefunden werden

1 ok

Zweck:     Fordert den Benutzer zum einlegen einer Diskette o.ä. auf und überprüft den Zugriff auf die Datei.

### SetDPoint

```pascal
procedure SetDPoint( kanal:integer; c:char );
```

Parameter: kanal ... Nummer des IO-Kanals

c ...   .... das Zeichen für den Dezimalpunkt - Standard ist '.'

Ergebnis:    -/-

Zweck:       Setzt für einen bestimmten Kanal das Dezimalzeichen.

### SplitPath

```pascal
procedure SplitPath( path,drive,dir,fname,ext : string );
```

Parameter: path ....   der zu zerlegende Pfad                     z.B. c:\temp\test.txt

drive ...    der enthaltene Laufwerksbuchstabe  ===> c:

dir .  .   ... der enthaltende Pfad                         ===> \temp\

fname ... der Dateiname                                   ===> test

ext ...   .. und schließlich die Dateierweiterung ===> .txt

Ergebnis:  -/-

Zweck:     Zerlegt eine Dateipfad in dessen Einzelteile.

### SetFill

```pascal
procedure SetFill( kanal:integer; c:char );
```

Parameter: kanal ... Nummer des IO-Kanals

c ....... das Füllzeichen - Standard ist ' '

Ergebnis:  -/-

Zweck:     Für einen Kanal das Füllzeichen setzen.

### SetRecordDelim

```pascal
procedure SetRecordDelim( kanal : integer , c : char )
```

Parameter: kanal ... Nummer des einzustellenden I/O-Kanals

c ....... das Trennzeichen - Standard CRLF

Ergebnis:     -/-

Zweck: Setzt für einen bestimmten Kanal das Trennzeichen der Datensätze fest. Diese Funktion ist für Eingabedaten gedacht, die nicht durch Zeilentrenner unterteilt werden. Der Aufruf dieser Funktion wirkt auf das Verhalten der Funktion ReadLn! Es wird dann statt der nächsten Zeile bis zum Auffinden des angegebenen Trennzeichens gelesen.

### SetPicFormat

```pascal
procedure SetPicFormat( kanal : integer; s : string );
```

Parameter: kanal ... Nummer des einzustellenden I/O-Kanals

s .......    Zeiger auf einen PIC-Formatstring

Ergebnis:    -/-

Zweck:        Setzt für einen bestimmten Kanal das Cobol-Picture-Format.

### GetFileStat

```pascal
function GetFileStat( kanal:integer; atime,ctime,mtime:^integer ):integer
```

Parameter: kanal ... Nummer des einzustellenden I/O-Kanals

atime ... Zeiger auf - letzer Zugriff  ( in Sekunden seit 1.1.1970 00:00 )

ctime ...                  - erzeugt am

mtime ...                 - zuletzt verändert

Ergebnis:  Die Funktion liefert die Dateigröße in Bytes zurück.

Zweck:      Dateieigenschaften bestimmen.

### Access

```pascal
function Access( datei:string; flag:integer):integer;
```

Parameter: datei ... Name und Pfad der zu überprüfenden Datei

flag .... Art der Überprüfung

Ergebnis:  0, falls die Datei die angegebenen Eigenschaften besitzt.

EACCES = 1 ... Zugriff auf die Datei verweigert

ENOENT = 2 ... Datei oder Pfad nicht gefunden

ERROR  = 3 ... sonstiger Fehler -> GetLastError()

Zweck:     Eigenschaften einer Datei überprüfen, z.B. dessen Existenz.

Einstellungen des Parameters flags:

mode-Flag     Datei prüfen auf

------------------------------------------

00 .......... nur auf Existenz

02 .......... auf Schreib-Erlaubnis

04 .......... auf Lese-Erlaubnis

06 .......... Lese- und Schreib-Erlaubnis

## FindFile-Methoden

Diese Funktionen dienen der Informationsbeschaffung bzgl.

Dateien und Verzeichnissen

Sucht alle Dateien im aktuellen Verzeichnis und gibt diese aus.

```pascal
program filefinder;
```

var

```pascal
ff  : integer;
n   : string;
res : integer;
begin
n := alloc(512);
ff := CreateFileFind();               // Referenz auf eine Suchumgebung erzeugen
if ff <> 0 then begin
res := FFFindFile(ff,"*.*");        // Suchmuster setzen
while res <> 0 do begin
res := FFFindNextFile(ff);        // suche den nächsten Treffer
```

FFGetFileName(ff,n,512);          // den vollen Namen abholen

MessageBox(n,"Dateiname",1);      // und ausgeben

```pascal
end
```

DeleteFileFind(ff);                 // Resourcen wieder freigeben!

```pascal
end
free(n);
end.
```


### CreateFileFind

```pascal
function CreateFileFind() : integer;
```

Parameter: keine

Ergebnis:  liefert eine Referenz auf eine FileFind-Umgebung.

Zweck:     Verzeichnis-Analyse

### DeleteFileFind

```pascal
procedure DeleteFileFind( ff : integer);
```

Parameter: ff.....Referenz auf eine FileFind-Umgebung

Zweck:     Resourcen freigeben

### FFGetLength

```pascal
function FFGetLength( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:    liefert die Länge der gefundenen Datei in Bytes.

Zweck:        Verzeichnis/Datei Analyse

### FFGetFileName

```pascal
function FFGetFileName(ff:integer;s:string;len:integer):integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

s......Puffer für den Dateinamen

len....Länge des Puffers

Ergebnis:  liefert die Länge des kopierten Strings.

Zweck:     Verzeichnis/Datei Analyse

Der Dateiname inkl. Extention wird in s kopiert.

### FFGetFilePath

```pascal
function FFGetFilePath(ff:integer;s:string;len:integer):integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

s......Puffer für den Dateinamen

len....Länge des Puffers

Ergebnis:    liefert die Länge des kopierten Strings.

Zweck:       Verzeichnis/Datei Analyse

Der komplette Pfadname wird in s kopiert.

### FFGetFileTitle

```pascal
function FFGetFileTitle(ff:integer;s:string;len:integer):integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

s......Puffer für den Dateinamen

len....Länge des Puffers

Ergebnis:  liefert die Länge des kopierten Strings.

Zweck:     Verzeichnis/Datei Analyse

Der Dateiname ohne Extention wird in s kopiert.

### FFGetFileURL

```pascal
function FFGetFileURL(ff:integer;s:string;len:integer):integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

s......Puffer für den Dateinamen

len....Länge des Puffers

Ergebnis:  liefert die Länge des kopierten Strings.

Zweck:     Verzeichnis/Datei Analyse

Liefert genau wie FFGetFilePath den kompletten Pfad, jedoch

in der Form 'file:\\c:\myhtml\myfile.txt'

### FFGetRoot

```pascal
function FFGetRoot(ff:integer;s:string;len:integer):integer;
```

Parameter: ff... . .Referenz auf FileFind-Umgebung

s.  . ..Puffer für den Dateinamen

len....Länge des Puffers

Ergebnis:    liefert die Länge des kopierten Strings.

Zweck:        Verzeichnis/Datei Analyse

Liefert den Pfad der gefundenen Datei.z.B. 'c:\windows\system' wenn das Suchmuster 'c:\windows\system\*.dll' war.

### FFGetCreationTime

```pascal
function FFGetCreationTime( ff : integer; tp :string; len:integer ) : integer;
```

Parameter: ff ... Referenz auf FileFind-Umgebung

tp ... Ergebnispuffer

len . und dessen Länge. Len muss mind. 20 Zeichen lang sein!

Ergebnis:    0: Fehler

1: die Daten im tp-Puffer sind gültig

Zweck:        Verzeichnis/Datei Analyse

### FFGetLastAccessTime

```pascal
function FFGetLastAccessTime( ff : integer; tp :string; len:integer ) : integer;
```

Parameter: ff ... Referenz auf FileFind-Umgebung

tp    Ergebnispuffer

len .und dessen Länge. Len muss mind. 20 Zeichen lang sein!

Ergebnis:    0: Fehler

1: die Daten im tp-Puffer sind gültig

Zweck:        Verzeichnis/Datei Analyse

### FFGetLastWriteTime

```pascal
function FFGetLastWriteTime( ff : integer; tp :string; len:integer ) : integer;
```

Parameter: ff ... Referenz auf FileFind-Umgebung

tp ... Ergebnispuffer

len .. und dessen Länge. Len muss mind. 20 Zeichen lang sein!

Ergebnis:    0: Fehler

1: die Daten im tp-Puffer sind gültig

Zweck:        Verzeichnis/Datei Analyse

### FFMatchesMask

```pascal
function FFMatchesMask( ff : integer; dwMask ) : integer;
```

Parameter:  ff...     ....Referenz auf FileFind-Umgebung

dwMask..Suchmaske

Ergebnis:  0 bei einem Fehler

Zweck:     Verzeichnis/Datei Analyse

dwMask

Specifies one or more file attributes, identified in theWIN32_FIND_DATA structure,

```pascal
for the found file. To search for multiple attributes, use the bitwise OR (|) operator.
```

Any combination of the following attributes is acceptable:

```pascal
FILE_ATTRIBUTE_ARCHIVE      The file is an archive file. Applications use this attribute   to mark files for backup or removal.
FILE_ATTRIBUTE_COMPRESSED   The file or directory is compressed. For a file, this means
that all of the data in the file is compressed. For a directory,
this means that compression is the default for newly created
```

files and subdirectories.

FILE_ATTRIBUTE_DIRECTORY    The file is a directory.

FILE_ATTRIBUTE_NORMAL       The file has no other attributes set. This attribute is valid

only if used alone. All other file attributes override this attribute.

FILE_ATTRIBUTE_HIDDEN       The file is hidden. It is not to be included in an ordinary

directory listing.

FILE_ATTRIBUTE_READONLY     The file is read only. Applications can read the file but cannot

write to it or delete it.

FILE_ATTRIBUTE_SYSTEM       The file is part of or is used exclusively by the operating system.

```pascal
FILE_ATTRIBUTE_TEMPORARY    The file is being used for temporary storage. Applications should
```

write to the file only if absolutely necessary. Most of the file's

data remains in memory without being flushed to the media because

the file will soon be deleted.

Numerische Werte der Konstanten:

----------------------------------------------

FILE_ATTRIBUTE_READONLY             0x00000001

FILE_ATTRIBUTE_HIDDEN               0x00000002

FILE_ATTRIBUTE_SYSTEM               0x00000004

FILE_ATTRIBUTE_DIRECTORY            0x00000010

FILE_ATTRIBUTE_ARCHIVE              0x00000020

FILE_ATTRIBUTE_NORMAL               0x00000080

FILE_ATTRIBUTE_TEMPORARY            0x00000100

FILE_ATTRIBUTE_COMPRESSED           0x00000800

### FFIsDots

```pascal
function FFIsDots( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:  ungleich Null bei '.' und '..'

Zweck:     Verzeichnis/Datei Analyse

### FFIsReadOnly

```pascal
function FFIsReadOnly( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:  ungleich Null, falls die gefundene Datei schreibgeschützt ist.

Zweck:     Verzeichnis/Datei Analyse

### FFIsDirectory

```pascal
function FFIsDirectory( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:  ungleich Null, falls es sich um ein Verzeichnis handelt

Zweck:     Verzeichnis/Datei Analyse

### FFIsCompressed

```pascal
function FFIsCompressed( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:   ungleich Null, falls es sich um eine komprimierte Datei handelt

Zweck:      Verzeichnis/Datei Analyse

### FFIsSystem

```pascal
function FFIsSystem( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:  ungleich Null, falls es sich um eine System-Datei handelt

Zweck:     Verzeichnis/Datei Analyse

### FFIsHidden

```pascal
function FFIsHidden( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:  ungleich Null, falls es sich um eine versteckte Datei handelt

Zweck:      Verzeichnis/Datei Analyse

### FFIsTemporary

```pascal
function FFIsTemporary( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:   ungleich Null, wenn es sich um eine temporäre Datei handelt

Zweck:      Verzeichnis/Datei Analyse

### FFIsNormal

```pascal
function FFIsNormal( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:   ungleich Null, wenn es sich um eine normale Datei handelt

Zweck:       Verzeichnis/Datei Analyse

### FFIsArchived

```pascal
function FFIsArchived( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:   liefert den Archiv-Status der gefundenen Datei

Zweck:       Verzeichnis/Datei Analyse

### FFClose

```pascal
function FFClose( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:   ohne

Zweck:      Verzeichnis/Datei Analyse beenden. Durch FFFileFind() kann direkt ein neuer Lauf gestartet werden.

### FFFindFile

```pascal
function FFFindFile( ff : integer; muster : string ) : integer;
```

Parameter: ff....       ..Referenz auf FileFind-Umgebung

muster..Suchmuster der angeforderten Dateien

Ergebnis:  1: es wurden Dateien gefunden

0: kein Treffer

Zweck:     Verzeichnis/Datei Analyse

### FFFindNextFile

```pascal
function FFFindNextFile( ff : integer ) : integer;
```

Parameter: ff.....Referenz auf FileFind-Umgebung

Ergebnis:   1: es wurde eine weitere Datei gefunden

0: kein Treffer

Zweck:     Verzeichnis/Datei Analyse

### CopyFile

```pascal
function CopyFile( src,dst:string; f: integer ) : integer;
```

Parameter: src ... die Quelldatei

dst ... die Zieldatei

f ..... 0: eine ggf. bestehende Zieldatei wird überschrieben

1: kopieren, nur falls die Zieldatei noch nicht ex.

Ergebnis:    0 : Fehler beim Kopieren

>0: ok

Zweck:       Kopiert die Datei 'src' an den Ort 'dst'.

### MoveFile

```pascal
function MoveFile( src,dst:string ) : integer;
```

Parameter: src ... die Quelldatei

dst ... die Zieldatei

Ergebnis:  0 : Fehler beim Kopieren

>0: ok

Zweck:     Kopiert die Datei 'src' an den Ort 'dst'.

### GetTempPath

```pascal
function GetTempPath( buf:string; len: integer ) : integer;
```

Parameter: buf .. der Ergebnispuffer

len ... und dessen Länge

Ergebnis:  0 : Fehler

>0: Menge der kopierten Zeichen im Ergebnispuffer

Zweck:     Liefert in 'buf' das Temp-Verzeichnis der Windows-Umgebung.

### GetTempFileName

```pascal
function GetTempFileName( buf,path,prefix:string ) : integer;
```

Parameter: buf ...... der Ergebnispuffer

path .... in diesem Verzeichnis soll die Datei angelegt werden

prefix .. der Dateiname beginnt mit diesem Präfix

Ergebnis:  0 : Fehler

>0: Datei erstellt

Zweck:     Liefert in 'buf' den Dateinamen einer Temp-Datei.

### FileTypes

```pascal
function FileTypes( option_text, filter : string ) : integer
```

Parameter: option_text Name der Option

filter Dateifilter für diese Option ( durch Semikolon getrennte Liste )

Ergebnis:   0 : OK

-1 : Speicherfehler

z.B.

FileTypes(0,0);         // löscht alle alten Einträge

```pascal
FileTypes("Textdateien", "*.txt;*.doc");
FileTypes("Datendateien","*.dat");
```

### FileOpenSave

```pascal
function FileOpenSave( datei:string; len:integer;
```

```pascal
pfad,dateityp,titel:string;
```

flag:integer ):integer

Parameter: datei ...... Puffer zur Aufnahme des gewählten Dateinamens

len ........ Länge des Puffers

pfad ....... unter diesem Pfad fängt die Auswahl an

dateityp ... gesuchter Dateityp z.B. "*.txt"

titel ...... Überschrift der Auswahlbox

flag ....... öffnen=0 oder sichern=1

Ergebnis:  +1 : OK

0 : es wurde Abbruch gewählt

-1 : Fehler, z.B. Pufferlänge zu klein

Zweck:     Benutzerunterstützte Dateiauswahl über Windows-Standard-Dialog.

## OLE-Schnittstelle für A.eins Makros

Suchbegriffe=OLE,OLE-Schnittstelle,OLE-Makros

Um diese Funktionen nutzen zu können ist das Modul a1ole.dll im

Aeins/bin-Verzeichnis erforderlich!


### OleInit

```pascal
function OleInit();
```

Parameter:   keine

Ergebnis:     0: Fehler beim Initialisieren

1: die Schnittstelle ist ordnungsgemäß initialisiert

Zweck:        Die Funktion mach OLE für die Makroumgebung verfügbar.

### OleClose

```pascal
procedure OleClose();
```

Parameter: keine

Ergebnis:  kein

Zweck:     die Verbindung zur OLE-Umgebung lösen.

### OleCreateObject

```pascal
procedure OleCreateObject(variant:integer;name:string);
```

Parameter: variant ... Referenz auf eine zuvor mit OleCreateVariant()

erzeugte Ole-Variante

name ...... Name des zu erzeugenden Automations-Objekts

Zweck: Mit dieser Prozedur erzeugt und initialisiert man einen OLE Automations-Server

```pascal
program bsp();
```

var

```pascal
outlook : integer;
begin
OleInit();
outlook := OleCreateVariant();
OleCreateObject(outlook,"Outlook.Automation");
OleDeleteVariant(outlook);
OleClose();
end.
```

### OleDeleteVariant

```pascal
procedure OleDeleteVatiant( variant:integer);
```

Parameter: variant ... die Referenz einer mit OleCreateVariant

erzeugte Ole-Variante

Ergebnis:  kein

Zweck:     Resourcenfreigabe

### OleCreateVariant

```pascal
function OleCreateVariant() : integer;
```

Parameter: keine

Ergebnis:  liefert eine Referenz auf eine OLE-Variante

Zweck:      Für die Kommunikation mit OLE-Automations-Servern

benötigt man Datenelemente der Klasse Variante.

Alle OLE-Funktionen benötigen Referenzen auf diese

Datentypen.

### OleFunction0

```pascal
procedure OleFunction0(variante,resultat:integer;name:string)
```

Parameter: variante. Referenz auf das OLE-Objekt, dessen Funktion 'name'

ausgeführt werden soll.

resultat .. Referenz auf ein Ergebnis-Objekt

name ....  der Name der auszuführenden Funktion

Ergebnis:  kein.

Das Ole-Funktionsergebnis landet in resultat!

Zweck:     Aufrufen von OLE-Funktionen.

Anmerkung: Bei OLE-Funktionen, die Aufrufparameter benötigen sind die Funktionen OleFunction1,OleFunction2,...,OleFunction5 zu verwenden. Die Zahl am Ende des Namens gibt die Menge der zusätzlichen Variant Parameter an.

### OlePropGet0

```pascal
procedure OlePropGet0(variante,resultat:integer;name:string)
```

Parameter: variante ... Referenz auf das OLE-Objekt, dessen Eigenschaft 'name'

ausgelesen werden soll.

resultat . .. Referenz auf ein Ergebnis-Objekt

name ....... der Name der auszulesenden Eigenschaft

Ergebnis:  Kein, das Ole-Funktionsergebnis landet in resultat!

Zweck: Abrufen von OLE-Eigenschaften.

Anmerkung: Bei OLE-Eigenschaften, die Aufrufparameter benötigen sind die Funktionen OlePropGet1,OlePropGet2,...,OlePropGet5 zu verwenden. Die Zahl am Ende des Namens gibt die Menge der zusätzlichen Variant Parameter an.

### OleProcedure0

```pascal
procedure OleProcedure0(variante:integer;name:string);
```

Parameter: variante ... Referenz auf das OLE-Objekt, dessen Prozedur 'name'

ausgeführt werden soll.

name ....... der Name der auszuführenden Prozedur

Zweck:       Aufrufen von OLE-Prozeduren.

Anmerkung: Bei OLE-Prozeduren, die Aufrufparameter benötigen sind die Funktionen OleProcedure1,OleProcedure2,...,OleProcedure5 zu verwenden. Die Zahl am Ende des Namens gibt die Menge der zusätzlichen Variant Parameter an.

### OlePropSet1

```pascal
procedure OleProcedure0(variante:integer;name:string;p:integer);
```

Parameter: variante ... Referenz auf das OLE-Objekt, dessen Eigenschaft 'name'

gesetzt werden soll.

name ...... der Name der Eigenschaft

p ......   .... Referenz auf eine Parameter-Variante

Zweck:     Setzen von OLE-Eigenschaften.

Anmerkung: Bei OLE-Eigenschaften, die weitere Aufrufparameter benötigen sind die Funktionen OlePropSet2,...,OlePropSet5 zu verwenden. Die Zahl am Ende des Namens gibt die Menge der zusätzlichen Variant Parameter an.

### VarToStr

```pascal
procedure VarToStr(variante:integer;s:string);
```

Parameter: variante ... Referenz auf die zu konvertierende Variante

s ..........    Ergebnispuffer

Zweck:        Auslesen einer Variante im String-Format.

### StrToVar

```pascal
procedure StrToVar(s:string;variante:integer);
```

Parameter: s .......... zu setzender String

variante ... Referenz auf eine Ole-Variante

Zweck:       setzen einer Variante mit einem String.

### VarToInt

```pascal
function VarToInt(variante:integer):integer;
```

Parameter: variante ... Referenz auf die zu konvertierende Variante

Ergebnis:  Inhalt der Variante als Integer-Wert.

Zweck:     Auslesen einer Variante im Integer-Format.

### IntToVar

```pascal
procedure StrToVar(i,variante:integer);
```

Parameter: i .......... zu setzender Integerwert

variante ... Referenz auf eine Ole-Variante

Zweck:     setzen einer Variante mit einer Integerzahl.

### VarToReal

```pascal
function VarToReal(variante:integer):real;
```

Parameter: variante ... Referenz auf die zu konvertierende Variante

Ergebnis:  Inhalt der Variante als Real-Wert.

Zweck:     Auslesen einer Variante im Real-Format.

### IntToVar

```pascal
procedure RealToVar(r:real;variante:integer);
```

Parameter: r .......... zu setzender Realwert

variante ... Referenz auf eine Ole-Variante

Zweck:      setzen einer Variante mit einer Realzahl.

### VarIsNull

```pascal
function VarIsNull(variante:integer) : integer;
```

Parameter: variante ... Referenz auf eine Ole-Variante

Resultat:    Liefert 1, falls die Variante den Typ varNull hat.

Andernfalls wird 0 zurückgegeben.

### VarIsEmpty

```pascal
function VarIsEmpty(variante:integer) : integer;
```

Parameter: variante ... Referenz auf eine Ole-Variante

Resultat:     Liefert 1, falls die Variante den Typ varEmpty hat.

Andernfalls wird 0 zurückgegeben.

### VarType

```pascal
function VarType(variante:integer) : integer;
```

Parameter: variante ... Referenz auf eine Ole-Variante

Resultat:     Liefert den Typ-Code der Variante.

### VarAsType

```pascal
procedure VarType(variante,typ:integer);
```

Parameter: variante ... Referenz auf eine Ole-Variante

typ ...   ..... der neue Typcode

### VarType

```pascal
procedure VarChangeType(variante,typ:integer);
```

Parameter: variante ... Referenz auf eine Ole-Variante

typ ......  .. Typ-Code

### VarAddStr

```pascal
procedure VarAddStr(variante:integer,s:string);
```

Parameter: variante ... Referenz auf eine Ole-Variante

s ...    ....... anzuhängender String

Zweck:     An eine bestehende Variante einen weiteren String anhängen.

### OleGetError

```pascal
function OleGetError(p1:integer) : integer;
```

Parameter: p1... Referenz auf eine Ole-Variante

Zweck:       Fehler-Code aus der OLE-Schnittstelle lesen.

### Zeichenketten-Funktionen

_(Beispiel/Inhalt in der Original-Hilfe nur als Screenshot vorhanden.)_

### StrCmp

```pascal
function StrCmp( s1:string, s2:string ) : integer;
```

Parameter: s1 ... Sting1

s2 ... Sting2

Ergebnis:  <0  s1 ist lexikalisch keiner als s2

=0  s1 und s2 sind identisch

>0  s1 ist lexikalisch größer als s2

Zweck:     Die Funktion vergleicht s1 und s2 Zeichenweise.

### StrCpy,StrNCpy ... Stringkopierer

```pascal
procedure StrCpy ( s1,s2:string );
```

```pascal
procedure StrNCpy( s1,s2:string; n : integer );
```

Parameter: s1 ... Ziel

s2 ... Quelle

nur bei StrNCpy:

n ... max. Anzahl der zu kopierenden Zeichen

Ergebnis:  -/-

Zweck:     Die Funktion kopiert díe Zeichenkette von s2 nach s1.

ACHTUNG: Es wird immer ein Terminator-Zeichen ans Ende der n Zeichen kopiert! strncpy(s1,s2,6) kopiert also 7 Zeichen in s1!!

### StrCat ... Zeichenkette einfügen

```pascal
procedure StrCat( s1:string, s2:string )
```

Parameter: s1  Ziel

s2  Quelle

Ergebnis:   -/-

Zweck:      Die Funktion fügt die Zeichenkette s2 an s1 an. Im Zeichenkettenpuffer für s1 muss genügend Platz vorhanden sein!

### StrLen ... Zeichenkettenlänge ermitteln

```pascal
function StrLen( s:string ) : integer
```

Parameter: s   die zu untersuchende Zeichenkette

Ergebnis:   die Länge der Zeichenkette

Zweck:       Die Funktion ermittelt die Länge eines gegebenen Strings.

### IsEmpty ... Zeichenketteninhalt prüfen

```pascal
function IsEmpty( s: STRING ) : boolean
```

Parameter: s     die zu überprüfende Zeichenkette

Ergebnis:  die Funktion liefert folgendes Ergebnis true  der String enthält nur Leerzeichen ( ' ' ) oder hat die Länge Null false alle anderen Fälle

Zweck:     Überprüft den Inhalt einer Zeichenkette

### StrPat

```pascal
procedure StrPat( buf:string, old,new : char );
```

Parameter: buf ... Puffer in dem die Zeichen ersetzt werden sollen

old ... das zu ersetzende Zeichen

new ... das neu einzufügende Zeichen

Ergebnis:  -/-

Zweck:      Ersetzt innerhalb eines String-Puffers alle vorkommen des Zeichens 'old' durch 'new'.

### SubStr ... Zeichenkopierer

```pascal
procedure SubStr( s1:string, s2:string, pos:integer, len:integer );
```

Parameter: s1  Ziel

s2  Quelle

pos Startposition in der Quelle

len Länge des Substrings

Ergebnis:  -/-

Zweck:     Die Funktion kopiert ab Stelle pos in s2 genau len Zeichen nach s1.

### StrRight

```pascal
procedure StrRight(s1,s2 : string; len : integer);
```

Parameter: s1 .... Ergebnispuffer

s2 .... Quelle

len ...  Längenangabe

Ergebnis:  -/-

Zweck:     Vom rechten Rand der Zeichenkette 's2' werden 'len' Zeichen in den Ergebnispuffer 's1' kopiert.

### StrLeft

```pascal
procedure StrLeft(s1,s2 : string; len : integer);
```

Parameter: s1 .... Ergebnispuffer

s2 .... Quelle

len ... Längenangabe

Ergebnis:   -/-

Zweck:       Vom linken Rand der Zeichenkette 's2' werden 'len' Zeichen in den Ergebnispuffer 's1' kopiert.

### StrUpper ... Zeichenkette in Großbuchstaben umwandeln

```pascal
procedure StrUpper( s : string );
```

Parameter: s ... umzuwandelnde Zeichenkette

Ergebnis:  -/-

Zweck:     Alle Zeichen in einem Puffer in Großbuchstaben wandeln.

### StrLower ... Zeichenkette in Kleinbuchstaben umwandeln

```pascal
procedure StrLower( s : string );
```

Parameter: s ... umzuwandelnde Zeichenkette

Ergebnis:  -/-

Zweck:     Alle Zeichen in einem Puffer in Kleinbuchstaben wandeln.

### StrOpt

```pascal
procedure StrOpt( s : string );
```

Parameter: s ... zu optimierende Zeichenkette

Ergebnis:  -/-

Zweck:     Optimieren von Zeichenketten derart, das mehrfach hintereinander auftreffende white-space-Zeichen in nur EIN Leerzeichen zusammengefasst werden. Beispiel: "ab     c d" -> "ab c d"

### StrOpt2

```pascal
procedure StrOpt2( s : string );
```

Parameter: s ... zu optimierende Zeichenkette

Ergebnis:  -/-

Zweck:     Optimieren von Zeichenketten derart, das alle white-space-Zeichen in einem String entfernt werden. Beispiel: "ab     c d" -> "abcd"

### StrLTrim

```pascal
procedure StrLTrim( s : string );
```

Parameter: s ... die zu manipulierende Zeichenkette

Ergebnis:  -/-

Zweck:     Alle Leerzeichen am linken Ende werden entfernt.

### StrRTrim

```pascal
procedure StrRTrim( s : string );
```

Parameter: s ... die zu manipulierende Zeichenkette

Ergebnis:  -/-

Zweck:     Alle Leerzeichen am rechten Ende werden entfernt.

### StrAllTrim / StrLRTrim

```pascal
procedure StrAllTrim( s : string );
```

oder

```pascal
procedure StrLRTrim( s : string );
```

Parameter: s ... die zu manipulierende Zeichenkette

Ergebnis:  -/-

Zweck:     Alle Leerzeichen am Anfang und Ende werden entfernt.

### StrToInt

```pascal
function StrToInt( s: string ) : integer;
```

Parameter: s ... die zu konvertierende Zeichenkette

Ergebnis:  liefert den numerischen Integerwerte der Zeichenkette

Zweck:     Umwandeln von Integerzahlen aus der Stringdarstellung in die Integerdarstellung.

Anmerkung: Die Umwandlung bricht beim ersten auftreten eines nicht

numerischen Zeichens in der Zeichenkette ab!

```pascal
StrToInt("123abc2345") liefert 123
StrToInt("123.2345"  ) liefert 123
```

### IntToStr

```pascal
procedure IntToStr( i:integer;s:string);
```

Parameter: i ... der umzuwandelnde Integerwert

s ... der Ergebnispuffer

Ergebnis:  -/-

Zweck:     Umwandeln von Integerwerten in Zeichenketten.

### StrToReal

```pascal
function StrToReal( s : string ) : real;
```

Parameter:    s ... die umzuwandelnde Zeichenkette

Ergebnis:      liefert die numerische Darstellung der Zeichenkette.

Zweck:         Umwandlung von Zeichenketten in Realzahlen.

Anmerkung: Die Umwandlung bricht beim ersten auftreten eines nicht numerischen Zeichens in der Zeichenkette ab! Dezimalzeichen ist der Punkt '.' nicht das Komma!!

### RealToStr

```pascal
procedure RealToStr( r:real; s,fmt:string );
```

Parameter: r ... die umzuwandelnde Realzahl

s ... der Ergebnispuffer

fmt . Formatangabe wie bei sprintf, z.B. "%15.4f"

Ergebnis:  -/-

Zweck:     Umwandeln von Realzahlen in Zeichenketten.

### GetNextVal_L

```pascal
function GetNextVal_L(start:integer;delim,dsc,src:string):integer
```

Parameter: start ... Startposition im String src

delim ... ein String mit Trennzeichenliste

dsc ..... Zeiger auf den Ergebnispuffer

src ..... Zeiger auf den zu untersuchenden String (Quelle)

Ergebnis:  startposition für den nächsten Aufruf oder Null, wenn das Ende in src erreicht wurde.

Zweck:     Liefert aus einem string-Puffer iterativ immer den nächsten SubString, der mit einem Zeichen aus 'delim' getrennt wird.

### GetNextVal

```pascal
function GetNextVal(start:integer;delim:char;dsc,src:string):integer
```

Parameter: start ... Startposition im String src

delim .. das Trennzeichen

dsc . ... Zeiger auf den Ergebnispuffer

src .... . Zeiger auf den zu untersuchenden String (Quelle)

Ergebnis:  Startposition für den nächsten Aufruf oder Null, wenn das Ende in src erreicht wurde.

Zweck:     Liefert aus einem string-Puffer iterativ immer den nächsten SubString, der mit dem Zeichen 'delim' getrennt wird.

### Alloc

```pascal
function Alloc(s:integer):string;
```

Parameter: s ... angeforderte Größe des Puffers

Ergebnis:  Liefert den Zeiger auf den dynamischen Speicher oder Null im Fehlerfalle.

Zweck:     Dynamischen Speicher besorgen.

### free

```pascal
procedure Free(s:string);
```

Parameter: s ... der freizugebende Puffer

Ergebnis:  -/-

Zweck:     dynamischen Speicher freigeben

## Vorgänge erzeugen oder laden

Diese Funktionen erzeugen immer eine Referenz auf einen Vorgang oder

NULL im Fehlerfalle. Alle Funktionsaufrufe, die Daten eines Vorgangs

manipulieren, benötigen die Referenz auf den Vorgang als 1. Parameter.


### StartVorgang ... einen neuen Vorgang anlegen

```pascal
function StartVorgang( k,n : integer ) : integer;
```

Parameter:   k ... die Kundennummer

n ... die Vorgangs-Nummer  (z.B. Lieferscheinnummer)

Ergebnis:    Liefert Referenzwert auf den erzeugten Vorgang, Null bei Fehlern. dieser Referenzwert ist bei allen Funktionen, die sich auf diesen Vorgang beziehen anzugeben!

Zweck:       Initialisiert einen Vorgang im A.eins-System. Die Vorgangsklasse und Unterklasse kann mit den  Funktionen 'SetKlassNum' und 'SetUKlassNum' vor dem Funktionsaufruf gesetzt werden.

Anmerkung:   Wird als Vorgangsnummer Null angegeben, so wird die nächste Nummer aus dem zugeordneten Nummernkreis geholt.

ACHTUNG:
Alle mit StartVorgang,LadeVorgang oder LadeVorgangId erzeugten Vorgangsreferenzen M Ü S S E N mit BeendeVorgang wieder freigegeben werden!!

Und zwar immer, auch wenn es beim Erzeugen von Positionen o.ä. Probleme gab!

```pascal
program vt;
```

var

```pascal
v_ref : integer;
begin
v_ref := StartVorgang( 4711, 0 );
if v_ref <> 0 then begin
```

... weitere Programmanweisungen für v_ref

```pascal
BeendeVorgang( v_ref, 1, 0 );
end
end.
```

#### Beispiel für StartVorgang / BeendeVorgang

```pascal
program VorgangBsp;
const
Verkaufsrechnung = 700;  // Vorgangsklassen-Konstante
var
KundenNr,BelegNr,Vorgang,Position : integer;
begin
// Vorgangsparameter setzen
SetKlassNum ( Verkaufsrechnung );
SetUKlassNum( 0                );
KundenNr := 123456;
BelegNr  := 4711;
// Initialisieren der Verkaufsrechnung
Vorgang  := StartVorgang(KundenNr, BelegNr);
if Vorgang <> 0 then begin
// Position einfügen
Position := PositionNeu(
Vorgang,     // Referenzwert von StartVorgang()
"1234",      // ArtikelNummer ( STRING! )
12,          // LagerNummer
1000.0  );   // Menge
PositionAdd(Vorgang);
BeendeVorgang( Vorgang,1,0 );
end
end.
```

### VorgangCopy ... anlegen einer Vorgangskopie

```pascal
function VorgangCopy( v : integer ) : integer
```

Parameter:   v ... der Referenzwert, des zu kopierenden Vorgangs

Ergebnis:    Liefert Referenzwert auf den erzeugten Vorgang,

Null bei Fehlern. Dieser Referenzwert ist bei allen

Funktionen, die sich auf diesen Vorgang beziehen anzugeben!

Zweck:       Erzeugt einen neuen Vorgang aus einem bestehenden. Die zwei Vorgänge sind bis auf die Vorgangsnummer und das Datum identisch.

Beispiel für VorgangCopy

```pascal
PROGRAM RechnungAusRechnung;
```

CONST

```pascal
KLASS_RECHNUNG = 700;
KEINE          =   0;
```

VAR

```pascal
Quelle,  Kopie    : integer;
QuellPos,KopiePos : integer;
BEGIN
SetKlassNum (KLASS_RECHNUNG);
SetUKlassNum(KEINE);
Quelle := LadeVorgang( 9859 );
if Quelle <> 0 then begin
Kopie := VorgangCopy( Quelle );
if Kopie <> 0 then begin
// Kopie zurückschreiben und Speicher freigeben
BeendeVorgang(Kopie,1,0);
end
// Quelle nur aus dem Speicher
// entfernen ... 2. Parameter ist 0 !!!
BeendeVorgang(Quelle,0,0);
end
END.
```

### LadeVorgangId ... Einen Vorgang über die V_ID in den Speicher laden (Korrektur).

```pascal
function LadeVorgangId( V_ID : integer ) : integer
```

Parameter:   V_ID ... die Vorgangs-Identität aus der Datenbank

Ergebnis:      Liefert Referenzwert auf den geladenen Vorgang, Null bei Fehlern.

Zweck:         Einen Vorgang über die V_ID in den Speicher laden.

Anmerkung: Auf den Vorgang kann lesend und schreibend zugegriffen werden!

Beispiel für LadeVorgangId

```pascal
program test;
```

var

```pascal
Vorgang,Position : integer;
begin
Vorgang  := LadeVorgangId( 1234567);
if Vorgang <> 0 then begin
```

...mit den Vorgangsdaten arbeiten...

BeendeVorgang( Vorgang,0,0 );      // belegten Speicher wieder freigeben!

```pascal
end
end.
```

### LeseVorgangId ... Einen Vorgang über die V_ID in den Speicher laden (nur lesen).

```pascal
function LadeVorgangId( V_ID : integer ) : integer
```

Parameter: V_ID ... die Vorgangs-Identität aus der Datenbank

Ergebnis:    Liefert Referenzwert auf den geladenen Vorgang, Null bei Fehlern.

Zweck:        Einen Vorgang über die V_ID in den Speicher laden.

Anmerkung: Auf den Vorgang kann nur lesend zugegriffen werden!

### LadeVorgang ... Vorgang über dessen Nummer in den Speicher laden

```pascal
function LadeVorgang( nummer : integer ) : integer
```

Parameter: nummer ... die Vorgangsnummer

Parameter: Liefert Referenzwert auf den geladenen Vorgang, Null bei Fehlern.

Zweck:       Einen Vorgang in den Speicher laden. Die Vorgangsklasse und Unterklasse wird mit den Funktionen 'SetKlassNum' und 'SetUKlassNum' vorher eingestellt.

Beispiel für LadeVorgang

```pascal
program test;
```

const

```pascal
Verkaufsrechnung = 700;
```

var

```pascal
KundenNr,BelegNr,Vorgang,Position : integer;
begin
SetKlassNum( Verkaufsrechnung );
BelegNr  := 4711;
Vorgang  := LadeVorgang(BelegNr );
if Vorgang <> 0 then begin
```

...mit den Vorgangsdaten arbeiten...

```pascal
BeendeVorgang( Vorgang,0,0 );
end
end.
```

### VorgangStornieren ... einen Vorgang stornieren

```pascal
function VorgangStornieren( v:integer ):integer
```

Parameter: v ... die Vorgangsreferenz, geliefert durch z.B. LadeVorgang

Ergebnis:   1: alles ok

0: Fehler.

Zweck:       Storniert den Vorgang.

### OhneMakroNachlauf

```pascal
procedure OhneMakroNachlauf( v,f:integer );
```

Parameter: v ... die Vorgangsreferenz, geliefert durch z.B. LadeVorgang

f ... Flag 0: falls hinterlegt, so wird der Nachlaufmakro ausgeführt

1: für diesen Vorgang wird kein Nachlaufmakro ausgeführt

Ergebnis:    -/-

Zweck:       Nachlaufmakro für den Vorgang an oder abschalten

### VorgangDrucken ... drucken von Belegen

```pascal
function VorgangDrucken( vorgang,druck_art,nur_ungedruckt : integer ) : integer;
```

Parameter: vorgang ...Referenz auf den zu druckenden Vorgang

druck_art .Code der Druckart

DRUCK_ART_PREVIEW = 0 .virtuell in eine Maske Drucken

DRUCK_ART_ECHT        = 1 .... Normaler Druck

DRUCK_ART_SPOOL      = 2 .... irgendwie mal in den

Spooler

DRUCK_ART_ECHT_OHNE_MERKER  = 3 .... Normaler Druck ohne Vermerkerung

DRUCK_ART_SPOOL_OHNE_MERKER = 4 .... Spool ohne Vermerkerung

nur_ungedruckt.. 0 : egal

1 : nur falls noch ungedruckt

Ergebnis:    0 : Fehler

1 : ohne Fehler gedruckt

Zweck:       drucken von Belegen

### BeendeVorgang ... Vorgang abschließen und speichern

```pascal
function BeendeVorgang( v,d,p: integer ):integer
```

Parameter:   v ... Vorgangsreferenz, die von StartVorgang geliefert wurde

d ... Schalter für 'sichern in Datenbank'

0 : Vorgang wird nicht gesichert

1 : Vorgang kommt in die Datenbank

p ... Schalter für 'in Protokoll-Datei schreiben'

( Standardname: 'imp_prot.txt' )

0 : es wird kein Protokoll angelegt

1 : Vorgang kommt in die Protokoll-Datei

Ergebnis:   >0 : die V_ID des abgespeicherten Vorgangs

0 : Vorgang wurde nicht in der Datenbank gespeichert

Zweck:        Vorgang abschließen und belegte Resourcen freigeben.

siehe auch Beispiel für die Vorgangsbearbeitung

### PositionAusPosition ... Kopieren von Warenpositionen

```pascal
function PositionAusPosition( vorgang,pos:integer ):integer
```

Parameter: vorgang ... Referenzwert des Vorgangs, dem die Position hinzugefügt

werden soll

pos ....     ... Positionsreferenz der zu kopierenden Position

Ergebnis:   Liefert einen Referenzwert auf die neue Position, Null bei Fehlern.

Zweck: Mit dieser Funktion kann man zuvor in den Speicher geladene Vorgangspositionen in einen anderen Vorgang transportieren.

siehe auch Beispiel für die Vorgangsbearbeitung

### ReplacePosition ... überschreiben von Positionen in einem Vorgang

```pascal
function ReplacePosition( pos1,pos2 : integer) : integer;
```

Parameter: pos1 ... Referenz auf die zu ersetzende Position

pos2 ... die neue Position

Ergebnis:    liefert die Referenz der neuen Position oder NULL

Zweck:       überschreiben von Positionen in einem Vorgang

### PositionAdd

```pascal
function PositionAdd( vorgang:integer ) : integer;
```

Parameter: vorgang ... Referenz auf den Vorgang

Ergebnis:    0 : Position konnte nicht eingefügt werden

1 : Position wurde eingefügt

Zweck:       Fügt dem Vorgang die zuletzt erzeugte Position hinzu.

siehe auch Beispiel für die Vorgangsbearbeitung

### PositionIns ... Einfügen an best. Position

```pascal
function PositionIns( vorgang,position_vor:integer ) : integer;
```

Parameter: vorgang   ....... Referenz auf den Vorgang

position_vor .. Referenz auf die Position, vor der die

letzte mit PositionNeu erzeugte Warenposition

eingefügt werden soll

Ergebnis:    0 : Fehler

1 : Position wurde eingefügt

Zweck:       Fügt eine Warenposition in den Vorgangs ein.

### Leerzeile ... erzeugen einer Leerzeile

```pascal
function Leerzeile( vorgang : integer ) : integer;
```

Parameter: vorgang   ....... Referenz auf den Vorgang

Ergebnis:    0 : Fehler

1 : Handle auf die Leerzeile

Zweck:       Anlegen einer Leerzeile.(Zum Vorgang hinzufügen mit PositionAdd.)

### PositionNeuId ... anlegen einer neuen Warenposition über ArtikelId

```pascal
function PositionNeuId( ref,aid:integer; m:real; v:integer ):integer
```

Parameter:   ref ... Referenzwert auf den Vorgang - wird von StartVorgang geliefert

aid ... ArtikelId

m ..... Artikelmenge

v ..... Variante

ARTIKEL_VARIANTE_NORMAL = 1 // normale Warenposition

ARTIKEL_VARIANTE_WERTARTIKEL = 2 // Wertartikel

ARTIKEL_VARIANTE_KOSTEN_ZUORDNUNG  = 7 // Kostenartikel (Mutter der Verteilung)

ARTIKEL_VARIANTE_KOSTEN_VERTEILUNG = 8 // Kostenartikel (Kinder für die Verteilung)

Ergebnis:    Liefert einen Referenzwert auf die neue Position, Null bei Fehlern.

Zweck:       anlegen einer neuen Warenposition

### PositionNeu ... anlegen einer neuen Warenposition

```pascal
function PositionNeu( ref:integer, anr:string, lgnr:integer, m:real ):integer
```

Parameter: ref ... Referenzwert auf den Vorgang - wird von StartVorgang geliefert

anr ... Artikelnummer als string

lgnr .. Lagernummer

m ..... Artikelmenge

Ergebnis:    Liefert einen Referenzwert auf die neue Position, Null bei Fehlern.

Zweck: anlegen einer neuen Warenposition siehe auch Beispiel für die Vorgangsbearbeitung

### ProduktNeu ... anlegen einer Produkt-Warenposition

```pascal
function ProduktNeu( ref:integer, anr:string, lgnr:integer, m:real ):integer
```

Parameter: ref ... Referenzwert auf den Vorgang - wird von StartVorgang geliefert

anr ... Artikelnummer als string

lgnr .. Lagernummer

m ..... Artikelmenge

Ergebnis:    Liefert einen Referenzwert auf die neue Position, Null bei Fehlern.

Zweck:       anlegen einer neuen Produkt-Warenposition

Anmerkung:

Um einen Referenzwert auf die Produktionsdaten zu bekommen,

ist Funktion GetRezept(..) aufzurufen.

### RezeptPreis ... kalkulieren einer Rezeptur

```pascal
procedure RezeptPreis( ref:integer );
```

Parameter: ref       Referenzwert auf die Produkt-Warenposition

Zweck:       Rezeptur kalkulieren und die Preise ermitteln.

### SetRezStrValue,SetRezIntValue,SetRezRealValue ... Rezeptdaten setzen

```pascal
SetRezStrValue ( rez,id:integer; value:string; p:integer ) : integer;
```

```pascal
SetRezIntValue ( rez,id,value,p : integer                ) : integer;
SetRezRealValue( rez,id:integer; value : real; p:integer ) : integer;
```

Parameter: rez .... Referenzwert der Rezeptur ... ( siehe GetRezept )

id ..... Code des zu setzenden/holenden Wertes

value .. zu setzender Wert

p ...... Positionsnummer bei Gruppen - sonst Null angeben!

Ergebnis:    1: fehlerfrei übergeben

0: es sind Fehler aufgetreten

Zweck:       Setzt einen Wert in den Rezeptdaten.

### GetRezStrValue,GetRezIntValue,GetRezRealValue ... Rezepturdaten lesen

```pascal
GetRezStrValue ( rez,topic:integer; value:string; len,param:integer ) : integer;
```

```pascal
GetRezIntValue ( rez,topic,param : integer ) : integer;
GetRezRealValue( rez,topic,param : integer ) : real;
```

Parameter:  rez .... Referenzwert der Rezeptur ... ( siehe GetRezept )

topic... Code des zu setzenden/holenden Wertes

value .. Puffer zur Aufnahme des Wertes

len .... Länge des Puffers

param... Positionsnummer bei Gruppen - sonst Null angeben!

Ergebnis:    !=1 : fehlerfrei übergeben

0    : es sind Fehler aufgetreten

Zweck:       Lesen eines Wertes aus den Rezeptdaten.

### RezeptBewTyp ... Rezepturbewertung festlegen

```pascal
function RezeptBewTyp( ref, typ : integer ) : integer
```

Parameter: ref ...Referenzwert auf die Rezeptdaten

typ ..Bewertungstyp

ARTISTL_BEW_OHNE      = 0 ..... keine Verprobung,

Komponentensumme muß nicht mit Produktwert identisch sein.

ARTISTL_BEW_ADDITIV   = 1 ..... Werte der Komponenten

ergeben additiv den Produktpreis.

ARTISTL_BEW_ANTEILGEW = 2 ..... Differenz aus Produktpreis

minus Komponentensumme wird anteilgewichtet auf die

Komponenten umgelegt.

ARTISTL_BEW_WERTGEW   = 3 ..... Differenz aus Produktpreis

minus Komponentensumme wird wertgewichtet auf die

Komponenten umgelegt.

Ergebnis:    0: Fehler

1: ohne Fehler

Zweck:       Typ der Rezepturbewertung festlegen.

### Komponente ............. neue Komponente erzeugen

```pascal
function Komponente( v_ref, p_ref:integer; anr:string; lgnr:integer; m:real;
```

WA, pau, fix : boolean ; schwund : real ):integer

Parameter:   v_ref ... Referenzwert den Vorgang

p_ref ... Referenzwert auf die Produkt-Warenposition

anr ..... Artikelnummer als string

lgnr .... Lagernummer

m ....... Artikelmenge

WA ...... Wertartikel-Kennzeichen

pau ..... Pauschal-Kennzeichen

fix ..... Fixpreis-Kennzeichen

schwund . Schwundfaktor dieser Komponente

Ergebnis:     0 : Komponente konnte nicht erzeugt werden

>0 : Referenz auf die Komponente

Zweck:       Anlegen einer neuen Warenposition als Komponente einer Rezeptur. Anmerkung:   Um einen Referenzwert auf die Rezeptdaten zu bekommen, ist Funktion GetRezept auf die Produktzeile anzuwenden.

### GetRezept ... Referenzwert auf Rezeptdaten besorgen.

```pascal
function GetRezept( ref:integer ):integer
```

Parameter:   ref ... Referenzwert auf die Produkt-Warenposition

Ergebnis:    0 : Fehler

>0 : Referenz auf die Rezept-Daten

Zweck:       Referenzwert auf Rezeptdaten besorgen.

### GetKompIter

```pascal
function GetKompIter( ref:integer ):integer
```

Parameter: ref ... Referenzwert auf die Rezeptdaten. (siehe GetRezept)

Ergebnis:    0 : Fehler

>0 : Referenzwert auf die Iterator-Instanz der Komponenten.

Zweck:  Referenzwert auf einen Iterator über alle Komponenten in

einem Rezept besorgen. Um Referenzen auf die jeweiligen

Warenpositionen, also den eigentlichen Komponenten zu erhalten

dient die Funktion GetNextKomp.

### DeleteKompIter

```pascal
procedure DeleteKompIter( ref:integer );
```

Parameter: ref ... Referenzwert auf die Iteratorinstanz. (siehe GetKompIter)

Zweck:       Entfernt die Iteratorinstanz aus dem Speicher und gibt dessen Resourcen wieder frei.

### RestartKompIter

```pascal
procedure RestartKompIter( ref:integer )
```

Parameter: ref .. Referenzwert auf die Iteratorinstanz. (siehe GetKompIter)

Zweck:       Zurücksetzen der Iteratorinstanz. Danach liefert GetNextKomp wieder die 1. Komponente!

### GetNextKomp

```pascal
function GetNextKomp( ref:integer ):integer;
```

Parameter:   ref ... Referenzwert auf die Iterator - Instanz. (siehe GetKompIter)

Ergebnis:    0 : es sind Fehler aufgetreten

>0 : Referenzwert auf die nächste Komponenten-Warenposition.

Zweck:       Iteration über alle Komponenten. Mit dem gelieferten Referenzwert

können die Merkmale der Komponente (z.B. der Preis )

gelesen oder auch gesetzt werden. (siehe hierzu Set/GetValXXXPos )

### GetKomp

```pascal
function GetKomp(rezept,pos : integer) : integer;
```

Parameter:   rezept ... Referenz des Rezepts

pos ...... Position im Rezept

das 1. Element hat den Index 1!

Ergebnis:     0 : Fehler / Ende der Liste

>0 : Referenz der Komponente

Zweck:       Wahlfreier Zugriff auf Komponenten innerhalb von Rezepturen.

### GetKompCount ... die Rezeptgröße bestimmen

```pascal
function GetKompCount( rezept : integer ) : integer;
```

Parameter:   rezept ... Referenz des Rezepts

Ergebnis:   -1 : Fehler

>=0 : Anzahl der Komponenten

Zweck:       die Rezeptgröße bestimmen

### ZeilenZuAb

```pascal
ZeilenZuAb( vorgang:integer; text:string;zuab:real;typ:integer):integer
```

Parameter: vorgang ... Referenz auf Vorgang

text ...... Zu-/Abschlagstext

zuab ...... Zu-/Abschlagswert

typ ....... Zu-/Abschlagstyp

Ergebnis:    Referenzwert des Zu- oder Abschlages, Null bei Fehlern.

Zweck:       Erzeugt zur letzten erzeugten Position des Vorgangs einen Zu-/Abschlag.

Typen:

ZUAB_TYP_RABATT            =  1 ...  Rabatte (Vorzeichen umgekehrt zur Ware)

ZUAB_TYP_RABATT_INDIV      = 11 ...  Individual-Rabatte (Vorzeichen umgekehrt zur Ware)

ZUAB_TYP_ZUABSCHLAG        =  2 ...  Zu-/Abschläge (Vorzeichen wie Ware)

ZUAB_TYP_ZUABSCHLAG_INDIV  = 12 ...  Individual-Zu-/Abschläge (Vorzeichen wie Ware)

ZUAB_TYP_FRACHT            =  3 ...  Fracht (Vorzeichen wie Ware)

ZUAB_TYP_FRACHT_INDIV      = 13 ...  Individual-Fracht (Vorzeichen wie Ware)

ZUAB_TYP_VERPACKUNG        =  4 ...  Verpackung (Vorzeichen wie Ware)

### ZeilenZuAbEx

```pascal
ZeilenZuAbEx( vorgang:integer; text:string;zuab:real;typ,formel:integer):integer
```

Parameter:   vorgang ... Referenz auf Vorgang

text ...... Zu-/Abschlagstext

zuab ...... Zu-/Abschlagswert

typ ....... Zu-/Abschlagstyp

formel .... der Berechnungstyp

Ergebnis:    Referenzwert des Zu- oder Abschlages, Null bei Fehlern.

Zweck:       Erzeugt zur letzten erzeugten Position des Vorgangs einen Zu-/Abschlag.

Typen:

ZUAB_TYP_RABATT=  1  Rabatte (Vorzeichen umgekehrt zur Ware)

ZUAB_TYP_RABATT_INDIV = 11Individual-Rabatte (Vorzeichen umgekehrt zur Ware)

ZUAB_TYP_ZUABSCHLAG=  2Zu-/Abschläge (Vorzeichen wie Ware)

ZUAB_TYP_ZUABSCHLAG_INDIV= 12Individual-Zu-/Abschläge (Vorzeichen wie Ware)

ZUAB_TYP_FRACHT=  3 Fracht (Vorzeichen wie Ware)

ZUAB_TYP_FRACHT_INDIV= 13Individual-Fracht (Vorzeichen wie Ware)

ZUAB_TYP_VERPACKUNG=  4Verpackung (Vorzeichen wie Ware)

Formeln:

ZUAB_FORMEL_WARENWERT_KETTE  =  1 Prozent vom Warenwert abz. voriger Zu-/Abschläge

ZUAB_FORMEL_WARENWERT=  2Prozent vom Warenwert

ZUAB_FORMEL_RWPREIS=  3Zu-/Abschlag als Preis für Rohware

ZUAB_FORMEL_RWMENGE=  4Zu-/Abschlag als Menge für Rohware

ZUAB_FORMEL_WARENPREIS_KETTE =  5vom Warenwert, gerundet gemäß Einzelpreis, abz. voriger Zu-/Abschläge

ZUAB_FORMEL_WARENPREIS=  6Prozent vom Warenwert, gerundet gemäß Einzelpreis

ZUAB_FORMEL_EINZELPREIS= 11Zu-/Abschlagssatz wie Einzelpreis der Ware

ZUAB_FORMEL_MENGENEINHEIT= 12Satz je Mengeneinheit

ZUAB_FORMEL_VERPACKEINHEIT = 13Satz je Verpackungseinheit (Gebinde)

ZUAB_FORMEL_GEWICHT= 14Satz je Gewichtseinheit

ZUAB_FORMEL_POSITIONEN= 15Satz je Position

ZUAB_FORMEL_MANUELL= 99Pauschale (manuelle Eingabe)

### SetValZuAb,GetValZuAb

```pascal

```

```pascal
SetValZuAb( zuab:integer; id:integer; value:string; p:integer ) : integer;
GetValZuAb( zuab:integer; id:integer; value:string; p:integer ) : integer;
```

Parameter: zuab Referenzwert des Zu-/Abschlags

id .....Code des zu setzenden/holenden Wertes

value zu setzender Wert bei SetValue; Ergebnispuffer bei GetValue

p .....Positionsnummer bei Gruppen - sonst Null angeben!

Ergebnis: 1: fehlerfrei 0: es sind Fehler aufgetreten

Zweck:       Setzt bzw. holt einen Wert aus einem Zu-/Abschlag.

### GetValue ... auslesen von Eigenschaften des Vorgangs

```pascal
GetValue( vorgang,id:integer; value:string; p:integer ) : integer;
```

```pascal
Parameter: vorgang .Referenzwert des Vorgangs
id ........   Code der Eigenschaft
value ..... Ergebnispuffer
p ....    .... Positionsnummer bei Gruppen - sonst Null angeben
Ergebnis:   0 : die Eigenschaft konnte nicht gelesen werden
1 : die Daten sind gültig
Zweck:       auslesen von Eigenschaften des Vorgangs
Anmerkung:
```

### SetValue ... setzen von Eigenschaften des Vorgangs

```pascal
SetValue( vorgang,id:integer; value:string; p:integer ) : integer;
```

Parameter: vorgang Referenzwert des Vorgangs

id ........  Code der Eigenschaft

value . .. zu setzender Wert der Eigenschaft

p ........ . Positionsnummer bei Gruppen - sonst Null angeben

Ergebnis:   0 : die Eigenschaft konnte nicht gesetzt werden

1 : die Daten sind gültig

Zweck:       setzen von Eigenschaften des Vorgangs

Anmerkung:

### GetValPos .....auslesen von Positions-Eigenschaften

```pascal
GetValPos( positon,id:integer; value:string; p:integer ) : integer;
```

```pascal
Parameter:  position. Referenzwert der Warenpositon
id ......... Code der Eigenschaft
value ...... Ergebnispuffer
p .......... Positionsnummer bei Gruppen - sonst Null angeben!
Ergebnis:     0 : die Eigenschaft konnte nicht gelesen werden
1 : die Daten sind gültig
Zweck:       auslesen von Positions-Eigenschaften.
```

### SetValPos .....setzen von Positions-Eigenschaften

```pascal
SetValPos( positon,id:integer; value:string; p:integer ) : integer;
```

Parameter: position Referenzwert der Warenpositon

id ......... Code der Eigenschaft

value ... der neue Eigenschaftswert

p .......... Positionsnummer bei Gruppen - sonst Null angeben!

Ergebnis:    0 : die Eigenschaft konnte nicht gesetzt werden

1 : die Daten sind gültig

Zweck:       setzen von Positions-Eigenschaften.

### SetKlassNum, SetUKlassNum, SetJahrNum

```pascal
procedure SetKlassNum ( k  : integer );
```

```pascal
procedure SetUKlassNum( uk : integer );
procedure SetJahrNum  ( jnr: integer );
```

Parameter: k .... Vorgangsklasse

uk .. Vorgangs Unterklasse

jnr .. Jahrnummer

Zweck:       Setzt für den nächsten und alle folgenden mit StartVorgang()

erzeugten Vorgängen die Klasse, Unterklasse oder Jahrnummer.

siehe auch Beispiel für die Vorgangsbearbeitung

### GetJahrnum ... aktuelles Geschäftsjahr auslesen

```pascal
function GetJahrnum( ) : integer;
```

```pascal
Zweck:       aktuelles Geschäftsjahr auslesen
```

### SetBlanks ... entfernt führende Blanks vor ArtikelNummer

```pascal
procedure SetBlanks( flag : integer );
```

Parameter: flag ... 0 : ArtikelNummer 1:1 übernehmen

1 : führende Leerzeichen entfernen

Zweck:       entfernt führende Blanks vor ArtikelNummer in den Funktionen PositionNeu u.ä.

### GetFirstPos

```pascal
function GetFirstPos( ref: integer):integer;
```

Parameter:   ref ... Vorgangs-Referenz

Ergebnis:   >0 : Referenz der 1. Position

0 : Fehler

Zweck:       Iteration über alle Vorgangspositionen starten und 1. Position liefern.

### GetFirstPosEx

```pascal
function GetFirstPosEx( ref,nur_druckbar: integer):integer;
```

Parameter:   ref ... Vorgangs-Referenz

nur_druckbar : 1: es wird nur über die druckbaren Positionen iterriert

0: alle Positionen werden beachtet

Ergebnis:      >0 : Referenz der 1. Position

0 : Fehler

Zweck:          Iteration über alle Vorgangspositionen starten und 1. Position liefern.

### GetFirstPosEx

```pascal
function GetNextPos( ref: integer):integer;
```

Parameter:   ref ... Vorgangs-Referenz

Ergebnis:   >0 : Referenz der nächsten Position

0 : Fehler

Zweck:       Die nächste Position des Vorgangs holen.

### GetFirstWaPos

```pascal
function GetFirstWaPos( ref: integer):integer;
```

Parameter:   ref ... Vorgangs-Referenz

Ergebnis:   >0 : Referenz der 1. Position

0 : Fehler

Zweck:       Iteration über alle Vorgangspositionen starten und

1. Position liefern.

### GetNextWaPos

```pascal
function GetNextWaPos( ref: integer):integer;
```

Parameter: ref ... Vorgangs-Referenz

Ergebnis:   >0 : Referenz der nächsten Position

0 : Fehler

Zweck:       Die nächste Position des Vorgangs holen.

### DeleteWaPos

```pascal
function DeleteWaPos( position:integer ) : integer;
```

Parameter: position ... Referenz der Positition

Ergebnis:    0 : Fehler, Position konnte nicht gelöscht werden

1 : ok

Zweck:       Löschen von Warenpositionen

Achtung:

Der Referenzwert auf die Position ist nach dem Aufruf dieser

Funktion nicht mehr gültig!

Hier ein fehlerhaftes Programmfragment:

```pascal
program delpos_example;
```

var

```pascal
pos : integer;
```

. . .

```pascal
begin
```

. . .

```pascal
pos := GetNextPos( Vorgang );
DeletePos( pos );
```

SetValPos( pos, 1000, "xyz", 0);   // FEHLER!! pos ist ungültig

. . .

```pascal
end.
```

### DeleteWaPos

```pascal
function FindPos( position : integer ) : boolean
```

Parameter:   position ... Referenz der Positition

Ergebnis:    true, wenn die Position aufgefunden wurde sonst false

Zweck:       Restaurieren der GetNextPos-Resourcen.

Anmerkung:   Die Funktionen GetFirstPos und GetNextPos benutzen intern einen Speicher, der durch die Funktionen SetValue, SetValPos und SetValZuAb verändert wird. Benutzt man also die SetValXX Funktionen in Verbindung mit der GetNextPos-Funktion, so ist IMMER FindPos aufzurufen!

### GetPosType

```pascal
function GetPosType( position : integer ) : integer;
```

Parameter:   position ... Referenz der Positition

Ergebnis:    -1    : Fehler

sonst : Typcodierung der Positionszeile

Zweck:       Ermittelt den Typ der Positionszeile.

### GebindeWaPos ... Gebindekennzeichen

```pascal
function GebindeWaPos( position : integer ) : boolean;
```

Parameter: position ... Referenz der Positition

Ergebnis:   false : kein Gebinde

true  : Warenposition ist ein Gebinde

Zweck:       Ermittelt das Gebindekennzeichen der Positionszeile.

### GebindeInfoAdd ... weitere GebindeInfo-Zeile zu Position

```pascal
function GebindeInfoAdd(position:integer;menge:real):integer;
```

Parameter: position ... Referenz der Positition

menge ...... die Gebindemenge

Ergebnis:   0  : es ist ein Fehler beim erzeugen aufgetreten

>0 : Handle auf die GebindeInfo

Zweck:       Erweitert eine WarenPosition um eine Gebindezeile.

### SetValGI .....setzen von GebindeInfo-Eigenschaften

```pascal
SetValGI( gi,id:integer; value:string; p:integer ) : integer;
```

Parameter:   gi ......... Referenzwert der GebindeInfo-Zeile

id ......... Code der Eigenschaft

value ....der neue Eigenschaftswert

p .......... Positionsnummer bei Gruppen - sonst Null angeben!

Ergebnis: 0 : die Eigenschaft konnte nicht gesetzt werden

1 : die Daten sind gültig

Zweck: setzen von GebindeInfo-Eigenschaften.

### GetValGI .....auslesen von GebindeInfo-Eigenschaften

```pascal
GetValGI( gi,id:integer; value:string; p:integer ) : integer;
```

```pascal
Parameter: gi ......... Referenzwert der Warenpositon
id ......... Code der Eigenschaft
value ... Ergebnispuffer
p .......... Positionsnummer bei Gruppen - sonst Null angeben!
Ergebnis:    0 : die Eigenschaft konnte nicht gelesen werden
1 : die Daten sind gültig
Zweck:       auslesen von GebindeInfo-Eigenschaften.
```

### TextNeu ..... neue Textzeile erstellen

```pascal
function TextNeu(vgd_hdl : integer; text_ptr:string) : integer;
```

Parameter: vgd_hdl .... HANDLE des Vorgangs

text_ptr ... der Zeilentext

Ergebnis: 0 : Position konnte nicht erstellt werden

>0 : HANDLE der Position

Zweck:     neue Textzeile erstellen

## Zusatzzeilen


### WPGetZusatzZeile

```pascal
function WPGetZusatzZeile(w_hdl:integer; p_hdl:^integer; typ,i:integer):integer;
```

Parameter: w_hdl Handle auf die Warenposition

p_hdl Zeiger auf einen Positionshandle

typ ....Positionstyp

i ......  die wievielte Position des Typs

Ergebnis: 0: Fehler

1: der Handle p_hdl ist gültig

Zweck:     Zur Iteration über alle der Warenposition zugeordneten Zeilen.

### WPAnzZusatzZeile

```pascal
function WPAnzZusatzZeile(w_hdl,typ:integer):integer;
```

Parameter: w_hdl ... Handle auf die Warenposition

typ ..... Positionstyp

Ergebnis:   liefert die Menge der Zusatzzeilen von einem bestimmten Typ.

Zweck:      Untersuchen der Zusatzzeilen zu einer Warenposition.

### WPSucheZusatzZeile

```pascal
function WPSucheZusatzZeile(w_hdl,p_hdl:integer):integer;
```

Parameter: w_hdl ... Handle auf die Warenposition

p_hdl ... Handle auf die hinzuzufügende Position

Ergebnis: 0: nicht gefunden

>0: Index der Zeile

Zweck:     Suchen einer bestimmten Zeile in der Linkliste.

## Strecke/Partie


### StreckePartieNeu

```pascal
function StreckePartieNeu( vorgang,typ : integer ) : integer;
```

typ ....... Strecke oder Partie

PARTIE_TYP_PARTIE   = 1

PARTIE_TYP_STRECKE  = 2

Ergebnis:  false : Strecke / Partie konnte nicht angelegt werden

true  : ok

Zweck: anlegen einer Strecke / Partie

Anmerkung: Der alte Funktionsname lautet 'StreckeNeu'. Bitte nur noch den neuen Funktionsnamen verwenden!

### StreckePartieAdd

```pascal
function StreckePartieAdd(vgd_hdl,typ : integer) : integer;
```

Parameter: vgd_hdl ... HANDLE des Vorgangs

typ ....... Strecke oder Partie

PARTIE_TYP_PARTIE   = 1

PARTIE_TYP_STRECKE  = 2

Ergebnis:  false : Vorgang konnte der Strecke / Partie nicht angelegt

zugeordnet werden

true  : ok

Zweck:  Einen Vorgang einer Strecke / Partie zuordnen

Anmerkung: Der alte Funktionsname lautet 'StreckeAdd'.Bitte nur noch den neuen Funktionsnamen verwenden!

### SetValBlock,GetValBlock .....setzen/lesen von Block-Eigenschaften

```pascal
GetValBlock( vorgang,id:integer; value:string; p:integer ) : integer;
```

```pascal
SetValBlock( vorgang,id:integer; value:string; p:integer ) : integer;
```

Parameter:   vorgang .Referenzwert des Vorgangs

id .........  Code der Eigenschaft

value .....der neue Eigenschaftswert

p .......... Positionsnummer bei Gruppen - sonst Null angeben!

Ergebnis: 0 : Fehler

1 : die Daten sind gültig

Zweck: setzen/lesen von Block-Eigenschaften.

### GegenPos

```pascal
procedure GegenPos( pos : integer );
```

Parameter: pos ... Referenz der Position

Zweck:       Position als Gegenposition (VK-Seite) in einer Strecke markieren.

### CopyFromHptPos

```pascal

```

Parameter:

Parameter:

Zweck:

Anmerkung:

### CopyFromHptVorg

```pascal

```

Parameter:

Parameter:

Zweck:

Anmerkung:

### ProdBewertung

```pascal
function ProdBewertung( pos : integer ) : real;
```

Parameter: pos ... Referenz des Artikels

Ergebnis: den Preis laut SPA - Bewertungstyp

Zweck: Preisermittelung für Produktions-Artikel

Anmerkung: Liefert den Preis pro 1 Lagermengeneinheit

### MengeNormalisieren

```pascal

```

```pascal
function MengeNormalisieren( m : real; von,nach : integer) : real;
```

Parameter: m ...     Menge

von .... Mengeneinheit 'von'

nach... Mengeneinheit 'nach'

Ergebnis:  die umgerechnete Menge

Zweck: Umrechnung von Mengeneinheiten

### CopyVorgKopf

```pascal
procedure CopyVorgKopf(ziel,quelle:integer);
```

Parameter: ziel .... Referenz auf den Vorgang, der die Daten übernehmen soll

quelle .. Referenz auf den Quellvorgang

Zweck:       Kopieren von Vorgangskopf-Informationen aus einem Quellbeleg.

## Partie / Strecke


### PSNeuAnlage

```pascal
function PSNeuAnlage(typ:integer) : integer;
```

Parameter: typ ... Typ der Neuanlage

1: Partie

2: Strecke

Ergebnis:  Handle auf die Partie/Strecke oder Null im Fehlerfall

Zweck:  Anlegen einer neuen Partie / Strecke.

Anmerkung: Die Daten werden erst durch die Funktion PSBeende in die Datenbank übernommen.

### PSSetValue

```pascal
function PSSetValue(handle,topic:integer;value:string) : integer;
```

Parameter: handle ... Handle der Partie/Strecke

topic .... ID des zu setzenden Attributs

value .... zu setzender Wert

Ergebnis:  0 : Fehler

>0: Wert wurde übernommen

Zweck:     Werte in einer neuen Partie / Strecke setzen.

Anmerkung: Die Daten werden erst durch die Funktion PSBeende in die Datenbank übernommen.

### PSGetValue

```pascal
function PSGetValue(handle,topic:integer;value:string;size:integer) : integer;
```

Parameter: handle ... Handle der Partie/Strecke

topic .... ID des zu setzenden Attributs

value .... Ergebnispuffer

size ..... Größe des Ergebnispuffers (-1: Größe wird ignoriert)

Ergebnis:   0 : Fehler

>0: Wert im Puffer ist gültig

Zweck:      Werte in einer neuen Partie / Strecke lesen.

### PSArtikelHinzufuegen

```pascal
function PSArtikelHinzufuegen(handle,artikelid:integer;menge:real; me:integer;netto:real) : integer;
```

Parameter: handle ... Handle der Partie/Strecke

artikelid ... ID des hinzuzufügenden Artikels

menge .... die Sollmenge

me .......... ME der Menge

netto ....... Wert

Ergebnis:  0 : Fehler

>0: Artikel wurde übernommen

Zweck:     Artikel in Partie / Strecke einfügen.

Anmerkung: Zuerst die Funktion PSBeendeAnlage() ausführen, sonst werden die Artikel nicht übernommen.

### PSBeendeAnlage

```pascal
function PSBeendeAnlage(handle:integer) : integer;
```

Parameter: handle ...... Handle der Partie/Strecke

Ergebnis:  0 : Fehler

>0: ok

Zweck: Partie / Strecke in Datenbank speichern

Anmerkung: Erst nach dem Ausführen dieser Funktionen können über

PSArtikelHinzufuegen() Artikel zur Partie/Strecke

hinzugefügt werden.

### PSDelete

```pascal
procedure PSDelete(handle:integer);
```

Parameter: handle ...... Handle der Partie/Strecke

Ergebnis:  -/-

Zweck: Resourcen freigeben

## Datenquelle (für das Druckmodul)

Diese Funktionen sind speziell zur Programmierung von Druckmodul-Makros

vorbehalten. Vom Druckmodul wird der Makroprozedur der Datenquellen-Handle

übergeben. Ein Datenquellen-Handle kann NICHT von einem Makro aus ermittelt

werden.


### DQGetFixValue

```pascal
function DQGetFixValue(dq_hdl,topic,param:integer; buf:string; len:integer):integer;
```

Parameter: dq_hdl ... Handle auf die Datenquelle (wird vom Druckmodul übergeben)

topic .... Zugriffscode auf das zu lesende Attribut

param .... Parameter für den Zugriff (ist vom Zugriffscode abhängig)

buf ...... Ergebnispuffer

len ...... die Länge des Ergebnispuffers

Ergebnis:  0: Fehler

1: ok, der Puffer enthält gültige Daten

Zweck:     Auslesen von Eigenschaften der Datenquelle.

### DQGetFixValueS

```pascal
function DQGetFixValueS(dq_hdl:integer; topic,buf:string; len:integer):integer;
```

Parameter: dq_hdl ... Handle auf die Datenquelle (wird vom Druckmodul übergeben)

topic .... Zugriffscode auf das zu lesende Attribut

buf ...... Ergebnispuffer

len ...... die Länge des Ergebnispuffers

Ergebnis:  0: Fehler

1: ok, der Puffer enthält gültige Daten

Zweck:     Auslesen von Eigenschaften der Datenquelle.

### DQGetSumValue

```pascal
function DQGetSumValue(dq_hdl,topic,param:integer;buf:string;len:integer):integer;
```

Parameter: dq_hdl ... Handle auf die Datenquelle (wird vom Druckmodul übergeben)

topic .... Zugriffscode auf das zu lesende Attribut

param .... Parameter für den Zugriff (ist vom Zugriffscode abhängig)

buf ...... Ergebnispuffer

len ...... die Länge des Ergebnispuffers

Ergebnis:  0: Fehler

1: ok, der Puffer enthält gültige Daten

Zweck:     Auslesen von Summen-Eigenschaften der Datenquelle.(z.B. Steuersumme)

### DQGetFirstPos

```pascal
function DQGetFirstPos(dq_hdl) : integer;
```

Parameter: dq_hdl ... Handle auf die Datenquelle (wird vom Druckmodul übergeben)

Ergebnis:  0 : Datenquelle enthält keine Positionen

>0 : Handle auf die 1. Position

Zweck:     Iteration über die Positionen einer Datenquelle.

### DQGetNextPos

```pascal
function DQGetNextPos(dq_hdl) : integer;
```

Parameter: dq_hdl ... Handle auf die Datenquelle (wird vom Druckmodul übergeben)

Ergebnis:  0 : Datenquelle enthält keine weiteren Positionen

>0 : Handle auf die nächste Position

Zweck:     Iteration über die Positionen einer Datenquelle.

## Folgeartikel-Listen

```pascal
programm:
PROGRAM bsp_folgeartikel;
```

CONST

```pascal
VK_RECHNUNG     =  700;
```

VAR

KundNr,

ArtikelNr,

LagerNr,

BelegNr,

```pascal
Menge : integer;
// Vorgangs-Daten
```

v : integer; // Vorgangsreferenz

p : integer; // Positionsreferenz

f : integer; // Folgeartikel

```pascal
BEGIN
SetKlassNum(VK_RECHNUNG);
v := StartVorgang(10101,0);                      // Kunde=10101
IF v <> 0 THEN BEGIN
f := FACreate(v);                              // Folgeartikel-Datensatz aufbauen
if f <> 0 then begin
p := PositionNeu( v, "001",1, 10 );          // Hauptartikel der Folgeliste anlegen
if p <> 0 then begin
PositionAdd(v);
```

FASetHptWaPos(f,p);                        // und als Hauptartikel kennzeichnen

```pascal
end
p := PositionNeu( v, "400001530",1, 1 );     // Leergutartikel anlegen
if p <> 0 then begin
PositionAdd(v);
```

FAAdd(f,p);                                // in die Folgeartikelliste aufnehmen

FASetBerechWert(p,2.0);                    // Mengenformel m=x / 2.0 definieren

FASetBerechTyp(p,1);                       //                | |  |

```pascal
//                | |  +--- Wert = 2.0
//                | +------ Typ  = 1
//                +-------- Menge Hauptartikel
```

FAMengeAnpassen(f,p);                      // und die Leergutmenge (m) bestimmen

```pascal
end
end
BeendeVorgang(v,1,0);
END
END.
```


### FAInfo

```pascal
function FAInfo( pos : integer ) : integer;
```

Parameter: pos ... Handle auf die zu untersuchende Warenposition

Ergebnis:  >0: Handle auf die verknüpfte Folgeartikel-Info

0: kein Folgeartikel-Info Datensatz vorhanden

Zweck:     Zugriff auf den FolgeartikelInfo-Datensatz

### FACreate

```pascal
function FACreate(hdl:integer):integer;
```

Parameter: hdl ... Handle auf den Vorgang, zu dem die Folgeartikel-Liste

hinzugefügt werden soll.

Ergebnis:  >0: Handle auf die neue Folgeartikel-Info

0: kein Folgeartikel-Info Datensatz erzeugt

Zweck:     Anlegen eines neuen FolgeartikelInfo-Datensatz.

### FATyp

```pascal
function FATyp( pos : integer ) : integer;
```

Parameter: pos ... Handle auf die zu untersuchende Warenposition

Ergebnis:  liefert den Typ der Folgeartikelliste

-1: Fehler.

Zweck:     Folgeartikeltypen:

0: alle übernehmen

1: einen aus der Folge auswählen

2: mehrere übernehmen

### FAGetKennzeichen

```pascal
function FAGetKennzeichen(hdl:integer):integer;
```

Parameter: hdl ... Handle auf die zu untersuchende Warenposition

Ergebnis:  liefert das Folgeartikel-Kennzeichen

Zweck: Kennzeichen-Code:

0: keine Folgeliste assoziiert

1: dies ist eine Folgeartikel-Hauptzeile

2: dies ist eine Folgeartikel-Position

### FASetKennzeichen

```pascal
procedure FASetKennzeichen(hdl,ken:integer);
```

Parameter: hdl ... Handle auf die Warenposition

ken ... das zu setzende Kennzeichen

Ergebnis:  -/-

Zweck: Kennzeichen-Code:

0: keine Folgeliste assoziiert

1: dies ist eine Folgeartikel-Hauptzeile

2: dies ist eine Folgeartikel-Position

### FAGetBerechWert

```pascal
function FAGetBerechWert(hdl:integer):real;
```

Parameter: hdl Handle auf die Warenposition

Ergebnis: liefert den Formelwert zur Mengenbestimmung

Zweck:  Liefert den Zusammenhang zwischen der Menge der Hauptposition und dieser Position.

### FASetBerechWert

```pascal
procedure FASetBerechWert(hdl:integer;val:real);
```

Parameter: hdl Handle auf die Warenposition

val der zu setzende Formelwert

Ergebnis:  -/-

Zweck: Setzt den Zusammenhang zwischen der Menge der Hauptposition und dieser Position.

### FAGetBerechTyp

```pascal
function FAGetBerechTyp(hdl:integer):integer;
```

Parameter: hdl ... Handle auf die Warenposition

Ergebnis:  liefert den Typ der Berechnungsformel zur Mengenbestimmung

Zweck:     Mit den Werten aus Berechnungstyp, Berechnungswert und Menge

der Hauptposition lässt sich die Menge der Folgeartikel definieren.

Berechnungstypen:

0 . Berechnungswert mit Hauptpositionsmenge multiplizieren

1 . Hauptpositionsmenge durch Berechnungswert dividieren

2 . Berechnungswert ist die (konstante) Menge des Folgeartikels

### FASetBerechTyp

```pascal
procedure FASetBerechTyp(hdl,typ:integer);
```

Parameter: hdl ... Handle auf die Warenposition

typ ... zu setzender Formeltyp

Ergebnis:  -/-

Zweck: Mit den Werten aus Berechnungstyp, Berechnungswert und Menge der Hauptposition lässt sich die Menge der Folgeartikel definieren. Berechnungstypen:

0 ... Berechnungswert mit Hauptpositionsmenge multiplizieren

1 ... Hauptpositionsmenge durch Berechnungswert dividieren

2 ... Berechnungswert ist die (konstante) Menge des Folgeartikels

### FAGetFolgeId

```pascal
function FAGetFolgeId(hdl:integer):integer;
```

Parameter: hdl ... Handle auf die Warenposition

Ergebnis: Id der Folgeliste

### FAGetFirst

```pascal
function FAGetFirst(f_hdl,p_hdl:integer):integer;
```

Parameter: f_hdl ... Handle auf den Folgeartikel-Info Datensatz

p_hdl ... Handle auf den Folgelisteniterator

Ergebnis: Handle auf die erste Warenposition der Folgeliste oder Null.

Zweck: Zur Iteration über alle Warenpositionen einer Folgeartikel-Liste.

### FAGetNext

```pascal
function FAGetNext(f_hdl,p_hdl:integer):integer;
```

Parameter: f_hdl ... Handle auf den Folgeartikel-Info Datensatz

p_hdl ... Handle auf den Folgelisteniterator

Ergebnis: Handle auf die erste Warenposition der Folgeliste oder Null.

Zweck: Zur Iteration über alle Warenpositionen einer Folgeartikel-Liste.

### FAAdd

```pascal
procedure FAAdd(f_hdl,w_hdl:integer);
```

Parameter: f_hdl ... Handle auf den Folgeartikel-Info Datensatz

w_hdl ... Handle auf die Warenposition

Ergebnis:  -/-

Zweck: Eine Warenposition in der Folgeartikelliste aufnehmen.

### FAGetHptWapos

```pascal
function FAGetHptWapos(hdl:integer):integer;
```

Parameter: hdl ... Handle auf den Folgeartikel-Info Datensatz

Ergebnis: Liefert den Handle auf die Hauptwarenposition der Folgeartikelliste.

### FAGetHptWapos

```pascal
procedure FASetHptWapos(f_hdl,w_hdl:integer);
```

Parameter: f_hdl ... Handle auf den Folgeartikel-Info Datensatz

w_hdl ... Handle auf die Warenposition

Ergebnis:  -/-

Zweck: Eine Warenposition als Hauptartikel einer Folgeartikelliste festlegen.

### FARecalc

```pascal
procedure FARecalc(hdl:integer);
```

Parameter: hdl ... Handle auf den Folgeartikel-Info Datensatz

Ergebnis:  -/-

Zweck: Berechnet für alle Folgeartikel-Positionen die Menge neu.

### FAMengeAnpassen

```pascal
procedure FAMengeAnpassen(f_hdl,w_hdl:integer);
```

Parameter: f_hdl ... Handle auf den Folgeartikel-Info Datensatz

w_hdl ... Handle auf die Warenposition

Ergebnis:  -/-

Zweck: Berechnet durch die in der Folgeartikelliste hinterlegte Formel die Menge der Warenposition.

### FACreatePosHdl

```pascal
function FACreatePosHdl():integer;
```

Parameter: -/-

Ergebnis:  liefert einen Folgeartikel-Iterator 0: Fehler

### FADeletePosHdl

```pascal
procedure FADeletePosHdl(hdl:integer);
```

Parameter: hdl ... Handle auf den zu löschenden Iterator

Ergebnis:  -/-

## Folgeartikel Daten

Diese Funktionen beziehen sich auf die Folgeartikel, die einem

Hauptartikel als Folgeliste zugeordnet worden sind - also den Stammdaten.


### FADataSize

```pascal
function FADataSize(hdl:integer);
```

Parameter: hdl ... Handle die zu untersuchende Warenposition

Ergebnis:  liefert die Anzahl der dieser WarenPosition zugeordneten Folgeartikel.

Zweck: Zugriff auf die Folgelisten Stammdaten.

Achtung: Dies ist nicht mit der tatsächlich im Beleg fakturierten Folgeartikel-Liste zu verwechseln! Hier handelt es sich um die Anzahl der im Stammdatenpfleger

Folgeartikel' eingegebenen Artikel.

### FADataGetFirst

```pascal
function FADataGetFirst(w_hdl,p_hdl:integer):integer;
```

Parameter: w_hdl ... Handle auf die Warenposition

p_hdl ... Handle auf den Folgelisteniterator

Ergebnis: Handle auf den erste Folgeartikeldatensatz oder Null

Zweck: Zur Iteration über alle Artikel einer Folgeartikel-Liste.

Achtung: Dies ist nicht mit der tatsächlich im Beleg fakturierten Folgeartikel-Liste zu verwechseln! Hier handelt es sich um die Anzahl der im Stammdatenpfleger

Folgeartikel' eingegebenen Artikel.

### FADataGetNext

```pascal
function FADataGetNext(w_hdl,p_hdl:integer):integer;
```

Parameter: w_hdl ... Handle auf die Warenposition

p_hdl ... Handle auf den Folgelisteniterator

Ergebnis: Handle auf den nächsten Folgeartikeldatensatz oder Null

Zweck: Zur Iteration über alle Artikel einer Folgeartikel-Liste.

Achtung: Dies ist nicht mit der tatsächlich im Beleg fakturierten Folgeartikel-Liste zu verwechseln! Hier handelt es sich um die Anzahl der im Stammdatenpfleger

Folgeartikel' eingegebenen Artikel.

### FADataData

```pascal
function FADataData(e_hdl:integer; id,typ:integer^; val:real^; wa:integer^):integer;
```

Parameter: e_hdl ... Handle auf den Datensatz (von FADataGetFirst/FADataGetNext geliefert)

id ...... Ergebnispuffer für die ArtikelId des Folgeartikels

typ ..... Ergebnispuffer für den Formeltyp

val ..... Ergebnispuffer für den Formelwert

wa ...... Ergebnispuffer für das Flag 'als Wertartikel übernehmen'

Ergebnis: 1: die Daten in den Ergebnispuffern sind gültig

0: Fehler

Zweck:  Stammdatendefinition der Folgeartikel auslesen

Achtung: Dies ist nicht mit der tatsächlich im Beleg fakturierten Folgeartikel-Liste zu verwechseln! Hier handelt es sich um die Anzahl der im Stammdatenpfleger

Folgeartikel' eingegebenen Artikel.

### WPMaske

```pascal
function WPMaske(hdl,grp:integer):integer;
```

Parameter: hdl ... Handle auf die Warenposition

grp ... Funktionsgruppe, die zusätzlich in die OptionBox

der Maske geladen werden soll.

Ergebnis: 1: ok

0: Fehler

Zweck: Aufrufen der Warenerfassungs-Maske zu einer Warenposition.

## PARSER

Modul : parser.yy

```pascal
des von 'YACC' generierten Parsers
```

Eingabesprache siehe import.y

Datum      : 31.01.1996

bearbeitet : 20.02.1996

Version    : 4.2

Projekt    : Importscript-Parser

Martin Melchert

Notizblock

-------------------------

Es wird ein Scanner aus der Klasse 'LexicalScanner' def.

in scanner.cpp/.h benötigt.


### InitMaschine

```pascal
void CAmicScriptMaschine::InitMaschine();
```

Parameter: -/-

Ergebnis:  -/-

Zweck:Versetzt die ScriptMaschine in ihren Anfangszustand. Dies muß IMMER vor dem Ausführen eines Makros, oder 1x vor dem 1. Aufruf einer Prozedur per EntryPoint geschehen.

### PrepareExec

```pascal
void CAmicScriptMaschine::PrepareExec(char* name);
```

Parameter: name ... Makroname

Ergebnis:  -/-

Zweck: Vorbereitungen zur Ausführung des Scripts 2. Teil Übernahme der Aufrufparameter etc.

### PrepareExecProc

```pascal
void CAmicScriptMaschine::PrepareExecProc();
```

Parameter: -/-

Ergebnis:  -/-

Zweck: Vorbereitungen zur Ausführung einer einzelnen Prozedur (Unit-Call). Stackpointer und Display zurücksetzen.

### PostExec

```pascal
void CAmicScriptMaschine::PostExec();
```

Parameter: -/-

Ergebnis:  -/-

Zweck: Ausführungs Nachbehandlung Abräumen der Resourcen

### SetEntryPoint

```pascal
void CAmicScriptMaschine::SetEntryPoint(Symbol* sym);
```

Parameter: sym ... Zeiger auf den Symboltabellen-Eintrag der Funktion/Prozedur

Ergebnis:  -/-

Zweck:     Füllt die Liste der Einstiegspunkte dieser Pascal-Unit

### CallEntryPoint

```pascal
void CAmicScriptMaschine::CallEntryPoint(char* entry);
```

```pascal
Parameter: entry ... Name der function/procedure
```

Ergebnis: false : EntryPoint nicht vorhanden

true  : ok

Zweck:  Aufrufen einer Unit-Interface-Funktion Das Resultat der Funktion steht in m_Result.

## Assistenten / Wizard Interface für A.eins Makro

bearbeitet

09.07.1999 MM erstellt


## Wizard Funktionen


### WZCreate

```pascal
function WZCreate(name,makro,title:string;w,h:real;flags:integer) : integer;
```

Parameter: name .... Name des Wizards

makro ... der Name des Makros, in dem diese Funktion ausgeführt wird.

title ... Bezeichnung in der Anzeige

w ....... Breite des Wizards

h ....... Höhe des Wizards

flags ... Eigenschaften des Wizards

Ergibt sich durch Addition folgender Werte:

wf_back_button   =  1 ... 'zurück' -Schalter ist sichtbar

wf_next_button    =  2 ... 'weiter' -Schalter ist sichtbar

wf_finish_button    =  4 ... 'fertig!'- Schalter ist sichtbar

wf_cancel_button  =  8 ... 'Abbruch'-Schalter ist sichtbar

wf_no_buttons       = 16 .. die 4 Seitenschalter können nicht sichtbar bemacht werden

wf_common_page    = 32 ...  wizard hat auch eine Hauptseite

wf_no_page_name   = 64 ...  Seiten ohne Rahmen mit Seitentitel

Ergebnis:  0: Fehler

>0: Handle auf den Wizard

Zweck: Anlegen eines Wizards im Speicher, um selbigen definieren und ausführen zu können.

### WZDelete

```pascal
procedure WZDelete( wz_hdl : integer);
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

Ergebnis:  -/-

Zweck: Resourcen des Wizards freigeben.

### WZShow

```pascal
procedure WZShow     (wz_hdl:integer);
```

```pascal
procedure WZShowModal(wz_hdl:integer);
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

Ergebnis:  -/-

Zweck: Anzeigen und ausführen des Wizards.

### WZShow

```pascal
procedure WZClose(wz_hdl:integer);
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

Ergebnis:  -/-

Zweck: Wizard beenden

### WZGetId

```pascal
function WZGetId(wz_hdl:integer):integer;
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

Ergebnis:  <0: Fehlercode vom JAM-System

sonst Objekt-Id der Wizard-Maske

Zweck:     Objekt-Id der Wizard-Maske ermitteln

### WZGetCurPageName

```pascal
function WZGetCurPageName(wz_hdl:integer;buf:string;len:integer):integer;
```

Parameter: wz_hdl Handle auf den Wizard (wird von WZCreate geliefert)

buf ...... Ergebnispuffer für den aktuellen Seitennamen

len ...... Pufferlänge

Ergebnis:  false: Fehler

true:  in buf steht ein gültiger Wert.

Zweck: Den Namen der aktuellen Seite ermitteln.

### WZSelectPage / WZSelectPageNum

```pascal
function WZSelectPage   (wz_hdl:integer;name:string):integer;
```

```pascal
function WZSelectPageNum(wz_hdl,nummer:integer     ):integer;
```

Parameter: wz_hdl .. Handle auf den Wizard (wird von WZCreate geliefert)

name ..... der Name der zu selektierenden Seite

nummer . Index der zu selektierenden Seite (beginnend bei 0!)

Ergebnis:  0: Fehler

1: Seite wurde selektiert

Zweck: Einzelne Seiten über ihren Namen oder Index in den Vordergrund bringen.

Anmerkung: War die Seite vorher als inaktiv gekennzeichnet, so setzt diese Funktion den Status auf aktiv!

### WZNextPage

```pascal
function WZNextPage(wz_hdl:integer):integer;
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

Ergebnis:  0: Fehler

1:  Seite wurde selektiert

Zweck: Navigation zur nächsten Seite

Anmerkung: Als inaktiv gekennzeichnete Seiten werden übergangen!

### WZPrevPage

```pascal
function WZPrevPage(wz_hdl:integer):integer;
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

Ergebnis:  0: Fehler

1:  Seite wurde selektiert

Zweck: Navigation zur vorher gehenden Seite

Anmerkung: Als inaktiv gekennzeichnete Seiten werden übergangen!

### WZSetEntry

```pascal
function WZSetEntry(wz_hdl:integer;func:string):integer;
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

func ..... die einzutragende Entry-Callback-Funktion

Ergebnis: 0: Fehler beim setzen der Callback-Funktion

1: ok

Zweck: Entryfunktion des Wizards registrieren.

```pascal
Anmerkung: Die Signatur einer Entryfunktion lautet procedure name_der_proc(ctx:integer); ctx ... 0 Wizard wird initialisiert
```

### WZSetExit

```pascal
function WZSetExit(wz_hdl:integer;func:string):integer;
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

func ..... die einzutragende Exit-Callback-Funktion

Ergebnis:  0: Fehler beim setzen der Callback-Funktion

1: ok

Zweck: Exitfunktion des Wizards registrieren.

## Wizard-Seiten Funktionen


### WZCreateCommonPage

```pascal
function WZCreateCommonPage(wz_hdl:integer) : integer;
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

Ergebnis:  0: Fehler beim anlegen der Seite

>0: Handle auf die Hauptseite

Zweck: Hinzufügen einer Hauptseite. Die Elemente der Hauptseite sind immer sichtbar.

### WZGetCommonPage

```pascal
function WZGetCommonPage(wz_hdl:integer) : integer;
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

Ergebnis:  0: Fehler beim anlegen der Seite

>0: Handle auf die Hauptseite

### WZPageOffset

```pascal
procedure WZPageOffset(wz_hdl,base:integer;x,y:real);
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

base ..... Bezugspunkt

1: oben links   2: oben rechts

4: unten links  3: unten rechts

x . Offset in x-Richtung

y . Offset in y-Richtung

Ergebnis:  -/-

Zweck: Verschiebung der Wizardseiten innerhalb der Maske. Diese Prozedur ist im allgemeinen nur sinnvoll, wenn auch eine Hauptseite angelegt wurde.

### WZAddPage

```pascal
function WZAddPage(wz_hdl:integer;name:string;flag:integer) : integer;
```

Parameter: wz_hdl Handle auf den Wizard (wird von WZCreate geliefert)

name ..der Name dieser Seite

flag .....Merkmale der Seite

z.Z. nur 0: Seite ist nicht aktiv

1: Seite ist aktiv

Ergebnis: 0: Fehler beim anlegen der Seite

>0: Handle auf die Seite

Zweck:     Hinzufügen einer Wizardseite.

### WZGetPage

```pascal
function WZGetPage(wz_hdl:integer;name:string) : integer;
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

name ..... Name der gesuchten Seite

Ergebnis: 0: Fehler, Seite nicht gefunden

>0: Handle auf die Seite

Zweck:     Handle auf eine Wizardseite erfragen.

### WZDelPage

```pascal
procedure WZDelPage(wz_hdl:integer;name:string);
```

Parameter: wz_hdl ... Handle auf den Wizard (wird von WZCreate geliefert)

name ..... Name der zu löschenden Seite

Ergebnis:  -/-

Zweck: Eine Wizardseite entfernen.

### WZSetPageFlag

```pascal
procedure WZSetPageFlag(page_hdl,flag:integer);
```

Parameter: page_hdl ... Handle auf die Wizard-Seite (wird von WZAddPage geliefert) flag Wert der Seiteneigenschaft

Ergebnis:  -/-

Zweck: Eigenschaft einer Wizardseite setzen.z.Z. nur 0: Seite ist inaktiv  1: Seite ist aktiv (default-Zustand)

### WZSetExit

```pascal
procedure WZSetPageEntry(page_hdl:integer;func:string);
```

Parameter: page_hdl ... Handle auf die Wizard-Seite (wird von WZAddPage geliefert) func die einzutragende Exit-Callback-Funktion

Ergebnis:  -/-

Zweck: Entryfunktion der Seite registrieren.

### WZSetExit

```pascal
procedure WZSetPageEntry(page_hdl:integer;func:string);
```

Parameter: page_hdl ... Handle auf die Wizard-Seite (wird von WZAddPage geliefert) func die einzutragende Exit-Callback-Funktion

Ergebnis:  -/-

Zweck: Entryfunktion der Seite registrieren.

## Wizard-Widget Funktionen


### WZAddWidget

```pascal
function WZAddWidget(page_hdl:integer;name:string;
```

```pascal
wtyp:integer;ftyp:string;
t,l:real;w:integer;h:real) : integer;
```

Parameter: page_hdl ... Handle auf die Wizard-Seite (wird von WZAddPage geliefert)

name  Name des Widgets

wtyp .. Widgettyp

ftyp .... Formattyp

t ......... Position oben

l ......... Position links

w ....... Breite

h ....... Höhe

Ergebnis: 0 : Fehler beim anlegen des Widgets

>0 : Handle auf das Widget

Zweck: Anlegen neuer Felder auf einer Wizard-Seite.

### WZGetWidgetId

```pascal
function WZGetWidgetId(w_hdl:integer) : integer;
```

Parameter: w_hdl ..... Widget-Handle

Ergebnis:  Objekt-Id des Widgets.

Zweck: JAM-Objekt-Id eines Elements besorgen.

### WZAddPropInt

```pascal
procedure WZAddPropInt(w_hdl,prop_id,val:integer);
```

Parameter: w_hdl .. Widget-Handle

prop_id Property-Kennzahl

val ..... zu setzender Wert

Ergebnis:  -/-

Zweck: Setzen von Widget-Eigenschaften.

### WZAddPropReal

```pascal
procedure WZAddPropReal(w_hdl,prop_id:integer;val:real);
```

Parameter: w_hdl .....Widget-Handle

prop_id .. Property-Kennzahl

val .....    . zu setzender Wert

Ergebnis:  -/-

Zweck:     Setzen von Widget-Eigenschaften.

### WZAddPropStr

```pascal
procedure WZAddPropInt(w_hdl,prop_id,val:integer);
```

Parameter: w_hdl ..... Widget-Handle

prop_id ... Property-Kennzahl

val ..... . zu setzender Wert

Ergebnis:  -/-

Zweck: Setzen von Widget-Eigenschaften.

### WZSetPropInt

```pascal
procedure WZSetPropInt();
```

Parameter: w_hdl ..... Widget-Handle

prop_id ... Property-Kennzahl

val ..... . zu setzender Wert

Ergebnis:  -/-

Zweck: Widget-Eigenschaft setzen

### WZSetPropInt

```pascal
procedure WZSetPropInt();
```

Parameter: w_hdl .... Widget-Handle

prop_id .. Property-Kennzahl

val ..... .   zu setzender Wert

Ergebnis:  -/-

Zweck: Widget-Eigenschaft setzen

### WZSetPropStr

```pascal
procedure WZSetPropStr(w_hdl,prop_id:integer;val:string);
```

Parameter: w_hdl ..... Widget-Handle

prop_id ... Property-Kennzahl

val ..... . zu setzender Wert

Ergebnis:  -/-

Zweck: Setzen einer String Widget-Eigenschaft.

### WZGetPropInt

```pascal
function WZGetPropInt(hdl,prop_id:integer):integer;
```

Parameter: w_hdl ..... Handle (Widget oder Wizard-Handle)

prop_id ... Property-Kennzahl

Ergebnis:  Wert der Eigenschaft

Zweck:     Integer-Objekt-Eigenschaft lesen.

### WZGetPropReal

```pascal
function WZGetPropReal(hdl,prop_id:integer):real;
```

Parameter: hdl ....... Handle (Widget oder Wizard-Handle)

prop_id ... Property-Kennzahl

Ergebnis: Wert der Eigenschaft

Zweck: Real-Objekt-Eigenschaft lesen.

### WZGetPropStr

```pascal
function WZGetPropStr(hdl,prop_id:integer;buf:string;len:integer):int;
```

Parameter: hdl ....... Handle (Widget oder Wizard-Handle)

prop_id ... Property-Kennzahl

buf ....... Ergebnispuffer

len ....... Pufferlänge

Ergebnis:  0 : Fehler

1 : die Daten im Puffer sind gültig

Zweck:     String-Objekt-Eigenschaft lesen.

### WZAddToGroup

```pascal
procedure WZAddToGroup(w_hdl:integer;group:string);
```

Parameter: w_hdl ... Widget-Handle

group ... Name der Selektionsgruppe

Ergebnis:  -/-

Zweck:     Verbindet Widget und Selektionsgruppe.

Anmerkung: Innerhalb einer Selektionsgruppe kann immer nur ein Element

ausgewählt werden. Es ist also z.B. bei mehreren RadioButtons immer

auch eine Selektionsgruppe anzulegen und zu verbinden, wenn aus den

RadioButtons immer nur ein Element selektiert werden darf.

### WZAddToGroup

```pascal
procedure WZAddToSyncGroup(w_hdl:integer;group:string);
```

Parameter: w_hdl ... Widget-Handle

group ... Name der Selektionsgruppe

Ergebnis:  -/-

Zweck:     Verbindet Widget und Synchronisationsgruppe.

Anmerkung: Elemente innerhalb einer Synchronisationsgruppe scrollen immer

synchron mit.

## Ereignisbehandlung Widgets


### WZSetWidgetEntry/WZSetWidgetExit/WZSetWidgetValid

```pascal
procedure WZSetWidgetEntry(w_hdl:integer;func:string);
```

```pascal
procedure WZSetWidgetExit (w_hdl:integer;func:string);
procedure WZSetWidgetValid(w_hdl:integer;func:string);
```

Parameter: w_hdl ..... Widget-Handle

func ...... Name der Callback-Funktion

Ergebnis:  -/-

Zweck: Setzen der Callback-Funktion für die Ereignisse

Feld-Einstieg,

Feld-Ausstieg und

Feld-Validierung

### WZSetWidgetItemCheck

```pascal
procedure WZSetWidgetItemCheck(w_hdl:integer;item_box,ret_list:string);
```

Parameter: w_hdl ...... Widget-Handle

item_box ... Name der F3-Auswahl / Itembox

ret_list ... Angabe der Rückgabe-Verteilung

Ergebnis:  -/-

Zweck: Ein Feld mit einer F3-Auswahl / ItemBox verbinden. Syntax der item_box Definition: Syntax der ret_list Definition:

### WZSetWidgetItemBefore / WZSetWidgetItemAfter

```pascal
procedure WZSetWidgetItemBefore(w_hdl:integer;func:string);
```

```pascal
procedure WZSetWidgetItemAfter (w_hdl:integer;func:string);
```

Parameter: w_hdl ... Widget-Handle

func .... Name der Callbackfunktion

Ergebnis:  -/-

Zweck: Callback-Funktion für die Zeitpunkte vor/nach F3-Auswahl verbinden.

## Maskenfelder manipulieren


### WZSetFieldStr

```pascal
procedure WZSetFieldStr(w_hdl,occ:integer;val:string);
```

Parameter: w_hdl ... Widget-Handle

occ ...  .. Index, falls kein Array = 1

val ..... der zu setzende Wert

Ergebnis:  0 : Fehler

1 : Feld gesetzt

Zweck: Füllt ein Maskenfeld mit dem angegebenen Wert. String-Wert Version

## xdllfunc

Implementation der Parameterübergabe an externe DLL-Funktionen.

Autor: Martin Melchert

bearbeitet:

11.07.1996 MM erzeugt

15.07.1996 MM Fehler in der double-Wert Übergabe behoben

Anmerkung:

Beispielprogramm mit externer Bindung

```pascal
program test;
```

external

modul "test.dll"

```pascal
begin
function  f1( i:integer; j:real ):integer;
function  f2( x:real ):real;
function  cdecl c1( i:integer; j:real ):integer;   // mit C Aufrufkonvention!!
procedure p1( s:string );
end
// hier könnten weitere externe Bindungen angegeben werden..
```

var

```pascal
i : integer;
r : real;
begin
i := f1(1,2.0);
r := f2(1.0);
p1("mach was sinnvolles!");
end.
```


## PARSER

Modul    parser.yy

```pascal
des von 'YACC' generierten Parsers
```

Eingabesprache siehe import.y

Datum      : 31.01.1996

bearbeitet : 20.02.1996

Version    : 4.2

Projekt    : Importscript-Parser

Martin Melchert

Notizblock

-------------------------

Es wird ein Scanner aus der Klasse 'LexicalScanner' def.

in scanner.cpp/.h benötigt.


## sonstiges


### SetOption

```pascal
function SetOption(opt,value:string):integer;
```

Parameter: opt ..... der Optionsname

value ...der Optionswert

Ergebnis:  0 : Fehler

1 : Wert wurde gesetzt

Zweck:     Programmoptionen setzen (Direktsprung OPT)

### GetOption

```pascal
function GetOption(opt,buf,def:string):integer;
```

Parameter: opt ... Optionsname

buf ... Ergebnispuffer

def ... Standardergebnis, falls Option nicht belegt

Ergebnis:  0 : Fehler

1 : ok

Zweck:     Auslesen von Programmoptionen

### sprintf

```pascal
procedure sprintf(buf,fmt : string ; ...);
```

Parameter: buf ... Ergebnispuffer

fmt ... Formatangabe

weitere Parameter je nach Formatangabe!

Ergebnis:  -/-

Zweck: Formatiertes Ausgeben in Stringpuffer

Anmerkung: fmt ist wie folgt aufgebaut

%[flags][width][.precision][{F|N|h|l|L}]type

|      |         |            |       |

|      |         |            |       +-- d,i,u,o,x,X,f,e,E,g,G,c,s,n,p

|      |         |            +---------- F,N,h,l,L

|      |         +----------------------- [0..9]

|      +--------------------------------- [0..9],*

+---------------------------------------- +,-,0,#,' '

Table R.4   Flag Characters

FlagMeaningDefault

–Left align the result within the given field width. Right align.

+Prefix the output value with a sign (+ or –)

if the output value is of a signed type.Sign appears only

```pascal
for negative signed
```

values (–).

0If width is prefixed with 0, zeros are added

until the minimum width is reached.

If 0 and – appear, the 0 is ignored.

If 0 is specified with an integer format

(i, u, x, X, o, d) the 0 is ignored. No padding.

blank (' ')Prefix the output value with a blank

```pascal
if the output value is signed and positive;
```

the blank is ignored if both the blank

and + flags appear.No blank appears.

#When used with the o, x, or X format,

the # flag prefixes any nonzero output

value with 0, 0x, or 0X, respectively.No blank appears.

When used with the e, E, or f format,

the # flag forces the output value to contain

a decimal point in all cases. Decimal point appears

only if digits follow it.

When used with the g or G format,

the # flag forces the output value to contain

a decimal point in all cases and prevents the

truncation of trailing zeros.

Ignored when used with c, d, i, u, or s.Decimal point appears

only if digits follow it.

Trailing zeros are

truncated.

Table R.3    Type Field Characters

CharacterTypeOutput Format

cint or wint_tWhen used with printf functions, specifies a single-

byte character; when used with wprintf functions,

specifies a wide character.

Cint or wint_tWhen used with printf functions, specifies a wide

character; when used with wprintf functions,

specifies a single-byte character.

dintSigned decimal integer.

iint Signed decimal integer.

oint Unsigned octal integer.

uint Unsigned decimal integer.

xintUnsigned hexadecimal integer, using "abcdef.„

XintUnsigned hexadecimal integer, using "ABCDEF.„

e doubleSigned value having the form [ – ]d.dddd e [sign]ddd

where d is a single decimal digit, dddd is one or

more decimal digits, ddd is exactly three decimal

digits, and sign is + or –.

EdoubleIdentical to the e format except that E rather than e

introduces the exponent.

fdoubleSigned value having the form [ – ]dddd.dddd, where

dddd is one or more decimal digits. The number of

digits before the decimal point depends on the

magnitude of the number, and the number of digits

after the decimal point depends on the requested

precision.

gdoubleSigned value printed in f or e format, whichever is

```pascal
more compact for the given value and precision. The
```

format is used only when the exponent of the value

is less than –4 or greater than or equal to the

precision argument. Trailing zeros are truncated,

and the decimal point appears only if one or more

digits follow it.

GdoubleIdentical to the g format, except that E, rather than

introduces the exponent (where appropriate).

n Pointer to integer Number of characters successfully written so far to

the stream or buffer; this value is stored in the

integer whose address is given as the argument.

pPointer to voidPrints the address pointed to by the argument in the

form xxxx:yyyy where xxxx is the segment and yyyy

is the offset, and the digits x and y are uppercase

hexadecimal digits.

sString When used with printf functions, specifies a single-

byte–character string; when used with wprintf

functions, specifies a wide-character string.

Characters are printed up to the first null character

or until the precision value is reached.

SStringWhen used with printf functions, specifies a wide-

character string; when used with wprintf functions, specifies a single-byte–character string. Characters are printed up to the first null character or until the precision value is reached.

## Size and Distance Specification

The optional prefixes to type, h, l, and L, specify the "size„ of argument (long or short, single-byte character or wide character, depending upon the type specifier that they modify). These type-specifier prefixes are used with type characters in printf functions or wprintf functions to specify interpretation of arguments, as shown in the following table. These prefixes are Microsoft extensions and are not ANSI-compatible.

```pascal
Table R.6   Size Prefixes for printf and wprintf Format-Type Specifiers
```

To SpecifyUse PrefixWith Type Specifier

long intld, i, o, x, or X

long unsigned intlu

short inthd, i, o, x, or X

short unsigned inthu

__int64I64d, i, o, u, x, or X

Single-byte character with printf functions hc or C

Single-byte character with wprintf functionshc or C

Wide character with printf functionslc or C

Wide character with wprintf functionslc or C

Single-byte – character string with printf functionshs or S

Single-byte – character string with wprintf functionshs or S

Wide-character string with printf functionsls or S

Wide-character string with wprintf functionsls or S

Thus to print single-byte or wide-characters with printf functions and wprintf functions, use format specifiers as follows.

To Print Character AsUse FunctionWith Format Specifier

single byteprintfc, hc, or hC

single bytewprintfC, hc, or hC

widewprintfc, lc, or lC

wideprintfC, lc, or lC

To print strings with printf functions and wprintf functions, use the prefixes h and l analogously with format type-specifiers s and S.


## Druck Sub-Units ansprechen


### PSULoad

```pascal
function PSULoad(unit:string) : boolean;
```

Parameter: unit ... der Name der zu ladenen Druck-Unit

Ergebnis:  true : die Unit konnte geladen werden

false: beim laden ist ein Fehler aufgetreten

Zweck:     Ansprechen einer anderen Unit aus einem Druck-Makro heraus.

### PSUUnload

```pascal
procedure PSUUnload(unit:string);
```

Parameter: unit ... der Name der zu entladenen Druck-Unit

Ergebnis:  -/-

Zweck:     Beendet die Benutzung des untergeordneten Druck-Makros.

### PSUCallInit

```pascal
function PSUCallInit(unit,func:string;res:^boolean;dq,pos,bereich,row:integer) : boolean;
```

Parameter: unit ...... der Name der Sub-Unit, in dem sich die Funktion befindet

func ...... der Name der aufzurufenden Funktion

res ....... Ergebnis der Init-Funktion aus der Sub-Unit

dq ........ Handle auf die Datenquelle

pos ....... Handle auf die Position

Bereich ... die Bereichsnummer

row ....... die Zeilennummer

Ergebnis:  true : die Funktion konnte gefunden und aufgerufen werden.

false: es ist ein Fehler aufgetreten

Zweck:     Funktionsaufruf in der untergeordneten Druck-Unit.

### PSUCallGet

```pascal
function PSUCallGet(unit,func:string;res:^boolean;row,column,bereich:integer;data:string;len:integer) : boolean;
```

Parameter: unit ...... der Name der Sub-Unit, in dem sich die Funktion befindet

func ......der Name der aufzurufenden Funktion

res ....... Ergebnis der Init-Funktion aus der Sub-Unit

row .......Zeilennummer

column .. Spaltennummer

Bereich . die Bereichsnummer

Ergebnis: true : die Funktion konnte gefunden und aufgerufen werden.

false: es ist ein Fehler aufgetreten

Zweck: Funktionsaufruf in der untergeordneten Druck-Unit.

### GetProfileString

```pascal
function GetProfileString(sec,key,def,buf,file:string):integer;
```

Parameter: sec .... Sektionsname         (  [sec]   )

key .... Schlüsselname        (  key=... )

def .... Standardwert, falls sec/key nicht gefunden wird

buf .... Ergebnispuffer

file ... Name der INI-Datei

Ergebnis:  Länge des in den Ergebnispuffer kopierten Strings.

Zweck:     Auslesen von INI-Datei Einträgen.

### WriteProfileString

```pascal
function WriteProfileString(sec,key,buf,file:string) : integer;
```

Parameter: sec .... Sektionsname         (  [sec]   )

key .... Schlüsselname        (  key=... )

buf .... zu setzender Wert

file ... Name der INI-Datei

Ergebnis: =0 : Fehler, genauere Fehleranalyse über GetLastError()

<>0 : ok

Zweck:     Werte in INI-Dateien setzen.

### MdeImport

```pascal
procedure MdeImport( datei : string );
```

Parameter: datei ... die einzulesende MDE-Datei

Ergebnis:  -/-

Zweck: Eine Datei für die MDE-Verarbeitung einlesen.Dateiformat siehe MDE Unterlagen.

### Sleep

```pascal
procedure Sleep( msecs : integer );
```

Parameter: msecs ... Ruhezeit in Millisekunden

Ergebnis:  -/-

Zweck: Versetzt den A.eins-Prozess in den Ruhezustand. Der Prozess verbraucht während dieser Zeit keine CPU-Zeit.

### GetExePath

```pascal
procedure GetExePath( path:string );
```

Parameter: path ... Ergebnispuffer

Ergebnis:  -/-

Zweck:     Liefert den Aeins.exe - Pfad

### ReadScriptParam

```pascal
function ReadScriptParam (ScriptPPId, ScriptPId,
```

```pascal
ScriptPPWert1, ScriptPPWert2, ScriptPPWert3: string) : integer;
```

Parameter: ScriptPPId:     Name des ScriptParameters

ScriptPId:      Name der ScriptParameter-Gruppe

ScriptPPWert1:  1. Rückgabe-String

ScriptPPWert2:  2. Rückgabe-String

ScriptPPWert3:  3. Rückgabe-String

Ergebnis:  0: Parameter ist als NICHT AKTIV gekennzeichnet

1: alles OK

2: Parameter wurde in der Datenbank nicht gefunden

Zweck:

Lesen von bis zu 3 Strings eines bestimmten Parameters.

Ein Makro kann allgemein formuliert sein und seine spezifische

Parametrisierung aus der Datenbank beziehen. Diese Parameter sind als Datensätze

in den Script Parametern hinterlegbar und können mit der Funktion ReadScriptParam

ausgelesen werden.

Jedes betreffende Modul sollte die von ihm benötigten Script Parameter in einer

Gruppe unter einer ScriptPId zusammenfassen.

Die Stringvariablen ScriptPPWert1..3 werden mit bis zu 3 Strings aus dem Datensatz

befüllt.

Falls der Datensatz nicht vorhanden oder inaktiv geschaltet ist, werden 3 Leerstrings

übergeben.

### CreateExportDlg

```pascal
function CreateExportDlg( ) : integer;
```

Parameter: keine

Ergebnis:  liefert eine Referenz auf einen 'A.eins-Export' Dialog

### DeleteExportDlg

```pascal
procedure DeleteExportDlg( dlg:integer );
```

Parameter: dlg.....Referenz auf einen 'A.eins Export-Dialog'

Ergebnis:  ohne

Zweck:     Dialog schließen und dessen Resourcen freigeben.

### XDlgSetText1

```pascal
procedure XDlgSetText1( dlg:integer; text : string );
```

Parameter: dlg.....Referenz auf einen 'A.eins Export-Dialog'

text....der zu setzende Text

Ergebnis:  ohne

Zweck: im Export-Dialog den Text 1 setzen

### XDlgSetText2

```pascal
procedure XDlgSetText2( dlg:integer; text : string );
```

Parameter: dlg.....Referenz auf einen 'A.eins Export-Dialog'

text....der zu setzende Text

Ergebnis:  ohne

Zweck:     im Export-Dialog den Text 2 setzen

### XDlgSetActive

```pascal
procedure XDlgSetActive( dlg,status:integer );
```

Parameter: dlg.....Referenz auf einen 'A.eins Export-Dialog'

status..0:Animation anhalten 1:Animation starten

Ergebnis: ohne

Zweck: Status der Animation setzen

### XDlgSetActive

```pascal
procedure XDlgSetFlagPtr( dlg:integer;ptr:^integer );
```

Parameter: dlg.....Referenz auf einen 'A.eins Export-Dialog'

ptr.....Zeiger auf die Flag-Variable

Ergebnis:  ohne

Zweck: Die Verbindung zwischen Abbruch-Schalter und Makro-Variablen herstellen. Wir im Dialog der Abbruch-Schalter betätigt, so wird die hier übergebene Variable auf 1 gesetzt.

### XDlgSetAniTyp

```pascal
procedure XDlgSetAniTyp( dlg,typ:integer );
```

Parameter: dlg.....Referenz auf einen 'A.eins Export-Dialog'

typ.....Typ der Animation

Ergebnis:  ohne

Zweck: Setzen der Animations-Folge Werte:

aviNone...........0

aviFindFolder.....1

aviFindFile.......2

aviFindComputer...3

aviCopyFiles......4 (Voreinstellung)

aviCopyFile.......5

aviRecycleFile....6

aviEmptyRecycle...7

aviDeleteFile.....8

### GetLastError

```pascal
function GetLastError():integer;
```

Parameter: -/-

Ergebnis:  Win32 Fehlercode

Zweck:     Abfragen des letzten Fehlers im Win32-API.

### Makro

```pascal
function Makro(n,r,p1,p2,p3,p4 : string) : integer;
```

Parameter: n .... der Name des auszuführenden Makros

r .... Ergebnispuffer für den Rückgabewert des Makros

p1 ... Parameter 1

p2 ... Parameter 2

p3 ... Parameter 3

p4 ... Parameter 4

Ergebnis:   1: ok, kein Fehler aufgetreten

0: es sind Fehler aufgetreten

Zweck: Aufrufen eines anderen A.eins-Makro

### TermAeins

```pascal
procedure TermAeins();
```

Parameter: -/-

Ergebnis:  -/-

Zweck:     A.eins beenden

### SysScreenShot

```pascal
function SysScreenShot( area:integer;file: string ) : integer;
```

Parameter: area welchen Maskenbereich

1...die gesamte Maske

2...nur den Clientbereich

file ... der Name der zu erzeugenden BMP-Datei

Ergebnis:  0: Fehler

1: ok, Datei angelegt.

Zweck: Erzeugt eine Bitmap der aktuellen Maske in der Datei 'file'.

---

# Teil III — JPP-Objektframework (a1net)

**JPP** ist ein Objekt-/Komponenten-Framework im modernen A.eins (`a1net`, .NET). Der Namespace `JPP` enthaelt rund 144 Klassen („Objekte“), die aus einem klassischen Makro heraus **instanziiert und aufgerufen** werden koennen. So erhaelt ein Makro Zugriff auf moderne Funktionalitaet (Dateisystem, Netzwerk, Export, Waagen, Kasse, EAI-Konnektoren u. v. m.), die es in der klassischen Funktionsbibliothek nicht gibt.

## Die Bruecke: Klasse `JPP_im_Makro`

Aus dem Makro spricht man JPP-Objekte ueber fuenf handle-basierte Prozeduren an (alle Werte werden als `string` uebergeben). Zugrunde liegt das .NET-Interface `Aeins.IJpp` (New/In/Do/Ex/Delete).

| Makro-Aufruf | Signatur | Zweck |
|---|---|---|
| `JppNew`    | `JppNew(jpp_handle, jpp_class)` | Legt ein Objekt der Klasse `jpp_class` an und bindet es an das frei waehlbare `jpp_handle`. |
| `JppIn`     | `JppIn(jpp_hdl, jpp_var, jpp_value)` | Setzt eine Eingabevariable/Parameter fuer die folgende Do-/Ex-Operation. |
| `JppDo`     | `JppDo(jpp_hdl, jpp_proc, ergebnis, buflen)` | Fuehrt die Funktion `jpp_proc` aus; das Resultat wird in den Ergebnispuffer `ergebnis` (Laenge `buflen`) geschrieben. |
| `JppEx`     | `JppEx(jpp_hdl, jpp_proc)` | Fuehrt die Methode `jpp_proc` aus (ohne Ergebnispuffer). |
| `JppDelete` | `JppDelete(jpp_hdl)` | Gibt das Objekt/seine Ressourcen frei. JPP-Objekte sind an Aeins-Masken gebunden und werden mit deren Schliessen automatisch freigegeben; `JppDelete` erzwingt die fruehzeitige Freigabe. |

## Verwandt: Klasse `JVars_im_Makro`

Zugriff auf **JVars** (benannte Variablen mit „Owner“):

| Makro-Aufruf | Signatur | Zweck |
|---|---|---|
| `JVarsGet` | `JVarsGet(name, owner, ergebnis)` | Liefert den JVars-Wert zur Variablen `name`/`owner` als String in `ergebnis`. |
| `JVarsSet` | `JVarsSet(owner, name, wert)` | Setzt den JVars-Wert der Variablen `name` fuer `owner` auf `wert`. |

## Typisches Aufrufmuster

```pascal
var
   hEx : string;   // Ergebnispuffer
begin
   JppNew ("fs", "JFileSystem");             // Objekt anlegen
   JppIn  ("fs", "Quelle", "C:\a\x.txt");  // Eingaben setzen
   JppIn  ("fs", "Ziel",   "C:\b\x.txt");
   JppEx  ("fs", "CopyFile");                // Methode ausfuehren (ohne Rueckgabe)
   JppDo  ("fs", "FileExists", hEx, 1024);   // Methode mit Ergebnis in hEx
   JppDelete("fs");                          // Ressourcen freigeben
end.
```

> **Hinweis:** Die konkreten Namen fuer `jpp_proc` (Do/Ex) entsprechen den unten je Objekt gelisteten **Methoden**; die Namen fuer `jpp_var` (In) sind objektspezifische Eingabevariablen. Exakte Parameter/Variablen im Zweifel in `iHilfe.chm` am jeweiligen Objekt nachschlagen.

---

## JPP-Objektkatalog (alle Objekte mit ihren Methoden)

### A1netJamHelper — JAM-Hilfsfunktionen (.NET)
**Methoden:** `Presenter`

### ArchivVolltext — Archiv-Volltextsuche
**Methoden:** `Aktualisieren`

### CAllgemeinStapel — allgemeiner Stapel
**Methoden:** `addDays`, `addItem`, `createStapel`, `deleteStapel`, `islocked`, `LOCK`, `removeItem`, `setAnwendungID`, `setBezeichnung`, `setKategorie`, `setPrivat`, `setPrivateChanged`, `setText`, `setUserID`, `setVarianteID`, `setVerfalldatum`, `unlock`, `updateStapel`

### CHelper — allgemeine Hilfsfunktionen
**Methoden:** `ClickZeile`, `GetAnwCondBesitzer`, `GetAnwCondBis`, `GetAnwCondBisIdx`, `GetAnwCondBisOriginal`, `GetAnwCondCount`, `GetAnwCondDataForm`, `GetAnwCondExpr`, `GetAnwCondFSCtrl`, `GetAnwCondHidden`, `GetAnwCondHiddenOrig`, `GetAnwCondIB`, `GetAnwCondId`, `GetAnwCondLabel`, `GetAnwCondNummer`, `GetAnwCondTyp`, `GetAnwCondVariable`, `GetAnwCondVon`, `GetAnwCondVonIdx`, `GetAnwCondVonOriginal`, `GetFieldData`, `GetFieldDataByName`, `GetFieldHeader`, `GetFieldLen`, `GetFieldName`, `GetFieldSelString`, `GetFieldType`, `GetHidden`, `GetNoInfo`, `GetSqlStatementFromSqlText`, `GetTipText`, `GetXml`, `SetParam`

### CLisPreisMatrix — Listen-Preismatrix
**Methoden:** `AnzeigeFehler`, `GetErrorCount`, `GetErrorListStr`, `GetLastErrorStr`, `Init`, `SetMatrixBezeich`, `SetMatrixNummer`

### CProduktHelper — Produkt-Hilfsfunktionen
**Methoden:** `BelegAbbrechen`, `BelegNeu`, `BelegSpeichern`, `KomponenteNeu`, `KomponenteSpeichern`, `ProduktAbbrechen`, `ProduktNeu`, `ProduktSpeichern`, `SetTestModus`

### CRwVorgHelper — RW-Vorgangs-Hilfe
**Methoden:** `Add_V_Id`, `AnzeigeFehler`, `ArtikelSchemaAendern`, `BeendeVorgang`, `Clear_V_Id_List`, `DatenSafeClear`, `DatenSafeDeleteAll`, `DatenSafeErzeugen`, `DatenSafeGetValue`, `DatenSafeIstWertGesetzt`, `DatenSafePutValue`, `GetAnzahlErgZeilen`, `GetEbenezuErgIndex`, `GetEbenezuErgNummer`, `GetErgWertValTextzuIndex`, `GetErgWertValTextzuNummer`, `GetErgWertzuIndex`, `GetErgWertzuNummer`, `GetErrorCount`, `GetErrorListStr`, `GetIndexzuErgNummer`, `GetItemBoxzuErgIndex`, `GetItemBoxzuErgNummer`, `GetKeepLocked`, `GetLabelTextzuErgIndex`, `GetLabelTextzuErgNummer`, `GetLaengezuErgIndex`, `GetLaengezuErgNummer`, `GetLastErrorStr`, `GetLastNewVid`, `GetMaxWertzuErgIndex`, `GetMaxWertzuErgNummer`, `GetMinWertzuErgIndex`, `GetMinWertzuErgNummer`, `GetNummerzuErgIndex`, `GetPositionzuErgIndex`, `GetPositionzuErgNummer`, `GetPosKommentar`, `GetPosKommentarID`, `GetPosKommentarTyp`, `GetPosKommentarZeilenZahl`, `GetTypzuErgIndex`, `GetTypzuErgNummer`, `GetValSqlzuErgIndex`, `GetValSqlzuErgNummer`, `GetValTxtFeldzuErgIndex`, `GetValTxtFeldzuErgNummer`, `PosKlammer_Add`, `PosKlammer_ListeLeeren`, `PosKlammer_MengeManuelRuecksetzen`, `PosKlammer_MethodeAbbrechen`, `PosKlammer_MethodeBeenden`, `PosKlammer_MethodeStart`, `PosWertPut_erlaubt`, `PutErgWertzuIndex`, `PutErgWertzuNummer`, `PutPosKommentarID`, `PutPosKommentarTyp`, `PutPosWert`, `PutVorgWert`, `RW_Umwandel_Abschlag`, `RW_Umwandel_Finale`, `RW_Umwandel_Folgeabschlag`, `RWUMW_exec`, `RWUMW_GetZiel_V_Id`, `RWUMW_PutFolgeFunc`, `RWUMW_PutJahrFibu`, `RWUMW_PutJahrWare`, `RWUMW_PutPeriFibu`, `RWUMW_PutPeriManFibu`, `RWUMW_PutPeriManWare`, `RWUMW_PutPeriWare`, `RWUMW_PutValDatBehandlung`, `RWUMW_PutValDatum`, `Set_Message_Anzeige`, `Set_Message_Anzeige_Protokoll`, `Set_Message_Protokoll`, `SetKeepLocked`, `SetMenge`, `SetVorgangAbbruch`, `StartRwKorrektur`, `StartRwVorgang`, `Test_Routine`, `TestPeriodeBuchbar`, `VorgWertPut_erlaubt`

### CUmbuchungsHelper — Umbuchungs-Hilfe
**Methoden:** `AddPartieMenge`, `BeendeUmbuchung`, `BeendeUmbuchungId`, `DeleteUmbuchungMethode`, `EndPartie`, `GetFirstUmbuchung`, `GetPartieAnzahl`, `GetPartieArtiPosit`, `GetPartieId`, `GetPartieMarkierIdent`, `GetPartieMenge`, `GetPositionHandle`, `GetValPos`, `GetValue`, `LadeUmbuchung`, `SetValPos`, `SetValPosByName`, `SetValue`, `StartPartie`, `StartUmbuchung`, `UmbuchungAdd`, `UmbuchungNeu`

### CVorgangsHelper — Vorgangs-Hilfsfunktionen
**Methoden:** `AbbrechenKlammerWabew`, `AbfrageTestRechDatToPos`, `Add_V_Id`, `AddGebindeZeile`, `AddGruppenZuAbschlag`, `AddLeergutartikel`, `AddLeergutMenge`, `AddPartieMenge`, `AddPartieMengeNummer`, `AddZeilenZuAbschlag`, `AnzahlElementeWabew`, `BeendeKlammerWabew`, `BeendeVorgang`, `BeendeVorgangId`, `BelegDruck`, `CatchHANDLE`, `CatchSV_Refresh`, `CatchSVMAIN`, `CatchSVPOSI`, `CatchSVWARE`, `Clear_V_Id_List`, `ClearLeergutSammelListe`, `CloseFolgeArtikelInfo`, `CSharpTestGetDBString`, `CSharpTestPutDBString`, `DeleteKompIterator`, `DeletePosMethode`, `DeleteWaPosMethode`, `DoNotCommit`, `EchteTeilUmwandlung`, `EndPartie`, `ErsetzePos`, `ErsetzeProdPos`, `FillLeergutGrid`, `GebindeInfoAdd`, `GebindeWapos`, `GetAbgrenzungsDatum`, `GetCountKomp`, `GetFirstPos`, `GetFirstWaPos`, `GetGruppenZuAbschlagValue`, `GetKeepLocked`, `GetKompIndex`, `GetKompValue`, `GetKundIdAuftragBeiLadeschein`, `GetNextKomp`, `GetNextPos`, `GetPartieAnzahl`, `GetPartieArtiPosit`, `GetPartieId`, `GetPartieMarkierIdent`, `GetPartieMenge`, `GetPlanOderLieferDatum`, `GetPositionHandle`, `GetPosType`, `GetRezept`, `GetRezeptValue`, `GetSetupValuesForContractBehavior`, `GetSVWAREWaposHandle`, `GetTempVal`, `GetTempValPos`, `GetValGI`, `GetValPos`, `GetValPosByName`, `GetValue`, `GetVorgangHandle`, `GetVorgangStufe`, `GetZeilenZuAbschlagValue`, `HoleKlammertypWabew`, `HoleMengeManuelWabew`, `HoleMengeWabew`, `HoleNummerWabew`, `HoleWertWabew`, `InitNachhaltigkeit`, `KlammerHinzufuegenWabew`, `KomponenteNeu`, `Korrektur`, `KorrigiereVorgangDlg`, `KundNummerAenderung`, `LA_ZU_RELI_Nachbehandlung`, `LadeVorgang`, `ListeLeerenWabew`, `LoadLeergutMenge`, `LoeschePartieZuordnung`, `MengeManuelRuecksetzenWabew`, `NormalZuFremdKontrakt`, `OpenFolgeArtikelInfo`, `PosAusPos`, `PosCopy`, `PositionAdd`, `PositionNeu`, `PositionsSort`, `ProduktNeu`, `RechDatToPos`, `RemoveKomp`, `RemoveLeergutartikel`, `ResetNachhaltigkeit`, `RestartKompIterator`, `RezeptBewTyp`, `RohwareStapelKorrektur`, `SetGruppenZuAbschlagHandle`, `SetGruppenZuAbschlagValue`, `SetKeepLocked`, `SetKompValue`, `SetProduktHandle`, `SetRezeptValue`, `SetValGI`, `SetValPos`, `SetValPosByName`, `SetValue`, `SetZeilenZuAbschlagHandle`, `SetZeilenZuAbschlagValue`, `StartKlammerWabew`, `StartKompIterator`, `StartPartie`, `StartVorgang`, `Stornieren`, `SV_GetOption`, `Sv_Rohware_abrechnen`, `SV_SetOption`, `Teildispo`, `TesteKundNummerAenderung`, `TestRechnungsDatumAendern`, `TexteNeu`, `TextNeu`, `UmbuchungNeu`, `Umwandlung`, `VorgangDruck`, `VorgangFehlerInProtokoll`, `VorgangsDatenBeschreibung`, `VorgangsDatenDifferenzXML`, `VorgangsDatenXML`, `VorgangsKopie`, `VorgangSofortDruck`, `VorgangStapelKorrektur`, `WaPosArtikelAenderung`, `WaPosSetPruefFehler`, `WarenpositionAusWabewid`, `ZeigeVorgangFehler`, `Zwischensumme`

### CWidgetNavigator — Widget-Navigation
**Methoden:** `addField`, `deleteFields`, `loadFieldOrder`, `loadFields`, `MoveAllItemsOnTabCard`, `MoveTabDeck`, `saveFieldOrder`, `saveFields`, `set_Abschluss`, `set_loop`, `set_Ursprung`, `SetFeldID`, `setFieldOrder`, `SetMaskenID`, `setStepsize`

### JA1Extern — externe A1-Aufrufe
**Methoden:** `AWGetIdx`, `AWGetNextId`, `AWGetSelCount`, `AWInit`, `AWRefresh`, `BeendeVorgangMethode`, `CtrlStringParser`, `DeletePosMethode`, `DeleteWaPosMethode`, `ErsetzePosMethode`, `FindKontextMethode`, `FindPosMethode`, `Flush`, `GetFirstPosMethode`, `GetFirstWaPosMethode`, `GetKompXMethode`, `GetKtxValMethode`, `GetNextPosMethode`, `GetPosTypeMethode`, `GetValDoubleMethode`, `GetValLongMethode`, `GetValPosDoubleByNameMethode`, `GetValPosDoubleMethode`, `GetValPosLongByNameMethode`, `GetValPosLongMethode`, `GetValPosStrByNameMethode`, `GetValPosStrMethode`, `GetValStrMethode`, `GetValZuAbDoubleMethode`, `GetValZuAbLongMethode`, `HSTLCreateInfoObjMethode`, `HSTLGetFirstIterMethode`, `HSTLGetInfoObjMethode`, `HSTLGetSubInfoObjMethode`, `HSTLNachbehandlungStkListe`, `HSTLSetHauptWarenposition`, `jam_i_getfield`, `jam_i_putfield`, `KorrekturStandardVorgang`, `KtxExecMethode`, `LadeVorgangIdMethode`, `LadeVorgangMethode`, `LeerzeileNeuMethode`, `LieferscheinAusAuftrag`, `OhneMakroNachlaufMethode`, `PosAnfuegenMethode`, `PosAusPosMethode`, `PosEinfuegenVorMethode`, `PositionNeuMethode`, `RezeptPreisMethode`, `SetKtxValMethode`, `SetValDoubleMethode`, `SetValLongMethode`, `SetValPosDoubleByNameMethode`, `SetValPosDoubleMethode`, `SetValPosLongByNameMethode`, `SetValPosLongMethode`, `SetValPosStrByNameMethode`, `SetValPosStrMethode`, `SetValStrMethode`, `SetValZuAbDoubleMethode`, `SetzeTestModus`, `StartVorgangMethode`, `StatusZeile`, `SVPOSI_GetPosHandle`, `SVPOSI_GetVorgHandle`, `SVPOSI_InsertPosition`, `SVPOSI_ReplacePosition`, `SVPOSI_UngetVorgHandle`, `TextNeuMethode`, `VorgangDruckMethode`, `VorgangStornoMethode`, `VorgangsUmwandlung`, `WPAddZusatzZeileMethode`, `WPAnzZusatzZeileMethode`, `WPDelZusatzZeileMethode`, `WPGetZusatzZeileMethode`, `WPLoescheTextMethode`, `ZeilenZuAbExMethode`

### JA1NETDrv — A1NET-Treiber
**Methoden:** `NetCall`

### JActiveX — ActiveX-Objekte
**Methoden:** `Call`, `CallJ`, `Get`, `Init`, `Listen`, `OnEvent`, `Set`, `SetImages`, `Transport`

### JADOGRID — ADO-Datengrid
**Methoden:** `SetMuster`

### JAMICAR — AMICAR-Schnittstelle
**Methoden:** `Exec`

### JAnwendReport — Anwendungs-Reports
**Methoden:** `Archivieren`, `FromXMLFile`, `GetFormatedValue`, `GetVorbelegung`, `Read`, `ReadByFileName`, `SetFormular`

### JArchivExport — Archiv-Export
**Methoden:** `ToFile`

### JAWSQLPrepare — Auswahllisten-SQL vorbereiten
**Methoden:** `ErzeugeAWXML`, `ErzeugeSQL`, `ErzeugeXML`, `LadeAnwendung`, `LoescheCondition`, `ReloadRequired`, `SetzeCondition`, `UnterdrueckeAWVorbelegung`

### JAXCrw — Crystal-Reports-Ansteuerung
**Methoden:** `Start`

### JBehandlungsSchema — Behandlungsschema
**Methoden:** `GetBoolean`, `GetInteger`, `GetReal`, `GetText`, `InitByKlass`, `InitByName`

### JBinary — Binaerdaten
**Methoden:** `ToFile`, `ToTable`, `ToTempFile`

### JBoxNavigator — Box-Navigation
**Methoden:** `Hide`, `MoveTo`, `Restore`

### JCache — Cache
**Methoden:** `Clear`

### JCashFunktion — Kassenfunktionen
**Methoden:** `AddDialog`, `DarfFunktion`, `Init`

### JCashZahlung — Kassenzahlung
**Methoden:** `ACKZahlung`, `Anzahlung`, `BelegWaehrung`, `CancelAll`, `CancelLast`, `DoZahlung`, `RestSumme`, `REVZahlung`, `SetText`, `StartZahlung`, `Text1`, `Text2`, `Text3`, `Text4`, `Text5`, `Text6`, `WechselGeld`, `ZahlArt`, `ZahlArtZusatz`, `ZahlBetrag`, `ZahlWaehrung`

### JCodeVerifierHelper — Code-Pruefung
**Methoden:** `Test`

### JComPorts — serielle Schnittstellen (COM)
**Methoden:** `Close`, `Open`, `Read`, `Read2`, `Write`

### JDatenquelle — Datenquelle (Druck)
**Methoden:** `Bind`

### JDatum — Datum
**Methoden:** `AnzahlTage`, `String2Date`

### JDBase — dBase
**Methoden:** `Connections`, `CopyRow`, `CopySqlText`, `GetSqlText`, `GetXML`, `InsertOneSqlTextLine`, `MakeXML`, `SetOneSqlTextLine`, `SetSqlText`, `StartOneSqlTextLine`, `SysServer`

### JDBF_Parameter — DBF-Parameter
**Methoden:** `Abfragen`

### JDBP_Param — DB-Parameter
**Methoden:** `SetzeParameter`, `StartErstellung`, `StartProzedurname`

### JDBX — DBX-Datenaustausch
**Methoden:** `DBERR`, `Exec`, `Get`, `Next`

### JDLL_Load — DLLs laden
**Methoden:** `Connect`, `Execute`, `Load`, `Unload`

### JEAI_Ariel — EAI-Konnektor: Ariel
**Methoden:** `EDIT`

### JEAI_AW_Editor — EAI-Konnektor: Auswahllisten-Editor
**Methoden:** `DEL`, `EDIT`, `SHOW`

### JEAI_Carme — EAI-Konnektor: Carme
**Methoden:** `ADDIDENT`, `SHOW`

### JEAI_Charon — EAI-Konnektor: Charon
**Methoden:** `SHOW`

### JEAI_Deimos — EAI-Konnektor: Deimos
**Methoden:** `SHOW`, `SHOWIB`

### JEAI_Dione — EAI-Konnektor: Dione
**Methoden:** `ADDFILE`, `IMPORT`, `SETINFO`, `SHOW`

### JEAI_Draco — EAI-Konnektor: Draco
**Methoden:** `SHOW`

### JEAI_Europa — EAI-Konnektor: Europa
**Methoden:** `ADDADRESSSTATION`, `ADDSTATION`, `SHOWROUTE`

### JEAI_ExcelExport — EAI-Konnektor: Excel-Export
**Methoden:** `EXPORTX`, `SHOW`, `SHOWSQL`

### JEAI_Galatea — EAI-Konnektor: Galatea
**Methoden:** `ADD_ITEM`, `REM_OLD`

### JEAI_Generic — EAI-Konnektor: generischer EAI-Konnektor
**Methoden:** `SHOW`

### JEAI_Google — EAI-Konnektor: Google
**Methoden:** `ADDADRESSSTATION`, `GEOADRESS`, `ROUNDTRIP`, `SHOWROUTE`, `SPREAD`, `TRIP`

### JEAI_Hyperion — EAI-Konnektor: Hyperion
**Methoden:** `SHOW`

### JEAI_Janus — EAI-Konnektor: Janus
**Methoden:** `AUTOIMPORT`, `FAO`, `FILE`, `HELIPORT`

### JEAI_Larissa — EAI-Konnektor: Larissa
**Methoden:** `BATCHMATCH`, `CHECKADRESS`, `CHECKDEFINED`, `DEFINEGOODGUY`

### JEAI_Metis — EAI-Konnektor: Metis
**Methoden:** `AUTHORIZE`, `COMMAND`, `LOGOFF`, `LOGON`

### JEAI_Ophelia — EAI-Konnektor: Ophelia
**Methoden:** `DESIGN`, `PDF`, `PRINT`, `SHOW`

### JEAI_Outlook — EAI-Konnektor: Outlook
**Methoden:** `SHOW`

### JEAI_Phobos — EAI-Konnektor: Phobos
**Methoden:** `EXEC`

### JEAI_Portia — EAI-Konnektor: Portia
**Methoden:** `EDIT`, `SHOW`

### JEAI_Proteus — EAI-Konnektor: Proteus
**Methoden:** `SHOW`

### JEAI_Rhea — EAI-Konnektor: Rhea
**Methoden:** `SHOW`

### JEAI_Rosalind — EAI-Konnektor: Rosalind
**Methoden:** `EDIT`, `SHOW`

### JEAI_Sinope — EAI-Konnektor: Sinope
**Methoden:** `ACKPAY`, `GETSTATUS`, `IMPORT`, `SEND`, `SETINSTATUS`

### JEAI_Telesto — EAI-Konnektor: Telesto
**Methoden:** `CHECKDEFINED`, `CHECKJ`, `CHECKKUNDE`, `CHECKUSTID`

### JEAI_Thebe — EAI-Konnektor: Thebe
**Methoden:** `EXPORTDISPATCH`, `EXPORTINVOICE`, `EXPORTORDER`, `EXPORTORDERRESPONSE`, `EXPORTPRODORDER`, `EXPORTQUOTATION`, `EXPORTX`, `EXTRACT`, `IMPORTDISPATCH`, `IMPORTINVOICE`, `IMPORTORDER`, `IMPORTQUOTATION`, `IMPORTX`

### JEAI_Titan — EAI-Konnektor: Titan
**Methoden:** `EDIT`, `EXTRACTMSG`

### JEAI_Triton — EAI-Konnektor: Triton
**Methoden:** `ADDJOB`, `RUN`

### JEAI_Umbriel — EAI-Konnektor: Umbriel
**Methoden:** `CHECK`

### JEAI_Update — EAI-Konnektor: Update
**Methoden:** `GETLIST`, `GETPAKET`, `INIT`

### JEAI_Versand — EAI-Konnektor: Versand
**Methoden:** `ADDAPPENDIX`, `ADDAPPOINTMENT`, `ADDRECIPIENT`, `SEND`, `SETFROM`

### JEAI_WordSerienbrief — EAI-Konnektor: Word-Serienbrief
**Methoden:** `SEND`, `SHOW`

### JEAI_XMLExport — EAI-Konnektor: XML-Export
**Methoden:** `EXPORTXML`, `SHOW`

### JElara — Elara-Nachrichten
**Methoden:** `End`, `Ensure`, `InsertCMD`, `InsJVARCMD`, `RemoveCMD`, `SendArgs`, `SendMessage`, `StartCMD`, `StartJOB`, `StatusCMD`, `WaitCMD`

### JElaraMessage — Elara-Nachricht
**Methoden:** `ClearCache`, `SendMessage`

### JExec — Programme ausfuehren
**Methoden:** `CtrlString`, `Makro`, `MakroDebuggerConnection`

### JExtern — externe Aufrufe
**Methoden:** `Connect`, `CreateTable`, `Disconnect`, `ExistServer`, `ExistTable`, `Export`, `GetSrvId`, `Link`

### JFA_Import — Folgeartikel-Import
**Methoden:** `Auto_Import`, `Free_Import`, `GetPath`, `Import`, `JVAR_IMPORT`, `SetFile`, `Update`, `Zugabe`

### JFA_Manager — Folgeartikel-Manager
**Methoden:** `ExecFunc`, `ExecSql`, `GetMandant`, `GetMerkmal`, `IsReferenz`, `PrinterDaten`

### JFA_Service — Folgeartikel-Service
**Methoden:** `LoescheArchivPerMd5`

### JFA_View — Folgeartikel-Ansicht
**Methoden:** `Anzeige`, `Print`, `PrintPdf`

### JFAExIm — Folgeartikel Ex/Import
**Methoden:** `Exec`

### JFileSystem — Datei- und Verzeichnisoperationen (auch serverseitig via Srv*)
**Methoden:** `AppendToFile`, `BuildPath`, `CopyFile`, `DeleteFile`, `DeleteFiles`, `DirectoryAccessAble`, `DirectoryCreate`, `DirectoryExists`, `DirectoryRemove`, `DirectoryRename`, `DOS_Name`, `FileAccessAble`, `FileExists`, `FileIsReadOnly`, `GetFileExt`, `GetFileName`, `GetFileNameOhneExt`, `GetFileSize`, `GetModusTime`, `GetPath`, `GetTempFile`, `MoveFile`, `MoveFiles`, `MoveHTML`, `RenameFile`, `ReserveUniqueTemppath`, `SearchInFile`, `ShowDialog`, `SrvCopyFile`, `SrvDirectoryCreate`, `SrvDirectoryExists`, `SrvFileExists`, `SrvFileRunning`, `SrvGetCurrentDir`, `SrvGetModulDir`, `SrvMoveFile`, `WriteToFile`

### JFormat — Formatierung
**Methoden:** `Bemerkung`, `String`, `Value`

### JFTP — FTP-Transfer
**Methoden:** `Export`

### JGebinde — Gebinde
**Methoden:** `SetMaskField`

### JGridMaker — Grid-Erzeugung
**Methoden:** `AutoSpaltenAnlegen`, `FastRepeat`, `RowDown`, `RowUp`, `Setup`, `SortColumn`, `SourceTemplate`, `SwitchRows`

### JHalter — Halter
**Methoden:** `HoleProdErfassungDaten`, `StartProdErfassungModal`, `StartProdKorrekturModal`

### JIntrastat — Intrastat-Meldung
**Methoden:** `IstAktiv`, `TouchAktiv`

### JJam — JAM-Maskenzugriff
**Methoden:** `ContainerTest`, `Controlstring`, `Farbdialog`, `FC_Hex_RGB`, `FC_RGB_Hex`, `FldFill`, `FS_Formatieren`, `GetSystemCaching`, `KeyStack`, `LockTest`, `PDFVorgangsFormularVorschau`, `PopMal`, `SetSystemCaching`, `SetTagesDatum`, `SetWechelDatumFlag`, `SoundAbspielen`, `UpdateWaehrUmrechDatum`, `UpdateWaehrUmrechTab`, `VisualObjectTest`

### JJPPParse — JPP-Parser
**Methoden:** `startParse`

### JKassDisp — Kassendisplay
**Methoden:** `AddText`, `Close`, `Config`, `Hide`, `Settext`, `ShowText`

### JKontraktHalter — Kontrakt-Halter
**Methoden:** `AddArtikel`, `AddMengenZeitraum`, `AddPartie`, `AddPreisZeitraum`, `BeendeKontrakt`, `CreateKtrZeitraeume`, `DelArtikel`, `DeleteMengenZeitraum`, `DeletePreisZeitraum`, `DelPartieListe`, `EditArtikel`, `EditArtikelAllePreise`, `EditArtikelPreis`, `EditArtikelPreisRoh`, `EditMengen`, `EditMengenZeitraum`, `ExistsMengenZeitraum`, `ExistsPreisZeitraum`, `GetAnzahlPZ`, `GetArtikelAnzahl`, `GetArtikelPAnzahl`, `GetArtikelPValue`, `GetArtikelValue`, `GetMengenValue`, `GetMengenZRAnzahl`, `GetMengenZRValue`, `GetPartieAnzahl`, `GetPartieValue`, `GetPreisZRValue`, `GetValueKontrakt`, `SetArtikelValue`, `SetKtrKunden`, `SetMengenValue`, `SetValueKontrakt`, `StartKontrakt`, `StartNeuerKontrakt`

### JLvsHalter — LVS-Halter
**Methoden:** `AddLaEiArtikel`, `BeendeBehandlung`, `BeendeLadeeinheit`, `BeendeLadeeinheitListe`, `BeendeLadetraeger`, `BeendeLadetraegerListe`, `BeendeLaTrBewegung`, `BeendeLaTrLadeeinheit`, `ChangeLadeeinheitListe`, `ChangeLadetraegerListe`, `ChangePositionBewegungMarkierIdent`, `DelLaEiArtikel`, `EditLaEiArtikelMenge`, `EditLaEiArtikelNachTyp`, `GetLaEiArtikelAnzahl`, `GetLaEiArtikelValue`, `GetLaEiPosNr`, `GetLaEiValue`, `GetLaTrInfoLetzteBewegung`, `GetLaTrValue`, `GetLvsHalterGuid`, `GetOrCreateLadeEinheit`, `MoveLaEiPositionToLaEi`, `SetBemerkungsText`, `SetLaEiBewegungInformation`, `SetLaEiBreite`, `SetLaEiDeAktiv`, `SetLaEiHoehe`, `SetLaEiLaenge`, `SetLaEiNVE`, `SetLaTrValue`, `SetManuelleBewegungsUndEinlagerungsZeit`, `SetUser`, `SpeichereQualitaetsmessmeldung`, `StartBehandlung`, `StartLadeeinheit`, `StartLadetraeger`, `StartLaTrBewegung`, `StartLaTrLadeeinheit`

### JMandantInformationManager — Mandanteninformationen
**Methoden:** `AreCurrentAndLastInfoEqual`, `CheckAndSendInformation`, `CreateSendAndSaveCurrentInfoXml`

### JME_LISTE — Mengeneinheiten-Liste
**Methoden:** `CreateGebindeDesigner`, `DeleteGebindeDesigner`, `MaskeAnzeigen`, `RefreshFieldPosition`, `RefreshFieldValues`, `SetMeNummer`, `ValidField`

### JMenu — Menue/Favoriten
**Methoden:** `FavoritEinfuegen`, `FavoritLoeschen`

### JMessageContainer — Nachrichten-Container
**Methoden:** `AM_Count`, `AM_Fehler_Ex`, `AM_Hinweis_Ex`, `AM_SetId`, `AM_SetProtBereich`, `AM_Show`, `AM_Warnung_Ex`

### JMessageRouter — Nachrichten-Routing
**Methoden:** `PermanentMessage`, `SendMessage`, `SetSneakerProc`, `SetTimerProc`

### JModulSequencer — Modul-Sequenzer
**Methoden:** `AddZielFelder`, `FeldEntry`, `GoField`, `GoToField`, `GoToNextField`, `ModulAbwaehlen`, `ModulErledigen`, `ModulScharfmachen`, `ModulSkippen`, `Register`, `Show`

### JNachhaltigkeit — Nachhaltigkeit/ESG
**Methoden:** `AddToList`, `ClearList`, `CountList`, `FirstItemInList`, `GetValue`, `InitDefalutValues`, `LoadList`, `NextItemInList`, `RefreshMassebilanz`, `RefreshZertifikat`, `RemoveFromList`, `ResetValues`, `SaveList`, `SetValue`

### JNewsticker — Newsticker
**Methoden:** `Check`

### JParam — Parameter
**Methoden:** `Bediener`, `BuildSnapshotDBVars`, `GetEnviron`, `GetMerkmal`, `GetParam`, `GetParamIsWahr`, `SetMerkmal`

### JPartie — Partie
**Methoden:** `ArtikelHinzufuegen`, `ArtikelVerproben`, `ArtikelZuordnen`, `GetPartieArtiPosit`, `Neu`, `PartieExistiert`, `VorgangInfos`, `Wahl`

### JPartienNachtragen — Partien nachtragen
**Methoden:** `AddV_Id`, `AddWabewId`

### JPartieVertDLGAccess — Partieverteilungs-Dialog
**Methoden:** `GetValue`, `SetzePartie`

### JPartieVerteilGrid — Partieverteilungs-Grid
**Methoden:** `AfterPartieBehandlung`, `GUI_Update`, `Init`, `NeuePartieAnlegen`, `Proc_svware_next_field`, `SetGoFieldProc`, `SetVorgangInfos`, `ZeileLoeschFunktion`, `ZielNachDoNotEnter`

### JPermInventurHelper — permanente Inventur
**Methoden:** `EndeBestandIstNull`, `InitBestandIstNull`, `SetBestandIstNull`, `Wertstellung`, `ZaehlSummen`

### JPfleger — Datenpflege
**Methoden:** `Anwendung`, `AufrufVerteiler`

### JPPBemerkung — JPP-Bemerkungen
**Methoden:** `Delete`, `Read`, `SetUpdateAlleZeilen`, `Write`

### JppRwWaageBeleg — Waage-Beleg (RW) erzeugen
**Methoden:** `AnzeigeFehler`, `BelegErzeugt`, `BelegErzeugung`, `GetErrorListStr`, `GetLastErrorStr`

### JppTest — JPP-Testobjekt
**Methoden:** `JppTestMethode`

### JPrinter — Druckeransteuerung
**Methoden:** `Get`

### JPrinterInfos — Druckerinformationen
**Methoden:** `SetDruckerNummer`

### JProgger — Fortschrittsanzeige
**Methoden:** `Add`, `Watch`

### JPW — Passwort/PW
**Methoden:** `Add`, `Fehler`, `Init`, `Show`, `Warnung`

### JRegister — Register
**Methoden:** `Do`, `GenerateMethod`, `Get`, `Method`, `Valid`, `Validate`, `Version`

### JRegistry — Windows-Registry
**Methoden:** `AeinsRegDel`, `AeinsRegWrite`, `Create`, `DeleteKey`, `Exists`, `KeyNames`, `ReadString`, `Srv_Create`, `Srv_Exists`, `Srv_ReadString`, `Srv_WriteString`, `ValueNames`

### JScreen — Bildschirm/Masken
**Methoden:** `Window`

### JScripting — Skripte/Automation ausfuehren
**Methoden:** `Automation`, `RunViaId`, `RunViaName`

### JService
**Methoden:** `Install`, `IsActiv`, `IsServiceActiv`, `Run`, `SetLog`

### JSILVERLIGHT — Silverlight
**Methoden:** `GET_AWL`, `GET_AWL2JVAR`

### JSockets — Socket-Kommunikation
**Methoden:** `Connect`, `Talk`

### JSon — JSON aufbauen
**Methoden:** `Add`, `AddArray`, `AddString`, `AddStringArray`, `AddVanilla`, `Indent`, `Set`

### JStoffStromErweiterung — Stoffstrom
**Methoden:** `AddAusZusammensetzung`, `Berechnen`, `CleanMem`, `DatenStammGeaendert`, `Delete`, `GetArtAnteil`, `GetArtHerkunft`, `GetArtMEAnteil`, `GetArtMEGrundNummer`, `GetArtMEMenge`, `GetArtMenge`, `GetArtMengenMEGrundNummer`, `GetArtMEStoffArtText`, `GetArtMETextAnteil`, `GetArtMETextMenge`, `GetArtOriME`, `GetArtOriMenge`, `GetArtWaBewId`, `GetDatenAnzahl`, `GetInitOrChanged`, `GetLieferantID`, `GetNoDataLoaded`, `GetStoffStromArt`, `GetValue`, `GetVorgangTyp`, `Init`, `NewWertSatz`, `NewZusammensetzungsSatz`, `PutValue`, `Read`, `ReadStromstoffZusammensetzung`, `SaveFromBackup`, `SaveToBackup`, `SetArtAnteil`, `SetArtHerkunft`, `SetArtiStammId`, `SetArtMEAnteil`, `SetArtMEGrundNummer`, `SetArtMEMenge`, `SetArtMenge`, `SetArtMengenMEGrundNummer`, `SetArtMEStoffArtText`, `SetArtMETextAnteil`, `SetArtMETextMenge`, `SetArtOriME`, `SetArtOriMenge`, `SetArtWaBewId`, `SetGewicht`, `SetInitOrChanged`, `SetLieferantID`, `SetMenge`, `SetMENummer`, `SetNoDataLoaded`, `SetOriMenge`, `SetWaBewId`, `Write`

### JStrings — Zeichenketten
**Methoden:** `BeginsWith`, `Format`, `Formatiere`, `GetLength`, `IsEqual`, `IsNumeric`, `Left`, `Match`, `Mid`, `Replace`, `Right`, `ToLower`, `ToUpper`, `Translate`, `Trim`, `Tuettel`

### JSystem — Systemfunktionen
**Methoden:** `CancelKeys`, `CreateProcess`, `Event`, `Execute`, `Fehlerprotokoll`, `GetBitmapMetric`, `GetFontMetric`, `GetGUID`, `GetPid`, `GetPrinterMetric`, `GetQRDrucker`, `GetScreenMetric`, `GetStandardDrucker`, `GetSystemVersion`, `GetTickCount`, `GetVersion`, `GetVersions`, `HatWindowsAdminRechte`, `HostName`, `IsRemoteSessionJ`, `ISWINDOWSFORCRYSTAL10`, `ScreenMemoryAdd`, `ScreenMemoryExists`, `ScreenMemoryGetOwner`, `ScreenMemoryRemove`, `ScreenMemorySetJvar`, `SelectDrucker`, `SelectQRDrucker`, `SetStandardDrucker`, `ShowSybaseHelp`, `Sleep`, `sm_mw_get_frame_wnd`, `UpdateLogging`

### JTab — Register/Tabs
**Methoden:** `Add`, `Set`

### JTapi — Telefonie (TAPI)
**Methoden:** `GetAdressName`, `GetAll`, `GetLineName`, `GetLinesInfo`, `IsVoice`, `LineClose`, `LineDialog`, `LineOpen`, `LineReset`, `Log`, `MakeCall`, `Request`, `SetDefaultLine`, `SetDefaultLocation`, `SetLog`, `TranslateDialog`

### JTC
**Methoden:** `AddContent`, `Clear`, `Dump`, `Exec_VBA`, `Get`, `GetFromJVar`, `GetTabkey`, `GetToJVar`, `Init`, `IsChanged`, `Load`, `MTrans`, `PrintDoc`, `Refresh`, `Restore`, `Save`, `SetFormat`, `SetRelation`, `SetWatcher`, `Sql_Command`, `Store`, `Tabkey`

### JTcpIp — TCP/IP-Kommunikation
**Methoden:** `Close`, `Open`, `PortPing`, `Rcv`, `Snd`, `Talk`

### JTCPIP_Scanner — Scanner ueber TCP/IP
**Methoden:** `CheckAI`, `Dump`, `GetValue`, `GetValue2`, `GetXValue`, `GetXValue2`, `Reset`, `SetValue`, `SetValue2`

### JTcpIpServer — TCP/IP-Serverdienst
**Methoden:** `Close`, `CloseClient`, `Open`, `Rcv`, `Snd`

### JTcpServices — TCP-Dienste
**Methoden:** `Pause`, `Resume`, `Start`, `Stop`

### JTeilUmwandlung — Teilumwandlung
**Methoden:** `AddGebinde`, `BeendeUmwandlung`, `EingabeAnzahl`, `EingabeKontraktErlaubt`, `EingabeKontraktNummer`, `EingabeMenge`, `EingabePartieErlaubt`, `EingabePartieNummer`, `EingabePreis`, `EingabePreisBezug`, `EingabeWert`, `RestAusbuchen`, `StartUmwandlung`

### JUmwandlung — Vorgangsumwandlung
**Methoden:** `AddId`, `DialogAufruf`

### JVars — JVars (benannte Variablen)
**Methoden:** `Aufloesen`, `BAG_CHANGED`, `BuildRelation`, `BuildStackFromJVar`, `BuildTable`, `Call`, `CHECK`, `Clear`, `Clone`, `Collect`, `Colon`, `Concat`, `ConcatPerSql`, `ConcatVar`, `Copy`, `CreateSql`, `DB2Grid`, `DelegateJ`, `Delete`, `DeleteinStack`, `Event`, `ExecCs`, `ExecJpl`, `ExecJPP`, `ExecSql`, `ExecSql2`, `ExecXML`, `Exists`, `Expand`, `FillX`, `Get`, `GetConnectIds`, `GetEpa`, `GetGlobalVar`, `GetIdList`, `GetIdList2XML`, `GetSetting`, `GetVal`, `GiveKeys`, `Grid2JVars`, `Hermes`, `Ident`, `IdentWhereAL`, `IndexinStack`, `InitVal`, `Integrationstest`, `IsEqual`, `IsLDBVariable`, `ItemValue`, `JConcatStack`, `JplRestore`, `JplStore`, `JVars2DB`, `LDBVariableNamen2Stack`, `Length`, `LoadFromAL`, `LoadFromSql`, `MakeCurSnapshot`, `MakeXML`, `MakeXMLNode`, `Msg`, `Pop`, `Push`, `PushFromJVar`, `ReadFromFile`, `RegLookup`, `ReverseStack`, `SecondsSince`, `Set`, `SetFromLDB`, `SetFromMask`, `SetFromMultiLineMask`, `SetFromParam`, `SetReadOnly`, `SetSetting`, `Show`, `SnapCppInterfaces`, `SnapCppRegistry`, `SnapJpp`, `SnapOwner`, `SnapParameter`, `Split`, `Split2Stack`, `Stack2XML`, `Take`, `Trace`, `TrimUpper`, `Unset`, `WidgetToJvars`, `WriteDefines`, `WriteToFile`, `XML2Stack`
**Eigenschaften:** `JVAR_FAARCHIV`, `JVAR_FAARCHIV_LOOK_IMPORT`, `JVAR_FAARCHIV_VIEW`, `JVAR_GATEKEEPER_HANDLE_MODE`, `JVAR_GATEKEEPER_HANDLE_TIMESTAMP`, `JVAR_KOMPETENZ`, `JVAR_SYSTEM_STATUS`

### JVorgKlammer — Vorgangsklammer
**Methoden:** `AbbrechenKlammerWabew`, `AnzahlElementeWabew`, `BeendeKlammerWabew`, `HoleKlammertypWabew`, `HoleMengeManuelWabew`, `HoleMengeWabew`, `HoleNummerWabew`, `HoleWertWabew`, `KlammerHinzufuegenWabew`, `ListeLeerenWabew`, `SetzeVorgangKlammer`, `StartKlammerWabew`

### JVorgPosMarkier — Positionen markieren
**Methoden:** `MarkiereBeleg`, `MarkiereInSVWARE`, `MarkiereWarenPosition`

### JVorgResClearing — Vorgangsreservierungs-Clearing
**Methoden:** `DoIt`, `GetValue`, `Insert0Nummer`, `InsertManuNummer`, `InsertResNummer`, `InsertZK0Nummer`, `Neu`, `SetValue`

### JVPST — Vorgangs-VPST
**Methoden:** `getSTD`, `getUSRSTD`

### JWaage — Waagenanbindung
**Methoden:** `Waagedaten`

### JWaagenprofil — Waagenprofile
**Methoden:** `Wiegen`

### JWabewAddon — Warenbewegung-Addon
**Methoden:** `Load`, `Save`

### JWatchDog — Ueberwachung/Watchdog
**Methoden:** `Jpl`, `TimeOut`

### JWidgetToJson — Widget nach JSON
**Methoden:** `Exec`

### JWordWrap — Zeilenumbruch
**Methoden:** `Add`, `Connect`

### JWorkFlow — Workflows
**Methoden:** `Set`

### JXML — XML erzeugen/anzeigen
**Methoden:** `Add`, `Show`

### windownavigator — Fenster-Navigation
**Methoden:** `setState`
