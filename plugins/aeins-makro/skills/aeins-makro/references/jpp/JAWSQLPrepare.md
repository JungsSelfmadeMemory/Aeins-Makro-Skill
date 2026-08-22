# Dokumentation: JAWSQLPrepare

**Datei:** `a1aeins/JAWSQLPrepare.cpp`  
**Klasse:** `JAWSQLPrepare`  
**Zweck:** Vorbereitung eines Auswahllisten SQL ohne GUI  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Vorbereitung eines Auswahllisten SQL ohne GUI

---

## Methodenübersicht

### LadeAnwendung

**Kurzbeschreibung:**  
Lade eine Anwendung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Anwendung | string | ja | `—` |
| Variante | string | optional | `—` |
| SystemProfil | string | optional | `STANDARDSYSTEMPROFIL` |
| Profil | string | optional | `—` |
| User | string | optional | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetzeCondition

**Kurzbeschreibung:**  
Setze eine Filterbedingung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Name | string | ja | `—` |
| Par1 | string | ja | `—` |
| Par2 | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LoescheCondition

**Kurzbeschreibung:**  
Lösche eine Filterbedingung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ErzeugeSQL

**Kurzbeschreibung:**  
erzeuge das SQL

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ErzeugeXML

**Kurzbeschreibung:**  
erzeuge ein ElaraXML und lege es in eine JVAR ab

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | ja | `0` |
| Name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ErzeugeAWXML

**Kurzbeschreibung:**  
erzeuge ein XML für die neue Auswahlliste und lege es in eine JVAR ab

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | ja | `0` |
| Name | string | ja | `—` |
| Anwendung | string | ja | `—` |
| Variante | string | optional | `—` |
| SystemProfil | string | optional | `STANDARDSYSTEMPROFIL` |
| Profil | string | optional | `—` |
| BedienerId | long | optional | `glb->BedienerId()` |
| DoInitialize | bool | optional | `FALSE` |
| StapelJoin | string | optional | `—` |
| StapelAktiv | bool | optional | `FALSE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ErzeugeIBXML

**Kurzbeschreibung:**  
für Itembox auf Infragisticsbasis: erzeuge ein XML und lege es in eine JVAR ab

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | ja | `0` |
| Name | string | ja | `—` |
| Variante | long | optional | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ShowIBXML

**Kurzbeschreibung:**  
für Itembox auf Infragisticsbasis: Positioniert und Dimensionen

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | ja | `0` |
| Name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ResultIBXML

**Kurzbeschreibung:**  
für Itembox auf Infragisticsbasis: Resultat der Itembox wird an die c++ Struktur übermittelt.

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| Owner | long | ja | `0` |
| Name | string | ja | `—` |
| Result | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### OriginalIBXML

**Kurzbeschreibung:**  
für Itembox auf Infragisticsbasis: Original wiederherstellen.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetLieblingsIBXML

**Kurzbeschreibung:**  
für Itembox auf Infragisticsbasis: Setzen der Lieblingsbox.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### UnterdrueckeAWVorbelegung

**Kurzbeschreibung:**  
Nach Bereichseingrenzung muss die Vorbelegung aus der vorherigen AW unterdrückt werden.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ReloadRequired

**Kurzbeschreibung:**  
Ein Flag,  der dafür sorgt, dass die Gridsettings (Position und Breite einer Spalte) neu geladen werden.

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SaveAwProfil

**Kurzbeschreibung:**  
Speichern des aktuellen Anwendungsprofils

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
