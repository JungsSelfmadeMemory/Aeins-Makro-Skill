# JPP-Klassenreferenz

> **128 JPP-Klassen · 1626 Methoden.** Je Klasse eine Datei unter [`jpp/`](jpp/) mit allen
> Methoden inkl. **Übergabeparametern** (Typ · Pflicht · Default) und Rückgabe. Aus dem
> A.eins-Quellcode generiert.

JPP-Objekte spricht man aus dem Makro über die Brücke an: `JPPNEW(hdl,"Klasse")` →
Eingaben `JPPINI`(Integer)/`JPPINR`(Real)/`JPPINS`(String) → `JPPEX(hdl,"Methode")` (bool) bzw.
`JPPDO(hdl,"Methode",buf,len)` (mit Ergebnis) → `JPPDELETE(hdl)`. Details/Konzept: Entwicklerhandbuch Abschnitt 7.

## Wichtige Helfer

| Klasse | Zweck | Methoden |
|---|---|---|
| [CProduktHelper](jpp/CProduktHelper.md) | Produktions Unterstützung | 9 |
| [CRwVorgHelper](jpp/CRwVorgHelper.md) | Rohware-Vorgangs Unterstützung | 118 |
| [CUmbuchungsHelper](jpp/CUmbuchungsHelper.md) | Umbuchungs Unterstützung | 7 |
| [CVorgangsHelper](jpp/CVorgangsHelper.md) | Vorgangs Unterstützung | 146 |
| [JA1Extern](jpp/JA1Extern.md) | A1Extern Wrapper | 84 |
| [JAnwendReport](jpp/JAnwendReport.md) | Methoden zum bebuchen der Kostenstellen | 57 |
| [JFileSystem](jpp/JFileSystem.md) | Filesystem-Unterstützung für JPL | 39 |
| [JVars](jpp/JVars.md) | Geordnete Speicherangelegenheiten | 91 |

## Alle Klassen (alphabetisch)

| Klasse | Zweck | Methoden |
|---|---|---|
| [A1netJamHelper](jpp/A1netJamHelper.md) | a1netpub-Helper | 1 |
| [ArchivVolltext](jpp/ArchivVolltext.md) | Volltext-Funktionen | 1 |
| [CAllgemeinStapel](jpp/CAllgemeinStapel.md) | Klasse für die allgemeine Stapelverwaltung | 12 |
| [CHelper](jpp/CHelper.md) | Ib und AW Unterstützung | 71 |
| [CLisPreisMatrix](jpp/CLisPreisMatrix.md) | Listenpreis-Matrix-Bearbeitung | 10 |
| [CProduktHelper](jpp/CProduktHelper.md) | Produktions Unterstützung | 9 |
| [CRwVorgHelper](jpp/CRwVorgHelper.md) | Rohware-Vorgangs Unterstützung | 118 |
| [CUmbuchungsHelper](jpp/CUmbuchungsHelper.md) | Umbuchungs Unterstützung | 7 |
| [CVorgangsHelper](jpp/CVorgangsHelper.md) | Vorgangs Unterstützung | 146 |
| [CWidgetNavigator](jpp/CWidgetNavigator.md) | Klasse für die Positionierung von Widgets | 34 |
| [DruckerTest](jpp/DruckerTest.md) | Funktionstest eines Druckers | 1 |
| [JA1Extern](jpp/JA1Extern.md) | A1Extern Wrapper | 84 |
| [JA1NETDrv](jpp/JA1NETDrv.md) | Nettes | 1 |
| [JActiveX](jpp/JActiveX.md) | Organisierter ActiveX-Anschluss für JPL | 9 |
| [JAMICAR](jpp/JAMICAR.md) | AMICAR Behandlung | 1 |
| [JAnwCond](jpp/JAnwCond.md) | Methoden zum bebuchen der Kostenstellen | 6 |
| [JAnwendReport](jpp/JAnwendReport.md) | Methoden zum bebuchen der Kostenstellen | 57 |
| [JArchivExport](jpp/JArchivExport.md) | Archiv exportieren | 1 |
| [JAW](jpp/JAW.md) | Helper für JPL und VBS | 0 |
| [JAWSQLPrepare](jpp/JAWSQLPrepare.md) | Vorbereitung eines Auswahllisten SQL ohne GUI | 14 |
| [JBehandlungsSchema](jpp/JBehandlungsSchema.md) | Elara Steuerungs-JPP-Objekt | 6 |
| [JBinary](jpp/JBinary.md) | Binary-Unterstützung für JPL | 3 |
| [JBitPfleger](jpp/JBitPfleger.md) | Bit orientierer CheckBox Pfleger für JPL | 3 |
| [JBoxNavigator](jpp/JBoxNavigator.md) | Box-Navigator | 4 |
| [JCache](jpp/JCache.md) | JCache Cache-JPP-Objekt | 1 |
| [JCashFunktion](jpp/JCashFunktion.md) | JPP-Objekt zur Berechtigung von Funktionen in SVPOSBAR2 | 3 |
| [JCashZahlung](jpp/JCashZahlung.md) | JPP-Objekt zur Abwicklung von Zahlungen | 24 |
| [JCodeVerifier](jpp/JCodeVerifier.md) | Jam Support Funktionen zum Verifizieren von jpl Code | 0 |
| [JComportCommunication](jpp/JComportCommunication.md) | JPP-Klasse zur COM-Port-Kommunikation, die Befehle (Set/Open/Close/Write/Read) über einen owner-JVars-Kontext sammelt und per NET::CS("Communication", owner) an den CS-Teil delegiert. _(ergänzt)_ | 6 |
| [JComPorts](jpp/JComPorts.md) | Ports für JPL | 6 |
| [JDatenquelle](jpp/JDatenquelle.md) | Datenquelle | 1 |
| [JDatum](jpp/JDatum.md) | Geordnete Datumtrivialitäten | 2 |
| [JDBase](jpp/JDBase.md) | Datenbankkapriolen | 7 |
| [JDBF_Parameter](jpp/JDBF_Parameter.md) | Pfleger für Parameterübergaben an Datenbankfunkionen | 1 |
| [JDBP_Param](jpp/JDBP_Param.md) | JPP-Objekt zum Aufbau eines Aufrufs privater DB-Prozeduren: legt per StartProzedurname ein DBP_Parameter mit Prozedurnamen an, setzt mit SetzeParameter Parameterwerte und erzeugt mit StartErstellung via DBP_Parameter::MakeCall() den Aufruf-String, den es in JVAR_PRIVATEDBPROZEDUR ablegt. _(ergänzt)_ | 3 |
| [JDBX](jpp/JDBX.md) | DBX | 4 |
| [JDLL_Load](jpp/JDLL_Load.md) | DLL-Load für JPL | 4 |
| [JDom](jpp/JDom.md) | DOM Unterstützung  für JPP | 12 |
| [JEtikettenDruck](jpp/JEtikettenDruck.md) | JPP-Wrapper für AMIC-Etiekttendruck (aka LILA) | 6 |
| [JExec](jpp/JExec.md) | JPL und Makro-Routinen | 3 |
| [JFA](jpp/JFA.md) | Formulararchiv | 1 |
| [JFA_Import](jpp/JFA_Import.md) | FA externe Datei importieren | 9 |
| [JFA_Manager](jpp/JFA_Manager.md) | FAM für JPL | 6 |
| [JFA_PdfMerge](jpp/JFA_PdfMerge.md) | FA Pdf mergen | 2 |
| [JFA_View](jpp/JFA_View.md) | FA Viewer | 5 |
| [JFAExIm](jpp/JFAExIm.md) | JFAExIm Behandlung | 1 |
| [JFiBuBuchen](jpp/JFiBuBuchen.md) | Methoden zum Buchen von Zinsabrechnungen | 2 |
| [JFileSystem](jpp/JFileSystem.md) | Filesystem-Unterstützung für JPL | 39 |
| [JFiZaBu](jpp/JFiZaBu.md) | Methoden zum Buchen von Zinsabrechnungen | 6 |
| [JFiZiBu](jpp/JFiZiBu.md) | Methoden zum Buchen von Zinsabrechnungen | 2 |
| [JFormat](jpp/JFormat.md) | j! Format-Spezialitäten | 3 |
| [JFTP](jpp/JFTP.md) | File-Transport-Protokoll | 1 |
| [JGDIFiBu](jpp/JGDIFiBu.md) | Methoden zum Einlesen einer Datei der GDI-Finanzbuchhaltung | 6 |
| [JGebinde](jpp/JGebinde.md) | Gebinde-Unterstützung für JPL | 5 |
| [JGridMaker](jpp/JGridMaker.md) | Grids mit daten füllen und für Anwender erweitern | 20 |
| [JHalter](jpp/JHalter.md) | JPP-Klasse zur Produktionserfassung/-korrektur: startet via SVMAIN modale Erfassungs-/Korrektur-Dialoge (ProduktionErfassungModal/ProduktionKorrekturModal) und liefert deren Ergebnisfelder (SAVED, BELEGNUMMER, KLASSE, UKLASSE, JAHRNUMMER). _(ergänzt)_ | 3 |
| [JIdent](jpp/JIdent.md) | Geordnete Ident-Trivialitäten | 0 |
| [JIntrastat](jpp/JIntrastat.md) | Intrastat | 2 |
| [JJam](jpp/JJam.md) | Jam Support Funktionen | 18 |
| [JKassDisp](jpp/JKassDisp.md) | Stellt Methoden zur Ansteuerung des Kassendisplays bereit | 6 |
| [JKontraktHalter](jpp/JKontraktHalter.md) | Kontrakthalter | 36 |
| [JKostenSumme](jpp/JKostenSumme.md) | Methoden zum bebuchen der Kostenstellen / KOstenträger /Kostenarten | 2 |
| [JKostenTraegerSumme](jpp/JKostenTraegerSumme.md) | Methoden zum bebuchen der Kostenstellen | 3 |
| [JKostStelSumme](jpp/JKostStelSumme.md) | Methoden zum bebuchen der Kostenstellen | 3 |
| [JKtrSollMengenPflege](jpp/JKtrSollMengenPflege.md) | Stellt Methoden zur Pflege von Kontraktsollmengen im Kontraktpflegemodul bereit | 39 |
| [JListView](jpp/JListView.md) | ListView-Unterstützung für JPL | 11 |
| [JLvsHalter](jpp/JLvsHalter.md) | Lagerverwaltungssystemhalter | 52 |
| [JME_LISTE](jpp/JME_LISTE.md) | Gebindebehandlung für JPL | 7 |
| [JMemoryGrid](jpp/JMemoryGrid.md) | Griddaten in Memory verwalten | 6 |
| [JMessageContainer](jpp/JMessageContainer.md) | JPP-Wrapper um einen AmicMessage::CMessageContainer; macht das Erzeugen, Setzen (Hinweis/Warnung/Fehler), Zählen und Anzeigen von Protokoll-/Nachrichten aus JPL skriptbar. _(ergänzt)_ | 7 |
| [JMessageRouter](jpp/JMessageRouter.md) | Jam Message Routing | 1 |
| [JModulSequencer](jpp/JModulSequencer.md) | Aufruf Steuerung von Modulen in einer JPL Anwendung | 24 |
| [JNachhaltigkeit](jpp/JNachhaltigkeit.md) | Nachhaltigkeit | 15 |
| [JNewsticker](jpp/JNewsticker.md) | Newsticker | 1 |
| [JParam](jpp/JParam.md) | Parameterspezialitäten | 7 |
| [JPartie](jpp/JPartie.md) | JPP-Klasse zur Partie-Verwaltung in Vorgaengen: Partie-Existenz/Artikelposition pruefen, Artikel zuordnen/hinzufuegen/verproben und neue Partien anlegen ueber einen CPartieHalter. _(ergänzt)_ | 12 |
| [JPartienNachtragen](jpp/JPartienNachtragen.md) | Sammelt WABEWID-/V_ID-Belege (Einzel-Id, ganzer Vorgang oder via CHelper aus markierter Auswahlliste), bestimmt/lockt die zugehoerigen Vorgaenge und startet ueber StartDialog das nachtraegliche Verteilen von Partien. _(ergänzt)_ | 4 |
| [JPartieVertDLGAccess](jpp/JPartieVertDLGAccess.md) | JPP-Zugriffsklasse auf den aktiven Kontext CPartieVerteilDlg (PARTIEVERTEILDLG); stellt Methoden zum Abfragen von Werten (GetValue) und zum Hinzufuegen/Modifizieren von Partieeintraegen (SetzePartie) der Partieverteilung bereit. _(ergänzt)_ | 2 |
| [JPartieVerteilGrid](jpp/JPartieVerteilGrid.md) | PartieVerteilungsDlg | 18 |
| [JPermInventurHelper](jpp/JPermInventurHelper.md) | Stellt Methoden zur Permanenten Inventur bereit | 5 |
| [JPfleger](jpp/JPfleger.md) | Stamdatenpfleger aufruf | 7 |
| [JPPAnwendGrid](jpp/JPPAnwendGrid.md) | Methoden zum Anzeigen eines Grids nach Auswahllistenefinition | 32 |
| [JppArtikelStKopierer](jpp/JppArtikelStKopierer.md) | JPL-Unterstützung zum Duplizieren von Artikelstammen incl. aktuellem Artikel | 55 |
| [JPPBemerkung](jpp/JPPBemerkung.md) | Methoden zum lesen und schreiben von Bemerkungstexten | 4 |
| [JppPartiePositionVerfolgung](jpp/JppPartiePositionVerfolgung.md) | Partie-Positions-Verfolgung | 46 |
| [JppRWPA_Pfleger](jpp/JppRWPA_Pfleger.md) | Rohwareparameter-Pflege-Unterstützung | 38 |
| [JppRwWaageBeleg](jpp/JppRwWaageBeleg.md) | Erzeugung von Rohware-Belegen aus Waage | 6 |
| [JppTest](jpp/JppTest.md) | allgemeine Testereien mit JPP-Objekten | 1 |
| [JPrinter](jpp/JPrinter.md) | In Sachen der Druckerfreiheit | 6 |
| [JPrinterInfos](jpp/JPrinterInfos.md) | Drucker Schnittstellen | 4 |
| [JProgger](jpp/JProgger.md) | Jam Progger Funktionen | 4 |
| [JPW](jpp/JPW.md) | PW | 5 |
| [JRegister](jpp/JRegister.md) | Register-Unterstützung für JPL | 1 |
| [JRegistry](jpp/JRegistry.md) | Server-Registry-Unterstützung für JPL | 12 |
| [JScreen](jpp/JScreen.md) | Informelles | 1 |
| [JScripting](jpp/JScripting.md) | Scripting | 3 |
| [JService](jpp/JService.md) | Aeins Service-Dienste | 5 |
| [JSockets](jpp/JSockets.md) | Sockets für JPL | 2 |
| [JSon](jpp/JSon.md) | JPP-Wrapper um JsonMaker zum schrittweisen Aufbau eines JSON-Strings (_json) aus JVars und zum Zurueckschreiben in eine JVar. _(ergänzt)_ | 7 |
| [JStoffStromErweiterung](jpp/JStoffStromErweiterung.md) | StoffstromDaten-Helper | 56 |
| [JStrings](jpp/JStrings.md) | Geordnete Stringtrivialitäten | 16 |
| [JSvLiToRwLi](jpp/JSvLiToRwLi.md) | JPL-Unterstützung zum Wandeln von StandardVorgangs-Lieferungen in Rohware-Lieferungen | 5 |
| [JSystem](jpp/JSystem.md) | Systemspezifika | 29 |
| [JTab](jpp/JTab.md) | Tabcontrol | 2 |
| [JTapi](jpp/JTapi.md) | Tapi für JPL | 18 |
| [JTcpIp](jpp/JTcpIp.md) | TCPIP-Clienten für JPL | 6 |
| [JTCPIP_Scanner](jpp/JTCPIP_Scanner.md) | Funktionalitäten für den TCPIP-Scanner | 9 |
| [JTcpIpServer](jpp/JTcpIpServer.md) | TCPIP-Server für JPL | 5 |
| [JTcpServices](jpp/JTcpServices.md) | TCPIP-Services für A.eins | 4 |
| [JTeilUmwandlung](jpp/JTeilUmwandlung.md) | Teilumwandlung durchführen | 17 |
| [JUmwandlung](jpp/JUmwandlung.md) | UmwandlungDialog | 2 |
| [JVars](jpp/JVars.md) | Geordnete Speicherangelegenheiten | 91 |
| [JVorgKlammer](jpp/JVorgKlammer.md) | Vorgangsklammer | 12 |
| [JVorgPosMarkier](jpp/JVorgPosMarkier.md) | Warenpositionszeilen und Partien markieren | 3 |
| [JVorgResClearing](jpp/JVorgResClearing.md) | JPL-Unterstützung, Vorgangsnummern zu abgebrochenen Vorgängen in die Reserveliste zu übernehmen | 4 |
| [JVPST](jpp/JVPST.md) | Verpostungs-Info-Objekt | 2 |
| [JWaage](jpp/JWaage.md) | Waage-Angelegenheiten | 1 |
| [JWaagenprofil](jpp/JWaagenprofil.md) | Waagenprofil | 1 |
| [JWabewAddon](jpp/JWabewAddon.md) | WarenbewegungAddon | 3 |
| [JWatchDog](jpp/JWatchDog.md) | Watchdog für JPL | 2 |
| [JWebBrowser](jpp/JWebBrowser.md) | Steuerung eines WebControls | 2 |
| [JWidgetToJson](jpp/JWidgetToJson.md) | JWidgetToJson: Maskendaten als Json-String | 1 |
| [JWordWrap](jpp/JWordWrap.md) | Wordwrap-Unterstützung für JPL und ah | 3 |
| [JWordWrapHelper](jpp/JWordWrapHelper.md) | Word-Wrap Helper | 2 |
| [JWorkFlow](jpp/JWorkFlow.md) | WorkFlow | 1 |
| [JXML](jpp/JXML.md) | JPP-Wrapper zum schrittweisen Aufbau eines EANCOM-XML-Dokuments (MSXML2-DOM) und dessen Anzeige/Speichern als Datei. _(ergänzt)_ | 2 |
| [KontraktAnlage](jpp/KontraktAnlage.md) | Anlegen von Kontrakten | 13 |
| [windownavigator](jpp/windownavigator.md) | Klasse fürs Fensterhandling | 1 |
