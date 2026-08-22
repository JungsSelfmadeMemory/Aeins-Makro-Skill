# Dokumentation: JScripting

**Datei:** `a1aeins/ah_jscripting.cpp`  
**Klasse:** `JScripting`  
**Zweck:** Scripting  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Scripting

---

## Methodenübersicht

### RunViaName

**Kurzbeschreibung:**  
Ruft ah_Scripting::RunByName(name, &status, parms) auf; schreibt status optional via glb->SetzeMaskenFeld in das Feld status$; gibt Erfolg (erg) zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| name | string | ja | `—` |
| parms | string | optional | `—` |
| status$ | string | optional | `—` |

**Rückgabe:** long

---

### RunViaId

**Kurzbeschreibung:**  
Ruft ah_Scripting::RunById(id, parms, &status) auf; schreibt status optional via glb->SetzeMaskenFeld in das Feld status$; gibt Erfolg (erg) zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| id | long | ja | `0` |
| parms | string | optional | `—` |
| status$ | string | optional | `—` |

**Rückgabe:** long

---

### Automation

**Kurzbeschreibung:**  
Bei state==TRUE: glb->ScreenAutoCommit(false); ruft COM::ProxyScript->Automation(state) auf; gibt true zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| state | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
