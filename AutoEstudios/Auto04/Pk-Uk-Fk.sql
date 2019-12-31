------------------------------Claves primarias para todas las tablas ------------------------------

ALTER TABLE musician 
ADD CONSTRAINT PK_musician 
PRIMARY KEY ( m_no );

ALTER TABLE performer 
ADD CONSTRAINT PK_performer 
PRIMARY KEY ( perf_no );

ALTER TABLE composer 
ADD CONSTRAINT PK_composer 
PRIMARY KEY ( comp_no );

ALTER TABLE place
ADD CONSTRAINT PK_place 
PRIMARY KEY ( place_no );

ALTER TABLE concert
ADD CONSTRAINT PK_concert 
PRIMARY KEY ( concert_no );

ALTER TABLE plays_in 
ADD CONSTRAINT PK_plays_in 
PRIMARY KEY ( player, band_id );

ALTER TABLE has_composed 
ADD CONSTRAINT PK_has_composed 
PRIMARY KEY ( cmpr_no,cmpn_no );

ALTER TABLE band  
ADD CONSTRAINT PK_band
PRIMARY KEY ( band_no );

ALTER TABLE performance_  
ADD CONSTRAINT PK_performance_ 
PRIMARY KEY ( pfrmnc_no );

ALTER TABLE composition  
ADD CONSTRAINT PK_composition 
PRIMARY KEY ( c_no );

------------------------------Claves UNICAS para las tablas ------------------------------

ALTER TABLE place 
ADD CONSTRAINT UK_place
UNIQUE ( place_town ,place_country  );

ALTER TABLE composition 
ADD  CONSTRAINT UK_composition_c_title 
UNIQUE (c_title);

ALTER TABLE band  
ADD CONSTRAINT UK_band
UNIQUE ( band_name );

------------------------------Claves Foraneas  para todas las tablas ------------------------------

ALTER TABLE musician
ADD CONSTRAINT FK_musician_born_in
FOREIGN KEY( born_in ) REFERENCES place ( place_no );
--
ALTER TABLE musician 
ADD CONSTRAINT FK_musician_living_in
FOREIGN KEY( living_in ) REFERENCES place ( place_no );

ALTER TABLE performer 
ADD CONSTRAINT FK_performer_perf_is
FOREIGN KEY( perf_is ) REFERENCES musician  ( m_no );

ALTER TABLE composer 
ADD CONSTRAINT FK_composer_comp_is
FOREIGN KEY( comp_is  ) REFERENCES musician  ( m_no );

ALTER TABLE has_composed 
ADD CONSTRAINT FK_has_composed_cmpr_no
FOREIGN KEY( cmpr_no  ) REFERENCES composer  ( comp_no );

ALTER TABLE has_composed
ADD CONSTRAINT FK_has_composed_cmpn_no 
FOREIGN KEY( cmpn_no  ) REFERENCES composition  ( c_no );

ALTER TABLE composition
ADD CONSTRAINT FK_composition_c_in 
FOREIGN KEY( c_in ) REFERENCES place ( place_no );

ALTER TABLE concert 
ADD CONSTRAINT FK_concert_concert_in 
FOREIGN KEY( concert_in ) REFERENCES place ( place_no );

ALTER TABLE concert
ADD CONSTRAINT FK_concert_concert_orgniser 
FOREIGN KEY( concert_orgniser ) REFERENCES musician ( m_no );

ALTER TABLE plays_in 
ADD CONSTRAINT FK_plays_in_player FOREIGN KEY( player )
REFERENCES performer ( perf_no );

ALTER TABLE plays_in 
ADD CONSTRAINT FK_plays_in_band_id 
FOREIGN KEY( band_id ) REFERENCES band ( band_no );

ALTER TABLE band 
ADD CONSTRAINT FK_band_band_home 
FOREIGN KEY( band_home ) REFERENCES place ( place_no );

ALTER TABLE band 
ADD CONSTRAINT FK_band_band_contact 
FOREIGN KEY( band_contact ) REFERENCES musician  ( m_no );

ALTER TABLE performance_ 
ADD CONSTRAINT FK_performance_performed
FOREIGN KEY( performed ) REFERENCES composition  ( c_no );

ALTER TABLE performance_ 
ADD CONSTRAINT FK_performance_conducted_by FOREIGN KEY( conducted_by ) REFERENCES musician  ( m_no );

ALTER TABLE performance_
ADD CONSTRAINT FK_performance_performed_in
FOREIGN KEY( performed_in ) REFERENCES concert  ( concert_no );

ALTER TABLE performance_ 
ADD CONSTRAINT FK_performance_gave 
FOREIGN KEY( gave ) REFERENCES band  ( band_no );