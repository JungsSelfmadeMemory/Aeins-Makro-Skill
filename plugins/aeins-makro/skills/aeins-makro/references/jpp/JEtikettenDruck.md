# Dokumentation: JEtikettenDruck

**Datei:** `a1aeins/lila.cpp`  
**Klasse:** `JEtikettenDruck`  
**Zweck:** JPP-Wrapper für AMIC-Etiekttendruck (aka LILA)  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Wrapper für AMIC-Etiekttendruck (aka LILA)

---

## Methodenübersicht

### Version

**Kurzbeschreibung:**  
Liefert die aktuelle Version. Optionale Parameter

_Keine Parameter._

**Rückgabe:** bool

---

### Editieren

**Kurzbeschreibung:**  
Ruft den Designer auf.

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| LiLaID | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Drucken

**Kurzbeschreibung:**  
Ruft den Druck wie unter Lila definiert auf. Parameter Ask (TRUE/FALSE)

_Keine Parameter._

**Rückgabe:** bool

---

### Archivieren

**Kurzbeschreibung:**  
Archivieren des Reports ohne vorheriges drucken

_Keine Parameter._

**Rückgabe:** bool

---

### Vorschau

**Kurzbeschreibung:**  
Ruft direkt die Vorschau auf.

_Keine Parameter._

**Rückgabe:** bool

---

### Exportieren

**Kurzbeschreibung:**  
Exportiert die Daten in eine Datei. Parameter ExportArt(HTML, PDF, DMP, RTF, JPG)

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| Format | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
