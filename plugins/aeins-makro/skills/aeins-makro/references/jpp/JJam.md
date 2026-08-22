# Dokumentation: JJam

**Datei:** `a1aeins/JJam.cpp`  
**Klasse:** `JJam`  
**Zweck:** Jam Support Funktionen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Jam Support Funktionen

---

## Methodenübersicht

### F3Update

**Kurzbeschreibung:**  
F3 Feldanzeigen updaten/ Anzeigen DP = Maskenfeldname

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| BeforeProc | string | ja | `—` |
| AfterProc | string | ja | `—` |
| Maskenfeldname | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### AlfaLookUp

**Kurzbeschreibung:**  
Prüfen den Wert gegen die Itembox

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| ItemBox | string | ja | `—` |
| FeldWert | string | ja | `—` |
| FeldName | string | optional | `—` |
| Owner | long | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SoundAbspielen

**Kurzbeschreibung:**  
Eine Wave Datei abspielen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Dateiname | string | ja | `—` |
| Mode | long | optional | `SND_ASYNC` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FldFill

**Kurzbeschreibung:**  
Felder füllen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| select | string | ja | `—` |
| fields | string | ja | `—` |
| check | bool | ja | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FC_Hex_RGB

**Kurzbeschreibung:**  
Umwandlung Farbcode hexadezimal in RGB

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| hexcode | string | ja | `—` |

**Rückgabe:** string

---

### FC_RGB_Hex

**Kurzbeschreibung:**  
Umwandlung Farbcode RGB in hexadezimal

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| rgbcode | string | ja | `—` |

**Rückgabe:** string

---

### Farbdialog

**Kurzbeschreibung:**  
Ruft den Windows Farbdialog zur Auswahl einer Farbe auf

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| rgbcode | string | ja | `—` |

**Rückgabe:** string

---

### SetTagesDatum

**Kurzbeschreibung:**  
Setzen des TagesDatums

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### UpdateWaehrUmrechTab

**Kurzbeschreibung:**  
Tabelle WaehrUmrechTab aktualisieren. Params: VollStaendig(bool)

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| VollStaendig | bool | ja | `false` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### UpdateWaehrUmrechDatum

**Kurzbeschreibung:**  
ReferenzDatum zur Berechung der WAehrungsumrechnungstabelle setz. Param: KursDatum

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FS_Formatieren

**Kurzbeschreibung:**  
Umwandlung eier Zahl in String per FS_Format

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Format | string | ja | `—` |
| Zahl | long | ja | `0` |

**Rückgabe:** string

---

### SetSystemCaching

**Kurzbeschreibung:**  
Aktivieren/ DEaktivieren aller System Caches

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Aktiv | bool | optional | `true` |
| Meldung | bool | optional | `false` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetSystemCaching

**Kurzbeschreibung:**  
Auslesen Status SystemCAching

_Keine Parameter._

**Rückgabe:** bool

---

### KeyStack

**Kurzbeschreibung:**  
technische Funktion

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| mode | long | optional | `0` |
| key | long | optional | `0x102F` |

**Rückgabe:** long

---

### PDFVorgangsFormularVorschau

**Kurzbeschreibung:**  
Preview Vorgangformular mit PDF

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| V_Id | long | ja | `0` |
| FormularId | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LockTest

**Kurzbeschreibung:**  
Testmethode für Locking Geschichten

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PopMal

**Kurzbeschreibung:**  
Ebendies

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Controlstring

**Kurzbeschreibung:**  
Controlstring aufrufen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Ctlstring | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
