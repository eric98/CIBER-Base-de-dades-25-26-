CREATE DATABASE escola;
USE escola;

-- Comprovació:
SHOW DATABASES;

CREATE TABLE alumnes(
	NumMatricula SMALLINT UNSIGNED,
	Nom VARCHAR(20) NOT NULL,
	Telefon INT UNSIGNED,
	DataNaixement DATE NOT NULL,
	CONSTRAINT alumnes_pk PRIMARY KEY(NumMatricula)
);

-- Comprovació:
DESCRIBE alumnes;

CREATE TABLE professors(
	-- AUTO_INCREMENT: 1r registre ID_P=1, 2n registre ID_P=2, ... 'n' registre ID_P=n
	ID_P INT UNSIGNED AUTO_INCREMENT,
	NIF_P CHAR(9),
	Nom VARCHAR(20),
	Telefon INT UNSIGNED,
	Especialitat ENUM('Programació','Ciberseguretat','Bases de dades'),
	CONSTRAINT professors_pk PRIMARY KEY(ID_P),
	CONSTRAINT professors_unique UNIQUE(NIF_P)
);

-- Comprovació:
DESCRIBE professors;

CREATE TABLE assignatures(
	Codi INT UNSIGNED AUTO_INCREMENT,
	Nom VARCHAR(20),
	ID_Professor INT UNSIGNED NOT NULL, -- Atribut obligatori perquè prové d'una participació (1,1)
	CONSTRAINT assignatures_pk PRIMARY KEY(Codi),
	CONSTRAINT assignatures_fk_professors FOREIGN KEY(ID_Professor) REFERENCES professors(ID_P)
);

-- Comprovació:
DESCRIBE assignatures;

CREATE TABLE matriculacions(
	-- Optimització: Afegim ID com a clau primària en comptes de (MatriculaAlumne, CodiAssignatura)
	ID INT UNSIGNED AUTO_INCREMENT,
	MatriculaAlumne SMALLINT UNSIGNED NOT NULL,
	CodiAssignatura INT UNSIGNED NOT NULL,
	-- Els 4 primers dìgits són l'any d'inici de curs,
	-- els últims 4 dígits són l'any de final de curs (ex: 20252026, 20302031)
	AnyAcademic INT UNSIGNED, 
	CONSTRAINT matriculacions_fk_alumnes FOREIGN KEY(MatriculaAlumne) REFERENCES alumnes(NumMatricula),
	CONSTRAINT matriculacions_fk_assignatures FOREIGN KEY(CodiAssignatura) REFERENCES assignatures(Codi),
	CONSTRAINT matriculacions_pk PRIMARY KEY(id)
);

-- Comprovació:
DESCRIBE matriculacions;
