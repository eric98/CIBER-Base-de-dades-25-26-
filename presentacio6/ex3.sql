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
