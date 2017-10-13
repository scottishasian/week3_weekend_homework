DROP TABLE tickets;
DROP TABLE film;
DROP TABLE customers;

CREATE TABLE customer
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  cash INT4
);

CREATE TABLE film
(
  id SERIAL8 PRIMARY KEY,
  film_name VARCHAR(255),
  duration_minutes INT8,
  age_rating INT4
);
