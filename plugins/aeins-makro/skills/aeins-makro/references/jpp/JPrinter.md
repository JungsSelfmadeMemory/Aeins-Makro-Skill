# Dokumentation: JPrinter

**Datei:** `a1aeins/ah_printer_jpp.cpp`  
**Klasse:** `JPrinter`  
**Zweck:** In Sachen der Druckerfreiheit  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

In Sachen der Druckerfreiheit

---

## Methodenübersicht

### Get

**Kurzbeschreibung:**  
Ermittelt den aufgeloesten A.eins-Standarddrucker des Bedieners per DruckerStamm/DruckerDefault-Select, setzt JVars name/namenr; gibt true wenn Druckername nicht leer. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| namenr | string | ja | `—` |
| nameneu | string | ja | `—` |
| Owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKoordinaten

**Kurzbeschreibung:**  
Oeffnet HDC, ermittelt Print::Koordinaten via Ermitteln, schreibt Koordinaten-JSON in JVars; setzt Status, gibt Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | optional | `0` |
| Device | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetDeviceFontInfo

**Kurzbeschreibung:**  
Oeffnet HDC per CreateDC, prueft Font via CWinFont SetFont/SelectFont, schreibt Fontinfo-JSON in JVars; setzt Status, gibt Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | optional | `0` |
| Device | string | ja | `*` |
| FontName | string | ja | `—` |
| Attr_Number | long | ja | `ATTR_NORMAL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetStandardDrucker

**Kurzbeschreibung:**  
Setzt JVar Device via COM::System->GetStandardDrucker() und gibt true zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WindowstestDruck

**Kurzbeschreibung:**  
Ermittelt Device per DruckerStamm-Select, oeffnet HDC, druckt Testseite (StartDoc/StartPage, MaleRechteck, EndPage/EndDoc); setzt Status. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | optional | `0` |
| Druckernummer | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetDeviceMode

**Kurzbeschreibung:**  
Holt DEVMODE via PreparePrinterDevMod, ermittelt Print::DevMode, schreibt DevMode-JSON in JVars; setzt Status, gibt Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | optional | `0` |
| Device | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
