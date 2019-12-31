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

INSERT INTO musician 
    VALUES (1,'Fred Bloggs',TO_DATE('1948-01-02','YYYY-MM-DD'),NULL, 1,2,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/FredBloggsOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
          nombre = "Mercury"  
	      razon = "JBloggs">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Universal Music Group">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Sinfonía 1"
	       año = "1799">
	   </disco>
	   <disco
	       nombre  = "Sinfonía 10"
	       año = "1810">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre = "World Music"
          año = "1812">
	   </premio>
       <premio
	      nombre =  "Heat Latin Music Awards? "
          año = "1812">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Jacobs School of Music"
		   añoInicio = "1770"
		   añoFin = "1775"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Amos Roddan">
	   </hijo>
	   
	   <hijo
	       nombre = "Gusta Egarr">
	   </hijo>
	</hijos>
   
</detalle>
'
);	
		
INSERT INTO musician 
    VALUES (2,'John Smith',TO_DATE('1950-03-03','YYYY-MM-DD'),NULL, 3,4,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/JohnSmithOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "arthur"  
	      razon = "JSmith">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Universal Music Group">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Sinfonía 25"
	       año = "1990">
	   </disco>
	   <disco
	       nombre  = "Sinfonía 30"
	       año = "2000">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre = "World Music"
          año = "1812">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Yale School of Music"
		   añoInicio = "1770"
		   añoFin = "1775"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Amos Roddan">
	   </hijo>
	   
	   <hijo
	       nombre = "Gusta Egarr">
	   </hijo>
	</hijos>
   
</detalle>
'
);	
	
INSERT INTO musician 
    VALUES (3,'Helen Smyth',TO_DATE('1948-08-08','YYYY-MM-DD'),NULL, 4,5,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/HelenSmythOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	       nombre = "Melany"  
	       razon = "MSmyth">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Warner Music Group">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Sinfonía 6"
	       año = "1885">
	   </disco>
	   <disco
	       nombre  = "Sinfonía  8"
	       año = "1900">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  "Heat Latin Music Awards? "
          año = "1930">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Curtis Institute of Music"
		   añoInicio = "1860"
		   añoFin = "1870"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Lothaire Kluger">
	   </hijo>
	   
	   <hijo
	       nombre = "Darrin Kiddie">
	   </hijo>
	</hijos>
</detalle>
'
);		
INSERT INTO musician
    VALUES (4,'Harriet Smithson',TO_DATE('1909-05-09','YYYY-MM-DD'),TO_DATE('1980-09-20','YYYY-MM-DD'), 5,6,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/HarrietSmithsonOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "Robert"  
	      razon = "RHsmithson">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "YG Entertainment">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Trilogia"
	       año = "1950">
	   </disco>
	   <disco
	       nombre  = "Le Diable"
	       año = "1970">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  "Grammy Latinos "
          año = "1980">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Berklee School of Music"
		   añoInicio = "1900"
		   añoFin = "1905"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Trenna McBain">
	   </hijo>
	   
	   <hijo
	       nombre = "Laurette Bearblock">
	   </hijo>
	</hijos>
</detalle>
'
);		
INSERT INTO musician 
    VALUES (5,'James First',TO_DATE('1965-06-10','YYYY-MM-DD'),NULL, 7,7,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/JamesFirstOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "Jacinto"  
	      razon = "JJFirst">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Epic Records">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Conciertos de Brandenburgo"
	       año = "1721">
	   </disco>
	   <disco
	       nombre  = "Sonata para piano 14"
	       año = "1770">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre = "Premio Grammy "
          año = "1810">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Yale School of Music"
		   añoInicio = "1760"
		   añoFin = "1765"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Francesco Cozens">
	   </hijo>
	   
	   <hijo
	       nombre = "Quinton Buttery">
	   </hijo>
	</hijos>
   
</detalle>
'
);	
    
    
    

INSERT INTO musician 
    VALUES (6,'Theo Mengel',TO_DATE('1948-08-12','YYYY-MM-DD'),NULL, 7,1,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/TheoMengelOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "jefferson"  
	      razon = "TJmengel">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Epic Records">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Sinfonía 5 en Do menor"
	       año = "1800">
	   </disco>
	   <disco
	       nombre  = "Sinfonía número 9 Coral en Re menor"
	       año = "1820">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  "MTV Video Music Awards"
          año = "1850">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "University of Hartford"
		   añoInicio = "1820"
		   añoFin = "1825"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Cassy Danbye">
	   </hijo>
	   
	   <hijo
	       nombre = "Eadmund Domanek">
	   </hijo>
	</hijos>
</detalle>
'
);		

	
INSERT INTO musician 
    VALUES (7,'Sue Little',TO_DATE('1945-02-21','YYYY-MM-DD'),NULL, 8,9,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/SueLittleOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "Caroline"  
	      razon = "SLCaroline">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Sony Music Entertainment US Latin LLC">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Don Carlo"
	       año = "1980">
	   </disco>
	   <disco
	       nombre  = "Sonatas y Impromptus"
	       año = "1990">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  "American Music Awards"
          año = "2000">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Yale School of Music"
		   añoInicio = "1970"
		   añoFin = "1975"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Allina Bosch">
	   </hijo>
	   
	   <hijo
	       nombre = "Shayne Ecclesall">
	   </hijo>
	</hijos>
</detalle>
'
);

INSERT INTO musician 
    VALUES (8,'Harry Forte',TO_DATE('1951-02-28','YYYY-MM-DD'),NULL, 1,8,
'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/HarryForteOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "josepth"  
	      razon = "JHForte">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "Palenque Records">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Concierto para Violín en Re mayor"
	       año = "1878">
	   </disco>
	   <disco
	       nombre  = "Sinfonía 9 del Nuevo Mundo en mi menor"
	       año = "1885">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  " Teen Choice Awards "
          año = "1890">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "The Univeristy of New Orleans"
		   añoInicio = "1840"
		   añoFin = "1845"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Sax Forman">
	   </hijo>
	   
	   <hijo
	       nombre = "Ruthie Stede">
	   </hijo>
	</hijos>
</detalle>
'
);		

	
INSERT INTO musician 
    VALUES (9,'Phil Hot',TO_DATE('1942-06-30','YYYY-MM-DD'),NULL, 2,7,

'<?xml version="1.0"?>
<detalle>
    <pagina 
          url = "https:/PhilHotOfficial.com">
	</pagina>
    <otrosNombres>
       <otroNombre
	      nombre = "Andrew"  
	      razon = "PAHot">
       </otroNombre>
	</otrosNombres> 
	<sellos>
	   <sello 
	       nombre = "DEL Records">
	   </sello>
	</sellos>
	<discos>
	   <disco
	       nombre  = "Rossini·Otello"
	       año = "1860">
	   </disco>
	   <disco
	       nombre  = "Misas para órgano"
	       año = "1870">
	   </disco>   
	</discos>
	<premios>
	   <premio
	      nombre =  " Billboard Music Award "
          año = "1890">
	   </premio>
	</premios>
    <universidades>
	   <universidad
	       nombre = "Virginia Tech"
		   añoInicio = "1850"
		   añoFin = "1860"
		   titulo = "Musician">
	   </universidad>
	</universidades>
	<hijos>
	   <hijo
	       nombre = "Mendy Reap">
	   </hijo>
	   
	   <hijo
	       nombre = "Marlo Pritchett">
	   </hijo>
	</hijos>
</detalle>
'
);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  ) VALUES(10,'Jeff Dawn',TO_DATE('1945/12/12','YYYY/MM/DD'),NULL,3,6);
INSERT INTO musician (m_no ,m_name  ,born  ,died  ,born_in  ,living_in  ) VALUES(11,'Rose Spring',TO_DATE('1948/05/25','YYYY/MM/DD'),NULL,4,5);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(12,'Davis Heavan',TO_DATE('1975/10/03','YYYY/MM/DD'),NULL,5,4);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(13,'Lovely Time',TO_DATE('1948/12/28','YYYY/MM/DD'),NULL,6,3);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(14,'Alan Fluff',TO_DATE('1935/01/15','YYYY/MM/DD'),TO_DATE('1997/05/15','YYYY/MM/DD'),7,2);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(15,'Tony Smythe',TO_DATE('1932/04/02','YYYY/MM/DD'),NULL,8,1);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(16,'James Quick',TO_DATE('1924/08/08','YYYY/MM/DD'),NULL,9,2);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(17,'Freda Miles',TO_DATE('1920/07/04','YYYY/MM/DD'),NULL,9,3);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(18,'Elsie James',TO_DATE('1947/05/06','YYYY/MM/DD'),NULL,8,5);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(19,'Andy Jones',TO_DATE('1958/10/08','YYYY/MM/DD'),NULL,7,6);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(20,'Louise Simpson',TO_DATE('1948/01/10','YYYY/MM/DD'),TO_DATE('1998/02/11','YYYY/MM/DD'),6,6);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(21,'James Steeple',TO_DATE('1947/01/10','YYYY/MM/DD'),NULL,5,6);
INSERT INTO musician(m_no ,m_name  ,born  ,died  ,born_in  ,living_in  )  VALUES(22,'Steven Chaytors',TO_DATE('1956/03/11','YYYY/MM/DD'),NULL,6,7);

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


