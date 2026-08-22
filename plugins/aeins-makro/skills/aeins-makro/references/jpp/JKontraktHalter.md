# Dokumentation: JKontraktHalter

**Datei:** `a1aeins/kontrakthalter.cpp`  
**Klasse:** `JKontraktHalter`  
**Zweck:** Kontrakthalter  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Kontrakthalter

---

## Methodenübersicht

### StartKontrakt

**Kurzbeschreibung:**  
Starten des Kontrakthalters

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KontraktId | long | ja | `0` |
| Modul | string | optional | `—` |
| MessageType | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartNeuerKontrakt

**Kurzbeschreibung:**  
Anlegen eines neuen Kontraktes

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Modul | string | optional | `—` |
| MessageType | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeKontrakt

**Kurzbeschreibung:**  
Beenden des Kontrakthalters

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValueKontrakt

**Kurzbeschreibung:**  
Holen eines Wertes aus dem Kontraktstamm

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValueKontrakt

**Kurzbeschreibung:**  
Setzen eines Wertes in den Kontraktstamm

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetKtrKunden

**Kurzbeschreibung:**  
Setzen des Kunden für den Kontrakt

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KundId | long | ja | `0` |
| GrupNummer | long | optional | `0` |
| Erzeugen | bool | optional | `false` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CreateKtrZeitraeume

**Kurzbeschreibung:**  
Erstanlage der Mengen- und Preiszeiträume

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddArtikel

**Kurzbeschreibung:**  
Hinzufügen eines Artikels

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| ArtiPosit | long | optional | `0` |
| AnwBemerk | string | optional | `—` |
| AnwWert | real | optional | `0` |
| GesaMenge | real | optional | `0` |
| GesaWert | real | optional | `0` |
| UebMenge | real | optional | `0` |
| UntMenge | real | optional | `0` |
| UebWert | real | optional | `0` |
| UntWert | real | optional | `0` |
| Preis | real | optional | `0` |
| PreisEinheit | real | optional | `0` |
| MENummer | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DelArtikel

**Kurzbeschreibung:**  
Löscht einen Artikel aus der Artikelliste

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EditArtikel

**Kurzbeschreibung:**  
Bearbeiten eines Artikels

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `0` |
| AnwBemerk | string | optional | `—` |
| AnwWert | real | optional | `0` |
| GesaMenge | real | optional | `0` |
| GesaWert | real | optional | `0` |
| UebMenge | real | optional | `0` |
| UntMenge | real | optional | `0` |
| UebWert | real | optional | `0` |
| UntWert | real | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtikelAnzahl

**Kurzbeschreibung:**  
Gibt die Anzahl der Artikel wieder

_Keine Parameter._

**Rückgabe:** long

---

### GetArtikelValue

**Kurzbeschreibung:**  
Wert des übergebenen Feldes und Indexes eines Artikels holen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Index | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetArtikelValue

**Kurzbeschreibung:**  
Wert für bestimmte Felder eines Artikels festlegen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| ArtiPosit | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EditMengen

**Kurzbeschreibung:**  
Bearbeiten einer Menge eines Artikels

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `0` |
| SollMenge | real | optional | `NULL` |
| SollWaeh | real | optional | `NULL` |
| SollWert | real | optional | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetMengenValue

**Kurzbeschreibung:**  
Wert des übergebenen Feldes, Indexes und Artikels holen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `NULL` |
| Feld | string | ja | `—` |
| Index | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetMengenValue

**Kurzbeschreibung:**  
Wert des übergebenen Feldes, Indexes und Artikels holen setzen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `NULL` |
| Feld | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddMengenZeitraum

**Kurzbeschreibung:**  
Hinzufügen eines Mengenzeitraums

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KlammerNummer | long | optional | `NULL` |
| KlammerTyp | long | optional | `NULL` |
| SollMenge | real | optional | `NULL` |
| SollWert | real | optional | `NULL` |
| TourId | long | optional | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteMengenZeitraum

**Kurzbeschreibung:**  
Entfernen eines Mengenzeitraums

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EditMengenZeitraum

**Kurzbeschreibung:**  
Bearbeiten eines Mengenzeitraums

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ExistsMengenZeitraum

**Kurzbeschreibung:**  
Überprüfen ob der Mengenzeitraum existiert

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetMengenZRAnzahl

**Kurzbeschreibung:**  
Gibt die Anzahl der Mengenzeiträume wieder

_Keine Parameter._

**Rückgabe:** long

---

### GetMengenZRValue

**Kurzbeschreibung:**  
Wert des übergebenen Feldes und Indexes holen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Index | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddPartie

**Kurzbeschreibung:**  
Hinzufügen einer neuen Partie

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PartieId | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DelPartieListe

**Kurzbeschreibung:**  
Liste der Partie leeren

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPartieAnzahl

**Kurzbeschreibung:**  
Anzahl der Partien

_Keine Parameter._

**Rückgabe:** long

---

### GetPartieValue

**Kurzbeschreibung:**  
Wert des übergebenen Feldes und Indexes holen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Index | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddPreisZeitraum

**Kurzbeschreibung:**  
Hinzufügen eines Preiszeitraums

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeletePreisZeitraum

**Kurzbeschreibung:**  
Entfernen eines Preiszeitraums

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ExistsPreisZeitraum

**Kurzbeschreibung:**  
Überprüfen ob der Preiszeitraum existiert

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetAnzahlPZ

**Kurzbeschreibung:**  
Gibt die Anzahl der Preiszeiträume zurück

_Keine Parameter._

**Rückgabe:** long

---

### GetPreisZRValue

**Kurzbeschreibung:**  
Wert des übergebenen Feldes und Indexes holen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Index | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EditArtikelAllePreise

**Kurzbeschreibung:**  
Alle Preise eines Artikels gleich setzen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `0` |
| Preis | real | ja | `NULL` |
| PreisEinheit | real | ja | `NULL` |
| ME_NummerPreis | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EditArtikelPreis

**Kurzbeschreibung:**  
Bearbeiten eines Artikel Preises

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `0` |
| Preis | real | ja | `NULL` |
| PreisEinheit | real | ja | `NULL` |
| ME_NummerPreis | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EditArtikelPreisRoh

**Kurzbeschreibung:**  
Bearbeiten der Rohwarenpreise eines Artikels

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `0` |
| KtrPrRohAbPreis | real | ja | `NULL` |
| KtrPrRohfAbPreis | real | ja | `NULL` |
| KtrPrRohMinPreis | real | ja | `NULL` |
| KtrPrRohwm_Preis | real | ja | `NULL` |
| KtrRohAbschSatz | real | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetArtikelPAnzahl

**Kurzbeschreibung:**  
Gibt die Anzahl der Preise des Artikels wieder

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `0` |

**Rückgabe:** long

---

### GetArtikelPValue

**Kurzbeschreibung:**  
Wert des übergebenen Feldes, Indexes und Artikels holen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtiPosit | long | ja | `NULL` |
| Feld | string | ja | `—` |
| Index | long | ja | `NULL` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
