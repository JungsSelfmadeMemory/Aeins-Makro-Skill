/*------------------------------------------------------------
=pod
=head1 KM_ProduktionAnlegen

 Legt eine Produktion (Vorgangsklasse Produktion) für einen Artikel an.

 Aufrufparameter (immer string):
   p1 = Artikelnummer   (z. B. "473263")
   p2 = Lagernummer     (Ganzzahl)
   p3 = Menge           (Dezimal, z. B. "100" oder "12,5")

 Technik (verifiziert aus GS_AU_ProduktionAnlegen + Makrobibliothek.chm):
   SetKlassNum(KLASSE_PRODUKTION) -> StartVorgang -> ProduktNeu(anr,lgnr,menge)
   -> PositionAdd -> BeendeVorgang. Liefert die V_ID der neuen Produktion.

 WICHTIG:
 - Läuft in der A.eins-Makro-Engine (nicht via reinem ODBC). Erzeugt einen
   echten Beleg -> zuerst in einer TESTdatenbank ausführen!
 - KLASSE_PRODUKTION (5220) stammt aus DEMO_FOOD; ggf. an die eigene
   Installation anpassen (Vorgangsklasse der Produktion).
 - Rezeptur-Komponenten werden hier NICHT automatisch erzeugt. Wird die
   Stückliste benötigt, je Komponente Komponente(...) aufrufen (s. Hinweis unten).

 bearbeitet: 2026-08-11 | KJ | Erstanlage
=cut
------------------------------------------------------------*/
PROGRAM KM_ProduktionAnlegen(p1; p2; p3; p4);

CONST
   KLASSE_PRODUKTION = 5220;    // Vorgangsklasse Produktion (DEMO_FOOD) - ggf. anpassen
   UNTERKLASSE       = 0;
   ID_PRODTYP        = 4204;    // Produktionstyp (Kopf)

VAR
   sArtikelNr : STRING;
   sBuf       : STRING;
   sMsg       : STRING;
   iLagerNr   : INTEGER;
   rMenge     : REAL;
   iVorgang   : INTEGER;
   iProdukt   : INTEGER;
   iVID       : INTEGER;

   /*--- R4: Puffer holen ---*/
   PROCEDURE Init();
   BEGIN
      sArtikelNr := ALLOC(256);
      sBuf       := ALLOC(1024);
      sMsg       := ALLOC(1024);
   END;

   /*--- R4: Puffer freigeben ---*/
   PROCEDURE Cleanup();
   BEGIN
      FREE(sArtikelNr);
      FREE(sBuf);
      FREE(sMsg);
   END;

BEGIN
   Init();

   // --- Parameter übernehmen (Strings NIE mit := setzen -> STRCPY) ---
   STRCPY(sArtikelNr, p1);
   STRALLTRIM(sArtikelNr);
   iLagerNr := STRTOINT(p2);
   rMenge   := STRTOREAL(p3);

   IF STRLEN(sArtikelNr) = 0 THEN BEGIN
      MessageBox("Keine Artikelnummer übergeben (Parameter 1).", "Produktion anlegen", 1);
      Cleanup();
      EXIT;
   END;

   // --- Vorgangsklasse Produktion setzen, dann Vorgang starten ---
   SetKlassNum(KLASSE_PRODUKTION);
   SetUKlassNum(UNTERKLASSE);

   iVorgang := StartVorgang(0, 0);          // ohne Kundennr/feste Nummer
   IF iVorgang = 0 THEN BEGIN
      MessageBox("Produktion konnte nicht gestartet werden (StartVorgang).", "Produktion anlegen", 1);
      Cleanup();
      EXIT;
   END;

   SetValue(iVorgang, ID_PRODTYP, "1", 0);  // Produktionstyp (optional, wie im Vorbild)

   // --- Produkt-Warenposition anlegen: Artikelnummer / Lager / Menge ---
   iProdukt := ProduktNeu(iVorgang, sArtikelNr, iLagerNr, rMenge);
   IF iProdukt = 0 THEN BEGIN
      SPRINTF(sMsg, "Produktartikel '%s' (Lager %d) konnte nicht angelegt werden.",
                    sArtikelNr, iLagerNr);
      MessageBox(sMsg, "Produktion anlegen", 1);
      BeendeVorgang(iVorgang, 0, 0);        // ohne Speichern verwerfen
      Cleanup();
      EXIT;
   END;

   PositionAdd(iVorgang);

   /* --- Optional: Rezeptur-/Stücklisten-Komponenten ---
      Sollen die Komponenten der Rezeptur erzeugt werden, hier je Komponente:
        iKomp := Komponente(iVorgang, iProdukt, sKompArtNr, iLagerNr, rKompMenge,
                            FALSE, FALSE, FALSE, 0.0);
        PositionAdd(iVorgang);
      Die Komponentenliste kommt üblicherweise aus der Rezeptur des Artikels. */

   // --- Speichern/abschließen -> V_ID der Produktion ---
   iVID := BeendeVorgang(iVorgang, 1, 0);
   IF iVID = 0 THEN BEGIN
      MessageBox("Die Produktion konnte nicht gespeichert werden.", "Produktion anlegen", 1);
   END ELSE BEGIN
      SPRINTF(sMsg, "Produktion angelegt: Artikel %s, Lager %d, Menge %10.3f (V_ID %d).",
                    sArtikelNr, iLagerNr, rMenge, iVID);
      MessageBox(sMsg, "Produktion anlegen", 1);
   END;

   Cleanup();
END.
