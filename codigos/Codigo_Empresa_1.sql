create database empresa collate utf8_spanish_ci;

use empresa;

Create table depart
(dept_no int(3) unsigned primary key,
dnombre varchar(40) unique not null,
loc varchar(40) not null);

create table emple

(emp_no int(4) unsigned primary key,

apellido varchar(40) not null,

oficio enum ('empleADO','VENDEDOR','DIRECTOR','ANALISTA','PROGRAMADOR','PRESIDENTE') not null,

dir int(4) unsigned,

fecha_alt date not null,

salario float(7,2) unsigned not null,

comision float(7,2) unsigned,

dept_no int(3) unsigned default 10 not null,

index (dir),

foreign key(dir) references emple(emp_no) on update cascade,

index(dept_no),

foreign key(dept_no) references depart(dept_no) on update cascade);
 
INSERT INTO depart VALUES (10, 'CONTABILIDAD', 'SEVILLA');
INSERT INTO depart VALUES (20, 'INVESTIGACIÓN', 'MADRID');
INSERT INTO depart VALUES (30, 'VENTAS', 'BARCELONA');

INSERT INTO emple VALUES (7839, 'REY', 'PRESIDENTE', NULL, '2010/11/17', 3900, 0, 10);
INSERT INTO emple VALUES (7698, 'NEGRO', 'DIRECTOR', 7839, '2010/05/01', 2200, 0, 30);
INSERT INTO emple VALUES (7738, 'CEREZO', 'DIRECTOR', 7839, '2010/09/06', 2210, 0, 10);
INSERT INTO emple VALUES (7566, 'JIMÉNEZ', 'DIRECTOR', 7839, '2010/02/04', 2300, 0, 20);
INSERT INTO emple VALUES (7499, 'ARROYO', 'VENDEDOR', 7698, '2009/02/20', 1200, 240, 30);
INSERT INTO emple VALUES (7521, 'SALA', 'VENDEDOR', 7698, '2010/02/22', 960, 390, 30);
INSERT INTO emple VALUES (7654, 'MARTÍN', 'VENDEDOR', 7698, '2010/09/29', 965, 1000, 30);
INSERT INTO emple VALUES (7844, 'TOVAR', 'VENDEDOR', 7698, '2010/09/08', 1100, 0, 30);
INSERT INTO emple VALUES (7900, 'JIMENO', 'empleADO', 7698, '2010/12/03', 725, 0, 30);
INSERT INTO emple VALUES (7369, 'SÁNCHEZ', 'empleADO', 7900, '2012/12/12', 600, 0, 20);
INSERT INTO emple VALUES (7788, 'GIL', 'ANALISTA', 7566, '2013/04/23', 2350, 0, 20);
INSERT INTO emple VALUES (7876, 'ALONSO', 'empleADO', 7788, '2013/08/09', 860, 0, 20);

COMMIT;
