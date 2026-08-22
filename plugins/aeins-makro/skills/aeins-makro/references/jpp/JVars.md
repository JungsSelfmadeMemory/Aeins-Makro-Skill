# Dokumentation: JVars

**Datei:** `a1aeins/ah_jvars_jpp.cpp`  
**Klasse:** `JVars`  
**Zweck:** Geordnete Speicherangelegenheiten  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Geordnete Speicherangelegenheiten

---

## Methodenübersicht

### Ident

**Kurzbeschreibung:**  
Liefert eine neue eindeutige Owner-ID via JVARS::IDENT() als Long zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### Set

**Kurzbeschreibung:**  
Setzt JVar name=value (owner); optionale len/fill links- bzw. rechtsbündig auffüllen via JVARS::SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| value | string | ja | `—` |
| owner | long | optional | `0` |
| len | long | optional | `0` |
| fill | string | optional | ` ` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetFromMask

**Kurzbeschreibung:**  
Liest Maskenfeld fld (optional über Array-Occurrence/* oder jvars-Indirektion) und legt Inhalt per JVARS::SET() ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| fld | string | ja | `—` |
| owner | long | optional | `0` |
| occ | long | optional | `1` |
| jvars | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetFromMultiLineMask

**Kurzbeschreibung:**  
Wie SetFromMask, behandelt aber Word-Wrap-Felder per sm_n_gwrap; speichert Inhalt mit JVARS::SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| fld | string | ja | `—` |
| owner | long | optional | `0` |
| occ | long | optional | `1` |
| jvars | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetFromMaskOrMultiline

**Kurzbeschreibung:**  
Liest Maskenfeld (Multiline via sm_n_gwrap, sonst occ-weise), optional preparesql/prefix/postfix; JVARS::SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| fld | string | ja | `—` |
| crlf | string | optional | `\r\n` |
| owner | long | optional | `0` |
| preparesql | bool | optional | `FALSE` |
| prefix | string | optional | `—` |
| postfix | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetFromParam

**Kurzbeschreibung:**  
Setzt JVar aus Parameter via JVARS::SET_FROM_PARAM(owner,name,param). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| param | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetFromLDB

**Kurzbeschreibung:**  
Setzt JVar aus LDB-Variable via JVARS::SET_FROM_LDB(owner,name,ldbname). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| ldbname | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Concat

**Kurzbeschreibung:**  
Hängt value an JVar name an (optional tofront/escape \n); JVARS::GET()+JVARS::SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| value | string | ja | `—` |
| owner | long | optional | `0` |
| tofront | long | optional | `FALSE` |
| escape | long | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ConcatVar

**Kurzbeschreibung:**  
Hängt JVar source an JVar name an via JVARS::GET()/JVARS::SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| source | string | ja | `—` |
| sowner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ConcatPerSql

**Kurzbeschreibung:**  
Führt Select aus, konkateniert Spalte col aller Zeilen mit flag!=0 (Trenner join) in JVar, setzt optional *count. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| col | string | ja | `—` |
| flag | string | ja | `—` |
| join | string | optional | `—` |
| select | string | ja | `—` |
| *count | string | optional | `—` |

**Rückgabe:** long

---

### Get

**Kurzbeschreibung:**  
Liefert JVar (THIS) in Maskenfeld fld (fld_put/sm_pwrap) oder im joinmode in JVar joinname; JVARS::GET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fld | string | optional | `—` |
| joinowner | long | optional | `THIS_TOWNER` |
| joinmode | bool | optional | `FALSE` |
| join | string | optional | `—` |
| joindb | long | optional | `0` |
| multiline | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Clear

**Kurzbeschreibung:**  
Setzt JVar name (owner) auf Leerstring via JVARS::SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Copy

**Kurzbeschreibung:**  
Kopiert JVar from nach to (optional anderer towner, colon-Auflösung, trim) via JVARS::GET()/JVARS::SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| from | string | ja | `—` |
| to | string | ja | `—` |
| owner | long | optional | `0` |
| towner | long | optional | `owner` |
| colon | bool | optional | `FALSE` |
| trim | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Clone

**Kurzbeschreibung:**  
Klont JVar from nach to (optional towner) via JVARS::Clone(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| from | string | ja | `—` |
| to | string | ja | `—` |
| owner | long | optional | `0` |
| towner | long | optional | `owner` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Delete

**Kurzbeschreibung:**  
Löscht alle JVars eines Owners via JVARS::ERASE(owner). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ExecSql

**Kurzbeschreibung:**  
Select

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| colon | bool | optional | `FALSE` |
| value | string | optional | `—` |
| error | string | optional | `—` |
| commit | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CreateSql

**Kurzbeschreibung:**  
erzeugt Datenbank-Objekt aus JVar

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| sqlname | string | ja | `—` |
| parms | string | optional | `NoPathCheck=true` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CHECK

**Kurzbeschreibung:**  
AMIC-Test Funktion CHECK als JPP-Methode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `-1` |
| istwert | string | ja | `—` |
| sollwert | string | ja | `—` |
| source | string | ja | `—` |
| hinweis | string | optional | `—` |
| fehlernummer | long | optional | `0` |
| sollwertishex | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ExecSql2

**Kurzbeschreibung:**  
Special-Select

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| sql | string | ja | `—` |
| var | string | optional | `$jvar$` |
| colon | bool | optional | `FALSE` |
| commit | bool | optional | `FALSE` |

**Rückgabe:** long

---

### Colon

**Kurzbeschreibung:**  
Special-Colon

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| colon_owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ExecJpl

**Kurzbeschreibung:**  
Ersetzt ID_-Defines in JVar durch formposnummer (DB-Select), schreibt Datei und ruft sm_jplcall(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| path | string | optional | `.` |
| file | string | optional | `ean.j` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Show

**Kurzbeschreibung:**  
Zeigt JVar (owner/name) an via JVARS::SHOW() (Typ, Datei, hex, Stack-Modus). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| file | string | optional | `—` |
| typ | long | optional | `0` |
| hex | bool | optional | `FALSE` |
| stack | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LoadFromSql

**Kurzbeschreibung:**  
Führt Select aus, fetch erste Zeile, legt Spalte col in JVar ab via JVARS::SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| sql | string | ja | `—` |
| col | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LoadFromAL

**Kurzbeschreibung:**  
Liest Ident-Werte aus Auswahlliste (erste Zeile) und setzt/pusht sie in gleichnamige JVars. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| strip | bool | optional | `TRUE` |
| push | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### IdentWhereAL

**Kurzbeschreibung:**  
Baut aus allen Auswahllisten-Zeilen eine OR/AND-WHERE-Bedingung über die Ident-Namen und legt sie in JVar ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Take

**Kurzbeschreibung:**  
Schneidet ersten Regex-Treffer (that) aus JVar name heraus, strippt ihn und liefert ihn als String zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| that | string | ja | `—` |
| frontstrip | string | optional | `—` |
| strip | string | optional | `—` |

**Rückgabe:** string

---

### Expand

**Kurzbeschreibung:**  
Ersetzt in string Platzhalter /name/ für jeden Namen in values durch dessen JVar-Wert; Ergebnis in JVar name. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| values | string | ja | `—` |
| string | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Unset

**Kurzbeschreibung:**  
Entfernt JVar name (owner) via JVARS::UNSET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | ja | `0` |
| name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Length

**Kurzbeschreibung:**  
Liefert Länge der JVar name (owner) via JVARS::LENGTH() als Long. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** long

---

### TrimUpper

**Kurzbeschreibung:**  
Trimmt und großschreibt JVar name (AMIC::TRIMUP) und speichert zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Push

**Kurzbeschreibung:**  
Legt value auf Stack-JVar name (owner), optional maxstacklen, via JVARS::PUSH(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| value | string | optional | `—` |
| maxstacklen | long | optional | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PushFromJVar

**Kurzbeschreibung:**  
Pusht Wert der JVar fromname/fromowner auf Stack-JVar name/owner via JVARS::PUSH(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| fromname | string | ja | `—` |
| fromowner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Pop

**Kurzbeschreibung:**  
Poppt JVar(s) names vom Stack; bei basis=FALSE Namensliste aus JVar lesen; JVARS::POP(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| names | string | ja | `—` |
| owner | long | optional | `0` |
| basis | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### InitVal

**Kurzbeschreibung:**  
Initialisiert typisierte JVar via JVARS::INITVAL(); liefert Erfolg (s_class != NULL) als Long. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| type | long | ja | `0` |
| initvalue | string | optional | `—` |

**Rückgabe:** long

---

### GetVal

**Kurzbeschreibung:**  
Holt typisierten JVar-Wert (optional löschen) via JVARS::GETVAL() und schreibt ihn ins Maskenfeld fld (fld_put). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| fld | string | ja | `—` |
| occ | long | optional | `1` |
| owner | long | optional | `0` |
| delete | bool | optional | `FALSE` |
| mask | string | optional | `—` |

**Rückgabe:** long

---

### Msg

**Kurzbeschreibung:**  
Zeigt JVar name=<wert> per smx_hinweis an; JVARS::GET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### JplStore

**Kurzbeschreibung:**  
Serialisiert die occ-Werte der Masken-Felder (member-Liste) als XML (MSXML) und legt es in JVar name ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| member | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### JplRestore

**Kurzbeschreibung:**  
Lädt XML aus JVar, iteriert Variable-Knoten und schreibt name/occ/Inhalt per fld_put in die Maske zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Exists

**Kurzbeschreibung:**  
Prüft, ob JVar name (owner) existiert, via JVARS::EXIST(); liefert Bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool

---

### Collect

**Kurzbeschreibung:**  
Hängt value mit Trenner trenner an JVar name an (COM::Tools->ConcatIt); JVARS::SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| value | string | ja | `—` |
| trenner | string | ja | `|` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RegLookup

**Kurzbeschreibung:**  
Sucht in Tabelle table die erste Zeile, deren Regex source_col den JVar-Wert matched, ersetzt $-Gruppen und schreibt Ersetzung (reg_col) und Info zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| source | string | ja | `—` |
| table | string | ja | `—` |
| source_col | string | ja | `—` |
| reg_col | string | ja | `—` |
| grp_col | string | ja | `—` |
| info_col | string | optional | `—` |
| info | string | optional | `—` |
| owner | long | optional | `0` |
| usecache | bool | optional | `FALSE` |
| ignoreempty | bool | optional | `TRUE` |

**Rückgabe:** long

---

### Split

**Kurzbeschreibung:**  
Splittet JVar/Maskenfeld/EPA/Direktwert per Split() und verteilt Teile in Maskenfeld-Occurrences oder pusht sie in Stack-JVar (mit Count). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| tname | string | ja | `—` |
| towner | long | optional | `0` |
| tcount | string | optional | `—` |
| delimiterList | string | optional | `DEFAULT_DELIMITER` |
| ignoreMultiples | bool | optional | `TRUE` |
| quoteList | string | optional | `DEFAULT_QUOTELIST` |
| stripQuotes | bool | optional | `TRUE` |
| startAt | long | optional | `0` |
| endAt | long | optional | `USE_STR_LEN` |
| allowEscapes | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WriteToFile

**Kurzbeschreibung:**  
Schreibt JVar-Inhalt in Datei loc (Append/Write, loc optional aus JVar) via COM::Tools; liefert optional Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| append | bool | optional | `FALSE` |
| loc | string | ja | `—` |
| jvars | bool | optional | `FALSE` |

**Rückgabe:** long

---

### ReadFromFile

**Kurzbeschreibung:**  
Liest Datei loc (legacy/ReadFile) in JVar name via COM::Tools; liefert optional Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| loc | string | ja | `—` |
| jvars | bool | optional | `FALSE` |
| legacy | bool | optional | `TRUE` |

**Rückgabe:** long

---

### SecondsSince

**Kurzbeschreibung:**  
Berechnet Sekunden-Differenz zwischen Timestamp in JVar und aktueller Zeit; liefert Long. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** long

---

### ItemValue

**Kurzbeschreibung:**  
Holt Return-Wert eines Items (AL_IB_GET_RETURN) zum Itemnamen aus JVar name und legt ihn in JVar target. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| target | string | ja | `—` |
| alpha | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ExecXML

**Kurzbeschreibung:**  
Delegiert an JVARS::ExecXML(owner,name,tname); liefert Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| tname | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ExecJPP

**Kurzbeschreibung:**  
Delegiert an JVARS::ExecJPP(owner,name,tname,value); liefert Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| tname | string | ja | `—` |
| value | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WriteDefines

**Kurzbeschreibung:**  
Generiert ah_jvars_define.h aus Tabellen jvar_owner/jvars (#define-Blöcke) und schreibt sie in die Datei. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| datei | string | optional | `..\\a1aeins\\ah_jvars_define.h` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WidgetToJvars

**Kurzbeschreibung:**  
Pusht Maskenfeld-Werte (Occurrences from_occ..to_occ, optional ohne leere) in Stack-JVar name; liefert Anzahl. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| widget | string | ja | `—` |
| from_occ | long | optional | `1` |
| to_occ | long | optional | `1` |
| skip_empty | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MakeXMLNode

**Kurzbeschreibung:**  
Baut XML-Knoten aus Attribut-/Werte-Listen via JVARS::MAKEXMLNODE() und legt/hängt ihn an JVar name. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| attribute | string | optional | `—` |
| attribute_owner | long | optional | `0` |
| attribut | string | optional | `—` |
| values | string | optional | `—` |
| values_owner | long | optional | `0` |
| node | string | ja | `—` |
| name | string | ja | `—` |
| owner | long | optional | `0` |
| join | string | optional | `—` |
| add | bool | optional | `FALSE` |
| trennen | bool | optional | `TRUE` |
| aufbereiten | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MakeXML

**Kurzbeschreibung:**  
Stellt JVar name eine XML-Deklaration (iso-8859-1) voran; JVARS::GET()/SET(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MakeCurSnapshot

**Kurzbeschreibung:**  
Erzeugt Cursor-Snapshot via JVARS::MakeCurSnapshot(owner,name); liefert optional Anzahl. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Aufloesen

**Kurzbeschreibung:**  
Löst JVar name per JVARS::AUFLOESEN() auf und legt Ergebnis in destname/destowner. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| destname | string | ja | `—` |
| destowner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetGlobalVar

**Kurzbeschreibung:**  
Nutzt JVar name als Key für JVARS::GetGlobalVar() und legt Ergebnis in destname/destowner. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| destname | string | ja | `—` |
| destowner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### IndexinStack

**Kurzbeschreibung:**  
Liefert Index von value im Stack stackname via JVARS::INDEX() (value optional aus JVar) als String. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| stackname | string | ja | `—` |
| stackowner | long | optional | `0` |
| value | string | ja | `—` |
| valueowner | long | optional | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteinStack

**Kurzbeschreibung:**  
Löscht value aus Stack via NET-Aufruf DeleteInJVarStack (über Hilfs-Owner); liefert Ergebnis-String. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| stackname | string | ja | `—` |
| stackowner | long | optional | `0` |
| value | string | ja | `—` |
| valueowner | long | optional | `-1` |
| modus | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### JConcatStack

**Kurzbeschreibung:**  
Konkateniert mehrere Stacks (stacknames|owner|types) zeilenweise per Format und legt Ergebnis als JVar/JADD ab; liefert Long. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | optional | `JINI_JADD_JSET_KEY` |
| owner | long | optional | `JINI_JADD_JSET_OWNER` |
| stacknames | string | optional | `—` |
| stackowner | string | optional | `0` |
| stacktypes | string | optional | `2` |
| format | string | optional | `%s` |
| outformat | string | optional | `%s` |
| concat | string | optional | `—` |
| add | bool | optional | `TRUE` |

**Rückgabe:** long

---

### GetIdList2XML

**Kurzbeschreibung:**  
Iteriert Auswahllisten-Zeilen und baut <rows>/<row>-XML der Ident-Werte; legt es samt count/maxcount in JVars ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |
| hoechstedatenzeile | long | optional | `TRUE` |

**Rückgabe:** long

---

### GetIdList

**Kurzbeschreibung:**  
Legt temporäre Tabelle an und füllt sie zeilenweise mit den Ident-Werten der Auswahlliste (Insert); setzt relname/count. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| relname | string | optional | `getidlist` |
| emptyisnull | bool | optional | `FALSE` |
| pointisnull | bool | optional | `FALSE` |
| hoechstedatenzeile | long | optional | `TRUE` |
| alter | string | optional | `—` |
| mitschrift | string | optional | `—` |

**Rückgabe:** long

---

### ReverseStack

**Kurzbeschreibung:**  
Kehrt Stack-JVar name (owner) um via JVARS::REVERSEIT(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Grid2JVars

**Kurzbeschreibung:**  
Überträgt Grid-Spalten in JVars (JVARS::Grid2JVars), optional Update in relation; pusht Status/Fehler. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| gridname | string | ja | `—` |
| column_list | string | optional | `—` |
| relation | string | optional | `—` |
| relationcolumn | string | optional | `—` |
| relationwhere | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BuildStackFromJVar

**Kurzbeschreibung:**  
Splittet JVar fromname an separator, optional trim/upper/lower/reverse, und pusht Teile in Stack-JVar name. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fromowner | long | optional | `0` |
| fromname | string | ja | `—` |
| owner | long | optional | `0` |
| name | string | ja | `—` |
| trim | bool | optional | `TRUE` |
| mode | long | optional | `0` |
| reverse | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### JVars2DB

**Kurzbeschreibung:**  
Führt parametrisiertes Statement je JVar-Stackwert aus via JVARS::JVars2DB(owner,name,statement). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |
| statement | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Event

**Kurzbeschreibung:**  
Löst Event identificator aus via JVARS::Event(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| identificator | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Hermes

**Kurzbeschreibung:**  
Delegiert an JVARS::Hermes(zielowner, messageowner). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| zielowner | long | optional | `0` |
| messageowner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Integrationstest

**Kurzbeschreibung:**  
Startet amic_test('which') per CtrlStringParser (optional modal). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| which | string | ja | `*` |
| modal | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Stack2XML

**Kurzbeschreibung:**  
Kopiert Stack und ruft NET JVarsXmlStack (modus 1) zur XML-Serialisierung nach xmlname/xmlowner. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |
| xmlowner | long | optional | `0` |
| xmlname | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### XML2Stack

**Kurzbeschreibung:**  
Ruft NET JVarsXmlStack (modus 0) zum Deserialisieren von xmlname in Stack-JVar name. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |
| xmlowner | long | optional | `0` |
| xmlname | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### IsEqual

**Kurzbeschreibung:**  
Vergleicht zwei JVar-Stacks (GET_ARRAY), exakt oder per IsEqual; legt Ergebnis (0/1) in JVar 'IsEqual' ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |
| owner2 | long | optional | `0` |
| name2 | string | ja | `—` |
| equal | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GiveKeys

**Kurzbeschreibung:**  
Schreibt die Keys eines Owners (fromowner) in JVar name via JVARS::GetKeys(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |
| fromowner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DelegateJ

**Kurzbeschreibung:**  
Ruft JPL j mit owner als Argument via ah::JPLCALL(); liefert true. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| j | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Split2Stack

**Kurzbeschreibung:**  
Zerlegt JVar key in Stücke von max. 254 Zeichen und pusht sie in Stack-JVar sname. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |
| sowner | long | optional | `0` |
| sname | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Trace

**Kurzbeschreibung:**  
Ruft je nach func (TraceBegin/TraceEnd/TraceUniversal/Trace) ah::Trace*-Funktionen bzw. NET 'Call' mit JVar-Inhalt. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |
| func | string | optional | `Trace` |
| cursor | string | optional | `—` |
| plan | string | optional | `—` |
| bereich | long | ja | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ExecCs

**Kurzbeschreibung:**  
Zeigt nur Hinweis 'NETSCRIPT wird nicht mehr unterstützt'; ohne Funktion. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Call

**Kurzbeschreibung:**  
Setzt optional $code und ruft NET::NET('Call', owner). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| $code | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetEpa

**Kurzbeschreibung:**  
Holt EPA in Maskenfeld via JVARS::GetEpa(owner, maskenfeld). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| maskenfeld | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FillX

**Kurzbeschreibung:**  
Baut String durch repeat-faches Wiederholen von value und legt ihn in JVar name ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |
| value | string | optional | `—` |
| repeat | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetConnectIds

**Kurzbeschreibung:**  
Legt Aeins- und A1Net-Connection-IDs (glb->LoginId bzw. NET Sql2JVar) als JVars ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetReadOnly

**Kurzbeschreibung:**  
Markiert JVar name (owner) als read-only via JVARS::SET_READONLY(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BAG_CHANGED

**Kurzbeschreibung:**  
Liefert via JVARS::BAG_CHANGED(name), ob sich der Bag geändert hat (Bool). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### IsLDBVariable

**Kurzbeschreibung:**  
Prüft per ah::IsLDBVariable(), ob ldbname eine LDB-Variable ist; liefert Long/Bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ldbname | string | ja | `—` |

**Rückgabe:** long

---

### LDBVariableNamen2Stack

**Kurzbeschreibung:**  
Pusht alle LDB-Variablennamen (ah::GetLDBNamen) in Stack-JVar name; liefert Anzahl. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** long

---

### SnapOwner

**Kurzbeschreibung:**  
Liefert Snapshot-Owner via JVARS::SnapOwner() als Long. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### SnapJpp

**Kurzbeschreibung:**  
Legt CJPP_DataSource_Fetch()-Snapshot in neuer JVar 'SnapJpp' ab; liefert deren Owner. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### SnapParameter

**Kurzbeschreibung:**  
Legt CParameter_DataSource_Fetch()-Snapshot in JVar 'SnapParameter' ab; liefert Owner. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### SnapCppInterfaces

**Kurzbeschreibung:**  
Legt Interfaces_DataSource_Fetch()-Snapshot in JVar 'SnapCppInterfaces' ab; liefert Owner. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### SnapCppRegistry

**Kurzbeschreibung:**  
Legt Registry_DataSource_Fetch()-Snapshot in JVar 'SnapCppRegistry' ab; liefert Owner. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### LogJVarForUnittest

**Kurzbeschreibung:**  
Protokolliert JVars eines Owners für Unittest via JVARS::LogJVarForUnittest(modul, owner); liefert String. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| modul | string | ja | `—` |
| owner | long | ja | `0` |

**Rückgabe:** string

---

### JVars2Json

**Kurzbeschreibung:**  
Wandelt alle JVars des Owners in JSON (JVARS::JVars2Json) und legt es in t_name/t_owner ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | ja | `0` |
| t_owner | long | ja | `0` |
| t_name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MakeDemoString

**Kurzbeschreibung:**  
Erzeugt Demo-String der Länge anzahl (A-Z zyklisch) und speichert ihn in JVar name. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | ja | `0` |
| name | string | ja | `—` |
| anzahl | long | optional | `256` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
