# Dokumentation: ArchivVolltext

**Datei:** `a1aeins/ArchivVolltext.cpp`  
**Klasse:** `ArchivVolltext`  
**Zweck:** Volltext-Funktionen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Volltext-Funktionen

---

## Methodenübersicht

### Aktualisieren

**Kurzbeschreibung:**  
Liest JPP-Parameter fa_id und fa_mndnr, ruft ArchivVolltextAktualisieren auf (setzt JVARS $code=archivvolltext, NET::NET("Call"), bei Fehlprotokoll-Ident INSERT in archivtextbad via DBX), gibt 1/0 zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fa_id | long | optional | `0` |
| fa_mndnr | long | optional | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
