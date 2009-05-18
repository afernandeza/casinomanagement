-- Table: sesiones

-- DROP TABLE sesiones;

CREATE TABLE sesiones
(
  sesionid integer NOT NULL,
  mesaid integer NOT NULL,
  fichasinicio integer NOT NULL,
  fichasfin integer,
  empleadoid character varying(100) NOT NULL,
  timeopened timestamp with time zone NOT NULL,
  timeclosed timestamp with time zone,
  CONSTRAINT sesiones_pkey PRIMARY KEY (sesionid)
)
WITH (OIDS=FALSE);
ALTER TABLE sesiones OWNER TO casinomngmtapp;
