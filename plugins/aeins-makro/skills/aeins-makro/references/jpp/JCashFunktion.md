# Dokumentation: JCashFunktion

**Datei:** `a1aeins/JCashFunktion.cpp`  
**Klasse:** `JCashFunktion`  
**Zweck:** JPP-Objekt zur Berechtigung von Funktionen in SVPOSBAR2  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Objekt zur Berechtigung von Funktionen in SVPOSBAR2

---

## Methodenübersicht

### AddDialog

**Kurzbeschreibung:**  
Fügt einen Dialognamen zur Liste hinzu

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Dialog | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Init

**Kurzbeschreibung:**  
Initialisiert das JPP

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DarfFunktion

**Kurzbeschreibung:**  
Gibt an, ob eine Funktion aufgerufen werden darf

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | ja | `0` |
| Name | string | ja | `—` |
| ActiveDialogName | string | ja | `—` |
| ErfassungsStatus | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
