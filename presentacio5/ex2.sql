-- Exercici2. Crea les taules anteriors amb les opcions CASCADE i comprova el resultat a MySQL.
-- Creem la taula clients i pagaments_pendents
CREATE TABLE clients (
	dni CHAR(9) PRIMARY KEY,
	nom VARCHAR(50),
	direccio VARCHAR(50)
);

CREATE TABLE pagaments_pendents (
	codi INTEGER PRIMARY KEY AUTO_INCREMENT,
	dni CHAR(9),
	import DOUBLE,
	FOREIGN KEY (dni) REFERENCES clients(dni)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Inserim un client i dos pagaments pendents
INSERT INTO clients VALUES ('55667788G','Pikachu','C\ Pueblo paleta, 22'); 
INSERT INTO pagaments_pendents (dni, import) VALUES ('55667788G', 467);
INSERT INTO pagaments_pendents (dni, import) VALUES ('55667788G', 56.7);

-- a) Esborrem el client; verifiquem que s’han esborrat en cascada els seus pagaments pendents.
-- Comprovació abans
SELECT * FROM pagaments_pendents;
-- Execució de l'esborrat
DELETE FROM clients WHERE dni='55667788G';
-- Comprovació després
SELECT * FROM pagaments_pendents;

-- b) Tornem a inserir el client i modifiquem el seu dni; verifiquem que s’ha canviat el dni de la taula pagaments_pendents.
INSERT INTO clients VALUES ('55667788G','Pikachu','C\ Pueblo paleta, 22'); 
INSERT INTO pagaments_pendents (dni, import) VALUES ('55667788G', 467);
INSERT INTO pagaments_pendents (dni, import) VALUES ('55667788G', 56.7);

-- Comprovació abans
SELECT * FROM pagaments_pendents;
-- Execució de la modificació
UPDATE clients SET dni='12312312A' WHERE dni='55667788G';
-- Comprovació després
SELECT * FROM pagaments_pendents;
