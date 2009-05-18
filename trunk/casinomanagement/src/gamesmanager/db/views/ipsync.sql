-- View: "ipsync"

-- DROP VIEW "ipsync";

CREATE OR REPLACE VIEW "ipsync" AS 
 SELECT sucursales.sucursalid, ipaddr.ip
   FROM sucursales, ipaddr
  WHERE sucursales.sucursalid = ipaddr.sucursalid;

ALTER TABLE "ipsync" OWNER TO casinomngmtapp;