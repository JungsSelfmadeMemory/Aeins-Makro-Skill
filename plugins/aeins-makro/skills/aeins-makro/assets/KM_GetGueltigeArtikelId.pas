/*------------------------------------------------------------
=pod
=head1 KM_GetGueltigeArtikelId

 Allgemeingültige Helferfunktion: liefert zu Artikelnummer + Lagernummer die
 passende, im gegebenen Kontext BUCHBARE ArtikelId zurück – oder 0, wenn es
 keinen gültigen Eintrag gibt.

   FUNCTION GetGueltigeArtikelId(sArtNr:STRING; iLager:INTEGER;
                                 sDatum:STRING; iKlasse:INTEGER) : INTEGER;

 Prüft (kombiniert aus CheckArtikel + JRC_VorgangImport.ArtikelCheck):
  1. Existiert der Artikel im Ziellager? Wenn nicht und AUTO_KOPIEREN=1, wird er
     per AMIC_ArtikelKopie(ArtikelId, Lager) dorthin kopiert.
  2. Klassenabhängige Sperre:
       Vorgangsklasse  < 1000  = Verkauf                          -> ArtikelFaktSperr darf nicht 1 sein
       Vorgangsklasse >= 1000  = Einkauf UND interne Belege        -> ArtikelBestSperr darf nicht 1 sein
                                 (Produktion/Umbuchung = wie Einkauf)
  3. Gültigkeitszeitraum: sDatum muss zwischen ArtikelAbDatum und ArtikelBisDatum liegen.

 Rückgabe: ArtikelId (>0) wenn buchbar, sonst 0.
 Bei Rückgabe 0 wird IMMER ein FehlerProtokoll-Eintrag geschrieben (Bereich = Makroname,
 Text = Übergabeparameter + die gelesenen Artikel-Werte), damit der Grund erkennbar ist.

 Aufrufparameter des Testrahmens (immer string):
   p1 = Artikelnummer, p2 = Lagernummer, p3 = Datum (TT.MM.JJJJ), p4 = Vorgangsklasse

 WICHTIG: AMIC_ArtikelKopie schreibt in die DB (INSERT). Läuft in der A.eins-Engine;
 zuerst in einer TESTdatenbank ausführen. AUTO_KOPIEREN=0 setzen, um nur zu prüfen.

 bearbeitet: 2026-08-11 | KJ | Erstanlage
=cut
------------------------------------------------------------*/
PROGRAM KM_GetGueltigeArtikelId(p1; p2; p3; p4);

CONST
   AUTO_KOPIEREN = 1;                          // 1 = fehlenden Artikel ins Ziellager kopieren, 0 = nur prüfen
   MAKRONAME     = "KM_GetGueltigeArtikelId";  // Bereich für Fehlerprotokoll

VAR
   sMsg : STRING;
   iId  : INTEGER;

   /*--------------------------------------------------------------------------
     Liefert die buchbare ArtikelId oder 0. Eigene Puffer/Cursor, damit die
     Funktion frei von Seiteneffekten auf aufrufende Cursor bleibt.
   --------------------------------------------------------------------------*/
   FUNCTION GetGueltigeArtikelId(sArtNr : STRING; iLager : INTEGER;
                                 sDatum : STRING; iKlasse : INTEGER) : INTEGER;
   VAR
      sSql        : STRING;
      sBuf        : STRING;
      sAb         : STRING;
      sBis        : STRING;
      sLog        : STRING;
      iArtId      : INTEGER;
      iGefundenId : INTEGER;
      iFaktSperr  : INTEGER;
      iBestSperr  : INTEGER;
      iRes        : INTEGER;
   BEGIN
      sSql := ALLOC(2048);
      sBuf := ALLOC(256);
      sAb  := ALLOC(64);
      sBis := ALLOC(64);
      sLog := ALLOC(2048);
      iArtId      := 0;
      iGefundenId := 0;
      iFaktSperr  := 0;
      iBestSperr  := 0;
      STRCPY(sAb, "");
      STRCPY(sBis, "");

      // --- 1) Artikel im Ziellager suchen ---
      SPRINTF(sSql, "SELECT ArtikelId"
                    "     , ArtikelFaktSperr"
                    "     , ArtikelBestSperr"
                    "     , ArtikelAbDatum"
                    "     , ArtikelBisDatum"
                    "  FROM Artikel"
                    " WHERE Artikelnummer   = '%s'"
                    "   AND Lagernummer     = %d"
                    "   AND ArtikelLoeKennz = 0", sArtNr, iLager);
      iRes := SELECT("gaid_art", sSql);

      // --- 1a) nicht im Ziellager -> ggf. aus anderem Lager kopieren ---
      IF iRes = 0 THEN BEGIN
         CloseCursor("gaid_art");
         IF AUTO_KOPIEREN = 1 THEN BEGIN
            SPRINTF(sSql, "SELECT ArtikelId"
                          "  FROM Artikel"
                          " WHERE Artikelnummer   = '%s'"
                          "   AND ArtikelLoeKennz = 0"
                          " ORDER BY Lagernummer", sArtNr);
            iRes := SELECT("gaid_any", sSql);
            IF iRes <> 0 THEN BEGIN
               Get("gaid_any", "ArtikelId", sBuf);
               SPRINTF(sSql, "call AMIC_ArtikelKopie(%d, %d)", STRTOINT(sBuf), iLager);
               SQL(sSql);
               SQL("COMMIT");
            END;
            CloseCursor("gaid_any");

            // erneut im Ziellager lesen
            SPRINTF(sSql, "SELECT ArtikelId"
                          "     , ArtikelFaktSperr"
                          "     , ArtikelBestSperr"
                          "     , ArtikelAbDatum"
                          "     , ArtikelBisDatum"
                          "  FROM Artikel"
                          " WHERE Artikelnummer   = '%s'"
                          "   AND Lagernummer     = %d"
                          "   AND ArtikelLoeKennz = 0", sArtNr, iLager);
            iRes := SELECT("gaid_art", sSql);
         END;
      END;

      // --- 2) Sperren + 3) Gültigkeit prüfen ---
      IF iRes <> 0 THEN BEGIN
         Get("gaid_art", "ArtikelId",        sBuf);  iGefundenId := STRTOINT(sBuf);  iArtId := iGefundenId;
         Get("gaid_art", "ArtikelFaktSperr", sBuf);  iFaktSperr := STRTOINT(sBuf);
         Get("gaid_art", "ArtikelBestSperr", sBuf);  iBestSperr := STRTOINT(sBuf);
         Get("gaid_art", "ArtikelAbDatum",   sAb);   STRALLTRIM(sAb);
         Get("gaid_art", "ArtikelBisDatum",  sBis);  STRALLTRIM(sBis);

         // 2) klassenabhängige Sperre:
         //    < 1000  = Verkauf                                  -> ArtikelFaktSperr
         //    >= 1000 = Einkauf UND interne Belege (Produktion/   -> ArtikelBestSperr
         //              Umbuchung werden wie Einkauf behandelt)
         IF iKlasse < 1000 THEN BEGIN
            IF iFaktSperr = 1 THEN BEGIN
               iArtId := 0;                    // Verkauf gesperrt
            END;
         END ELSE BEGIN
            IF iBestSperr = 1 THEN BEGIN
               iArtId := 0;                    // Einkauf / interne Buchung gesperrt
            END;
         END;

         // 3) Gültigkeitszeitraum (nur wenn Ab-/Bis-Datum gesetzt)
         IF iArtId <> 0 THEN BEGIN
            IF (STRLEN(sAb) > 0) AND (STRLEN(sBis) > 0) THEN BEGIN
               SPRINTF(sSql, "SELECT IF date('%s') BETWEEN date('%s') AND date('%s')"
                             "          THEN 1 ELSE 0 ENDIF AS wert FROM dummy",
                             sDatum, sAb, sBis);
               GetDBWert(sBuf, sSql);
               IF STRTOINT(sBuf) = 0 THEN BEGIN
                  iArtId := 0;                 // Datum außerhalb Ab..Bis
               END;
            END;
         END;
      END;
      CloseCursor("gaid_art");

      // Kein buchbarer Artikel -> Fehlerprotokoll (Bereich = Makroname) mit
      // Übergabeparametern + gaid_art-Werten, damit der Grund erkennbar ist.
      IF iArtId = 0 THEN BEGIN
         SPRINTF(sLog, "Kein buchbarer Artikel. Parameter: ArtNr=%s Lager=%d Datum=%s Klasse=%d"
                       " | Artikel: ArtikelId=%d FaktSperr=%d BestSperr=%d AbDatum=%s BisDatum=%s",
                       sArtNr, iLager, sDatum, iKlasse,
                       iGefundenId, iFaktSperr, iBestSperr, sAb, sBis);
         FehlerProtokoll(30, MAKRONAME, sLog);
      END;

      FREE(sSql);
      FREE(sBuf);
      FREE(sAb);
      FREE(sBis);
      FREE(sLog);
      GetGueltigeArtikelId := iArtId;          // R7: letzte Zeile, beendet die Funktion
   END;

   /*--- R4: Puffer des Hauptprogramms ---*/
   PROCEDURE Init();
   BEGIN
      sMsg := ALLOC(1024);
   END;

   PROCEDURE Cleanup();
   BEGIN
      FREE(sMsg);
   END;

BEGIN
   Init();

   // Testrahmen: Parameter -> Funktion aufrufen -> Ergebnis zeigen
   iId := GetGueltigeArtikelId(p1, STRTOINT(p2), p3, STRTOINT(p4));

   IF iId = 0 THEN BEGIN
      SPRINTF(sMsg, "Kein gültiger/buchbarer Artikel: Nr %s, Lager %s, Datum %s, Klasse %s.",
                    p1, p2, p3, p4);
   END ELSE BEGIN
      SPRINTF(sMsg, "Buchbare ArtikelId = %d (Nr %s, Lager %s, Klasse %s).",
                    iId, p1, p2, p4);
   END;
   MessageBox(sMsg, "GetGueltigeArtikelId", 1);

   Cleanup();
END.
