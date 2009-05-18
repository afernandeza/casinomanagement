-- Function: deleteIP(integer)

-- DROP FUNCTION deleteIP(integer);

CREATE OR REPLACE FUNCTION deleteIP(id integer)
  RETURNS boolean AS
$BODY$
begin
  DELETE FROM ipAddr WHERE IPid = $1;
  return true;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION deleteIP(integer) OWNER TO casinomngmtapp;
