-- Function: deleteAdmin(integer)

-- DROP FUNCTION deleteAdmin(integer);

CREATE OR REPLACE FUNCTION deleteAdmin(id integer)
  RETURNS boolean AS
$BODY$
begin
  DELETE FROM adminuser WHERE usuarioid = $1; 
  DELETE FROM administradores WHERE usuarioid = $1;
  return true;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION deleteAdmin(integer) OWNER TO casinomngmtapp;
