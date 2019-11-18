DROP DATABASE IF EXISTS CAR_RENTAL_GATEWAY;
CREATE DATABASE CAR_RENTAL_GATEWAY;
USE CAR_RENTAL_GATEWAY;

CREATE TABLE DISTRIBUTOR (
	distributor_id INT(6) AUTO_INCREMENT PRIMARY KEY,
    distributor_name VARCHAR(30),
	distributor_type VARCHAR(30)
);

INSERT INTO DISTRIBUTOR (distributor_name, distributor_type)
VALUES ("Ryanair","airline");
INSERT INTO DISTRIBUTOR (distributor_name, distributor_type)
VALUES ("Expedia","car");

CREATE TABLE BOOKING (
    booking_id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    distributor_id INT(6),
    booking_name VARCHAR(30),
    location VARCHAR(100)
);
INSERT INTO BOOKING (distributor_id, booking_name, location)
VALUES (1, "car rental A", "Tartu");
INSERT INTO BOOKING (distributor_id, booking_name, location)
VALUES (1, "car rental C", "Parnu");
INSERT INTO BOOKING (distributor_id, booking_name, location)
VALUES (2, "car rental B", "Tallinn");

CREATE VIEW RyanairBooking AS
SELECT * FROM BOOKING WHERE distributor_id = 1;
CREATE VIEW ExpediaBooking AS
SELECT * FROM BOOKING WHERE distributor_id = 2;

DROP DATABASE IF EXISTS USA_CUSTOMER;
CREATE DATABASE USA_CUSTOMER;
USE USA_CUSTOMER;

CREATE TABLE USER (
    user_id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(30) NOT NULL,
    home_address VARCHAR(30),
    email_address VARCHAR(50),
    date_of_birth TIMESTAMP,
    telephone_number VARCHAR(10)
);

INSERT INTO USER (full_name, home_address, email_address, date_of_birth, telephone_number)
VALUES (
    "Brandon Autrey", 
    "Raatuse 22, Tartu, Estonia", 
    "brandon.autrey@gmail.com", 
    CURRENT_TIME(), 
    "55778812"
);

INSERT INTO USER (full_name, home_address, email_address, date_of_birth, telephone_number)
VALUES (
    "John Doe", 
    "Raatuse 22 Tartu, Estonia", 
    "john.doe@gmail.com", 
    CURRENT_TIME(), 
    "72947482"
);