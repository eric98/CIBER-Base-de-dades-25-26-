CREATE DATABASE taller_vehicles;
USE taller_vehicles;

CREATE TABLE mecanics (
	dni CHAR(9),
	nom VARCHAR(20),
	edat INT,
	PRIMARY KEY (dni)
);

CREATE TABLE vehicles (
	-- INT i INTEGER són sinònims
	id INT,
	-- matrícules actuals
	matricula CHAR(7),
	propietari VARCHAR(20),
	marca VARCHAR(20),
	reparat_per CHAR(9),
	PRIMARY KEY (id),
	FOREIGN KEY (reparat_per) REFERENCES mecanics(dni)
);


