# Dokumentation: JppArtikelStKopierer

**Datei:** `a1aeins/JppArtikelStKopierer.cpp`  
**Klasse:** `JppArtikelStKopierer`  
**Zweck:** JPL-Unterstützung zum Duplizieren von Artikelstammen incl. aktuellem Artikel  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPL-Unterstützung zum Duplizieren von Artikelstammen incl. aktuellem Artikel

---

## Methodenübersicht

### Neu

**Kurzbeschreibung:**  
Initialisierung

_Keine Parameter._

**Rückgabe:** bool

---

### AddArtikelId

**Kurzbeschreibung:**  
Quellartikel per Id einfügen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| VALUE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetQuellCount

**Kurzbeschreibung:**  
Anzahl der Quellartikel ermitteln

_Keine Parameter._

**Rückgabe:** bool

---

### Item

**Kurzbeschreibung:**  
Positionierung auf Quellartikel

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| VALUE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Set

**Kurzbeschreibung:**  
Property setzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| TOPIC | long | ja | `—` |
| PARAM | long | ja | `—` |
| VALUE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Get

**Kurzbeschreibung:**  
Property auslesen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| TOPIC | long | ja | `—` |
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### DuplizierVorbereitung

**Kurzbeschreibung:**  
Vorbereitung des Dupliziervorgangs

_Keine Parameter._

**Rückgabe:** bool

---

### TestPreisGruppen

**Kurzbeschreibung:**  
Listenpreisgruppen und Preismatrizen auf Abweichung testen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Duplizieren

**Kurzbeschreibung:**  
Neuen Artikelstamm mit Artikel anlegen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| EK_PRGRP_BEHANDLUNG | long | ja | `—` |
| VK_PRGRP_BEHANDLUNG | long | ja | `—` |
| EK_PRMAT_BEHANDLUNG | long | ja | `—` |
| VK_PRMAT_BEHANDLUNG | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetLastHintStr

**Kurzbeschreibung:**  
Den letzten Hinweistext abrufen

_Keine Parameter._

**Rückgabe:** bool

---

### GetErrorCount

**Kurzbeschreibung:**  
Anzahl der Fehlertexte in der Fehlerliste ermitteln

_Keine Parameter._

**Rückgabe:** bool

---

### GetLastErrorStr

**Kurzbeschreibung:**  
Den letzten Fehlertext abrufen

_Keine Parameter._

**Rückgabe:** bool

---

### GetErrorListStr

**Kurzbeschreibung:**  
den i-ten Fehlertext der Fehlerliste abrufen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### AnzeigeFehler

**Kurzbeschreibung:**  
Fehlerbildschirm anzeigen

_Keine Parameter._

**Rückgabe:** bool

---

### GetSekSchlGrpCount

**Kurzbeschreibung:**  
Anzahl der Sekundärschlüsselgruppen

_Keine Parameter._

**Rückgabe:** bool

---

### GetSekGruppenNummer

**Kurzbeschreibung:**  
Gruppennummer zum Sekundärschlüssel-Gruppenindex holen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetSekGruppenBezeich

**Kurzbeschreibung:**  
Gruppenbezeicnung zum Sekundärschlüssel-Gruppenindex holen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetSekSchlEntryByNr

**Kurzbeschreibung:**  
Sekundärschlüssel-Eintrag per Gruppennummer auspacken

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| GRUPPE | long | ja | `—` |
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetSekSchlEntryByNr

**Kurzbeschreibung:**  
Sekundärschlüssel-Eintrag per Gruppennummer setzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| GRUPPE | long | ja | `—` |
| INDEX | long | ja | `—` |
| VALUE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetSekSchlEntryByName

**Kurzbeschreibung:**  
Sekundärschlüssel-Eintrag per Gruppen-Bezeichnung auspacken

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| GRUPPE | string | ja | `—` |
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetSekSchlEntryByName

**Kurzbeschreibung:**  
Sekundärschlüssel-Eintrag per Gruppen-Bezeichnung setzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| GRUPPE | string | ja | `—` |
| INDEX | long | ja | `—` |
| VALUE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetSekSchlEntryCountByNr

**Kurzbeschreibung:**  
Sekundärschlüssel-Anzahl per Gruppennummer auspacken

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| GRUPPE | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetSekSchlEntryCountByName

**Kurzbeschreibung:**  
Sekundärschlüssel-Anzahl per Gruppen.Bezeichnung auspacken

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| GRUPPE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetTextSprachVariantenCount

**Kurzbeschreibung:**  
Anzahl der ArtikelText-SprachVarianten

_Keine Parameter._

**Rückgabe:** bool

---

### GetTextSprachNummer

**Kurzbeschreibung:**  
Sprachnummer zum SprachVarianten-Index holen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetTextSprachBezeichnung

**Kurzbeschreibung:**  
Sprachbezeichnung zum SprachVarianten-Index holen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetTextVariantenNummer

**Kurzbeschreibung:**  
Variantennummer zum SprachVarianten-Index holen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetTextVariantenBezeichnung

**Kurzbeschreibung:**  
Variantenbezeichnung zum SprachVarianten-Index holen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| INDEX | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnzahlTextZeilen

**Kurzbeschreibung:**  
Textzeilen-Anzahl zur Sprachvariante ermitteln

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| SPRACHNR | long | ja | `—` |
| VARINR | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetFirstTextZeile

**Kurzbeschreibung:**  
Die erste Textzeile zur Sprachvariante ermitteln

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| SPRACHNR | long | ja | `—` |
| VARINR | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetNextTextZeile

**Kurzbeschreibung:**  
Die nächste Textzeile zur Sprachvariante ermitteln

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| SPRACHNR | long | ja | `—` |
| VARINR | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### SetText

**Kurzbeschreibung:**  
Textzeile zu Sprach- und Variantennummer setzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| SPRACHNR | long | ja | `—` |
| VARINR | long | ja | `—` |
| INDEX | long | ja | `—` |
| VALUE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetArtikelStammBemerkung

**Kurzbeschreibung:**  
Bemerkung zum Artikel-Stamm abrufen

_Keine Parameter._

**Rückgabe:** bool

---

### SetArtikelStammBemerkung

**Kurzbeschreibung:**  
Bemerkung zum Artikel-Stamm setzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| VALUE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetArtikelBemerkung

**Kurzbeschreibung:**  
Bemerkung zum Artikel abrufen

_Keine Parameter._

**Rückgabe:** bool

---

### SetArtikelBemerkung

**Kurzbeschreibung:**  
Bemerkung zum Artikel setzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| VALUE | string | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetDuplizierModus

**Kurzbeschreibung:**  
Dupliziermodus abrufen: aktuellen Artikel vs. passende Artikel aller Läger

_Keine Parameter._

**Rückgabe:** bool

---

### SetDuplizierModus

**Kurzbeschreibung:**  
Dupliziermodus setzen: aktuellen Artikel vs. passende Artikel aller Läger

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| MODUS | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetVK_PreisModus

**Kurzbeschreibung:**  
Dupliziermodus abrufen für VK-Preisbehandlung 0: Preise kopieren, 1: Nullsetzen

_Keine Parameter._

**Rückgabe:** bool

---

### SetVK_PreisModus

**Kurzbeschreibung:**  
Dupliziermodus setzen für VK-Preisbehandlung 0: Preise kopieren, 1: Nullsetzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| MODUS | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetEK_PreisModus

**Kurzbeschreibung:**  
Dupliziermodus abrufen für EK-Preisbehandlung 0: Preise kopieren, 1: Nullsetzen

_Keine Parameter._

**Rückgabe:** bool

---

### SetEK_PreisModus

**Kurzbeschreibung:**  
Dupliziermodus setzen für EK-Preisbehandlung 0: Preise kopieren, 1: Nullsetzen

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| MODUS | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetKSTST_Modus

**Kurzbeschreibung:**  
Dupliziermodus abrufen für Kostenstellengruppe 0: aus Lagerstamm, 1: aus Quellartikel

_Keine Parameter._

**Rückgabe:** bool

---

### SetKSTST_Modus

**Kurzbeschreibung:**  
Dupliziermodus setzen für Kostenstellengruppe 0: aus Lagerstamm, 1: aus Quellartikel

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| MODUS | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetKSTTR_Modus

**Kurzbeschreibung:**  
Dupliziermodus abrufen für Kostenträgergruppe 0: aus Lagerstamm, 1: aus Quellartikel

_Keine Parameter._

**Rückgabe:** bool

---

### SetKSTTR_Modus

**Kurzbeschreibung:**  
Dupliziermodus setzen für Kostenträgergruppe 0: aus Lagerstamm, 1: aus Quellartikel

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| MODUS | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetKSTOBJ_Modus

**Kurzbeschreibung:**  
Dupliziermodus abrufen für Kostenobjektgruppe 0: aus Lagerstamm, 1: aus Quellartikel

_Keine Parameter._

**Rückgabe:** bool

---

### SetKSTOBJ_Modus

**Kurzbeschreibung:**  
Dupliziermodus setzen für Kostenobjektgruppe 0: aus Lagerstamm, 1: aus Quellartikel

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| MODUS | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnzahlErzeugterArtikel

**Kurzbeschreibung:**  
Anzahl der bearbeitbaren neu erzeugten Artikel

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetFirstNeueArtikelId

**Kurzbeschreibung:**  
ArtikelId des ersten bearbeitbaren neu erzeugten Artikels

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetNextNeueArtikelId

**Kurzbeschreibung:**  
ArtikelId des nächsten bearbeitbaren neu erzeugten Artikels

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| PARAM | long | ja | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetAnzahlErzeugterStaemme

**Kurzbeschreibung:**  
Anzahl der bearbeitbaren neu erzeugten Artikel-Stamm-Sätze

_Keine Parameter._

**Rückgabe:** bool

---

### GetFirstNeueArtiStammId

**Kurzbeschreibung:**  
ArtiStammId des ersten bearbeitbaren neu erzeugten Artikel-Stamms

_Keine Parameter._

**Rückgabe:** bool

---

### GetNextNeueArtiStammId

**Kurzbeschreibung:**  
ArtiStammId des nächsten bearbeitbaren neu erzeugten Artikel-Stamms

_Keine Parameter._

**Rückgabe:** bool

---

### GetNeueArtiStammId

**Kurzbeschreibung:**  
ArtiStammId des zuletzt erzeugten bearbeitbaren Artikel-Stamms

_Keine Parameter._

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
