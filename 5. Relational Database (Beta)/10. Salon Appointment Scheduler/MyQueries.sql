# psql
psql --username=freecodecamp --dbname=postgres
CREATE DATABASE salon;
\c salon
CREATE TABLE customers(customer_id SERIAL PRIMARY KEY, phone VARCHAR(15) UNIQUE, name VARCHAR(25));
CREATE TABLE services(service_id SERIAL PRIMARY KEY, name VARCHAR(25));
CREATE TABLE appointments(appointment_id SERIAL PRIMARY KEY, customer_id INT REFERENCES customers(customer_id), service_id INT REFERENCES services(service_id), time VARCHAR(10));

INSERT INTO services(name) VALUES ('Hair Cutting'), ('Hair Color'), ('Manicure'), ('Skincare'), ('Massage');

# script
PSQL="psql --username=freecodecamp --dbname=salon -c"
echo "$($PSQL "myQuery")"

# export database
pg_dump -cC --inserts -U freecodecamp salon > salon.sql