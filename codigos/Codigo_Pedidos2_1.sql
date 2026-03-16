create database if not exists pedidos2 collate utf8_spanish_ci;

use pedidos2;

create table if not exists pedido
(refped char(5) primary key,
fecped date not null);

create table if not exists articulo
(CodArt char(5) primary key,
DesArt varchar(30) not null,
PVPArt float(6,2) unsigned not null);

create table if not exists lineaPedido
(RefPed char(5),
CodArt char(5),
CantArt int(4) unsigned not null default 1,
index (RefPed),
foreign key (RefPed) references pedido(refPed) on update cascade,
index (CodArt),
foreign key (CodArt) references articulo(CodArt) on update cascade,
primary key (RefPed, CodArt));

INSERT INTO pedido VALUES ('P0001', '2014-02-16');
INSERT INTO pedido VALUES ('P0002', '2014-02-18');
INSERT INTO pedido VALUES ('P0003', '2014-02-23');
INSERT INTO pedido VALUES ('P0004', '2014-02-25');

INSERT INTO articulo VALUES ('A0043', 'Bolígrafo azul', 0.78);
INSERT INTO articulo VALUES ('A0078', 'Bolígrafo rojo normal', 1.05);
INSERT INTO articulo VALUES ('A0075', 'Lápiz 2B', 0.55);
INSERT INTO articulo VALUES ('A0012', 'Goma de borrar', 0.15);
INSERT INTO articulo VALUES ('A0089', 'Sacapuntas', 0.25);

INSERT INTO lineaPedido VALUES ('P0001', 'A0043', 10);
INSERT INTO lineaPedido VALUES ('P0001', 'A0078', 12);
INSERT INTO lineaPedido VALUES ('P0002', 'A0043', 5);
INSERT INTO lineaPedido VALUES ('P0003', 'A0075', 20);
INSERT INTO lineaPedido VALUES ('P0004', 'A0012', 15);
INSERT INTO lineaPedido VALUES ('P0004', 'A0043', 5);
 





SELECT * FROM pedido;

SELECT * FROM articulo;

SELECT * FROM lineaPedido;

SELECT * 
FROM articulo, lineaPedido
WHERE articulo.CodArt=lineaPedido.CodArt;

SELECT distinct DesArt,  SUM(CantArt)
FROM articulo join lineaPedido
ON (articulo.CodArt=lineaPedido.CodArt)
GROUP BY DesArt;

SELECT * 
FROM articulo left join lineaPedido
ON (articulo.CodArt=lineaPedido.CodArt);

SELECT * 
FROM articulo right join lineaPedido
ON (articulo.CodArt=lineaPedido.CodArt);



SELECT articulo.CodArt, DesArt
FROM articulo left join lineaPedido
ON (articulo.CodArt=lineaPedido.CodArt)
WHERE RefPed IS NULL;

SELECT * FROM articulo WHERE CodArt IN ('A0043','A0012');

SELECT * FROM articulo WHERE CodArt NOT IN (SELECT distinct CodArt FROM lineaPedido);

