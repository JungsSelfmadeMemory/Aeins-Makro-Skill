# Dokumentation: JWaage

**Datei:** `a1aeins/tm_jwaage.cpp`  
**Klasse:** `JWaage`  
**Zweck:** Waage-Angelegenheiten  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Waage-Angelegenheiten

---

## Methodenübersicht

### Waagedaten

**Kurzbeschreibung:**  
Liest JPP-Parameter (kundennummer/-id, artikelnummer/-id, owaageid, gewicht, gui), holt glb->BedienerId(), schreibt Wiegenummer/Artikel-/Kunden-ID/Gewicht via JVARS::SET in JVAR_WAAGE und lädt Maske per smx_loadmask("owaage",0); liefert TRUE. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| kundennummer | string | optional | `0` |
| kundenid | long | optional | `0` |
| artikelnummer | string | optional | `0` |
| artikelid | long | optional | `0` |
| owaageid | long | ja | `0` |
| gewicht | long | optional | `0` |
| benutzer | string | ja | `owner` |
| gui | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
