/*TRIGGERS */

/*Artistas*/
--unicamente se pueden actualizar las preferencias del artista, asi como su telefono.

CREATE OR REPLACE TRIGGER Mod_Artistas
  BEFORE UPDATE  
  ON Artistas
  FOR EACH ROW 
DECLARE
cont NUMBER;
BEGIN
    SELECT COUNT(*) INTO cont
    FROM Camerinos
    WHERE 
       noCamerino = :new.numCamerino AND
       disponibilidad = 0;
    IF  :new.idArtista <> :old.idArtista OR
        :new.nombreArtistico <> :old.nombreArtistico 
        THEN RAISE_APPLICATION_ERROR(-20002,'unicamente se pueden actualizar las preferencias del artista, asi como su telefono.');
    ELSIF cont <> 0
        THEN RAISE_APPLICATION_ERROR(-20002,'La capacidad maxima del camerino ya se alcanzo.');
    END IF;
END;
/

/*Patrocinadores*/

--generar de forma automatica el correo, si el patrocinador no lo suministra,tomando la primeras 5 letras de la razon social y concatenandolo con @empresarial.com

CREATE OR REPLACE TRIGGER Ad_Patrocinadores_correo
  BEFORE INSERT
  ON Patrocinadores
  FOR EACH ROW
DECLARE
numer NUMBER;
cont NUMBER;
nCorreo VARCHAR(40);
BEGIN 
  SELECT 
    CEIL(dbms_random.value(111,999)) INTO numer
  FROM dual;
  
  nCorreo := TRIM(SUBSTR(:new.razonSocial,1, 5 ))||TO_CHAR(numer)||'@empresarial.com';
  
  SELECT 
    COUNT( * ) INTO cont
  FROM Patrocinadores
  WHERE correo = nCorreo ;
  
  IF :new.correo IS NULL AND cont = 0
     THEN :new.correo := nCorreo ;
  ELSIF :new.correo IS NULL AND cont<>0 THEN 
     RAISE_APPLICATION_ERROR(-20005,'Debe ingresar el correo de forma manual.');
  END IF;
END; 
/


--Unicamente se puede actualizar las fechas del patrocinio, por un motivo externo. 

CREATE OR REPLACE TRIGGER Mod_fechaPatrocinio
  BEFORE INSERT 
  ON fechaPatrocinio
  FOR EACH ROW
BEGIN
  IF :new.idPatrocinador  <> :old.idPatrocinador OR
     :new.coEvento  <> :old.coEvento
     THEN RAISE_APPLICATION_ERROR(-20001,'Unicamente se puede actualizar las fechas del patrocinio.');
  END IF;
END;
/


/*Conciertos*/

--Generar de forma automatica el numero del concierto, si este no se ingresa. 

CREATE OR REPLACE TRIGGER Ad_Conciertos
  BEFORE INSERT 
  ON Conciertos 
  FOR EACH ROW
BEGIN
  IF :new.noConcierto IS NULL 
      THEN :new.noConcierto := sequenceNoCon.NEXTVAL;
  END IF;
END;
/

--Unicamente se puede actualizar las fechas de asignacion de los camerinos para un  concierto, generado por un motivo externo. 

CREATE OR REPLACE TRIGGER Mod_esAsignado
  BEFORE INSERT 
  ON esAsignado
  FOR EACH ROW
BEGIN
  IF :new.numConcierto  <> :old.numConcierto OR
     :new.numCamerino  <> :old.numCamerino
     THEN RAISE_APPLICATION_ERROR(-20001,'Unicamente se puede actualizar las fechas de asignacion de los camerinos para un  concierto, generado por un motivo externo. ');
  END IF;
END;
/

/*Eventos*/

--Generar de forma automatica el numero del evento si este no es ingresado
CREATE OR REPLACE TRIGGER Ad_Eventos
    BEFORE INSERT 
    ON Eventos
    FOR EACH ROW 
BEGIN        
    IF :new.noevento IS NULL THEN 
        :new.noEvento := sequenceNoEvento.NEXTVAL;
    END IF;
END;
/



--Generar de forma automatica el codigo de la boleta del concierto.

CREATE OR REPLACE TRIGGER Ad_Boletas
  BEFORE INSERT 
  ON Boletas
  FOR EACH ROW
DECLARE 
nom VARCHAR(40) ;
BEGIN
   SELECT nomEvento INTO nom
   FROM 
       Boletas
       INNER JOIN 
       Eventos 
           ON noEvento = numEvento
   WHERE noEvento = :new.numEvento;
   
   IF  :new.codigoBoleta IS NULL 
       THEN :new.codigoBoleta := TRIM(SUBSTR(nom,1,4))||'-'||TO_CHAR(sequenceNoBoleta.NEXTVAL); 	
   END IF;
  
END;
/

--Unicamente se puede actualizar las fechas del evento y el valor del evento .

CREATE OR REPLACE TRIGGER Mod_Eventos
  BEFORE INSERT 
  ON Eventos
  FOR EACH ROW
BEGIN
  IF :new.noEvento  <> :old.noEvento OR
     :new.nomEvento  <> :old.nomEvento
     THEN RAISE_APPLICATION_ERROR(-20001,'Unicamente se puede actualizar las fechas del evento y el valor del evento .');
  END IF;
END;
/

/*Camerinos*/
--si no se ingresa el numero del camerino este se generara de forma automatica.

CREATE OR REPLACE TRIGGER Ad_Camerinos
    BEFORE INSERT 
    ON Camerinos
    FOR EACH ROW 
BEGIN        
    IF :new.noCamerino IS NULL THEN 
        :new.noCamerino := sequenceNoCamerino.NEXTVAL;
    END IF;
END;
/

--Lo unico que se puede modificar es la disponibilidad.
CREATE OR REPLACE TRIGGER Mod_Camerinos
    BEFORE UPDATE
    ON Camerinos
    FOR EACH ROW 
BEGIN        
    IF :new.noCamerino <> :old.noCamerino OR
        :new.nombreCamerino <> :old.nombreCamerino THEN
          RAISE_APPLICATION_ERROR(-20001,'Lo unico que se puede modificar es la disponibilidad.');
    END IF;
END;
/
