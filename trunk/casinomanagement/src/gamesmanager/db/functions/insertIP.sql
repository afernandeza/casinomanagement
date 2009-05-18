-- Function: insertIP(character varying, character varying)

-- DROP FUNCTION insertIP(character varying, character varying);

CREATE OR REPLACE FUNCTION insertIP(sid character varying, ip_addr character varying)
  RETURNS boolean AS
$BODY$
declare
  ipaddrid integer;
begin
  select into ipaddrid ipauto from nextval('IPid') as ipauto;
  insert into ipAddr values(ipaddrid, $1, $2);
  return true;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION insertIP(character varying, character varying) OWNER TO casinomngmtapp;
