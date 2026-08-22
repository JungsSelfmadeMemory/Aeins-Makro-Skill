# Dokumentation: JTapi

**Datei:** `a1aeins/ah_jtapi.cpp`  
**Klasse:** `JTapi`  
**Zweck:** Tapi für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Tapi für JPL

---

## Methodenübersicht

### GetCountry

**Kurzbeschreibung:**  
Ruft COM::System->TapiGetLocationInfo auf und gibt den Ländercode (country) als String zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### GetArea

**Kurzbeschreibung:**  
Ruft COM::System->TapiGetLocationInfo auf und gibt die Ortsvorwahl (area) als String zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### Request

**Kurzbeschreibung:**  
Erzeugt ah::PhoneNo aus 'Nummer', ruft COM::System->TapiRequest(address, who, kommentar) auf und gibt status zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Nummer | string | ja | `—` |
| Name | string | optional | `—` |
| Comment | string | optional | `—` |

**Rückgabe:** string

---

### GetAll

**Kurzbeschreibung:**  
Zerlegt 'Nummer' via ah::PhoneNo und Tapi-Objekt; schreibt Land/Vorwahl/Leitungs-/Adress-Infos per glb->SetzeMaskenFeld in Maskenfelder. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Nummer | string | ja | `—` |
| Country | string | optional | `—` |
| CountryName | string | optional | `—` |
| Area | string | optional | `—` |
| PhoneNo | string | optional | `—` |
| Canonical | string | optional | `—` |
| Displayable | string | optional | `—` |
| Translatable | string | optional | `—` |
| DefaultLocation | string | optional | `—` |
| DefaultLocationId | string | optional | `—` |
| ActiveLineId | string | optional | `—` |
| ActiveLineName | string | optional | `—` |
| ActiveAdressId | string | optional | `—` |
| ActiveAdressCount | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLinesInfo

**Kurzbeschreibung:**  
Liefert via m_Tapi GetDevices/GetVoiceDevices und COM::System->AppName in Maskenfelder; gibt true, wenn Geräte vorhanden. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| AppName | string | optional | `—` |
| Devices | string | optional | `—` |
| VoiceDevices | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### IsVoice

**Kurzbeschreibung:**  
Prüft per m_Tapi->IsVoice(device), ob das angegebene Gerät ein Sprachgerät ist; false bei device<=0. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Device | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetDefaultLocation

**Kurzbeschreibung:**  
Setzt via m_Tapi->SetLocationDefault(wert) den Standardstandort; nur bei Method 0 oder 1. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Method | long | ja | `0` |
| Value | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### TranslateDialog

**Kurzbeschreibung:**  
Öffnet m_Tapi->TranslateDialog(device); bei Erfolg wird das Tapi-Objekt neu erzeugt. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Device | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLineName

**Kurzbeschreibung:**  
Gibt via m_Tapi->GetActiveLineName(device) den Leitungsnamen als String zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Device | long | ja | `0` |

**Rückgabe:** string

---

### SetDefaultLine

**Kurzbeschreibung:**  
Prüft IsVoice(device); erzeugt Tapi neu und ruft m_Tapi->LineInitialize(device) zum Setzen der Standardleitung. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Device | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetAdressName

**Kurzbeschreibung:**  
Gibt via m_Tapi->GetAdressName(adrnr) den Adressnamen als String zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Adress | long | ja | `0` |

**Rückgabe:** string

---

### LineDialog

**Kurzbeschreibung:**  
Öffnet via m_Tapi->LineConfigDialog(device, deviceClass) den Leitungs-Konfigurationsdialog. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Class | string | optional | `—` |
| Device | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LineOpen

**Kurzbeschreibung:**  
Ruft m_Tapi->Open() zum Öffnen der Leitung auf und gibt das Ergebnis zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LineClose

**Kurzbeschreibung:**  
Ruft m_Tapi->Close() zum Schließen der Leitung auf und gibt das Ergebnis zurück. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MakeCall

**Kurzbeschreibung:**  
Schließt und öffnet die Leitung (Close/Open), ruft dann m_Tapi->MakeCall(nummer) zum Wählen auf. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Nummer | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLog

**Kurzbeschreibung:**  
Übergibt das Handle 'Hdl' an m_Tapi->SetLog(hdl) zum Setzen des Log-Ziels. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Hdl | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Log

**Kurzbeschreibung:**  
Schreibt den übergebenen Text via m_Tapi->Log(content) ins TAPI-Log. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| value | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LineReset

**Kurzbeschreibung:**  
Loggt optional 'value' via m_Tapi->Log und schließt dann die Leitung mit m_Tapi->Close(). _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| value | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
