# Dokumentation: JPW

**Datei:** `a1aeins/ah_jpw.cpp`  
**Klasse:** `JPW`  
**Zweck:** PW  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

PW

---

## Methodenübersicht

### Init

**Kurzbeschreibung:**  
Liest Parameter anwendung/titel, legt (nach evtl. DeleteO) per NewO ein Protokoll-Objekt m_Protokoll an; liefert true, wenn m_Protokoll != NULL. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| anwendung | string | ja | `—` |
| titel | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Add

**Kurzbeschreibung:**  
Bricht ab, wenn m_Protokoll==NULL; liest Parameter line und ruft m_Protokoll->Add("%s", line) auf; liefert true. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| line | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Warnung

**Kurzbeschreibung:**  
Bricht ab, wenn m_Protokoll==NULL; liest Parameter line und ruft m_Protokoll->Warnung("%s", line) auf; liefert true. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| line | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Fehler

**Kurzbeschreibung:**  
Bricht ab, wenn m_Protokoll==NULL; liest Parameter line und ruft m_Protokoll->Fehler("%s", line) auf; liefert true. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| line | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Show

**Kurzbeschreibung:**  
Fehler

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| show | bool | optional | `TRUE` |
| Ident | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
