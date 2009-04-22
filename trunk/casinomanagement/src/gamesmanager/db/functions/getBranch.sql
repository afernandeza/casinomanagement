-- Function: getBranch(integer)

-- DROP FUNCTION getBranch(integer);

CREATE OR REPLACE FUNCTION getBranch(sid integer)
  RETURNS sucursal_view AS
$BODY$
  SELECT * 
  FROM sucursal_view 
  WHERE sucursalid = $1;
$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 100;
ALTER FUNCTION getBranch(integer) OWNER TO casinomngmtapp;
