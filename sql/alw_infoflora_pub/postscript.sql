GRANT USAGE ON SCHEMA alw_infoflora_pub TO admin, gretl
;
GRANT SELECT ON ALL TABLES IN SCHEMA alw_infoflora_pub TO gretl
;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA alw_infoflora_pub TO admin
;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA alw_infoflora_pub TO gretl, admin
;
