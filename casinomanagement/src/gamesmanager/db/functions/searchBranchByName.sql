-- Function: searchBranchByName(character varying)

-- DROP FUNCTION searchBranchByName(character varying);

CREATE OR REPLACE FUNCTION searchBranchByName(name character varying)
  RETURNS SETOF sucursal_view AS
$BODY$
  SELECT * 
  FROM sucursal_view 
  WHERE nombre like $1;
$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 100;
ALTER FUNCTION searchBranchByName(character varying) OWNER TO casinomngmtapp;
