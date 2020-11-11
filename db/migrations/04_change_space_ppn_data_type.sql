\c makersbnb

ALTER TABLE space
ALTER COLUMN ppn TYPE int
USING ppn::text::integer;

\c makersbnb_test

ALTER TABLE space
ALTER COLUMN ppn TYPE int
USING ppn::text::integer;
