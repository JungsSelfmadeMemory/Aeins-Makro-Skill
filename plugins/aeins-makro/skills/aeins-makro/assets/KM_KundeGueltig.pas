/*------------------------------------------------------------
=pod
=head1 KM_KundeGueltig

 Allgemeingültige Prüfung der KundNummer VOR StartVorgang / im CVorgangsHelper.

   FUNCTION KundeGueltig(iKundNr:INTEGER; iKlasse:INTEGER) : INTEGER;   // 1 = ok, 0 = nicht erlaubt

 Regeln:
  - Interne Belege (Vorgangsklasse 5100..5220): KundNummer MUSS 0 sein.
  - Verkauf  (Klasse < 1000):  Debitor -> KundTyp IN (1,3)
  - Einkauf  (Klasse >= 1000): Kreditor -> KundTyp IN (2,3)   (interne 5100..5220 s.o.)
  - In allen VK/EK-Fällen zusätzlich: KundLoeKennz = 0, KundLiefSperr <= 1, KundFaktSperr <= 1.

 Bei Rückgabe 0 wird IMMER ein FehlerProtokoll-Eintrag geschrieben (Bereich = Makroname,
 Text = KundNummer + KundLoeKennz/KundFaktSperr/KundLiefSperr/KundTyp), damit der Grund
 erkennbar ist.

 Testrahmen: p1 = KundNummer, p2 = Vorgangsklasse.

 bearbeitet: 2026-08-11 | KJ | Erstanlage
=cut
------------------------------------------------------------*/
PROGRAM KM_KundeGueltig(p1; p2; p3; p4);

CONST
   MAKRONAME = "KM_KundeGueltig";   // Bereich für Fehlerprotokoll

VAR
   sMsg : STRING;
   iOk  : INTEGER;

   /*--------------------------------------------------------------------------
     Prüft die KundNummer je Vorgangsklasse. Rückgabe 1 = erlaubt, 0 = nicht
     erlaubt (dann Fehlerprotokoll). Eigene Puffer/Cursor.
   --------------------------------------------------------------------------*/
   FUNCTION KundeGueltig(iKundNr : INTEGER; iKlasse : INTEGER) : INTEGER;
   VAR
      sSql  : STRING;
      sBuf  : STRING;
      sLog  : STRING;
      iRes  : INTEGER;
      iErl  : INTEGER;
      iTyp  : INTEGER;
      iLoe  : INTEGER;
      iFakt : INTEGER;
      iLief : INTEGER;
   BEGIN
      sSql := ALLOC(1024);
      sBuf := ALLOC(256);
      sLog := ALLOC(1024);
      iErl  := 0;
      iTyp  := -1;
      iLoe  := 0;
      iFakt := 0;
      iLief := 0;

      IF (iKlasse >= 5100) AND (iKlasse <= 5220) THEN BEGIN
         // interne Belege -> KundNummer muss 0 sein
         IF iKundNr = 0 THEN BEGIN
            iErl := 1;
         END;
      END ELSE BEGIN
         // VK/EK: Kundenstammwerte lesen und prüfen
         SPRINTF(sSql, "SELECT KundTyp"
                       "     , KundLoeKennz"
                       "     , KundFaktSperr"
                       "     , KundLiefSperr"
                       "  FROM Kundenstamm"
                       " WHERE KundNummer = %d", iKundNr);
         iRes := SELECT("kg_kunde", sSql);
         IF iRes <> 0 THEN BEGIN
            Get("kg_kunde", "KundTyp",       sBuf);  iTyp  := STRTOINT(sBuf);
            Get("kg_kunde", "KundLoeKennz",  sBuf);  iLoe  := STRTOINT(sBuf);
            Get("kg_kunde", "KundFaktSperr", sBuf);  iFakt := STRTOINT(sBuf);
            Get("kg_kunde", "KundLiefSperr", sBuf);  iLief := STRTOINT(sBuf);

            IF (iLoe = 0) AND (iLief <= 1) AND (iFakt <= 1) THEN BEGIN
               IF iKlasse < 1000 THEN BEGIN
                  // Verkauf -> Debitor
                  IF (iTyp = 1) OR (iTyp = 3) THEN BEGIN
                     iErl := 1;
                  END;
               END ELSE BEGIN
                  // Einkauf -> Kreditor
                  IF (iTyp = 2) OR (iTyp = 3) THEN BEGIN
                     iErl := 1;
                  END;
               END;
            END;
         END;
         CloseCursor("kg_kunde");
      END;

      // Nicht erlaubt -> Fehlerprotokoll (Bereich = Makroname) mit KundNummer + Werten
      IF iErl = 0 THEN BEGIN
         SPRINTF(sLog, "Ungültige KundNummer %d (Klasse %d): KundLoeKennz=%d KundFaktSperr=%d"
                       " KundLiefSperr=%d KundTyp=%d",
                       iKundNr, iKlasse, iLoe, iFakt, iLief, iTyp);
         FehlerProtokoll(30, MAKRONAME, sLog);
      END;

      FREE(sSql);
      FREE(sBuf);
      FREE(sLog);
      KundeGueltig := iErl;                     // R7: letzte Zeile
   END;

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

   iOk := KundeGueltig(STRTOINT(p1), STRTOINT(p2));
   IF iOk = 0 THEN BEGIN
      SPRINTF(sMsg, "KundNummer %s ist für Vorgangsklasse %s nicht erlaubt.", p1, p2);
   END ELSE BEGIN
      SPRINTF(sMsg, "KundNummer %s ist für Vorgangsklasse %s erlaubt.", p1, p2);
   END;
   MessageBox(sMsg, "KundeGueltig", 1);

   Cleanup();
END.
