# Dokumentation: JPartie

**Datei:** `a1aeins/ah_Partie.cpp`  
**Klasse:** `JPartie`  
**Zweck:** JPP-Klasse zur Partie-Verwaltung in Vorgaengen: Partie-Existenz/Artikelposition pruefen, Artikel zuordnen/hinzufuegen/verproben und neue Partien anlegen ueber einen CPartieHalter. _(ergänzt)_  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

JPP-Klasse zur Partie-Verwaltung in Vorgaengen: Partie-Existenz/Artikelposition pruefen, Artikel zuordnen/hinzufuegen/verproben und neue Partien anlegen ueber einen CPartieHalter. _(ergänzt)_

---

## Methodenübersicht

### VorgangInfos

**Kurzbeschreibung:**  
Setzt Klasse/Unterklasse/KundId aus den JPP-Parametern; fehlt KundId, ermittelt sie per ExecuteScalar aus kundenstamm ueber KundNummer. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Klasse | long | ja | `0` |
| KundId | long | optional | `0` |
| KundNummer | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetItemBoxName

**Kurzbeschreibung:**  
Liest den Item-Box-Namen aus der Vorgangsunterklasse (V_UKlassParIB), faellt sonst auf JPartieVerteilGrid::StandardPartieIbBox() zurueck; gibt ihn via JPP_STRING_RET. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### ItemParVersorgen

**Kurzbeschreibung:**  
Prueft Partiehalter und ruft m_PartieHalter->SetzeItemParPartieNummer(). _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool

---

### MitBelegPartien

**Kurzbeschreibung:**  
Prueft via CVorgKlassen::GetVorgUnterKlasse, ob die Vorgangsunterklasse V_UKlassParAutoNumPartie gesetzt hat; liefert true/false. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool

---

### PartieExistiert

**Kurzbeschreibung:**  
Prueft per ExecuteScalar auf Partiestamm (PartieNummer/PartieGrNummer, optional HeuteGueltig) die Existenz; gibt PartieId via JPP_LONG_RET zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PartieNummer | long | ja | `0` |
| PartieGrNummer | long | optional | `-1` |
| HeuteGueltig | long | optional | `1` |

**Rückgabe:** long

---

### ArtikelHinzufuegen

**Kurzbeschreibung:**  
Legt CPartieInfo mit PartieId an und ruft m_PartieHalter->PartieArtikelHinzufuegen(); gibt die Position via JPP_LONG_RET zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PartieId | long | ja | `0` |

**Rückgabe:** long

---

### ArtikelVerproben

**Kurzbeschreibung:**  
Ermittelt Probe-Flags aus der Vorgangsunterklasse und ruft m_PartieHalter->PartieInfoVerproben(); zeigt Meldungen, liefert false bei PI_PROBE_FEHLER. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PartieId | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ArtikelZuordnen

**Kurzbeschreibung:**  
Legt neuen Partiehalter an, ruft VorbelegungAusArtikel() und VorgangInfosInPartiehalter(); setzt optional EKVK_Kz; loescht Halter bei Fehlschlag. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PartieBehandlungsTyp

**Kurzbeschreibung:**  
PartieBehandlung: 0 = egal 1 = Partiezwang, 2 = nie mit Partie

_Keine Parameter._

**Rückgabe:** long

---

### GetPartieArtiPosit

**Kurzbeschreibung:**  
Ermittelt per ExecuteScalar (Join Partiestamm/Partieartikel/artikel) die PartieArtiPosit zu PartieId+ArtikelId; gibt sie via JPP_LONG_RET zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PartieId | long | ja | `0` |
| ArtikelId | long | ja | `0` |
| PartieGrNummer | long | optional | `-1` |

**Rückgabe:** long

---

### Neu

**Kurzbeschreibung:**  
Liest Neuanlage-Parameter (Bezeichnung/Match/Datumsfelder/DBPARM), befuellt PartieNeuanlageVorbelegung und ruft DW::NeuePartie(); gibt PartieId zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| PartieNummer | long | optional | `0` |
| PartieBezeich | string | optional | `—` |
| PartieMatch | string | optional | `—` |
| Visuell | bool | optional | `TRUE` |
| AbDatum | string | optional | `—` |
| BisDatum | string | optional | `—` |
| MHDDatum | string | optional | `—` |
| DBPARM_BelegNummer | long | optional | `0` |
| DBPARM_AufrufTyp | long | optional | `Partie_DBPARM_AufrufTyp_undefiniert` |

**Rückgabe:** long

---

### Wahl

**Kurzbeschreibung:**  
Ruft DW::PartieWahl(ArtikelId) (liefert derzeit -1) und gibt das Ergebnis via JPP_LONG_RET zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |

**Rückgabe:** long

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
