/*------------------------------------------------------------
=pod
=head1 KM_AuswahllisteVorgaengeSpeichern

 Iteriert über die aktuelle Auswahlliste, öffnet jeden markierten Datensatz
 als Vorgang und speichert ihn wieder ab.

 Voraussetzung: Die Auswahlliste liefert in ID1 die V_ID des Vorgangs
 (Standard bei Vorgangs-Auswahllisten). Zweit-IDs bei Bedarf über GetIdx(2..4).

 Technik (verifiziert aus amic_svware_direkt + Makrobibliothek.chm):
   InitGetId(); v_id := GetNextId();
   WHILE v_id <> 0 DO  LadeVorgangId(v_id) -> BeendeVorgang(v,1,0) -> GetNextId()

 WICHTIG:
 - Läuft in der A.eins-Makro-Engine (nicht via reinem ODBC).
 - "Wieder speichern" schreibt jeden Vorgang neu -> gemäß Versionierung entsteht
   dabei je Vorgang eine NEUE V_ID (der Server bucht zurück und neu). Erst in
   einer TESTdatenbank ausführen.

 bearbeitet: 2026-08-11 | KJ | Erstanlage
=cut
------------------------------------------------------------*/
PROGRAM KM_AuswahllisteVorgaengeSpeichern;

VAR
   sMsg     : STRING;
   iVID     : INTEGER;
   iVorgang : INTEGER;
   iRet     : INTEGER;
   iAnz     : INTEGER;
   iFehler  : INTEGER;

   /*--- R4: Puffer holen ---*/
   PROCEDURE Init();
   BEGIN
      sMsg := ALLOC(1024);
   END;

   /*--- R4: Puffer freigeben ---*/
   PROCEDURE Cleanup();
   BEGIN
      FREE(sMsg);
   END;

BEGIN
   Init();

   InitGetId();                       // Iteration über die Auswahlliste starten
   iAnz    := 0;
   iFehler := 0;

   iVID := GetNextId();               // erste markierte V_ID (0 = Liste leer/Ende)
   WHILE iVID <> 0 DO BEGIN

      SPRINTF(sMsg, "Verarbeite Vorgang V_ID %d ...", iVID);
      StatusZeile(sMsg);

      iVorgang := LadeVorgangId(iVID);          // Vorgang öffnen
      IF iVorgang <> 0 THEN BEGIN

         // >>> Hier könnten Änderungen am Vorgang erfolgen (SetValue/SetValPos ...) <<<

         iRet := BeendeVorgang(iVorgang, 1, 0); // 1 = in Datenbank speichern
         IF iRet <> 0 THEN BEGIN
            iAnz := iAnz + 1;
         END ELSE BEGIN
            iFehler := iFehler + 1;
         END;

      END ELSE BEGIN
         iFehler := iFehler + 1;                // Vorgang konnte nicht geladen werden
      END;

      iVID := GetNextId();                      // nächste markierte V_ID
   END;

   StatusZeile("Fertig !!!");
   SPRINTF(sMsg, "Fertig: %d Vorgänge gespeichert, %d Fehler.", iAnz, iFehler);
   MessageBox(sMsg, "Auswahlliste verarbeiten", 1);

   Cleanup();
END.
