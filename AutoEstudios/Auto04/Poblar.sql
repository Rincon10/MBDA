-------------------------------PoblarOK ( Adicionar información a la tabla )-------------------------------
---Se crearon plantillas para hacer el poblado de las tablas---

---Poblar la base de datos con los datos iniciales ---

-------------------------------valores place -------------------------------

INSERT INTO place VALUES(1,'Manchester','England');
INSERT INTO place VALUES(2,'Edinburgh','Scotland');
INSERT INTO place VALUES(3,'Salzburg','Austria');
INSERT INTO place VALUES(4,'New York','USA');
INSERT INTO place VALUES(5,'Birmingham','England');
INSERT INTO place VALUES(6,'Glasgow','Scotland');
INSERT INTO place VALUES(7,'London','England');
INSERT INTO place VALUES(8,'Chicago','USA');
INSERT INTO place VALUES(9,'Amsterdam','Netherlands');

-------------------------------valores musician -------------------------------

INSERT INTO musician VALUES(1,'Fred Bloggs',TO_DATE('1948/01/02','YYYY/MM/DD'), NULL,1,2);
INSERT INTO musician VALUES(2,'John Smith',TO_DATE('1950/03/03','YYYY/MM/DD'),NULL,3,4);
INSERT INTO musician VALUES(3,'Helen Smyth',TO_DATE('1948/08/08','YYYY/MM/DD'),NULL,4,5);
INSERT INTO musician VALUES(4,'Harriet Smithson',TO_DATE('1909/05/09','YYYY/MM/DD'),TO_DATE('1980/09/20','YYYY/MM/DD'),5,6);
INSERT INTO musician VALUES(5,'James First',TO_DATE('1965/06/10','YYYY/MM/DD'),NULL,7,7);
INSERT INTO musician VALUES(6,'Theo Mengel',TO_DATE('1948/08/12','YYYY/MM/DD'),NULL,7,1);
INSERT INTO musician VALUES(7,'Sue Little',TO_DATE('1945/02/21','YYYY/MM/DD'),NULL,8,9);
INSERT INTO musician VALUES(8,'Harry Forte',TO_DATE('1951/02/28','YYYY/MM/DD'),NULL,1,8);
INSERT INTO musician VALUES(9,'Phil Hot',TO_DATE('1942/06/30','YYYY/MM/DD'),NULL,2,7);
INSERT INTO musician VALUES(10,'Jeff Dawn',TO_DATE('1945/12/12','YYYY/MM/DD'),NULL,3,6);
INSERT INTO musician VALUES(11,'Rose Spring',TO_DATE('1948/05/25','YYYY/MM/DD'),NULL,4,5);
INSERT INTO musician VALUES(12,'Davis Heavan',TO_DATE('1975/10/03','YYYY/MM/DD'),NULL,5,4);
INSERT INTO musician VALUES(13,'Lovely Time',TO_DATE('1948/12/28','YYYY/MM/DD'),NULL,6,3);
INSERT INTO musician VALUES(14,'Alan Fluff',TO_DATE('1935/01/15','YYYY/MM/DD'),TO_DATE('1997/05/15','YYYY/MM/DD'),7,2);
INSERT INTO musician VALUES(15,'Tony Smythe',TO_DATE('1932/04/02','YYYY/MM/DD'),NULL,8,1);
INSERT INTO musician VALUES(16,'James Quick',TO_DATE('1924/08/08','YYYY/MM/DD'),NULL,9,2);
INSERT INTO musician VALUES(17,'Freda Miles',TO_DATE('1920/07/04','YYYY/MM/DD'),NULL,9,3);
INSERT INTO musician VALUES(18,'Elsie James',TO_DATE('1947/05/06','YYYY/MM/DD'),NULL,8,5);
INSERT INTO musician VALUES(19,'Andy Jones',TO_DATE('1958/10/08','YYYY/MM/DD'),NULL,7,6);
INSERT INTO musician VALUES(20,'Louise Simpson',TO_DATE('1948/01/10','YYYY/MM/DD'),TO_DATE('1998/02/11','YYYY/MM/DD'),6,6);
INSERT INTO musician VALUES(21,'James Steeple',TO_DATE('1947/01/10','YYYY/MM/DD'),NULL,5,6);
INSERT INTO musician VALUES(22,'Steven Chaytors',TO_DATE('1956/03/11','YYYY/MM/DD'),NULL,6,7);

-------------------------------valores composer -------------------------------

INSERT INTO composer VALUES(1,1,'jazz');
INSERT INTO composer VALUES(2,3,'classical');
INSERT INTO composer VALUES(3,5,'jazz');
INSERT INTO composer VALUES(4,7,'classical');
INSERT INTO composer VALUES(5,9,'jazz');
INSERT INTO composer VALUES(6,11,'rock');
INSERT INTO composer VALUES(7,13,'classical');
INSERT INTO composer VALUES(8,15,'jazz');
INSERT INTO composer VALUES(9,17,'classical');
INSERT INTO composer VALUES(10,19,'jazz');
INSERT INTO composer VALUES(11,10,'rock');
INSERT INTO composer VALUES(12,8,'jazz');

-------------------------------valores performer -------------------------------

INSERT INTO performer VALUES(1,2,'violin','classical');
INSERT INTO performer VALUES(2,4,'viola','classical');
INSERT INTO performer VALUES(3,6,'banjo','jazz');
INSERT INTO performer VALUES(4,8,'violin','classical');
INSERT INTO performer VALUES(5,12,'guitar','jazz');
INSERT INTO performer VALUES(6,14,'violin','classical');
INSERT INTO performer VALUES(7,16,'trumpet','jazz');
INSERT INTO performer VALUES(8,18,'viola','classical');
INSERT INTO performer VALUES(9,20,'bass','jazz');
INSERT INTO performer VALUES(10,2,'flute','jazz');
INSERT INTO performer VALUES(11,20,'cornet','jazz');
INSERT INTO performer VALUES(12,6,'violin','jazz');
INSERT INTO performer VALUES(13,8,'drums','jazz');
INSERT INTO performer VALUES(14,10,'violin','classical');
INSERT INTO performer VALUES(15,12,'cello','classical');
INSERT INTO performer VALUES(16,14,'viola','classical');
INSERT INTO performer VALUES(17,16,'flute','jazz');
INSERT INTO performer VALUES(18,18,'guitar','not known');
INSERT INTO performer VALUES(19,20,'trombone','jazz');
INSERT INTO performer VALUES(20,3,'horn','jazz');
INSERT INTO performer VALUES(21,5,'violin','jazz');
INSERT INTO performer VALUES(22,7,'cello','classical');
INSERT INTO performer VALUES(23,2,'bass','jazz');
INSERT INTO performer VALUES(24,4,'violin','jazz');
INSERT INTO performer VALUES(25,6,'drums','classical');
INSERT INTO performer VALUES(26,8,'clarinet','jazz');
INSERT INTO performer VALUES(27,10,'bass','jazz');
INSERT INTO performer VALUES(28,12,'viola','classical');
INSERT INTO performer VALUES(29,18,'cello','classical');

-------------------------------valores band -------------------------------

INSERT INTO band VALUES(1,'ROP',5,'classical',TO_DATE('1930/01/01','YYYY/MM/DD'),11);
INSERT INTO band VALUES(2,'AASO',6,'classical',NULL,10);
INSERT INTO band VALUES(3,'The J Bs',8,'jazz',NULL,12);
INSERT INTO band VALUES(4,'BBSO',9,'classical',NULL,21);
INSERT INTO band VALUES(5,'The left Overs',2,'jazz',NULL,8);
INSERT INTO band VALUES(6,'Somebody Loves this',1,'jazz',NULL,6);
INSERT INTO band VALUES(7,'Oh well',4,'classical',NULL,3);
INSERT INTO band VALUES(8,'Swinging strings',4,'classical',NULL,7);
INSERT INTO band VALUES(9,'The Rest',9,'jazz',NULL,16);

-------------------------------valores composition -------------------------------

INSERT INTO composition VALUES(1,TO_DATE('1975/06/17','YYYY/MM/DD'),'Opus ',1);
INSERT INTO composition VALUES(2,TO_DATE('1976/07/21','YYYY/MM/DD'),'Here Goes',2);
INSERT INTO composition VALUES(3,TO_DATE('1981/12/14','YYYY/MM/DD'),'Valiant Knight',3);
INSERT INTO composition VALUES(4,TO_DATE('1982/01/12','YYYY/MM/DD'),'Little Piece',4);
INSERT INTO composition VALUES(5,TO_DATE('1985/03/13','YYYY/MM/DD'),'Simple Song',5);
INSERT INTO composition VALUES(6,TO_DATE('1986/04/14','YYYY/MM/DD'),'Little Swing Song',6);
INSERT INTO composition VALUES(7,TO_DATE('1987/05/13','YYYY/MM/DD'),'Fast Journey',7);
INSERT INTO composition VALUES(8,TO_DATE('1976/02/14','YYYY/MM/DD'),'Simple Love Song',8);
INSERT INTO composition VALUES(9,TO_DATE('1982/01/21','YYYY/MM/DD'),'Complex Rythms',9);
INSERT INTO composition VALUES(10,TO_DATE('1985/02/23','YYYY/MM/DD'),'Drumming Rythms',9);
INSERT INTO composition VALUES(11,TO_DATE('1978/03/18','YYYY/MM/DD'),'Fast Drumming',8);
INSERT INTO composition VALUES(12,TO_DATE('1984/08/13','YYYY/MM/DD'),'Slow Song',7);
INSERT INTO composition VALUES(13,TO_DATE('1968/09/14','YYYY/MM/DD'),'Blue Roses',6);
INSERT INTO composition VALUES(14,TO_DATE('1983/11/15','YYYY/MM/DD'),'Velvet Rain',5);
INSERT INTO composition VALUES(15,TO_DATE('1982/05/16','YYYY/MM/DD'),'Cold Wind',4);
INSERT INTO composition VALUES(16,TO_DATE('1983/06/18','YYYY/MM/DD'),'After the Wind Blows',3);
INSERT INTO composition VALUES(17,NULL,'A Simple Piece',2);
INSERT INTO composition VALUES(18,TO_DATE('1985/01/12','YYYY/MM/DD'),'Long Rythms',1);
INSERT INTO composition VALUES(19,TO_DATE('1988/02/12','YYYY/MM/DD'),'Eastern Wind',1);
INSERT INTO composition VALUES(20,NULL,'Slow Symphony Blowing',2);
INSERT INTO composition VALUES(21,TO_DATE('1990/07/12','YYYY/MM/DD'),'A Last Song',6);

-------------------------------valores has_composed -------------------------------

INSERT INTO has_composed VALUES(1,1);
INSERT INTO has_composed VALUES(1,8);
INSERT INTO has_composed VALUES(2,11);
INSERT INTO has_composed VALUES(3,2);
INSERT INTO has_composed VALUES(3,13);
INSERT INTO has_composed VALUES(3,14);
INSERT INTO has_composed VALUES(3,18);
INSERT INTO has_composed VALUES(4,12);
INSERT INTO has_composed VALUES(4,20);
INSERT INTO has_composed VALUES(5,3);
INSERT INTO has_composed VALUES(5,13);
INSERT INTO has_composed VALUES(5,14);
INSERT INTO has_composed VALUES(6,15);
INSERT INTO has_composed VALUES(6,21);
INSERT INTO has_composed VALUES(7,4);
INSERT INTO has_composed VALUES(7,9);
INSERT INTO has_composed VALUES(8,16);
INSERT INTO has_composed VALUES(9,5);
INSERT INTO has_composed VALUES(9,10);
INSERT INTO has_composed VALUES(10,17);
INSERT INTO has_composed VALUES(11,6);
INSERT INTO has_composed VALUES(12,7);
INSERT INTO has_composed VALUES(12,19);


-------------------------------valores plays_in -------------------------------

INSERT INTO plays_in VALUES(1,1);
INSERT INTO plays_in VALUES(1,7);
INSERT INTO plays_in VALUES(3,1);
INSERT INTO plays_in VALUES(4,1);
INSERT INTO plays_in VALUES(4,7);
INSERT INTO plays_in VALUES(5,1);
INSERT INTO plays_in VALUES(6,1);
INSERT INTO plays_in VALUES(6,7);
INSERT INTO plays_in VALUES(7,1);
INSERT INTO plays_in VALUES(8,1);
INSERT INTO plays_in VALUES(8,7);
INSERT INTO plays_in VALUES(10,2);
INSERT INTO plays_in VALUES(12,2);
INSERT INTO plays_in VALUES(13,2);
INSERT INTO plays_in VALUES(14,2);
INSERT INTO plays_in VALUES(14,8);
INSERT INTO plays_in VALUES(15,2);
INSERT INTO plays_in VALUES(15,8);
INSERT INTO plays_in VALUES(17,2);
INSERT INTO plays_in VALUES(18,2);
INSERT INTO plays_in VALUES(19,3);
INSERT INTO plays_in VALUES(20,3);
INSERT INTO plays_in VALUES(21,4);
INSERT INTO plays_in VALUES(22,4);
INSERT INTO plays_in VALUES(23,4);
INSERT INTO plays_in VALUES(25,5);
INSERT INTO plays_in VALUES(26,6);
INSERT INTO plays_in VALUES(27,6);
INSERT INTO plays_in VALUES(28,7);
INSERT INTO plays_in VALUES(28,8);
INSERT INTO plays_in VALUES(29,7);


-------------------------------valores concert -------------------------------
INSERT INTO concert VALUES(1,'Bridgewater Hall',1,TO_DATE('1995/01/06 ','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(2,'Bridgewater Hall',1,TO_DATE('1996/05/08 ','YYYY/MM/DD'),3);
INSERT INTO concert VALUES(3,'Usher Hall',2,TO_DATE('1995/06/03','YYYY/MM/DD') ,3);
INSERT INTO concert VALUES(4,'Assembly Rooms',2,TO_DATE('1997/09/20 ','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(5,'Festspiel Haus',3,TO_DATE('1995/02/21 ','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(6,'Royal Albert Hall',7,TO_DATE('1993/04/12','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(7,'Concertgebouw',9,TO_DATE('1993/05/14 ','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(8,'Metropolitan',4,TO_DATE('1997/06/15 ','YYYY/MM/DD'),21);
-------------------------------valores performance_ -------------------------------


INSERT INTO performance_ VALUES(1,1,1,21,1);
INSERT INTO performance_ VALUES(2,1,3,21,1);
INSERT INTO performance_ VALUES(3,1,5,21,1);
INSERT INTO performance_ VALUES(4,1,2,1,2);
INSERT INTO performance_ VALUES(5,2,4,21,2);
INSERT INTO performance_ VALUES(6,2,6,21,2);
INSERT INTO performance_ VALUES(7,4,19,9,3);
INSERT INTO performance_ VALUES(8,4,20,10,3);
INSERT INTO performance_ VALUES(9,5,12,10,4);
INSERT INTO performance_ VALUES(10,5,13,11,4);
INSERT INTO performance_ VALUES(11,3,5,13,5);
INSERT INTO performance_ VALUES(12,3,6,13,5);
INSERT INTO performance_ VALUES(13,3,7,13,5);
INSERT INTO performance_ VALUES(14,6,20,14,6);
INSERT INTO performance_ VALUES(15,8,12,15,7);
INSERT INTO performance_ VALUES(16,9,16,21,8);
INSERT INTO performance_ VALUES(17,9,17,21,8);
INSERT INTO performance_ VALUES(18,9,18,21,8);
INSERT INTO performance_ VALUES(19,9,19,21,8);
INSERT INTO performance_ VALUES(20,4,12,10,3);


--------------------------------------------------PoblarNoOK--------------------------------------------------
--el siguiente ejemplo ilustra la proteccion ya que, en la tabla place la llave 10 es pk y ya existe. 


--insertar valores con llaves foraneas que no existen; en este caso el atributo con numero 12 no existe en la tabla place
--INSERT INTO musician VALUES(24,'Alejandra Perez',TO_DATE(' 1958/05/12','YYYY/MM/DD'),NULL,6,12);

-- una llave pk no puede ser NULL, en el caso de musician el primer atributo es la llave pk  
--INSERT INTO musician VALUES(NULL,'Alejandra Perez',TO_DATE(' 1958/05/12','YYYY/MM/DD'),NULL,6,12);

-- una llave unica ya definida no  se puede repetir, en nuestro caso el nombre de la composicion no se debe repetir, last song ya se encuentra creada en la base de datos
--INSERT INTO composition VALUES(21,TO_DATE('1990/07/12','YYYY/MM/DD'),'A Last Song',6);
