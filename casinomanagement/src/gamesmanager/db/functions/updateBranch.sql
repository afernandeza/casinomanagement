-- Function: updateBranch(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION updateBranch(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION updateBranch(sid character varying, name character varying, street character varying, num character varying, col character varying, muni character varying, cp character varying, state character varying, country character varying)
  RETURNS boolean AS
$BODY$
declare
  addressid integer;
begin
  select into addressid direccionid from sucursales where sucursalid = $1;
  update sucursales set 
    nombre = $2
    where sucursalid = $1;
  update direcciones set 
    callenum = $3,
    numint = $4,
    colonia = $5,
    municipio = $6,
    codigopostal = $7,
    estado = $8,
    pais = $9
    WHERE direccionid = addressid;
   return true;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION updateBranch(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying) OWNER TO casinomngmtapp;
