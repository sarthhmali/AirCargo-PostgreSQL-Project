-- ================================
-- DATABASE & TABLE DESIGN (PostgreSQL)
-- ================================

CREATE DATABASE aircargo;
\c aircargo;

-- CUSTOMER TABLE
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- ROUTES TABLE
CREATE TABLE routes (
    route_id INT PRIMARY KEY,
    flight_num INT NOT NULL,
    origin_airport TEXT,
    destination_airport TEXT,
    aircraft_id TEXT,
    distance_miles INT CHECK (distance_miles > 0)
);

-- TICKET DETAILS
CREATE TABLE ticket_details (
    ticket_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id),
    class_id VARCHAR(40),
    brand VARCHAR(40),
    price_per_ticket INT,
    no_of_tickets INT,
    aircraft_id TEXT,
    p_date DATE
);

-- PASSENGERS ON FLIGHTS
CREATE TABLE passengers (
    passenger_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id),
    route_id INT REFERENCES routes(route_id),
    class_id VARCHAR(40),
    travel_date DATE
);