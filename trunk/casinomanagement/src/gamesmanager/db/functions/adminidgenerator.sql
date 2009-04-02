-- Function: adminidgenerator()

-- DROP FUNCTION adminidgenerator();

CREATE OR REPLACE FUNCTION adminidgenerator()
  RETURNS character varying AS
$BODY$SELECT 'SUCA_A' || nextval('adminid')$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 1;
ALTER FUNCTION adminidgenerator() OWNER TO casinomngmtapp;
