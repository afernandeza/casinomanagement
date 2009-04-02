-- Table: adminuser

-- DROP TABLE adminuser;

CREATE TABLE adminuser
(
  usuarioid integer NOT NULL,
  usuario character varying(100) NOT NULL,
  "password" character varying(100) NOT NULL,
  CONSTRAINT adminuser_pkey PRIMARY KEY (usuarioid)
)
WITH (OIDS=FALSE);
ALTER TABLE adminuser OWNER TO casinomngmtapp;
