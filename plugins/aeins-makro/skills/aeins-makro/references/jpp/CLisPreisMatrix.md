# Dokumentation: CLisPreisMatrix

**Datei:** `a1aeins/JLisPrMat.cpp`  
**Klasse:** `CLisPreisMatrix`  
**Zweck:** Listenpreis-Matrix-Bearbeitung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Listenpreis-Matrix-Bearbeitung

---

## Methodenübersicht

### Init

**Kurzbeschreibung:**  
Initialisierung für neue Matrix-Bearbeitung

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetMatrixNummer

**Kurzbeschreibung:**  
Matrix-Nummer setzen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| MATNR | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetMatrixNummer

**Kurzbeschreibung:**  
Matrix-Nummer lesen

_Keine Parameter._

**Rückgabe:** bool

---

### SetMatrixBezeich

**Kurzbeschreibung:**  
Matrix-Bezeichnung übergeben

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| TEXT | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetMatrixBezeich

**Kurzbeschreibung:**  
Matrix-Bezeichnung lesen

_Keine Parameter._

**Rückgabe:** bool

---

### LiesMatrixZeilen

**Kurzbeschreibung:**  
Preislisten<->Preisklassen-Zuordnungen einlesen

_Keine Parameter._

**Rückgabe:** bool

---

### GetErrorCount

**Kurzbeschreibung:**  
Anzahl der Fehlertexte in der Fehlerliste ermitteln

_Keine Parameter._

**Rückgabe:** long

---

### GetLastErrorStr

**Kurzbeschreibung:**  
Den letzten Fehlertext abrufen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetErrorListStr

**Kurzbeschreibung:**  
den i-ten Fehlertext der Fehlerliste abrufen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AnzeigeFehler

**Kurzbeschreibung:**  
Fehlerbildschirm anzeigen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
