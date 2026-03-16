USE pedidos2;

SELECT * FROM articulo;

SELECT * FROM lineaPedido;

SELECT * FROM pedido;

#¿Cuantos artículos vende?

SELECT SUM(CantArt) FROM lineaPedido;

#¿Cuantos artículos vende por categoria?

SELECT DesArt,SUM(CantArt) FROM articulo 
JOIN lineaPedido ON (articulo.CodArt=lineaPedido.CodArt)
GROUP BY DesArt

#¿Cual es el precio medio?
SELECT AVG(PVPArt), SUM(PVPArt), COUNT(DesArt), SUM(PVPArt)/COUNT(DesArt) FROM articulo;

SELECT AVG(PVPArt) FROM articulo;


SELECT DesArt, AVG(PVPArt),PVPArt  from articulo
 GROUP BY DesArt;
 
 #¿Cual es el articulo más caro?
 

 
 SELECT MAX(PVPArt) FROM articulo;
 
 SELECT DesArt, PVPArt FROM articulo WHERE PVPArt IN (SELECT MAX(PVPArt) FROM articulo)
 
  #¿Cual es el articulo menos caro?
   SELECT MIN(PVPArt) FROM articulo;
   
SELECT DesArt FROM articulo WHERE PVPArt IN (SELECT MIN(PVPArt) FROM articulo);

#¿Cuantos articulos hay en la BBDD?

SELECT COUNT(*) from articulo;
#¿Cual es la fecha de pedido mas reciente?

SELECT MAX(fecped) FROM pedido;

#¿Cuantos articulos diferentes hay en el pedido P0004? 2
SELECT COUNT(*) FROM lineaPedido WHERE RefPed LIKE 'P0004';

#¿Cual es el importe total del pedido P0001?
SELECT SUM(CantArt*PVPArt) FROM lineaPedido JOIN articulo ON (lineaPedido.CodArt=articulo.CodArt) WHERE RefPed LIKE 'P0001'

#¿Cual es el numero medio de articulos por pedido?

SELECT AVG(media.Cant) FROM (
	SELECT SUM(CantArt) Cant 
	from lineaPedido
	GROUP BY RefPed
	) AS media;

SELECT (22+5+20+20)/4 FROM DUAL; 16.75
SELECT (10+12+5+20+15+5)/6 FROM DUAL;

#¿Cuantos articulos distintos se han pedido?

SELECT COUNT(DISTINCT CodArt) NumArt FROM lineaPedido

#¿Cauntos articulos tiene cada pedido?
SELECT RefPed,COUNT(*) FROM lineaPedido
GROUP BY RefPed

SELECT RefPed,COUNT(CodArt) FROM lineaPedido
GROUP BY RefPed


#Mostrar solo los pedidos que tienen mas de un articulo
SELECT RefPed,COUNT(CodArt) FROM lineaPedido
GROUP BY RefPed
HAVING COUNT(CodArt)>1

#Mostrar la referencia del pedido, fecha, numero de articulos, importe total de los pedidos realizados despues del 2014-02-19 con mas de un articulo.

SELECT ped.RefPed, fecped, COUNT(articulo.CodArt), SUM(PVPArt*CantArt)
FROM lineaPedido INNER JOIN (SELECT * from pedido WHERE fecped>'2014-02-19') AS ped INNER JOIN articulo
ON (lineaPedido.CodArt=articulo.CodArt AND lineaPedido.refped=ped.refped)
GROUP BY ped.RefPed, fecped
HAVING COUNT(articulo.CodArt)>1

#Articulos con precio superior a la media
SELECT * FROM articulo WHERE PVPArt> (SELECT AVG(PVPArt) FROM articulo)

SELECT SUM(PVPArt)/COUNT(PVPArt) FROM articulo

SELECT AVG(PVPArt) FROM articulo #0,556

SELECT * FROM articulo WHERE PVPArt> (SELECT AVG(PVPArt) FROM articulo)

#Mostrar los articulos pedidos en P0001 o P0002

SELECT DISTINCT articulo.CodArt, DesArt, PVPArt FROM lineaPedido INNER JOIN articulo ON (lineaPedido.CodArt=articulo.CodArt) WHERE RefPed IN ('P0001','P0002')

SELECT * FROM articulo WHERE CodArt IN (SELECT CodArt FROM lineaPedido WHERE RefPed ='P0001'OR RefPed ='P0002') 

SELECT * FROM articulo WHERE CodArt IN ('A0043','A0078') 

SELECT * FROM articulo WHERE CodArt LIKE 'A0043' OR CodArt LIKE 'A0078'

#Articulos que se han vendido

SELECT * FROM articulo


SELECT * FROM lineaPedido

SELECT * FROM articulo WHERE CodArt in  (SELECT CodArt FROM lineaPedido)

SELECT * FROM articulo WHERE exists  (SELECT * FROM lineaPedido WHERE articulo.CodArt=lineaPedido.CodArt)

CREATE TABLE articulo2 AS SELECT * FROM articulo

SELECT * FROM articulo2

SELECT * FROM articulo2
UNION ALL (SELECT * FROM articulo)


SELECT * FROM articulo2
UNION  (SELECT * FROM articulo)

SELECT * FROM articulo2
INTERSECt  (SELECT * FROM articulo)

SELECT * FROM articulo2
EXCEPT (SELECT * FROM articulo)

SELECT * FROM articulo

SELECT * FROM articulo WHERE DesArt LIKE 'B%'
EXCEPT (SELECT * FROM articulo WHERE DesArt LIKE '%azul')


SELECT * FROM articulo WHERE DesArt LIKE '_o%'
INTERSECT (SELECT * FROM articulo WHERE DesArt LIKE '%l')


/* Halla la media de la de lo cantidad de pedidos*/
SELECT AVG(Cant) FROM ( 
	SELECT SUM(CantArt) AS Cant
   FROM lineaPedido
   GROUP BY RefPed) AS media;


