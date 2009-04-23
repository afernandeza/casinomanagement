-- Function: getIP(integer)

-- DROP FUNCTION getIP(integer);

CREATE OR REPLACE FUNCTION getIP(sid integer)
  RETURNS SETOF ipAddr AS
$BODY$
  SELECT * 
  FROM ipAddr 
  WHERE sucursalid = $1;
$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 100;
ALTER FUNCTION getIP(integer) OWNER TO casinomngmtapp;
