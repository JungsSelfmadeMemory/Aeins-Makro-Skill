# Dokumentation: JDom

**Datei:** `a1aeins/JDom.cpp`  
**Klasse:** `JDom`  
**Zweck:** DOM Unterstützung  für JPP  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

DOM Unterstützung  für JPP

---

## Methodenübersicht

### CreateRoot

**Kurzbeschreibung:**  
Anlegen der Root des Doms, DP = Rootname

_Keine Parameter._

**Rückgabe:** bool

---

### Save

**Kurzbeschreibung:**  
Sichern in eine Datei, DP = Path und Filename

_Keine Parameter._

**Rückgabe:** bool

---

### CreateElement

**Kurzbeschreibung:**  
Erzeuge ein neus Element. DP Name, Bezeichnung

_Keine Parameter._

**Rückgabe:** bool

---

### AppendChild

**Kurzbeschreibung:**  
Ein Element als Kind  einenm andereen Element zufüge. DP: Ziel,Quelle

_Keine Parameter._

**Rückgabe:** bool

---

### SetAttribute

**Kurzbeschreibung:**  
Attribut setzen. DP: Elementname, AttributName, Wert des Attributs

_Keine Parameter._

**Rückgabe:** bool

---

### SetText

**Kurzbeschreibung:**  
Text setzen. DP: Elementname,Text

_Keine Parameter._

**Rückgabe:** bool

---

### CreateComment

**Kurzbeschreibung:**  
Fügt vor dem ersten Element eine Kommentar ein.

_Keine Parameter._

**Rückgabe:** bool

---

### GetAttribute

**Kurzbeschreibung:**  
Attribut setzen. DP: Elementname, AttributName, Into-Variable

_Keine Parameter._

**Rückgabe:** bool

---

### GetText

**Kurzbeschreibung:**  
Text setzen. DP: Elementname, Into-Variable

_Keine Parameter._

**Rückgabe:** bool

---

### Load

**Kurzbeschreibung:**  
Laden aus einder Datei, DP = Path und Filename

_Keine Parameter._

**Rückgabe:** bool

---

### SelectNodes

**Kurzbeschreibung:**  
KnotenListe aufbauen, DP = Nodeliste,Element,Suchpattern

_Keine Parameter._

**Rückgabe:** bool

---

### NextElement

**Kurzbeschreibung:**  
Hole nächtes Element aus Knotenliste, DP = Nodeliste,Element

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
