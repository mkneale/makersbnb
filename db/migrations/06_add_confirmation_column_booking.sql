\c makersbnb

ALTER TABLE booking
ADD COLUMN confirmation BOOLEAN;

\c makersbnb_test

ALTER TABLE booking
ADD COLUMN confirmation BOOLEAN;
