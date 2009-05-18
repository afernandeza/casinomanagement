-- Function: getIP(character varying)

-- DROP FUNCTION getIP(character varying);

CREATE OR REPLACE FUNCTION getIP(sid character varying)
  RETURNS SETOF ipAddr AS
$BODY$
  SELECT * 
  FROM ipAddr 
  WHERE sucursalid = $1;
$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 100;
ALTER FUNCTION getIP(character varying) OWNER TO casinomngmtapp;
