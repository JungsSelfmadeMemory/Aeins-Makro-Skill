# Dokumentation: JDBase

**Datei:** `a1aeins/ah_jdbase.cpp`  
**Klasse:** `JDBase`  
**Zweck:** Datenbankkapriolen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Datenbankkapriolen

---

## Methodenübersicht

### CopyRow

**Kurzbeschreibung:**  
Liest JPP-Parameter table/source/target/deep/owner und delegiert an ahDB::CopyRow(); gibt deren bool-Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| table | string | ja | `—` |
| source | string | ja | `—` |
| target | string | ja | `—` |
| deep | bool | optional | `FALSE` |
| owner | long | optional | `-1` |

**Rückgabe:** bool

---

### MakeXML

**Kurzbeschreibung:**  
Erzeugt per MSXML DOMDocument30 ein XML (Root AH_JDBase mit Programm/User/DB/App), befuellt es via GetPage() aus source/where (optional deep), speichert nach Temp-Datei (target$ in JVars/Maskenfeld), zeigt sie optional mit ShellExecute; liefert Speicher-Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| source | string | ja | `—` |
| deep | bool | optional | `FALSE` |
| jvars | bool | optional | `FALSE` |
| where | string | optional | `—` |
| target$ | string | ja | `—` |
| app | string | optional | `—` |
| occ | long | optional | `1` |
| create | bool | optional | `TRUE` |
| owner | long | optional | `0` |
| show | bool | optional | `FALSE` |
| delete | bool | optional | `FALSE` |
| colNamen | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetXML

**Kurzbeschreibung:**  
Laedt die XML-Datei (Param xml) via MSXML, iteriert table/row/value-Knoten und baut je Zeile ein insert-SQL (Werte ueber COM::Tools->String2DB/ConcatIt); Text/Bitmap/Line-Zweige sind auskommentiert; gibt true zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| xml | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartOneSqlTextLine

**Kurzbeschreibung:**  
Vorbereitung für 'InsertOneSqlTextLine'

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| besitzer | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetOneSqlTextLine

**Kurzbeschreibung:**  
Setzt eine SqlText, um ihn über 'InsertOneSqlTextLine' einzufügen.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| sqltext | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### InsertOneSqlTextLine

**Kurzbeschreibung:**  
Fügt den SqlText ein, welcher über 'SetOneSqlTextLine' gesetzt wurde.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| sqltext | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CopySqlText

**Kurzbeschreibung:**  
Kopiert einen SQL-Text

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name_quelle | string | ja | `—` |
| name_ziel | string | optional | `—` |
| ueberschreiben | bool | optional | `true` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
