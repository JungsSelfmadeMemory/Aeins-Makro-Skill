# Dokumentation: JA1NETDrv

**Datei:** `a1aeins/ah_ja1netdrv.cpp`  
**Klasse:** `JA1NETDrv`  
**Zweck:** Nettes  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Nettes

---

## Methodenübersicht

### NetCall

**Kurzbeschreibung:**  
Liest die JPP-Parameter assembly/class/method/owner und ruft NET::CALL(assembly, class, method, owner) auf; gibt dessen long-Ergebnis als JPP-Rückgabewert zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| assembly | string | ja | `—` |
| class | string | ja | `—` |
| method | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
