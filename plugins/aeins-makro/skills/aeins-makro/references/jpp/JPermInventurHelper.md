# Dokumentation: JPermInventurHelper

**Datei:** `a1aeins/JPermInventurHelper.cpp`  
**Klasse:** `JPermInventurHelper`  
**Zweck:** Stellt Methoden zur Permanenten Inventur bereit  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Stellt Methoden zur Permanenten Inventur bereit

---

## Methodenübersicht

### ZaehlSummen

**Kurzbeschreibung:**  
Kumuliert 5050er Zählungen zu 5051er Zählsummen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FROMDATE | string | ja | `—` |
| TODATE | string | ja | `—` |
| LAGER | long | optional | `0` |
| ARTIKELID | long | optional | `0` |
| USELAGER | bool | ja | `0` |
| USEARTIKEL | bool | ja | `0` |
| GROUP | long | ja | `15` |
| ALLOWNULLS | bool | optional | `1` |
| UPDATEFIELD | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Wertstellung

**Kurzbeschreibung:**  
Erzeugt aus 5051er 5052er Belege mit Wertstellung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PERIODE | long | ja | `1` |
| JAHR | long | ja | `1901` |
| LAGER | long | optional | `0` |
| ARTIKELID | long | optional | `0` |
| USELAGER | bool | ja | `0` |
| USEARTIKEL | bool | ja | `0` |
| GROUP | long | ja | `15` |
| ALLOWNULLS | bool | optional | `1` |
| UPDATEFIELD | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### InitBestandIstNull

**Kurzbeschreibung:**  
Initiiert einen Nullsetz-Differenzbeleg

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GROUP | long | ja | `15` |
| LAGERNUMMER | long | ja | `0` |
| DATUM | string | ja | `01.01.1901` |
| MITLAGERPLATZ | bool | optional | `FALSE` |
| MITPARTIE | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetBestandIstNull

**Kurzbeschreibung:**  
Setzt die Werte für eine Nullsetz-Zeile

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ARTIKELID | long | ja | `0` |
| LAGERPLATZNUMMER | long | optional | `0` |
| PARTIEID | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EndeBestandIstNull

**Kurzbeschreibung:**  
Beendet einen evtl noch offenen Vorgang

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
