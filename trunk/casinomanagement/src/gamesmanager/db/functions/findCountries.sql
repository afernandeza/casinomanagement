-- Function: findcountries()

-- DROP FUNCTION findcountries();

CREATE OR REPLACE FUNCTION findcountries()
  RETURNS country AS
$BODY$
SELECT * FROM country;
$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 100;
ALTER FUNCTION findcountries() OWNER TO casinomngmtapp;