-- Function: insertbranch(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION insertbranch(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION insertbranch(nombre character varying, callenum character varying, numint character varying, colonia character varying, municipio character varying, codigopostal character varying, estado character varying, pais character varying)
  RETURNS boolean AS
$BODY$
declare
  addressid integer;
  branchid integer;
begin
  select into addressid addressauto from nextval('addressid') as addressauto;
  select into branchid branchauto from nextval('branchid') as branchauto;
  insert into sucursales values(addressid, nombre, branchid);
  insert into direcciones values(addressid, callenum, numint, colonia,
  municipio, codigopostal, estado, pais);
  return true;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION insertbranch(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying) OWNER TO casinomngmtapp;
