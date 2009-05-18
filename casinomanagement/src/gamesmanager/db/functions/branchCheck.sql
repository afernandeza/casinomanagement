-- Function: branchCheck(character varying)

-- DROP FUNCTION branchCheck(character varying);

CREATE OR REPLACE FUNCTION branchCheck(sid character varying)
  RETURNS boolean AS
$BODY$
declare
  cont integer;
begin
  select into cont count(*) from sucursales 
  where sucursalid = $1;
  if cont = 1 then
    return true;
  else 
    return false;
  end if;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION branchCheck(character varying) OWNER TO casinomngmtapp;
