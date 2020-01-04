-------------------------------Crear la base de datos sin restricciones (Tablas) -------------------------------

CREATE TABLE band (
   band_no NUMBER( 11 )   NOT NULL  ,
   band_name VARCHAR( 20 ) , 
   band_home NUMBER( 11 ) NOT NULL,     
   band_type VARCHAR( 15 )  , 
   b_date DATE , 
   band_contact NUMBER( 11 ) NOT NULL
);

CREATE TABLE composer( 
   comp_no NUMBER ( 11 ) NOT NULL  , 
   comp_is NUMBER( 11 ) NOT NULL ,
   comp_type VARCHAR( 15 ) 
);

CREATE TABLE composition( 
   c_no NUMBER ( 11 ) NOT NULL   ,
   comp_date DATE ,
   c_title VARCHAR( 40 ) NOT NULL ,
   c_in NUMBER( 11 ) 
);

CREATE TABLE concert( 
   concert_no NUMBER( 1 ) NOT NULL  ,
   concert_venue VARCHAR( 45 ) , 
   concert_in NUMBER( 1 ) NOT NULL , 
   con_date DATE , 
   concert_orgniser NUMBER( 2 )
);

CREATE TABLE has_composed(
  cmpr_no NUMBER( 11 ) NOT NULL  , 
  cmpn_no NUMBER( 11 ) NOT NULL  
);

CREATE TABLE musician(
  m_no NUMBER( 11 ) NOT NULL , 
  m_name VARCHAR( 20 )   , 
  born DATE  ,
  died DATE , 
  born_in NUMBER ( 11 )  , 
  living_in NUMBER( 11 )   
) ;

CREATE TABLE performance_( 
  pfrmnc_no NUMBER( 11 ) NOT NULL  , 
  gave NUMBER( 11 ) , 
  performed  NUMBER ( 11 ) ,
  conducted_by  NUMBER( 11 ) ,
  performed_in NUMBER( 11 )  
);

CREATE TABLE performer( 
  perf_no NUMBER( 11 ) NOT NULL  ,
  perf_is NUMBER( 11 ), 
  instrument  VARCHAR( 15 ) NOT  NULL ,
  perf_type  VARCHAR( 15 ) 
);

CREATE TABLE place(
  place_no NUMBER( 11 ) NOT NULL , 
  place_town  VARCHAR( 15 ) ,
  place_country VARCHAR( 15 )   
);

CREATE TABLE plays_in(
  player NUMBER( 11 ) NOT NULL, 
  band_id NUMBER( 11 ) NOT NULL 
);


