# Dokumentation: JFA_Manager

**Datei:** `a1aeins/JFA_Manager.cpp`  
**Klasse:** `JFA_Manager`  
**Zweck:** FAM für JPL  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

FAM für JPL

---

## Methodenübersicht

### GetMerkmal

**Kurzbeschreibung:**  
Liest JPP-Parameter 'Merkmal', ruft GetMerkmal(merkmal,&value) auf und gibt den ermittelten Wert via JPP_STRING_RET zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Merkmal | string | ja | `—` |

**Rückgabe:** string

---

### GetMandant

**Kurzbeschreibung:**  
Ruft GetHerkunftMandant() auf und gibt den Mandanten als String via JPP_STRING_RET zurück; liefert true. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### ExecSql

**Kurzbeschreibung:**  
Holt per GetMerkmal(merkmal) ein SQL, trimmt es, führt es als DB_CURSOR-select aus, fetcht fa_referenznummer und schreibt das Ergebnis ggf. via glb->SetzeMaskenFeld in Target. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Merkmal | string | ja | `—` |
| Target | string | optional | `—` |
| Occ | long | optional | `1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ExecFunc

**Kurzbeschreibung:**  
Ermittelt per Scalar-Query (fa_fakts/fa_fakts_fkt) eine Funktion, baut über GetSqlText(SEL_FA_REFERENZNUMMER[_n]) je nach parx ein SQL mit par1..par5, fetcht fa_referenznummer und liefert es via SetzeMaskenFeld/JVARS::SET/JPP_Return. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Merkmal | string | ja | `—` |
| Target | string | optional | `—` |
| Occ | long | optional | `1` |
| par1 | string | optional | `—` |
| par2 | string | optional | `—` |
| par3 | string | optional | `—` |
| par4 | string | optional | `—` |
| par5 | string | optional | `—` |
| parx | long | optional | `0` |
| target_owner | long | optional | `-1` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Referenz

**Kurzbeschreibung:**  
Setzt 1/0 je nach IsReferenz() (fam_archivaktiv==1 && fam_ziel==1) via JPP_STRING_RET; liefert true. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** string

---

### PrinterDaten

**Kurzbeschreibung:**  
Prüft FA_Handler::LizenzOK() und Merkmal fam_archivaktiv; bei aktiver Archivierung setzt Param('tempdir') via JVARS::SET und gibt 1/0 je nach leerem Zielpfad über JPP_Return zurück. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| printer | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
