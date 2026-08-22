# Dokumentation: JVorgKlammer

**Datei:** `a1aeins/posklammer.cpp`  
**Klasse:** `JVorgKlammer`  
**Zweck:** Vorgangsklammer  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Vorgangsklammer

---

## Methodenübersicht

### StartKlammerWabew

**Kurzbeschreibung:**  
Starten einer neuen Klammerverwaltung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| wabewid | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AnzahlElementeWabew

**Kurzbeschreibung:**  
Anzahl der Klammerelemente

_Keine Parameter._

**Rückgabe:** long

---

### ListeLeerenWabew

**Kurzbeschreibung:**  
Entfernt die Klammerelemente aus der Liste

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### KlammerHinzufuegenWabew

**Kurzbeschreibung:**  
Anfügen einer neuen Klammer ans Ende der Liste

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| KlammerNr | long | ja | `0` |
| Menge | real | ja | `0` |
| Wert | real | ja | `0` |
| Klammertyp | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AbbrechenKlammerWabew

**Kurzbeschreibung:**  
Abbrechen einer Klammerverwaltung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeKlammerWabew

**Kurzbeschreibung:**  
Beenden der Klammerverwaltung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HoleNummerWabew

**Kurzbeschreibung:**  
Holt die Klammernummer des übergebenen Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** long

---

### HoleMengeWabew

**Kurzbeschreibung:**  
Holt die Menge des übergebenen Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** real

---

### HoleWertWabew

**Kurzbeschreibung:**  
Holt den Wert des übergebenen Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** real

---

### HoleKlammertypWabew

**Kurzbeschreibung:**  
Holt den Klammertypen des übergebenen Index

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** real

---

### HoleMengeManuelWabew

**Kurzbeschreibung:**  
Ist die Menge manuel eingegeben worden oder automatisch

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| index | long | ja | `0` |

**Rückgabe:** real

---

### SetzeVorgangKlammer

**Kurzbeschreibung:**  
Setzen der Klammer in einen Vorgang

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| v_Id | long | ja | `0` |
| KlammerNr | long | ja | `0` |

**Rückgabe:** long

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
