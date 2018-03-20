DROP DATABASE IF EXISTS Ejercicio2;
CREATE DATABASE Ejercicio2;
USE Ejercicio2;
CREATE TABLE ACTORES (
	código INT UNSIGNED AUTO_INCREMENT, 
	nombre VARCHAR(20), 
	fecha DATE, 
	nacionalidad VARCHAR(20),  
	CONSTRAINT PK_ACTORES PRIMARY KEY (código)
);

CREATE TABLE PERSONAJES (
	código INT(2) UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(20),
	raza VARCHAR(20),
	grado INT(2) UNSIGNED,
	código_ACTORES INT(2) UNSIGNED,
	códigoSuperior_Personajes INT,
	CONSTRAINT PK_PERSONAJES PRIMARY KEY (código, códigoSuperior_Personajes),
	CONSTRAINT FK_ACTORES FOREIGN KEY (código_ACTORES) REFERENCES ACTORES (código)
);

CREATE TABLE PLANETAS (
	código INT(2) UNSIGNED AUTO_INCREMENT,
	galaxia VARCHAR(20),
	nombre VARCHAR(20),
	CONSTRAINT PK_PLANETAS PRIMARY KEY (código)
);
	
CREATE TABLE PELICULAS (
	código INT(2) UNSIGNED AUTO_INCREMENT,
	título VARCHAR(50),
	director VARCHAR(50),
	año YEAR,
	CONSTRAINT PK_PELICULAS PRIMARY KEY (código)
);

CREATE TABLE PERSONAJESPELICULAS (
	código_PERSONAJES INT(2) UNSIGNED,
	código_PELICULAS INT(2) UNSIGNED, 
	CONSTRAINT FK_PERSONAJES FOREIGN KEY (código_PERSONAJES) REFERENCES PERSONAJES (código),
	CONSTRAINT FK_PELICULAS FOREIGN KEY (código_PELICULAS) REFERENCES PELICULAS (código)
);

CREATE TABLE NAVES (
	código INT(2) UNSIGNED AUTO_INCREMENT,
	nºtripulantes INT(2),
	nombre VARCHAR(20),
	CONSTRAINT PK_NAVES PRIMARY KEY (código)
);

CREATE TABLE VISITAS (
	código_NAVES INT(2) UNSIGNED,
	código_PLANETAS INT(2) UNSIGNED,
	código_PELICULAS INT(2) UNSIGNED,
	CONSTRAINT FK_NAVES FOREIGN KEY (código_NAVES) REFERENCES NAVES (código),
	CONSTRAINT FK_PLANETAS FOREIGN KEY (código_PLANETAS) REFERENCES PLANETAS (código),
	CONSTRAINT FK_PELICULAS2 FOREIGN KEY (código_PELICULAS) REFERENCES PELICULAS (código)
);

INSERT INTO ACTORES (nombre, fecha, nacionalidad) VALUES 
	('Ewan McGregor', '1971/03/31', 'Escocés'),
	('Harrison Ford', '1942/07/13', 'Estadounidense'),
	('Carrie Fisher', '1956/10/21', 'Estadounidense'),
	('Mark Hamill', '1951/09/25', 'Estadounidense'),
	('John Boyega', '1992/03/17', 'Nigeriano'),
	('Daisy Ridley', '1992/04/10', 'Británica');


INSERT INTO PERSONAJES (nombre, raza, grado, código_ACTORES, códigoSuperior_Personajes) VALUES 
	('Obi-Wan Kenobi', 'humano', '1', '1', '2'),
	('Han Solo', 'humano', '1', '2', '4'),
	('Leia Organa', 'humano', '1', '3', '3'),
	('Luke Skywalker', 'humano', '1', '4', '1'),
	('Finn', 'humano', '1', '5', '6'),
	('Rey', 'humano', '1', '6', '5');

INSERT INTO PLANETAS (galaxia, nombre) VALUES 
	('Arkanis', 'Tatooine'),
	('Chommell', 'Naboo'),
	('Mandalore', 'Mandalore'),
	('Coruscant', 'Coruscant'),
	('Alderaan', 'Alderaan'),
	('Altravis', 'Mustafar');

INSERT INTO PELICULAS (título, director, año) VALUES 
	('Episodio IV - Una nueva esperanza', 'George Lucas', '1977'),
	('Episodio V - El Imperio contraataca', 'Irvin Kershner', '1980'),
	('Episodio VI - El retorno del Jedi', 'Richard Marquand', '1983'),
	('Episodio I - La amenaza fantasma', 'George Lucas', '1999'),
	('Episodio II - El ataque de los clones', 'George Lucas', '2002'),
	('Episodio III - La venganza de los Sith', 'George Lucas', '2005');

INSERT INTO PERSONAJESPELICULAS (código_PERSONAJES, código_PELICULAS) VALUES 
	('1', '3'),
	('2', '1'),
	('3', '6'),
	('4', '4'),
	('5', '2'),
	('6', '5');

INSERT INTO NAVES (nºtripulantes, nombre) VALUES 
	('6', 'UT-60D'),
	('37', 'Tantive IV'),
	('22', 'Delta-7B'),
	('3', 'Slave 1'),
	('16', 'Sombra Furtiva'),
	('1', 'caza TIE');
	
INSERT INTO VISITAS (código_NAVES, código_PLANETAS, código_PELICULAS) VALUES 
	('1', '3', '2'),
	('2', '2', '1'),
	('3', '6', '5'),
	('4', '1', '6'),
	('5', '4', '3'),
	('6', '5', '4');	
		
