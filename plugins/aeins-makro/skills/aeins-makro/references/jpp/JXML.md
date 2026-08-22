# Dokumentation: JXML

**Datei:** `a1aeins/ah_jxml.cpp`  
**Klasse:** `JXML`  
**Zweck:** JPP-Wrapper zum schrittweisen Aufbau eines EANCOM-XML-Dokuments (MSXML2-DOM) und dessen Anzeige/Speichern als Datei. _(ergänzt)_  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Wrapper zum schrittweisen Aufbau eines EANCOM-XML-Dokuments (MSXML2-DOM) und dessen Anzeige/Speichern als Datei. _(ergänzt)_

---

## Methodenübersicht

### Add

**Kurzbeschreibung:**  
Legt bei Bedarf ein MSXML2-DOMDocument30 mit Wurzel 'EANCOM' an (Version/Programm/User/App-Attribute), erzeugt ein Kindelement aus 'elem', setzt per Split/GetKeyValue zerlegte Attribute, schreibt als Text 'value' bzw. JVARS::GET(owner,wert) und haengt es an die Wurzel. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| elem | string | ja | `—` |
| attrib | string | optional | `—` |
| value | string | ja | `—` |
| owner | long | optional | `0` |
| jvar | bool | optional | `FALSE` |
| node | string | optional | `—` |
| app | string | optional | `elem` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Show

**Kurzbeschreibung:**  
Speichert das aufgebaute XML-Dokument via m_xml_doc->save in 'datei' (sonst eindeutige Temp-XML ueber GetTempPath/ReserveUniqueFilename), oeffnet es mit ShellExecute 'open' und loescht die Datei bei Erfolg, falls 'del' gesetzt; liefert Erfolg des Speicherns. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| datei | string | optional | `—` |
| del | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
