/*------------------------------------------------------------
=pod
=head1 KM_AuftraegeGenerieren

 Legt fuer jeden Kunden mit KundTyp = 1 einen Verkaufsauftrag mit
 5 Positionen an. Die Artikel stammen aus der Tabelle Artikel, die
 Bestellmenge je Position wird zufaellig (MENGE_MIN..MENGE_MAX) ermittelt.

 Technik: JPP-Objekt CVorgangsHelper (wie in LegeVorgangAn / HauVoll):
   KundNummer/Klasse/UnterKlasse -> StartVorgang
   je Position: ArtikelId + Menge -> PositionNeu -> PositionAdd
   Speichern = 1 -> BeendeVorgang

 WICHTIG:
 - Laeuft NUR in der A.eins-Makro-Engine (CVorgangsHelper ist an die
   Anwendung gebunden), nicht via reinem ODBC.
 - Erzeugt echte Belege. Zuerst in einer TESTdatenbank ausfuehren!
 - KLASSE ggf. an die Installation anpassen (siehe CONST unten).

 bearbeitet: 2026-08-11 | KJ | Erstanlage
=cut
------------------------------------------------------------*/
PROGRAM KM_AuftraegeGenerieren;

CONST
   KLASSE_AUFTRAG = 400;    // Vorgangsklasse Verkaufsauftrag (V_klassnummer 400).
                            // Hinweis: die Demos LegeVorgangAn/HauVoll nutzen 700 -
                            // Wert bei Bedarf an die eigene Installation anpassen.
   UNTERKLASSE    = 0;
   ANZ_POSITIONEN = 5;      // Positionen je Auftrag
   MENGE_MIN      = 1;      // Zufallsmenge untere Grenze
   MENGE_MAX      = 99;     // Zufallsmenge obere Grenze
   ID_V_DATUM     = 103;    // Kopffeld Vorgangsdatum (DateTime), Format TT.MM.JJJJ
   HDL            = "vh";   // frei gewaehlter JPP-Objekt-Handle
   MAKRONAME      = "KM_AuftraegeGenerieren";   // Bereich für Fehlerprotokoll

VAR
   sSql        : STRING;
   sBuf        : STRING;
   sHdl        : STRING;
   sErgebnis   : STRING;
   sDatum      : STRING;
   iKundNr     : INTEGER;
   iLastKund   : INTEGER;
   iArtikelId  : INTEGER;
   iLastArt    : INTEGER;
   iMenge      : INTEGER;
   iPos        : INTEGER;
   iRet        : INTEGER;
   iAnzAuftrag : INTEGER;

   /*--- R4: alle String-Puffer am Anfang holen ---*/
   PROCEDURE Init();
   BEGIN
      sSql      := ALLOC(4*1024);
      sBuf      := ALLOC(1024);
      sHdl      := ALLOC(64);
      sErgebnis := ALLOC(64);
      sDatum    := ALLOC(32);
   END;

   /*--- R4: alle String-Puffer am Ende freigeben ---*/
   PROCEDURE Cleanup();
   BEGIN
      FREE(sSql);
      FREE(sBuf);
      FREE(sHdl);
      FREE(sErgebnis);
      FREE(sDatum);
   END;

   /*--- Naechste KundNummer (KundTyp=1) groesser als iLast, 0 = keine mehr.
        Paginierung, damit kein Cursor ueber BeendeVorgang/Commit offen bleibt. ---*/
   FUNCTION GetNaechsterKunde(iLast : INTEGER) : INTEGER;
   BEGIN
      SPRINTF(sSql, "SELECT TOP 1 KundNummer AS wert"
                    "  FROM Kundenstamm"
                    " WHERE KundTyp     = 1"
                    "   AND KundLoeKennz = 0"
                    "   AND KundNummer  > %d"
                    " ORDER BY KundNummer", iLast);
      GetDBWert(sBuf, sSql);
      STRALLTRIM(sBuf);
      GetNaechsterKunde := STRTOINT(sBuf);   // "" -> 0 = keine weitere Zeile
   END;

   /*--- Naechste ArtikelId groesser als iLast, 0 = keine mehr. ---*/
   FUNCTION GetNaechsterArtikel(iLast : INTEGER) : INTEGER;
   BEGIN
      SPRINTF(sSql, "SELECT TOP 1 ArtikelId AS wert"
                    "  FROM Artikel"
                    " WHERE ArtikelLoeKennz = 0"
                    "   AND ArtikelVK_Sperr = 0"
                    "   AND ArtikelId      > %d"
                    " ORDER BY ArtikelId", iLast);
      GetDBWert(sBuf, sSql);
      STRALLTRIM(sBuf);
      GetNaechsterArtikel := STRTOINT(sBuf);
   END;

   /*--- Zufaellige Menge MENGE_MIN..MENGE_MAX ueber SQL RAND(). ---*/
   FUNCTION GetZufallsMenge() : INTEGER;
   BEGIN
      SPRINTF(sSql, "SELECT CAST(RAND() * %d + %d AS INTEGER) AS wert FROM dummy",
                    MENGE_MAX - MENGE_MIN + 1, MENGE_MIN);
      GetDBWert(sBuf, sSql);
      STRALLTRIM(sBuf);
      GetZufallsMenge := STRTOINT(sBuf);
   END;

   /*--- Zufaelliges Vorgangsdatum im laufenden Kalenderjahr im deutschen
        Format TT.MM.JJJJ ermitteln und als Kopffeld (ID 103) setzen.
        Wichtig: Datumswerte immer als TT.MM.JJJJ-String uebergeben. ---*/
   PROCEDURE SetzeVorgangsdatum();
   BEGIN
      STRCPY(sSql, "SELECT DATEFORMAT("
                   "         DATEADD(day,"
                   "                 CAST(RAND() * DATEDIFF(day, YMD(YEAR(TODAY(*)),1,1),"
                   "                                             YMD(YEAR(TODAY(*))+1,1,1)) AS INT),"
                   "                 YMD(YEAR(TODAY(*)),1,1)),"
                   "         'DD.MM.YYYY') AS wert"
                   "  FROM dummy");
      GetDBWert(sDatum, sSql);
      STRALLTRIM(sDatum);

      iRet := JPPINI(sHdl, "ID",        ID_V_DATUM);   // Feld-ID Vorgangsdatum
      iRet := JPPINS(sHdl, "VALUE",     sDatum);       // Datumstext TT.MM.JJJJ
      iRet := JPPINI(sHdl, "PARAMETER", 0);
      iRet := JPPEX(sHdl, "SetValue");                 // Kopffeld setzen
   END;

   /*--- R10: KundNummer je Vorgangsklasse prüfen (1=erlaubt, 0=nicht).
        Interne Belege 5100..5220 -> KundNr muss 0 sein; VK (<1000) Debitor
        KundTyp IN (1,3); EK (>=1000) Kreditor KundTyp IN (2,3); jeweils
        KundLoeKennz=0, KundLiefSperr<=1, KundFaktSperr<=1. Bei 0 -> Fehlerprotokoll. ---*/
   FUNCTION KundeGueltig(iKundNr : INTEGER; iKlasse : INTEGER) : INTEGER;
   VAR
      sKgSql  : STRING;
      sKgBuf  : STRING;
      sKgLog  : STRING;
      iKgRes  : INTEGER;
      iErl    : INTEGER;
      iTyp    : INTEGER;
      iLoe    : INTEGER;
      iFakt   : INTEGER;
      iLief   : INTEGER;
   BEGIN
      sKgSql := ALLOC(1024);
      sKgBuf := ALLOC(256);
      sKgLog := ALLOC(1024);
      iErl := 0;  iTyp := -1;  iLoe := 0;  iFakt := 0;  iLief := 0;

      IF (iKlasse >= 5100) AND (iKlasse <= 5220) THEN BEGIN
         IF iKundNr = 0 THEN BEGIN
            iErl := 1;
         END;
      END ELSE BEGIN
         SPRINTF(sKgSql, "SELECT KundTyp"
                         "     , KundLoeKennz"
                         "     , KundFaktSperr"
                         "     , KundLiefSperr"
                         "  FROM Kundenstamm"
                         " WHERE KundNummer = %d", iKundNr);
         iKgRes := SELECT("kg_kunde", sKgSql);
         IF iKgRes <> 0 THEN BEGIN
            Get("kg_kunde", "KundTyp",       sKgBuf);  iTyp  := STRTOINT(sKgBuf);
            Get("kg_kunde", "KundLoeKennz",  sKgBuf);  iLoe  := STRTOINT(sKgBuf);
            Get("kg_kunde", "KundFaktSperr", sKgBuf);  iFakt := STRTOINT(sKgBuf);
            Get("kg_kunde", "KundLiefSperr", sKgBuf);  iLief := STRTOINT(sKgBuf);
            IF (iLoe = 0) AND (iLief <= 1) AND (iFakt <= 1) THEN BEGIN
               IF iKlasse < 1000 THEN BEGIN
                  IF (iTyp = 1) OR (iTyp = 3) THEN BEGIN  iErl := 1;  END;
               END ELSE BEGIN
                  IF (iTyp = 2) OR (iTyp = 3) THEN BEGIN  iErl := 1;  END;
               END;
            END;
         END;
         CloseCursor("kg_kunde");
      END;

      IF iErl = 0 THEN BEGIN
         SPRINTF(sKgLog, "Ungültige KundNummer %d (Klasse %d): KundLoeKennz=%d KundFaktSperr=%d"
                         " KundLiefSperr=%d KundTyp=%d",
                         iKundNr, iKlasse, iLoe, iFakt, iLief, iTyp);
         FehlerProtokoll(30, MAKRONAME, sKgLog);
      END;

      FREE(sKgSql);
      FREE(sKgBuf);
      FREE(sKgLog);
      KundeGueltig := iErl;
   END;

BEGIN
   Init();

   STRCPY(sHdl, HDL);
   iAnzAuftrag := 0;

   IF JPPNEW(sHdl, "CVorgangsHelper") = 1 THEN BEGIN

      iLastKund := -1;
      iKundNr   := GetNaechsterKunde(iLastKund);

      WHILE iKundNr <> 0 DO BEGIN
         iLastKund := iKundNr;

         // --- R10: KundNummer vor StartVorgang prüfen (Auftrag = VK) ---
         IF KundeGueltig(iKundNr, KLASSE_AUFTRAG) = 1 THEN BEGIN

         // --- Auftragskopf ---
         iRet := JPPINI(sHdl, "KundNummer",  iKundNr);
         iRet := JPPINI(sHdl, "Klasse",      KLASSE_AUFTRAG);
         iRet := JPPINI(sHdl, "UnterKlasse", UNTERKLASSE);

         IF JPPEX(sHdl, "StartVorgang") = 1 THEN BEGIN

            // --- Kopf: Vorgangsdatum zufaellig im laufenden Jahr (TT.MM.JJJJ) ---
            SetzeVorgangsdatum();

            // --- 5 Positionen: erste 5 gueltigen Artikel, Menge zufaellig ---
            iLastArt := -1;
            iPos     := 0;
            WHILE iPos < ANZ_POSITIONEN DO BEGIN
               iArtikelId := GetNaechsterArtikel(iLastArt);
               IF iArtikelId = 0 THEN BEGIN
                  EXIT;                       // keine weiteren Artikel mehr
               END;
               iLastArt := iArtikelId;
               iMenge   := GetZufallsMenge();

               iRet := JPPINI(sHdl, "ArtikelId", iArtikelId);
               iRet := JPPINI(sHdl, "Menge",     iMenge);
               IF JPPEX(sHdl, "PositionNeu") = 1 THEN BEGIN
                  iRet := JPPEX(sHdl, "PositionAdd");
                  iPos := iPos + 1;
               END;
            END;

            // --- Auftrag speichern/abschliessen (schliesst Kopf ab) ---
            iRet := JPPINI(sHdl, "Speichern", 1);
            STRCPY(sErgebnis, "");
            JPPDO(sHdl, "BeendeVorgang", sErgebnis, 64);
            iAnzAuftrag := iAnzAuftrag + 1;
         END;

         END;   // Ende R10-Prüfung (KundeGueltig) - bei 0 wurde Kunde übersprungen

         // naechster Kunde (Cursor der Abfrage ist bereits geschlossen)
         iKundNr := GetNaechsterKunde(iLastKund);
      END;

      JPPDELETE(sHdl);              // JPP-Objekt immer freigeben
   END ELSE BEGIN
      MessageBox("CVorgangsHelper konnte nicht angelegt werden.", "Fehler", 1);
   END;

   SPRINTF(sBuf, "Fertig. %d Auftraege angelegt.", iAnzAuftrag);
   MessageBox(sBuf, "KM_AuftraegeGenerieren", 1);

   Cleanup();
END.
