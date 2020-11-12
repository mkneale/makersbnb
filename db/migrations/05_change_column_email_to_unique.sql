\c makersbnb

ALTER TABLE customer
ADD CONSTRAINT unique_email UNIQUE (email);

\c makersbnb_test

ALTER TABLE customer
ADD CONSTRAINT unique_email UNIQUE (email);
