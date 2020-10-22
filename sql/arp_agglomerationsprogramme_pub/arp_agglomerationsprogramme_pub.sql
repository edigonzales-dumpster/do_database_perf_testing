CREATE SCHEMA IF NOT EXISTS arp_agglomerationsprogramme_pub;
CREATE SEQUENCE arp_agglomerationsprogramme_pub.t_ili2db_seq;;
-- GeometryCHLV95_V1.SurfaceStructure
CREATE TABLE arp_agglomerationsprogramme_pub.surfacestructure (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_agglomerationsprogramme_pub.t_ili2db_seq')
  ,T_Seq bigint NULL
  ,surface geometry(POLYGON,2056) NULL
  ,multisurface_surfaces bigint NULL
)
;
CREATE INDEX surfacestructure_surface_idx ON arp_agglomerationsprogramme_pub.surfacestructure USING GIST ( surface );
CREATE INDEX surfacestructure_multisurface_surfaces_idx ON arp_agglomerationsprogramme_pub.surfacestructure ( multisurface_surfaces );
-- GeometryCHLV95_V1.MultiSurface
CREATE TABLE arp_agglomerationsprogramme_pub.multisurface (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_agglomerationsprogramme_pub.t_ili2db_seq')
  ,T_Seq bigint NULL
)
;
-- SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde
CREATE TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_agglomerationsprogramme_pub.t_ili2db_seq')
  ,aggloprogramm varchar(200) NOT NULL
  ,gemeinde varchar(200) NOT NULL
  ,bfs_nr integer NOT NULL
  ,kanton varchar(255) NULL
  ,land varchar(2) NOT NULL
  ,geometrie geometry(MULTIPOLYGON,2056) NOT NULL
  ,agglomerationsprogramm_nummer varchar(20) NULL
)
;
CREATE INDEX agglmrtnsprgr_brscht_gmnde_geometrie_idx ON arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde USING GIST ( geometrie );
COMMENT ON TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde IS 'Übersicht pro Gemeinde von welchem Agglomerationsprogramm es betroffen ist. Im Web GIS Client braucht es den Perimeter, um den Report über den Stand der Massnahmen pro Gemeinde zu öffnen.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde.aggloprogramm IS 'Name des Agglomerationsprogramms';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde.gemeinde IS 'Gemeindename';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde.bfs_nr IS 'BFS-Nr der Gemeinde';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde.kanton IS 'Kantonskuerzel';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde.land IS 'Landeskuerzel';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde.geometrie IS 'Geometrie der Gemeinde';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde.agglomerationsprogramm_nummer IS 'Bezeichnung des Agglomerationsprogramms gemäss Code von «Raum mit städtischem Charakter 2012»';
-- SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Flaeche
CREATE TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_agglomerationsprogramme_pub.t_ili2db_seq')
  ,flaechengeometrie geometry(POLYGON,2056) NULL
  ,agglomerationsprogramm varchar(200) NOT NULL
  ,generation integer NOT NULL
  ,handlungsfeld varchar(200) NOT NULL
  ,handlungspaket varchar(200) NOT NULL
  ,massnahmekategorie varchar(200) NULL
  ,prioritaet varchar(255) NULL
  ,massnahmennummer varchar(255) NOT NULL
  ,beschreibung text NULL
  ,kosten_massnahmenblatt integer NULL
  ,kosten_leistungsvereinbarung integer NULL
  ,kostenstand_aktuell integer NULL
  ,kostenanteil_bund integer NULL
  ,massnahmenblatt varchar(1023) NULL
  ,ansprechperson text NULL
  ,kommentar text NULL
  ,projektphase varchar(255) NULL
  ,umsetzungsstand varchar(255) NULL
  ,federfuehrung text NULL
  ,gemeinden text NULL
  ,infrastrukturell boolean NULL
  ,agglomerationsprogramm_url varchar(1023) NULL
  ,letzte_anpassung date NULL
  ,unterkategorie varchar(500) NULL
  ,agglomerationsprogramm_nr varchar(20) NULL
  ,are_code varchar(20) NULL
  ,finanzvereinbarung boolean NULL
  ,finanzierungsvereinbarungsnr varchar(20) NULL
  ,kostenanteil_lv_mp varchar(20) NULL
  ,baubeginn_geplant_lv varchar(20) NULL
  ,umsetzungsstand_text varchar(100) NULL
  ,prioritaet_text varchar(100) NULL
  ,projektphase_text varchar(100) NULL
)
;
CREATE INDEX agglmrtnsprgr_mssnhm_flche_flaechengeometrie_idx ON arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche USING GIST ( flaechengeometrie );
COMMENT ON TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche IS 'Alle Massnahmen mit einer Flächengeometrie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.flaechengeometrie IS 'Flaechengeometrie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.agglomerationsprogramm IS 'Name des Agglomerationsprogramm (Solothurn, AareLand oder Basel)';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.generation IS 'Die Generation des Agglommerationsprogrammes';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.handlungsfeld IS 'Das Handlungsfeld beschreibt die thematische Eingliederung der Massnahmen in die Bereiche Siedlung / Landschaft oder Verkehr.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.handlungspaket IS 'Das Handlungspaket beschreibt die Massnahmen im Themenbereich. Bei den Verkehrsmassnahmen gilt es die Massnahmen nach den verschiedenen Mobilitätsformen zuzuordnen.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.massnahmekategorie IS 'Bei den Massnahmenkategorien handelt es sich um die konkrete Zuordnung der Massnahmen. Die Massnahmenkategorien im Bereich Verkehr sind mit den Richtlinien der Agglomerationsprogramme abgestimmt.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.prioritaet IS 'Prioritaet';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.massnahmennummer IS 'Massnahmennummer gemäss Trägerschaf';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.beschreibung IS 'Offizieller Name der Massnahme laut Massnahmenblatt';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.kosten_massnahmenblatt IS 'Kosten gemäss Massnahmenblatt in Mio. CHF';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.kosten_leistungsvereinbarung IS 'Kosten gemäss Leistungsvereinbarung in Fr.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.kostenstand_aktuell IS 'aktueller Kostenstand in Mio. CHF.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.kostenanteil_bund IS 'Kosten gemäss Leistungsvereinbarung mit dem Bund in Mio. CHF.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.massnahmenblatt IS 'Pfad zum PDF-Dokument des Massnahmenblattes aus dem Hauptbericht des Agglomerationsprogrammes.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.ansprechperson IS 'Für die Massnahme zuständiges Amt/Person';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.kommentar IS 'Kommentar, obligatorisch für die Unterkategorie Kernentlastungs- und Umfahrungsstrassen';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.projektphase IS 'Projektphase';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.umsetzungsstand IS 'aktueller Stand der Umsetzung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.federfuehrung IS 'Name der federführenden Aemter/Personen';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.gemeinden IS 'beteiligte Gemeinden';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.infrastrukturell IS 'gemaess Massnahmenblatt';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.agglomerationsprogramm_url IS 'Link zur Webseite der Agglomeration für Massnahmen aus einem anderen Kanton (z.B. Kanton Aargau im AP AareLand)';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.letzte_anpassung IS 'Datum der Änderung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.unterkategorie IS 'Unterkategorie der Massnahmekategorie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.agglomerationsprogramm_nr IS 'Bezeichnung des Agglomerationsprogramms gemäss Code von «Raum mit städtischem Charakter 2012»';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.finanzvereinbarung IS 'Finanzvereinbarung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.finanzierungsvereinbarungsnr IS 'Finanzierungsvereinbarungsnummer';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.kostenanteil_lv_mp IS 'Kostenanteil Leistungsvereinbarung/Massnahmepaket';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.baubeginn_geplant_lv IS 'Baubeginn geplant gemäss Leistungsvereinbarung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.umsetzungsstand_text IS 'aktueller Stand der Umsetzung als schöner Text';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.prioritaet_text IS 'Priorität als schöner Text';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche.projektphase_text IS 'Projektphase als schöner Text';
-- SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Linie
CREATE TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_agglomerationsprogramme_pub.t_ili2db_seq')
  ,liniengeometrie geometry(LINESTRING,2056) NULL
  ,agglomerationsprogramm varchar(200) NOT NULL
  ,generation integer NOT NULL
  ,handlungsfeld varchar(200) NOT NULL
  ,handlungspaket varchar(200) NOT NULL
  ,massnahmekategorie varchar(200) NULL
  ,prioritaet varchar(255) NULL
  ,massnahmennummer varchar(255) NOT NULL
  ,beschreibung text NULL
  ,kosten_massnahmenblatt integer NULL
  ,kosten_leistungsvereinbarung integer NULL
  ,kostenstand_aktuell integer NULL
  ,kostenanteil_bund integer NULL
  ,massnahmenblatt varchar(1023) NULL
  ,ansprechperson text NULL
  ,kommentar text NULL
  ,projektphase varchar(255) NULL
  ,umsetzungsstand varchar(255) NULL
  ,federfuehrung text NULL
  ,gemeinden text NULL
  ,infrastrukturell boolean NULL
  ,agglomerationsprogramm_url varchar(1023) NULL
  ,letzte_anpassung date NULL
  ,unterkategorie varchar(500) NULL
  ,agglomerationsprogramm_nr varchar(20) NULL
  ,are_code varchar(20) NULL
  ,finanzvereinbarung boolean NULL
  ,finanzierungsvereinbarungsnr varchar(20) NULL
  ,kostenanteil_lv_mp varchar(20) NULL
  ,baubeginn_geplant_lv varchar(20) NULL
  ,umsetzungsstand_text varchar(100) NULL
  ,prioritaet_text varchar(100) NULL
  ,projektphase_text varchar(100) NULL
)
;
CREATE INDEX agglmrtnsprgrm_mssnhm_lnie_liniengeometrie_idx ON arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie USING GIST ( liniengeometrie );
COMMENT ON TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie IS 'Alle Massnahmen mit einer Liniengeometrie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.liniengeometrie IS 'Liniengeometrie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.agglomerationsprogramm IS 'Name des Agglomerationsprogramm (Solothurn, AareLand oder Basel)';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.generation IS 'Die Generation des Agglommerationsprogrammes';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.handlungsfeld IS 'Das Handlungsfeld beschreibt die thematische Eingliederung der Massnahmen in die Bereiche Siedlung / Landschaft oder Verkehr.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.handlungspaket IS 'Das Handlungspaket beschreibt die Massnahmen im Themenbereich. Bei den Verkehrsmassnahmen gilt es die Massnahmen nach den verschiedenen Mobilitätsformen zuzuordnen.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.massnahmekategorie IS 'Bei den Massnahmenkategorien handelt es sich um die konkrete Zuordnung der Massnahmen. Die Massnahmenkategorien im Bereich Verkehr sind mit den Richtlinien der Agglomerationsprogramme abgestimmt.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.prioritaet IS 'Prioritaet';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.massnahmennummer IS 'Massnahmennummer gemäss Trägerschaf';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.beschreibung IS 'Offizieller Name der Massnahme laut Massnahmenblatt';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.kosten_massnahmenblatt IS 'Kosten gemäss Massnahmenblatt in Mio. CHF';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.kosten_leistungsvereinbarung IS 'Kosten gemäss Leistungsvereinbarung in Fr.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.kostenstand_aktuell IS 'aktueller Kostenstand in Mio. CHF.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.kostenanteil_bund IS 'Kosten gemäss Leistungsvereinbarung mit dem Bund in Mio. CHF.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.massnahmenblatt IS 'Pfad zum PDF-Dokument des Massnahmenblattes aus dem Hauptbericht des Agglomerationsprogrammes.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.ansprechperson IS 'Für die Massnahme zuständiges Amt/Person';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.kommentar IS 'Kommentar, obligatorisch für die Unterkategorie Kernentlastungs- und Umfahrungsstrassen';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.projektphase IS 'Projektphase';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.umsetzungsstand IS 'aktueller Stand der Umsetzung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.federfuehrung IS 'Name der federführenden Aemter/Personen';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.gemeinden IS 'beteiligte Gemeinden';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.infrastrukturell IS 'gemaess Massnahmenblatt';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.agglomerationsprogramm_url IS 'Link zur Webseite der Agglomeration für Massnahmen aus einem anderen Kanton (z.B. Kanton Aargau im AP AareLand)';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.letzte_anpassung IS 'Datum der Änderung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.unterkategorie IS 'Unterkategorie der Massnahmekategorie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.agglomerationsprogramm_nr IS 'Bezeichnung des Agglomerationsprogramms gemäss Code von «Raum mit städtischem Charakter 2012»';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.finanzvereinbarung IS 'Finanzvereinbarung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.finanzierungsvereinbarungsnr IS 'Finanzierungsvereinbarungsnummer';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.kostenanteil_lv_mp IS 'Kostenanteil Leistungsvereinbarung/Massnahmepaket';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.baubeginn_geplant_lv IS 'Baubeginn geplant gemäss Leistungsvereinbarung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.umsetzungsstand_text IS 'aktueller Stand der Umsetzung als schöner Text';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.prioritaet_text IS 'Priorität als schöner Text';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie.projektphase_text IS 'Projektphase als schöner Text';
-- SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Punkt
CREATE TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_agglomerationsprogramme_pub.t_ili2db_seq')
  ,punktgeometrie geometry(POINT,2056) NULL
  ,agglomerationsprogramm varchar(200) NOT NULL
  ,generation integer NOT NULL
  ,handlungsfeld varchar(200) NOT NULL
  ,handlungspaket varchar(200) NOT NULL
  ,massnahmekategorie varchar(200) NULL
  ,prioritaet varchar(255) NULL
  ,massnahmennummer varchar(255) NOT NULL
  ,beschreibung text NULL
  ,kosten_massnahmenblatt integer NULL
  ,kosten_leistungsvereinbarung integer NULL
  ,kostenstand_aktuell integer NULL
  ,kostenanteil_bund integer NULL
  ,massnahmenblatt varchar(1023) NULL
  ,ansprechperson text NULL
  ,kommentar text NULL
  ,projektphase varchar(255) NULL
  ,umsetzungsstand varchar(255) NULL
  ,federfuehrung text NULL
  ,gemeinden text NULL
  ,infrastrukturell boolean NULL
  ,agglomerationsprogramm_url varchar(1023) NULL
  ,letzte_anpassung date NULL
  ,unterkategorie varchar(500) NULL
  ,agglomerationsprogramm_nr varchar(20) NULL
  ,are_code varchar(20) NULL
  ,finanzvereinbarung boolean NULL
  ,finanzierungsvereinbarungsnr varchar(20) NULL
  ,kostenanteil_lv_mp varchar(20) NULL
  ,baubeginn_geplant_lv varchar(20) NULL
  ,umsetzungsstand_text varchar(100) NULL
  ,prioritaet_text varchar(100) NULL
  ,projektphase_text varchar(100) NULL
)
;
CREATE INDEX agglmrtnsprgrm_mssnhm_pnkt_punktgeometrie_idx ON arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt USING GIST ( punktgeometrie );
COMMENT ON TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt IS 'Alle Massnahmen mit einer Punktgeometrie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.punktgeometrie IS 'Punktgeometrie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.agglomerationsprogramm IS 'Name des Agglomerationsprogramm (Solothurn, AareLand oder Basel)';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.generation IS 'Die Generation des Agglommerationsprogrammes';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.handlungsfeld IS 'Das Handlungsfeld beschreibt die thematische Eingliederung der Massnahmen in die Bereiche Siedlung / Landschaft oder Verkehr.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.handlungspaket IS 'Das Handlungspaket beschreibt die Massnahmen im Themenbereich. Bei den Verkehrsmassnahmen gilt es die Massnahmen nach den verschiedenen Mobilitätsformen zuzuordnen.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.massnahmekategorie IS 'Bei den Massnahmenkategorien handelt es sich um die konkrete Zuordnung der Massnahmen. Die Massnahmenkategorien im Bereich Verkehr sind mit den Richtlinien der Agglomerationsprogramme abgestimmt.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.prioritaet IS 'Prioritaet';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.massnahmennummer IS 'Massnahmennummer gemäss Trägerschaf';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.beschreibung IS 'Offizieller Name der Massnahme laut Massnahmenblatt';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.kosten_massnahmenblatt IS 'Kosten gemäss Massnahmenblatt in Mio. CHF';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.kosten_leistungsvereinbarung IS 'Kosten gemäss Leistungsvereinbarung in Fr.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.kostenstand_aktuell IS 'aktueller Kostenstand in Mio. CHF.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.kostenanteil_bund IS 'Kosten gemäss Leistungsvereinbarung mit dem Bund in Mio. CHF.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.massnahmenblatt IS 'Pfad zum PDF-Dokument des Massnahmenblattes aus dem Hauptbericht des Agglomerationsprogrammes.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.ansprechperson IS 'Für die Massnahme zuständiges Amt/Person';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.kommentar IS 'Kommentar, obligatorisch für die Unterkategorie Kernentlastungs- und Umfahrungsstrassen';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.projektphase IS 'Projektphase';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.umsetzungsstand IS 'aktueller Stand der Umsetzung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.federfuehrung IS 'Name der federführenden Aemter/Personen';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.gemeinden IS 'beteiligte Gemeinden';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.infrastrukturell IS 'gemaess Massnahmenblatt';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.agglomerationsprogramm_url IS 'Link zur Webseite der Agglomeration für Massnahmen aus einem anderen Kanton (z.B. Kanton Aargau im AP AareLand)';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.letzte_anpassung IS 'Datum der Änderung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.unterkategorie IS 'Unterkategorie der Massnahmekategorie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.agglomerationsprogramm_nr IS 'Bezeichnung des Agglomerationsprogramms gemäss Code von «Raum mit städtischem Charakter 2012»';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.finanzvereinbarung IS 'Finanzvereinbarung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.finanzierungsvereinbarungsnr IS 'Finanzierungsvereinbarungsnummer';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.kostenanteil_lv_mp IS 'Kostenanteil Leistungsvereinbarung/Massnahmepaket';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.baubeginn_geplant_lv IS 'Baubeginn geplant gemäss Leistungsvereinbarung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.umsetzungsstand_text IS 'aktueller Stand der Umsetzung als schöner Text';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.prioritaet_text IS 'Priorität als schöner Text';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt.projektphase_text IS 'Projektphase als schöner Text';
-- SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahmen
CREATE TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_agglomerationsprogramme_pub.t_ili2db_seq')
  ,geometrietyp varchar(255) NULL
  ,agglomerationsprogramm varchar(200) NOT NULL
  ,generation integer NOT NULL
  ,handlungsfeld varchar(200) NOT NULL
  ,handlungspaket varchar(200) NOT NULL
  ,massnahmekategorie varchar(200) NULL
  ,prioritaet varchar(255) NULL
  ,massnahmennummer varchar(255) NOT NULL
  ,beschreibung text NULL
  ,kosten_massnahmenblatt integer NULL
  ,kosten_leistungsvereinbarung integer NULL
  ,kostenstand_aktuell integer NULL
  ,kostenanteil_bund integer NULL
  ,massnahmenblatt varchar(1023) NULL
  ,ansprechperson text NULL
  ,kommentar text NULL
  ,projektphase varchar(255) NULL
  ,umsetzungsstand varchar(255) NULL
  ,federfuehrung text NULL
  ,gemeinden text NULL
  ,infrastrukturell boolean NULL
  ,agglomerationsprogramm_url varchar(1023) NULL
  ,letzte_anpassung date NULL
  ,unterkategorie varchar(500) NULL
  ,agglomerationsprogramm_nr varchar(20) NULL
  ,are_code varchar(20) NULL
  ,finanzvereinbarung boolean NULL
  ,finanzierungsvereinbarungsnr varchar(20) NULL
  ,kostenanteil_lv_mp varchar(20) NULL
  ,baubeginn_geplant_lv varchar(20) NULL
  ,umsetzungsstand_text varchar(100) NULL
  ,prioritaet_text varchar(100) NULL
  ,projektphase_text varchar(100) NULL
)
;
COMMENT ON TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen IS 'Alle Massnahmen. D.h. alle Massnahmen mit Punkt-, Linien- und Flächengeometrien und die ohne Geometrie.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.geometrietyp IS 'Geometrietyp';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.agglomerationsprogramm IS 'Name des Agglomerationsprogramm (Solothurn, AareLand oder Basel)';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.generation IS 'Die Generation des Agglommerationsprogrammes';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.handlungsfeld IS 'Das Handlungsfeld beschreibt die thematische Eingliederung der Massnahmen in die Bereiche Siedlung / Landschaft oder Verkehr.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.handlungspaket IS 'Das Handlungspaket beschreibt die Massnahmen im Themenbereich. Bei den Verkehrsmassnahmen gilt es die Massnahmen nach den verschiedenen Mobilitätsformen zuzuordnen.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.massnahmekategorie IS 'Bei den Massnahmenkategorien handelt es sich um die konkrete Zuordnung der Massnahmen. Die Massnahmenkategorien im Bereich Verkehr sind mit den Richtlinien der Agglomerationsprogramme abgestimmt.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.prioritaet IS 'Prioritaet';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.massnahmennummer IS 'Massnahmennummer gemäss Trägerschaf';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.beschreibung IS 'Offizieller Name der Massnahme laut Massnahmenblatt';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.kosten_massnahmenblatt IS 'Kosten gemäss Massnahmenblatt in Mio. CHF';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.kosten_leistungsvereinbarung IS 'Kosten gemäss Leistungsvereinbarung in Fr.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.kostenstand_aktuell IS 'aktueller Kostenstand in Mio. CHF.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.kostenanteil_bund IS 'Kosten gemäss Leistungsvereinbarung mit dem Bund in Mio. CHF.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.massnahmenblatt IS 'Pfad zum PDF-Dokument des Massnahmenblattes aus dem Hauptbericht des Agglomerationsprogrammes.';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.ansprechperson IS 'Für die Massnahme zuständiges Amt/Person';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.kommentar IS 'Kommentar, obligatorisch für die Unterkategorie Kernentlastungs- und Umfahrungsstrassen';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.projektphase IS 'Projektphase';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.umsetzungsstand IS 'aktueller Stand der Umsetzung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.federfuehrung IS 'Name der federführenden Aemter/Personen';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.gemeinden IS 'beteiligte Gemeinden';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.infrastrukturell IS 'gemaess Massnahmenblatt';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.agglomerationsprogramm_url IS 'Link zur Webseite der Agglomeration für Massnahmen aus einem anderen Kanton (z.B. Kanton Aargau im AP AareLand)';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.letzte_anpassung IS 'Datum der Änderung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.unterkategorie IS 'Unterkategorie der Massnahmekategorie';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.agglomerationsprogramm_nr IS 'Bezeichnung des Agglomerationsprogramms gemäss Code von «Raum mit städtischem Charakter 2012»';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.finanzvereinbarung IS 'Finanzvereinbarung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.finanzierungsvereinbarungsnr IS 'Finanzierungsvereinbarungsnummer';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.kostenanteil_lv_mp IS 'Kostenanteil Leistungsvereinbarung/Massnahmepaket';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.baubeginn_geplant_lv IS 'Baubeginn geplant gemäss Leistungsvereinbarung';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.umsetzungsstand_text IS 'aktueller Stand der Umsetzung als schöner Text';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.prioritaet_text IS 'Priorität als schöner Text';
COMMENT ON COLUMN arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen.projektphase_text IS 'Projektphase als schöner Text';
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
  ,domains varchar(1024) NULL
)
;
CREATE INDEX T_ILI2DB_BASKET_dataset_idx ON arp_agglomerationsprogramme_pub.t_ili2db_basket ( dataset );
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(1024) NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_MODEL (
  filename varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (modelName,iliversion)
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.chcantoncode (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_geometrietyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_umsetzungsstand (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_projektphase (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,ColOwner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (SqlName,ColOwner)
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (
  tablename varchar(255) NOT NULL
  ,subtype varchar(255) NULL
  ,columnname varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (
  tablename varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (
  ilielement varchar(255) NOT NULL
  ,attr_name varchar(1024) NOT NULL
  ,attr_value varchar(1024) NOT NULL
)
;
ALTER TABLE arp_agglomerationsprogramme_pub.surfacestructure ADD CONSTRAINT surfacestructure_multisurface_surfaces_fkey FOREIGN KEY ( multisurface_surfaces ) REFERENCES arp_agglomerationsprogramme_pub.multisurface DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_uebersicht_gemeinde ADD CONSTRAINT agglmrtnsprg_brscht_gmnde_bfs_nr_check CHECK( bfs_nr BETWEEN 0 AND 9999);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche ADD CONSTRAINT agglmrtnsprg_mssnhm_flche_generation_check CHECK( generation BETWEEN 0 AND 100);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche ADD CONSTRAINT agglmrtnsprg_mssnhm_flche_kosten_massnahmenblatt_check CHECK( kosten_massnahmenblatt BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche ADD CONSTRAINT agglmrtnsprg_mssnhm_flche_kosten_leistungsvernbrung_check CHECK( kosten_leistungsvereinbarung BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche ADD CONSTRAINT agglmrtnsprg_mssnhm_flche_kostenstand_aktuell_check CHECK( kostenstand_aktuell BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_flaeche ADD CONSTRAINT agglmrtnsprg_mssnhm_flche_kostenanteil_bund_check CHECK( kostenanteil_bund BETWEEN 0 AND 999999999);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie ADD CONSTRAINT agglmrtnsprgm_mssnhm_lnie_generation_check CHECK( generation BETWEEN 0 AND 100);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie ADD CONSTRAINT agglmrtnsprgm_mssnhm_lnie_kosten_massnahmenblatt_check CHECK( kosten_massnahmenblatt BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie ADD CONSTRAINT agglmrtnsprgm_mssnhm_lnie_kosten_leistungsvernbrung_check CHECK( kosten_leistungsvereinbarung BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie ADD CONSTRAINT agglmrtnsprgm_mssnhm_lnie_kostenstand_aktuell_check CHECK( kostenstand_aktuell BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_linie ADD CONSTRAINT agglmrtnsprgm_mssnhm_lnie_kostenanteil_bund_check CHECK( kostenanteil_bund BETWEEN 0 AND 999999999);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt ADD CONSTRAINT agglmrtnsprgm_mssnhm_pnkt_generation_check CHECK( generation BETWEEN 0 AND 100);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt ADD CONSTRAINT agglmrtnsprgm_mssnhm_pnkt_kosten_massnahmenblatt_check CHECK( kosten_massnahmenblatt BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt ADD CONSTRAINT agglmrtnsprgm_mssnhm_pnkt_kosten_leistungsvernbrung_check CHECK( kosten_leistungsvereinbarung BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt ADD CONSTRAINT agglmrtnsprgm_mssnhm_pnkt_kostenstand_aktuell_check CHECK( kostenstand_aktuell BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahme_punkt ADD CONSTRAINT agglmrtnsprgm_mssnhm_pnkt_kostenanteil_bund_check CHECK( kostenanteil_bund BETWEEN 0 AND 999999999);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen ADD CONSTRAINT agglomrtnsprgrmm_mssnhmen_generation_check CHECK( generation BETWEEN 0 AND 100);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen ADD CONSTRAINT agglomrtnsprgrmm_mssnhmen_kosten_massnahmenblatt_check CHECK( kosten_massnahmenblatt BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen ADD CONSTRAINT agglomrtnsprgrmm_mssnhmen_kosten_leistungsvernbrung_check CHECK( kosten_leistungsvereinbarung BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen ADD CONSTRAINT agglomrtnsprgrmm_mssnhmen_kostenstand_aktuell_check CHECK( kostenstand_aktuell BETWEEN 0 AND 100000000);
ALTER TABLE arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_massnahmen ADD CONSTRAINT agglomrtnsprgrmm_mssnhmen_kostenanteil_bund_check CHECK( kostenanteil_bund BETWEEN 0 AND 999999999);
ALTER TABLE arp_agglomerationsprogramme_pub.T_ILI2DB_BASKET ADD CONSTRAINT T_ILI2DB_BASKET_dataset_fkey FOREIGN KEY ( dataset ) REFERENCES arp_agglomerationsprogramme_pub.T_ILI2DB_DATASET DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX T_ILI2DB_DATASET_datasetName_key ON arp_agglomerationsprogramme_pub.T_ILI2DB_DATASET (datasetName)
;
CREATE UNIQUE INDEX T_ILI2DB_MODEL_modelName_iliversion_key ON arp_agglomerationsprogramme_pub.T_ILI2DB_MODEL (modelName,iliversion)
;
CREATE UNIQUE INDEX T_ILI2DB_ATTRNAME_SqlName_ColOwner_key ON arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (SqlName,ColOwner)
;
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Prioritaet','agglomrtnsprgrmme_prioritaet');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Punkt','agglomrtnsprgrmme_massnahme_punkt');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahmen','agglomrtnsprgrmme_massnahmen');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.MultiSurface','multisurface');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde','agglomrtnsprgrmme_uebersicht_gemeinde');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Geometrietyp','agglomrtnsprgrmme_geometrietyp');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Flaeche','agglomrtnsprgrmme_massnahme_flaeche');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Projektphase','agglomrtnsprgrmme_projektphase');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('CHAdminCodes_V1.CHCantonCode','chcantoncode');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Linie','agglomrtnsprgrmme_massnahme_linie');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.SurfaceStructure','surfacestructure');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme','agglomrtnsprgrmme_massnahme');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Umsetzungsstand','agglomrtnsprgrmme_umsetzungsstand');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Prioritaet','prioritaet','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.MultiSurface.Surfaces','multisurface_surfaces','surfacestructure','multisurface');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Umsetzungsstand_Text','umsetzungsstand_text','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Flaeche.Flaechengeometrie','flaechengeometrie','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenanteil_LV_MP','kostenanteil_lv_mp','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.infrastrukturell','infrastrukturell','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmekategorie','massnahmekategorie','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm_URL','agglomerationsprogramm_url','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Finanzierungsvereinbarungsnr','finanzierungsvereinbarungsnr','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Handlungsfeld','handlungsfeld','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kosten_Massnahmenblatt','kosten_massnahmenblatt','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm_Nr','agglomerationsprogramm_nr','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Generation','generation','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Finanzvereinbarung','finanzvereinbarung','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmennummer','massnahmennummer','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahmen.Geometrietyp','geometrietyp','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Unterkategorie','unterkategorie','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Federfuehrung','federfuehrung','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Prioritaet','prioritaet','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenstand_aktuell','kostenstand_aktuell','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Finanzvereinbarung','finanzvereinbarung','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmekategorie','massnahmekategorie','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Umsetzungsstand','umsetzungsstand','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm_Nr','agglomerationsprogramm_nr','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Generation','generation','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kosten_Massnahmenblatt','kosten_massnahmenblatt','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm_URL','agglomerationsprogramm_url','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Prioritaet','prioritaet','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kommentar','kommentar','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Beschreibung','beschreibung','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm','agglomerationsprogramm','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.infrastrukturell','infrastrukturell','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmenblatt','massnahmenblatt','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Baubeginn_geplant_LV','baubeginn_geplant_lv','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kosten_Leistungsvereinbarung','kosten_leistungsvereinbarung','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Handlungspaket','handlungspaket','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Gemeinden','gemeinden','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Projektphase','projektphase','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm_Nr','agglomerationsprogramm_nr','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Ansprechperson','ansprechperson','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmennummer','massnahmennummer','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Beschreibung','beschreibung','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmekategorie','massnahmekategorie','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Prioritaet_Text','prioritaet_text','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm','agglomerationsprogramm','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Beschreibung','beschreibung','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Umsetzungsstand_Text','umsetzungsstand_text','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kommentar','kommentar','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Projektphase_Text','projektphase_text','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm_URL','agglomerationsprogramm_url','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Finanzvereinbarung','finanzvereinbarung','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Finanzierungsvereinbarungsnr','finanzierungsvereinbarungsnr','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Unterkategorie','unterkategorie','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenanteil_Bund','kostenanteil_bund','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenanteil_LV_MP','kostenanteil_lv_mp','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Generation','generation','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Umsetzungsstand','umsetzungsstand','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.letzte_Anpassung','letzte_anpassung','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.ARE_CODE','are_code','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm','agglomerationsprogramm','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Ansprechperson','ansprechperson','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Handlungsfeld','handlungsfeld','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenstand_aktuell','kostenstand_aktuell','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Federfuehrung','federfuehrung','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde.Kanton','kanton','agglomrtnsprgrmme_uebersicht_gemeinde',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Handlungspaket','handlungspaket','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm_URL','agglomerationsprogramm_url','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Finanzvereinbarung','finanzvereinbarung','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmekategorie','massnahmekategorie','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kommentar','kommentar','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde.Geometrie','geometrie','agglomrtnsprgrmme_uebersicht_gemeinde',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Federfuehrung','federfuehrung','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Unterkategorie','unterkategorie','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Ansprechperson','ansprechperson','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Projektphase','projektphase','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Handlungsfeld','handlungsfeld','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Gemeinden','gemeinden','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Prioritaet_Text','prioritaet_text','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.SurfaceStructure.Surface','surface','surfacestructure',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Handlungspaket','handlungspaket','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kosten_Massnahmenblatt','kosten_massnahmenblatt','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Generation','generation','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kosten_Leistungsvereinbarung','kosten_leistungsvereinbarung','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Umsetzungsstand','umsetzungsstand','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Prioritaet','prioritaet','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmenblatt','massnahmenblatt','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.infrastrukturell','infrastrukturell','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenanteil_LV_MP','kostenanteil_lv_mp','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde.BFS_Nr','bfs_nr','agglomrtnsprgrmme_uebersicht_gemeinde',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Baubeginn_geplant_LV','baubeginn_geplant_lv','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenstand_aktuell','kostenstand_aktuell','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Baubeginn_geplant_LV','baubeginn_geplant_lv','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Projektphase_Text','projektphase_text','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.ARE_CODE','are_code','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Handlungsfeld','handlungsfeld','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Federfuehrung','federfuehrung','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmenblatt','massnahmenblatt','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Handlungspaket','handlungspaket','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kosten_Leistungsvereinbarung','kosten_leistungsvereinbarung','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Finanzierungsvereinbarungsnr','finanzierungsvereinbarungsnr','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.ARE_CODE','are_code','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Projektphase_Text','projektphase_text','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.letzte_Anpassung','letzte_anpassung','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Umsetzungsstand_Text','umsetzungsstand_text','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenanteil_Bund','kostenanteil_bund','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmennummer','massnahmennummer','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmenblatt','massnahmenblatt','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Baubeginn_geplant_LV','baubeginn_geplant_lv','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Gemeinden','gemeinden','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenanteil_Bund','kostenanteil_bund','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenstand_aktuell','kostenstand_aktuell','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.ARE_CODE','are_code','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde.Agglomerationsprogramm_Nummer','agglomerationsprogramm_nummer','agglomrtnsprgrmme_uebersicht_gemeinde',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Umsetzungsstand_Text','umsetzungsstand_text','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm_Nr','agglomerationsprogramm_nr','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Umsetzungsstand','umsetzungsstand','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Ansprechperson','ansprechperson','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Linie.Liniengeometrie','liniengeometrie','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Projektphase_Text','projektphase_text','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde.Gemeinde','gemeinde','agglomrtnsprgrmme_uebersicht_gemeinde',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.letzte_Anpassung','letzte_anpassung','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kosten_Massnahmenblatt','kosten_massnahmenblatt','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Unterkategorie','unterkategorie','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kommentar','kommentar','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde.Aggloprogramm','aggloprogramm','agglomrtnsprgrmme_uebersicht_gemeinde',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Prioritaet_Text','prioritaet_text','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenanteil_LV_MP','kostenanteil_lv_mp','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Beschreibung','beschreibung','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Massnahmennummer','massnahmennummer','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.infrastrukturell','infrastrukturell','agglomrtnsprgrmme_massnahmen',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Finanzierungsvereinbarungsnr','finanzierungsvereinbarungsnr','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kosten_Leistungsvereinbarung','kosten_leistungsvereinbarung','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.letzte_Anpassung','letzte_anpassung','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Projektphase','projektphase','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Agglomerationsprogramm','agglomerationsprogramm','agglomrtnsprgrmme_massnahme_linie',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Projektphase','projektphase','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde.Land','land','agglomrtnsprgrmme_uebersicht_gemeinde',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Prioritaet_Text','prioritaet_text','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Punkt.Punktgeometrie','punktgeometrie','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Kostenanteil_Bund','kostenanteil_bund','agglomrtnsprgrmme_massnahme_flaeche',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme.Gemeinden','gemeinden','agglomrtnsprgrmme_massnahme_punkt',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Punkt','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Flaeche','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahmen','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.MultiSurface','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde.Geometrie','ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Linie','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.SurfaceStructure','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme','ch.ehi.ili2db.inheritance','subClass');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Punkt','SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Linie','SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Uebersicht_Gemeinde',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahmen','SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.SurfaceStructure',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.MultiSurface',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme',NULL);
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme_Flaeche','SO_Agglomerationsprogramme_Publikation_20200813.Agglomerationsprogramme.Massnahme');
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ZH',0,'ZH',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'BE',1,'BE',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'LU',2,'LU',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'UR',3,'UR',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SZ',4,'SZ',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'OW',5,'OW',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'NW',6,'NW',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'GL',7,'GL',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ZG',8,'ZG',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'FR',9,'FR',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SO',10,'SO',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'BS',11,'BS',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'BL',12,'BL',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SH',13,'SH',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'AR',14,'AR',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'AI',15,'AI',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SG',16,'SG',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'GR',17,'GR',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'AG',18,'AG',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'TG',19,'TG',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'TI',20,'TI',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'VD',21,'VD',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'VS',22,'VS',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'NE',23,'NE',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'GE',24,'GE',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'JU',25,'JU',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'FL',26,'FL',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.chcantoncode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'CH',27,'CH',FALSE,NULL);
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_geometrietyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Geometrie',0,'keine Geometrie',FALSE,'keine Geometrie');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_geometrietyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Flaechengeometrie',1,'Flaechengeometrie',FALSE,'Flächengeometrie');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_geometrietyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Liniengeometrie',2,'Liniengeometrie',FALSE,'Liniengeometrie');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_geometrietyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Punktgeometrie',3,'Punktgeometrie',FALSE,'Punktgeometrie');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_umsetzungsstand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Erarbeitung',0,'in Erarbeitung',FALSE,'in Erarbeitung');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_umsetzungsstand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Planungsstopp_Sistierung',1,'Planungsstopp Sistierung',FALSE,'Planungsstopp / Sistierung');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_umsetzungsstand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_eingereicht',2,'nicht eingereicht',FALSE,'nicht eingereicht');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_umsetzungsstand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'realisiert',3,'realisiert',FALSE,'realisiert');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_umsetzungsstand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'groessere_zeitliche_Verzoegerung',4,'groessere zeitliche Verzoegerung',FALSE,'grössere zeitliche Verzögerung');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_umsetzungsstand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kurze_zeitliche_Verzoegerung',5,'kurze zeitliche Verzoegerung',FALSE,'kurze zeitliche Verzögerung');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_umsetzungsstand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'im_Soll',6,'im Soll',FALSE,'im Soll');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_projektphase (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'archiviert',0,'archiviert',FALSE,'archiviert');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_projektphase (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gestoppt',1,'gestoppt',FALSE,'gestoppt');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_projektphase (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Daueraufgabe',2,'Daueraufgabe',FALSE,'Daueraufgabe');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_projektphase (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'umgesetzt',3,'umgesetzt',FALSE,'umgesetzt');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_projektphase (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bauphase',4,'Bauphase',FALSE,'Bauphase');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_projektphase (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'NP_erfolgt',5,'NP erfolgt',FALSE,'Nutzungsplanung erfolgt');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_projektphase (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Planung_Vorprojekt',6,'Planung Vorprojekt',FALSE,'Planung / Vorprojekt');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Vorleistung',0,'Vorleistung',FALSE,'Vorleistung');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Daueraufgabe',1,'Daueraufgabe',FALSE,'Daueraufgabe');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'C',2,'C',FALSE,'C');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_Eigene_Leistung',3,'A Eigene Leistung',FALSE,'A Eigene Leistung');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'B_Eigene_Leistung',4,'B Eigene Leistung',FALSE,'B Eigene Leistung');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'B',5,'B',FALSE,'B');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_MP_Pauschal_Aufwertung_Sicherheit_Strassenraum',6,'A MP Pauschal Aufwertung Sicherheit Strassenraum',FALSE,'A Massnahmenpaket Pauschal: Aufwertung/Sicherheit Strassenraum');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_MP_Pauschal_Verkehrsmanagement',7,'A MP Pauschal Verkehrsmanagement',FALSE,'A Massnahmenpaket Pauschal: Verkehrsmanagement');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_MP_Pauschal_Langsamverkehr',8,'A MP Pauschal Langsamverkehr',FALSE,'A Massnahmenpaket Pauschal: Langsamverkehr');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'B_MP_Pauschal_Langsamverkehr',9,'B MP Pauschal Langsamverkehr',FALSE,'B Massnahmenpaket Pauschal: Langsamverkehr');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'B_MP_Pauschal_Verkehrsmanagement',10,'B MP Pauschal Verkehrsmanagement',FALSE,'B Massnahmenpaket Pauschal: Verkehrsmanagement');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_MP_Pauschal_Aufwertung_Bus_Tramhaltestellen',11,'A MP Pauschal Aufwertung Bus Tramhaltestellen',FALSE,'A Massnahmenpaket Pauschal: Aufwertung Bus- und Tramhaltestellen');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'B_MP_Pauschal_Aufwertung_Bus_Tramhaltestellen',12,'B MP Pauschal Aufwertung Bus Tramhaltestellen',FALSE,'B Massnahmenpaket Pauschal: Aufwertung Bus- und Tramhaltestellen');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'B_MP_Pauschal_Aufwertung_Sicherheit_Strassenraum',13,'B MP Pauschal Aufwertung Sicherheit Strassenraum',FALSE,'B Massnahmenpaket Pauschal: Aufwertung/Sicherheit Strassenraum');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'B_LV_Paket_1_bis_3G',14,'B LV Paket 1 bis 3G',FALSE,'B LV Paket 1 bis 3G');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_LV_Paket_1_bis_3G',15,'A LV Paket 1 bis 3G',FALSE,'A LV Paket 1 bis 3G');
INSERT INTO arp_agglomerationsprogramme_pub.agglomrtnsprgrmme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A',16,'A',FALSE,'A');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'multisurface_surfaces','ch.ehi.ili2db.foreignKey','multisurface');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'kommentar','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'punktgeometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'punktgeometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'punktgeometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'punktgeometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'punktgeometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'punktgeometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'punktgeometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'handlungspaket','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'gemeinden','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'liniengeometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'liniengeometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'liniengeometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'liniengeometrie','ch.ehi.ili2db.geomType','LINESTRING');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'liniengeometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'liniengeometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'liniengeometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'beschreibung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'handlungspaket','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahmen',NULL,'kommentar','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'beschreibung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahmen',NULL,'ansprechperson','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahmen',NULL,'federfuehrung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'kommentar','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'federfuehrung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'beschreibung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'gemeinden','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahmen',NULL,'handlungspaket','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'handlungspaket','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'gemeinden','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahmen',NULL,'gemeinden','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'ansprechperson','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_uebersicht_gemeinde',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_uebersicht_gemeinde',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_uebersicht_gemeinde',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_uebersicht_gemeinde',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTIPOLYGON');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_uebersicht_gemeinde',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_uebersicht_gemeinde',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_uebersicht_gemeinde',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt',NULL,'kommentar','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'ansprechperson','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'ansprechperson','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'flaechengeometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'flaechengeometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'flaechengeometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'flaechengeometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'flaechengeometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'flaechengeometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'flaechengeometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahmen',NULL,'beschreibung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche',NULL,'federfuehrung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie',NULL,'federfuehrung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('agglomrtnsprgrmme_massnahmen','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('agglomrtnsprgrmme_umsetzungsstand','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('agglomrtnsprgrmme_uebersicht_gemeinde','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_punkt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_flaeche','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('surfacestructure','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('multisurface','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('agglomrtnsprgrmme_geometrietyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('agglomrtnsprgrmme_massnahme_linie','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('agglomrtnsprgrmme_prioritaet','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('agglomrtnsprgrmme_projektphase','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('chcantoncode','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CHBase_Part4_ADMINISTRATIVEUNITS_20110830.ili','2.3','CHAdminCodes_V1 AdministrativeUnits_V1{ CHAdminCodes_V1 InternationalCodes_V1 Dictionaries_V1 Localisation_V1 INTERLIS} AdministrativeUnitsCH_V1{ CHAdminCodes_V1 InternationalCodes_V1 LocalisationCH_V1 AdministrativeUnits_V1 INTERLIS}','/* ########################################################################
   CHBASE - BASE MODULES OF THE SWISS FEDERATION FOR MINIMAL GEODATA MODELS
   ======
   BASISMODULE DES BUNDES           MODULES DE BASE DE LA CONFEDERATION
   FÜR MINIMALE GEODATENMODELLE     POUR LES MODELES DE GEODONNEES MINIMAUX
   
   PROVIDER: GKG/KOGIS - GCS/COSIG             CONTACT: models@geo.admin.ch
   PUBLISHED: 2011-08-30
   ########################################################################
*/

INTERLIS 2.3;

/* ########################################################################
   ########################################################################
   PART IV -- ADMINISTRATIVE UNITS
   - Package CHAdminCodes
   - Package AdministrativeUnits
   - Package AdministrativeUnitsCH
*/

!! Version    | Who   | Modification
!!------------------------------------------------------------------------------
!! 2018-02-19 | KOGIS | Enumeration CHCantonCode adapted (FL and CH added)
!! 2020-04-24 | KOGIS | Constraint in Association Hierarchy in Model AdministrativeUnitsCH_V1 corrected (#CHE)
!! 2020-08-25 | KOGIS | Classes AdministrativeUnit and AdministrativeUnion declared as not abstract.

!! ########################################################################
!!@technicalContact=mailto:models@geo.admin.ch
!!@furtherInformation=https://www.geo.admin.ch/de/geoinformation-schweiz/geobasisdaten/geodata-models.html
TYPE MODEL CHAdminCodes_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2018-02-19" =

  DOMAIN
    CHCantonCode = (ZH,BE,LU,UR,SZ,OW,NW,GL,ZG,FR,SO,BS,BL,SH,AR,AI,SG,
                    GR,AG,TG,TI,VD,VS,NE,GE,JU,FL,CH);

    CHMunicipalityCode = 1..9999;  !! BFS-Nr

END CHAdminCodes_V1.

!! ########################################################################
!!@technicalContact=mailto:models@geo.admin.ch
!!@furtherInformation=https://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
MODEL AdministrativeUnits_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2020-08-25" =

  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS UNQUALIFIED CHAdminCodes_V1;
  IMPORTS UNQUALIFIED InternationalCodes_V1;
  IMPORTS Localisation_V1;
  IMPORTS Dictionaries_V1;

  TOPIC AdministrativeUnits (ABSTRACT) =

    CLASS AdministrativeElement (ABSTRACT) =
    END AdministrativeElement;

    CLASS AdministrativeUnit EXTENDS AdministrativeElement =
    END AdministrativeUnit;

    ASSOCIATION Hierarchy =
      UpperLevelUnit (EXTERNAL) -<> {0..1} AdministrativeUnit;
      LowerLevelUnit -- AdministrativeUnit;
    END Hierarchy;

    CLASS AdministrativeUnion EXTENDS AdministrativeElement =
    END AdministrativeUnion;

    ASSOCIATION UnionMembers =
      Union -<> AdministrativeUnion;
      Member -- AdministrativeElement; 
    END UnionMembers;

  END AdministrativeUnits;

  TOPIC Countries EXTENDS AdministrativeUnits =

    CLASS Country EXTENDS AdministrativeUnit =
      Code: MANDATORY CountryCode_ISO3166_1;
    UNIQUE Code;
    END Country;

  END Countries;

  TOPIC CountryNames EXTENDS Dictionaries_V1.Dictionaries =
    DEPENDS ON AdministrativeUnits_V1.Countries;

    STRUCTURE CountryName EXTENDS Entry =
      Code: MANDATORY CountryCode_ISO3166_1;
    END CountryName;
      
    CLASS CountryNamesTranslation EXTENDS Dictionary  =
      Entries(EXTENDED): LIST OF CountryName;
    UNIQUE Entries->Code;
    EXISTENCE CONSTRAINT
      Entries->Code REQUIRED IN AdministrativeUnits_V1.Countries.Country: Code;
    END CountryNamesTranslation;

  END CountryNames;

  TOPIC Agencies (ABSTRACT) =
    DEPENDS ON AdministrativeUnits_V1.AdministrativeUnits;

    CLASS Agency (ABSTRACT) =
    END Agency;

    ASSOCIATION Authority =
      Supervisor (EXTERNAL) -<> {1..1} Agency OR AdministrativeUnits_V1.AdministrativeUnits.AdministrativeElement;
      Agency -- Agency;
    END Authority;

    ASSOCIATION Organisation =
      Orderer (EXTERNAL) -- Agency OR AdministrativeUnits_V1.AdministrativeUnits.AdministrativeElement;
      Executor -- Agency;
    END Organisation;

  END Agencies;

END AdministrativeUnits_V1.

!! ########################################################################
!!@technicalContact=mailto:models@geo.admin.ch
!!@furtherInformation=https://www.geo.admin.ch/de/geoinformation-schweiz/geobasisdaten/geodata-models.html
MODEL AdministrativeUnitsCH_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2020-04-24" =

  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS UNQUALIFIED CHAdminCodes_V1;
  IMPORTS UNQUALIFIED InternationalCodes_V1;
  IMPORTS LocalisationCH_V1;
  IMPORTS AdministrativeUnits_V1;

  TOPIC CHCantons EXTENDS AdministrativeUnits_V1.AdministrativeUnits =
    DEPENDS ON AdministrativeUnits_V1.Countries;

    CLASS CHCanton EXTENDS AdministrativeUnit =
      Code: MANDATORY CHCantonCode;
      Name: LocalisationCH_V1.MultilingualText;
      Web: URI;
    UNIQUE Code;
    END CHCanton;

    ASSOCIATION Hierarchy (EXTENDED) =
      UpperLevelUnit (EXTENDED, EXTERNAL) -<> {1..1} AdministrativeUnits_V1.Countries.Country;
      LowerLevelUnit (EXTENDED) -- CHCanton;
    MANDATORY CONSTRAINT
      UpperLevelUnit->Code == #CHE;
    END Hierarchy;

  END CHCantons;

  TOPIC CHDistricts EXTENDS AdministrativeUnits_V1.AdministrativeUnits =
    DEPENDS ON AdministrativeUnitsCH_V1.CHCantons;

    CLASS CHDistrict EXTENDS AdministrativeUnit =
      ShortName: MANDATORY TEXT*20;
      Name: LocalisationCH_V1.MultilingualText;
      Web: MANDATORY URI;
    END CHDistrict;

    ASSOCIATION Hierarchy (EXTENDED) =
      UpperLevelUnit (EXTENDED, EXTERNAL) -<> {1..1} AdministrativeUnitsCH_V1.CHCantons.CHCanton;
      LowerLevelUnit (EXTENDED) -- CHDistrict;
    UNIQUE UpperLevelUnit->Code, LowerLevelUnit->ShortName;
    END Hierarchy;

  END CHDistricts;

  TOPIC CHMunicipalities EXTENDS AdministrativeUnits_V1.AdministrativeUnits =
    DEPENDS ON AdministrativeUnitsCH_V1.CHCantons;
    DEPENDS ON AdministrativeUnitsCH_V1.CHDistricts;

    CLASS CHMunicipality EXTENDS AdministrativeUnit =
      Code: MANDATORY CHMunicipalityCode;
      Name: LocalisationCH_V1.MultilingualText;
      Web: URI;
    UNIQUE Code;
    END CHMunicipality;

    ASSOCIATION Hierarchy (EXTENDED) =
      UpperLevelUnit (EXTENDED, EXTERNAL) -<> {1..1} AdministrativeUnitsCH_V1.CHCantons.CHCanton
      OR AdministrativeUnitsCH_V1.CHDistricts.CHDistrict;
      LowerLevelUnit (EXTENDED) -- CHMunicipality;
    END Hierarchy;

  END CHMunicipalities;

  TOPIC CHAdministrativeUnions EXTENDS AdministrativeUnits_V1.AdministrativeUnits =
    DEPENDS ON AdministrativeUnits_V1.Countries;
    DEPENDS ON AdministrativeUnitsCH_V1.CHCantons;
    DEPENDS ON AdministrativeUnitsCH_V1.CHDistricts;
    DEPENDS ON AdministrativeUnitsCH_V1.CHMunicipalities;

    CLASS AdministrativeUnion (EXTENDED) =
    OID AS UUIDOID;
      Name: LocalisationCH_V1.MultilingualText;
      Web: URI;
      Description: LocalisationCH_V1.MultilingualMText;
    END AdministrativeUnion;

  END CHAdministrativeUnions;

  TOPIC CHAgencies EXTENDS AdministrativeUnits_V1.Agencies =
    DEPENDS ON AdministrativeUnits_V1.Countries;
    DEPENDS ON AdministrativeUnitsCH_V1.CHCantons;
    DEPENDS ON AdministrativeUnitsCH_V1.CHDistricts;
    DEPENDS ON AdministrativeUnitsCH_V1.CHMunicipalities;

    CLASS Agency (EXTENDED) =
    OID AS UUIDOID;
      Name: LocalisationCH_V1.MultilingualText;
      Web: URI;
      Description: LocalisationCH_V1.MultilingualMText;
    END Agency;

  END CHAgencies;

END AdministrativeUnitsCH_V1.

!! ########################################################################
','2020-10-22 15:42:30.989');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813.ili','2.3','SO_Agglomerationsprogramme_Publikation_20200813{ GeometryCHLV95_V1 CHAdminCodes_V1}','INTERLIS 2.3;

/** !!---------------------------------------------------------------------------------------------------------------
 * !! Version    | wer | Änderung 
 * !!--------------------------------------------------------------------------------------------------------------- 
 * !! 2017-01-17 | Noëmi Sturm    | Erstfassung 
 * !! 2017-01-19 | Noëmi Sturm    | Anpassungen gemäss Rückmeldungen
 * !! 2017-01-23 | Noëmi Sturm    | Ergänzung der Class Aggloprogramm
 * !! 2017-02-03 | Noëmi Sturm    | Anpassungen gemäss Rückmeldungen
 * !! 2018-04-30 | Noëmi Sturm    | Suchattribut und Status ergänzt (für WebGIS)
 * !! 2018-06-20 | Noëmi Sturm    | Suchattribut entfernt
 * !! 2020-08-13 | Andrea Lüscher | Anpassung an Richtlinien Programm Agglomerationsverkehr vom ARE (13. Februar 2020)
 * !!=================================================================================================================
 */
!!@ technicalContact=mailto:agi@bd.so.ch
!!@ furtherInformation=https://geo.so.ch/models/ARP/SO_Agglomerationsprogramme_Publikation_20200813.uml
MODEL SO_Agglomerationsprogramme_Publikation_20200813 (de)
AT "http://www.geo.so.ch/models/ARP"
VERSION "2020-08-13"  =
  IMPORTS GeometryCHLV95_V1,CHAdminCodes_V1;

  TOPIC Agglomerationsprogramme =

    DOMAIN

      Geometrietyp = (
        /** keine Geometrie
         */
        keine_Geometrie,
        /** Flächengeometrie
         */
        Flaechengeometrie,
        /** Liniengeometrie
         */
        Liniengeometrie,
        /** Punktgeometrie
         */
        Punktgeometrie
      );

      Prioritaet = (
        /** Vorleistung
         */
        Vorleistung,
        /** Daueraufgabe
         */
        Daueraufgabe,
        /** C
         */
        C,
        /** A Eigene Leistung
         */
        A_Eigene_Leistung,
        /** B Eigene Leistung
         */
        B_Eigene_Leistung,
        /** B
         */
        B,
        /** A Massnahmenpaket Pauschal: Aufwertung/Sicherheit Strassenraum
         */
        A_MP_Pauschal_Aufwertung_Sicherheit_Strassenraum,
        /** A Massnahmenpaket Pauschal: Verkehrsmanagement
         */
        A_MP_Pauschal_Verkehrsmanagement,
        /** A Massnahmenpaket Pauschal: Langsamverkehr
         */
        A_MP_Pauschal_Langsamverkehr,
        /** B Massnahmenpaket Pauschal: Langsamverkehr
         */
        B_MP_Pauschal_Langsamverkehr,
        /** B Massnahmenpaket Pauschal: Verkehrsmanagement
         */
        B_MP_Pauschal_Verkehrsmanagement,
        /** A Massnahmenpaket Pauschal: Aufwertung Bus- und Tramhaltestellen
         */
        A_MP_Pauschal_Aufwertung_Bus_Tramhaltestellen,
        /** B Massnahmenpaket Pauschal: Aufwertung Bus- und Tramhaltestellen
         */
        B_MP_Pauschal_Aufwertung_Bus_Tramhaltestellen,
        /** B Massnahmenpaket Pauschal: Aufwertung/Sicherheit Strassenraum
         */
        B_MP_Pauschal_Aufwertung_Sicherheit_Strassenraum,
        /** B LV Paket 1 bis 3G
         */
        B_LV_Paket_1_bis_3G,
        /** A LV Paket 1 bis 3G
         */
        A_LV_Paket_1_bis_3G,
        /** A
         */
        A
      );

    /** Übersicht pro Gemeinde von welchem Agglomerationsprogramm es betroffen ist. Im Web GIS Client braucht es den Perimeter, um den Report über den Stand der Massnahmen pro Gemeinde zu öffnen.
     */
    CLASS Uebersicht_Gemeinde =
      /** Name des Agglomerationsprogramms
       */
      Aggloprogramm : MANDATORY TEXT*200;
      /** Gemeindename
       */
      Gemeinde : MANDATORY TEXT*200;
      /** BFS-Nr der Gemeinde
       */
      BFS_Nr : MANDATORY 0 .. 9999;
      /** Kantonskuerzel
       */
      Kanton : CHAdminCodes_V1.CHCantonCode;
      /** Landeskuerzel
       */
      Land : MANDATORY TEXT*2;
      /** Geometrie der Gemeinde
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiSurface;
      /** Bezeichnung des Agglomerationsprogramms gemäss Code von «Raum mit städtischem Charakter 2012»
       */
      Agglomerationsprogramm_Nummer : TEXT*20;
    END Uebersicht_Gemeinde;

    DOMAIN

      Projektphase = (
        /** archiviert
         */
        archiviert,
        /** gestoppt
         */
        gestoppt,
        /** Daueraufgabe
         */
        Daueraufgabe,
        /** umgesetzt
         */
        umgesetzt,
        /** Bauphase
         */
        Bauphase,
        /** Nutzungsplanung erfolgt
         */
        NP_erfolgt,
        /** Planung / Vorprojekt
         */
        Planung_Vorprojekt
      );

      Umsetzungsstand = (
        /** in Erarbeitung
         */
        in_Erarbeitung,
        /** Planungsstopp / Sistierung
         */
        Planungsstopp_Sistierung,
        /** nicht eingereicht
         */
        nicht_eingereicht,
        /** realisiert
         */
        realisiert,
        /** grössere zeitliche Verzögerung
         */
        groessere_zeitliche_Verzoegerung,
        /** kurze zeitliche Verzögerung
         */
        kurze_zeitliche_Verzoegerung,
        /** im Soll
         */
        im_Soll
      );

    CLASS Massnahme (ABSTRACT) =
      /** Name des Agglomerationsprogramm (Solothurn, AareLand oder Basel)
       */
      Agglomerationsprogramm : MANDATORY TEXT*200;
      /** Die Generation des Agglommerationsprogrammes
       */
      Generation : MANDATORY 0 .. 100;
      /** Das Handlungsfeld beschreibt die thematische Eingliederung der Massnahmen in die Bereiche Siedlung / Landschaft oder Verkehr.
       */
      Handlungsfeld : MANDATORY TEXT*200;
      /** Das Handlungspaket beschreibt die Massnahmen im Themenbereich. Bei den Verkehrsmassnahmen gilt es die Massnahmen nach den verschiedenen Mobilitätsformen zuzuordnen.
       */
      Handlungspaket : MANDATORY MTEXT*200;
      /** Bei den Massnahmenkategorien handelt es sich um die konkrete Zuordnung der Massnahmen. Die Massnahmenkategorien im Bereich Verkehr sind mit den Richtlinien der Agglomerationsprogramme abgestimmt.
       */
      Massnahmekategorie : TEXT*200;
      /** Prioritaet
       */
      Prioritaet : Prioritaet;
      /** Massnahmennummer gemäss Trägerschaf
       */
      Massnahmennummer : MANDATORY TEXT*255;
      /** Offizieller Name der Massnahme laut Massnahmenblatt
       */
      Beschreibung : MTEXT;
      /** Kosten gemäss Massnahmenblatt in Mio. CHF
       */
      Kosten_Massnahmenblatt : 0 .. 100000000;
      /** Kosten gemäss Leistungsvereinbarung in Fr.
       */
      Kosten_Leistungsvereinbarung : 0 .. 100000000;
      /** aktueller Kostenstand in Mio. CHF.
       */
      Kostenstand_aktuell : 0 .. 100000000;
      /** Kosten gemäss Leistungsvereinbarung mit dem Bund in Mio. CHF.
       */
      Kostenanteil_Bund : 0 .. 999999999;
      /** Pfad zum PDF-Dokument des Massnahmenblattes aus dem Hauptbericht des Agglomerationsprogrammes.
       */
      Massnahmenblatt : INTERLIS.URI;
      /** Für die Massnahme zuständiges Amt/Person
       */
      Ansprechperson : MTEXT;
      /** Kommentar, obligatorisch für die Unterkategorie Kernentlastungs- und Umfahrungsstrassen
       */
      Kommentar : MTEXT;
      /** Projektphase
       */
      Projektphase : Projektphase;
      /** aktueller Stand der Umsetzung
       */
      Umsetzungsstand : Umsetzungsstand;
      /** Name der federführenden Aemter/Personen
       */
      Federfuehrung : MTEXT;
      /** beteiligte Gemeinden
       */
      Gemeinden : MTEXT;
      /** gemaess Massnahmenblatt
       */
      infrastrukturell : BOOLEAN;
      /** Link zur Webseite der Agglomeration für Massnahmen aus einem anderen Kanton (z.B. Kanton Aargau im AP AareLand)
       */
      Agglomerationsprogramm_URL : INTERLIS.URI;
      /** Datum der Änderung
       */
      letzte_Anpassung : INTERLIS.XMLDate;
      /** Unterkategorie der Massnahmekategorie
       */
      Unterkategorie : TEXT*500;
      /** Bezeichnung des Agglomerationsprogramms gemäss Code von «Raum mit städtischem Charakter 2012»
       */
      Agglomerationsprogramm_Nr : TEXT*20;
      ARE_CODE : TEXT*20;
      /** Finanzvereinbarung
       */
      Finanzvereinbarung : BOOLEAN;
      /** Finanzierungsvereinbarungsnummer
       */
      Finanzierungsvereinbarungsnr : TEXT*20;
      /** Kostenanteil Leistungsvereinbarung/Massnahmepaket
       */
      Kostenanteil_LV_MP : TEXT*20;
      /** Baubeginn geplant gemäss Leistungsvereinbarung
       */
      Baubeginn_geplant_LV : TEXT*20;
      /** aktueller Stand der Umsetzung als schöner Text
       */
      Umsetzungsstand_Text : TEXT*100;
      /** Priorität als schöner Text
       */
      Prioritaet_Text : TEXT*100;
      /** Projektphase als schöner Text
       */
      Projektphase_Text : TEXT*100;
    END Massnahme;

    /** Alle Massnahmen mit einer Flächengeometrie
     */
    CLASS Massnahme_Flaeche
    EXTENDS Massnahme =
      /** Flaechengeometrie
       */
      Flaechengeometrie : GeometryCHLV95_V1.Surface;
    END Massnahme_Flaeche;

    /** Alle Massnahmen mit einer Liniengeometrie
     */
    CLASS Massnahme_Linie
    EXTENDS Massnahme =
      /** Liniengeometrie
       */
      Liniengeometrie : GeometryCHLV95_V1.Line;
    END Massnahme_Linie;

    /** Alle Massnahmen mit einer Punktgeometrie
     */
    CLASS Massnahme_Punkt
    EXTENDS Massnahme =
      /** Punktgeometrie
       */
      Punktgeometrie : GeometryCHLV95_V1.Coord2;
    END Massnahme_Punkt;

    /** Alle Massnahmen. D.h. alle Massnahmen mit Punkt-, Linien- und Flächengeometrien und die ohne Geometrie.
     */
    CLASS Massnahmen
    EXTENDS Massnahme =
      /** Geometrietyp
       */
      Geometrietyp : Geometrietyp;
    END Massnahmen;

  END Agglomerationsprogramme;

END SO_Agglomerationsprogramme_Publikation_20200813.
','2020-10-22 15:42:30.989');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('Units-20120220.ili','2.3','Units','!! File Units.ili Release 2012-02-20

INTERLIS 2.3;

!! 2012-02-20 definition of "Bar [bar]" corrected
!!@precursorVersion = 2005-06-06

CONTRACTED TYPE MODEL Units (en) AT "http://www.interlis.ch/models"
  VERSION "2012-02-20" =

  UNIT
    !! abstract Units
    Area (ABSTRACT) = (INTERLIS.LENGTH*INTERLIS.LENGTH);
    Volume (ABSTRACT) = (INTERLIS.LENGTH*INTERLIS.LENGTH*INTERLIS.LENGTH);
    Velocity (ABSTRACT) = (INTERLIS.LENGTH/INTERLIS.TIME);
    Acceleration (ABSTRACT) = (Velocity/INTERLIS.TIME);
    Force (ABSTRACT) = (INTERLIS.MASS*INTERLIS.LENGTH/INTERLIS.TIME/INTERLIS.TIME);
    Pressure (ABSTRACT) = (Force/Area);
    Energy (ABSTRACT) = (Force*INTERLIS.LENGTH);
    Power (ABSTRACT) = (Energy/INTERLIS.TIME);
    Electric_Potential (ABSTRACT) = (Power/INTERLIS.ELECTRIC_CURRENT);
    Frequency (ABSTRACT) = (INTERLIS.DIMENSIONLESS/INTERLIS.TIME);

    Millimeter [mm] = 0.001 [INTERLIS.m];
    Centimeter [cm] = 0.01 [INTERLIS.m];
    Decimeter [dm] = 0.1 [INTERLIS.m];
    Kilometer [km] = 1000 [INTERLIS.m];

    Square_Meter [m2] EXTENDS Area = (INTERLIS.m*INTERLIS.m);
    Cubic_Meter [m3] EXTENDS Volume = (INTERLIS.m*INTERLIS.m*INTERLIS.m);

    Minute [min] = 60 [INTERLIS.s];
    Hour [h] = 60 [min];
    Day [d] = 24 [h];

    Kilometer_per_Hour [kmh] EXTENDS Velocity = (km/h);
    Meter_per_Second [ms] = 3.6 [kmh];
    Newton [N] EXTENDS Force = (INTERLIS.kg*INTERLIS.m/INTERLIS.s/INTERLIS.s);
    Pascal [Pa] EXTENDS Pressure = (N/m2);
    Joule [J] EXTENDS Energy = (N*INTERLIS.m);
    Watt [W] EXTENDS Power = (J/INTERLIS.s);
    Volt [V] EXTENDS Electric_Potential = (W/INTERLIS.A);

    Inch [in] = 2.54 [cm];
    Foot [ft] = 0.3048 [INTERLIS.m];
    Mile [mi] = 1.609344 [km];

    Are [a] = 100 [m2];
    Hectare [ha] = 100 [a];
    Square_Kilometer [km2] = 100 [ha];
    Acre [acre] = 4046.873 [m2];

    Liter [L] = 1 / 1000 [m3];
    US_Gallon [USgal] = 3.785412 [L];

    Angle_Degree = 180 / PI [INTERLIS.rad];
    Angle_Minute = 1 / 60 [Angle_Degree];
    Angle_Second = 1 / 60 [Angle_Minute];

    Gon = 200 / PI [INTERLIS.rad];

    Gram [g] = 1 / 1000 [INTERLIS.kg];
    Ton [t] = 1000 [INTERLIS.kg];
    Pound [lb] = 0.4535924 [INTERLIS.kg];

    Calorie [cal] = 4.1868 [J];
    Kilowatt_Hour [kWh] = 0.36E7 [J];

    Horsepower = 746 [W];

    Techn_Atmosphere [at] = 98066.5 [Pa];
    Atmosphere [atm] = 101325 [Pa];
    Bar [bar] = 100000 [Pa];
    Millimeter_Mercury [mmHg] = 133.3224 [Pa];
    Torr = 133.3224 [Pa]; !! Torr = [mmHg]

    Decibel [dB] = FUNCTION // 10**(dB/20) * 0.00002 // [Pa];

    Degree_Celsius [oC] = FUNCTION // oC+273.15 // [INTERLIS.K];
    Degree_Fahrenheit [oF] = FUNCTION // (oF+459.67)/1.8 // [INTERLIS.K];

    CountedObjects EXTENDS INTERLIS.DIMENSIONLESS;

    Hertz [Hz] EXTENDS Frequency = (CountedObjects/INTERLIS.s);
    KiloHertz [KHz] = 1000 [Hz];
    MegaHertz [MHz] = 1000 [KHz];

    Percent = 0.01 [CountedObjects];
    Permille = 0.001 [CountedObjects];

    !! ISO 4217 Currency Abbreviation
    USDollar [USD] EXTENDS INTERLIS.MONEY;
    Euro [EUR] EXTENDS INTERLIS.MONEY;
    SwissFrancs [CHF] EXTENDS INTERLIS.MONEY;

END Units.

','2020-10-22 15:42:30.989');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CoordSys-20151124.ili','2.3','CoordSys','!! File CoordSys.ili Release 2015-11-24

INTERLIS 2.3;

!! 2015-11-24 Cardinalities adapted (line 122, 123, 124, 132, 133, 134, 142, 143,
!!                                   148, 149, 163, 164, 168, 169, 206 and 207)
!!@precursorVersion = 2005-06-16

REFSYSTEM MODEL CoordSys (en) AT "http://www.interlis.ch/models"
  VERSION "2015-11-24" =

  UNIT
    Angle_Degree = 180 / PI [INTERLIS.rad];
    Angle_Minute = 1 / 60 [Angle_Degree];
    Angle_Second = 1 / 60 [Angle_Minute];

  STRUCTURE Angle_DMS_S =
    Degrees: -180 .. 180 CIRCULAR [Angle_Degree];
    CONTINUOUS SUBDIVISION Minutes: 0 .. 59 CIRCULAR [Angle_Minute];
    CONTINUOUS SUBDIVISION Seconds: 0.000 .. 59.999 CIRCULAR [Angle_Second];
  END Angle_DMS_S;

  DOMAIN
    Angle_DMS = FORMAT BASED ON Angle_DMS_S (Degrees ":" Minutes ":" Seconds);
    Angle_DMS_90 EXTENDS Angle_DMS = "-90:00:00.000" .. "90:00:00.000";


  TOPIC CoordsysTopic =

    !! Special space aspects to be referenced
    !! **************************************

    CLASS Ellipsoid EXTENDS INTERLIS.REFSYSTEM =
      EllipsoidAlias: TEXT*70;
      SemiMajorAxis: MANDATORY 6360000.0000 .. 6390000.0000 [INTERLIS.m];
      InverseFlattening: MANDATORY 0.00000000 .. 350.00000000;
      !! The inverse flattening 0 characterizes the 2-dim sphere
      Remarks: TEXT*70;
    END Ellipsoid;

    CLASS GravityModel EXTENDS INTERLIS.REFSYSTEM =
      GravityModAlias: TEXT*70;
      Definition: TEXT*70;
    END GravityModel;

    CLASS GeoidModel EXTENDS INTERLIS.REFSYSTEM =
      GeoidModAlias: TEXT*70;
      Definition: TEXT*70;
    END GeoidModel;


    !! Coordinate systems for geodetic purposes
    !! ****************************************

    STRUCTURE LengthAXIS EXTENDS INTERLIS.AXIS =
      ShortName: TEXT*12;
      Description: TEXT*255;
    PARAMETER
      Unit (EXTENDED): NUMERIC [INTERLIS.LENGTH];
    END LengthAXIS;

    STRUCTURE AngleAXIS EXTENDS INTERLIS.AXIS =
      ShortName: TEXT*12;
      Description: TEXT*255;
    PARAMETER
      Unit (EXTENDED): NUMERIC [INTERLIS.ANGLE];
    END AngleAXIS;

    CLASS GeoCartesian1D EXTENDS INTERLIS.COORDSYSTEM =
      Axis (EXTENDED): LIST {1} OF LengthAXIS;
    END GeoCartesian1D;

    CLASS GeoHeight EXTENDS GeoCartesian1D =
      System: MANDATORY (
        normal,
        orthometric,
        ellipsoidal,
        other);
      ReferenceHeight: MANDATORY -10000.000 .. +10000.000 [INTERLIS.m];
      ReferenceHeightDescr: TEXT*70;
    END GeoHeight;

    ASSOCIATION HeightEllips =
      GeoHeightRef -- {*} GeoHeight;
      EllipsoidRef -- {1} Ellipsoid;
    END HeightEllips;

    ASSOCIATION HeightGravit =
      GeoHeightRef -- {*} GeoHeight;
      GravityRef -- {1} GravityModel;
    END HeightGravit;

    ASSOCIATION HeightGeoid =
      GeoHeightRef -- {*} GeoHeight;
      GeoidRef -- {1} GeoidModel;
    END HeightGeoid;

    CLASS GeoCartesian2D EXTENDS INTERLIS.COORDSYSTEM =
      Definition: TEXT*70;
      Axis (EXTENDED): LIST {2} OF LengthAXIS;
    END GeoCartesian2D;

    CLASS GeoCartesian3D EXTENDS INTERLIS.COORDSYSTEM =
      Definition: TEXT*70;
      Axis (EXTENDED): LIST {3} OF LengthAXIS;
    END GeoCartesian3D;

    CLASS GeoEllipsoidal EXTENDS INTERLIS.COORDSYSTEM =
      Definition: TEXT*70;
      Axis (EXTENDED): LIST {2} OF AngleAXIS;
    END GeoEllipsoidal;

    ASSOCIATION EllCSEllips =
      GeoEllipsoidalRef -- {*} GeoEllipsoidal;
      EllipsoidRef -- {1} Ellipsoid;
    END EllCSEllips;


    !! Mappings between coordinate systems
    !! ***********************************

    ASSOCIATION ToGeoEllipsoidal =
      From -- {0..*} GeoCartesian3D;
      To -- {0..*} GeoEllipsoidal;
      ToHeight -- {0..*} GeoHeight;
    MANDATORY CONSTRAINT
      ToHeight -> System == #ellipsoidal;
    MANDATORY CONSTRAINT
      To -> EllipsoidRef -> Name == ToHeight -> EllipsoidRef -> Name;
    END ToGeoEllipsoidal;

    ASSOCIATION ToGeoCartesian3D =
      From2 -- {0..*} GeoEllipsoidal;
      FromHeight-- {0..*} GeoHeight;
      To3 -- {0..*} GeoCartesian3D;
    MANDATORY CONSTRAINT
      FromHeight -> System == #ellipsoidal;
    MANDATORY CONSTRAINT
      From2 -> EllipsoidRef -> Name == FromHeight -> EllipsoidRef -> Name;
    END ToGeoCartesian3D;

    ASSOCIATION BidirectGeoCartesian2D =
      From -- {0..*} GeoCartesian2D;
      To -- {0..*} GeoCartesian2D;
    END BidirectGeoCartesian2D;

    ASSOCIATION BidirectGeoCartesian3D =
      From -- {0..*} GeoCartesian3D;
      To2 -- {0..*} GeoCartesian3D;
      Precision: MANDATORY (
        exact,
        measure_based);
      ShiftAxis1: MANDATORY -10000.000 .. 10000.000 [INTERLIS.m];
      ShiftAxis2: MANDATORY -10000.000 .. 10000.000 [INTERLIS.m];
      ShiftAxis3: MANDATORY -10000.000 .. 10000.000 [INTERLIS.m];
      RotationAxis1: Angle_DMS_90;
      RotationAxis2: Angle_DMS_90;
      RotationAxis3: Angle_DMS_90;
      NewScale: 0.000001 .. 1000000.000000;
    END BidirectGeoCartesian3D;

    ASSOCIATION BidirectGeoEllipsoidal =
      From4 -- {0..*} GeoEllipsoidal;
      To4 -- {0..*} GeoEllipsoidal;
    END BidirectGeoEllipsoidal;

    ASSOCIATION MapProjection (ABSTRACT) =
      From5 -- {0..*} GeoEllipsoidal;
      To5 -- {0..*} GeoCartesian2D;
      FromCo1_FundPt: MANDATORY Angle_DMS_90;
      FromCo2_FundPt: MANDATORY Angle_DMS_90;
      ToCoord1_FundPt: MANDATORY -10000000 .. +10000000 [INTERLIS.m];
      ToCoord2_FundPt: MANDATORY -10000000 .. +10000000 [INTERLIS.m];
    END MapProjection;

    ASSOCIATION TransverseMercator EXTENDS MapProjection =
    END TransverseMercator;

    ASSOCIATION SwissProjection EXTENDS MapProjection =
      IntermFundP1: MANDATORY Angle_DMS_90;
      IntermFundP2: MANDATORY Angle_DMS_90;
    END SwissProjection;

    ASSOCIATION Mercator EXTENDS MapProjection =
    END Mercator;

    ASSOCIATION ObliqueMercator EXTENDS MapProjection =
    END ObliqueMercator;

    ASSOCIATION Lambert EXTENDS MapProjection =
    END Lambert;

    ASSOCIATION Polyconic EXTENDS MapProjection =
    END Polyconic;

    ASSOCIATION Albus EXTENDS MapProjection =
    END Albus;

    ASSOCIATION Azimutal EXTENDS MapProjection =
    END Azimutal;

    ASSOCIATION Stereographic EXTENDS MapProjection =
    END Stereographic;

    ASSOCIATION HeightConversion =
      FromHeight -- {0..*} GeoHeight;
      ToHeight -- {0..*} GeoHeight;
      Definition: TEXT*70;
    END HeightConversion;

  END CoordsysTopic;

END CoordSys.

','2020-10-22 15:42:30.989');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CHBase_Part2_LOCALISATION_20110830.ili','2.3','InternationalCodes_V1 Localisation_V1{ InternationalCodes_V1} LocalisationCH_V1{ InternationalCodes_V1 Localisation_V1} Dictionaries_V1{ InternationalCodes_V1} DictionariesCH_V1{ InternationalCodes_V1 Dictionaries_V1}','/* ########################################################################
   CHBASE - BASE MODULES OF THE SWISS FEDERATION FOR MINIMAL GEODATA MODELS
   ======
   BASISMODULE DES BUNDES           MODULES DE BASE DE LA CONFEDERATION
   FÜR MINIMALE GEODATENMODELLE     POUR LES MODELES DE GEODONNEES MINIMAUX
   
   PROVIDER: GKG/KOGIS - GCS/COSIG             CONTACT: models@geo.admin.ch
   PUBLISHED: 2011-08-30
   ########################################################################
*/

INTERLIS 2.3;

/* ########################################################################
   ########################################################################
   PART II -- LOCALISATION
   - Package InternationalCodes
   - Packages Localisation, LocalisationCH
   - Packages Dictionaries, DictionariesCH
*/

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
TYPE MODEL InternationalCodes_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  DOMAIN
    LanguageCode_ISO639_1 = (de,fr,it,rm,en,
      aa,ab,af,am,ar,as,ay,az,ba,be,bg,bh,bi,bn,bo,br,ca,co,cs,cy,da,dz,el,
      eo,es,et,eu,fa,fi,fj,fo,fy,ga,gd,gl,gn,gu,ha,he,hi,hr,hu,hy,ia,id,ie,
      ik,is,iu,ja,jw,ka,kk,kl,km,kn,ko,ks,ku,ky,la,ln,lo,lt,lv,mg,mi,mk,ml,
      mn,mo,mr,ms,mt,my,na,ne,nl,no,oc,om,or,pa,pl,ps,pt,qu,rn,ro,ru,rw,sa,
      sd,sg,sh,si,sk,sl,sm,sn,so,sq,sr,ss,st,su,sv,sw,ta,te,tg,th,ti,tk,tl,
      tn,to,tr,ts,tt,tw,ug,uk,ur,uz,vi,vo,wo,xh,yi,yo,za,zh,zu);

    CountryCode_ISO3166_1 = (CHE,
      ABW,AFG,AGO,AIA,ALA,ALB,AND_,ANT,ARE,ARG,ARM,ASM,ATA,ATF,ATG,AUS,
      AUT,AZE,BDI,BEL,BEN,BFA,BGD,BGR,BHR,BHS,BIH,BLR,BLZ,BMU,BOL,BRA,
      BRB,BRN,BTN,BVT,BWA,CAF,CAN,CCK,CHL,CHN,CIV,CMR,COD,COG,COK,COL,
      COM,CPV,CRI,CUB,CXR,CYM,CYP,CZE,DEU,DJI,DMA,DNK,DOM,DZA,ECU,EGY,
      ERI,ESH,ESP,EST,ETH,FIN,FJI,FLK,FRA,FRO,FSM,GAB,GBR,GEO,GGY,GHA,
      GIB,GIN,GLP,GMB,GNB,GNQ,GRC,GRD,GRL,GTM,GUF,GUM,GUY,HKG,HMD,HND,
      HRV,HTI,HUN,IDN,IMN,IND,IOT,IRL,IRN,IRQ,ISL,ISR,ITA,JAM,JEY,JOR,
      JPN,KAZ,KEN,KGZ,KHM,KIR,KNA,KOR,KWT,LAO,LBN,LBR,LBY,LCA,LIE,LKA,
      LSO,LTU,LUX,LVA,MAC,MAR,MCO,MDA,MDG,MDV,MEX,MHL,MKD,MLI,MLT,MMR,
      MNE,MNG,MNP,MOZ,MRT,MSR,MTQ,MUS,MWI,MYS,MYT,NAM,NCL,NER,NFK,NGA,
      NIC,NIU,NLD,NOR,NPL,NRU,NZL,OMN,PAK,PAN,PCN,PER,PHL,PLW,PNG,POL,
      PRI,PRK,PRT,PRY,PSE,PYF,QAT,REU,ROU,RUS,RWA,SAU,SDN,SEN,SGP,SGS,
      SHN,SJM,SLB,SLE,SLV,SMR,SOM,SPM,SRB,STP,SUR,SVK,SVN,SWE,SWZ,SYC,
      SYR,TCA,TCD,TGO,THA,TJK,TKL,TKM,TLS,TON,TTO,TUN,TUR,TUV,TWN,TZA,
      UGA,UKR,UMI,URY,USA,UZB,VAT,VCT,VEN,VGB,VIR,VNM,VUT,WLF,WSM,YEM,
      ZAF,ZMB,ZWE);

END InternationalCodes_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
TYPE MODEL Localisation_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED InternationalCodes_V1;

  STRUCTURE LocalisedText =
    Language: LanguageCode_ISO639_1;
    Text: MANDATORY TEXT;
  END LocalisedText;
  
  STRUCTURE LocalisedMText =
    Language: LanguageCode_ISO639_1;
    Text: MANDATORY MTEXT;
  END LocalisedMText;

  STRUCTURE MultilingualText =
    LocalisedText : BAG {1..*} OF LocalisedText;
    UNIQUE (LOCAL) LocalisedText:Language;
  END MultilingualText;  
  
  STRUCTURE MultilingualMText =
    LocalisedText : BAG {1..*} OF LocalisedMText;
    UNIQUE (LOCAL) LocalisedText:Language;
  END MultilingualMText;

END Localisation_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
TYPE MODEL LocalisationCH_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED InternationalCodes_V1;
  IMPORTS Localisation_V1;

  STRUCTURE LocalisedText EXTENDS Localisation_V1.LocalisedText =
  MANDATORY CONSTRAINT
    Language == #de OR
    Language == #fr OR
    Language == #it OR
    Language == #rm OR
    Language == #en;
  END LocalisedText;
  
  STRUCTURE LocalisedMText EXTENDS Localisation_V1.LocalisedMText =
  MANDATORY CONSTRAINT
    Language == #de OR
    Language == #fr OR
    Language == #it OR
    Language == #rm OR
    Language == #en;
  END LocalisedMText;

  STRUCTURE MultilingualText EXTENDS Localisation_V1.MultilingualText =
    LocalisedText(EXTENDED) : BAG {1..*} OF LocalisedText;
  END MultilingualText;  
  
  STRUCTURE MultilingualMText EXTENDS Localisation_V1.MultilingualMText =
    LocalisedText(EXTENDED) : BAG {1..*} OF LocalisedMText;
  END MultilingualMText;

END LocalisationCH_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
MODEL Dictionaries_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED InternationalCodes_V1;

  TOPIC Dictionaries (ABSTRACT) =

    STRUCTURE Entry (ABSTRACT) =
      Text: MANDATORY TEXT;
    END Entry;
      
    CLASS Dictionary =
      Language: MANDATORY LanguageCode_ISO639_1;
      Entries: LIST OF Entry;
    END Dictionary;

  END Dictionaries;

END Dictionaries_V1.

!! ########################################################################
!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html
MODEL DictionariesCH_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2011-08-30" =

  IMPORTS UNQUALIFIED InternationalCodes_V1;
  IMPORTS Dictionaries_V1;

  TOPIC Dictionaries (ABSTRACT) EXTENDS Dictionaries_V1.Dictionaries =

    CLASS Dictionary (EXTENDED) =
    MANDATORY CONSTRAINT
      Language == #de OR
      Language == #fr OR
      Language == #it OR
      Language == #rm OR
      Language == #en;
    END Dictionary;

  END Dictionaries;

END DictionariesCH_V1.

!! ########################################################################
','2020-10-22 15:42:30.989');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CHBase_Part1_GEOMETRY_20110830.ili','2.3','GeometryCHLV03_V1{ CoordSys Units INTERLIS} GeometryCHLV95_V1{ CoordSys Units INTERLIS}','/* ########################################################################
   CHBASE - BASE MODULES OF THE SWISS FEDERATION FOR MINIMAL GEODATA MODELS
   ======
   BASISMODULE DES BUNDES           MODULES DE BASE DE LA CONFEDERATION
   FÜR MINIMALE GEODATENMODELLE     POUR LES MODELES DE GEODONNEES MINIMAUX
   
   PROVIDER: GKG/KOGIS - GCS/COSIG             CONTACT: models@geo.admin.ch
   PUBLISHED: 2011-0830
   ########################################################################
*/

INTERLIS 2.3;

/* ########################################################################
   ########################################################################
   PART I -- GEOMETRY
   - Package GeometryCHLV03
   - Package GeometryCHLV95
*/

!! ########################################################################

!! Version    | Who   | Modification
!!------------------------------------------------------------------------------
!! 2015-02-20 | KOGIS | WITHOUT OVERLAPS added (line 57, 58, 65 and 66)
!! 2015-11-12 | KOGIS | WITHOUT OVERLAPS corrected (line 57 and 58)
!! 2017-11-27 | KOGIS | Meta-Attributes @furtherInformation adapted and @CRS added (line 31, 44 and 50)
!! 2017-12-04 | KOGIS | Meta-Attribute @CRS corrected

!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=https://www.geo.admin.ch/de/geoinformation-schweiz/geobasisdaten/geodata-models.html
TYPE MODEL GeometryCHLV03_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2017-12-04" =

  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS Units;
  IMPORTS CoordSys;

  REFSYSTEM BASKET BCoordSys ~ CoordSys.CoordsysTopic
    OBJECTS OF GeoCartesian2D: CHLV03
    OBJECTS OF GeoHeight: SwissOrthometricAlt;

  DOMAIN
    !!@CRS=EPSG:21781
    Coord2 = COORD
      460000.000 .. 870000.000 [m] {CHLV03[1]},
       45000.000 .. 310000.000 [m] {CHLV03[2]},
      ROTATION 2 -> 1;

    !!@CRS=EPSG:21781
    Coord3 = COORD
      460000.000 .. 870000.000 [m] {CHLV03[1]},
       45000.000 .. 310000.000 [m] {CHLV03[2]},
        -200.000 ..   5000.000 [m] {SwissOrthometricAlt[1]},
      ROTATION 2 -> 1;

    Surface = SURFACE WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.001;
    Area = AREA WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.001;
    Line = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord2;
    DirectedLine EXTENDS Line = DIRECTED POLYLINE;
    LineWithAltitude = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord3;
    DirectedLineWithAltitude = DIRECTED POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord3;
    
    /* minimal overlaps only (2mm) */
    SurfaceWithOverlaps2mm = SURFACE WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.002;
    AreaWithOverlaps2mm = AREA WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.002;

    Orientation = 0.00000 .. 359.99999 CIRCULAR [Units.Angle_Degree] <Coord2>;

    Accuracy = (cm, cm50, m, m10, m50, vague);
    Method = (measured, sketched, calculated);

    STRUCTURE LineStructure = 
      Line: Line;
    END LineStructure;

    STRUCTURE DirectedLineStructure =
      Line: DirectedLine;
    END DirectedLineStructure;

    STRUCTURE MultiLine =
      Lines: BAG {1..*} OF LineStructure;
    END MultiLine;

    STRUCTURE MultiDirectedLine =
      Lines: BAG {1..*} OF DirectedLineStructure;
    END MultiDirectedLine;

    STRUCTURE SurfaceStructure =
      Surface: Surface;
    END SurfaceStructure;

    STRUCTURE MultiSurface =
      Surfaces: BAG {1..*} OF SurfaceStructure;
    END MultiSurface;

END GeometryCHLV03_V1.

!! ########################################################################

!! Version    | Who   | Modification
!!------------------------------------------------------------------------------
!! 2015-02-20 | KOGIS | WITHOUT OVERLAPS added (line 135, 136, 143 and 144)
!! 2015-11-12 | KOGIS | WITHOUT OVERLAPS corrected (line 135 and 136)
!! 2017-11-27 | KOGIS | Meta-Attributes @furtherInformation adapted and @CRS added (line 109, 122 and 128)
!! 2017-12-04 | KOGIS | Meta-Attribute @CRS corrected

!!@technicalContact=models@geo.admin.ch
!!@furtherInformation=https://www.geo.admin.ch/de/geoinformation-schweiz/geobasisdaten/geodata-models.html
TYPE MODEL GeometryCHLV95_V1 (en)
  AT "http://www.geo.admin.ch" VERSION "2017-12-04" =

  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS Units;
  IMPORTS CoordSys;

  REFSYSTEM BASKET BCoordSys ~ CoordSys.CoordsysTopic
    OBJECTS OF GeoCartesian2D: CHLV95
    OBJECTS OF GeoHeight: SwissOrthometricAlt;

  DOMAIN
    !!@CRS=EPSG:2056
    Coord2 = COORD
      2460000.000 .. 2870000.000 [m] {CHLV95[1]},
      1045000.000 .. 1310000.000 [m] {CHLV95[2]},
      ROTATION 2 -> 1;

    !!@CRS=EPSG:2056
    Coord3 = COORD
      2460000.000 .. 2870000.000 [m] {CHLV95[1]},
      1045000.000 .. 1310000.000 [m] {CHLV95[2]},
         -200.000 ..   5000.000 [m] {SwissOrthometricAlt[1]},
      ROTATION 2 -> 1;

    Surface = SURFACE WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.001;
    Area = AREA WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.001;
    Line = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord2;
    DirectedLine EXTENDS Line = DIRECTED POLYLINE;
    LineWithAltitude = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord3;
    DirectedLineWithAltitude = DIRECTED POLYLINE WITH (STRAIGHTS, ARCS) VERTEX Coord3;
    
    /* minimal overlaps only (2mm) */
    SurfaceWithOverlaps2mm = SURFACE WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.002;
    AreaWithOverlaps2mm = AREA WITH (STRAIGHTS, ARCS) VERTEX Coord2 WITHOUT OVERLAPS > 0.002;

    Orientation = 0.00000 .. 359.99999 CIRCULAR [Units.Angle_Degree] <Coord2>;

    Accuracy = (cm, cm50, m, m10, m50, vague);
    Method = (measured, sketched, calculated);

    STRUCTURE LineStructure = 
      Line: Line;
    END LineStructure;

    STRUCTURE DirectedLineStructure =
      Line: DirectedLine;
    END DirectedLineStructure;

    STRUCTURE MultiLine =
      Lines: BAG {1..*} OF LineStructure;
    END MultiLine;

    STRUCTURE MultiDirectedLine =
      Lines: BAG {1..*} OF DirectedLineStructure;
    END MultiDirectedLine;

    STRUCTURE SurfaceStructure =
      Surface: Surface;
    END SurfaceStructure;

    STRUCTURE MultiSurface =
      Surfaces: BAG {1..*} OF SurfaceStructure;
    END MultiSurface;

END GeometryCHLV95_V1.

!! ########################################################################
','2020-10-22 15:42:30.989');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createMetaInfo','True');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.beautifyEnumDispName','underscore');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.arrayTrafo','coalesce');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.nameOptimization','topic');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.localisedTrafo','expand');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.numericCheckConstraints','create');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.sender','ili2pg-4.3.1-23b1f79e8ad644414773bb9bd1a97c8c265c5082');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKey','yes');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.sqlgen.createGeomIndex','True');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsAuthority','EPSG');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsCode','2056');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uuidDefaultValue','uuid_generate_v4()');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.StrokeArcs','enable');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.interlis.ili2c.ilidirs','%ILI_FROM_DB;%XTF_DIR;http://models.interlis.ch/;%JAR_DIR');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKeyIndex','yes');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.jsonTrafo','coalesce');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createEnumDefs','multiTable');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uniqueConstraints','create');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.maxSqlNameLength','60');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.inheritanceTrafo','smart1');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.catalogueRefTrafo','coalesce');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiPointTrafo','coalesce');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multilingualTrafo','expand');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('DictionariesCH_V1','furtherInformation','http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('DictionariesCH_V1','technicalContact','models@geo.admin.ch');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1','furtherInformation','http://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('Dictionaries_V1','technicalContact','models@geo.admin.ch');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813','furtherInformation','https://geo.so.ch/models/ARP/SO_Agglomerationsprogramme_Publikation_20200813.uml');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_Agglomerationsprogramme_Publikation_20200813','technicalContact','mailto:agi@bd.so.ch');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1','furtherInformation','https://www.geo.admin.ch/internet/geoportal/de/home/topics/geobasedata/models.html');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnits_V1','technicalContact','mailto:models@geo.admin.ch');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1','furtherInformation','https://www.geo.admin.ch/de/geoinformation-schweiz/geobasisdaten/geodata-models.html');
INSERT INTO arp_agglomerationsprogramme_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('AdministrativeUnitsCH_V1','technicalContact','mailto:models@geo.admin.ch');
