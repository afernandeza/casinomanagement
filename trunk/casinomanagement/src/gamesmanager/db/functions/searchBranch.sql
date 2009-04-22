-- Function: searchBranch(character varying, character varying, character varying, character varying)

-- DROP FUNCTION searchBranch(character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION searchBranch(pais character varying, estado character varying, municipio character varying, colonia character varying)
  RETURNS SETOF sucursal_view AS
$BODY$
  SELECT * 
  FROM sucursal_view 
  WHERE pais like $1 AND estado like $2 AND municipio like $3 AND colonia like $4;
$BODY$
  LANGUAGE 'sql' VOLATILE
  COST 100;
ALTER FUNCTION searchBranch(character varying, character varying, character varying, character varying) OWNER TO casinomngmtapp;
