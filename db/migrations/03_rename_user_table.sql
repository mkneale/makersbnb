\c makersbnb

ALTER TABLE "user" RENAME TO customer;

ALTER TABLE customer
RENAME COLUMN user_id TO customer_id;
ALTER TABLE space
RENAME COLUMN user_id TO customer_id;
ALTER TABLE booking
RENAME COLUMN user_id TO customer_id;

\c makersbnb_test

ALTER TABLE "user" RENAME TO customer;

ALTER TABLE customer
RENAME COLUMN user_id TO customer_id;
ALTER TABLE space
RENAME COLUMN user_id TO customer_id;
ALTER TABLE booking
RENAME COLUMN user_id TO customer_id;
