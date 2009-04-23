-- Function: getIPById(integer)

-- DROP FUNCTION getIPById(integer);

CREATE OR REPLACE FUNCTION getIPById(iid integer)
  RETURNS ipAddr AS
$BODY$
  SELECT * 
  FROM ipAddr 
  WHERE IPid = $1;
$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 100;
ALTER FUNCTION getIPById(integer) OWNER TO casinomngmtapp;
