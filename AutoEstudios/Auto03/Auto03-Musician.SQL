-------------------------------Crear la base de datos sin restricciones (Tablas) -------------------------------

CREATE TABLE band (band_no NUMBER( 11 )   NOT NULL  , band_name VARCHAR( 20 ) , band_home NUMBER( 11 ) NOT NULL,     
   band_type VARCHAR( 15 )  , b_date DATE , band_contact NUMBER( 11 ) NOT NULL
);

CREATE TABLE composer( comp_no NUMBER ( 11 ) NOT NULL  , 
  comp_is NUMBER( 11 ) NOT NULL , comp_type VARCHAR( 15 ) 
);

CREATE TABLE composition( c_no NUMBER ( 11 ) NOT NULL   , comp_date DATE ,
  c_title VARCHAR( 40 ) NOT NULL , c_in NUMBER( 11 ) 
);

CREATE TABLE concert( concert_no NUMBER( 1 ) NOT NULL  , concert_venue VARCHAR( 45 ) , 
  concert_in NUMBER( 1 ) NOT NULL , con_date DATE , concert_orgniser NUMBER( 2 )
);

CREATE TABLE has_composed( cmpr_no NUMBER( 11 ) NOT NULL  , cmpn_no NUMBER( 11 ) NOT NULL  );

CREATE TABLE musician( m_no NUMBER( 11 ) NOT NULL , m_name VARCHAR( 20 )   , 
  born DATE  , died DATE , born_in NUMBER ( 11 )  , living_in NUMBER( 11 )   
) ;

CREATE TABLE performance_( pfrmnc_no NUMBER( 11 ) NOT NULL  , 
  gave NUMBER( 11 ) , performed  NUMBER ( 11 ) , conducted_by  NUMBER( 11 ) , performed_in NUMBER( 11 )  
);

CREATE TABLE performer( perf_no NUMBER( 11 ) NOT NULL  ,
  perf_is NUMBER( 11 ), instrument  VARCHAR( 15 ) NOT  NULL , perf_type  VARCHAR( 15 ) 
);

CREATE TABLE place( place_no NUMBER( 11 ) NOT NULL , 
  place_town  VARCHAR( 15 ) , place_country VARCHAR( 15 )   
);

CREATE TABLE plays_in( player NUMBER( 11 ) NOT NULL, band_id NUMBER( 11 ) NOT NULL );


-------------------------------Adicionar las restricciones a la base de datos (Atributos, Primarias, Únicas, Foraneas )-------------------------------

------------------------------Claves primarias para todas las tablas ------------------------------

ALTER TABLE musician ADD CONSTRAINT PK_musician PRIMARY KEY ( m_no );

ALTER TABLE performer ADD CONSTRAINT PK_performer PRIMARY KEY ( perf_no );

ALTER TABLE composer ADD CONSTRAINT PK_composer PRIMARY KEY ( comp_no );

ALTER TABLE place ADD CONSTRAINT PK_place PRIMARY KEY ( place_no );

ALTER TABLE concert ADD CONSTRAINT PK_concert PRIMARY KEY ( concert_no );

ALTER TABLE plays_in  ADD CONSTRAINT PK_plays_in PRIMARY KEY ( player, band_id );

ALTER TABLE has_composed  ADD CONSTRAINT PK_has_composed PRIMARY KEY ( cmpr_no,cmpn_no );

ALTER TABLE band  ADD CONSTRAINT PK_band PRIMARY KEY ( band_no );

ALTER TABLE performance_  ADD CONSTRAINT PK_performance_ PRIMARY KEY ( pfrmnc_no );

ALTER TABLE composition  ADD CONSTRAINT PK_composition PRIMARY KEY ( c_no );

------------------------------Claves UNICAS para las tablas ------------------------------

ALTER TABLE place ADD CONSTRAINT UK_place UNIQUE ( place_town ,place_country  );

ALTER TABLE composition ADD  CONSTRAINT UK_composition_c_title UNIQUE (c_title);

ALTER TABLE band  ADD CONSTRAINT UK_band UNIQUE ( band_name );

------------------------------Claves Foraneas  para todas las tablas ------------------------------

ALTER TABLE musician ADD CONSTRAINT FK_musicianPborn FOREIGN KEY( born_in ) REFERENCES place ( place_no );
ALTER TABLE musician ADD CONSTRAINT FK_musicianPliving FOREIGN KEY( living_in ) REFERENCES place ( place_no );

ALTER TABLE performer ADD CONSTRAINT FK_performerMperf_is FOREIGN KEY( perf_is ) REFERENCES musician  ( m_no );

ALTER TABLE composer ADD CONSTRAINT FK_composerMcomp_is FOREIGN KEY( comp_is  ) REFERENCES musician  ( m_no );

ALTER TABLE has_composed ADD CONSTRAINT FK_has_composedCcmpr_no FOREIGN KEY( cmpr_no  ) REFERENCES composer  ( comp_no );
ALTER TABLE has_composed ADD CONSTRAINT FK_has_composedCocmpn_no FOREIGN KEY( cmpn_no  ) REFERENCES composition  ( c_no );

ALTER TABLE composition ADD CONSTRAINT FK_compositionPc_in FOREIGN KEY( c_in ) REFERENCES place ( place_no );

ALTER TABLE concert ADD CONSTRAINT FK_concertPconcert_in FOREIGN KEY( concert_in ) REFERENCES place ( place_no );
ALTER TABLE concert ADD CONSTRAINT FK_concertMconcert_organiser FOREIGN KEY( concert_orgniser ) REFERENCES musician ( m_no );

ALTER TABLE plays_in ADD CONSTRAINT FK_plays_inPe_player FOREIGN KEY( player ) REFERENCES performer ( perf_no );
ALTER TABLE plays_in ADD CONSTRAINT FK_plays_inBband_id FOREIGN KEY( band_id ) REFERENCES band ( band_no );

ALTER TABLE band ADD CONSTRAINT FKbandMband_home FOREIGN KEY( band_home ) REFERENCES place ( place_no );
ALTER TABLE band ADD CONSTRAINT FKbandMband_contact FOREIGN KEY( band_contact ) REFERENCES musician  ( m_no );

ALTER TABLE performance_ ADD CONSTRAINT FKperformComp_performed FOREIGN KEY( performed ) REFERENCES composition  ( c_no );
ALTER TABLE performance_ ADD CONSTRAINT FKperformMconducted_by FOREIGN KEY( conducted_by ) REFERENCES musician  ( m_no );
ALTER TABLE performance_ ADD CONSTRAINT FKperformConc_performed_in FOREIGN KEY( performed_in ) REFERENCES concert  ( concert_no );
ALTER TABLE performance_ ADD CONSTRAINT FKperformBgave FOREIGN KEY( gave ) REFERENCES band  ( band_no );

-------------------------------PoblarOK ( Adicionar información a la tabla )-------------------------------

---Se crearon plantillas para hacer el poblado de las tablas

---Poblar la base de datos con los datos iniciales ---

-------------------------------valores place -------------------------------
/*
SELECT 
    'INSERT INTO place VALUES('||place_no||','||place_town||','||place_country||');' 
FROM place;
*/


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


/*

SELECT 
    CONCAT('INSERT INTO musician VALUES(',m_no,',',m_name,',','TO_DATE(',REPLACE(born,'-','/'),',     yyyy/mm/dd)',',',CASE WHEN died IS NULL THEN 'NULL'  ELSE CONCAT('TO_DATE(',REPLACE(died,'-','/'),', yyyy/mm/dd)') END, ',',born_in,',',living_in,');') 
FROM musician;

*/

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

/*
SELECT  
    'INSERT INTO composer VALUES('||comp_no||','||comp_is||','||comp_type||');' 
FROM composer;
*/
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

/*
SELECT 
    'INSERT INTO performer VALUES('||perf_no||','||perf_is||','||instrument||','||perf_type||');'
FROM performer;
*/

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

/*
SELECT 
     CONCAT('INSERT INTO band VALUES(',band_no,',',band_name,',',band_home,',',band_type,',',
     CASE 
         WHEN b_date IS NULL THEN 'NULL' 
         ELSE CONCAT('TO_DATE(',REPLACE(b_date,'-','/'),', yyyy/mm/dd)') 
     END, ',',band_contact,');') 
FROM band;
*/

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

/*
SELECT 
    CONCAT('INSERT INTO composition VALUES(',c_no,',',CASE WHEN comp_date IS NULL THEN 'NULL' ELSE CONCAT('TO_DATE(',REPLACE(comp_date,'-','/'),', "yyyy/mm/dd)"') END, ',',c_title,',',c_in,');') 
FROM composition;
*/

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

/*
SELECT 
    CONCAT('INSERT INTO has_composed VALUES(',cmpr_no,',',cmpn_no,');') 
FROM has_composed;
*/

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

/*
SELECT 
    CONCAT('INSERT INTO plays_in VALUES(',player,',',band_id,');')
 FROM plays_in;
*/

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

/*
SELECT 
    CONCAT('INSERT INTO concert VALUES(',concert_no,',',concert_venue,',',concert_in,',','TO_DATE(',REPLACE(con_date,'-','/'),', yyyy/mm/dd)',',',concert_orgniser,');') 
FROM concert;
*/

INSERT INTO concert VALUES(1,'Bridgewater Hall',1,TO_DATE('1995/01/06 ','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(2,'Bridgewater Hall',1,TO_DATE('1996/05/08 ','YYYY/MM/DD'),3);
INSERT INTO concert VALUES(3,'Usher Hall',2,TO_DATE('1995/06/03','YYYY/MM/DD') ,3);
INSERT INTO concert VALUES(4,'Assembly Rooms',2,TO_DATE('1997/09/20 ','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(5,'Festspiel Haus',3,TO_DATE('1995/02/21 ','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(6,'Royal Albert Hall',7,TO_DATE('1993/04/12','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(7,'Concertgebouw',9,TO_DATE('1993/05/14 ','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(8,'Metropolitan',4,TO_DATE('1997/06/15 ','YYYY/MM/DD'),21);
-------------------------------valores performance_ -------------------------------

/*
SELECT 
    CONCAT('INSERT INTO performance VALUES(',pfrmnc_no,',',gave,',',performed,',',conducted_by,',',performed_in,');') FROM performance;
*/

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



-------------------------------PoblarOK (Adicionar información a la tabla )-------------------------------

----------------------------------------Adicionar información a la tabla-------------------------------

INSERT INTO place VALUES(10,'Bogota','Colombia');

INSERT INTO musician VALUES(23,'Fabian Raimrez',TO_DATE(' 1958/05/12','YYYY/MM/DD'),NULL,6,10);
INSERT INTO musician VALUES(24,'Rick Rincon',TO_DATE('1953/01/12','YYYY/MM/DD'),NULL,3,10);

INSERT INTO composer VALUES(13,23,'regueton');
INSERT INTO composer VALUES(14,24,'regueton');

INSERT INTO composition VALUES(22,TO_DATE('1990/07/12','YYYY/MM/DD'),'mala',10);
INSERT INTO composition VALUES(23,TO_DATE('1940/05/12','YYYY/MM/DD'),'yo por ti',10);

INSERT INTO has_composed VALUES(13,22);
INSERT INTO has_composed VALUES(14,23);


------------------- Consultas -------------------------------------------------
------------------- Easy Questions --------------------------------------------

---1
SELECT m_name FROM 
     concert JOIN musician ON concert_orgniser =  m_no
  WHERE con_date > TO_DATE('1997/02/01','YYYY/MM/DD') AND concert_venue = 'Assembly Rooms';

---2
SELECT m_name  FROM ( SELECT m_name, born_in  FROM  performer INNER JOIN musician ON perf_is =  m_no 
   WHERE instrument = 'guitar'  or instrument =  'violin' ) New_table INNER JOIN place ON born_in = place_no  
WHERE place_country = 'England';

---3
SELECT m_name,  place_town, con_date FROM place,concert,musician 
  WHERE  m_no = concert_orgniser AND place_no = concert_in AND place_country = 'USA';

---4
SELECT con_date,place_country,c_title 
FROM 
  (SELECT con_date,concert_in ,c_title  FROM (SELECT comp_no ,c_title
    FROM composer LEFT JOIN  composition ON c_no = comp_is 
        WHERE comp_no = 19 ) 
New_table1 JOIN concert ON concert_orgniser = comp_no ) 
New_table2 INNER JOIN place ON   concert_in  = place_no;

---5
SELECT instrument, COUNT( instrument ),
COUNT( instrument )/( SELECT COUNT( DISTINCT perf_is )  AS T FROM musician, performer 
    WHERE perf_is = m_no ) FROM performer
GROUP BY instrument
ORDER BY instrument;

------------------- Medium Questions ------------------------------------------

---6
SELECT m_name, born, instrument FROM musician, performer
WHERE perf_is =  m_no AND died IS NULL AND m_name <> 'Theo Mengel' AND
instrument IN ( SELECT DISTINCT instrument FROM musician, performer  WHERE  perf_is =  m_no AND  m_name = 'Theo Mengel' );

---7
--SELECT m_name,Num_Integra FROM (SELECT m_name,
--COUNT( m_name ) AS Num_Integra,COUNT( m_name ) / ( SELECT COUNT( m_name) FROM musician,  band, plays_in
 --  WHERE player = m_no AND band_id = band_no ) AS prom FROM musician, band, plays_in
--WHERE player = m_no AND band_id = band_no
--GROUP BY m_name) AS new
--WHERE Num_Integra > prom;

-
---8
SELECT m_name AS name  , place_country AS living_In 
FROM ( (musician INNER JOIN composer ON comp_is = m_no ) INNER JOIN place ON  place_no = living_in ) 
WHERE place_country IN ('England','Scotland','Gales');

---9
--SELECT instrument ,Num_music 
--FROM ( SELECT DISTINCT instrument , COUNT( m_no ) AS Num_music FROM 
--musician INNER JOIN performer  ON  perf_is = m_no
--GROUP BY instrument 
--) AS new_table
--WHERE Num_music <= ALL ( SELECT COUNT( perf_no ) FROM performer GROUP BY instrument );


--10
SELECT DISTINCT band_name
FROM ((composition INNER JOIN has_composed ON cmpn_no = c_no )  
      INNER JOIN musician ON m_no = cmpr_no) , band ,plays_in 
WHERE m_name = 'Sue Little'
ORDER BY band_name;


------------------- Hard Questions --------------------------------------------

--11
--Jp : james place
--pl : places 
--Ar : artists
--SELECT m_name FROM ( SELECT born_in FROM musician  
  --WHERE m_name = 'James First')Jp JOIN (SELECT * FROM place ) pl 
    --JOIN ( SELECT m_name, born_in 
  --FROM musician where m_name <> 'James First') AS Ar ON pl.place_no = 
--Ar.born_in AND  Jp.born_in =  Ar.born_in;


--12
--SELECT  m_name, COUNT( instrument  )Instrumento, COUNT( cmpn_no) Composicion
--FROM (((SELECT m_no, m_name, born_in FROM musician ) Mu  JOIN 
--  (SELECT place_no FROM place WHERE place_country IN 
--    ('England','Scotland','Gales'))Pl  ON Pl.place_no = Mu.born_in
--LEFT JOIN  performer ON perf_is = m_no ) 
--LEFT JOIN composer ON  comp_is = m_no )
--LEFT JOIN has_composed ON comp_no = cmpn_no

--GROUP BY m_name;

--13
--conducted_by - performance
--band_name - band 
--band_contact- band 

--SELECT band_name,  m_name, Contact  FROM (SELECT band_name, m_name,band_contact
--FROM (SELECT concert_no FROM concert X
   --WHERE concert_venue = 'Royal Albert Hall' AND
    -- con_date IN (SELECT MAX( con_date) 
--FROM concert Y
  -- WHERE X.concert_venue = Y.concert_venue )) New, performance, musician,band
--WHERE concert_no = performed_in AND
--gave = band_no AND conducted_by = m_no
--)RTA INNER JOIN (SELECT m_no, m_name Contact FROM musician) M ON band_contact = M.m_no
;
--14

--(SELECT 'LIVES_IN'AS Nat, m_name  FROM musician JOIN  place ON living_in = place_no
--WHERE place_town = 'Glasgow'
--)
--UNION  
--(SELECT 'BORN_IN', m_name  FROM musician JOIN  place ON born_in = place_no
--WHERE place_town = 'Glasgow'
--)
--UNION
--( SELECT 'PERFORMED_IN', m_name  FROM musician JOIN plays_in JOIN performance JOIN concert JOIN place
--ON m_no =  player AND band_id = gave AND performed_in = concert_no AND
--concert_in = place_no
--WHERE place_town = 'Glasgow'
--)
--UNION
--( SELECT 'IN_BAND_IN', m_name  FROM ( musician  JOIN  plays_in ON player = m_no ) JOIN band ON band_id = band_no, place
--WHERE band_home =place_no AND  place_town = 'Glasgow' 
--)
--ORDER BY  Nat
--;
--15

--SELECT * FROM band, plays_in, musician, performer
--WHERE band_name IN (
--SELECT band_name FROM (musician JOIN plays_in JOIN band ON m_no = player AND
--band_id = band_no ) 
--WHERE m_name = 'Sue Little' OR m_name = 'Jeff Dawn')
 
--AND player = perf_no AND m_no = perf_is AND band_id = band_no;

--SELECT m_name,  place_town, con_date FROM  
  -- (SELECT concert_orgniser, place_town, con_date FROM place INNER JOIN concert
 --   ON concert_in = place_no WHERE place_country = 'USA ' ) 
--New_table INNER JOIN musician ON  m_no = concert_orgniser;

--------------------------------------------------PoblarNoOK--------------------------------------------------
--el siguiente ejemplo ilustra la proteccion ya que, en la tabla place la llave 10 es pk y ya existe. 


--insertar valores con llaves foraneas que no existen; en este caso el atributo con numero 12 no existe en la tabla place
INSERT INTO musician VALUES(24,'Alejandra Perez',TO_DATE(' 1958/05/12','YYYY/MM/DD'),NULL,6,12);

-- una llave pk no puede ser NULL, en el caso de musician el primer atributo es la llave pk  
INSERT INTO musician VALUES(NULL,'Alejandra Perez',TO_DATE(' 1958/05/12','YYYY/MM/DD'),NULL,6,12);

-- una llave unica ya definida no  se puede repetir, en nuestro caso el nombre de la composicion no se debe repetir, last song ya se encuentra creada en la base de datos
INSERT INTO composition VALUES(21,TO_DATE('1990/07/12','YYYY/MM/DD'),'A Last Song',6);


-------------------------------Xpoblar ( Eliminar los datos de la base de datos )-------------------------------

DELETE FROM performance_;
DELETE FROM has_composed;
DELETE FROM composer ;
DELETE FROM composition;
DELETE FROM concert;

DELETE FROM plays_in;
DELETE FROM band;
DELETE FROM performer;

DELETE FROM musician;
DELETE FROM place;



-------------------------------XTablas ( Eliminar las tablas de la base de datos )-------------------------------


DROP TABLE band CASCADE CONSTRAINTS;
DROP TABLE composer CASCADE CONSTRAINTS;
DROP TABLE composition CASCADE CONSTRAINTS;
DROP TABLE concert CASCADE CONSTRAINTS;
DROP TABLE has_composed CASCADE CONSTRAINTS;
DROP TABLE musician CASCADE CONSTRAINTS;
DROP TABLE performance_  CASCADE CONSTRAINTS;
DROP TABLE performer CASCADE CONSTRAINTS;
DROP TABLE place CASCADE  CONSTRAINTS;
DROP TABLE plays_in CASCADE CONSTRAINTS;
--
