# Dokumentation: JNachhaltigkeit

**Datei:** `a1aeins/Warenpos_nachhaltigkeit.cpp`  
**Klasse:** `JNachhaltigkeit`  
**Zweck:** Nachhaltigkeit  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Nachhaltigkeit

---

## Methodenübersicht

### AddToList

**Kurzbeschreibung:**  
Prueft WABEWID, sucht via FindWaPos; legt bei Bedarf neue Nachhaltigkeit::Erweiterung an und traegt sie in m_WaPosMap ein. Gibt true zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ClearList

**Kurzbeschreibung:**  
Ruft ClearInternalList() zum Leeren der Liste (loescht Objekte ohne Speichern). Gibt true zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RemoveFromList

**Kurzbeschreibung:**  
Findet Eintrag zu WABEWID; bei SAVE schreibt Write(), loescht dann das Objekt und entfernt es aus m_WaPosMap. true wenn entfernt. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| SAVE | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CountList

**Kurzbeschreibung:**  
Gibt eine Anzahl per JPP_LONG_RET zurueck; Wert ist fest 0 (Berechnung auskommentiert). Gibt TRUE zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** long

---

### LoadList

**Kurzbeschreibung:**  
Iteriert m_WaPosMap und ruft je Eintrag Erweiterung->Read(id, true) zum Laden der Daten. Gibt true zurueck. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SaveList

**Kurzbeschreibung:**  
Iteriert m_WaPosMap, ruft je Eintrag Write(); bei MITKETTE zusaetzlich UpdateKette(). Gibt true zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| MITKETTE | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CheckList

**Kurzbeschreibung:**  
Iteriert m_WaPosMap und ruft MasseBilanzCheck() je Eintrag; bei Fehler smx_fehler(massebilanz_nicht_eingerichtet). Gibt false wenn ein Check scheitert. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FirstItemInList

**Kurzbeschreibung:**  
Setzt m_actIterator auf m_WaPosMap.begin(); true wenn Liste nicht leer. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### NextItemInList

**Kurzbeschreibung:**  
Rueckt m_actIterator vor; true wenn danach noch ein gueltiges Element folgt. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValue

**Kurzbeschreibung:**  
Holt Erweiterung via GetWaPosOrIterator(WABEWID), ruft GetValue(Topic, Param) und setzt Ergebnis per JPP_SetJppRet. true bei Erfolg. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValue

**Kurzbeschreibung:**  
Holt Erweiterung via GetWaPosOrIterator(WABEWID), ruft PutValue(Wert, Topic, Param). true bei Erfolg. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### InitDefalutValues

**Kurzbeschreibung:**  
Holt Erweiterung via GetWaPosOrIterator und ruft InitDefalutValues(ObserveChanges, ObserveSpa, Korrektur). true bei Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| OBSERVECHANGES | long | optional | `0` |
| OBSERVESPA | long | optional | `0` |
| KORREKTUR | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ResetValues

**Kurzbeschreibung:**  
Holt Erweiterung via GetWaPosOrIterator und ruft ResetValues(ReInit). true bei Erfolg. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| REINIT | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RefreshMassebilanz

**Kurzbeschreibung:**  
Holt Erweiterung via GetWaPosOrIterator(WABEWID) und ruft RefreshMassebilanz(). true bei Erfolg. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RefreshZertifikat

**Kurzbeschreibung:**  
Holt Erweiterung via GetWaPosOrIterator(WABEWID) und ruft RefreshZertifikat(). true bei Erfolg. _(ergänzt)_

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
