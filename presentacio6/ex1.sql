CREATE TABLE animals (
	id INT UNSIGNED AUTO_INCREMENT,
	nom VARCHAR(20),
	tipus ENUM('gat','gos'),
	rasa VARCHAR(20),
	pes TINYINT(200),
	color ENUM('gris','blanc','negre'),
	edat TINYINT(100),
	PRIMARY KEY(id)
);

INSERT INTO animals (nom, tipus, rasa, pes, color, edat) 
	VALUES ('Alex', 'gos', 'r1', 10, 'gris', 10),
		('Rodolfo', 'gos', 'r3', 20, 'blanc', 21),
		('Boni', 'gat', 'r3', 30, 'gris', 32),
		('Bugs', 'gos', 'r2', 40, 'negre', 23),
		('Pepa', 'gat', 'r2', 5, 'negre', 1),
		('Marc', 'gat', 'r1', 60, 'gris', 34);
		
-- a) Mostra el nom i la raça de tots els animals.
SELECT nom,rasa FROM animals;

-- b) Mostra el nom i el pes dels animals posant una àlies als camps.
SELECT nom AS 'Nom',pes AS 'Pes' FROM animals;

-- c) Mostra el nom i la data de naixement aproximada dels animals (utilitza la funció DATE_SUB() i NOW() ).
SELECT 
	nom AS 'Nom', 
	YEAR(DATE_SUB(NOW(), INTERVAL edat YEAR))
		AS 'Any de naixement'
	FROM animals;


