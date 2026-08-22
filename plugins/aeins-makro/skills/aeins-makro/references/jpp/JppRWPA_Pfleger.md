# Dokumentation: JppRWPA_Pfleger

**Datei:** `a1aeins/JppRWPA_Pfleger.cpp`  
**Klasse:** `JppRWPA_Pfleger`  
**Zweck:** Rohwareparameter-Pflege-Unterstützung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Rohwareparameter-Pflege-Unterstützung

---

## Methodenübersicht

### Neu

**Kurzbeschreibung:**  
Initialisierung

_Keine Parameter._

**Rückgabe:** bool

---

### GetErrorCount

**Kurzbeschreibung:**  
Anzahl der Fehlertexte in der Fehlerliste ermitteln

_Keine Parameter._

**Rückgabe:** bool

---

### GetLastErrorStr

**Kurzbeschreibung:**  
Den letzten Fehlertext abrufen

_Keine Parameter._

**Rückgabe:** bool

---

### GetErrorListStr

**Kurzbeschreibung:**  
den i-ten Fehlertext der Fehlerliste abrufen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### AnzeigeFehler

**Kurzbeschreibung:**  
Fehlerbildschirm anzeigen

_Keine Parameter._

**Rückgabe:** bool

---

### SetParamNummer

**Kurzbeschreibung:**  
den zu pflegenden Parameter per Nummer festlegen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_NR | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetParamNummer

**Kurzbeschreibung:**  
Nummer des aktuellen Parameters lesen

_Keine Parameter._

**Rückgabe:** bool

---

### SetEKVK_Kennz

**Kurzbeschreibung:**  
EK-/VK-Kennzeichen festlegen (1/2)

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_EKVK | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetEKVK_Kennz

**Kurzbeschreibung:**  
EK-/VK-Kennzeichen lesen (1/2)

_Keine Parameter._

**Rückgabe:** bool

---

### ReadParamSettings

**Kurzbeschreibung:**  
Lesen der Werte zur aktuellen Parameternummer

_Keine Parameter._

**Rückgabe:** bool

---

### GetGlAktWert

**Kurzbeschreibung:**  
Lesen des Zur Zeit gültigen globalen Parameterwertes

_Keine Parameter._

**Rückgabe:** bool

---

### GetGlAktDatum

**Kurzbeschreibung:**  
Lesen des AbDatums des zur Zeit gültigen globalen Parameterwertes

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstRwg

**Kurzbeschreibung:**  
Positioniere auf 1. rowarengruppenspezifische Ableitungs-Struktur

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextRwg

**Kurzbeschreibung:**  
Positioniere auf nächste rowarengruppenspezifische Ableitungs-Struktur

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstSchema

**Kurzbeschreibung:**  
Positioniere auf 1. schemaspezifische Ableitungs-Struktur

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextSchema

**Kurzbeschreibung:**  
Positioniere auf nächste schemaspezifische Ableitungs-Struktur

_Keine Parameter._

**Rückgabe:** bool

---

### GetAktRwgNr

**Kurzbeschreibung:**  
Rohwarengruppennummer der aktuellen rowarengruppenspezifische Ableitungs-Struktur liefern

_Keine Parameter._

**Rückgabe:** bool

---

### GetAktRwgParDatum

**Kurzbeschreibung:**  
Abdatum des aktuellen rowarengruppenspezifische Parameterwertes  der aktuellen rowarengruppenspezifischen Ableitungs-Struktur liefern

_Keine Parameter._

**Rückgabe:** bool

---

### GetAktRwgParWert

**Kurzbeschreibung:**  
Parameterwert des aktuellen rowarengruppenspezifische Parameterwertes  der aktuellen rowarengruppenspezifischen Ableitungs-Struktur liefern

_Keine Parameter._

**Rückgabe:** bool

---

### GetAktSchRwgNr

**Kurzbeschreibung:**  
Rohwarengruppennummer der aktuellen schemaspezifische Ableitungs-Struktur liefern

_Keine Parameter._

**Rückgabe:** bool

---

### GetAktSchNr

**Kurzbeschreibung:**  
Schemanummer der aktuellen schemaspezifische Ableitungs-Struktur liefern

_Keine Parameter._

**Rückgabe:** bool

---

### GetAktSchParDatum

**Kurzbeschreibung:**  
Abdatum des aktuellen schemaspezifische Parameterwertes  der aktuellen schemaspezifische Ableitungs-Struktur liefern

_Keine Parameter._

**Rückgabe:** bool

---

### GetAktSchParWert

**Kurzbeschreibung:**  
Parameterwert des aktuellen rowarengruppenspezifische Parameterwertes  der aktuellen rowarengruppenspezifischen Ableitungs-Struktur liefern

_Keine Parameter._

**Rückgabe:** bool

---

### GetToday

**Kurzbeschreibung:**  
Das eingestellte Tagesdatum liefern

_Keine Parameter._

**Rückgabe:** bool

---

### PutParamWert

**Kurzbeschreibung:**  
Einen Parameterwert setzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |
| PAR_SCH | long | ja | `—` |
| PAR_DATUM | datum | ja | `—` |
| PAR_WERT | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### DelParamGltList

**Kurzbeschreibung:**  
Gültigkeitsliste eines Parameters löschen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |
| PAR_SCH | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetFirstParamSatz

**Kurzbeschreibung:**  
Auf 1. Satz der PGültigkeitsliste eines Parameters positionieren

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |
| PAR_SCH | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetNextParamSatz

**Kurzbeschreibung:**  
Auf 1. Satz der PGültigkeitsliste eines Parameters positionieren

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |
| PAR_SCH | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetGltParDatum

**Kurzbeschreibung:**  
Gültigkeitsdatum zum aktuellen Parametersatz für Gültigkeitsmaske lesen

_Keine Parameter._

**Rückgabe:** bool

---

### GetGltParWert

**Kurzbeschreibung:**  
Parameterwert zum aktuellen Parametersatz für Gültigkeitsmaske lesen

_Keine Parameter._

**Rückgabe:** bool

---

### AddRohwarengruppe

**Kurzbeschreibung:**  
Rohwarengruppenspezifische Ableitung hinzufügen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### AddSchema

**Kurzbeschreibung:**  
Abrechnungsschemaspezifische Ableitung hinzufügen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |
| PAR_SCH | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetRohwareIndex

**Kurzbeschreibung:**  
Zeilenindex der Rohwarengruppe finden

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetSchemaIndex

**Kurzbeschreibung:**  
Zeilenindex des Abrechnungsschemas finden

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_SCH | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### DeleteAbleitung

**Kurzbeschreibung:**  
Löschen einer Ableitung für Schema oder Rohwarengruppe

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |
| PAR_SCH | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Speichern

**Kurzbeschreibung:**  
Änderungen speichern

_Keine Parameter._

**Rückgabe:** bool

---

### Snapshot

**Kurzbeschreibung:**  
Schnappschuss eines Gültigkeitsblocks anlegen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |
| PAR_SCH | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### TestWithSnapShot

**Kurzbeschreibung:**  
Schnappschuss mit Gültigkeitsblock vergleichen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PAR_RWG | long | ja | `—` |
| PAR_SCH | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
