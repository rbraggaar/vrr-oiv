-- bereikbaarheidskaart.muur_view source

CREATE OR REPLACE VIEW bereikbaarheidskaart.muur_view
AS SELECT lay.id,
    lay.omschrijving,
    lay.bouwlaag,
    lay.naam_aanmaker,
    lay.naam_bewerker,
    lay.datum_aangemaakt,
    lay.datum_gewijzigd,
    lay.geom,
    lay.categorie_dbk
   FROM bereikbaarheidskaart.muur lay
     LEFT JOIN bereikbaarheidskaart.status c ON st_within(lay.geom, c.geom) AND c.status::text = 'concept'::text
  WHERE c.id IS NULL;