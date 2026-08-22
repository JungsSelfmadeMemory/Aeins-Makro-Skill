# Dokumentation: JPartienNachtragen

**Datei:** `a1aeins/PartieVerteilDlg.cpp`  
**Klasse:** `JPartienNachtragen`  
**Zweck:** Sammelt WABEWID-/V_ID-Belege (Einzel-Id, ganzer Vorgang oder via CHelper aus markierter Auswahlliste), bestimmt/lockt die zugehoerigen Vorgaenge und startet ueber StartDialog das nachtraegliche Verteilen von Partien. _(ergänzt)_  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Sammelt WABEWID-/V_ID-Belege (Einzel-Id, ganzer Vorgang oder via CHelper aus markierter Auswahlliste), bestimmt/lockt die zugehoerigen Vorgaenge und startet ueber StartDialog das nachtraegliche Verteilen von Partien. _(ergänzt)_

---

## Methodenübersicht

### AddWabewId

**Kurzbeschreibung:**  
Hinzufügen einer Warenbewegungszeile: PAR = WABEWID

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| WABEWID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddV_Id

**Kurzbeschreibung:**  
Hinzufügen aller WabewIds zu einem Vorgang: PAR = V_ID

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| V_ID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddFromAWLIST

**Kurzbeschreibung:**  
Auswahlliste übernehmen.Erkenn, ob V_ID oder WABEWID drin ist

_Keine Parameter._

**Rückgabe:** bool

---

### StartDialog

**Kurzbeschreibung:**  
Und Los geht es, nachdem man ids addiert hat natürlich !

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
