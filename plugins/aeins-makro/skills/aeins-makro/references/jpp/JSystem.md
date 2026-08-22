# Dokumentation: JSystem

**Datei:** `a1aeins/ah_jsystem.cpp`  
**Klasse:** `JSystem`  
**Zweck:** Systemspezifika  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Systemspezifika

---

## Methodenübersicht

### GetQRDrucker

**Kurzbeschreibung:**  
Liefert den gemerkten QR-Drucker (m_QRDrucker); falls leer, COM::System->GetStandardDrucker(); gibt Druckernamen zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### SelectQRDrucker

**Kurzbeschreibung:**  
Ruft COM::System->Druckerwahl() auf, merkt nicht-leeres Ergebnis in m_QRDrucker und gibt den gewaehlten Drucker zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### GetStandardDrucker

**Kurzbeschreibung:**  
Gibt das Ergebnis von COM::System->GetStandardDrucker() als String zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### SetStandardDrucker

**Kurzbeschreibung:**  
Setzt bei nicht-leerem Param 'drucker' via COM::System->SetStandardDrucker(); gibt Erfolg als BOOL zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| drucker | string | optional | `—` |

**Rückgabe:** bool

---

### SelectDrucker

**Kurzbeschreibung:**  
Druckerwahl ueber COM::System->Druckerwahl(); bei set=TRUE wird Auswahl als Standarddrucker gesetzt; gibt gewaehlten Drucker zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| set | bool | optional | `FALSE` |

**Rückgabe:** string

---

### GetPid

**Kurzbeschreibung:**  
Liefert die aktuelle Prozess-ID via ::GetCurrentProcessId() als long zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### HostName

**Kurzbeschreibung:**  
Gibt den Computernamen via COM::System->GetComputerName() zurueck; true wenn nicht leer. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### HatWindowsAdminRechte

**Kurzbeschreibung:**  
Prueft via COM::System->IsAdmin() und gibt das Ergebnis als BOOL zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool

---

### GetGUID

**Kurzbeschreibung:**  
Erzeugt eine GUID via COM::Tools->CreateGuid(true) und gibt sie als String zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### Execute

**Kurzbeschreibung:**  
Startet ein Programm per ShellExecute bzw. ShellExecuteModal (Param app/args/dir/operation/show/modal); optional JVARS-Aufloesung und Maskenfeld-Notiz. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| app | string | optional | `—` |
| args | string | optional | `—` |
| dir | string | optional | `.` |
| notice | string | optional | `—` |
| check | bool | optional | `TRUE` |
| show | long | optional | `SW_SHOW` |
| split | long | optional | `FALSE` |
| jvars | bool | optional | `FALSE` |
| owner | long | optional | `0` |
| operation | string | optional | `open` |
| modal | bool | optional | `FALSE` |
| waitout | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CreateProcess

**Kurzbeschreibung:**  
Startet Prozess via ::CreateProcess; optional WaitForInputIdle und Warten auf Terminierung mit GetExitCodeProcess; schreibt Exitcode/Notiz ins Maskenfeld. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| app | string | ja | `—` |
| args | string | optional | `—` |
| dir | string | optional | `.` |
| notice$ | string | optional | `—` |
| check | bool | optional | `TRUE` |
| show | long | optional | `SW_SHOW` |
| owner | long | optional | `0` |
| timeOut | long | optional | `-1` |
| sleep | long | optional | `500` |
| exitcode$ | string | optional | `—` |
| maxTries | long | optional | `100` |
| waitOut | bool | optional | `FALSE` |
| modal | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Sleep

**Kurzbeschreibung:**  
Pausiert via ::Sleep(msec); bei negativem Wert false. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| msec | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFontMetric

**Kurzbeschreibung:**  
Mappt Schriftname auf Stock-Font, liest LOGFONT via GetStockObject/GetLogFont und setzt JVARS fontname/fontw/fonth. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| font | string | optional | `DEVICE_DEFAULT_FONT` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetScreenMetric

**Kurzbeschreibung:**  
Liest LOGPIXELSX/LOGPIXELSY via GetDeviceCaps des Bildschirm-DC und setzt sie in JVARS. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetBitmapMetric

**Kurzbeschreibung:**  
Ermittelt Bitmap-Groesse via COM::System->GetBitmapSize(file) und setzt JVARS bitmaph/bitmapw (sonst UNSET). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| filename | string | ja | `—` |
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetVersion

**Kurzbeschreibung:**  
Liest Versionsstring via COM::System->GetVersion(hwnd,wyw) und legt ihn in JVARS ab; true wenn Laenge != 0. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |
| wyw | long | optional | `WYWFullVersion` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### UpdateLogging

**Kurzbeschreibung:**  
Schreibt Text (CONTENT) ins Log bzw. in DATEI via glb->UpdateLogging mit Flags ABBRUCH/NOHTM/FEHLERHINWEIS; optional aus JVARS. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| CONTENT | string | optional | `—` |
| JVARS | bool | optional | `FALSE` |
| OWNER | long | optional | `0` |
| DATEI | string | optional | `—` |
| ABBRUCH | bool | optional | `FALSE` |
| NOHTM | bool | optional | `FALSE` |
| FEHLERHINWEIS | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CancelKeys

**Kurzbeschreibung:**  
Setzt statisches Flag CANCELKEYS gemaess Param 'activate' zur Unterbindung der Tastaturverarbeitung. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| activate | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ShowSybaseHelp

**Kurzbeschreibung:**  
Oeffnet via ::ShellExecute hh.exe mit den Sybase-CHM-Hilfedateien (glb->GetDBHilfeDatei) zum uebergebenen errorcode. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| errorcode | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ScreenMemoryAdd

**Kurzbeschreibung:**  
Legt Screen-Memory fuer ScreenName via glb->ScreenMemoryAdd an und gibt den Owner zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScreenName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ScreenMemoryExists

**Kurzbeschreibung:**  
Prueft via glb->ScreenMemoryExists(ScreenName) und gibt das Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScreenName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ScreenMemoryGetOwner

**Kurzbeschreibung:**  
Liefert den Owner zu ScreenName via glb->ScreenMemoryGetOwner. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScreenName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ScreenMemoryRemove

**Kurzbeschreibung:**  
Entfernt Screen-Memory zu ScreenName via glb->ScreenMemoryRemove. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScreenName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ScreenMemorySetJvar

**Kurzbeschreibung:**  
Setzt JVar (JvarName/Value) im Screen-Memory zu ScreenName via glb->ScreenMemorySetJvar. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScreenName | string | ja | `—` |
| JvarName | string | ja | `—` |
| Value | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Fehlerprotokoll

**Kurzbeschreibung:**  
Ruft ODSprache::Fehlerprotokoll(Art,Anwendung,Ident,Message) und gibt die letzte Fehlprot-GUID aus JVARS zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Art | long | ja | `0` |
| Anwendung | string | ja | `—` |
| Ident | string | ja | `—` |
| Message | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Event

**Kurzbeschreibung:**  
Loest ein Event via ah::AH_EVENT(message) aus. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Message | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### sm_mw_get_frame_wnd

**Kurzbeschreibung:**  
Gibt das Frame-Window-Handle via COM::Jam->sm_mw_get_frame_wnd() zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetVersions

**Kurzbeschreibung:**  
Setzt in neuer JVAR die Versionen Aeins (Param programm_version) und Net (JVAR_SYSTEM_NETVERSION) und gibt den Owner zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetTickCount

**Kurzbeschreibung:**  
Setzt JVAR 'GetTickCount' auf den Wert von ::GetTickCount(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| owner | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
