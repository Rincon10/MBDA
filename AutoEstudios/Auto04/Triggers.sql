--Triggers
--AD

/*El número se genera automáticamente de forma consecutiva.*/

/* Disparadores */
CREATE OR REPLACE TRIGGER Ad_MUSICIAN_tIncrementBI
BEFORE INSERT ON musician
FOR EACH ROW 
DECLARE 
cont NUMBER;
BEGIN
 IF :new.m_no IS NULL 
 THEN
  SELECT COALESCE( MAX( m_no ), -1 )+ 1 INTO cont 
  FROM musician;
  :new.m_no := cont;
 END IF;

END Ad_MUSICIAN_tIncrementBI;
/
/* DisparadoresOK */
INSERT INTO musician ( m_name, born, died, born_in, living_in )
VALUES('Pedro Camboa',TO_DATE(' 1960/05/12','YYYY/MM/DD'),NULL,5,5);

INSERT INTO musician 
( m_name, born, died, born_in, living_in ) 
VALUES('Sebastian Yatra',TO_DATE(' 1980/07/12','YYYY/MM/DD'),NULL,5,5);

INSERT INTO musician ( m_name, born, died, born_in, living_in ) 
VALUES('J Balvin',TO_DATE(' 1980/02/11','YYYY/MM/DD'),NULL,4,5);
/* DisparadoresNoOK */

/* Xdisparadores */
DROP TRIGGER Ad_MUSICIAN_tIncrementBI;



/*La ciudad en la que vive por omisión es la ciudad de nacimiento.*/

/* Disparadores */
CREATE TRIGGER Ad_MUSICIAN_tCityBI
BEFORE INSERT ON musician 
FOR EACH ROW

BEGIN 
 IF :new.living_in IS NULL 
  THEN :new.living_in := :new.born_in ;
 END IF;
END Ad_MUSICIAN_tCityBI
;
/
/* DisparadoresOK */
INSERT INTO musician ( m_no,m_name, born, died, born_in) 
VALUES(28,'Shakira Eci',TO_DATE(' 1968/07/19','YYYY/MM/DD'),NULL,5);

INSERT INTO musician ( m_no,m_name, born, died, born_in) 
VALUES(29,'Daddy Yankee',TO_DATE(' 1988/04/13','YYYY/MM/DD'),NULL,2);

INSERT INTO musician ( m_no,m_name, born, died, born_in) 
VALUES(30,'Andres Cepeda',TO_DATE(' 1985/05/14','YYYY/MM/DD'),NULL,4);

/* DisparadoresNoOK */

/* Xdisparadores */
DROP TRIGGER Ad_MUSICIAN_tCityBI;


/*Los compositores sólo pueden componer un tipo de música */

/* Disparadores */
CREATE OR REPLACE TRIGGER Ad_COMPOSER_tcompBI
BEFORE INSERT ON composer 
FOR EACH ROW
DECLARE 
contT NUMBER;
BEGIN
 SELECT
   COUNT( comp_type ) INTO contT 
 FROM composer
 WHERE  comp_is = :new.comp_is ;
 
 IF contT = 1  
  THEN RAISE_application_error(-20007,'El compositor solo puede componer un tipo de musica.');
 END IF;
END Ad_COMPOSER_tcompBI ;
/
/* DisparadoresOK */
-- los acepta porque ninguno era compositor y por ende no tenia tipo  de composicion.
INSERT INTO composer(comp_no, comp_is, comp_type)
VALUES(14,2,'rock');

INSERT INTO
composer(comp_no, comp_is, comp_type)
VALUES(15,4,'rock');

INSERT INTO composer(comp_no, comp_is, comp_type)
VALUES(16,6,'rock');

/* DisparadoresNoOK */
--el compositor 1,3,5 ya tienen un tipo de musica 
INSERT INTO composer(comp_no, comp_is, comp_type)
VALUES(14,1,'rock');

INSERT INTO
composer(comp_no, comp_is, comp_type)
VALUES(15,3,'rock');

INSERT INTO composer(comp_no, comp_is, comp_type)
VALUES(16,5,'rock');

/* Xdisparadores */
DROP TRIGGER Ad_COMPOSER_tcompBI; 

/* los interpretes pueden tocar máximo tres instrumentos.*/

/* Disparadores */
CREATE OR REPLACE TRIGGER  Ad_PERFORMER_tPerformerBI
BEFORE INSERT ON performer
FOR EACH ROW
DECLARE 
cont NUMBER ;
BEGIN
 SELECT COUNT( instrument ) INTO cont 
 FROM performer
 WHERE :new.perf_is  = perf_is ;
 
IF cont = 3 
  THEN RAISE_application_error(-20007,'los interpretes pueden tocar máximo tres instrumentos.');
 END IF;
END Ad_PERFORMER_tPerformerBI;
/

/* DisparadoresOK */
INSERT INTO performer(perf_no, perf_is, instrument, perf_type)
VALUES (31,1,'horn','jazz');

INSERT INTO performer(perf_no, perf_is, instrument, perf_type)
VALUES (32,9,'horn','jazz');

INSERT INTO performer(perf_no, perf_is, instrument, perf_type) 
VALUES (33,11,'horn','jazz');

/* DisparadoresNoOK */
-- cada performer ya tiene 3 insturmentos como maximo
INSERT INTO performer(perf_no, perf_is, instrument, perf_type)
VALUES (31,2,'horn','jazz');

INSERT INTO performer(perf_no, perf_is, instrument, perf_type)
VALUES (32,8,'horn','jazz');

INSERT INTO performer(perf_no, perf_is, instrument, perf_type) 
VALUES (33,12,'horn','jazz');
/* Xdisparadores */
DROP TRIGGER Ad_PERFORMER_tPerformerBI;


/*Si no se indica el tipo de música de un compositor, se supone que el tipo de música que
sabe interpretar (si solamente es uno)*/

/* Disparadores */
CREATE OR REPLACE TRIGGER Ad_COMPOSER_tComposerBI
BEFORE INSERT ON composer
FOR EACH ROW

DECLARE 
cadena VARCHAR(10);

cont NUMBER; 
BEGIN 
 SELECT COUNT(perf_type) INTO cont FROM performer
 WHERE :new.comp_is = perf_is;
 IF cont = 1 AND :new.comp_type IS NULL
 
 THEN SELECT perf_type INTO cadena FROM performer WHERE :new.comp_is = perf_is;
  :new.comp_type := cadena;
  ELSE raise_application_error(-20050,'Hay mas de un tipo');
  
  END IF;

END Ad_COMPOSER_tComposerBI;
/
/* DisparadoresOK */
-- los  compositores 3,5,7 tiene solo 1 tipo de perf_type y es por eso que los deja agregar
INSERT INTO composer(comp_no, comp_is) 
VALUES(17,3);

INSERT INTO composer(comp_no, comp_is) 
VALUES(18,7);

INSERT INTO composer(comp_no, comp_is) 
VALUES(19,5);

/* DisparadoresNoOK */
-- los  compositores 8,10 no deja ya que tienen 3 y 2  tipos de perf_type respectivamente.
INSERT INTO composer(comp_no, comp_is)
VALUES(17,8);

INSERT INTO composer(comp_no, comp_is)
VALUES(18,10);

/* Xdisparadores */
DROP TRIGGER Ad_COMPOSER_tComposerBI;
--EL--
/*Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos.*/

--CREATE OR REPLACE TRIGGER El_MUSICIAN_tNocomposBD
--BEFORE DELETE ON musician 
--FOR EACH ROW 
--DECLARE 
--compo NUMBER 
--org NUMBER;

--BEGIN 
 --SELECT COUNT( * ) INTO org 
 --FROM concert 
 --WHERE :old.m_no = concert_orgniser;
 
 
 --SELECT COUNT( cmpn_no ) INTO compo
 --FROM has_composed  INNER JOIN  composer 
-- ON cmpr_no = comp_no;
 --WHERE :old.m_no = comp_is ;
 
 --IF compo > 0 OR org > 0 
  --THEN RAISE_application_error(-20099,'No se puede elinar el musico ya que  tiene composiciones o  figura como un organizador de concierto.');
 --END IF;

--END El_MUSICIAN_El_MUSICIAN_tNocomposBD;
--/
--DROP TRIGGER El_MUSICIAN_tNocomposBD;
--Mo

/*No es posible modificar ninguno de los datos que ya tiene valor salvo el sitio donde vive el músico y la fecha de muerte.*/
/* Disparadores */
CREATE OR REPLACE TRIGGER  Mo_MUSICIAN_tNomodBU
BEFORE UPDATE ON musician 
FOR EACH ROW
BEGIN
 IF ( :old.m_no <> :new.m_no ) OR ( :old.m_name <> :new.m_name ) OR ( :new.born <> :old.born ) OR  ( :old.born_in <> :new.born_in )
  THEN RAISE_application_error(-20152,'No se pueden modificar las columnas (m_no, m_name, born, born_in ');
  
 ELSE 
  :new.died := :new.died;
  :new.living_in := :new.living_in;
 END IF ;
END Mo_MUSICIAN_tNomodBU;
/

/* DisparadoresOK */
UPDATE musician
SET m_no = 1, 
    m_name = 'Fred Bloggs', 
    born = TO_DATE('1948/01/02','YYYY/MM/DD'),
    died = TO_DATE('2018/01/02','YYYY/MM/DD'),
    born_in = 1, 
    living_in = 8
WHERE m_no = 1;

UPDATE musician
SET m_no = 2, 
    m_name = 'John Smith', 
    born = TO_DATE('1950/03/03','YYYY/MM/DD'),
    died = NULL,
    born_in = 3, 
    living_in = 1
WHERE m_no = 2;

UPDATE musician
SET m_no = 3, 
    m_name = 'Helen Smyth', 
    born = TO_DATE('1948/08/08','YYYY/MM/DD'),
    died = TO_DATE('2019/08/08','YYYY/MM/DD'),
    born_in = 4, 
    living_in = 3
WHERE m_no = 3;

/* DisparadoresNoOK */

--se modifica el nombre
UPDATE musician
SET m_no = 1, 
    m_name = 'Camilo Rincon', 
    born = TO_DATE('1948/01/02','YYYY/MM/DD'),
    died = TO_DATE('2018/01/02','YYYY/MM/DD'),
    born_in = 1, 
    living_in = 8
WHERE m_no = 1;

--se modifica born_in
UPDATE musician
SET m_no = 2, 
    m_name = 'John Smith', 
    born = TO_DATE('1950/03/03','YYYY/MM/DD'),
    died = NULL,
    born_in = 8, 
    living_in = 1
WHERE m_no = 2;

--se modifica la fecha de nacimiento 
UPDATE musician
SET m_no = 3, 
    m_name = 'Helen Smyth', 
    born = TO_DATE('1244/08/08','YYYY/MM/DD'),
    died = TO_DATE('2019/08/08','YYYY/MM/DD'),
    born_in = 3, 
    living_in = 5
WHERE m_no = 3;
/* Xdisparadores */
DROP TRIGGER Mo_MUSICIAN_tNomodBU;