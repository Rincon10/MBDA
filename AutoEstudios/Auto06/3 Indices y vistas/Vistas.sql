CREATE OR REPLACE VIEW HARD14 AS 
    
(SELECT 
    'LIVES_IN'AS Nat,
     place_town, 
     m_name  
FROM 
     musician 
     INNER JOIN  
     place 
         ON living_in = place_no
)
UNION  
(SELECT 
      'BORN_IN',
       place_town, 
       m_name  
FROM 
    musician 
    INNER JOIN 
    place 
       ON born_in = place_no
)
UNION
( SELECT 
       'PERFORMED_IN', 
        place_town,
        m_name  
FROM 
    musician 
    INNER JOIN 
    plays_in
      ON m_no =  player 
    INNER JOIN 
    band
      ON band_id = band_no
    INNER JOIN 
    performance_
      ON band_id = gave
    INNER JOIN 
    concert
      ON performed_in = concert_no 
    INNER JOIN 
    place
      ON concert_in = place_no 
 )
UNION
( SELECT 
       'IN_BAND_IN', 
        place_town,
        m_name  
FROM ( 
      SELECT *
      FROM  
      musician  
      INNER JOIN  
      plays_in 
         ON player = m_no )
      INNER JOIN 
      band 
         ON band_id = band_no,
      place
WHERE band_home =place_no 
)
ORDER BY m_name;


/*Los musicos que estudiaron en la misma universidad*/

CREATE OR REPLACE VIEW mUniversidad AS 
SELECT 
     m_name,
     uni  
FROM musician, 
     XMLTABLE('
     //universidad'
             passing detalle
             columns  uni VARCHAR(10) PATH '@nombre')
ORDER BY uni ;


/*3)
El musico mas premiado en un año especifico*/


CREATE OR REPLACE VIEW rtaParcial
 AS 
SELECT 
     m_name T1,
     año,
     COUNT(premio) AS Times
FROM 
    musician M, 
    XMLTABLE('//premio'
            passing M.detalle 
            columns 
               premio VARCHAR( 10 ) PATH '@nombre',
               año NUMBER PATH '@año'
            ) 
GROUP BY m_name, año
ORDER BY Times DESC;

CREATE OR REPLACE VIEW años
 AS
 SELECT 
     año AS año2,
     MAX( Times ) AS Timess
 FROM rtaParcial
GROUP BY año;

CREATE VIEW  musicoMasPremiado AS
SELECT 
    T1,
    año,
    Times
FROM rtaParcial,
     años
WHERE año = año2 AND 
      Times = Timess;


/*4)
Consultar la composicion mas popular y el numero de bandas que la interpretan 
*/

CREATE OR REPLACE VIEW compPopuParciales
 AS
SELECT 
      c_title,
      COUNT( gave ) AS numeroDeBandas
FROM 
    composition
    INNER JOIN 
    performance_ 
      ON performed = c_no
GROUP BY c_title
ORDER BY numeroDeBandas DESC; 


CREATE OR REPLACE VIEW compPolular
AS
SELECT 
      MAX( numeroDeBandas ) AS maxNumB
FROM compPopuParciales;


CREATE OR REPLACE VIEW compPopu
AS 
SELECT *
FROM 
    compPopuParciales
	INNER JOIN 
	compPolular
	    ON maxNumB = numeroDeBandas;


