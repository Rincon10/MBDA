BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                     FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;
/

/* TABLAS */

--Patrocinadores 

CREATE TABLE Patrocinadores(
    nitPatrocinador NUMBER(11) NOT NULL ,
    razonSocial  VARCHAR(30) NOT NULL,
    correo  VARCHAR(40) NOT NULL,
    telefono NUMBER(10)
);

CREATE TABLE fechaPatrocinio(
    idPatrocinador NUMBER(11) NOT NULL,
    coEvento  NUMBER  NOT NULL,
    fecha  DATE NOT NULL
);


--Eventos
CREATE TABLE Eventos(
    noEvento NUMBER NOT NULL,
    nomEvento  VARCHAR(40) NOT NULL,
    fechaEvento DATE NOT NULL ,
    valorEvento  NUMBER NOT NULL
);

CREATE TABLE Boletas(
    codigoBoleta VARCHAR(11)  NOT NULL,
    categoria  VARCHAR(15) NOT NULL,
    numEvento  NUMBER NOT NULL,
    noZona  NUMBER NOT NULL
);

CREATE TABLE Zonas (
    noZona number NOT NULL,
    nombreZona varchar(40)  NOT NULL,
    ubicacionZona char(1)  NOT NULL
) ;

--Conciertos

CREATE TABLE Conciertos(
    noConcierto NUMBER NOT NULL,
    nombreConcierto  VARCHAR(40) NOT NULL,
    nuEvento  NUMBER NOT NULL
);

CREATE TABLE esAsignado(
    numConcierto NUMBER NOT NULL,
    numCamerino  NUMBER  NOT NULL,
    fecha  DATE NOT NULL
);

CREATE TABLE Tiene(
    idArti NUMBER(7) NOT NULL, 
	noCon NUMBER NOT NULL,
	fecha DATE NOT NULL 
);

--Camerinos
CREATE TABLE Camerinos(
    noCamerino NUMBER NOT NULL,
    nombreCamerino  VARCHAR(40) NOT NULL,
    disponibilidad NUMBER NOT NULL
);

CREATE TABLE seAbasteceCon(
    numCamerino NUMBER,
    coProduct  NUMBER ,
    cantidad NUMBER
);

CREATE TABLE Productos (
    coProducto number(7)  NOT NULL,
    nombreProducto varchar(40)  NOT NULL
) ;
--Artistas

CREATE TABLE Artistas(
    idArtista NUMBER(7) NOT NULL,
    nombreArtistico  VARCHAR(40) NOT NULL,
    Preferencias  XMLTYPE,
    telefono NUMBER(10) NOT NULL,
    numCamerino NUMBER 
);