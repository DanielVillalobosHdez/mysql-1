DROP DATABASE IF EXISTS ejem1;
CREATE DATABASE ejem1;
USE ejem1;
CREATE TABLE persona (nombre VARCHAR(20), apellido1 VARCHAR(20), apellido2 VARCHAR(20), edad TINYINT UNSIGNED, fecha_de_nacimiento DATE, PRIMARY KEY (nombre, apellido1, apellido2));
CREATE TABLE producto (ID INT AUTO_INCREMENT, nombre VARCHAR(20) UNIQUE, descripcion TEXT, imagen VARCHAR(30), precio FLOAT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE pedidos (nombre_persona VARCHAR(20), apellido1_persona VARCHAR(20), apellido2_persona VARCHAR(20), ID_producto INT, cantidad INT, FOREIGN KEY (nombre_persona, apellido1_persona, apellido2_persona) REFERENCES persona (nombre,apellido1,apellido2), FOREIGN KEY (ID_producto) REFERENCES producto (ID));
