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
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- Inserim un client i dos pagaments pendents
INSERT INTO clients VALUES ('55667788G','Pikachu','C\ Pueblo paleta, 22'); 
INSERT INTO pagaments_pendents (dni, import) VALUES ('55667788G', 467);
INSERT INTO pagaments_pendents (dni, import) VALUES ('55667788G', 56.7);

-- a) Intentem esborrar el client i no és possible.
DELETE FROM clients WHERE dni='55667788G';

-- b) Intentem modificar el dni del client i no ho permet.
UPDATE clients SET dni='12312312A' WHERE dni='55667788G'; -- NO deixa
UPDATE clients SET nom='Alex' WHERE dni='55667788G'; -- SÍ deixa

-- c) Intentem esborrar la taula clients i tampoc podem.
DROP TABLE clients;
