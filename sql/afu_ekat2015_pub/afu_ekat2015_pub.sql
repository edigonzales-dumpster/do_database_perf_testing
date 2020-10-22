CREATE SCHEMA IF NOT EXISTS afu_ekat2015_pub;
CREATE SEQUENCE afu_ekat2015_pub.t_ili2db_seq;;
-- SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat
CREATE TABLE afu_ekat2015_pub.ekat_ekat (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_ekat2015_pub.t_ili2db_seq')
  ,T_Ili_Tid uuid NULL DEFAULT uuid_generate_v4()
  ,geometrie geometry(POLYGON,2056) NOT NULL
  ,so2_gesamt integer NOT NULL
  ,nox_gesamt integer NOT NULL
  ,co_gesamt integer NOT NULL
  ,ch4_gesamt integer NOT NULL
  ,pm10_gesamt integer NOT NULL
  ,nh3_gesamt integer NOT NULL
  ,nmvoc_gesamt integer NOT NULL
  ,co2_gesamt integer NOT NULL
  ,n2o_gesamt integer NOT NULL
  ,xkw_gesamt integer NOT NULL
  ,so2_haushalte integer NOT NULL
  ,nox_haushalte integer NOT NULL
  ,co_haushalte integer NOT NULL
  ,ch4_haushalte integer NOT NULL
  ,pm10_haushalte integer NOT NULL
  ,nh3_haushalte integer NOT NULL
  ,nmvoc_haushalte integer NOT NULL
  ,co2_haushalte integer NOT NULL
  ,n2o_haushalte integer NOT NULL
  ,xkw_haushalte integer NOT NULL
  ,so2_biogen integer NOT NULL
  ,nox_biogen integer NOT NULL
  ,co_biogen integer NOT NULL
  ,ch4_biogen integer NOT NULL
  ,pm10_biogen integer NOT NULL
  ,nh3_biogen integer NOT NULL
  ,nmvoc_biogen integer NOT NULL
  ,co2_biogen integer NOT NULL
  ,n2o_biogen integer NOT NULL
  ,xkw_biogen integer NOT NULL
  ,so2_industrie_und_gewerbe integer NOT NULL
  ,nox_industrie_und_gewerbe integer NOT NULL
  ,co_industrie_und_gewerbe integer NOT NULL
  ,ch4_industrie_und_gewerbe integer NOT NULL
  ,pm10_industrie_und_gewerbe integer NOT NULL
  ,nh3_industrie_und_gewerbe integer NOT NULL
  ,nmvoc_industrie_und_gewerbe integer NOT NULL
  ,co2_industrie_und_gewerbe integer NOT NULL
  ,n2o_industrie_und_gewerbe integer NOT NULL
  ,xkw_industrie_und_gewerbe integer NOT NULL
  ,so2_land_und_forstwirtschaft integer NOT NULL
  ,nox_land_und_forstwirtschaft integer NOT NULL
  ,co_land_und_forstwirtschaft integer NOT NULL
  ,ch4_land_und_forstwirtschaft integer NOT NULL
  ,pm10_land_und_forstwirtschaft integer NOT NULL
  ,nh3_land_und_forstwirtschaft integer NOT NULL
  ,nmvoc_land_und_forstwirtschaft integer NOT NULL
  ,co2_land_und_forstwirtschaft integer NOT NULL
  ,n2o_land_und_forstwirtschaft integer NOT NULL
  ,xkw_land_und_forstwirtschaft integer NOT NULL
  ,so2_verkehr integer NOT NULL
  ,nox_verkehr integer NOT NULL
  ,co_verkehr integer NOT NULL
  ,ch4_verkehr integer NOT NULL
  ,pm10_verkehr integer NOT NULL
  ,nh3_verkehr integer NOT NULL
  ,nmvoc_verkehr integer NOT NULL
  ,co2_verkehr integer NOT NULL
  ,n2o_verkehr integer NOT NULL
  ,xkw_verkehr integer NOT NULL
)
;
CREATE INDEX ekat_ekat_geometrie_idx ON afu_ekat2015_pub.ekat_ekat USING GIST ( geometrie );
COMMENT ON TABLE afu_ekat2015_pub.ekat_ekat IS 'Emissionskataster des Kanton Solothurn';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.geometrie IS 'Geometrie';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.so2_gesamt IS 'SO2-Emission. Summe aller Quellgruppen';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nox_gesamt IS 'NOX-Emission. Summe aller Quellgruppen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co_gesamt IS 'CO-Emission. Summe aller Quellgruppen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.ch4_gesamt IS 'CH4-Emission. Summe aller Quellgruppen';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.pm10_gesamt IS 'PM10-Emission. Summe aller Quellgruppen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nh3_gesamt IS 'NH3-Emission. Summe aller Quellgruppen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nmvoc_gesamt IS 'NMVOC-Emission. Summe aller Quellgruppen';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co2_gesamt IS 'CO2-Emission. Summe aller Quellgruppen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.n2o_gesamt IS 'N2O-Emission. Summe aller Quellgruppen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.xkw_gesamt IS 'XKW-Emission. Summe aller Quellgruppen';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.so2_haushalte IS 'SO2-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nox_haushalte IS 'NOX-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co_haushalte IS 'CO-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.ch4_haushalte IS 'CH4-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.pm10_haushalte IS 'PM10-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nh3_haushalte IS 'NH3-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nmvoc_haushalte IS 'NMVOC-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co2_haushalte IS 'CO2-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.n2o_haushalte IS 'N2O-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.xkw_haushalte IS 'XKW-Emissionen der Quellgruppe Haushalte.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.so2_biogen IS 'SO2-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nox_biogen IS 'NOX-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co_biogen IS 'CO-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.ch4_biogen IS 'CH4-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.pm10_biogen IS 'PM10-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nh3_biogen IS 'NH3-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nmvoc_biogen IS 'NMVOC-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co2_biogen IS 'CO2-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.n2o_biogen IS 'N2O-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.xkw_biogen IS 'XKW-Emissionen der Quellgruppe Biogen.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.so2_industrie_und_gewerbe IS 'SO2-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nox_industrie_und_gewerbe IS 'NOX-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co_industrie_und_gewerbe IS 'CO-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.ch4_industrie_und_gewerbe IS 'CH4-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.pm10_industrie_und_gewerbe IS 'PM10-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nh3_industrie_und_gewerbe IS 'NH3-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nmvoc_industrie_und_gewerbe IS 'NMVOC-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co2_industrie_und_gewerbe IS 'CO2-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.n2o_industrie_und_gewerbe IS 'N2O-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.xkw_industrie_und_gewerbe IS 'XKW-Emissionen der Quellgruppe Industrie und Gewerbe.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.so2_land_und_forstwirtschaft IS 'SO2-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nox_land_und_forstwirtschaft IS 'NOX-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co_land_und_forstwirtschaft IS 'CO-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.ch4_land_und_forstwirtschaft IS 'CH4-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.pm10_land_und_forstwirtschaft IS 'PM10-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nh3_land_und_forstwirtschaft IS 'NH3-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nmvoc_land_und_forstwirtschaft IS 'NMVOC-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co2_land_und_forstwirtschaft IS 'CO2-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.n2o_land_und_forstwirtschaft IS 'N2O-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.xkw_land_und_forstwirtschaft IS 'XKW-Emissionen der Quellgruppe Land- und Forstwirtschaft.';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.so2_verkehr IS 'SO2-Emissionen der Quellgruppe Verkehr';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nox_verkehr IS 'NOX-Emissionen der Quellgruppe Verkehr';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co_verkehr IS 'CO-Emissionen der Quellgruppe Verkehr';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.ch4_verkehr IS 'CH4-Emissionen der Quellgruppe Verkehr';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.pm10_verkehr IS 'PM10-Emissionen der Quellgruppe Verkehr';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nh3_verkehr IS 'NH3-Emissionen der Quellgruppe Verkehr';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.nmvoc_verkehr IS 'NMVOC-Emissionen der Quellgruppe Verkehr';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.co2_verkehr IS 'CO2-Emissionen der Quellgruppe Verkehr';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.n2o_verkehr IS 'N2O-Emissionen der Quellgruppe Verkehr';
COMMENT ON COLUMN afu_ekat2015_pub.ekat_ekat.xkw_verkehr IS 'XKW-Emissionen der Quellgruppe Verkehr';
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
  ,domains varchar(1024) NULL
)
;
CREATE INDEX T_ILI2DB_BASKET_dataset_idx ON afu_ekat2015_pub.t_ili2db_basket ( dataset );
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(1024) NULL
)
;
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_MODEL (
  filename varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (iliversion,modelName)
)
;
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,ColOwner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (ColOwner,SqlName)
)
;
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_COLUMN_PROP (
  tablename varchar(255) NOT NULL
  ,subtype varchar(255) NULL
  ,columnname varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_TABLE_PROP (
  tablename varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE afu_ekat2015_pub.T_ILI2DB_META_ATTRS (
  ilielement varchar(255) NOT NULL
  ,attr_name varchar(1024) NOT NULL
  ,attr_value varchar(1024) NOT NULL
)
;
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_so2_gesamt_check CHECK( so2_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nox_gesamt_check CHECK( nox_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co_gesamt_check CHECK( co_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_ch4_gesamt_check CHECK( ch4_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_pm10_gesamt_check CHECK( pm10_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nh3_gesamt_check CHECK( nh3_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nmvoc_gesamt_check CHECK( nmvoc_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co2_gesamt_check CHECK( co2_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_n2o_gesamt_check CHECK( n2o_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_xkw_gesamt_check CHECK( xkw_gesamt BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_so2_haushalte_check CHECK( so2_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nox_haushalte_check CHECK( nox_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co_haushalte_check CHECK( co_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_ch4_haushalte_check CHECK( ch4_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_pm10_haushalte_check CHECK( pm10_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nh3_haushalte_check CHECK( nh3_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nmvoc_haushalte_check CHECK( nmvoc_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co2_haushalte_check CHECK( co2_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_n2o_haushalte_check CHECK( n2o_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_xkw_haushalte_check CHECK( xkw_haushalte BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_so2_biogen_check CHECK( so2_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nox_biogen_check CHECK( nox_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co_biogen_check CHECK( co_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_ch4_biogen_check CHECK( ch4_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_pm10_biogen_check CHECK( pm10_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nh3_biogen_check CHECK( nh3_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nmvoc_biogen_check CHECK( nmvoc_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co2_biogen_check CHECK( co2_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_n2o_biogen_check CHECK( n2o_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_xkw_biogen_check CHECK( xkw_biogen BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_so2_industrie_und_gewerbe_check CHECK( so2_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nox_industrie_und_gewerbe_check CHECK( nox_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co_industrie_und_gewerbe_check CHECK( co_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_ch4_industrie_und_gewerbe_check CHECK( ch4_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_pm10_industrie_und_gewrbe_check CHECK( pm10_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nh3_industrie_und_gewerbe_check CHECK( nh3_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nmvoc_industrie_und_gwrbe_check CHECK( nmvoc_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co2_industrie_und_gewerbe_check CHECK( co2_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_n2o_industrie_und_gewerbe_check CHECK( n2o_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_xkw_industrie_und_gewerbe_check CHECK( xkw_industrie_und_gewerbe BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_so2_land_nd_frstwrtschaft_check CHECK( so2_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nox_land_nd_frstwrtschaft_check CHECK( nox_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co_land_und_frstwrtschaft_check CHECK( co_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_ch4_land_nd_frstwrtschaft_check CHECK( ch4_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_pm10_lnd_nd_frstwrtschaft_check CHECK( pm10_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nh3_land_nd_frstwrtschaft_check CHECK( nh3_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nmvc_lnd_nd_frstwrtschaft_check CHECK( nmvoc_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co2_land_nd_frstwrtschaft_check CHECK( co2_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_n2o_land_nd_frstwrtschaft_check CHECK( n2o_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_xkw_land_nd_frstwrtschaft_check CHECK( xkw_land_und_forstwirtschaft BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_so2_verkehr_check CHECK( so2_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nox_verkehr_check CHECK( nox_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co_verkehr_check CHECK( co_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_ch4_verkehr_check CHECK( ch4_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_pm10_verkehr_check CHECK( pm10_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nh3_verkehr_check CHECK( nh3_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_nmvoc_verkehr_check CHECK( nmvoc_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_co2_verkehr_check CHECK( co2_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_n2o_verkehr_check CHECK( n2o_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.ekat_ekat ADD CONSTRAINT ekat_ekat_xkw_verkehr_check CHECK( xkw_verkehr BETWEEN 0 AND 1000000000);
ALTER TABLE afu_ekat2015_pub.T_ILI2DB_BASKET ADD CONSTRAINT T_ILI2DB_BASKET_dataset_fkey FOREIGN KEY ( dataset ) REFERENCES afu_ekat2015_pub.T_ILI2DB_DATASET DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX T_ILI2DB_DATASET_datasetName_key ON afu_ekat2015_pub.T_ILI2DB_DATASET (datasetName)
;
CREATE UNIQUE INDEX T_ILI2DB_MODEL_iliversion_modelName_key ON afu_ekat2015_pub.T_ILI2DB_MODEL (iliversion,modelName)
;
CREATE UNIQUE INDEX T_ILI2DB_ATTRNAME_ColOwner_SqlName_key ON afu_ekat2015_pub.T_ILI2DB_ATTRNAME (ColOwner,SqlName)
;
INSERT INTO afu_ekat2015_pub.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat','ekat_ekat');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NMVOC_Land_und_Forstwirtschaft','nmvoc_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.N2O_Land_und_Forstwirtschaft','n2o_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.XKW_Haushalte','xkw_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.SO2_Verkehr','so2_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NMVOC_Industrie_und_Gewerbe','nmvoc_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO2_gesamt','co2_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.N2O_Biogen','n2o_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NOX_Haushalte','nox_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NH3_Haushalte','nh3_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NH3_Industrie_und_Gewerbe','nh3_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO2_Land_und_Forstwirtschaft','co2_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO_Haushalte','co_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.XKW_Industrie_und_Gewerbe','xkw_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.PM10_Verkehr','pm10_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NOX_Biogen','nox_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.SO2_Biogen','so2_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO_Industrie_und_Gewerbe','co_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.XKW_gesamt','xkw_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.SO2_gesamt','so2_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NOX_Land_und_Forstwirtschaft','nox_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.XKW_Land_und_Forstwirtschaft','xkw_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NMVOC_Verkehr','nmvoc_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.SO2_Industrie_und_Gewerbe','so2_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NMVOC_Haushalte','nmvoc_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO2_Haushalte','co2_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NH3_Biogen','nh3_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NOX_Industrie_und_Gewerbe','nox_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CH4_Industrie_und_Gewerbe','ch4_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.N2O_Haushalte','n2o_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO2_Biogen','co2_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO_gesamt','co_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NOX_Verkehr','nox_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO_Land_und_Forstwirtschaft','co_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CH4_Haushalte','ch4_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NH3_Land_und_Forstwirtschaft','nh3_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NMVOC_gesamt','nmvoc_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NH3_Verkehr','nh3_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.PM10_Industrie_und_Gewerbe','pm10_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO2_Industrie_und_Gewerbe','co2_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.PM10_Biogen','pm10_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.SO2_Land_und_Forstwirtschaft','so2_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NH3_gesamt','nh3_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CH4_Verkehr','ch4_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.N2O_Verkehr','n2o_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.N2O_Industrie_und_Gewerbe','n2o_industrie_und_gewerbe','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO2_Verkehr','co2_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NMVOC_Biogen','nmvoc_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO_Biogen','co_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CH4_Land_und_Forstwirtschaft','ch4_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CH4_gesamt','ch4_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CH4_Biogen','ch4_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.N2O_gesamt','n2o_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.CO_Verkehr','co_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.XKW_Verkehr','xkw_verkehr','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.PM10_Haushalte','pm10_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.PM10_Land_und_Forstwirtschaft','pm10_land_und_forstwirtschaft','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.SO2_Haushalte','so2_haushalte','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.XKW_Biogen','xkw_biogen','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.Geometrie','geometrie','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.NOX_gesamt','nox_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat.PM10_gesamt','pm10_gesamt','ekat_ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_AFU_Ekat_Publikation_20190222.Ekat.Ekat',NULL);
INSERT INTO afu_ekat2015_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('ekat_ekat',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('ekat_ekat',NULL,'geometrie','ch.ehi.ili2db.c1Max','2870000.000');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('ekat_ekat',NULL,'geometrie','ch.ehi.ili2db.c2Max','1310000.000');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('ekat_ekat',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('ekat_ekat',NULL,'geometrie','ch.ehi.ili2db.c1Min','2460000.000');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('ekat_ekat',NULL,'geometrie','ch.ehi.ili2db.c2Min','1045000.000');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('ekat_ekat',NULL,'geometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('ekat_ekat','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('Units-20120220.ili','2.3','Units','!! File Units.ili Release 2012-02-20

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

','2020-10-22 15:39:57.028');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CoordSys-20151124.ili','2.3','CoordSys','!! File CoordSys.ili Release 2015-11-24

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

','2020-10-22 15:39:57.028');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('SO_AFU_Ekat_Publikation_20190222.ili','2.3','SO_AFU_Ekat_Publikation_20190222{ GeometryCHLV95_V1}','INTERLIS 2.3;

/** !!------------------------------------------------------------------------------
 * !! Version | wer | Aenderung
 * !!------------------------------------------------------------------------------
 * !! 2019-02-22 | Martin Schweizer  | Erstfassung
 * !!==============================================================================
 */
!!@ technicalContact=mailto:agi@bd.so.ch
MODEL SO_AFU_Ekat_Publikation_20190222 (de)
AT "http://geo.so.ch/models/AFU"
VERSION "2019-02-22"  =
  IMPORTS GeometryCHLV95_V1;

  TOPIC Ekat =
    OID AS INTERLIS.UUIDOID;

    /** Emissionskataster des Kanton Solothurn
     */
    CLASS Ekat =
      /** Geometrie
       */
      Geometrie : MANDATORY GeometryCHLV95_V1.Surface;
      /** SO2-Emission. Summe aller Quellgruppen
       */
      SO2_gesamt : MANDATORY 0 .. 1000000000;
      /** NOX-Emission. Summe aller Quellgruppen.
       */
      NOX_gesamt : MANDATORY 0 .. 1000000000;
      /** CO-Emission. Summe aller Quellgruppen.
       */
      CO_gesamt : MANDATORY 0 .. 1000000000;
      /** CH4-Emission. Summe aller Quellgruppen
       */
      CH4_gesamt : MANDATORY 0 .. 1000000000;
      /** PM10-Emission. Summe aller Quellgruppen.
       */
      PM10_gesamt : MANDATORY 0 .. 1000000000;
      /** NH3-Emission. Summe aller Quellgruppen.
       */
      NH3_gesamt : MANDATORY 0 .. 1000000000;
      /** NMVOC-Emission. Summe aller Quellgruppen
       */
      NMVOC_gesamt : MANDATORY 0 .. 1000000000;
      /** CO2-Emission. Summe aller Quellgruppen.
       */
      CO2_gesamt : MANDATORY 0 .. 1000000000;
      /** N2O-Emission. Summe aller Quellgruppen.
       */
      N2O_gesamt : MANDATORY 0 .. 1000000000;
      /** XKW-Emission. Summe aller Quellgruppen
       */
      XKW_gesamt : MANDATORY 0 .. 1000000000;
      /** SO2-Emissionen der Quellgruppe Haushalte.
       */
      SO2_Haushalte : MANDATORY 0 .. 1000000000;
      /** NOX-Emissionen der Quellgruppe Haushalte.
       */
      NOX_Haushalte : MANDATORY 0 .. 1000000000;
      /** CO-Emissionen der Quellgruppe Haushalte.
       */
      CO_Haushalte : MANDATORY 0 .. 1000000000;
      /** CH4-Emissionen der Quellgruppe Haushalte.
       */
      CH4_Haushalte : MANDATORY 0 .. 1000000000;
      /** PM10-Emissionen der Quellgruppe Haushalte.
       */
      PM10_Haushalte : MANDATORY 0 .. 1000000000;
      /** NH3-Emissionen der Quellgruppe Haushalte.
       */
      NH3_Haushalte : MANDATORY 0 .. 1000000000;
      /** NMVOC-Emissionen der Quellgruppe Haushalte.
       */
      NMVOC_Haushalte : MANDATORY 0 .. 1000000000;
      /** CO2-Emissionen der Quellgruppe Haushalte.
       */
      CO2_Haushalte : MANDATORY 0 .. 1000000000;
      /** N2O-Emissionen der Quellgruppe Haushalte.
       */
      N2O_Haushalte : MANDATORY 0 .. 1000000000;
      /** XKW-Emissionen der Quellgruppe Haushalte.
       */
      XKW_Haushalte : MANDATORY 0 .. 1000000000;
      /** SO2-Emissionen der Quellgruppe Biogen.
       */
      SO2_Biogen : MANDATORY 0 .. 1000000000;
      /** NOX-Emissionen der Quellgruppe Biogen.
       */
      NOX_Biogen : MANDATORY 0 .. 1000000000;
      /** CO-Emissionen der Quellgruppe Biogen.
       */
      CO_Biogen : MANDATORY 0 .. 1000000000;
      /** CH4-Emissionen der Quellgruppe Biogen.
       */
      CH4_Biogen : MANDATORY 0 .. 1000000000;
      /** PM10-Emissionen der Quellgruppe Biogen.
       */
      PM10_Biogen : MANDATORY 0 .. 1000000000;
      /** NH3-Emissionen der Quellgruppe Biogen.
       */
      NH3_Biogen : MANDATORY 0 .. 1000000000;
      /** NMVOC-Emissionen der Quellgruppe Biogen.
       */
      NMVOC_Biogen : MANDATORY 0 .. 1000000000;
      /** CO2-Emissionen der Quellgruppe Biogen.
       */
      CO2_Biogen : MANDATORY 0 .. 1000000000;
      /** N2O-Emissionen der Quellgruppe Biogen.
       */
      N2O_Biogen : MANDATORY 0 .. 1000000000;
      /** XKW-Emissionen der Quellgruppe Biogen.
       */
      XKW_Biogen : MANDATORY 0 .. 1000000000;
      /** SO2-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      SO2_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** NOX-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      NOX_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** CO-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      CO_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** CH4-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      CH4_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** PM10-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      PM10_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** NH3-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      NH3_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** NMVOC-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      NMVOC_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** CO2-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      CO2_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** N2O-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      N2O_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** XKW-Emissionen der Quellgruppe Industrie und Gewerbe.
       */
      XKW_Industrie_und_Gewerbe : MANDATORY 0 .. 1000000000;
      /** SO2-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      SO2_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** NOX-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      NOX_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** CO-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      CO_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** CH4-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      CH4_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** PM10-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      PM10_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** NH3-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      NH3_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** NMVOC-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      NMVOC_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** CO2-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      CO2_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** N2O-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      N2O_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** XKW-Emissionen der Quellgruppe Land- und Forstwirtschaft.
       */
      XKW_Land_und_Forstwirtschaft : MANDATORY 0 .. 1000000000;
      /** SO2-Emissionen der Quellgruppe Verkehr
       */
      SO2_Verkehr : MANDATORY 0 .. 1000000000;
      /** NOX-Emissionen der Quellgruppe Verkehr
       */
      NOX_Verkehr : MANDATORY 0 .. 1000000000;
      /** CO-Emissionen der Quellgruppe Verkehr
       */
      CO_Verkehr : MANDATORY 0 .. 1000000000;
      /** CH4-Emissionen der Quellgruppe Verkehr
       */
      CH4_Verkehr : MANDATORY 0 .. 1000000000;
      /** PM10-Emissionen der Quellgruppe Verkehr
       */
      PM10_Verkehr : MANDATORY 0 .. 1000000000;
      /** NH3-Emissionen der Quellgruppe Verkehr
       */
      NH3_Verkehr : MANDATORY 0 .. 1000000000;
      /** NMVOC-Emissionen der Quellgruppe Verkehr
       */
      NMVOC_Verkehr : MANDATORY 0 .. 1000000000;
      /** CO2-Emissionen der Quellgruppe Verkehr
       */
      CO2_Verkehr : MANDATORY 0 .. 1000000000;
      /** N2O-Emissionen der Quellgruppe Verkehr
       */
      N2O_Verkehr : MANDATORY 0 .. 1000000000;
      /** XKW-Emissionen der Quellgruppe Verkehr
       */
      XKW_Verkehr : MANDATORY 0 .. 1000000000;
    END Ekat;

  END Ekat;

END SO_AFU_Ekat_Publikation_20190222.
','2020-10-22 15:39:57.028');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('CHBase_Part1_GEOMETRY_20110830.ili','2.3','GeometryCHLV03_V1{ CoordSys Units INTERLIS} GeometryCHLV95_V1{ CoordSys Units INTERLIS}','/* ########################################################################
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
','2020-10-22 15:39:57.028');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createMetaInfo','True');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.beautifyEnumDispName','underscore');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.arrayTrafo','coalesce');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.nameOptimization','topic');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.localisedTrafo','expand');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.numericCheckConstraints','create');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.sender','ili2pg-4.3.1-23b1f79e8ad644414773bb9bd1a97c8c265c5082');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKey','yes');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.sqlgen.createGeomIndex','True');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsAuthority','EPSG');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsCode','2056');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uuidDefaultValue','uuid_generate_v4()');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.StrokeArcs','enable');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.interlis.ili2c.ilidirs','%ILI_FROM_DB;%XTF_DIR;http://models.interlis.ch/;%JAR_DIR');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKeyIndex','yes');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.jsonTrafo','coalesce');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createEnumDefs','multiTable');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uniqueConstraints','create');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.maxSqlNameLength','60');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.inheritanceTrafo','smart1');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.catalogueRefTrafo','coalesce');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiPointTrafo','coalesce');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multilingualTrafo','expand');
INSERT INTO afu_ekat2015_pub.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_AFU_Ekat_Publikation_20190222','technicalContact','mailto:agi@bd.so.ch');
