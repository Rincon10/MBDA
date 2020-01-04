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





/*
1.)
a.)
*/
DESCRIBE  MBDA.MIEMBROS;

SELECT *
FROM  MBDA.MIEMBROS;

/*
b.)
*/


INSERT INTO  MBDA.MIEMBROS   
   VALUES ('CE',1032501576,'Colombia','fabimauri47@hotmail.com', NULL, 'Fabian Ramirez',NULL, 4);


INSERT INTO MBDA.MIEMBROS
   VALUES('CE',1003823076,'Colombia','camilorincon@hotmail.com', NULL, 'Ivan Rincon',NULL, NULL);



/*
c.)

*/

DELETE FROM MBDA.MIEMBROS   
WHERE NOMBRES = 'Fabian Ramirez';

UPDATE MBDA.MIEMBROS   SET  NOMBRES = 'CAMCSLMCA MDSAKDSA'
WHERE NOMBRES = 'Fabian Ramirez';
/*
NO SE TIENEN LOS PERMISOS O PRIVILEGIOS NECESARIOS PARA REALIZAR UNA ELIMINACION O MODIFICACION
/*
d.)
*/

GRANT UPDATE 
ON MBDA.MIEMBROS   
TO bd2159820, bd2132306 ;


GRANT DELETE 
ON MBDA.MIEMBROS   
TO bd2159820, bd2132306 ;
/*e*/
/*Revisar el archivo vistas*/

INSERT INTO Miembros
   SELECT  
        C,
       TIPO,
       NUMERO,
       PAIS,
       CORREO
   FROM V_Miembros;


INSERT INTO Personas 
SELECT *
FROM V_Personas;


INSERT INTO Ciclistas
    SELECT 
        C,
        TO_DATE(NACIMIENTO,'YYYY-MM-DD'),
        CATEGORIA
    FROM V_Ciclistas
    WHERE LENGTH( NACIMIENTO ) = 10;
    
/*F*/

--se encuentra en el Astah

DELETE 
FROM Miembros;

DELETE 
FROM  Personas;

DELETE 
FROM Ciclistas;
