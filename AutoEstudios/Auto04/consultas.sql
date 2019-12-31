------------------ Consultas -------------------------------------------------
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
--;
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
