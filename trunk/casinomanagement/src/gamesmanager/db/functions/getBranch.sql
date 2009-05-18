-- Function: getBranch(character varying)

-- DROP FUNCTION getBranch(character varying);

CREATE OR REPLACE FUNCTION getBranch(sid character varying)
  RETURNS sucursal_view AS
$BODY$
  SELECT * 
  FROM sucursal_view 
  WHERE sucursalid = $1;
$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 100;
ALTER FUNCTION getBranch(character varying) OWNER TO casinomngmtapp;
