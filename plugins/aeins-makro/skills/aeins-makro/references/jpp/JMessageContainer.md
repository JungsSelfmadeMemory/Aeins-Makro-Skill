# Dokumentation: JMessageContainer

**Datei:** `a1aeins/JMessageContainer.cpp`  
**Klasse:** `JMessageContainer`  
**Zweck:** JPP-Wrapper um einen AmicMessage::CMessageContainer; macht das Erzeugen, Setzen (Hinweis/Warnung/Fehler), Zählen und Anzeigen von Protokoll-/Nachrichten aus JPL skriptbar. _(ergänzt)_  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Wrapper um einen AmicMessage::CMessageContainer; macht das Erzeugen, Setzen (Hinweis/Warnung/Fehler), Zählen und Anzeigen von Protokoll-/Nachrichten aus JPL skriptbar. _(ergänzt)_

---

## Methodenübersicht

### AM_SetId

**Kurzbeschreibung:**  
Setzen der Protokoll-ID

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| category | string | ja | `—` |
| identification | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AM_SetProtBereich

**Kurzbeschreibung:**  
Setzen des Protokollbereichs

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| protbereich | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AM_Show

**Kurzbeschreibung:**  
Zeige die Nachrichten

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| show_modus | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AM_Count

**Kurzbeschreibung:**  
Anzahl der Nachrichten

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AM_Hinweis_Ex

**Kurzbeschreibung:**  
Setze Hinweis

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| dest | long | ja | `0` |
| Ident | string | ja | `—` |
| fmt | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AM_Warnung_Ex

**Kurzbeschreibung:**  
Setze Warnung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| dest | long | ja | `0` |
| Ident | string | ja | `—` |
| fmt | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AM_Fehler_Ex

**Kurzbeschreibung:**  
Setze Fehler

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| dest | long | ja | `0` |
| Ident | string | ja | `—` |
| fmt | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
