# Dokumentation: JLvsHalter

**Datei:** `a1aeins/LvsHalter.cpp`  
**Klasse:** `JLvsHalter`  
**Zweck:** Lagerverwaltungssystemhalter  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Lagerverwaltungssystemhalter

---

## Methodenübersicht

### SetUser

**Kurzbeschreibung:**  
Setzen und rücksetzen des Users

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| User | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetManuelleBewegungsUndEinlagerungsZeit

**Kurzbeschreibung:**  
Setzen und rücksetzen des Users

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetBemerkungsText

**Kurzbeschreibung:**  
Setzen und rücksetzen des Bemerkungstextes

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLvsHalterGuid

**Kurzbeschreibung:**  
Gibt die Guid des aktuellen LvsHalters zurück.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ChangePositionBewegungMarkierIdent

**Kurzbeschreibung:**  
Ändern einer MarkierIdent im Protokoll

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LadeeinheitsNr | long | ja | `0` |
| LadeeinheitsPosition | long | ja | `0` |
| BewegungsIdGruppe | long | ja | `0` |
| MarkierIdentNullErlaubt | bool | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartLadetraeger

**Kurzbeschreibung:**  
Laden des übergebenen Ladeträgers

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LadetraegerNr | long | ja | `0` |
| NoWarning | long | optional | `0` |
| ModusListe | long | optional | `0` |
| NeuerLadetraeger | bool | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ChangeLadetraegerListe

**Kurzbeschreibung:**  
Wechseln eines Ladeträgers im Listenmodus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Ladetraegernr | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLaTrValue

**Kurzbeschreibung:**  
Rückgabe des Wertes fürs übergebene Feld

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Null_Werte | bool | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetOrCreateLadeEinheit

**Kurzbeschreibung:**  
Holen oder ersetzen der aktuelle Ladeeinheit

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Ueberschreiben | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartLaTrBewegung

**Kurzbeschreibung:**  
Vorbereiten eine Bewegung des Ladeträgers

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LokalitaetsNr | long | ja | `0` |
| Status | long | optional | `0` |
| Transportmittel | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLaTrInfoLetzteBewegung

**Kurzbeschreibung:**  
Informationen der letzten Ladeträgerbewegung holen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Vorgaenger | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeLaTrBewegung

**Kurzbeschreibung:**  
Abschließen einer Bewegung des Ladeträgers

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartBehandlung

**Kurzbeschreibung:**  
Vorbereiten einer Silobehandlung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Behandlung | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeBehandlung

**Kurzbeschreibung:**  
Abschließen einer Silobehandlung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SpeichereQualitaetsmessmeldung

**Kurzbeschreibung:**  
Speichern einer Qualitätsmessmeldung um Silobuch

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLaTrValue

**Kurzbeschreibung:**  
Setzen von Werten des Ladeträgers

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Wert | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartLaTrLadeeinheit

**Kurzbeschreibung:**  
Vorbereiten zum ändern einer Ladeeinheit am Ladeträgers

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeLaTrLadeeinheit

**Kurzbeschreibung:**  
Das Ändern einer Ladeeinheit am Ladeträger abschließen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeLadetraegerListe

**Kurzbeschreibung:**  
Beendet alle noch vorhandenen Ladeträger in der Liste

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeLadetraeger

**Kurzbeschreibung:**  
Abschluss des übergebenen Ladeträgers

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartLadeeinheit

**Kurzbeschreibung:**  
Neu/Laden einer Ladeeinheit

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Ladeeinheitsnr | long | ja | `0` |
| NoWarning | long | optional | `0` |
| ModusListe | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ChangeLadeeinheitListe

**Kurzbeschreibung:**  
Wechseln einer Ladeeinheit im Listenmodus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Ladeeinheitsnr | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddLaEiArtikel

**Kurzbeschreibung:**  
Hinzufügen eines Artikels zur Ladeeinheit

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| PartieId | long | ja | `0` |
| Menge | real | ja | `0.0` |
| ME | long | ja | `0` |

**Rückgabe:** long

---

### DelLaEiArtikel

**Kurzbeschreibung:**  
Entfernen eines Artikels aus der Ladeeinheit

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LadeeinheitsPosition | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EditLaEiArtikelMenge

**Kurzbeschreibung:**  
Ändern der Menge eines Artikels

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LadeeinheitsPosition | long | ja | `0` |
| Menge | real | ja | `0.0` |
| MarkierIdentZiel | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### EditLaEiArtikelNachTyp

**Kurzbeschreibung:**  
Änderung von Daten anhand des Typs

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LadeeinheitsPosition | long | ja | `0` |
| Menge | real | optional | `0.0` |
| MarkierIdentZiel | long | optional | `0` |
| Typ | long | ja | `LVS_LAEIPROT_MENGENAENDERUNG` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLaEiArtikelAnzahl

**Kurzbeschreibung:**  
Anzahl der Artikel an der Ladeeinheit

_Keine Parameter._

**Rückgabe:** long

---

### GetLaEiPosNr

**Kurzbeschreibung:**  
Suchen nach einer Ladeeinheitsposition anhand der übergebenen Parameter

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| PartieId | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLaEiArtikelValue

**Kurzbeschreibung:**  
Holt den Wert des übergebenen Feldes und Indexes für den Artikel

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Index | long | optional | `0` |
| Null_Werte | bool | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLaEiValue

**Kurzbeschreibung:**  
Holt den Wert des übergebenen Feldes aus der Ladeeinheit

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLaEiNVE

**Kurzbeschreibung:**  
Setzen der NVE

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| NVE | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLaEiDeAktiv

**Kurzbeschreibung:**  
Setzen des Aktiv Status

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Aktiv | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLaEiHoehe

**Kurzbeschreibung:**  
Setzen der Höhe

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Hoehe | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLaEiBreite

**Kurzbeschreibung:**  
Setzen der Breite

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Breite | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLaEiLaenge

**Kurzbeschreibung:**  
Setzen der Länge

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Laenge | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLaEiBewegungInformation

**Kurzbeschreibung:**  
Setzt Ladeeinheitspositionsbewegungsinformationen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Index | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### MoveLaEiPositionToLaEi

**Kurzbeschreibung:**  
Verschiebt eine Ladeeinheitsposition auf eine andere Ladeeinheit

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| FromGuid | string | ja | `—` |
| ToGuid | string | ja | `—` |
| Position | long | ja | `0` |
| KeepSourcePosition | bool | optional | `false` |

**Rückgabe:** long

---

### BeendeLadeeinheitListe

**Kurzbeschreibung:**  
Beendet alle noch vorhandenen Ladeeinheiten in Liste

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | ja | `0` |
| NeueNummer | bool | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeLadeeinheit

**Kurzbeschreibung:**  
Abschluss der Ladeeinheit

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | ja | `0` |
| NeueNummer | bool | optional | `1` |

**Rückgabe:** long

---

### StartLokalitaet

**Kurzbeschreibung:**  
Liest Parameter LokalitaetsNr, NeuAnlage, KopieLokalitaetsNr und ruft m_LvsHalter->Load_Lokalitaet() auf; prueft dass keine Lokalitaet in Bearbeitung ist. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LokalitaetsNr | long | ja | `0` |
| NeuAnlage | bool | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AddLokalitaetMaschinenArtikel

**Kurzbeschreibung:**  
Liest ArtikelId und ArtikelTyp und ruft m_Lokalitaet->Add_MaschinenArtikel() auf; gibt dessen Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ArtikelId | long | ja | `0` |
| ArtikelTyp | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DelLokalitaetMaschinenArtikel

**Kurzbeschreibung:**  
Liest Index und ruft m_Lokalitaet->Del_MaschinenArtikel(Index) auf; gibt dessen Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLokalitaetMaschinenArtikelAnzahl

**Kurzbeschreibung:**  
Ruft m_Lokalitaet->get_AnzahlMaschinenArtikel() auf und liefert die Anzahl per JPP_LONG_RET zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### GetValueLokalitaet

**Kurzbeschreibung:**  
Liest Feld, holt per m_Lokalitaet->get_LokalitaetValue(Feld) ein F_FELD und gibt es via set_retFields() zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValueLokalitaetMaschinenArtikel

**Kurzbeschreibung:**  
Liest Feld und Index, holt per m_Lokalitaet->get_MaschinenArtikelValue(Index,Feld) ein F_FELD und gibt es via set_retFields() zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |
| Index | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValueLokalitaet

**Kurzbeschreibung:**  
Liest Feld und Wert und ruft m_Lokalitaet->Set_LokalitaetValue(Feld,Wert) auf; gibt dessen Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Feld | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValueLokalitaetMaschinenArtikel

**Kurzbeschreibung:**  
Liest Index, Feld und Wert und ruft m_Lokalitaet->Set_MaschinenArtikelValue(Index,Feld,Wert) auf; gibt dessen Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Index | long | ja | `0` |
| Feld | string | ja | `—` |
| Wert | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeLokalitaet

**Kurzbeschreibung:**  
Liest Parameter Speichern und ruft m_LvsHalter->Close_Lokalitaet(Speichern) auf; gibt dessen Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartLokalitaetGruppe

**Kurzbeschreibung:**  
Läd eine Lokalitätengruppe

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| LokalitaetGruppenNr | long | optional | `0` |
| NeuAnlage | bool | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLokalitaetGruppeBreite

**Kurzbeschreibung:**  
Setzt die Breite einer Lokalitätengruppe

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Breite | long | ja | `2` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetLokalitaetGruppeBreite

**Kurzbeschreibung:**  
Holt die Breite eienr Lokalitätengruppe

_Keine Parameter._

**Rückgabe:** long

---

### BeendeLokalitaetGruppe

**Kurzbeschreibung:**  
Speichert die Lokalitätengruppe

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Speichern | bool | optional | `0` |

**Rückgabe:** long

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
