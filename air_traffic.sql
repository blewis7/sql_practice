-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
    id SERIAL PRIMARY KEY,
    airline_name TEXT NOT NULL
);

INSERT INTO airlines
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


CREATE TABLE countries
(
    id SERIAL PRIMARY KEY,
    country TEXT NOT NULL
);

INSERT INTO countries
  (country)
VALUES
  ('United States'),
  ('China'),
  ('Japan'),
  ('United Kingdom'),
  ('Brazil'),
  ('France'),
  ('Mexico'),
  ('Morocco'),
  ('Chile'),
  ('UAE');


CREATE TABLE cities
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    country_id INTEGER REFERENCES countries
);

INSERT INTO cities
  (city, country_id)
VALUES
  ('Washington DC', 1),
  ('Los Angeles', 1),
  ('Tokyo', 3),
  ('Seattle', 1),
  ('Paris', 6),
  ('London', 4),
  ('Las Vegas', 1),
  ('Mexico City', 7),
  ('Casablanca', 8),
  ('Dubai', 10),
  ('Beijing', 2),
  ('New York', 1),
  ('Charlotte', 1),
  ('Chicago', 1),
  ('Cedar Rapids', 1),
  ('Sao Paolo', 5),
  ('New Orleans', 1),
  ('Santiago', 9);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines,
  from_city_id INTEGER REFERENCES cities,
  to_city_id INTEGER REFERENCES cities
);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city_id, to_city_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 4),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 6),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 2, 7),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 8),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 9),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 15, 14),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 17),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 16, 18);