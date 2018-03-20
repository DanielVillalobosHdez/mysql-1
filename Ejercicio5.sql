DROP DATABASE IF EXISTS Ejercicio5;
CREATE DATABASE Ejercicio5;
USE Ejercicio5;
CREATE TABLE PERSONAS (
	ID INT AUTO_INCREMENT, 
	Nombre VARCHAR(20),
	Apellidos VARCHAR(40), 
	FechaDeNacimiento DATE, 
	PrecioPujado DECIMAL(10,2),  
	Ciudad VARCHAR(20),
	CONSTRAINT PK_PERSONAS PRIMARY KEY (ID)
);

CREATE TABLE ORDEN (
	ID INT AUTO_INCREMENT,
	NumeroOrden TINYINT UNSIGNED,
	ID_Personas INT,
	CONSTRAINT PK_ORDEN PRIMARY KEY (ID),
	CONSTRAINT FK_PERSONAS FOREIGN KEY (ID_Personas) REFERENCES PERSONAS (ID) ON UPDATE CASCADE
);


INSERT INTO PERSONAS (Nombre, Apellidos, FechaDeNacimiento, PrecioPujado, Ciudad) VALUES 
	('Ewan', 'McGregor', '1971-03-31', '2350.5', 'Madrid'),
	('Harrison', 'Ford', '1942-07-13', '1569.2', 'Sevilla'),
	('Carrie', 'Fisher', '1956-10-21', '2673.5', 'Valencia'),
	('Mark', 'Hamill', '1951-09-25', '2350.6', 'Murcia'),
	('John', 'Boyega', '1992-03-17', '3000.1', 'Cádiz'),
	('Daisy', 'Ridley', '1992-04-10', '3100.5', 'Barcelona');


INSERT INTO ORDEN (NumeroOrden, ID_PERSONAS) VALUES 
	('1', '2'),
	('2', '4'),
	('3', '3'),
	('4', '1'),
	('5', '6'),
	('6', '5');

UPDATE PERSONAS SET ID=5 WHERE ID=1;
