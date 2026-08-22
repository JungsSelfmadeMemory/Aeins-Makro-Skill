# Dokumentation: JA1Extern

**Datei:** `a1aeins/JA1Extern.cpp`  
**Klasse:** `JA1Extern`  
**Zweck:** A1Extern Wrapper  
**Verwendung:** Über JPL/JPP-Interface  

> ⚙️ Automatisch aus dem Quellcode generiert (JPP_METHOD / JPP_*-Parameter / JPP_GetParam). Beschreibungen mit _(ergänzt)_ stammen aus `beschreibungen.json`. Generierte Dateien nicht von Hand editieren — bei Code-Änderungen neu generieren.

---

## Übersicht

A1Extern Wrapper

---

## Methodenübersicht

### SetzeTestModus

**Kurzbeschreibung:**  
A1Extern Wrapper : SetzeTestModus

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| TestModus | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AWInit

**Kurzbeschreibung:**  
A1Extern Wrapper : AWInit

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AWGetIdx

**Kurzbeschreibung:**  
A1Extern Wrapper : AWGetIdx

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| idnr | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AWGetNextId

**Kurzbeschreibung:**  
A1Extern Wrapper : AWGetNextId

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AWGetSelCount

**Kurzbeschreibung:**  
A1Extern Wrapper : AWGetSelCount

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### AWRefresh

**Kurzbeschreibung:**  
A1Extern Wrapper : AWRefresh

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### BeendeVorgangMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : BeendeVorgangMethode

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### CtrlStringParser

**Kurzbeschreibung:**  
A1Extern Wrapper : CtrlStringParser

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| jplStr | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeletePosMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : DeletePosMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### DeleteWaPosMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : DeleteWaPosMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ErsetzePosMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : ErsetzePosMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handleALT | handle | ja | `0` |
| handleNEU | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FindKontextMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : FindKontextMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ktxName | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### FindPosMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : FindPosMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### Flush

**Kurzbeschreibung:**  
A1Extern Wrapper : Flush

_Keine Parameter._

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetAnzeigeModusMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetAnzeigeModusMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFirstPosMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetFirstPosMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetFirstWaPosMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetFirstWaPosMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKompXMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetKompXMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| posi | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetKtxValMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetKtxValMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ktx | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |
| size | long | optional | `255` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetNextPosMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetNextPosMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetPosTypeMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetPosTypeMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValPosDoubleMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValPosDoubleMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValPosDoubleByNameMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValPosDoubleByNameMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| name | string | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValPosLongMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValPosLongMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValPosLongByNameMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValPosLongByNameMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| name | string | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValPosStrMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValPosStrMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |
| size | long | optional | `255` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValPosStrByNameMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValPosStrByNameMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| name | string | ja | `0` |
| size | long | optional | `255` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValLongMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValLongMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValDoubleMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValDoubleMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValStrMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValStrMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |
| size | long | optional | `255` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValZuAbDoubleMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValZuAbDoubleMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| zhandle | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### GetValZuAbLongMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : GetValZuAbLongMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| zhandle | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HSTLCreateInfoObjMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : HSTLCreateInfoObjMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| phandle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HSTLNachbehandlungStkListe

**Kurzbeschreibung:**  
A1Extern Wrapper : HSTLNachbehandlungStkListe

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| shandle | handle | ja | `0` |
| phandle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HSTLGetInfoObjMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : HSTLGetInfoObjMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| phandle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HSTLGetSubInfoObjMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : HSTLGetSubInfoObjMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| phandle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HSTLGetFirstIterMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : HSTLGetFirstIterMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| shandle | handle | ja | `0` |
| phandle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### HSTLSetHauptWarenposition

**Kurzbeschreibung:**  
A1Extern Wrapper : HSTLSetHauptWarenposition

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| shandle | handle | ja | `0` |
| phandle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### KorrekturStandardVorgang

**Kurzbeschreibung:**  
A1Extern Wrapper : KorrekturStandardVorgang

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| id | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### KtxExecMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : KtxExecMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ktx | handle | ja | `0` |
| topic | long | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LadeVorgangIdMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : LadeVorgangIdMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| id | long | ja | `0` |
| check | bool | ja | `TRUE` |
| frBu | bool | ja | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LadeVorgangMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : LadeVorgangMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| nr | long | ja | `0` |
| klasse | long | ja | `0` |
| jahr | long | ja | `0` |
| frBu | bool | optional | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LeerzeileNeuMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : LeerzeileNeuMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### LieferscheinAusAuftrag

**Kurzbeschreibung:**  
A1Extern Wrapper : LieferscheinAusAuftrag

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| vID | long | ja | `0` |
| ErrDlg | bool | ja | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### OhneMakroNachlaufMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : OhneMakroNachlaufMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| b | bool | ja | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### OhneMakroKontrollMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : OhneMakroKontrollMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| b | bool | ja | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### OhneMakroTestMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : OhneMakroTestMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| b | bool | ja | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### OhneMakroAISMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : OhneMakroAISMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| b | bool | ja | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### OhneMakroAllMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : OhneMakroAllMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| b | bool | ja | `TRUE` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosAnfuegenMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : PosAnfuegenMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosAusPosMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : PosAusPosMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| phandle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PosEinfuegenVorMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : PosEinfuegenVorMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| phandle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### PositionNeuMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : PositionNeuMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| artikelId | long | ja | `0` |
| menge | real | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### RezeptPreisMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : RezeptPreisMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetKtxValMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetKtxValMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| ktx | handle | ja | `0` |
| topic | long | ja | `0` |
| value | string | ja | `—` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValDoubleMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValDoubleMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | real | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValLongMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValLongMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | long | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValStrMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValStrMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | string | ja | `—` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValPosDoubleMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValPosDoubleMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | real | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValPosDoubleByNameMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValPosDoubleByNameMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | real | ja | `0` |
| name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValPosLongMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValPosLongMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | long | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValPosLongByNameMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValPosLongByNameMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | long | ja | `0` |
| name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValPosStrMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValPosStrMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | string | ja | `—` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValPosStrByNameMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValPosStrByNameMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | string | ja | `—` |
| name | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SetValZuAbDoubleMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : SetValZuAbDoubleMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| topic | long | ja | `0` |
| value | real | ja | `0` |
| param | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StartVorgangMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : StartVorgangMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| kunr | long | ja | `0` |
| vnr | long | ja | `0` |
| klasse | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### StatusZeile

**Kurzbeschreibung:**  
A1Extern Wrapper : StatusZeile

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| text | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SVPOSI_GetPosHandle

**Kurzbeschreibung:**  
A1Extern Wrapper : SVPOSI_GetPosHandle

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| svposi | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SVPOSI_GetVorgHandle

**Kurzbeschreibung:**  
A1Extern Wrapper : SVPOSI_GetVorgHandle

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| svposi | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SVPOSI_InsertPosition

**Kurzbeschreibung:**  
A1Extern Wrapper : SVPOSI_InsertPosition

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| svposi | handle | ja | `0` |
| neu | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SVPOSI_ReplacePosition

**Kurzbeschreibung:**  
A1Extern Wrapper : SVPOSI_ReplacePosition

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| svposi | handle | ja | `0` |
| alt | handle | ja | `0` |
| neu | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### SVPOSI_UngetVorgHandle

**Kurzbeschreibung:**  
A1Extern Wrapper : SVPOSI_UngetVorgHandle

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| svposi | handle | ja | `0` |
| v | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### TextNeuMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : TextNeuMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| text | string | ja | `—` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### VorgangDruckMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : VorgangDruckMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### VorgangStornoMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : VorgangStornoMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### VorgangsUmwandlung

**Kurzbeschreibung:**  
A1Extern Wrapper : VorgangsUmwandlung

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| v_id | long | ja | `0` |
| funktion | long | ja | `0` |
| fehler_behandlung | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WPAddZusatzZeileMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : WPAddZusatzZeileMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| pHandle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WPAnzZusatzZeileMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : WPAnzZusatzZeileMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| i | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WPDelZusatzZeileMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : WPDelZusatzZeileMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| typ | long | ja | `0` |
| i | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WPGetZusatzZeileMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : WPGetZusatzZeileMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |
| typ | long | ja | `0` |
| i | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### WPLoescheTextMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : WPLoescheTextMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| handle | handle | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### ZeilenZuAbExMethode

**Kurzbeschreibung:**  
A1Extern Wrapper : ZeilenZuAbExMethode

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| vhandle | handle | ja | `0` |
| txt | string | ja | `—` |
| zuab | real | ja | `0` |
| typ | long | ja | `0` |
| formel | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### jam_i_getfield

**Kurzbeschreibung:**  
A1Extern Wrapper : jam_i_getfield

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| buffer | string | ja | `—` |
| fieldName | string | ja | `—` |
| occur | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

### jam_i_putfield

**Kurzbeschreibung:**  
A1Extern Wrapper : jam_i_putfield

| Parameter | Typ | Pflicht | Default |
|-----------|-----|---------|---------|
| buffer | string | ja | `—` |
| fieldName | string | ja | `—` |
| occur | long | ja | `0` |

**Rückgabe:** bool (Erfolg/Misserfolg)

---

**Generiert mit `generate_jpp_docs.py` aus dem A.eins-Quellcode.**
