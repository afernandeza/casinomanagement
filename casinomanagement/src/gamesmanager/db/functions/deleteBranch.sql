-- Function: deleteBranch(integer)

-- DROP FUNCTION deleteBranch(integer);

CREATE OR REPLACE FUNCTION deleteBranch(id integer)
  RETURNS boolean AS
$BODY$
declare
  addressid integer;
begin
  SELECT INTO addressid direccionid FROM sucursales WHERE sucursalid = $1;
  DELETE FROM direcciones WHERE direccionid = addressid; 
  DELETE FROM sucursales WHERE sucursalid = $1;
  DELETE FROM ipAddr WHERE sucursalid = $1;
  return true;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION deleteBranch(integer) OWNER TO casinomngmtapp;
