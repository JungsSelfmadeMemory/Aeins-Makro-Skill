/*------------------------------------------------------------
=pod
=head1 KM_RechnungAnlegen

 Legt eine Rechnung (Vorgangsklasse 700) an.

 Aufrufparameter (immer string; leer -> Default in Klammern):
   p1 = KundNummer      (Default 14766)
   p2 = Artikelnummer   (Default "12568")
   p3 = Menge           (Default 15; Dezimal mit Punkt, z. B. "12.5")
   p4 = Lagernummer     (Default 1 = Verkaufslager)

 Ablauf (regelkonform):
  - R10: KundNummer vor StartVorgang prüfen (Verkauf -> Debitor).
  - R9 : Artikelnummer -> gültige ArtikelId prüfen/auflösen (Verkauf -> Fakturiersperre,
         Gültigkeitszeitraum). KEIN Auto-Kopieren (AUTO_KOPIEREN=0) – eine Rechnung legt
         keine Artikel an.
  - Rechnung über JPP-Objekt CVorgangsHelper:
         KundNummer/Klasse/UnterKlasse -> StartVorgang -> ArtikelId+Menge -> PositionNeu/
         PositionAdd -> Speichern -> BeendeVorgang (liefert V_ID).

 WICHTIG:
  - Läuft in der A.eins-Makro-Engine (nicht via reinem ODBC). Erzeugt einen echten Beleg
    -> zuerst in einer TESTdatenbank ausführen!
  - Der CVorgangsHelper bucht die Position über die ArtikelId; die ArtikelId hängt an
    Artikelnummer + Lagernummer -> das richtige Verkaufslager (p4) angeben.
  - KLASSE_RECHNUNG (700) ist der Katalogwert aus VORGKLASSE; bei abweichender Installation prüfen.

 bearbeitet: 2026-08-11 | KJ | Erstanlage
=cut
------------------------------------------------------------*/
PROGRAM KM_RechnungAnlegen(p1; p2; p3; p4);

CONST
   STD_KUNDNUMMER    = 14766;      // Default, falls p1 leer
   STD_ARTIKELNUMMER = "12568";    // Default, falls p2 leer
   STD_MENGE         = 15;         // Default, falls p3 leer/0
   STD_LAGER         = 1;          // Default, falls p4 leer/0
   KLASSE_RECHNUNG   = 700;        // Vorgangsklasse Rechnung (VORGKLASSE)
   UNTERKLASSE       = 0;
   AUTO_KOPIEREN     = 0;          // 0 = fehlenden Artikel NICHT ins Lager kopieren (Rechnung!)
   HDL               = "vh";
   MAKRONAME         = "KM_RechnungAnlegen";

VAR
   sArtNr    : STRING;
   sDatum    : STRING;
   sHdl      : STRING;
   sErg      : STRING;
   sMsg      : STRING;
   rMenge    : REAL;
   iKundNr   : INTEGER;
   iLager    : INTEGER;
   iArtId    : INTEGER;
   iVID      : INTEGER;
   iRet      : INTEGER;

   PROCEDURE Init();
   BEGIN
      sArtNr := ALLOC(64);
      sDatum := ALLOC(32);
      sHdl   := ALLOC(64);
      sErg   := ALLOC(64);
      sMsg   := ALLOC(1024);
   END;

   PROCEDURE Cleanup();
   BEGIN
      FREE(sArtNr);
      FREE(sDatum);
      FREE(sHdl);
      FREE(sErg);
      FREE(sMsg);
   END;

   /*--- R10: KundNummer je Vorgangsklasse prüfen (1=erlaubt, 0=nicht). ---*/
   FUNCTION KundeGueltig(iKundArg : INTEGER; iKlasse : INTEGER) : INTEGER;
   VAR
      sKgSql : STRING; sKgBuf : STRING; sKgLog : STRING;
      iKgRes : INTEGER; iErl : INTEGER; iTyp : INTEGER; iLoe : INTEGER; iFakt : INTEGER; iLief : INTEGER;
   BEGIN
      sKgSql := ALLOC(1024); sKgBuf := ALLOC(256); sKgLog := ALLOC(1024);
      iErl := 0; iTyp := -1; iLoe := 0; iFakt := 0; iLief := 0;

      IF (iKlasse >= 5100) AND (iKlasse <= 5220) THEN BEGIN
         IF iKundArg = 0 THEN BEGIN iErl := 1; END;
      END ELSE BEGIN
         SPRINTF(sKgSql, "SELECT KundTyp"
                         "     , KundLoeKennz"
                         "     , KundFaktSperr"
                         "     , KundLiefSperr"
                         "  FROM Kundenstamm"
                         " WHERE KundNummer = %d", iKundArg);
         iKgRes := SELECT("kg_kunde", sKgSql);
         IF iKgRes <> 0 THEN BEGIN
            Get("kg_kunde", "KundTyp",       sKgBuf);  iTyp  := STRTOINT(sKgBuf);
            Get("kg_kunde", "KundLoeKennz",  sKgBuf);  iLoe  := STRTOINT(sKgBuf);
            Get("kg_kunde", "KundFaktSperr", sKgBuf);  iFakt := STRTOINT(sKgBuf);
            Get("kg_kunde", "KundLiefSperr", sKgBuf);  iLief := STRTOINT(sKgBuf);
            IF (iLoe = 0) AND (iLief <= 1) AND (iFakt <= 1) THEN BEGIN
               IF iKlasse < 1000 THEN BEGIN
                  IF (iTyp = 1) OR (iTyp = 3) THEN BEGIN  iErl := 1;  END;   // Verkauf -> Debitor
               END ELSE BEGIN
                  IF (iTyp = 2) OR (iTyp = 3) THEN BEGIN  iErl := 1;  END;   // Einkauf -> Kreditor
               END;
            END;
         END;
         CloseCursor("kg_kunde");
      END;

      IF iErl = 0 THEN BEGIN
         SPRINTF(sKgLog, "Ungültige KundNummer %d (Klasse %d): KundLoeKennz=%d KundFaktSperr=%d"
                         " KundLiefSperr=%d KundTyp=%d", iKundArg, iKlasse, iLoe, iFakt, iLief, iTyp);
         FehlerProtokoll(30, MAKRONAME, sKgLog);
      END;

      FREE(sKgSql); FREE(sKgBuf); FREE(sKgLog);
      KundeGueltig := iErl;
   END;

   /*--- R9: gültige, buchbare ArtikelId zu Artikelnummer+Lager (0 = nicht buchbar). ---*/
   FUNCTION GetGueltigeArtikelId(sGaArtNr : STRING; iGaLager : INTEGER; sGaDatum : STRING; iKlasse : INTEGER) : INTEGER;
   VAR
      sGaSql : STRING; sGaBuf : STRING; sAb : STRING; sBis : STRING; sGaLog : STRING;
      iArt : INTEGER; iGef : INTEGER; iFaktSperr : INTEGER; iBestSperr : INTEGER; iGaRes : INTEGER;
   BEGIN
      sGaSql := ALLOC(2048); sGaBuf := ALLOC(256); sAb := ALLOC(64); sBis := ALLOC(64); sGaLog := ALLOC(2048);
      iArt := 0; iGef := 0; iFaktSperr := 0; iBestSperr := 0;
      STRCPY(sAb, ""); STRCPY(sBis, "");

      SPRINTF(sGaSql, "SELECT ArtikelId"
                      "     , ArtikelFaktSperr"
                      "     , ArtikelBestSperr"
                      "     , ArtikelAbDatum"
                      "     , ArtikelBisDatum"
                      "  FROM Artikel"
                      " WHERE Artikelnummer   = '%s'"
                      "   AND Lagernummer     = %d"
                      "   AND ArtikelLoeKennz = 0", sGaArtNr, iGaLager);
      iGaRes := SELECT("ga_art", sGaSql);

      IF iGaRes = 0 THEN BEGIN
         CloseCursor("ga_art");
         IF AUTO_KOPIEREN = 1 THEN BEGIN
            SPRINTF(sGaSql, "SELECT ArtikelId FROM Artikel"
                            " WHERE Artikelnummer = '%s' AND ArtikelLoeKennz = 0"
                            " ORDER BY Lagernummer", sGaArtNr);
            iGaRes := SELECT("ga_any", sGaSql);
            IF iGaRes <> 0 THEN BEGIN
               Get("ga_any", "ArtikelId", sGaBuf);
               SPRINTF(sGaSql, "call AMIC_ArtikelKopie(%d, %d)", STRTOINT(sGaBuf), iGaLager);
               SQL(sGaSql); SQL("COMMIT");
            END;
            CloseCursor("ga_any");
            SPRINTF(sGaSql, "SELECT ArtikelId, ArtikelFaktSperr, ArtikelBestSperr, ArtikelAbDatum, ArtikelBisDatum"
                            "  FROM Artikel WHERE Artikelnummer = '%s' AND Lagernummer = %d AND ArtikelLoeKennz = 0",
                            sGaArtNr, iGaLager);
            iGaRes := SELECT("ga_art", sGaSql);
         END;
      END;

      IF iGaRes <> 0 THEN BEGIN
         Get("ga_art", "ArtikelId",        sGaBuf);  iGef := STRTOINT(sGaBuf);  iArt := iGef;
         Get("ga_art", "ArtikelFaktSperr", sGaBuf);  iFaktSperr := STRTOINT(sGaBuf);
         Get("ga_art", "ArtikelBestSperr", sGaBuf);  iBestSperr := STRTOINT(sGaBuf);
         Get("ga_art", "ArtikelAbDatum",   sAb);     STRALLTRIM(sAb);
         Get("ga_art", "ArtikelBisDatum",  sBis);    STRALLTRIM(sBis);

         // < 1000 = Verkauf -> ArtikelFaktSperr ; >= 1000 (Einkauf/intern) -> ArtikelBestSperr
         IF iKlasse < 1000 THEN BEGIN
            IF iFaktSperr = 1 THEN BEGIN  iArt := 0;  END;
         END ELSE BEGIN
            IF iBestSperr = 1 THEN BEGIN  iArt := 0;  END;
         END;

         IF iArt <> 0 THEN BEGIN
            IF (STRLEN(sAb) > 0) AND (STRLEN(sBis) > 0) THEN BEGIN
               SPRINTF(sGaSql, "SELECT IF date('%s') BETWEEN date('%s') AND date('%s')"
                               "          THEN 1 ELSE 0 ENDIF AS wert FROM dummy", sGaDatum, sAb, sBis);
               GetDBWert(sGaBuf, sGaSql);
               IF STRTOINT(sGaBuf) = 0 THEN BEGIN  iArt := 0;  END;
            END;
         END;
      END;
      CloseCursor("ga_art");

      IF iArt = 0 THEN BEGIN
         SPRINTF(sGaLog, "Kein buchbarer Artikel. Parameter: ArtNr=%s Lager=%d Datum=%s Klasse=%d"
                         " | Artikel: ArtikelId=%d FaktSperr=%d BestSperr=%d AbDatum=%s BisDatum=%s",
                         sGaArtNr, iGaLager, sGaDatum, iKlasse, iGef, iFaktSperr, iBestSperr, sAb, sBis);
         FehlerProtokoll(30, MAKRONAME, sGaLog);
      END;

      FREE(sGaSql); FREE(sGaBuf); FREE(sAb); FREE(sBis); FREE(sGaLog);
      GetGueltigeArtikelId := iArt;
   END;

BEGIN
   Init();

   // --- Parameter übernehmen (leer -> Default) ---
   iKundNr := STRTOINT(p1);   IF iKundNr = 0 THEN BEGIN iKundNr := STD_KUNDNUMMER; END;
   STRCPY(sArtNr, p2);        STRALLTRIM(sArtNr);
   IF STRLEN(sArtNr) = 0 THEN BEGIN STRCPY(sArtNr, STD_ARTIKELNUMMER); END;
   rMenge := STRTOREAL(p3);   IF rMenge <= 0 THEN BEGIN rMenge := STD_MENGE; END;
   iLager := STRTOINT(p4);    IF iLager = 0 THEN BEGIN iLager := STD_LAGER; END;

   // Prüfdatum = heute (deutsches Format)
   GetDBWert(sDatum, "SELECT DATEFORMAT(TODAY(*),'DD.MM.YYYY') AS wert FROM dummy");
   STRALLTRIM(sDatum);

   // --- R10: Kunde prüfen ---
   IF KundeGueltig(iKundNr, KLASSE_RECHNUNG) = 0 THEN BEGIN
      SPRINTF(sMsg, "KundNummer %d ist für eine Rechnung (Klasse %d) nicht zulässig.", iKundNr, KLASSE_RECHNUNG);
      MessageBox(sMsg, "Rechnung anlegen", 1);
      Cleanup();
      EXIT;
   END;

   // --- R9: Artikelnummer -> gültige ArtikelId ---
   iArtId := GetGueltigeArtikelId(sArtNr, iLager, sDatum, KLASSE_RECHNUNG);
   IF iArtId = 0 THEN BEGIN
      SPRINTF(sMsg, "Artikel '%s' (Lager %d) ist zum %s nicht buchbar (fehlt/gesperrt/ungültig).",
                    sArtNr, iLager, sDatum);
      MessageBox(sMsg, "Rechnung anlegen", 1);
      Cleanup();
      EXIT;
   END;

   // --- Rechnung anlegen (CVorgangsHelper) ---
   STRCPY(sHdl, HDL);
   IF JPPNEW(sHdl, "CVorgangsHelper") = 1 THEN BEGIN
      iRet := JPPINI(sHdl, "KundNummer",  iKundNr);
      iRet := JPPINI(sHdl, "Klasse",      KLASSE_RECHNUNG);
      iRet := JPPINI(sHdl, "UnterKlasse", UNTERKLASSE);

      IF JPPEX(sHdl, "StartVorgang") = 1 THEN BEGIN
         iRet := JPPINI(sHdl, "ArtikelId", iArtId);
         iRet := JPPINR(sHdl, "Menge",     rMenge);
         IF JPPEX(sHdl, "PositionNeu") = 1 THEN BEGIN
            iRet := JPPEX(sHdl, "PositionAdd");
         END;

         iRet := JPPINI(sHdl, "Speichern", 1);
         STRCPY(sErg, "");
         JPPDO(sHdl, "BeendeVorgang", sErg, 64);
         iVID := STRTOINT(sErg);

         IF iVID = 0 THEN BEGIN
            MessageBox("Die Rechnung konnte nicht gespeichert werden.", "Rechnung anlegen", 1);
         END ELSE BEGIN
            SPRINTF(sMsg, "Rechnung angelegt: Kunde %d, Artikel %s (ArtikelId %d), Menge %10.3f, V_ID %d.",
                          iKundNr, sArtNr, iArtId, rMenge, iVID);
            MessageBox(sMsg, "Rechnung anlegen", 1);
         END;
      END ELSE BEGIN
         MessageBox("StartVorgang (Rechnung) fehlgeschlagen.", "Rechnung anlegen", 1);
      END;

      JPPDELETE(sHdl);
   END ELSE BEGIN
      MessageBox("CVorgangsHelper konnte nicht angelegt werden.", "Rechnung anlegen", 1);
   END;

   Cleanup();
END.
