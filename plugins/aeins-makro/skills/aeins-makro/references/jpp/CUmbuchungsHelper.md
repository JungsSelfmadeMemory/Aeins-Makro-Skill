# Dokumentation: CUmbuchungsHelper

**Datei:** `a1aeins/UmbuchungsHelper.cpp`  
**Klasse:** `CUmbuchungsHelper`  
**Zweck:** Umbuchungs Unterstützung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Umbuchungs Unterstützung

---

## Methodenübersicht

### StartUmbuchung

**Kurzbeschreibung:**  
Initialisiere eine neue Umbuchung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NumNummer | long | optional | `0` |
| v_NumNummer | long | optional | `NumNummer` |
| Klasse | long | optional | `0` |
| v_KlassNummer | long | optional | `0` |
| Unterklasse | long | optional | `0` |
| v_UklassNummer | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LadeUmbuchung

**Kurzbeschreibung:**  
Initialisiere eine Umbuchung per ID. Es können auch gesperrte Umbuchungen geladen werden(FORCE)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| fremdw_in_buchw | bool | optional | `FALSE` |
| Aenderung_Zulassen | bool | optional | `TRUE` |
| force | bool | optional | `FALSE` |
| NoSperrExport | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFirstUmbuchung

**Kurzbeschreibung:**  
Lade die erste Umbuchung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteUmbuchungMethode

**Kurzbeschreibung:**  
Lösche Umbuchung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeUmbuchung

**Kurzbeschreibung:**  
Schließe eine neue angelegte Umbuchung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | optional | `TRUE` |
| Speichern_original | bool | optional | `TRUE` |
| OriginalbleibtimSpeicher | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeUmbuchungId

**Kurzbeschreibung:**  
Schließe eine neue angelegte Umbuchung, gebe ID zurück

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | optional | `TRUE` |
| Speichern_original | bool | optional | `TRUE` |

**Rückgabe:** long

---

### UmbuchungAdd

**Kurzbeschreibung:**  
Neue Umbuchung anlegen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NebenBuchFlags | long | optional | `0` |
| FA_BerechTyp | long | optional | `1` |
| FA_BerechWert | real | optional | `1.0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
