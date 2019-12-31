--el siguiente ejemplo ilustra la proteccion ya que, en la tabla place la llave 10 es pk y ya existe. 


--insertar valores con llaves foraneas que no existen; en este caso el atributo con numero 12 no existe en la tabla place
INSERT INTO musician VALUES(24,'Alejandra Perez',TO_DATE(' 1958/05/12','YYYY/MM/DD'),NULL,6,12);

-- una llave pk no puede ser NULL, en el caso de musician el primer atributo es la llave pk  
INSERT INTO musician VALUES(NULL,'Alejandra Perez',TO_DATE(' 1958/05/12','YYYY/MM/DD'),NULL,6,12);

-- una llave unica ya definida no  se puede repetir, en nuestro caso el nombre de la composicion no se debe repetir, last song ya se encuentra creada en la base de datos
INSERT INTO composition VALUES(21,TO_DATE('1990/07/12','YYYY/MM/DD'),'A Last Song',6);
