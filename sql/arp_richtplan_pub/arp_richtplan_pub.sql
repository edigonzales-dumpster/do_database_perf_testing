CREATE SCHEMA IF NOT EXISTS arp_richtplan_pub;
CREATE SEQUENCE arp_richtplan_pub.t_ili2db_seq;;
-- GeometryCHLV95_V1.LineStructure
CREATE TABLE arp_richtplan_pub.linestructure (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Seq bigint NULL
  ,line geometry(LINESTRING,2056) NULL
  ,multiline_lines bigint NULL
)
;
CREATE INDEX linestructure_line_idx ON arp_richtplan_pub.linestructure USING GIST ( line );
CREATE INDEX linestructure_multiline_lines_idx ON arp_richtplan_pub.linestructure ( multiline_lines );
-- GeometryCHLV95_V1.MultiLine
CREATE TABLE arp_richtplan_pub.multiline (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Seq bigint NULL
)
;
-- GeometryCHLV95_V1.SurfaceStructure
CREATE TABLE arp_richtplan_pub.surfacestructure (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Seq bigint NULL
  ,surface geometry(POLYGON,2056) NULL
  ,multisurface_surfaces bigint NULL
)
;
CREATE INDEX surfacestructure_surface_idx ON arp_richtplan_pub.surfacestructure USING GIST ( surface );
CREATE INDEX surfacestructure_multisurface_surfaces_idx ON arp_richtplan_pub.surfacestructure ( multisurface_surfaces );
-- GeometryCHLV95_V1.MultiSurface
CREATE TABLE arp_richtplan_pub.multisurface (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Seq bigint NULL
)
;
-- SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche
CREATE TABLE arp_richtplan_pub.detailkarten_ueberlagernde_flaeche (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,objektname varchar(150) NULL
  ,objekttyp varchar(255) NOT NULL
  ,abstimmungskategorie varchar(255) NULL
  ,geometrie geometry(POLYGON,2056) NOT NULL
  ,gemeindenamen varchar(255) NULL
)
;
CREATE INDEX detailkarten_brlgrnd_flche_geometrie_idx ON arp_richtplan_pub.detailkarten_ueberlagernde_flaeche USING GIST ( geometrie );
COMMENT ON TABLE arp_richtplan_pub.detailkarten_ueberlagernde_flaeche IS 'ueberlagernde Flaechen der Detailkarten';
COMMENT ON COLUMN arp_richtplan_pub.detailkarten_ueberlagernde_flaeche.objektname IS 'Name der ueberlagernden Flaeche';
COMMENT ON COLUMN arp_richtplan_pub.detailkarten_ueberlagernde_flaeche.objekttyp IS 'Typ der ueberlagernden Flaeche';
COMMENT ON COLUMN arp_richtplan_pub.detailkarten_ueberlagernde_flaeche.abstimmungskategorie IS 'Kategorie der Abstimmung';
COMMENT ON COLUMN arp_richtplan_pub.detailkarten_ueberlagernde_flaeche.geometrie IS 'Flaechengeometrie der ueberlagernden Flaeche';
COMMENT ON COLUMN arp_richtplan_pub.detailkarten_ueberlagernde_flaeche.gemeindenamen IS 'Namen der betroffenen Gemeinden';
-- SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernder_Punkt
CREATE TABLE arp_richtplan_pub.detailkarten_ueberlagernder_punkt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,astatus varchar(255) NOT NULL
  ,objekttyp varchar(255) NOT NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,gemeindename varchar(150) NULL
)
;
CREATE INDEX detailkarten_brlgrndr_pnkt_geometrie_idx ON arp_richtplan_pub.detailkarten_ueberlagernder_punkt USING GIST ( geometrie );
COMMENT ON TABLE arp_richtplan_pub.detailkarten_ueberlagernder_punkt IS 'ueberlagernde Punkte der Detailkarten';
COMMENT ON COLUMN arp_richtplan_pub.detailkarten_ueberlagernder_punkt.astatus IS 'Status des ueberlagernden Punkts';
COMMENT ON COLUMN arp_richtplan_pub.detailkarten_ueberlagernder_punkt.objekttyp IS 'Typ des ueberlagernden Punkts';
COMMENT ON COLUMN arp_richtplan_pub.detailkarten_ueberlagernder_punkt.geometrie IS 'Punktgeometrie des ueberlagernden Punkts';
COMMENT ON COLUMN arp_richtplan_pub.detailkarten_ueberlagernder_punkt.gemeindename IS 'Name der Gemeinde';
-- SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung
CREATE TABLE arp_richtplan_pub.richtplankarte_grundnutzung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,abstimmungskategorie varchar(255) NOT NULL
  ,grundnutzungsart varchar(255) NOT NULL
  ,geometrie geometry(POLYGON,2056) NOT NULL
  ,dokumente text NULL
  ,planungsstand varchar(255) NOT NULL
)
;
CREATE INDEX richtplankarte_grundntzung_geometrie_idx ON arp_richtplan_pub.richtplankarte_grundnutzung USING GIST ( geometrie );
COMMENT ON TABLE arp_richtplan_pub.richtplankarte_grundnutzung IS 'Grundnutzung des Richtplans';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_grundnutzung.abstimmungskategorie IS 'Abstimmungskategorie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_grundnutzung.grundnutzungsart IS 'Art der Grundnutzung';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_grundnutzung.geometrie IS 'Flaechengeometrie der Grundnutzung';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_grundnutzung.dokumente IS 'Auflistung der Dokumente';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_grundnutzung.planungsstand IS 'Stand der Planung';
-- SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche
CREATE TABLE arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,objektnummer varchar(10) NULL
  ,objekttyp varchar(255) NOT NULL
  ,weitere_informationen varchar(255) NULL
  ,geometrie geometry(MULTIPOLYGON,2056) NOT NULL
  ,gemeindenamen varchar(1024) NOT NULL
  ,objektname varchar(150) NULL
  ,abstimmungskategorie varchar(255) NOT NULL
  ,bedeutung varchar(255) NULL
  ,planungsstand varchar(255) NOT NULL
  ,dokumente text NULL
  ,astatus varchar(255) NOT NULL
)
;
CREATE INDEX richtplankrt_brlgrnd_flche_geometrie_idx ON arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche USING GIST ( geometrie );
COMMENT ON TABLE arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche IS 'Polygonthemen, welche die Grundnutzung des Richtplans ueberlagern.';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.objektnummer IS 'Nummer der ueberlagernden Flaeche';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.objekttyp IS 'Typ der ueberlagernden Flaeche';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.weitere_informationen IS 'weitere Informationen zu der ueberlagernden Flaeche';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.geometrie IS 'Polygongeometrie der ueberlagernden Flaeche';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.gemeindenamen IS 'betroffene Gemeinden';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.objektname IS 'Name der ueberlagernden Geometrie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.abstimmungskategorie IS 'Kategorie der Abstimmung';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.bedeutung IS 'Bedeutung der ueberlagernden Geometrie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.planungsstand IS 'Stand der Planung';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.dokumente IS 'Auflistung der dazugehoerigen Dokumente';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche.astatus IS 'Status der ueberlagernden Geometrie';
-- SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Linie
CREATE TABLE arp_richtplan_pub.richtplankarte_ueberlagernde_linie (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,objektnummer varchar(10) NULL
  ,objekttyp varchar(255) NOT NULL
  ,geometrie geometry(MULTILINESTRING,2056) NOT NULL
  ,objektname varchar(150) NULL
  ,abstimmungskategorie varchar(255) NOT NULL
  ,bedeutung varchar(255) NULL
  ,planungsstand varchar(255) NOT NULL
  ,dokumente text NULL
  ,astatus varchar(255) NOT NULL
)
;
CREATE INDEX richtplankart_brlgrnd_lnie_geometrie_idx ON arp_richtplan_pub.richtplankarte_ueberlagernde_linie USING GIST ( geometrie );
COMMENT ON TABLE arp_richtplan_pub.richtplankarte_ueberlagernde_linie IS 'Linienthemen, welche die Grundnutzung des Richtplans ueberlagern.';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_linie.objektnummer IS 'Objektnummer der ueberlagernden Linie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_linie.objekttyp IS 'Typ der ueberlagernden Linie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_linie.geometrie IS 'Liniengeometrie der ueberlagernden Linie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_linie.objektname IS 'Name der ueberlagernden Geometrie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_linie.abstimmungskategorie IS 'Kategorie der Abstimmung';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_linie.bedeutung IS 'Bedeutung der ueberlagernden Geometrie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_linie.planungsstand IS 'Stand der Planung';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_linie.dokumente IS 'Auflistung der dazugehoerigen Dokumente';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernde_linie.astatus IS 'Status der ueberlagernden Geometrie';
-- SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernder_Punkt
CREATE TABLE arp_richtplan_pub.richtplankarte_ueberlagernder_punkt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_richtplan_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,objekttyp varchar(255) NOT NULL
  ,spezifikation varchar(255) NULL
  ,geometrie geometry(POINT,2056) NOT NULL
  ,gemeindename varchar(150) NOT NULL
  ,objektname varchar(150) NULL
  ,abstimmungskategorie varchar(255) NOT NULL
  ,bedeutung varchar(255) NULL
  ,planungsstand varchar(255) NOT NULL
  ,dokumente text NULL
  ,astatus varchar(255) NOT NULL
)
;
CREATE INDEX richtplankrt_brlgrndr_pnkt_geometrie_idx ON arp_richtplan_pub.richtplankarte_ueberlagernder_punkt USING GIST ( geometrie );
COMMENT ON TABLE arp_richtplan_pub.richtplankarte_ueberlagernder_punkt IS 'Punktthemen, welche die Grundnutzung des Richtplans ueberlagern.';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.objekttyp IS 'Art des ueberlagernden Punkts';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.spezifikation IS 'weitere Spezifikationen des ueberlagernden Punkts';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.geometrie IS 'Geometrie des ueberlagernden Punkts';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.gemeindename IS 'betroffene Gemeinde';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.objektname IS 'Name der ueberlagernden Geometrie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.abstimmungskategorie IS 'Kategorie der Abstimmung';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.bedeutung IS 'Bedeutung der ueberlagernden Geometrie';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.planungsstand IS 'Stand der Planung';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.dokumente IS 'Auflistung der dazugehoerigen Dokumente';
COMMENT ON COLUMN arp_richtplan_pub.richtplankarte_ueberlagernder_punkt.astatus IS 'Status der ueberlagernden Geometrie';
CREATE TABLE arp_richtplan_pub.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
  ,domains varchar(1024) NULL
)
;
CREATE INDEX T_ILI2DB_BASKET_dataset_idx ON arp_richtplan_pub.t_ili2db_basket ( dataset );
CREATE TABLE arp_richtplan_pub.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE arp_richtplan_pub.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_richtplan_pub.T_ILI2DB_MODEL (
  filename varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (iliversion,modelName)
)
;
CREATE TABLE arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.richtplankarte_bedeutung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.abstimmungskategorie (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.richtplankarte_ueberlagernde_linie_objekttyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.detailkarten_ueberlagernde_flaeche_objekttyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.astatus (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.detailkarten_ueberlagernder_punkt_objekttyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.richtplankarte_grundnutzung_grundnutzungsart (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.richtplankarte_planungsstand (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE arp_richtplan_pub.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE arp_richtplan_pub.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,ColOwner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (SqlName,ColOwner)
)
;
CREATE TABLE arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (
  tablename varchar(255) NOT NULL
  ,subtype varchar(255) NULL
  ,columnname varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_richtplan_pub.T_ILI2DB_TABLE_PROP (
  tablename varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_richtplan_pub.T_ILI2DB_META_ATTRS (
  ilielement varchar(255) NOT NULL
  ,attr_name varchar(1024) NOT NULL
  ,attr_value varchar(1024) NOT NULL
)
;
ALTER TABLE arp_richtplan_pub.linestructure ADD CONSTRAINT linestructure_multiline_lines_fkey FOREIGN KEY ( multiline_lines ) REFERENCES arp_richtplan_pub.multiline DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE arp_richtplan_pub.surfacestructure ADD CONSTRAINT surfacestructure_multisurface_surfaces_fkey FOREIGN KEY ( multisurface_surfaces ) REFERENCES arp_richtplan_pub.multisurface DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE arp_richtplan_pub.T_ILI2DB_BASKET ADD CONSTRAINT T_ILI2DB_BASKET_dataset_fkey FOREIGN KEY ( dataset ) REFERENCES arp_richtplan_pub.T_ILI2DB_DATASET DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX T_ILI2DB_DATASET_datasetName_key ON arp_richtplan_pub.T_ILI2DB_DATASET (datasetName)
;
CREATE UNIQUE INDEX T_ILI2DB_MODEL_iliversion_modelName_key ON arp_richtplan_pub.T_ILI2DB_MODEL (iliversion,modelName)
;
CREATE UNIQUE INDEX T_ILI2DB_ATTRNAME_SqlName_ColOwner_key ON arp_richtplan_pub.T_ILI2DB_ATTRNAME (SqlName,ColOwner)
;
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung','richtplankarte_grundnutzung');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Status','astatus');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernder_Punkt.Objekttyp','detailkarten_ueberlagernder_punkt_objekttyp');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche','richtplankarte_ueberlagernde_flaeche');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche','detailkarten_ueberlagernde_flaeche');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Bedeutung','richtplankarte_bedeutung');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.MultiSurface','multisurface');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie','richtplankarte_ueberlagernde_geometrie');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Linie.Objekttyp','richtplankarte_ueberlagernde_linie_objekttyp');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Abstimmungskategorie','abstimmungskategorie');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.MultiLine','multiline');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernder_Punkt','richtplankarte_ueberlagernder_punkt');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernder_Punkt.Objekttyp','richtplankarte_ueberlagernder_punkt_objekttyp');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Linie','richtplankarte_ueberlagernde_linie');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.LineStructure','linestructure');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernder_Punkt','detailkarten_ueberlagernder_punkt');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche.Objekttyp','richtplankarte_ueberlagernde_flaeche_objekttyp');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Planungsstand','richtplankarte_planungsstand');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche.Objekttyp','detailkarten_ueberlagernde_flaeche_objekttyp');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung.Grundnutzungsart','richtplankarte_grundnutzung_grundnutzungsart');
INSERT INTO arp_richtplan_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GeometryCHLV95_V1.SurfaceStructure','surfacestructure');
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.MultiSurface.Surfaces','multisurface_surfaces','surfacestructure','multisurface');
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche.Objektname','objektname','detailkarten_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Status','astatus','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Planungsstand','planungsstand','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche.Abstimmungskategorie','abstimmungskategorie','detailkarten_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernder_Punkt.Gemeindename','gemeindename','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche.Objekttyp','objekttyp','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Status','astatus','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche.weitere_Informationen','weitere_informationen','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernder_Punkt.Geometrie','geometrie','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernder_Punkt.Objekttyp','objekttyp','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche.Geometrie','geometrie','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Objektname','objektname','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Dokumente','dokumente','richtplankarte_ueberlagernde_linie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Dokumente','dokumente','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Linie.Objektnummer','objektnummer','richtplankarte_ueberlagernde_linie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche.Gemeindenamen','gemeindenamen','detailkarten_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Planungsstand','planungsstand','richtplankarte_ueberlagernde_linie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernder_Punkt.Objekttyp','objekttyp','detailkarten_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.SurfaceStructure.Surface','surface','surfacestructure',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Linie.Geometrie','geometrie','richtplankarte_ueberlagernde_linie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Abstimmungskategorie','abstimmungskategorie','richtplankarte_ueberlagernde_linie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernder_Punkt.Gemeindename','gemeindename','detailkarten_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.LineStructure.Line','line','linestructure',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche.Objektnummer','objektnummer','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernder_Punkt.Status','astatus','detailkarten_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Bedeutung','bedeutung','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Dokumente','dokumente','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Objektname','objektname','richtplankarte_ueberlagernde_linie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung.Abstimmungskategorie','abstimmungskategorie','richtplankarte_grundnutzung',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung.Grundnutzungsart','grundnutzungsart','richtplankarte_grundnutzung',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernder_Punkt.Spezifikation','spezifikation','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Abstimmungskategorie','abstimmungskategorie','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Abstimmungskategorie','abstimmungskategorie','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche.Objekttyp','objekttyp','detailkarten_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung.Geometrie','geometrie','richtplankarte_grundnutzung',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Bedeutung','bedeutung','richtplankarte_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GeometryCHLV95_V1.MultiLine.Lines','multiline_lines','linestructure','multiline');
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche.Geometrie','geometrie','detailkarten_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche.Gemeindenamen','gemeindenamen','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Linie.Objekttyp','objekttyp','richtplankarte_ueberlagernde_linie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung.Dokumente','dokumente','richtplankarte_grundnutzung',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Status','astatus','richtplankarte_ueberlagernde_linie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernder_Punkt.Geometrie','geometrie','detailkarten_ueberlagernder_punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Objektname','objektname','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Bedeutung','bedeutung','richtplankarte_ueberlagernde_linie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie.Planungsstand','planungsstand','richtplankarte_ueberlagernde_flaeche',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung.Planungsstand','planungsstand','richtplankarte_grundnutzung',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.MultiSurface','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie','ch.ehi.ili2db.inheritance','subClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Linie.Geometrie','ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.MultiLine','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernder_Punkt','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Linie','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.LineStructure','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernder_Punkt','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche.Geometrie','ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GeometryCHLV95_V1.SurfaceStructure','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.MultiLine',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.LineStructure',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Flaeche','SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie');
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernder_Punkt',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.MultiSurface',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.Grundnutzung',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernder_Punkt','SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie');
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Linie','SO_ARP_Richtplan_Publikation_20190301.Richtplankarte.ueberlagernde_Geometrie');
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GeometryCHLV95_V1.SurfaceStructure',NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Richtplan_Publikation_20190301.Detailkarten.ueberlagernde_Flaeche',NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Deponie',0,'Deponie',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Windenergie',1,'Windenergie',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Naturpark',2,'Naturpark',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kantonales_Vorranggebiet',3,'kantonales Vorranggebiet',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Sondernutzungsgebiet',4,'Sondernutzungsgebiet',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Witischutzzone',5,'Witischutzzone',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kantonale_Uferschutzzone',6,'kantonale Uferschutzzone',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Entwicklungsgebiet_Arbeiten',7,'Entwicklungsgebiet Arbeiten',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Grundwasserschutzzone_areal',8,'Grundwasserschutzzone areal',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Siedlungstrennguertel',9,'Siedlungstrennguertel',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kantonales_Naturreservat',10,'kantonales Naturreservat',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'BLN_Gebiet',11,'BLN Gebiet',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abbaustelle.Kies',12,'Abbaustelle.Kies',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abbaustelle.Kalkstein',13,'Abbaustelle.Kalkstein',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abbaustelle.Ton',14,'Abbaustelle.Ton',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Fruchtfolgeflaeche',15,'Fruchtfolgeflaeche',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Juraschutzzone',16,'Juraschutzzone',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_bedeutung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'regional',0,'regional',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_bedeutung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kantonal',1,'kantonal',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_bedeutung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'national',2,'national',FALSE,NULL);
INSERT INTO arp_richtplan_pub.abstimmungskategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ausgangslage',0,'Ausgangslage',FALSE,NULL);
INSERT INTO arp_richtplan_pub.abstimmungskategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Vororientierung',1,'Vororientierung',FALSE,NULL);
INSERT INTO arp_richtplan_pub.abstimmungskategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Zwischenergebnis',2,'Zwischenergebnis',FALSE,NULL);
INSERT INTO arp_richtplan_pub.abstimmungskategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Festsetzung',3,'Festsetzung',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_linie_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Erdgastransportleitung',0,'Erdgastransportleitung',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_linie_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Hochspannungsleitung',1,'Hochspannungsleitung',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_linie_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bahnlinie.Schiene',2,'Bahnlinie.Schiene',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_linie_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bahnlinie.Tunnel',3,'Bahnlinie.Tunnel',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_linie_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Nationalstrasse.Strasse',4,'Nationalstrasse.Strasse',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_linie_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Nationalstrasse.Tunnel',5,'Nationalstrasse.Tunnel',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_linie_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kantonsstrasse',6,'Kantonsstrasse',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernde_linie_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wildtierkorridor',7,'Wildtierkorridor',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schiess_Uebungsplatz',0,'Schiess Uebungsplatz',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kehrrichtverbrennungsanlage',1,'Kehrrichtverbrennungsanlage',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kernkraftwerk',2,'Kernkraftwerk',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wasserkraftwerk.Aare',3,'Wasserkraftwerk.Aare',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wasserkraftwerk.Birs',4,'Wasserkraftwerk.Birs',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wasserkraftwerk.Emmenkanal',5,'Wasserkraftwerk.Emmenkanal',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Flugplatz',6,'Flugplatz',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bahn_Bus_Haltestelle',7,'Bahn Bus Haltestelle',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Autobahnanschluss.Vollanschluss',8,'Autobahnanschluss.Vollanschluss',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Autobahnanschluss.Halbanschluss',9,'Autobahnanschluss.Halbanschluss',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'oeffentliche_Bauten',10,'oeffentliche Bauten',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Umstrukturierungsgebiet',11,'Umstrukturierungsgebiet',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Einkaufszentrum',12,'Einkaufszentrum',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bahnhofgebiet',13,'Bahnhofgebiet',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Arbeitszone',14,'Arbeitszone',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'UNESCO_Weltkulturerbe',15,'UNESCO Weltkulturerbe',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ortsbild',16,'Ortsbild',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Freizeit_Sport_Anlage',17,'Freizeit Sport Anlage',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gueterregulierung',18,'Gueterregulierung',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Erweiterung_Siedlungsgebiet',19,'Erweiterung Siedlungsgebiet',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Handlungsraum.agglogepraegt',0,'Handlungsraum.agglogepraegt',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Handlungsraum.laendlich',1,'Handlungsraum.laendlich',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Handlungsraum.urban',2,'Handlungsraum.urban',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Freizeit_Sport_Erholung',3,'Freizeit Sport Erholung',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'naturnaher_Landschaftsraum',4,'naturnaher Landschaftsraum',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernde_flaeche_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'landwirtschaftliches_Vorranggebiet',5,'landwirtschaftliches Vorranggebiet',FALSE,NULL);
INSERT INTO arp_richtplan_pub.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'neu',0,'neu',FALSE,NULL);
INSERT INTO arp_richtplan_pub.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'bestehend',1,'bestehend',FALSE,NULL);
INSERT INTO arp_richtplan_pub.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Erweiterung',2,'Erweiterung',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Freizeitnutzung',0,'Freizeitnutzung',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Zentrumsstruktur.Hauptzentrum',1,'Zentrumsstruktur.Hauptzentrum',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Zentrumsstruktur.Regionalzentrum',2,'Zentrumsstruktur.Regionalzentrum',FALSE,NULL);
INSERT INTO arp_richtplan_pub.detailkarten_ueberlagernder_punkt_objekttyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Zentrumsstruktur.Stuetzpunktgemeinde',3,'Zentrumsstruktur.Stuetzpunktgemeinde',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_grundnutzung_grundnutzungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gewaesser',0,'Gewaesser',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_grundnutzung_grundnutzungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Nationalstrasse',1,'Nationalstrasse',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_grundnutzung_grundnutzungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wald',2,'Wald',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_grundnutzung_grundnutzungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Landwirtschaftsgebiet',3,'Landwirtschaftsgebiet',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_grundnutzung_grundnutzungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Siedlungsgebiet.Wohnen_oeffentliche_Bauten',4,'Siedlungsgebiet.Wohnen oeffentliche Bauten',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_grundnutzung_grundnutzungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Siedlungsgebiet.Industrie_Arbeiten',5,'Siedlungsgebiet.Industrie Arbeiten',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_grundnutzung_grundnutzungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Reservezone',6,'Reservezone',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_planungsstand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Auflage',0,'in Auflage',FALSE,NULL);
INSERT INTO arp_richtplan_pub.richtplankarte_planungsstand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'rechtsgueltig',1,'rechtsgueltig',FALSE,NULL);
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'multisurface_surfaces','ch.ehi.ili2db.foreignKey','multisurface');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie',NULL,'dokumente','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche',NULL,'dokumente','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTILINESTRING');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_grundnutzung',NULL,'dokumente','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_grundnutzung',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_grundnutzung',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_grundnutzung',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_grundnutzung',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_grundnutzung',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_grundnutzung',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_grundnutzung',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('surfacestructure',NULL,'surface','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('detailkarten_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt',NULL,'dokumente','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.geomType','LINESTRING');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'line','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.geomType','MULTIPOLYGON');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO arp_richtplan_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('linestructure',NULL,'multiline_lines','ch.ehi.ili2db.foreignKey','multiline');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('linestructure','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_planungsstand','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('detailkarten_ueberlagernde_flaeche_objekttyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche_objekttyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt_objekttyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_grundnutzung','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_ueberlagernde_flaeche','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_grundnutzung_grundnutzungsart','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('detailkarten_ueberlagernder_punkt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('detailkarten_ueberlagernder_punkt_objekttyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('multiline','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_ueberlagernder_punkt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('multisurface','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('surfacestructure','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('astatus','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('detailkarten_ueberlagernde_flaeche','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_ueberlagernde_linie_objekttyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('richtplankarte_bedeutung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('abstimmungskategorie','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO arp_richtplan_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('Units-20120220.ili','2.3','Units','!! File Units.ili Release 2012-02-20

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

','2020-10-22 15:40:57.899');
INSERT INTO arp_richtplan_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CoordSys-20151124.ili','2.3','CoordSys','!! File CoordSys.ili Release 2015-11-24

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

','2020-10-22 15:40:57.899');
INSERT INTO arp_richtplan_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('SO_ARP_Richtplan_Publikation_20190301.ili','2.3','SO_ARP_Richtplan_Publikation_20190301{ GeometryCHLV95_V1}','INTERLIS 2.3;

/** !!-----------------------------------------------------------------------------
 * !! Version    | wer | Aenderung
 * !!------------------------------------------------------------------------------
 * !! 2018-10-08 | NS  | Ersterfassung
 * !! 2018-10-29 | NS  | Anpassung Attributnamen und Enumerationeintraege
 * !! 2018-11-02 | NS  | abstrakte Klasse integriert
 * !! 2018-12-03 | NS  | Aenderungen aus dem Erfassungsmodell uebernommen
 * !! 2018-12-14 | NS  | Anpassung Grundnutzung zu Grundnutzung_erweitert
 * !! 2019-02-22 | NS  | Anpassung Grundnutzung_erweitert zu Grundnutzung
 * !! 2019-03-01 | NS  | Nationalstrasse.Autobahn_Autostrasse zu
 *                       Nationalstrasse.Strasse umbenannt
 *                       Ueberlagerungen bei Juraschutzzonen entfernt
 * !!==============================================================================
 */
!!@ technicalContact=mailto:agi@bd.so.ch
MODEL SO_ARP_Richtplan_Publikation_20190301 (de)
AT "http://geo.so.ch/models/ARP"
VERSION "2019-03-01"  =
  IMPORTS GeometryCHLV95_V1;

  DOMAIN

    /** Kategorie der Abstimmung
     */
    Abstimmungskategorie = (
      Ausgangslage,
      Vororientierung,
      Zwischenergebnis,
      Festsetzung
    );

    /** Status des Objekts
     */
    Status = (
      neu,
      bestehend,
      Erweiterung
    );

  TOPIC Detailkarten =
    OID AS INTERLIS.UUIDOID;

    /** ueberlagernde Flaechen der Detailkarten
     */
    CLASS ueberlagernde_Flaeche =
      /** Name der ueberlagernden Flaeche
       */
      Objektname : TEXT*150;
      /** Typ der ueberlagernden Flaeche
       */
      Objekttyp : MANDATORY (
        Handlungsraum(
          agglogepraegt,
          laendlich,
          urban
        ),
        Freizeit_Sport_Erholung,
        naturnaher_Landschaftsraum,
        landwirtschaftliches_Vorranggebiet
      );
      /** Kategorie der Abstimmung
       */
      Abstimmungskategorie : SO_ARP_Richtplan_Publikation_20190301.Abstimmungskategorie;
      /** Flaechengeometrie der ueberlagernden Flaeche
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.SurfaceWithOverlaps2mm;
      /** Namen der betroffenen Gemeinden
       */
      Gemeindenamen : TEXT*255;
    END ueberlagernde_Flaeche;

    /** ueberlagernde Punkte der Detailkarten
     */
    CLASS ueberlagernder_Punkt =
      /** Status des ueberlagernden Punkts
       */
      Status : MANDATORY SO_ARP_Richtplan_Publikation_20190301.Status;
      /** Typ des ueberlagernden Punkts
       */
      Objekttyp : MANDATORY (
        Freizeitnutzung,
        Zentrumsstruktur(
          Hauptzentrum,
          Regionalzentrum,
          Stuetzpunktgemeinde
        )
      );
      /** Punktgeometrie des ueberlagernden Punkts
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
      /** Name der Gemeinde
       */
      Gemeindename : TEXT*150;
    END ueberlagernder_Punkt;

  END Detailkarten;

  TOPIC Richtplankarte =
    OID AS INTERLIS.UUIDOID;

    DOMAIN

      /** Bedeutung des Objekts
       */
      Bedeutung = (
        regional,
        kantonal,
        national
      );

      /** Stand der Planung
       */
      Planungsstand = (
        in_Auflage,
        rechtsgueltig
      );

    /** Grundnutzung des Richtplans
     */
    CLASS Grundnutzung =
      /** Abstimmungskategorie
       */
      Abstimmungskategorie : MANDATORY SO_ARP_Richtplan_Publikation_20190301.Abstimmungskategorie;
      /** Art der Grundnutzung
       */
      Grundnutzungsart : MANDATORY (
        Gewaesser,
        Nationalstrasse,
        Wald,
        Landwirtschaftsgebiet,
        Siedlungsgebiet(
          Wohnen_oeffentliche_Bauten,
          Industrie_Arbeiten
        ),
        Reservezone
      );
      /** Flaechengeometrie der Grundnutzung
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.SurfaceWithOverlaps2mm;
      /** Auflistung der Dokumente
       */
      Dokumente : MTEXT;
      /** Stand der Planung
       */
      Planungsstand : MANDATORY Planungsstand;
    END Grundnutzung;

    /** Geometrien, welche die Grundnutzung ueberlagern
     */
    CLASS ueberlagernde_Geometrie (ABSTRACT) =
      /** Name der ueberlagernden Geometrie
       */
      Objektname : TEXT*150;
      /** Kategorie der Abstimmung
       */
      Abstimmungskategorie : MANDATORY SO_ARP_Richtplan_Publikation_20190301.Abstimmungskategorie;
      /** Bedeutung der ueberlagernden Geometrie
       */
      Bedeutung : Bedeutung;
      /** Stand der Planung
       */
      Planungsstand : MANDATORY Planungsstand;
      /** Auflistung der dazugehoerigen Dokumente
       */
      Dokumente : MTEXT;
      /** Status der ueberlagernden Geometrie
       */
      Status : MANDATORY SO_ARP_Richtplan_Publikation_20190301.Status;
    END ueberlagernde_Geometrie;

    /** Polygonthemen, welche die Grundnutzung des Richtplans ueberlagern.
     */
    CLASS ueberlagernde_Flaeche
    EXTENDS ueberlagernde_Geometrie =
      /** Nummer der ueberlagernden Flaeche
       */
      Objektnummer : TEXT*10;
      /** Typ der ueberlagernden Flaeche
       */
      Objekttyp : MANDATORY (
        Deponie,
        Windenergie,
        Naturpark,
        kantonales_Vorranggebiet,
        Sondernutzungsgebiet,
        Witischutzzone,
        kantonale_Uferschutzzone,
        Entwicklungsgebiet_Arbeiten,
        Grundwasserschutzzone_areal,
        Siedlungstrennguertel,
        kantonales_Naturreservat,
        BLN_Gebiet,
        Abbaustelle(
          Kies,
          Kalkstein,
          Ton
        ),
        Fruchtfolgeflaeche,
        Juraschutzzone
      );
      /** weitere Informationen zu der ueberlagernden Flaeche
       */
      weitere_Informationen : TEXT*255;
      /** Polygongeometrie der ueberlagernden Flaeche
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiSurface;
      /** betroffene Gemeinden
       */
      Gemeindenamen : MANDATORY TEXT*1024;
    END ueberlagernde_Flaeche;

    /** Linienthemen, welche die Grundnutzung des Richtplans ueberlagern.
     */
    CLASS ueberlagernde_Linie
    EXTENDS ueberlagernde_Geometrie =
      /** Objektnummer der ueberlagernden Linie
       */
      Objektnummer : TEXT*10;
      /** Typ der ueberlagernden Linie
       */
      Objekttyp : MANDATORY (
        Erdgastransportleitung,
        Hochspannungsleitung,
        Bahnlinie(
          Schiene,
          Tunnel
        ),
        Nationalstrasse(
          Strasse,
          Tunnel
        ),
        Kantonsstrasse,
        Wildtierkorridor
      );
      /** Liniengeometrie der ueberlagernden Linie
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.MultiLine;
    END ueberlagernde_Linie;

    /** Punktthemen, welche die Grundnutzung des Richtplans ueberlagern.
     */
    CLASS ueberlagernder_Punkt
    EXTENDS ueberlagernde_Geometrie =
      /** Art des ueberlagernden Punkts
       */
      Objekttyp : MANDATORY (
        Schiess_Uebungsplatz,
        Kehrrichtverbrennungsanlage,
        Kernkraftwerk,
        Wasserkraftwerk(
          Aare,
          Birs,
          Emmenkanal
        ),
        Flugplatz,
        Bahn_Bus_Haltestelle,
        Autobahnanschluss(
          Vollanschluss,
          Halbanschluss
        ),
        oeffentliche_Bauten,
        Umstrukturierungsgebiet,
        Einkaufszentrum,
        Bahnhofgebiet,
        Arbeitszone,
        UNESCO_Weltkulturerbe,
        Ortsbild,
        Freizeit_Sport_Anlage,
        Gueterregulierung,
        Erweiterung_Siedlungsgebiet
      );
      /** weitere Spezifikationen des ueberlagernden Punkts
       */
      Spezifikation : TEXT*255;
      /** Geometrie des ueberlagernden Punkts
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.Coord2;
      /** betroffene Gemeinde
       */
      Gemeindename : MANDATORY TEXT*150;
    END ueberlagernder_Punkt;

  END Richtplankarte;

END SO_ARP_Richtplan_Publikation_20190301.
','2020-10-22 15:40:57.899');
INSERT INTO arp_richtplan_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CHBase_Part1_GEOMETRY_20110830.ili','2.3','GeometryCHLV03_V1{ CoordSys Units INTERLIS} GeometryCHLV95_V1{ CoordSys Units INTERLIS}','/* ########################################################################
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
','2020-10-22 15:40:57.899');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createMetaInfo','True');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.beautifyEnumDispName','underscore');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.arrayTrafo','coalesce');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.nameOptimization','topic');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.localisedTrafo','expand');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.numericCheckConstraints','create');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.sender','ili2pg-4.3.1-23b1f79e8ad644414773bb9bd1a97c8c265c5082');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKey','yes');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.sqlgen.createGeomIndex','True');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsAuthority','EPSG');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsCode','2056');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uuidDefaultValue','uuid_generate_v4()');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.StrokeArcs','enable');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.interlis.ili2c.ilidirs','%ILI_FROM_DB;%XTF_DIR;http://models.interlis.ch/;%JAR_DIR');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKeyIndex','yes');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.jsonTrafo','coalesce');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createEnumDefs','multiTable');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uniqueConstraints','create');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.maxSqlNameLength','60');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.inheritanceTrafo','smart1');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.catalogueRefTrafo','coalesce');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiPointTrafo','coalesce');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO arp_richtplan_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multilingualTrafo','expand');
INSERT INTO arp_richtplan_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ARP_Richtplan_Publikation_20190301','technicalContact','mailto:agi@bd.so.ch');
