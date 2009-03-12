-- Table: administradores

-- DROP TABLE administradores;

CREATE TABLE administradores
(
  nombres character varying(100) NOT NULL,
  appaterno character varying(100) NOT NULL,
  apmaterno character varying(100),
  usuarioid integer NOT NULL,
  adminid character varying(100) NOT NULL,
  CONSTRAINT administradores_pkey PRIMARY KEY (adminid),
  CONSTRAINT administradores_usuarioid_fkey FOREIGN KEY (usuarioid)
      REFERENCES adminuser (usuarioid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (OIDS=FALSE);
ALTER TABLE administradores OWNER TO casindesktopapp;
