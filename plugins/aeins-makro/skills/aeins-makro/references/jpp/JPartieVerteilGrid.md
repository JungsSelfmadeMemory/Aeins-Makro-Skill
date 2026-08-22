# Dokumentation: JPartieVerteilGrid

**Datei:** `a1aeins/PartieVerteilDlg.cpp`  
**Klasse:** `JPartieVerteilGrid`  
**Zweck:** PartieVerteilungsDlg  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

PartieVerteilungsDlg

---

## Methodenübersicht

### Init

**Kurzbeschreibung:**  
Grundeinrichtung des Grids ,Params: GridName = Basis für alle felder die im Grid vorhande sind

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GridName | string | ja | `—` |
| HideListe | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ToggleGrid

**Kurzbeschreibung:**  
Wechsel anzeie Status

_Keine Parameter._

**Rückgabe:** bool

---

### ShowGrid

**Kurzbeschreibung:**  
Zeigs

_Keine Parameter._

**Rückgabe:** bool

---

### HideGrid

**Kurzbeschreibung:**  
Zeigs nicht

_Keine Parameter._

**Rückgabe:** bool

---

### Clear

**Kurzbeschreibung:**  
Alles löschen

_Keine Parameter._

**Rückgabe:** bool

---

### ShowData

**Kurzbeschreibung:**  
Datenwerte anzeigen

_Keine Parameter._

**Rückgabe:** bool

---

### SetSvwareModus

**Kurzbeschreibung:**  
Spezielabehandlung für SVWARE einschalten

_Keine Parameter._

**Rückgabe:** bool

---

### SetAutoPreisUpdateMode

**Kurzbeschreibung:**  
Sollen Partiepreise an die Warenpositon automatisch weitergeiecht werden

_Keine Parameter._

**Rückgabe:** bool

---

### AfterPartieBehandlung

**Kurzbeschreibung:**  
Nachbehandlung wen Partievertelung verlassen wird

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ProcName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ZielNachDoNotEnter

**Kurzbeschreibung:**  
Name Zielfeld, wenn das Grid übergangen werden soll IN = Feldname

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FeldName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Proc_svware_next_field

**Kurzbeschreibung:**  
Im SvwareModus Behnlungsroutine zum Gehen zum nächtesn Feld

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ProcName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ZeileLoeschFunktion

**Kurzbeschreibung:**  
Controlstring, der bei ShiftCtrlEntf ausgelöst werden soll ( Zeilenlöschen) )  in= Funktion

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Funktion | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GridZeileLoeschen

**Kurzbeschreibung:**  
Lösche die zuletzt betretene Zeile

_Keine Parameter._

**Rückgabe:** bool

---

### NeuePartieAnlegen

**Kurzbeschreibung:**  
An der aktuellen Position eine Partie neu erfassen und eintragen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| DBPARM_BelegNummer | long | optional | `0` |
| DBPARM_AufrufTyp | long | optional | `Partie_DBPARM_AufrufTyp_undefiniert` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetVorgangInfos

**Kurzbeschreibung:**  
Setze Vorgangs Klasse und Unterklasse zur Parameterisierung Par: KLASSE und UKLASSE

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KLASSE | long | ja | `0` |
| UKLASSE | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GUI_Update

**Kurzbeschreibung:**  
GUI anchbehanlung, wenn sich was an der Verteilung ändert

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ProcName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GrosseZeilen

**Kurzbeschreibung:**  
Die zeilen im Gruid werde grösser dargestellt

_Keine Parameter._

**Rückgabe:** bool

---

### SetGoFieldProc

**Kurzbeschreibung:**  
Prüft IsInit(); liest erforderlichen String-Parameter "ProcName" und speichert ihn in m_GoFieldProc; gibt true zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ProcName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
