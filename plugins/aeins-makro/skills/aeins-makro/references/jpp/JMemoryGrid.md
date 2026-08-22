# Dokumentation: JMemoryGrid

**Datei:** `a1aeins/MemoryGrid.cpp`  
**Klasse:** `JMemoryGrid`  
**Zweck:** Griddaten in Memory verwalten  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Griddaten in Memory verwalten

---

## Methodenübersicht

### Init

**Kurzbeschreibung:**  
Muss direkt nach New aufgerufen werden. Parameter: GridName, guidName

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| gridName | string | optional | `—` |
| guidName | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### ToMem

**Kurzbeschreibung:**  
Werte vom Grid in die Memory

_Keine Parameter._

**Rückgabe:** bool

---

### FromMem

**Kurzbeschreibung:**  
Werte aus dem Speicher zurück ins Grid

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| guid | string | optional | `—` |
| occ | long | optional | `—` |
| callBack | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### DeleteMem

**Kurzbeschreibung:**  
Zeile wird aus dem Speicher gelöscht. Parameter ist die GUID

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| guid | string | optional | `—` |
| callBack | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### GetValue

**Kurzbeschreibung:**  
Liefert einen Wert zurück für die Zeile, in der die CallBackLoop gerade steht. Parameter ist eine JPLFunktion

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| fieldName | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

### Compare

**Kurzbeschreibung:**  
Vergleicht alle Felder dieses Grid mit BSHandel mit einem anderen MemoryGrid. Parameter BSHandle, JPPHandle, BSHandleCMP

| Parameter | Typ | Pflicht | Default |  
|-----------|-----|---------|---------|
| bsHandle | string | optional | `—` |
| bsHandleCmpWith | string | optional | `—` |
| jppHandleCmpWith | string | optional | `—` |

_(aus JPP_GetParam; Default/Pflicht ggf. ungenau)_

**Rückgabe:** bool

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
