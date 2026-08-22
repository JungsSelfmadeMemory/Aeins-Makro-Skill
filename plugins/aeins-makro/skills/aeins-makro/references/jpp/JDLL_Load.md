# Dokumentation: JDLL_Load

**Datei:** `a1aeins/ah_jdll_load.cpp`  
**Klasse:** `JDLL_Load`  
**Zweck:** DLL-Load für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

DLL-Load für JPL

---

## Methodenübersicht

### Load

**Kurzbeschreibung:**  
Erzeugt DLL_Load-Objekt und ruft dessen Load(dllname) auf; bei Fehler Statustext in Maskenfeld; gibt Erfolg zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| dllname | string | ja | `—` |
| Status | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Connect

**Kurzbeschreibung:**  
Ruft DLL_Load->Connect(fncname) für FARPROC auf; bei NULL/Fehler Statustext in Maskenfeld; gibt true bei gefundener Funktion zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fncname | string | ja | `—` |
| Status | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Unload

**Kurzbeschreibung:**  
Ruft DLL_Load->Unload() auf, löscht das Objekt; gibt true zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Execute

**Kurzbeschreibung:**  
Ruft DLL_Load->Execute(fncname, signatur, Owner) auf; gibt Erfolg zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fncname | string | ja | `—` |
| signatur | string | ja | `—` |
| Owner | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
