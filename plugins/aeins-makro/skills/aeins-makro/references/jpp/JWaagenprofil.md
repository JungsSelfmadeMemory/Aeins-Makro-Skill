# Dokumentation: JWaagenprofil

**Datei:** `a1aeins/ah_jwaagenprofil.cpp`  
**Klasse:** `JWaagenprofil`  
**Zweck:** Waagenprofil  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Waagenprofil

---

## Methodenübersicht

### Wiegen

**Kurzbeschreibung:**  
Baut den Aufruf 'waagenprofil_exec wiege' mit modus/owner/profilid/silent und ruft COM::Jam->sm_jplcall(); liefert true bei S_OK. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| profilid | long | ja | `0` |
| owner | long | optional | `0` |
| silent | long | optional | `0` |

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
