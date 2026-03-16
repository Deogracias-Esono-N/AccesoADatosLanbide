USE empresa

SELECT oficio, COUNT(*) AS NºEmpleados, 
FROM emple
	GROUP BY oficio
HAVING COUNT(*)> 2

SELECT *
FROM emple
