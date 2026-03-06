CREATE DATABASE if not exists Liga;
USE Liga,

CREATE TABLE Jugadores (
	id_jugador char(5) primary key,
   Nombre VARCHAR(20) UNIQUE NOT NULL,
   Fecha_naci DATE NOT NULL,
   Id_equipo CHAR(5) NOT NULL
);

CREATE TABLE Equipos (
	Id_equipo char(5) primary key,
   Nombre VARCHAR(20) UNIQUE NOT NULL,
   Estadio VARCHAR(20) NOT NULL,
   Aforo INT(4) UNSIGNED DEFAULT 2000 NOT NULL,
   Axo_fundacion INT(4) CHECK(Axo_fundacion BETWEEN 1850 AND 2050),
   ciudad VARCHAR(20) NOT NULL,
);


CREATE TABLE Patidos (
	Id_equ_local CHAR(5) primary key,
   Id_equ_visitante CHAR(5) NOT NULL,
   Fecha_partido DATE, NOT NULL
   Goles_equ_local INT(2) UNSIGNED DEFAULT 0 NOT NULL,
   Goles_equ_visitante INT(2) UNSIGNED DEFAULT 0 NOT NULL,
);

CREATE TABLE Goles (
	Id_equ_local char(5),
   Id_equ_visitante char(5),
   Min_gol int(3) CHECK(Id_jugador BETWEEN 0 AND 130),
   Descripcion VARCHAR(50) NOT NULL,
   Id_jugador  INT(5),
   FOREIGN KEY(Id_jugador) REFERENCES Jugadores(Id_jugador),
   FOREIGN KEY(Id_jugador) REFERENCES Jugadores(Id_jugador),
);


