INSERT INTO alumnes
	VALUES
	(4758, 'Josep', 555666555, '2004-11-14'),
	(4759, 'Maria', 123123123, '2004-11-14'),
	(4860, 'Raül', 567567567, '2002-02-28'),
	(5061, 'Ariadna', 543543543, '1992-01-17'),
	(6258, 'Jesús', 156156156, '2005-12-25');

INSERT INTO professors (NIF_P, Nom, Telefon, Especialitat)
	VALUES
	('12312312A', 'Edu', 666555444, 'Programació'),
	('45645645S', 'Marta', 444333222, 'Bases de Dades'),
	('98798798T', 'Claudio', 159159159, 'Ciberseguretat'),
	('36536536U', 'Eva', 999888999, 'Ciberseguretat'),
	('87987987M', 'David', 123456789, 'Programació');

INSERT INTO assignatures (Nom, ID_Professor)
	VALUES
	('C++', 1),
	('SQL', 2),
	('Xarxes', 3),
	('Criptografia', 4),
	('Python', 3);

INSERT INTO matriculacions (MatriculaAlumne, CodiAssignatura, AnyAcademic)
	VALUES (4759, 4, 20242025),
	(4860, 4, 20232024),
	(5061, 3, 20202021),
	(5061, 2, 20202021),
	(6258, 4, 20212022);
