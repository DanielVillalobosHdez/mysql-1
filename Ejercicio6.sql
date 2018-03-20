DROP DATABASE IF EXISTS Ejercicio6;
CREATE DATABASE Ejercicio6;
USE Ejercicio6;
CREATE TABLE ZOO (
	nombre VARCHAR (40), 
	ciudad VARCHAR(20), 
	pais VARCHAR(50), 
	tamaño ENUM (
		'Categoria A',
		'Categoria B'), 
	presupuesto INT, 
	CONSTRAINT PK_ZOO PRIMARY KEY (nombre)
);
CREATE TABLE ESPECIE (
	nomcientifico VARCHAR (20), 
	nomvulgar VARCHAR (20) NOT NULL, 
	familia VARCHAR (20), 
	peligro ENUM (
			'Alto',
			'Bajo'), 
	CONSTRAINT PK_ESPECIE PRIMARY KEY (nomcientifico)
);
CREATE TABLE ANIMAL (
	ID INT UNSIGNED,
	nomzoo VARCHAR (40), 
	nomespecie VARCHAR (20), 
	sexo ENUM (
		'Masculino',
		'Femenino'), 
	añonacim YEAR, 
	pais VARCHAR (20),
	continente VARCHAR (20),
	CONSTRAINT PK_ANIMAL PRIMARY KEY (ID),
	CONSTRAINT FK_ZOO FOREIGN KEY (nomzoo) REFERENCES ZOO (nombre),
	CONSTRAINT FK_ESPECIE FOREIGN KEY (nomespecie) REFERENCES ESPECIE (nomcientifico)
);

/* APARTADO B */
ALTER TABLE ANIMAL MODIFY ID INT AUTO_INCREMENT;
ALTER TABLE ANIMAL DROP FOREIGN KEY FK_ZOO;
ALTER TABLE ANIMAL ADD CONSTRAINT FK_ZOO FOREIGN KEY (nomzoo) REFERENCES ZOO(nombre) ON DELETE SET NULL ON UPDATE CASCADE; 

/* APARTADO C */
INSERT INTO ZOO VALUES
	('Zoo Madrid', 'Madrid', 'España', 'Categoría A', 608.42);
INSERT INTO ESPECIE VALUES
	('Panthera tigris', 'Tigre', 'Felinos', 'Alto');
INSERT INTO ANIMAL (nomzoo, nomespecie, sexo, añonacim, pais, continente) VALUES
	('Zoo Madrid', 'Panthera tigris', 'Masculino', '2013', 'India', 'Asia');

/* APARTADO D */
UPDATE ZOO SET nombre='Zoo Madrid - Vodafone' WHERE nombre='Zoo Madrid';
	
	
	
	
	
	
	
	
	
	 	

	


