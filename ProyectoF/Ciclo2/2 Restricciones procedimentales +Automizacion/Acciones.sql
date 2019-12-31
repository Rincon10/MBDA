/*Acciones*/

ALTER TABLE fechaPatrocinio
    DROP CONSTRAINT FK_fechaPatrocinio_p;
    
    
ALTER TABLE fechaPatrocinio
ADD CONSTRAINT FK_fechaPatrocinio_p
FOREIGN KEY (idPatrocinador ) REFERENCES Patrocinadores (nitPatrocinador ) ON DELETE CASCADE;