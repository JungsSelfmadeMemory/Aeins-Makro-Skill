# Dokumentation: JKassDisp

**Datei:** `a1aeins/JKassDisp.cpp`  
**Klasse:** `JKassDisp`  
**Zweck:** Stellt Methoden zur Ansteuerung des Kassendisplays bereit  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Stellt Methoden zur Ansteuerung des Kassendisplays bereit

---

## Methodenübersicht

### Config

**Kurzbeschreibung:**  
Setzt die Konfiguration

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KASSENNR | long | ja | `1` |
| RECONNECT | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Settext

**Kurzbeschreibung:**  
Setzt eine Textzeile für ein Feld

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| Text | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddText

**Kurzbeschreibung:**  
Fügt für ein Textfeld eine Zeile hinzu (mit Newline)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | string | ja | `—` |
| Text | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ShowText

**Kurzbeschreibung:**  
Zeigt den Text aus den Eingaben an

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Hide

**Kurzbeschreibung:**  
Versteckt die Anzeige

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KASSENNR | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Close

**Kurzbeschreibung:**  
Schließt die Anzeige

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KASSENNR | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
