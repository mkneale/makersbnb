\c makersbnb

CREATE TABLE "user" (
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(60),
  password VARCHAR(60)
);

CREATE TABLE space(
  space_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES "user" (user_id),
  name VARCHAR(60),
  description VARCHAR(200),
  ppn MONEY,
  start_date DATE,
  end_date DATE
);

CREATE TABLE booking (
  booking_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES "user" (user_id),
  space_id INTEGER REFERENCES space (space_id),
  booking_date DATE
);

\c makersbnb_test

CREATE TABLE "user" (
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(60),
  password VARCHAR(60)
);

CREATE TABLE space(
  space_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES "user" (user_id),
  name VARCHAR(60),
  description VARCHAR(200),
  ppn MONEY,
  start_date DATE,
  end_date DATE
);

CREATE TABLE booking (
  booking_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES "user" (user_id),
  space_id INTEGER REFERENCES space (space_id),
  booking_date DATE
);
