# Dokumentation: CHelper

**Datei:** `a1aeins/ah_jhelper.cpp`  
**Klasse:** `CHelper`  
**Zweck:** Ib und AW Unterstützung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Ib und AW Unterstützung

---

## Methodenübersicht

### Ident1

**Kurzbeschreibung:**  
1. Id

_Keine Parameter._

**Rückgabe:** string

---

### Ident2

**Kurzbeschreibung:**  
2. Id

_Keine Parameter._

**Rückgabe:** string

---

### Ident3

**Kurzbeschreibung:**  
3. Id

_Keine Parameter._

**Rückgabe:** string

---

### Ident4

**Kurzbeschreibung:**  
4. Id

_Keine Parameter._

**Rückgabe:** string

---

### NameIdent1

**Kurzbeschreibung:**  
Name des 1. Idents

_Keine Parameter._

**Rückgabe:** string

---

### NameIdent2

**Kurzbeschreibung:**  
Name des 2. Idents

_Keine Parameter._

**Rückgabe:** string

---

### NameIdent3

**Kurzbeschreibung:**  
Name des 3. Idents

_Keine Parameter._

**Rückgabe:** string

---

### NameIdent4

**Kurzbeschreibung:**  
Name des 4. Idents

_Keine Parameter._

**Rückgabe:** string

---

### IstVorhanden

**Kurzbeschreibung:**  
Wurde eine HelperKontext gefunden ? returns true, wennn ja

_Keine Parameter._

**Rückgabe:** bool

---

### IstItemBox

**Kurzbeschreibung:**  
Handelt  es sich um eine IB returns true, wennn ja

_Keine Parameter._

**Rückgabe:** bool

---

### IstAuswahlListe

**Kurzbeschreibung:**  
Handelt es sich um eine Auswahlliste ? returns true, wennn ja

_Keine Parameter._

**Rückgabe:** bool

---

### SindMarkiert

**Kurzbeschreibung:**  
Sind Daten einzeln markiert? returns true, wennn ja, auch bei Gesamtauswahl = nein

_Keine Parameter._

**Rückgabe:** bool

---

### Home

**Kurzbeschreibung:**  
An den Anfang der Liste

_Keine Parameter._

**Rückgabe:** bool

---

### End

**Kurzbeschreibung:**  
Ans Ende

_Keine Parameter._

**Rückgabe:** bool

---

### NextRecord

**Kurzbeschreibung:**  
einen Satz fortschalten

_Keine Parameter._

**Rückgabe:** bool

---

### FirstRecord

**Kurzbeschreibung:**  
auf ersten Satz schalten

_Keine Parameter._

**Rückgabe:** bool

---

### PreviousRecord

**Kurzbeschreibung:**  
Einen Satz zurück

_Keine Parameter._

**Rückgabe:** bool

---

### Refresh

**Kurzbeschreibung:**  
Anzeige neu aufbauen

_Keine Parameter._

**Rückgabe:** bool

---

### GetFieldCount

**Kurzbeschreibung:**  
Anzahl Felder

_Keine Parameter._

**Rückgabe:** long

---

### GetSelCount

**Kurzbeschreibung:**  
Anzahl markierter Sätze

_Keine Parameter._

**Rückgabe:** long

---

### GetTotalCount

**Kurzbeschreibung:**  
Anzahl der Sätze in der Auswahlliste

_Keine Parameter._

**Rückgabe:** long

---

### GetBoxBesitzer

**Kurzbeschreibung:**  
Besitzer der Auswahlliste

_Keine Parameter._

**Rückgabe:** long

---

### GetFieldHeader

**Kurzbeschreibung:**  
Liefert m_aw->GetFieldHeader(col) als JPP-String-Rueckgabe; bricht bei ungueltigem m_aw ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | long | ja | `0` |

**Rückgabe:** string

---

### GetFieldName

**Kurzbeschreibung:**  
Liefert m_aw->GetFieldName(col) als JPP-String-Rueckgabe; bricht bei ungueltigem m_aw ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | long | ja | `0` |

**Rückgabe:** string

---

### GetFieldLen

**Kurzbeschreibung:**  
Liefert m_aw->GetFieldLen(col) als JPP-Long-Rueckgabe; bricht bei ungueltigem m_aw ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | long | ja | `0` |

**Rückgabe:** long

---

### GetFieldType

**Kurzbeschreibung:**  
Liefert m_aw->GetFieldType(col) als JPP-String-Rueckgabe; bricht bei ungueltigem m_aw ab. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | long | ja | `0` |

**Rückgabe:** string

---

### GetFieldData

**Kurzbeschreibung:**  
Holt Spaltenwert via m_aw->GetFieldValue(col, ergebnis) und gibt ihn als JPP-String zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | long | ja | `0` |

**Rückgabe:** string

---

### GetFieldDataByName

**Kurzbeschreibung:**  
GetFieldData nach Namen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| tname | string | optional | `—` |
| towner | long | optional | `0` |
| tocc | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFieldSelString

**Kurzbeschreibung:**  
gibt einen String wie '5 von 18' oder 'alle 18' zurück

_Keine Parameter._

**Rückgabe:** string

---

### FetchNextSelRecord

**Kurzbeschreibung:**  
Delegiert an m_aw->FetchNextSelRecord(); gibt true bei Erfolg zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool

---

### FetchNextCurHome

**Kurzbeschreibung:**  
Delegiert an m_aw->CursorHome(); gibt true bei Erfolg zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool

---

### GetAnwendung

**Kurzbeschreibung:**  
Gibt m_Anwendung.ToString() als JPP-String zurueck; prueft m_aw->IsValid(). _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### GetVariante

**Kurzbeschreibung:**  
Gibt das Member m_Variante als JPP-String zurueck; prueft m_aw->IsValid(). _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### GetAnwendId

**Kurzbeschreibung:**  
GetAnwendungsID

_Keine Parameter._

**Rückgabe:** string

---

### GetVarId

**Kurzbeschreibung:**  
GetVariantenID

_Keine Parameter._

**Rückgabe:** string

---

### GetProfil

**Kurzbeschreibung:**  
Gibt das Member m_Profil als JPP-String zurueck; prueft m_aw->IsValid(). _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### GetAW_Box

**Kurzbeschreibung:**  
Gibt das Member m_AW_Box als JPP-String zurueck; prueft m_aw->IsValid(). _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### GetStapelID

**Kurzbeschreibung:**  
Gibt m_aw->GetallgStapelID() als JPP-Long zurueck; prueft m_aw->IsValid(). _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool

---

### GetSqlStatement

**Kurzbeschreibung:**  
Gibt m_aw->AL_GETSQL() als JPP-String zurueck; prueft m_aw->IsValid(). _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### GetIdentSqlStatement

**Kurzbeschreibung:**  
Gibt m_aw->AL_GETIDSQL() als JPP-String zurueck; prueft m_aw->IsValid(). _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### GetWhere

**Kurzbeschreibung:**  
Extrahiert aus m_aw->GetLastSqlStatement() den Teil nach 'where' bis 'order by' und gibt ihn zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### ClickZeile

**Kurzbeschreibung:**  
Clickt eind gegebene Zeile an

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| zeile | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetParam

**Kurzbeschreibung:**  
Setzt einen Parameter

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Name | string | ja | `0` |
| Value | string | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RefreshOnReEntry

**Kurzbeschreibung:**  
Refresht die Auswahlliste beim Wiedereintritt

_Keine Parameter._

**Rückgabe:** bool

---

### RefreshPreContext

**Kurzbeschreibung:**  
Refresht die unter der aktuellen liegende Auswahlliste

_Keine Parameter._

**Rückgabe:** bool

---

### RefreshEvent

**Kurzbeschreibung:**  
Löst ein Refresh-Event aus, das in die Warteschlange gestellt wird

_Keine Parameter._

**Rückgabe:** bool

---

### GetTipText

**Kurzbeschreibung:**  
Gibt den Tiptext einer Spalte aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | long | ja | `0` |

**Rückgabe:** string

---

### GetHidden

**Kurzbeschreibung:**  
Gibt aus, ob das Feld hidden ist

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | long | ja | `0` |

**Rückgabe:** bool

---

### GetNoInfo

**Kurzbeschreibung:**  
Gibt aus, ob NOINFO aktiviert ist

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | long | ja | `0` |

**Rückgabe:** bool

---

### GetXml

**Kurzbeschreibung:**  
Gibt das Xml des Feldes aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| col | long | ja | `0` |

**Rückgabe:** string

---

### GetSqlStatementFromSqlText

**Kurzbeschreibung:**  
Gibt das SQL-Statement des übergebenen SQL-Textes zurück.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | ja | `0` |
| key | string | ja | `—` |
| sqltextName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetAnwCondCount

**Kurzbeschreibung:**  
Geht zur ersten Kondition

_Keine Parameter._

**Rückgabe:** long

---

### GetAnwCondId

**Kurzbeschreibung:**  
Gibt die ID der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondNummer

**Kurzbeschreibung:**  
Gibt die Nummer der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** long

---

### GetAnwCondLabel

**Kurzbeschreibung:**  
Gibt die Bezeichnung der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondVon

**Kurzbeschreibung:**  
Gibt den VON-Wert der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondBis

**Kurzbeschreibung:**  
Gibt den BIS-Wert der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondVonIdx

**Kurzbeschreibung:**  
Gibt den VON-Wert der Kondition aus. Parameter ist der Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondBisIdx

**Kurzbeschreibung:**  
Gibt den BIS-Wert der Kondition aus. Parameter ist der Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondVariable

**Kurzbeschreibung:**  
Gibt die Variable der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondFSCtrl

**Kurzbeschreibung:**  
Gibt das FS-Format der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondTyp

**Kurzbeschreibung:**  
Gibt den Typ der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** long

---

### GetAnwCondIB

**Kurzbeschreibung:**  
Gibt die Itembox der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondBesitzer

**Kurzbeschreibung:**  
Gibt den Besitzer der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** long

---

### GetAnwCondVonOriginal

**Kurzbeschreibung:**  
Gibt die VON-Vorbelegung der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondBisOriginal

**Kurzbeschreibung:**  
Gibt die BIS-Vorbelegung der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondDataForm

**Kurzbeschreibung:**  
Gibt ??? der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondExpr

**Kurzbeschreibung:**  
Gibt die Expression der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** string

---

### GetAnwCondHidden

**Kurzbeschreibung:**  
Gibt den Hidden-Wert der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** long

---

### GetAnwCondHiddenIdx

**Kurzbeschreibung:**  
Gibt den Hidden-Wert der Kondition aus. Parameter ist der Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** long

---

### GetAnwCondHiddenOrig

**Kurzbeschreibung:**  
Gibt den Vorbelegungswert von HIDDEN der Kondition aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** long

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
