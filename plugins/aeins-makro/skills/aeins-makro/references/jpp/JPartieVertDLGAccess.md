# Dokumentation: JPartieVertDLGAccess

**Datei:** `a1aeins/PartieVerteilDlg.cpp`  
**Klasse:** `JPartieVertDLGAccess`  
**Zweck:** JPP-Zugriffsklasse auf den aktiven Kontext CPartieVerteilDlg (PARTIEVERTEILDLG); stellt Methoden zum Abfragen von Werten (GetValue) und zum Hinzufuegen/Modifizieren von Partieeintraegen (SetzePartie) der Partieverteilung bereit. _(ergänzt)_  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Zugriffsklasse auf den aktiven Kontext CPartieVerteilDlg (PARTIEVERTEILDLG); stellt Methoden zum Abfragen von Werten (GetValue) und zum Hinzufuegen/Modifizieren von Partieeintraegen (SetzePartie) der Partieverteilung bereit. _(ergänzt)_

---

## Methodenübersicht

### GetValue

**Kurzbeschreibung:**  
Werte abfragen, param: FUNC, VARNAME = Name der Zielvariablen, manchmal PARAM

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FUNC | string | ja | `—` |
| VARNAME | string | ja | `—` |
| POS | long | ja | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetzePartie

**Kurzbeschreibung:**  
Eine Partieeintrag hinzufügen oder Modifizieren, Parameter: AN_POSITION,PARTIENUMMER oder (PARTIEID, PARTIEARTIPOSIT),MENGE

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| AN_POSITION | long | ja | `1` |
| PARTIENUMMER | long | optional | `0` |
| PARTIEID | long | optional | `0` |
| PARTIEARTIPOSIT | long | optional | `0` |
| MENGE | real | ja | `RC_0` |
| LAGERPLATZNUMMER | long | optional | `-9999` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
