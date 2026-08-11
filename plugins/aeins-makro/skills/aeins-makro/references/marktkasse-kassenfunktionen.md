# Marktkasse – `^jpl Kassen_Funktion`-Referenz

> Spezielle ControlStrings des Moduls **Marktkasse** (touchbedienbare Einzelhandelskasse).
> Aufruf im Makro: `CtrlString("^jpl Kassen_Funktion('<CODE>','<PARAM>')")`.
>
> Quelle/Katalog in der DB (Stand DEMO_FOOD, 79 Aktionen):
> ```sql
> SELECT AISPTipText, aispaktion
>   FROM MusterAmicInfoSysPosition
>  WHERE aispfeldtyp = 3
>    AND aispaktion LIKE '%jpl Kassen_funktion%';
> ```
> `AISPTipText` = Beschreibung, `aispaktion` = fertiger Aufruf. Vollexport:
> [`KassenFunktion_DEMO_FOOD.csv`](KassenFunktion_DEMO_FOOD.csv).

---

## Zifferneingabe / Tastatur
| Code | Param | Beschreibung |
|---|---|---|
| `ZIFFER` | `0`…`9` | Ziffer 0–9 |
| `ZIFFER` | `,` | Komma |
| `ZIFFER` | `-` | negatives Vorzeichen |
| `CLEAR` | | Eingabe löschen |
| `ENTER` | | alle Eingaben übernehmen |
| `ENTER` | `0` | Enter |

## Position bearbeiten
| Code | Param | Beschreibung |
|---|---|---|
| `ARTIKEL` | | Artikel eingeben |
| `MENGE` | | Menge eingeben |
| `MENGE` | `1` | Menge um eins erhöhen |
| `MENGE_AENDERN` | | Menge der aktuellen Warenposition ändern |
| `PREIS_AENDERN` | | Preis der aktuellen Warenposition ändern |
| `BETRAG_AENDERN` | | Betrag der aktuellen Warenposition ändern |
| `KORR_ARTIKELTEXT` | | Artikeltext der aktuellen Warenposition ändern |
| `POSNOCHMAL` | | letzte Position wiederholen |
| `POSCHANGEMENGE` | `1.00` | letzte Menge + 1 |
| `TOGGLE_WERTARTIKEL` | | Wertartikel umschalten |

## Zahlung
| Code | Param | Beschreibung |
|---|---|---|
| `ZAHLUNG` | | Zahlung einleiten / Zahlungsmaske öffnen |
| `ZHLG` | `MARKTKS` | Aufruf Zahlungsmaske [ZHLG] |
| `ZHL_BAR` | | Barzahlung |
| `ZHL_BAR` | `10`/`20`/`50` | Barzahlung mit vorgegebener Stückelung |
| `ZHL_EC` | | EC |
| `ZHL_EC` | `1` | EC-Zahlung ohne Bezahlterminal |
| `ZHL_EC_PLUS` | | EC-Auszahlung |
| `ZHL_EC_LAST` | | EC-Lastschrift |
| `EC_KARTE` | | mit EC-Karte bezahlen |
| `ZHL_GUTSCHEIN` | | Gutscheinzahlung |
| `ZHL_FREMDWAEHRBAR` | | Fremdwährungs-Barzahlung |
| `ZHL_FREMDWAEHRBAR` | `79` | Fremdwährung (norwegische Kronen) |
| `ZHL_STO` | | Storno Zahlungsweg |
| `ZHL_STO_ALL` | | alle Zahlungen stornieren / Zahlungsvorgang abbrechen |

## Rabatt / Skonto
| Code | Param | Beschreibung |
|---|---|---|
| `RABATT_PROZENT` | | prozentualer Zeilenrabatt |
| `RABATT_PROZENT` | `3,5` | fester Prozentsatz (z. B. 3,5 %) |
| `RABATT_BETRAG` | | Zeilenrabatt als Betrag |
| `GRABATT_PROZENT` | | prozentualer Gesamtrabatt |
| `GRABATT_BETRAG` | | Gesamtrabatt als fester Betrag |
| `SKONTOSATZ` | | Skontosatz eingeben |

## Beleg / Vorgang
| Code | Param | Beschreibung |
|---|---|---|
| `BELEG_ABBRUCH` | | aktuellen Beleg abbrechen |
| `PARKEN` | | Beleg parken bzw. geparkten Beleg aufnehmen |
| `BON` | | Bon des zuletzt abgeschlossenen Belegs drucken |
| `NEUVORGANG` | | neuen Vorgang anlegen |
| `SPEICHERN_ALS` | | Kunde/Vorgangklasse/Unterklasse ändern und speichern |
| `BRUTTO_NETTO` | | Brutto-/Nettobeleg umschalten |
| `PREISMANUELL` | | Preiserfassung umschalten |
| `ENDE_ZUM_MENU` | | Kasse beenden, zurück zum Hauptmenü |

## Dialog / Navigation
| Code | Param | Beschreibung |
|---|---|---|
| `END_DIALOG` | | Angaben übernehmen (Dialog OK) |
| `ABORT_DIALOG` | | Dialog beenden / Abbruch (ESC) |
| `ABORT_DIALOG` | `1` | Leergut verwerfen |
| `DIALOG` | `LEERGUT` | Leergut zuordnen |
| `MOVE_FIRST` | | zum ersten Datensatz |
| `MOVE_LAST` | | zum letzten Datensatz |
| `SELECT_PAGE_NEXT` | | nächste Seite der Auswahl |
| `SELECT_PAGE_BACK` | | vorherige Seite der Auswahl |

## Sonstiges / System
| Code | Param | Beschreibung |
|---|---|---|
| `LADE_OEFFNEN` | | Schublade öffnen |
| `SPERRE` | | Kasse sperren (Entsperrung nur mit Kennwort) |
| `WIEGUNG` | | Wiegung einleiten (danach Artikel erfassen) |
| `LAGER` | | Lager |
| `LAGERABGABE` | | Lagerabgabe |
| `LAGERABGABE_AENDERN` | | Lagerabgabe ändern |
| `EINRICHTUNG` | | Einrichtung überprüfen |

---

> Hinweis: Codes/Beschreibungen stammen aus `MusterAmicInfoSysPosition` (DEMO_FOOD). Je nach
> Installation/Version kann der Satz abweichen – im Zweifel obiges `SELECT` in der Ziel-DB
> ausführen. Zweiter Parameter (`PARAM`) ist meist leer; wo gesetzt, parametrisiert er die
> Aktion (Stückelung, Prozentsatz, Fremdwährungscode, Dialogname …).
