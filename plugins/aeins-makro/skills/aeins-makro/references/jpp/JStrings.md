# Dokumentation: JStrings

**Datei:** `a1aeins/ah_jstring.cpp`  
**Klasse:** `JStrings`  
**Zweck:** Geordnete Stringtrivialitäten  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Geordnete Stringtrivialitäten

---

## Methodenübersicht

### Trim

**Kurzbeschreibung:**  
Trimmt str via COM::Tools->Trim() und gibt den getrimmten String zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | optional | `—` |

**Rückgabe:** string

---

### ToUpper

**Kurzbeschreibung:**  
Wandelt str mit MakeUpper() in Großbuchstaben und gibt ihn zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | optional | `—` |

**Rückgabe:** string

---

### ToLower

**Kurzbeschreibung:**  
Wandelt str mit MakeLower() in Kleinbuchstaben und gibt ihn zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | optional | `—` |

**Rückgabe:** string

---

### IsEqual

**Kurzbeschreibung:**  
Vergleicht str1 und str2 via COM::Tools->IsEqual() und gibt bool zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str1 | string | optional | `—` |
| str2 | string | optional | `—` |

**Rückgabe:** bool

---

### Tuettel

**Kurzbeschreibung:**  
Klammert str mit Zeichen (Default '), vorne+hinten getrennt möglich; gibt vorne+str+hinten zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | optional | `—` |
| klammer | string | optional | `'` |
| hinten | string | optional | `—` |

**Rückgabe:** string

---

### Match

**Kurzbeschreibung:**  
RegExp::Match von str gegen reg (mit group/trim/plain-Escaping), optional via JVARS, liefert Treffer/Status. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | optional | `—` |
| reg | string | ja | `—` |
| jvars | bool | optional | `FALSE` |
| plain | bool | optional | `FALSE` |
| result | string | optional | `—` |
| error | string | optional | `FEHLER` |
| status | string | optional | `—` |
| owner | long | optional | `0` |
| trim | long | optional | `0` |
| group | string | optional | `0` |

**Rückgabe:** string

---

### BeginsWith

**Kurzbeschreibung:**  
Prüft via COM::Tools->StringBeginsWith(), ob str1 mit str2 beginnt (optional ignoreCase); gibt bool zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str1 | string | optional | `—` |
| str2 | string | optional | `—` |
| ignorecase | bool | optional | `TRUE` |

**Rückgabe:** bool

---

### Mid

**Kurzbeschreibung:**  
Liefert str.Mid(pos) als String zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | optional | `—` |
| pos | long | optional | `0` |

**Rückgabe:** string

---

### GetLength

**Kurzbeschreibung:**  
Gibt str.GetLength() als Long zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | optional | `—` |

**Rückgabe:** long

---

### Translate

**Kurzbeschreibung:**  
Übersetzt str via ah::Translate() mit format/regexp (optional rückwärts); per JVARS oder Rückgabe. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | ja | `—` |
| format | string | ja | `—` |
| jvars | bool | optional | `FALSE` |
| back | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** string

---

### Replace

**Kurzbeschreibung:**  
Ersetzt via RegExp::Replace(str, reg, with), optional über JVARS; gibt Ergebnis-String zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | ja | `—` |
| reg | string | ja | `—` |
| with | string | ja | `—` |
| jvars | bool | optional | `FALSE` |
| result | string | optional | `—` |
| owner | long | optional | `0` |

**Rückgabe:** string

---

### Formatiere

**Kurzbeschreibung:**  
Füllt/kürzt wert auf Länge len mit fill-Zeichen (links/rechts) via COM::Tools->StringX; Ergebnis per JVARS/Maskenfeld. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| value | string | ja | `—` |
| len | long | ja | `0` |
| fill | string | optional | ` ` |
| right | bool | optional | `FALSE` |
| result$ | string | optional | `—` |
| jvars | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### IsNumeric

**Kurzbeschreibung:**  
Prüft str per RegExp::Match gegen numerisches Muster; gibt bool (S_OK) zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Left

**Kurzbeschreibung:**  
Liefert str.Left(pos) als String zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | optional | `—` |
| pos | long | optional | `0` |

**Rückgabe:** string

---

### Right

**Kurzbeschreibung:**  
Liefert str.Right(pos) als String zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| str | string | optional | `—` |
| pos | long | optional | `0` |

**Rückgabe:** string

---

### Format

**Kurzbeschreibung:**  
Prüft value gegen alphanum.(an..)/numer.(n..,) Format per RegExp; setzt result$/status$/info$ via JVARS oder Maskenfeld. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| format | string | optional | `—` |
| value | string | optional | `—` |
| result$ | string | optional | `—` |
| status$ | string | optional | `—` |
| info$ | string | optional | `—` |
| jvars | bool | optional | `FALSE` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
