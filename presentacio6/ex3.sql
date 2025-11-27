/* Exercici3: Visita la base de dades de l’escola creada durant les últimes 
classes i escriu les instruccions per realitzar les següents consultes. Si per 
a la consulta que es demana no tens cap registre amb la informació 
requerida, prèviament s’haurà d’introduir per a que la consulta pugui 
retornar algun valor.*/

-- a) Extreure el nombre total d'alumnes (comptar-los).
SELECT COUNT(*) FROM alumnes;

-- b) Extreure el nombre total d'alumnes matriculats en l'any acadèmic '2022'.
SELECT COUNT(*) FROM matriculacions 
	WHERE AnyAcademic LIKE '2022%'
	OR AnyAcademic LIKE '%2022';
	-- WHERE AnyAcademic IN (20212022, 20222023);
	
	
-- c) Extreure els ID dels professors amb NIF que comença amb '4'.
SELECT ID_P FROM professors
	WHERE SUBSTRING(NIF_P,1,1) = '4';
	-- WHERE NIF_P LIKE '4%';

-- d) Extreure el nom i telèfon dels professors que tenen telèfon acabat en '9'
SELECT Nom, Telefon FROM professors
	WHERE Telefon LIKE '%9';
	
-- e) Extreure el num_matricula, nom i telefon dels alumnes que han nascut entre el 1995 i el 2005.
SELECT NumMatricula, Nom, Telefon
	FROM alumnes
	WHERE YEAR(DataNaixement) BETWEEN 1995 AND 2005;

-- f) Extreure el nom i el telèfon dels professors que imparteixen alguna assignatura.
SELECT Nom, Telefon FROM professors
	WHERE ID_P IN (
	SELECT ID_Professor FROM assignatures
	);
	
-- Equivaldria a:
-- Pas 1. SELECT ID_Professor FROM assignatures.
--  => Retorna 1,2,3,4,3
-- Pas 2. SELECT Nom,Telefon FROM professors
-- 	WHERE ID_P IN (1,2,3,4,3);
--  => Retorna (Edu,666555444),(Marta,444333222),etc.

-- g) Extreure el nom i any acadèmic de les assignatures en què està matriculat algun alumne.
-- Versió alternativa: Mostrem solament el Nom de l'assignatura
SELECT Nom FROM assignatures
	WHERE Codi IN (
	SELECT CodiAssignatura FROM matriculacions
	);
	
-- Versió completa: Mostrem el Nom de l'assignatura i l'AnyAcademic
-- == Versió sense JOIN (SQL1)
-- Pas 1. SELECT * FROM matriculacions,assignatures;
--  => Mostra la combinació de les dues taules.

-- Pas 2. SELECT * FROM matriculacions,assignatures WHERE matriculacions.CodiAssignatura = assignatures.Codi;
--  => Mostra els registres amb valors coincidents amb CodiAssignatura i Codi. 

-- Pas n. [TODO]

-- == versió amb JOIN (SQL2)
-- Pas 1. Mostra la combinació de les dues taules.
SELECT * FROM matriculacions,assignatures; 

-- Pas 2. Mostrem els registres amb valors coincidents amb CodiAssignatura i Codi.
SELECT * FROM matriculacions INNER JOIN assignatures ON matriculacions.CodiAssignatura = assignatures.Codi; 

-- Pas 3. Afegim les columnes que volem consultar
SELECT assignatures.Nom, matriculacions.AnyAcademic FROM matriculacions
	INNER JOIN assignatures
	ON matriculacions.CodiAssignatura = assignatures.Codi;
	
-- Pas 4. Afegim alies a les taules
SELECT a.Nom, m.AnyAcademic
	FROM matriculacions AS m
	INNER JOIN assignatures AS a
	ON m.CodiAssignatura = a.Codi;

-- h) Extreure el nom de cada assignatura i nombre total d'alumnes que estan matriculats en cadascuna.

-- Recordem el Pas 2 de la g):
SELECT * FROM matriculacions INNER JOIN assignatures ON matriculacions.CodiAssignatura = assignatures.Codi; 

-- Com que els valors de assignatures.Nom es repeteixen, podem veure quants de registres hi ha per cada assignatures.Nom, és a dir, quants d'alumnes hi ha matriculats en cada assignatura.
SELECT COUNT(*), assignatures.Nom FROM matriculacions 
	INNER JOIN assignatures
	ON matriculacions.CodiAssignatura = assignatures.Codi
	GROUP BY assignatures.Nom; 
	
-- Apliquem alguns alies, per fer el codi més clar
SELECT a.Nom AS 'Nom assignatura',
	COUNT(*) AS 'Quantitat d\'alumnes'
	FROM matriculacions AS m
	INNER JOIN assignatures AS a
	ON m.CodiAssignatura = a.Codi
	GROUP BY a.Nom;
