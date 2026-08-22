# Dokumentation: CAllgemeinStapel

**Datei:** `a1aeins/Stapelverarbeitung.cpp`  
**Klasse:** `CAllgemeinStapel`  
**Zweck:** Klasse für die allgemeine Stapelverwaltung  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Klasse für die allgemeine Stapelverwaltung

---

## Methodenübersicht

### setBezeichnung

**Kurzbeschreibung:**  
Bezeichnung für Stapel setzen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Bezeichnung | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### setPrivat

**Kurzbeschreibung:**  
Stapel auf global oder privat setzen

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### setKategorie

**Kurzbeschreibung:**  
Kategorie für den Stapel festlegen.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### setText

**Kurzbeschreibung:**  
Beschrigung für den Stapel setzen.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Text | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### setVerfalldatum

**Kurzbeschreibung:**  
Wann der Stapel automatisch gelöscht wird.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Verfalldatum | string | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### addItem

**Kurzbeschreibung:**  
Fügt Eintrag zum Stapel hinzu.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |
| ID_1 | string | ja | `—` |
| ID_2 | string | optional | `—` |
| ID_3 | string | optional | `—` |
| ID_4 | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### removeItem

**Kurzbeschreibung:**  
Entfernt Eintrag aus dem Stapel

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |
| ID_1 | string | optional | `—` |
| ID_2 | string | optional | `—` |
| ID_3 | string | optional | `—` |
| ID_4 | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### createStapel

**Kurzbeschreibung:**  
Legt einen Stapel in der Datenbank an. Die Nummer wird zurückgegeben(0 falls ein Fehler aufgetreten ist).

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Bezeichnung | string | ja | `0` |

**Rückgabe:** long

---

### deleteStapel

**Kurzbeschreibung:**  
Löscht den geladenen	Stapel KOMPLETT!

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### updateStapel

**Kurzbeschreibung:**  
Speichert die Stapelwerte in der Datenbank.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### stapelInfo

**Kurzbeschreibung:**  
Liest die Werte zu einer ID aus dem Stapel .

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ID | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### getIdentSql

**Kurzbeschreibung:**  
liefert >StapelIdentName = NameDesIdentFeldes< für SQL.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| IdentNumber | long | ja | `0` |

**Rückgabe:** string

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
