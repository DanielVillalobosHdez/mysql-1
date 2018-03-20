CREATE TABLE SOCIOS (
	nombre VARCHAR(20) NOT NULL,
	direccion varchar(30),
	numero_telefono VARCHAR(15),
	fecha_inscripcion DATE,
	n_socio INT AUTO_INCREMENT,
	CONSTRAINT PK_SOCIOS PRIMARY KEY (n_socios)
);

CREATE TABLE LIBROS (
	titulo VARCHAR(30),
	autor VARCHAR(20),
	fecha_editado DATE,
	n_libro BIGINT AUTO_INCREMENT,
	CONSTRAINT PK_LIBROS PRIMARY KEY (n_libro)
);

CREATE TABLE PRESTAMOS (
	fecha_retiro DATE,
	fecha_entrega DATE,
	n_socio INT,
	n_libro BIGINT,
	idprestamo BIGINT AUTO_INCREMENT,
	CONSTRAINT PK_PRESTAMOS PRIMARY KEY (idprestamo),
	CONSTRAINT FK_SOCIOS FOREIGN KEY (n_socio) REFERENCES SOCIOS (n_socio),
	CONSTRAINT FK_LIBROS FOREIGN KEY (n_libro) REFERENCES LIBROS (n_libro)
);



