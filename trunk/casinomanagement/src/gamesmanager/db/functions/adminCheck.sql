-- Function: adminCheck(character varying)

-- DROP FUNCTION adminCheck(character varying);

CREATE OR REPLACE FUNCTION adminCheck(sid character varying)
  RETURNS boolean AS
$BODY$
declare
  cont integer;
begin
  select into cont count(*) from adminuser 
  where usuario = $1;
  if cont = 1 then
    return true;
  else 
    return false;
  end if;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION adminCheck(character varying) OWNER TO casinomngmtapp;
