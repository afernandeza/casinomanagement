-- View: sucursal_view

-- DROP VIEW sucursal_view;

CREATE OR REPLACE VIEW sucursal_view AS 
 SELECT sucursales.sucursalid, sucursales.nombre, direcciones.callenum, direcciones.numint, direcciones.colonia, direcciones.codigopostal, direcciones.municipio, direcciones.estado, direcciones.pais
   FROM sucursales, direcciones
  WHERE sucursales.direccionid = direcciones.direccionid;

ALTER TABLE sucursal_view OWNER TO casinomngmtapp;