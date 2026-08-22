# Dokumentation: JParam

**Datei:** `a1aeins/ah_jparam.cpp`  
**Klasse:** `JParam`  
**Zweck:** Parameterspezialitäten  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Parameterspezialitäten

---

## Methodenübersicht

### GetEnviron

**Kurzbeschreibung:**  
Liest die Umgebungsvariable 'variable' via COM::Tools->GetEnviron() und gibt deren Wert als String zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| variable | string | ja | `—` |

**Rückgabe:** string

---

### GetMerkmal

**Kurzbeschreibung:**  
Liest ein Merkmal (section/key/user, optional default) via glb->GetMerkmal() und gibt den Wert als String zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| section | string | ja | `—` |
| key | string | ja | `—` |
| default | string | optional | `—` |
| user | string | ja | `.` |

**Rückgabe:** string

---

### SetMerkmal

**Kurzbeschreibung:**  
Setzt ein Merkmal (section/key/value/user) via glb->SetMerkmal() und gibt das bool-Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| section | string | ja | `—` |
| key | string | ja | `—` |
| value | string | ja | `—` |
| user | string | ja | `.` |

**Rückgabe:** bool

---

### GetParam

**Kurzbeschreibung:**  
Liefert Parameter 'Name' via COM::Tools->Param(); ruft Param(name,def) falls 'Default' gesetzt, sonst Param(name); gibt String zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Name | string | ja | `—` |
| Default | string | optional | `LEERERKENNUNG` |

**Rückgabe:** string

---

### GetParamIsWahr

**Kurzbeschreibung:**  
Prueft Parameter 'Name' via COM::Tools->ParamIsWahr(name, inStandard); gibt '1'/'0' als String und das bool zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Name | string | ja | `—` |
| inStandard | bool | ja | `FALSE` |

**Rückgabe:** string

---

### Bediener

**Kurzbeschreibung:**  
Gibt das Bediener-Kuerzel via glb->BedienerKurz() als String zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### BuildSnapshotDBVars

**Kurzbeschreibung:**  
Holt alle Parameter via PROVIDER::PAR_GetAll(); ohne JVARS legt ausgewaehlte (AEINS_VERSION, UNITTEST_*) als DB-Variablen via glb->AddDBVariable() an, mit JVARS schreibt alle via JVARS::SET (Passwort zensiert ohne AMIC-Autorisierung). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| JVARS | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
