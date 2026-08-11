# Feld-ID-Katalog: Tabelle `FormPosition` (DSN `DEMO_FOOD`)

> Beantwortet die offene Frage **F3** („Wo ist der Feld-ID-Katalog?"). Die numerischen IDs
> für `GetValue`/`SetValue` (Vorgangskopf) und `GetValPos`/`SetValPos` (Artikelposition)
> stammen **alle** aus dieser einen Tabelle. 2383 Einträge.
>
> Vollexport: [`FormPosition_DEMO_FOOD.csv`](FormPosition_DEMO_FOOD.csv)

---

## 1. Die relevanten Spalten

| Spalte | Bedeutung | Nutzung im Makro |
|---|---|---|
| `FormPosNummer` | **die ID**, die an Get/Set übergeben wird | `SetValue(iVorg, 1001, sBuf, 0)` |
| `FormPosGatterDefine` | **Konstantenname** – so im `CONST`-Block deklarieren | `ID_MENGE = 1001;` |
| `FormPosBezeich` | Klartext-Bezeichnung des Feldes | Doku/Orientierung |
| `FormPosCSharpTyp` | **echter Datentyp**: `int` / `short` / `double` / `string` / `DateTime` | steuert Konvertierung (s. u.) |
| `FormPosLenMax` | maximale Feld-/Pufferlänge | Puffer mit `ALLOC(>= LenMax)` |
| `FormPosNachkDef` | Nachkommastellen (nur `double`) | Format `%.<Nachk>f` |
| `FormPosMatch` | interner Match-/Feldname | Referenz |
| `formposhilfe` | Hilfetext (oft leer) | Doku |
| `FormPosTyp`, `FormPosSourceTyp` | interne Steuer-/Herkunftscodes | **nicht** eindeutig Kopf vs. Position – zur Typbestimmung `FormPosCSharpTyp` nutzen |

**Wichtig:** Kopf- und Positionsfelder liegen in **derselben** Tabelle. Ob ein Feld ein
Kopffeld (→ `Get/SetValue`) oder ein Positionsfeld (→ `Get/SetValPos`) ist, ergibt sich aus
der Bezeichnung/dem Kontext (z. B. `ID_V_*` = Vorgangskopf, `ID_WABEW*`/`ID_ME_*`/`ID_PREIS`/
`ID_MENGE` = Warenposition), nicht aus einer eigenen Spalte.

Nützlicher Lookup:
```sql
SELECT FormPosNummer, FormPosBezeich, FormPosGatterDefine,
       FormPosCSharpTyp, FormPosLenMax, FormPosNachkDef
  FROM FormPosition
 WHERE FormPosBezeich LIKE '%Liefer%'      -- oder: FormPosGatterDefine LIKE 'ID_V_%'
 ORDER BY FormPosNummer;
```

---

## 2. Datentyp → Konvertierung im Makro

Alle Get/Set-Aufrufe arbeiten mit **String-Puffern**. `FormPosCSharpTyp` sagt, wie man
den Puffer parst (lesen) bzw. formatiert (schreiben):

| CSharpTyp | Lesen (nach `GetValue`/`GetValPos`) | Schreiben (vor `SetValue`/`SetValPos`) |
|---|---|---|
| `int`, `short` | `iX := STRTOINT(sBuf)` | `SPRINTF(sBuf, "%d", iX)` |
| `double` | `rX := STRTOREAL(sBuf)` | `SPRINTF(sBuf, "%.*f", Nachk, rX)` — z. B. `%.2f` bei Preis/Menge |
| `DateTime` | `dX := STRTODATE(sBuf)` | Datumstext gemäß `LenMax=10` (Installations-Datumsformat) |
| `string` | direkt aus `sBuf` (max. `LenMax` Zeichen) | direkt in `sBuf` |

> Beim JPP-`CVorgangsHelper` (Anlegen, siehe `KM_AuftraegeGenerieren.pas`) werden ArtikelId
> und Menge dagegen direkt per `JPPINI(hdl, "Menge", iWert)` gesetzt. Get/Set mit Feld-IDs ist
> der Weg, wenn man **im Erfassungskontext** eines bestehenden Vorgangs/einer Position liest
> oder schreibt.

---

## 3. Wichtige Kopffelder (Vorgang) — `Get/SetValue`

| ID | Konstante | Typ | Bezeichnung |
|---|---|---|---|
| 100 | `ID_V_KLASSNUMMER` | int | Klassennummer (100=Angebot, 400=Auftrag …) |
| 101 | `ID_V_UKLASSNUMMER` | short | Unterklassennummer |
| 102 | `ID_KUNDIDZUORD` | int | Kunden-ID zum Vorgang |
| 103 | `ID_V_DATUM` | DateTime | Vorgangsdatum |
| 104 | `ID_V_NUMMER` | string | Vorgangsnummer |
| 105 | `ID_V_NUMNUMMER` | int | Nummer aus dem Nummernkreis |
| 109 | `ID_V_ID` | int | Vorgangs-ID |
| 1230 | `ID_V_DATUM_2` | DateTime | Datum Auftrag |
| 1234 | `ID_V_NUMMER_2` | string | Nummer Auftrag |
| 1272 | `ID_V_DATUM_PLAN` | DateTime | Datum geplante Lieferung |
| 1335 | `ID_V_DATUM_PREISE` | DateTime | Preisermittlungs-Datum |
| 1771 | `ID_V_BEMTEXT1` | string(40) | Bemerkungstext 1 |
| 1917 | `ID_V_LIEFDATUMVON` | DateTime | Lieferdatum von |
| 1918 | `ID_V_LIEFDATUMBIS` | DateTime | Lieferdatum bis |
| 469 | `ID_SV_INTERFACE` | int | Vorgang in interner Bearbeitung: **0 = User-Interface, 1 = intern** (Makro/Import/Mandantenserver) — vor `MessageBox` prüfen! |

*(vollständige Liste `ID_V_*` im CSV)*

---

## 4. Wichtige Positionsfelder (Warenposition) — `Get/SetValPos`

| ID | Konstante | Typ | Nachk. | Bezeichnung |
|---|---|---|---|---|
| 1000 | `ID_PREIS` | double | 2 | Preis |
| 1001 | `ID_MENGE` | double | 2 | Menge |
| 1002 | `ID_ARTIKELID` | int | 0 | Artikel-ID |
| 1015 | `ID_ME_GRUPNUMMER` | int | 0 | Mengeneinheits-Gruppennummer |
| 1077 | `ID_ME_NUMMERPREIS` | int | 0 | Preismengeneinheits-Nummer |
| 1078 | `ID_PREISEINHEIT` | double | 0 | Preiseinheit |
| 1108 | `ID_ME_NUMMER` | int | 0 | Mengeneinheits-Nummer |
| 1137 | `ID_ME_TEXT` | string(20) | 0 | Mengeneinheits-Kurztext |
| 1143 | `ID_WABEWID` | int | 0 | interne ID Warenbewegung |
| 1358 | `ID_ZUSATZINFO2` | string(40) | 0 | Zusatzinfo 2 Warenposition |
| 1437 | `ID_WABEWTYP` | short | 0 | Warenbewegungstyp |
| 1439 | `ID_WABEWPLANDAT` | DateTime | 0 | geplantes Lieferdatum (Position) |
| 7100 | `ID_GUID` | string | 0 | GUID — `GetValue`→`V_GUID` (Kopf), `GetValPos`→`WaBew_GUID` (Position) |

*(alle `ID_WABEW*` / `ID_ME_*` im CSV)*

> **Stabile Referenz:** ID **7100** (`ID_GUID`) ist die dauerhaft eindeutige Referenz — im
> Kopf-Kontext (`GetValue`) die `V_GUID`, im Positions-Kontext (`GetValPos`) die
> `WaBew_GUID`. `V_ID`/`WaBewId` ändern sich beim Bearbeiten (siehe Vorgang-Versionierung).

> **Addon-Felder:** ID **425** (`ID_WARENBEWEGUNG_ADDON`, string) ist die **Basis-ID** für die
> Zusatzfelder der Tabelle `WarenBewegungAddon`. Nicht direkt, sondern per **`…ByName`** mit
> Spaltenname setzen/lesen:
> `SetValPosByName(iWaPos, 425, sWert, "<Spaltenname>")` /
> `GetValPosByName(iWaPos, 425, sWert, "<Spaltenname>")`. Kopf-Analogon: `Set/GetValueByName`
> auf `VorgangAddon`.

---

## 5. Beispiel

```pascal
CONST
   ID_MENGE       = 1001;   // double, 2 Nachkommastellen
   ID_WABEWPLANDAT = 1439;  // DateTime
VAR
   sBuf : STRING;
   rMenge : REAL;
BEGIN
   sBuf := ALLOC(64);

   // Positionsmenge lesen (double):
   GetValPos(iWaPos, ID_MENGE, sBuf, 0);
   rMenge := STRTOREAL(sBuf);

   // Plan-Lieferdatum in Position schreiben (DateTime):
   SetValPos(iWaPos, ID_WABEWPLANDAT, sDatum, 0);

   FREE(sBuf);
END.
```
