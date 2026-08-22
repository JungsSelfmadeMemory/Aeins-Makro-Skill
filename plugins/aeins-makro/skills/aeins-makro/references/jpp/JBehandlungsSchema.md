# Dokumentation: JBehandlungsSchema

**Datei:** `a1aeins/BehandlungsSchemaLeser.cpp`  
**Klasse:** `JBehandlungsSchema`  
**Zweck:** Elara Steuerungs-JPP-Objekt  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Elara Steuerungs-JPP-Objekt

---

## Methodenübersicht

### InitByName

**Kurzbeschreibung:**  
Initialisiert den Schemaleser mit einem Namen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KategorieID | long | ja | `0` |
| SchemaName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### InitByKlass

**Kurzbeschreibung:**  
Initialisiert den Schemaleser mit einer Klasse/Unterklasse

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KategorieID | long | ja | `0` |
| V_KlassNummer | long | ja | `0` |
| V_UKLassNummer | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetBoolean

**Kurzbeschreibung:**  
Liest einen Bool-Wert aus dem Behandlungsschema aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KritId | long | ja | `0` |

**Rückgabe:** bool

---

### GetInteger

**Kurzbeschreibung:**  
Liest einen Integer-Wert aus dem Behandlungsschema aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KritId | long | ja | `0` |

**Rückgabe:** long

---

### GetReal

**Kurzbeschreibung:**  
Liest einen Double-Wert aus dem Behandlungsschema aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KritId | long | ja | `0` |

**Rückgabe:** real

---

### GetText

**Kurzbeschreibung:**  
Liest einen Text aus dem Behandlungsschema aus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KritId | long | ja | `0` |

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
