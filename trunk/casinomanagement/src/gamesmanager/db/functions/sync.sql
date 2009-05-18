-- Function: sync(character varying)

-- DROP FUNCTION sync(character varying);

CREATE OR REPLACE FUNCTION sync(sucid character varying)
  RETURNS SETOF ipsync AS
$BODY$
declare
  cont integer;
begin
  select into cont count(*) from sucursales
  where sucursalid=$1 AND sync=true;
  if cont = 1 then
    return query select * from ipsync where sucursalid != $1;
  end if;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sync(character varying) OWNER TO casinomngmtapp;
