# Dokumentation: CProduktHelper

**Datei:** `a1aeins/VorgangsHelper.cpp`  
**Klasse:** `CProduktHelper`  
**Zweck:** Produktions Unterstützung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Produktions Unterstützung

---

## Methodenübersicht

### BelegNeu

**Kurzbeschreibung:**  
Eine Neue Produktion ansetzen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BelegNummer | long | optional | `0` |
| Vermahlung | bool | optional | `false` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BelegSpeichern

**Kurzbeschreibung:**  
Abspeichern des aktuellen Beleges

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BelegAbbrechen

**Kurzbeschreibung:**  
Abruch der aktuellen Erfassung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ProduktNeu

**Kurzbeschreibung:**  
Neues Produkt anfangen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | optional | `0` |
| ArtikelNummer | string | optional | `—` |
| LagerNummer | long | optional | `0` |
| ArtikelMenge | real | optional | `0` |
| Mengeneinheit | real | optional | `-9999` |
| Variante | long | optional | `ARTIKEL_VARIANTE_STUECKLISTE_PRODUKT` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ProduktSpeichern

**Kurzbeschreibung:**  
Aktuelles Produkt speichern

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ProduktAbbrechen

**Kurzbeschreibung:**  
Aktuelles Produkt abbrechen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### KomponenteNeu

**Kurzbeschreibung:**  
Neues Komponente anfangen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | optional | `0` |
| ArtikelNummer | string | optional | `—` |
| LagerNummer | long | optional | `0` |
| ArtikelMenge | real | optional | `0` |
| Mengeneinheit | real | optional | `-9999` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### KomponenteSpeichern

**Kurzbeschreibung:**  
Aktuelle Komponente speichern

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetTestModus

**Kurzbeschreibung:**  
Im Testmodus mehr Hilfsmeldungen !

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
