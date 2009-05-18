-- Table: sucusales

-- DROP TABLE sucursales;

CREATE TABLE sucursales
(
  direccionid integer NOT NULL,
  nombre character varying(100),
  sucursalid character varying(100) NOT NULL,
  sync boolean NOT NULL DEFAULT false,
  CONSTRAINT sucursales_pkey PRIMARY KEY (sucursalid),
  CONSTRAINT sucursales_direccionid_key UNIQUE (direccionid)
)
WITH (OIDS=FALSE);
ALTER TABLE sucursales OWNER TO casinomngmtapp;
