CREATE TABLE tab2 (
	col3 INT,
	col4 VARCHAR(10),
	CONSTRAINT PK_tab1 PRIMARY KEY (col3, col4)
);


CREATE TABLE tab1 (
	col1 INT(5),
	col2 CHAR(25) NOT NULL,
	col3_tab2 INT,
	col4_tab2 VARCHAR(10),
	CONSTRAINT PK_tab1 PRIMARY KEY (col1, col2),
	CONSTRAINT FK_tab2 FOREIGN KEY (col3_tab2, col4_tab2) REFERENCES tab2 (col3, col4)
);
