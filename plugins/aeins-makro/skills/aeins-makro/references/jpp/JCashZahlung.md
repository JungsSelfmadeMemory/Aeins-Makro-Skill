# Dokumentation: JCashZahlung

**Datei:** `a1aeins/jcashzahlung.cpp`  
**Klasse:** `JCashZahlung`  
**Zweck:** JPP-Objekt zur Abwicklung von Zahlungen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Objekt zur Abwicklung von Zahlungen

---

## Methodenübersicht

### DoZahlung

**Kurzbeschreibung:**  
Setzt den zu zahlenden Betrag

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| betrag | real | ja | `0` |
| zahlungsart | long | optional | `m_ZahlArt.wert()` |
| zahlungsartzusatz | long | optional | `m_ZahlArtZusatz.wert()` |
| waehrung | long | optional | `glb->ZentralWaehrung()` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartZahlung

**Kurzbeschreibung:**  
Setzt einen Zahlungsweg und Startsumme

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| BelegSumme | real | ja | `0.00` |
| zahlungsart | long | ja | `0` |
| zahlungsartzusatz | long | optional | `0` |
| BelegSummeBuch | real | ja | `0` |
| anzahlung | real | optional | `0.00` |
| belegwaehrung | long | optional | `glb->ZentralWaehrung()` |
| EcParameter | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### REVZahlung

**Kurzbeschreibung:**  
Gibt die Bestätigung für einen Storno

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| betrag | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ACKZahlung

**Kurzbeschreibung:**  
Bestätigt eine Zahlung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ok | real | ja | `0` |
| ZahlSumme | real | ja | `0` |
| RueckGeld | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WechselGeld

**Kurzbeschreibung:**  
Gibt den Wechselgeldbetrag zurück

_Keine Parameter._

**Rückgabe:** real

---

### Anzahlung

**Kurzbeschreibung:**  
Gibt den bereits bezahlten Betrag zurück

_Keine Parameter._

**Rückgabe:** real

---

### RestSumme

**Kurzbeschreibung:**  
Gibt den noch zu zahlenden Betrag zurück

_Keine Parameter._

**Rückgabe:** real

---

### ZahlArt

**Kurzbeschreibung:**  
Gibt die Zahlungsart zurück

_Keine Parameter._

**Rückgabe:** long

---

### ZahlArtZusatz

**Kurzbeschreibung:**  
Gibt den ZahlungsartZusatzParameter zurück

_Keine Parameter._

**Rückgabe:** long

---

### ZahlBetrag

**Kurzbeschreibung:**  
Gibt den Zahlbetrag

_Keine Parameter._

**Rückgabe:** real

---

### EcParameter

**Kurzbeschreibung:**  
Gibt den EcParameter zurück

_Keine Parameter._

**Rückgabe:** long

---

### ZahlWaehrung

**Kurzbeschreibung:**  
Gibt die ZahlWährung zurück

_Keine Parameter._

**Rückgabe:** long

---

### BelegWaehrung

**Kurzbeschreibung:**  
Gibt die Beleg-Währung zurück

_Keine Parameter._

**Rückgabe:** long

---

### CancelLast

**Kurzbeschreibung:**  
Gibt das Letzte-Zahlung-Cancel-Flag aus bzw. setzt es

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Set | long | optional | `-1` |

**Rückgabe:** long

---

### CancelAll

**Kurzbeschreibung:**  
Gibt das Alle-Zahlungen-Cancel-Flag aus bzw. setzt es

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Set | long | optional | `-1` |

**Rückgabe:** long

---

### SetText

**Kurzbeschreibung:**  
Setzt die Texte der Zahlungszusatzinformationen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| TX1 | string | optional | `—` |
| TX2 | string | optional | `—` |
| TX3 | string | optional | `—` |
| TX4 | string | optional | `—` |
| TX5 | string | optional | `—` |
| TX6 | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Text1

**Kurzbeschreibung:**  
Gibt Text1 aus

_Keine Parameter._

**Rückgabe:** string

---

### Text2

**Kurzbeschreibung:**  
Gibt Text2 aus

_Keine Parameter._

**Rückgabe:** string

---

### Text3

**Kurzbeschreibung:**  
Gibt Text3 aus

_Keine Parameter._

**Rückgabe:** string

---

### Text4

**Kurzbeschreibung:**  
Gibt Text4 aus

_Keine Parameter._

**Rückgabe:** string

---

### Text5

**Kurzbeschreibung:**  
Gibt Text5 aus

_Keine Parameter._

**Rückgabe:** string

---

### Text6

**Kurzbeschreibung:**  
Gibt Text6 aus

_Keine Parameter._

**Rückgabe:** string

---

### GetZahlungAbgeschlossen

**Kurzbeschreibung:**  
Gibt an ob die Zahlung abgeschlossen wurde

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetZahlungAbgeschlossen

**Kurzbeschreibung:**  
Setzt ob die Zahlung abgeschlossen wurde

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| OK | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
