GRANT USAGE ON SCHEMA arp_richtplan_pub TO admin, gretl
;
GRANT SELECT ON ALL TABLES IN SCHEMA arp_richtplan_pub TO gretl
;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA arp_richtplan_pub TO admin
;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA arp_richtplan_pub TO gretl, admin
;
