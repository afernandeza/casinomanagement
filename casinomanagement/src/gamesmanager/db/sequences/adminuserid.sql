-- Sequence: adminuserid

-- DROP SEQUENCE adminuserid;

CREATE SEQUENCE adminuserid
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE adminuserid OWNER TO casinomngmtapp;
