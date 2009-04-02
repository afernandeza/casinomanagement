-- Table: sucusales

-- DROP TABLE sucursales;

CREATE TABLE sucursales
(
  direccionid integer NOT NULL,
  nombre character varying(100),
  sucursalid integer NOT NULL,
  CONSTRAINT sucursales_pkey PRIMARY KEY (sucursalid),
  CONSTRAINT sucursales_direccionid_key UNIQUE (direccionid)
)
WITH (OIDS=FALSE);
ALTER TABLE sucursales OWNER TO casinomngmtapp;
