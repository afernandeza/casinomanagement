-- Function: updateadmin(integer, character varying, character varying)

-- DROP FUNCTION updateadmin(integer, character varying, character varying);

CREATE OR REPLACE FUNCTION updateadmin(sid integer, p character varying, s character varying)
  RETURNS boolean AS
$BODY$
begin
  update adminuser set 
    password = md5($2),
    sync = $3
    WHERE usuarioid = $1;
   return true;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION updateadmin(integer, character varying, character varying) OWNER TO casinomngmtapp;
