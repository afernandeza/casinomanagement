-- Table: ipAddr

-- DROP TABLE ipAddr;

CREATE TABLE ipAddr
(
  IPid integer NOT NULL,
  sucursalid character varying(100) NOT NULL,
  ip character varying(100) NOT NULL,
  CONSTRAINT ipAddr_pkey PRIMARY KEY (IPid),
  CONSTRAINT ipAddr_sucursalid_fkey FOREIGN KEY (sucursalid)
      REFERENCES sucursales (sucursalid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (OIDS=FALSE);
ALTER TABLE ipAddr OWNER TO casinomngmtapp;
