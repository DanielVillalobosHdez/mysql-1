DROP DATABASE IF EXISTS ejem1;
CREATE DATABASE ejem1;
USE ejem1;
CREATE TABLE persona (nombre VARCHAR(20), apellido1 VARCHAR(20), apellido2 VARCHAR(20), edad TINYINT UNSIGNED, fecha_de_nacimiento DATE, PRIMARY KEY (nombre, apellido1, apellido2));
CREATE TABLE producto (id INT AUTO_INCREMENT, nombre VARCHAR (20) UNIQUE, descripcion TEXT, imagen_produc VARCHAR (30), precio FLOAT NOT NULL, PRIMARY KEY (id));
CREATE TABLE pedidos (nombre_persona VARCHAR (20), apellido1_persona VARCHAR (20), apellido2_persona VARCHAR (20), id_producto INT, cantidad INT, FOREIGN KEY (nombre_persona, apellido1_persona, apellido2_persona) REFERENCES persona (nombre, apellido1, apellido2), FOREIGN KEY (id_producto) REFERENCES producto (id));
ALTER TABLE persona ADD COLUMN dni CHAR(9) FIRST;
/*ALTER TABLE persona MODIFY DNI CHAR(9) FIRST;*/
ALTER TABLE persona ADD COLUMN sexo ENUM('H', 'M');
ALTER TABLE pedidos DROP FOREIGN KEY pedidos_ibfk_1; /*No hace falta poner nombre(pedidos_infk_1)*/
ALTER TABLE pedidos DROP FOREIGN KEY pedidos_ibfk_2;
ALTER TABLE persona DROP PRIMARY KEY;
ALTER TABLE persona ADD CONSTRAINT PK_persona PRIMARY KEY (dni);
ALTER TABLE pedidos ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
/*INSERT INTO `persona` VALUES ('09068484K','Cristian','Lérida','Sánchez',19,'1999-01-21','M'),('09068484K','Cristian','Lérida','Sánchez',19,'1999-01-21','H');
*/
UPDATE parent SET ID=1 WHERE ID=2;

/*CHAR: PARA DNI, TELEFONOS...(SI PONES 9, ES 9 SI O SI)*/


diferencia de enum y set,



