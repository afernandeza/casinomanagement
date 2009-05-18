-- Function: deleteBranch(character varying)

-- DROP FUNCTION deleteBranch(character varying);

CREATE OR REPLACE FUNCTION deleteBranch(id character varying)
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
ALTER FUNCTION deleteBranch(character varying) OWNER TO casinomngmtapp;
