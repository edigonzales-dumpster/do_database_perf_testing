CREATE SCHEMA IF NOT EXISTS arp_naturreservate_pub;
CREATE SEQUENCE arp_naturreservate_pub.t_ili2db_seq;;
-- GeometryCHLV95_V1.SurfaceStructure
CREATE TABLE arp_naturreservate_pub.surfacestructure (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_naturreservate_pub.t_ili2db_seq')
  ,T_Seq bigint NULL
  ,surface geometry(POLYGON,2056) NULL
  ,multisurface_surfaces bigint NULL
)
;
CREATE INDEX surfacestructure_surface_idx ON arp_naturreservate_pub.surfacestructure USING GIST ( surface );
CREATE INDEX surfacestructure_multisurface_surfaces_idx ON arp_naturreservate_pub.surfacestructure ( multisurface_surfaces );
-- GeometryCHLV95_V1.MultiSurface
CREATE TABLE arp_naturreservate_pub.multisurface (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_naturreservate_pub.t_ili2db_seq')
  ,T_Seq bigint NULL
)
;
-- SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste
CREATE TABLE arp_naturreservate_pub.naturreservate_pflanzenliste (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_naturreservate_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,wissenschaftlicher_name varchar(130) NOT NULL
  ,deutscher_name varchar(64) NULL
  ,geschuetzt boolean NOT NULL
  ,erhebungsjahr integer NULL
  ,erhebungsprojekt varchar(15) NOT NULL
  ,rote_liste boolean NOT NULL
  ,teilgebietsname varchar(100) NOT NULL
  ,reservatsnummer decimal(7,2) NOT NULL
  ,teilgebietsnummer integer NOT NULL
)
;
COMMENT ON TABLE arp_naturreservate_pub.naturreservate_pflanzenliste IS 'Auflistung der in kantonalen Naturreservaten erhobenen Pflanzen';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_pflanzenliste.wissenschaftlicher_name IS 'wissenschaftlicher (lateinischer) Name der Pflanze';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_pflanzenliste.deutscher_name IS 'deutscher Name der Pflanze';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_pflanzenliste.geschuetzt IS 'Steht die Pflanze in der Schweiz unter Schutz? ja/nein';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_pflanzenliste.erhebungsjahr IS 'Jahr der Erhebung';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_pflanzenliste.erhebungsprojekt IS 'Name des Erhebungsprojekts';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_pflanzenliste.rote_liste IS 'Steht die Pflanze auf der roten Liste? ja/nein';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_pflanzenliste.teilgebietsname IS 'Name des Teilgebiets';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_pflanzenliste.reservatsnummer IS 'Reservatsnummer';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_pflanzenliste.teilgebietsnummer IS 'Nummer des Teilgebiets';
-- SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat
CREATE TABLE arp_naturreservate_pub.naturreservate_reservat (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_naturreservate_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,nummer decimal(7,2) NOT NULL
  ,nsi_nummer varchar(10) NULL
  ,aname varchar(100) NOT NULL
  ,geometrie geometry(MULTIPOLYGON,2056) NOT NULL
  ,beschreibung varchar(10000) NULL
  ,flaeche decimal(12,2) NOT NULL
  ,teilgebietsnamen varchar(1000) NOT NULL
  ,gemeinden varchar(1000) NOT NULL
  ,dokumente varchar(1000000) NULL
  ,zustaendiger varchar(500) NULL
  ,einzelschutz boolean NOT NULL
)
;
CREATE INDEX naturreservate_reservat_geometrie_idx ON arp_naturreservate_pub.naturreservate_reservat USING GIST ( geometrie );
COMMENT ON TABLE arp_naturreservate_pub.naturreservate_reservat IS 'kantonale Naturreservate';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.nummer IS 'Reservatsnummer';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.nsi_nummer IS 'NSI-Nummer (Burki-Inventar)';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.aname IS 'Reservatsname';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.geometrie IS 'Geometrie des Reservats';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.beschreibung IS 'Reservatsbeschreibung';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.flaeche IS 'Gesamtflaeche des Reservats in [ha]';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.teilgebietsnamen IS 'Namen aller im Reservat liegenden Teilgebiete';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.gemeinden IS 'betroffene Gemeinden';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.dokumente IS 'Pfade zu den Dokumenten';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.zustaendiger IS 'Fuer das Naturreservat zustaendige Personen/Organisationen';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_reservat.einzelschutz IS 'Gemäss Planungs- und Baugesetz §122';
-- SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet
CREATE TABLE arp_naturreservate_pub.naturreservate_teilgebiet (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_naturreservate_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,aname varchar(100) NOT NULL
  ,geometrie geometry(MULTIPOLYGON,2056) NOT NULL
  ,beschreibung varchar(10000) NOT NULL
  ,flaeche decimal(12,2) NOT NULL
  ,gemeinden varchar(500) NOT NULL
  ,dokumente varchar(1000000) NULL
  ,parzellennummern varchar(100000) NULL
  ,reservatsnummer decimal(7,2) NOT NULL
  ,reservatsname varchar(100) NOT NULL
  ,vereinbarungsflaechen varchar(500) NULL
  ,bewirtschafter varchar(500) NULL
  ,einzelschutz boolean NOT NULL
)
;
CREATE INDEX naturreservate_teilgebiet_geometrie_idx ON arp_naturreservate_pub.naturreservate_teilgebiet USING GIST ( geometrie );
COMMENT ON TABLE arp_naturreservate_pub.naturreservate_teilgebiet IS 'Teilgebiete der Reservate';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.aname IS 'Teilgebietsname';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.geometrie IS 'Geometrie des Teilgebiets';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.beschreibung IS 'Beschreibung des Teilgebiets';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.flaeche IS 'Flaeche des Teilgebiets in [ha]';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.gemeinden IS 'betroffene Gemeinden';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.dokumente IS 'Pfade zu den Dokumenten';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.parzellennummern IS 'Nummern der betroffenen Parzellen';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.reservatsnummer IS 'Reservatsnummer';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.reservatsname IS 'Reservatsname';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.vereinbarungsflaechen IS 'Nummern der betroffenen Vereinbarungsflaechen';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.bewirtschafter IS 'Bewirtschafter der betroffenen Vereinbarungsflächen';
COMMENT ON COLUMN arp_naturreservate_pub.naturreservate_teilgebiet.einzelschutz IS 'Gemäss Planungs- und Baugesetz §122';
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
  ,domains varchar(1024) NULL
)
;
CREATE INDEX T_ILI2DB_BASKET_dataset_idx ON arp_naturreservate_pub.t_ili2db_basket ( dataset );
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(1024) NULL
)
;
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_MODEL (
  filename varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (iliversion,modelName)
)
;
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,ColOwner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (ColOwner,SqlName)
)
;
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (
  tablename varchar(255) NOT NULL
  ,subtype varchar(255) NULL
  ,columnname varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_TABLE_PROP (
  tablename varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_naturreservate_pub.T_ILI2DB_META_ATTRS (
  ilielement varchar(255) NOT NULL
  ,attr_name varchar(1024) NOT NULL
  ,attr_value varchar(1024) NOT NULL
)
;
ALTER TABLE arp_naturreservate_pub.surfacestructure ADD CONSTRAINT surfacestructure_multisurface_surfaces_fkey FOREIGN KEY ( multisurface_surfaces ) REFERENCES arp_naturreservate_pub.multisurface DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE arp_naturreservate_pub.naturreservate_pflanzenliste ADD CONSTRAINT naturreservate_pflnznlste_erhebungsjahr_check CHECK( erhebungsjahr BETWEEN 1582 AND 2999);
ALTER TABLE arp_naturreservate_pub.naturreservate_pflanzenliste ADD CONSTRAINT naturreservate_pflnznlste_reservatsnummer_check CHECK( reservatsnummer BETWEEN 0.0 AND 99999.0);
ALTER TABLE arp_naturreservate_pub.naturreservate_pflanzenliste ADD CONSTRAINT naturreservate_pflnznlste_teilgebietsnummer_check CHECK( teilgebietsnummer BETWEEN 0 AND 2147483647);
ALTER TABLE arp_naturreservate_pub.naturreservate_reservat ADD CONSTRAINT naturreservate_reservat_nummer_check CHECK( nummer BETWEEN 0.0 AND 99999.0);
ALTER TABLE arp_naturreservate_pub.naturreservate_reservat ADD CONSTRAINT naturreservate_reservat_flaeche_check CHECK( flaeche BETWEEN 0.0 AND 9.999999999E9);
ALTER TABLE arp_naturreservate_pub.naturreservate_teilgebiet ADD CONSTRAINT naturreservate_teilgebiet_flaeche_check CHECK( flaeche BETWEEN 0.0 AND 1.0E9);
ALTER TABLE arp_naturreservate_pub.naturreservate_teilgebiet ADD CONSTRAINT naturreservate_teilgebiet_reservatsnummer_check CHECK( reservatsnummer BETWEEN 0.0 AND 99999.0);
ALTER TABLE arp_naturreservate_pub.T_ILI2DB_BASKET ADD CONSTRAINT T_ILI2DB_BASKET_dataset_fkey FOREIGN KEY ( dataset ) REFERENCES arp_naturreservate_pub.T_ILI2DB_DATASET DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX T_ILI2DB_DATASET_datasetName_key ON arp_naturreservate_pub.T_ILI2DB_DATASET (datasetName)
;
CREATE UNIQUE INDEX T_ILI2DB_MODEL_iliversion_modelName_key ON arp_naturreservate_pub.T_ILI2DB_MODEL (iliversion,modelName)
;
CREATE UNIQUE INDEX T_ILI2DB_ATTRNAME_ColOwner_SqlName_key ON arp_naturreservate_pub.T_ILI2DB_ATTRNAME (ColOwner,SqlName)
;
INSERT INTO arp_naturreservate_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet','naturreservate_teilgebiet');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste','naturreservate_pflanzenliste');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat','naturreservate_reservat');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.MultiSurface','multisurface');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.SurfaceStructure','surfacestructure');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste.Teilgebietsname','teilgebietsname','naturreservate_pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Beschreibung','beschreibung','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.MultiSurface.Surfaces','multisurface_surfaces','surfacestructure','multisurface');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Geometrie','geometrie','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Gemeinden','gemeinden','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste.rote_Liste','rote_liste','naturreservate_pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste.Teilgebietsnummer','teilgebietsnummer','naturreservate_pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Gemeinden','gemeinden','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste.deutscher_Name','deutscher_name','naturreservate_pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Nummer','nummer','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Flaeche','flaeche','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Beschreibung','beschreibung','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste.wissenschaftlicher_Name','wissenschaftlicher_name','naturreservate_pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.SurfaceStructure.Surface','surface','surfacestructure',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Geometrie','geometrie','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Teilgebietsnamen','teilgebietsnamen','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Parzellennummern','parzellennummern','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Name','aname','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Dokumente','dokumente','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Vereinbarungsflaechen','vereinbarungsflaechen','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Einzelschutz','einzelschutz','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste.Erhebungsprojekt','erhebungsprojekt','naturreservate_pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste.geschuetzt','geschuetzt','naturreservate_pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Reservatsname','reservatsname','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste.Reservatsnummer','reservatsnummer','naturreservate_pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Dokumente','dokumente','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste.Erhebungsjahr','erhebungsjahr','naturreservate_pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Bewirtschafter','bewirtschafter','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.NSI_Nummer','nsi_nummer','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Name','aname','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Reservatsnummer','reservatsnummer','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Zustaendiger','zustaendiger','naturreservate_reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Flaeche','flaeche','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Einzelschutz','einzelschutz','naturreservate_teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.MultiSurface','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat.Geometrie','ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet.Geometrie','ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.SurfaceStructure','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.MultiSurface',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.SurfaceStructure',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Teilgebiet',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Pflanzenliste',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.Naturreservate.Reservat',NULL);
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_teilgebiet',NULL,'beschreibung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_reservat',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_reservat',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_reservat',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_reservat',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTIPOLYGON');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_reservat',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_reservat',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_reservat',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'multisurface_surfaces','ch.ehi.ili2db.foreignKey','multisurface');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_teilgebiet',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_teilgebiet',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_teilgebiet',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_teilgebiet',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTIPOLYGON');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_teilgebiet',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_teilgebiet',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_teilgebiet',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('naturreservate_reservat',NULL,'beschreibung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('naturreservate_teilgebiet','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('naturreservate_pflanzenliste','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('surfacestructure','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('multisurface','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('naturreservate_reservat','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('Units-20120220.ili','2.3','Units','!! File Units.ili Release 2012-02-20

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

','2020-10-22 15:42:09.683');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CoordSys-20151124.ili','2.3','CoordSys','!! File CoordSys.ili Release 2015-11-24

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

','2020-10-22 15:42:09.683');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('SO_ARP_Naturreservate_Publikation_20200609.ili','2.3','SO_ARP_Naturreservate_Publikation_20200609{ GeometryCHLV95_V1}','INTERLIS 2.3;

/** !!------------------------------------------------------------------------------ 
 * !! Version    | wer | Änderung 
 * !!------------------------------------------------------------------------------ 
 * !! 2017-05-17 | Noëmi Sturm    | Erstfassung 
 * !! 2017-12-04 | Noëmi Sturm    | Ergänzung mit Pflanzenliste, kleinere Anpassungen
 * !! 2017-12-11 | Noëmi Sturm    | Review-Rückmeldungen integriert
 * !! 2017-12-18 | Noëmi Sturm    | Eigentümer entfernt, Modell umbenannt
 * !! 2018-03-09 | Noëmi Sturm    | Parzellennummer vergrössern
 * !! 2020-06-09 | Andrea Lüscher | Attribut Einzelschutz hinzugefügt
 * !!==============================================================================
 */
!!@ technicalContact=agi@bd.so.ch
!!@ furtherInformation=http://www.geo.so.ch/models/ARP/SO_ARP_Naturreservate_Publikation_20200609.uml
MODEL SO_ARP_Naturreservate_Publikation_20200609 (de)
AT "http://www.geo.so.ch/models/ARP"
VERSION "2020-06-09"  =
  IMPORTS GeometryCHLV95_V1;

  TOPIC Naturreservate =
    OID AS INTERLIS.UUIDOID;

    /** Auflistung der in kantonalen Naturreservaten erhobenen Pflanzen
     */
    CLASS Pflanzenliste =
      /** wissenschaftlicher (lateinischer) Name der Pflanze
       */
      wissenschaftlicher_Name : MANDATORY TEXT*130;
      /** deutscher Name der Pflanze
       */
      deutscher_Name : TEXT*64;
      /** Steht die Pflanze in der Schweiz unter Schutz? ja/nein
       */
      geschuetzt : MANDATORY BOOLEAN;
      /** Jahr der Erhebung
       */
      Erhebungsjahr : INTERLIS.GregorianYear;
      /** Name des Erhebungsprojekts
       */
      Erhebungsprojekt : MANDATORY TEXT*15;
      /** Steht die Pflanze auf der roten Liste? ja/nein
       */
      rote_Liste : MANDATORY BOOLEAN;
      /** Name des Teilgebiets
       */
      Teilgebietsname : MANDATORY TEXT*100;
      /** Reservatsnummer
       */
      Reservatsnummer : MANDATORY 0.00 .. 99999.00;
      /** Nummer des Teilgebiets
       */
      Teilgebietsnummer : MANDATORY 0 .. 999999999999;
    END Pflanzenliste;

    /** kantonale Naturreservate
     */
    CLASS Reservat =
      /** Reservatsnummer
       */
      Nummer : MANDATORY 0.00 .. 99999.00;
      /** NSI-Nummer (Burki-Inventar)
       */
      NSI_Nummer : TEXT*10;
      /** Reservatsname
       */
      Name : MANDATORY TEXT*100;
      /** Geometrie des Reservats
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiSurface;
      /** Reservatsbeschreibung
       */
      Beschreibung : MTEXT*10000;
      /** Gesamtflaeche des Reservats in [ha]
       */
      Flaeche : MANDATORY 0.00 .. 9999999999.00;
      /** Namen aller im Reservat liegenden Teilgebiete
       */
      Teilgebietsnamen : MANDATORY TEXT*1000;
      /** betroffene Gemeinden
       */
      Gemeinden : MANDATORY TEXT*1000;
      /** Pfade zu den Dokumenten
       */
      Dokumente : TEXT*1000000;
      /** Fuer das Naturreservat zustaendige Personen/Organisationen
       */
      Zustaendiger : TEXT*500;
      /** Gemäss Planungs- und Baugesetz §122
       */
      Einzelschutz : MANDATORY BOOLEAN;
    END Reservat;

    /** Teilgebiete der Reservate
     */
    CLASS Teilgebiet =
      /** Teilgebietsname
       */
      Name : MANDATORY TEXT*100;
      /** Geometrie des Teilgebiets
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiSurface;
      /** Beschreibung des Teilgebiets
       */
      Beschreibung : MANDATORY MTEXT*10000;
      /** Flaeche des Teilgebiets in [ha]
       */
      Flaeche : MANDATORY 0.00 .. 1000000000.00;
      /** betroffene Gemeinden
       */
      Gemeinden : MANDATORY TEXT*500;
      /** Pfade zu den Dokumenten
       */
      Dokumente : TEXT*1000000;
      /** Nummern der betroffenen Parzellen
       */
      Parzellennummern : TEXT*100000;
      /** Reservatsnummer
       */
      Reservatsnummer : MANDATORY 0.00 .. 99999.00;
      /** Reservatsname
       */
      Reservatsname : MANDATORY TEXT*100;
      /** Nummern der betroffenen Vereinbarungsflaechen
       */
      Vereinbarungsflaechen : TEXT*500;
      /** Bewirtschafter der betroffenen Vereinbarungsflächen
       */
      Bewirtschafter : TEXT*500;
      /** Gemäss Planungs- und Baugesetz §122
       */
      Einzelschutz : MANDATORY BOOLEAN;
    END Teilgebiet;

  END Naturreservate;

END SO_ARP_Naturreservate_Publikation_20200609.
','2020-10-22 15:42:09.683');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CHBase_Part1_GEOMETRY_20110830.ili','2.3','GeometryCHLV03_V1{ CoordSys Units INTERLIS} GeometryCHLV95_V1{ CoordSys Units INTERLIS}','/* ########################################################################
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
','2020-10-22 15:42:09.683');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createMetaInfo','True');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.beautifyEnumDispName','underscore');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.arrayTrafo','coalesce');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.nameOptimization','topic');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.localisedTrafo','expand');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.numericCheckConstraints','create');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.sender','ili2pg-4.3.1-23b1f79e8ad644414773bb9bd1a97c8c265c5082');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKey','yes');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.sqlgen.createGeomIndex','True');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsAuthority','EPSG');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsCode','2056');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uuidDefaultValue','uuid_generate_v4()');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.StrokeArcs','enable');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.interlis.ili2c.ilidirs','%ILI_FROM_DB;%XTF_DIR;http://models.interlis.ch/;%JAR_DIR');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKeyIndex','yes');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.jsonTrafo','coalesce');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createEnumDefs','multiTable');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uniqueConstraints','create');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.maxSqlNameLength','60');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.inheritanceTrafo','smart1');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.catalogueRefTrafo','coalesce');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiPointTrafo','coalesce');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multilingualTrafo','expand');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ARP_Naturreservate_Publikation_20200609','furtherInformation','http://www.geo.so.ch/models/ARP/SO_ARP_Naturreservate_Publikation_20200609.uml');
INSERT INTO arp_naturreservate_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ARP_Naturreservate_Publikation_20200609','technicalContact','agi@bd.so.ch');
