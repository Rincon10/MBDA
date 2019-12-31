/*Consulta para el CRUD Registros*/

CREATE VIEW  SeccionesDescenso AS 
    SELECT *   
    FROM Registros,
         XMLTABLE( '//Secciones/Sdescenso[@kilometroInicial]'
                  PASSING revision
                  COLUMNS segDesc VARCHAR(3) PATH  '@kilometroInicial' )
    WHERE segDesc IS NOT NULL;
    
/*Extendiendo. Contenidos. Punto e*/
CREATE VIEW V_Miembros_P AS
SELECT DISTINCT *
   FROM MBDA.MIEMBROS
   WHERE PAIS IS NOT NULL AND 
        NUMERO >=1111111111 AND 
        LENGTH( CORREO ) <= 30 AND 
        LENGTH( PAIS ) <= 15  ;


CREATE VIEW V_Miembros AS
SELECT 
    ROWNUM AS C,
    TIPO,
    NUMERO,
    PAIS,
    CORREO,
    RAZON,
    NOMBRES,
    NACIMIENTO,
    CATEGORIA
FROM V_Miembros_P;

CREATE VIEW V_Personas AS 

SELECT 
    C AS CC,
    NOMBRES
FROM 
    V_Miembros
    INNER JOIN 
    Miembros
       ON idn = NUMERO 
    WHERE  NOMBRES IS NOT NULL AND
           RAZON IS NULL ;


CREATE VIEW V_Empresas AS 
SELECT 
    C,
    RAZON,
    NUMERO
    
FROM 
    V_Miembros
    INNER JOIN 
    Miembros
       ON idn = NUMERO 
    WHERE  NOMBRES IS NOT NULL AND
           RAZON IS NOT  NULL ;

CREATE VIEW V_Ciclistas AS
SELECT  
    *
FROM 
    V_Personas
    NATURAL JOIN 
    V_Miembros 
    
WHERE 
    C = CC AND 
    nacimiento IS NOT NULL AND
    categoria IS NOT NULL;
    
    
    