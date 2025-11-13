CREATE TABLE zoos(
	id INT UNSIGNED AUTO_INCREMENT,
	nom VARCHAR(20),
	ciutat VARCHAR(20),
	pais VARCHAR(20),
	pressupost DECIMAL(7,2),
	grandaria DECIMAL(7,2),
	CONSTRAINT zoos_pk PRIMARY KEY(id),
	CONSTRAINT zoos_ch 
		CHECK(grandaria >= 1000 AND grandaria <= 1000000)
		-- equival a:
		-- CHECK(grandaria BETWEEN 1000 AND 1000000)
);

CREATE TABLE especies(
	id INT UNSIGNED AUTO_INCREMENT,
	nom_vulgar VARCHAR(20),
	nom_cientific VARCHAR(20),
	familia VARCHAR(20),
	en_perill_extincio BOOL,
	CONSTRAINT especies_pk PRIMARY KEY(id)
);

CREATE TABLE animals(
	id INT UNSIGNED AUTO_INCREMENT,
	num_identificacio INT UNSIGNED,
	sexe ENUM('M','F','H'),
	any_naixement YEAR,
	pais_origen VARCHAR(20),
	continent ENUM('AM','EU','AS','AU','AF','AN'),
	id_zoo INT UNSIGNED NOT NULL,
	id_especie INT UNSIGNED NOT NULL,
	CONSTRAINT animals_pk PRIMARY KEY(id),
	CONSTRAINT animals_zoo_fk 
		FOREIGN KEY(id_zoo) REFERENCES zoos(id),
	CONSTRAINT animals_especie_fk 
		FOREIGN KEY(id_especie) REFERENCES especies(id),
 	CONSTRAINT animals_uq UNIQUE(num_identificacio)
);

-- a)
-- Afegim AUTO_INCREMENT a les PK

-- b)
-- Afegim la constraint CHECK
