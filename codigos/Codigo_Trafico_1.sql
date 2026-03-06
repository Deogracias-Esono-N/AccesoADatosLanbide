CREATE DATABASE IF NOT EXISTS Trafico;
USE Trafico;

CREATE TABLE Vehiculos (
	Matricula char(10) primary key,
   MarcaModelo varchar(50) NOT NULL,
   Impuesto FLOAT(6,2) UNSIGNED DEFAULT 50 NOT NULL CHECK(impuesto > 0)
);

CREATE TABLE Guardia(
	CodGuardia char(5) primary key,
   CodGuardiasJefe CHAR(5),
   Nombre VARCHAR(20) NOT NULL,
   foreign KEY(CodGuardiasJefe) REFERENCES Guardia(CodGuardia)
);

CREATE TABLE Multas(
	NumMulta int(6) primary key,
   CodGuardia CHAR(5) NOT NULL,
	Matricula VARCHAR(10) not null,
   Fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   Lugar VARCHAR(50) NOT NULL,
   Descripcion VARCHAR(50) NOT NULL,
   importe FLOAT(6,2) NOT NULL CHECK(Importe BETWEEN 15 AND 6000), 
   Pagada ENUM('SI', 'NO') NOT NULL, 
   foreign KEY(Matricula) REFERENCES Vehiculos(Matricula) ON DELETE CASCADE,
   foreign KEY(CodGuardia) REFERENCES Guardia(CodGuardia) ON DELETE CASCADE
);
