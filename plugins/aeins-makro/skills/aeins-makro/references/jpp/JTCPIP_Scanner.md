# Dokumentation: JTCPIP_Scanner

**Datei:** `a1aeins/tcpip_scanner.cpp`  
**Klasse:** `JTCPIP_Scanner`  
**Zweck:** Funktionalitäten für den TCPIP-Scanner  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

Funktionalitäten für den TCPIP-Scanner

---

## Methodenübersicht

### Reset

**Kurzbeschreibung:**  
Liest JPP-Param ScanTyp und ruft m_TCPIP.Reset(ScanTyp) auf; gibt dessen bool-Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScanTyp | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValue

**Kurzbeschreibung:**  
Liest ScanTyp, AIKodierung, Value und ruft m_TCPIP.SetValue(ScanTyp, AIKodierung, Value) auf; gibt bool zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScanTyp | long | ja | `0` |
| AIKodierung | long | ja | `0` |
| Value | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValue

**Kurzbeschreibung:**  
Ruft m_TCPIP.GetValue(ScanTyp, AIKodierung, Value) auf; liefert Value bei nicht-leerem JPP_Return per JPP_Return zurueck; gibt bool zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScanTyp | long | ja | `0` |
| AIKodierung | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetXValue

**Kurzbeschreibung:**  
Ruft m_TCPIP.GetXValue(ScanTyp, AIKodierung, Value) auf; gibt Value via JPP_Return zurueck (falls nicht leer); liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScanTyp | long | ja | `0` |
| AIKodierung | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValue2

**Kurzbeschreibung:**  
Liest ScanTyp, AIKodierung, Value und ruft m_TCPIP.SetValue2(ScanTyp, AIKodierung, Value) auf; gibt bool zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScanTyp | long | ja | `0` |
| AIKodierung | long | ja | `0` |
| Value | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValue2

**Kurzbeschreibung:**  
Ruft m_TCPIP.GetValue2(ScanTyp, AIKodierung, Value) auf; gibt Value via JPP_Return zurueck (falls nicht leer); liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScanTyp | long | ja | `0` |
| AIKodierung | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetXValue2

**Kurzbeschreibung:**  
Ruft m_TCPIP.GetXValue2(ScanTyp, AIKodierung, Value) auf; gibt Value via JPP_Return zurueck (falls nicht leer); liefert bool. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScanTyp | long | ja | `0` |
| AIKodierung | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CheckAI

**Kurzbeschreibung:**  
Liest ScanTyp und ruft m_TCPIP.CheckAI(ScanTyp) auf; gibt dessen bool-Ergebnis zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScanTyp | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Dump

**Kurzbeschreibung:**  
Liest ScanTyp und ruft m_TCPIP.Dump(ScanTyp) auf; gibt immer true zurueck. _(ergänzt)_

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ScanTyp | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
