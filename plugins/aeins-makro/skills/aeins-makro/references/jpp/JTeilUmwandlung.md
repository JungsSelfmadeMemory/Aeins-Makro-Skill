# Dokumentation: JTeilUmwandlung

**Datei:** `a1aeins/JTeilUmwandlung.cpp`  
**Klasse:** `JTeilUmwandlung`  
**Zweck:** Teilumwandlung durchführen  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Teilumwandlung durchführen

---

## Methodenübersicht

### StartUmwandlung

**Kurzbeschreibung:**  
Vorbereiten der Umwandlung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| VHandle | handle | ja | `0` |
| WaBewId | long | ja | `0` |
| AUF_SVPOSI | bool | optional | `false` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeUmwandlung

**Kurzbeschreibung:**  
Abschluss der Umwandlung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Einfuegen | bool | optional | `true` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetWaPosHandle

**Kurzbeschreibung:**  
Erzeugte Warenposition der letzten Teilumwandung

_Keine Parameter._

**Rückgabe:** bool

---

### ZeigMeldungen

**Kurzbeschreibung:**  
Gib Meldungen aus, je nach eingesteltem MeldungsTyp

_Keine Parameter._

**Rückgabe:** bool

---

### EingabeAnzahl

**Kurzbeschreibung:**  
Anzahl Gebinde oder Menge, wenn ohne Gebinde

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Anzahl | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EingabeMenge

**Kurzbeschreibung:**  
Menge angeben, Gebindeanzahl wird errechnet

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Menge | real | ja | `0` |
| ME_Nummer | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddGebinde

**Kurzbeschreibung:**  
Gebinde angeben

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| GebindeAnzahl | real | ja | `0` |
| GebindeFaktor1 | real | ja | `1` |
| GebindeFaktor2 | real | optional | `NULL` |
| GebindeFaktor3 | real | optional | `NULL` |
| GebindeFaktor4 | real | optional | `NULL` |
| ME_NummerGebinde | long | optional | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EingabePreis

**Kurzbeschreibung:**  
Eingabe des Preises

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Preis | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EingabeWert

**Kurzbeschreibung:**  
Eingabe des Gesamtwertes

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Wert | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EingabePreisBezug

**Kurzbeschreibung:**  
Eingabe des Preisbezuges

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PreisBezug | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### IstGebinde

**Kurzbeschreibung:**  
Ist es eine gebinde Zeile

_Keine Parameter._

**Rückgabe:** bool

---

### EingabePartieNummer

**Kurzbeschreibung:**  
Eingabe einer Partienummer

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Nummer | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EingabeKontraktNummer

**Kurzbeschreibung:**  
Eingabe einer KontraktNummer

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Nummer | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EingabePartieErlaubt

**Kurzbeschreibung:**  
Ob Eingabe einer Partienummer erlaubt ist

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EingabeKontraktErlaubt

**Kurzbeschreibung:**  
Ob Eingabe einer KontraktNummer erlaubt ist

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RestAusbuchen

**Kurzbeschreibung:**  
Ob der Rest ausgebucht werden soll

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Ausbuchen | bool | ja | `true` |
| Menge | real | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AbwZielLager

**Kurzbeschreibung:**  
Abweichendes Ziellager

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LagerNummer | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
