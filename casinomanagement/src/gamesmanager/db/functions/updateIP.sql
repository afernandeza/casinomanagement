-- Function: updateIP(integer, character varying)

-- DROP FUNCTION updateIP(integer, character varying);

CREATE OR REPLACE FUNCTION updateIP(iid integer, ip_r character varying)
  RETURNS boolean AS
$BODY$
begin
  update ipAddr set 
    ip = $2
    WHERE IPid = $1;
   return true;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION updateIP(integer, character varying) OWNER TO casinomngmtapp;
