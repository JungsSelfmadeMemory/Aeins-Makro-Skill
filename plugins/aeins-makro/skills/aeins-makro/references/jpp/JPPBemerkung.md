# Dokumentation: JPPBemerkung

**Datei:** `a1aeins/BEMERK.CPP`  
**Klasse:** `JPPBemerkung`  
**Zweck:** Methoden zum lesen und schreiben von Bemerkungstexten  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Methoden zum lesen und schreiben von Bemerkungstexten

---

## Methodenübersicht

### Read

**Kurzbeschreibung:**  
Lesen der Bemerkungstexte.                    Parameter: BemerkId , BemerkTextFeld(wird gefüllt)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BemerkId | long | ja | `0` |
| BemerkTextFeld | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Write

**Kurzbeschreibung:**  
schreibt die BemerkungsStamm.                 Parameter: BemerkIdFeld (wird gefüllt), BemerkTyp (siehe Forma),BemerkFremdSchl(opt),Bemerkbezeich(opt)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BemerkTextFeld | string | ja | `—` |
| BemerkIdFeld | string | ja | `—` |
| BemerkTyp | long | ja | `0` |
| BemerkFremdSchl | long | optional | `glb->BedienerId()` |
| BemerkNummer | long | optional | `0` |
| BemerkBezeich | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Delete

**Kurzbeschreibung:**  
Löscht die Bemerkungstexte aus der Datenbank. Parameter: BemerkId

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BemerkId | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetUpdateAlleZeilen

**Kurzbeschreibung:**  
Setzt das Flag, ob alle Zeilen geupdatet werden sollen, auch wenn Sie sich nicht geändert haben.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| UpdateAlleZeilen | bool | ja | `false` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
