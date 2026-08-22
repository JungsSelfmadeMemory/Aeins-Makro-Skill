# Dokumentation: JBinary

**Datei:** `a1aeins/ah_jbinary.cpp`  
**Klasse:** `JBinary`  
**Zweck:** Binary-Unterstützung für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Binary-Unterstützung für JPL

---

## Methodenübersicht

### ToTable

**Kurzbeschreibung:**  
Liest die Datei (file) aus dem Dateisystem und schreibt sie via b.ToTable() per SQL als BLOB-Spalte (blob) in die DB; optional mit Datecol, Loeschen und Binaer-Flag. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| sql | string | ja | `—` |
| file | string | ja | `—` |
| datecol | string | optional | `—` |
| blob | string | optional | `JBINARY` |
| del | bool | optional | `FALSE` |
| isBinary | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ToFile

**Kurzbeschreibung:**  
Schreibt einen DB-BLOB (col) per b.ToFile() in eine Datei; optional file_jvar-Aufloesung; bei image_select schreibt Bilder via ImagesToPath und patcht IMG/BASE-Tags in HTML per RegExp. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| sql | string | ja | `—` |
| file | string | ja | `—` |
| file_jvar | long | optional | `-1` |
| col | string | ja | `—` |
| datecol | string | optional | `—` |
| create | bool | optional | `FALSE` |
| image_select | string | optional | `—` |
| patch | bool | optional | `TRUE` |
| overwrite | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ToTempFile

**Kurzbeschreibung:**  
Erzeugt eindeutigen Temp-Dateinamen, holt den BLOB (col) per b.ToTempFile() und ermittelt ggf. die Endung aus der Mime-Spalte; liefert den Namen via JPP_RETURNS zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| sql | string | ja | `—` |
| col | string | ja | `—` |
| prefix | string | optional | `a1t_` |
| ext | string | optional | `.txt` |
| mime | string | optional | `—` |
| use_guid | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
