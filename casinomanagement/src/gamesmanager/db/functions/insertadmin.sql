-- Function: insertadmin(character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION insertadmin(character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION insertadmin(nombres character varying, appaterno character varying, apmaterno character varying, usuario character varying, passwd character varying)
  RETURNS boolean AS
$BODY$
declare
  adminid character varying;
  userid integer;
begin
  select into adminid adminidgenerator from adminidgenerator();
  select into userid usidauto from nextval('adminuserid') as usidauto;
  insert into administradores values(nombres, appaterno, apmaterno, userid, adminid);
  insert into adminuser values(userid, usuario, md5(passwd));
  return true;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION insertadmin(character varying, character varying, character varying, character varying, character varying) OWNER TO casinomngmtapp;
