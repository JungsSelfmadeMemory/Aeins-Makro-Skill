/*------------------------------------------------------------
=pod
=head1 KM_ProduktionAnlegen_mitPruefung

 Wie KM_ProduktionAnlegen, aber mit vorgeschalteter Artikel-Prüfung über die
 Helferfunktion GetGueltigeArtikelId(): erst wird geprüft, ob der Artikel im
 Ziellager buchbar ist (Existenz/ggf. Kopie + Sperre je Vorgangsklasse +
 Gültigkeitszeitraum). Nur bei Erfolg wird die Produktion angelegt.

 Aufrufparameter (string):
   p1 = Artikelnummer, p2 = Lagernummer, p3 = Menge

 WICHTIG: läuft in der A.eins-Engine; erzeugt Beleg und (bei AUTO_KOPIEREN=1)
 einen Artikel-Kopiervorgang -> zuerst TESTdatenbank. KLASSE_PRODUKTION (5220)
 ggf. an die Installation anpassen.

 bearbeitet: 2026-08-11 | KJ | Erstanlage
=cut
------------------------------------------------------------*/
PROGRAM KM_ProduktionAnlegen_mitPruefung(p1; p2; p3; p4);

CONST
   KLASSE_PRODUKTION = 5220;    // Vorgangsklasse Produktion (>=2000 = interne Buchung)
   UNTERKLASSE       = 0;
   ID_PRODTYP        = 4204;    // Produktionstyp (Kopf)
   AUTO_KOPIEREN     = 1;       // 1 = fehlenden Artikel ins Ziellager kopieren, 0 = nur prüfen
   MAKRONAME         = "KM_ProduktionAnlegen_mitPruefung";   // Bereich für Fehlerprotokoll

VAR
   sArtikelNr : STRING;
   sDatum     : STRING;
   sMsg       : STRING;
   iLagerNr   : INTEGER;
   rMenge     : REAL;
   iArtId     : INTEGER;
   iVorgang   : INTEGER;
   iProdukt   : INTEGER;
   iVID       : INTEGER;

   /*--------------------------------------------------------------------------
     Liefert die buchbare ArtikelId oder 0. Kombiniert Existenz/Lagerkopie
     (CheckArtikel) mit klassenabhängiger Sperre + Gültigkeit (ArtikelCheck).
     Eigene Puffer/Cursor -> keine Seiteneffekte auf aufrufende Cursor.
   --------------------------------------------------------------------------*/
   FUNCTION GetGueltigeArtikelId(sArtNr : STRING; iLager : INTEGER;
                                 sPruefDat : STRING; iKlasse : INTEGER) : INTEGER;
   VAR
      sSql        : STRING;
      sBuf        : STRING;
      sAb         : STRING;
      sBis        : STRING;
      sLog        : STRING;
      iArt        : INTEGER;
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
      iArt        := 0;
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
         Get("gaid_art", "ArtikelId",        sBuf);  iGefundenId := STRTOINT(sBuf);  iArt := iGefundenId;
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
               iArt := 0;                      // Verkauf gesperrt
            END;
         END ELSE BEGIN
            IF iBestSperr = 1 THEN BEGIN
               iArt := 0;                      // Einkauf / interne Buchung gesperrt
            END;
         END;

         // 3) Gültigkeitszeitraum (nur wenn Ab-/Bis-Datum gesetzt)
         IF iArt <> 0 THEN BEGIN
            IF (STRLEN(sAb) > 0) AND (STRLEN(sBis) > 0) THEN BEGIN
               SPRINTF(sSql, "SELECT IF date('%s') BETWEEN date('%s') AND date('%s')"
                             "          THEN 1 ELSE 0 ENDIF AS wert FROM dummy",
                             sPruefDat, sAb, sBis);
               GetDBWert(sBuf, sSql);
               IF STRTOINT(sBuf) = 0 THEN BEGIN
                  iArt := 0;                   // Datum außerhalb Ab..Bis
               END;
            END;
         END;
      END;
      CloseCursor("gaid_art");

      // Kein buchbarer Artikel -> Fehlerprotokoll (Bereich = Makroname) mit
      // Übergabeparametern + gaid_art-Werten, damit der Grund erkennbar ist.
      IF iArt = 0 THEN BEGIN
         SPRINTF(sLog, "Kein buchbarer Artikel. Parameter: ArtNr=%s Lager=%d Datum=%s Klasse=%d"
                       " | Artikel: ArtikelId=%d FaktSperr=%d BestSperr=%d AbDatum=%s BisDatum=%s",
                       sArtNr, iLager, sPruefDat, iKlasse,
                       iGefundenId, iFaktSperr, iBestSperr, sAb, sBis);
         FehlerProtokoll(30, MAKRONAME, sLog);
      END;

      FREE(sSql);
      FREE(sBuf);
      FREE(sAb);
      FREE(sBis);
      FREE(sLog);
      GetGueltigeArtikelId := iArt;            // R7: letzte Zeile
   END;

   /*--- R4: Puffer des Hauptprogramms ---*/
   PROCEDURE Init();
   BEGIN
      sArtikelNr := ALLOC(256);
      sDatum     := ALLOC(32);
      sMsg       := ALLOC(1024);
   END;

   PROCEDURE Cleanup();
   BEGIN
      FREE(sArtikelNr);
      FREE(sDatum);
      FREE(sMsg);
   END;

BEGIN
   Init();

   STRCPY(sArtikelNr, p1);
   STRALLTRIM(sArtikelNr);
   iLagerNr := STRTOINT(p2);
   rMenge   := STRTOREAL(p3);

   IF STRLEN(sArtikelNr) = 0 THEN BEGIN
      MessageBox("Keine Artikelnummer übergeben (Parameter 1).", "Produktion anlegen", 1);
      Cleanup();
      EXIT;
   END;

   // Prüfdatum = heute (deutsches Format)
   GetDBWert(sDatum, "SELECT DATEFORMAT(TODAY(*),'DD.MM.YYYY') AS wert FROM dummy");
   STRALLTRIM(sDatum);

   // --- Artikel prüfen: Existenz/Kopie + Sperre (Produktionsklasse) + Gültigkeit ---
   iArtId := GetGueltigeArtikelId(sArtikelNr, iLagerNr, sDatum, KLASSE_PRODUKTION);
   IF iArtId = 0 THEN BEGIN
      SPRINTF(sMsg, "Artikel '%s' ist im Lager %d zum %s nicht buchbar (fehlt/gesperrt/ungültig).",
                    sArtikelNr, iLagerNr, sDatum);
      MessageBox(sMsg, "Produktion anlegen", 1);
      Cleanup();
      EXIT;
   END;

   // --- Produktion anlegen ---
   SetKlassNum(KLASSE_PRODUKTION);
   SetUKlassNum(UNTERKLASSE);

   iVorgang := StartVorgang(0, 0);
   IF iVorgang = 0 THEN BEGIN
      MessageBox("Produktion konnte nicht gestartet werden (StartVorgang).", "Produktion anlegen", 1);
      Cleanup();
      EXIT;
   END;

   SetValue(iVorgang, ID_PRODTYP, "1", 0);

   iProdukt := ProduktNeu(iVorgang, sArtikelNr, iLagerNr, rMenge);
   IF iProdukt = 0 THEN BEGIN
      SPRINTF(sMsg, "Produktartikel '%s' (Lager %d) konnte nicht angelegt werden.",
                    sArtikelNr, iLagerNr);
      MessageBox(sMsg, "Produktion anlegen", 1);
      BeendeVorgang(iVorgang, 0, 0);
      Cleanup();
      EXIT;
   END;

   PositionAdd(iVorgang);

   iVID := BeendeVorgang(iVorgang, 1, 0);
   IF iVID = 0 THEN BEGIN
      MessageBox("Die Produktion konnte nicht gespeichert werden.", "Produktion anlegen", 1);
   END ELSE BEGIN
      SPRINTF(sMsg, "Produktion angelegt: Artikel %s (ArtikelId %d), Lager %d, Menge %10.3f, V_ID %d.",
                    sArtikelNr, iArtId, iLagerNr, rMenge, iVID);
      MessageBox(sMsg, "Produktion anlegen", 1);
   END;

   Cleanup();
END.
