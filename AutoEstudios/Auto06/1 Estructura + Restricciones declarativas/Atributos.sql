------------------------------ check  para todas las tablas ------------------------------
/*Atributos*/ 
ALTER TABLE musician 
ADD CONSTRAINT CK_musician_m_name 
CHECK(  
    REGEXP_LIKE(
        m_name, '^[A-Za-z]+ [A-Za-z]+$'
        )
    
);
/*AtributosOK
INSERT INTO musician (m_no, m_name, born, died, born_in, living_in)
VALUES (23, 'Steve Rogers', TO_DATE('1989/05/27','YYYY/MM/DD'), NULL, 2, 3);

/*AtributosNoOK
--INSERT INTO musician (m_no, m_name, born, died, born_in, living_in)
--VALUES (24, 'Steve', TO_DATE('1978/11/21','YYYY/MM/DD'), NULL, 4, 7);*/

ALTER TABLE composer 
ADD CONSTRAINT CK_composer_comp_type 
CHECK( 
   comp_type IN ('jazz','classical','rock','blues','not known') 
);

/*AtributosOK
INSERT INTO composer (comp_no, comp_is, comp_type)
VALUES (13, 20, 'rock');
/*AtributosNoOK*/
--INSERT INTO composer (comp_no, comp_is, comp_type)
--VALUES (14, 15, 'salsa');


ALTER TABLE performer
ADD CONSTRAINT CK_performer_perf_type 
CHECK( 
   perf_type IN ('jazz','classical','rock','blues','not known'
   ) 
);
/*AtributosOK
INSERT INTO performer (perf_no, perf_is, instrument, perf_type)
VALUES (30, 5, 'drums', 'jazz');

/*AtributosNoOK*/
--INSERT INTO performer (perf_no, perf_is, instrument, perf_type)
--VALUES (31, 5, 'drums', 'salsa');


ALTER TABLE band 
ADD CONSTRAINT CK_band_band_type 
CHECK(  
   band_type IN ('jazz','classical','rock','blues','not known'
   ) 
);
/*AtributosOK
INSERT INTO band (band_no, band_name, band_home, band_type, b_date, band_contact)
VALUES (10, 'Black eye peas', 2, 'classical', NULL, 1);
/*AtributosNoOK*/
--INSERT INTO band (band_no, band_name, band_home, band_type, b_date, band_contact)
--VALUES (11, 'Black YELLOW', 9, 'merenge', NULL, 8);

/*Tuplas*/
ALTER TABLE musician 
ADD CONSTRAINT CK_musician_born 
CHECK( 
    born <  died
    
);
/*Tuplas  OK
INSERT INTO musician (m_no, m_name, born, died, born_in, living_in)
VALUES (24, 'Robert Rogers', TO_DATE('1962/06/03','YYYY/MM/DD'), NULL, 5, 8);

/*Tuplas NO OK*/

--INSERT INTO musician (m_no, m_name, born, died, born_in, living_in)
--VALUES (25, 'Scarllet Rogers', TO_DATE('1968/11/11','YYYY/MM/DD'), TO_DATE('1963/11/11','YYYY/MM/DD') , 3, 6);
