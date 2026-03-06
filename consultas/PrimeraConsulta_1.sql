USE empresa

SELECT *  -- columnas 
FROM emple -- tablas
WHERE dept_no = 10 -- filtra las filas
ORDER BY apellido DESC -- ordenamiento

SELECT apellido, fecha_alt, salario
FROM emple
WHERE dept_no=20 AND oficio='ANALISTA'

SELECT dept_no, dnombre
FROM depart

SELECT emp_no, apellido, oficio
FROM emple
WHERE apellido LIKE 'J%'

SELECT * 
FROM emple
WHERE apellido LIKE '_E%' OR apellido LIKE '_e%';

SELECT apellido, oficio -- columnas 
FROM emple -- tablas
WHERE oficio IN ('EMPLEADO', 'VENDEDOR', 'ANALISTA') -- filtra las filas
ORDER BY apellido ASC -- ordenamiento

SELECT *
FROM emple
WHERE salario>2000 OR comision>300

SELECT *
FROM emple
WHERE salario>2000 AND comision>300

SELECT apellido, oficio, salario, comision, dnombre, loc  -- columnas 
FROM emple INNER JOIN depart-- tablas
ON (emple.dept_no=depart.dept_no) -- forma de union PK
WHERE salario>2000 -- filtra las filas

SELECT apellido,  salario, comision, dnombre, comision*100/salario AS PercentCommision
FROM emple INNER JOIN depart 
ON (emple.dept_no=depart.dept_no)
WHERE comision>0

