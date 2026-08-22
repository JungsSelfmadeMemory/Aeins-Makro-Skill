# Dokumentation: JScreen

**Datei:** `a1aeins/ah_jscreen.cpp`  
**Klasse:** `JScreen`  
**Zweck:** Informelles  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Informelles

---

## Methodenübersicht

### Window

**Kurzbeschreibung:**  
Ermittelt per sm_mw_get_frame_wnd/sm_mw_drawingarea das Fensterhandle und liefert je nach prop area-Handle oder GetWindowPlacement-Werte (showcmd, min-/max-/normalposition) als String; Rückgabe true bei gültigem hWnd. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| frame | bool | optional | `FALSE` |
| prop | string | ja | `—` |

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
