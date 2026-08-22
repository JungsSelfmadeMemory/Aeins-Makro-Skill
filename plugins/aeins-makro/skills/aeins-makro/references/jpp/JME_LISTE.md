# Dokumentation: JME_LISTE

**Datei:** `a1aeins/ME_Liste.CPP`  
**Klasse:** `JME_LISTE`  
**Zweck:** Gebindebehandlung für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Gebindebehandlung für JPL

---

## Methodenübersicht

### MaskeAnzeigen

**Kurzbeschreibung:**  
Gebindemaske mit allen gesetzte Parameter anzeigen, abfragen, und ergebniswerte bunkern

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CreateGebindeDesigner

**Kurzbeschreibung:**  
Erzeugen einer Instance für das Maskenlayout

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| AnzText | string | optional | `—` |
| Anzahl | string | optional | `—` |
| GebText1 | string | optional | `—` |
| Geb1 | string | optional | `—` |
| GebText2 | string | optional | `—` |
| Geb2 | string | optional | `—` |
| Ergebnis1 | string | optional | `—` |
| GebText3 | string | optional | `—` |
| Geb3 | string | optional | `—` |
| Ergebnis2 | string | optional | `—` |
| GebText4 | string | optional | `—` |
| Geb4 | string | optional | `—` |
| Ergebnis3 | string | optional | `—` |
| Lietext | string | optional | `—` |
| Menge | string | optional | `—` |
| Operator0 | string | optional | `—` |
| Operator1 | string | optional | `—` |
| Operator2 | string | optional | `—` |
| Operator3 | string | optional | `—` |
| Operator4 | string | optional | `—` |
| MengeNeverDeactiv | long | optional | `0` |
| AnzahlAlwaysVisible | long | optional | `1` |
| AllFieldsHiddenKeinGebinde | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteGebindeDesigner

**Kurzbeschreibung:**  
Löschen einer Instance für das Maskenlayout

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RefreshFieldPosition

**Kurzbeschreibung:**  
Refreshen des Maskenlayouts

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SetLabelText | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RefreshFieldValues

**Kurzbeschreibung:**  
Anzeigen der Werte in den entsprechenden Feldern

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetMeNummer

**Kurzbeschreibung:**  
Setzen der Mengeneinheit für den Designer

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NewInit | long | optional | `0` |

**Rückgabe:** long

---

### ValidField

**Kurzbeschreibung:**  
Validieren eines Feldes

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FIELD | string | ja | `—` |
| SETMODIFYBIT | long | optional | `1` |
| RefreshByChanges | long | optional | `1` |

**Rückgabe:** long

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
