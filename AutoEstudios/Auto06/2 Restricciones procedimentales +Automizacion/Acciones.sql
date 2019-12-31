/*B. Adicionando acciones de referencia*/
/*Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos.*/
ALTER TABLE plays_in 
DROP CONSTRAINT 
FK_plays_in_player;

ALTER TABLE plays_in 
ADD CONSTRAINT FK_plays_in_player FOREIGN KEY( player )
REFERENCES performer ( perf_no ) ON DELETE CASCADE ;



ALTER TABLE performer 
DROP CONSTRAINT 
FK_performer_perf_is;

ALTER TABLE performer 
ADD CONSTRAINT FK_performer_perf_is
FOREIGN KEY( perf_is ) REFERENCES musician  ( m_no ) ON DELETE CASCADE;


ALTER TABLE band 
DROP  CONSTRAINT 
FK_band_band_contact ;

ALTER TABLE band 
ADD CONSTRAINT FK_band_band_contact 
FOREIGN KEY( band_contact ) REFERENCES musician  ( m_no ) ON DELETE CASCADE;


ALTER TABLE performance_ 
DROP CONSTRAINT 
FK_performance_conducted_by ;

ALTER TABLE performance_ 
ADD CONSTRAINT FK_performance_conducted_by 
FOREIGN KEY( conducted_by ) REFERENCES musician  ( m_no )ON DELETE CASCADE;



/*validar acciiones ok
AccionesOK
DELETE FROM musician WHERE m_no = 12;
DELETE FROM musician WHERE m_no = 18;

DELETE FROM musician WHERE m_no = 22;*/

