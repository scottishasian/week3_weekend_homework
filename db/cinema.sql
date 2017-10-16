DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds DECIMAL(10,2)
);

CREATE TABLE films
(
  id SERIAL8 PRIMARY KEY,
  film_name VARCHAR(255),
  price DECIMAL(10,2),
  duration_minutes INT8,
  age_rating INT4
);

CREATE TABLE tickets
(
  id SERIAL8 PRIMARY KEY,
  customer_id INT8 REFERENCES customers(id),
  film_id INT8 REFERENCES films(id)
);

CREATE TABLE screenings
(
  id SERIAL8 PRIMARY KEY,
  film_id INT8 REFERENCES films(id),
  film_name VARCHAR(255) REFERENCES films(film_name),
  film_time VARCHAR(255)
);

-- Could use a check constraint to see if customer is old enough to see a film.
