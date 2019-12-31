/*Consultas Gerenciales*/

--Los posibles duos de un concierto.

CREATE OR REPLACE VIEW duoArtistas 
    AS
SELECT 
    A1.nombreArtistico AS Artista1,
    A2.nombreArtistico AS Artista2
FROM 
    Artistas  A1,
    Artistas  A2
WHERE A1.nombreArtistico <> A2.nombreArtistico AND
    A1.nombreArtistico < A2.nombreArtistico ;

/*Consultas Operativas*/
--consultar los gustos que tienen los artistas

CREATE OR REPLACE VIEW gustosA AS
SELECT
    numCamerino,
    nombreCamerino,
    nombreProducto
FROM 
    Artistas,
    XMLTABLE('//Producto'  
        PASSING Preferencias
        COLUMNS Producto  VARCHAR(40) PATH '@codigo'),
    Productos,
    Camerinos
    WHERE 
        noCamerino = numCamerino AND
        coProducto = Producto
        
ORDER BY numCamerino,nombreProducto;  

      
--consultar el nombre del camerino, disponibilidad y la  cantidad que se abastece de cada  producto
CREATE OR REPLACE VIEW reporteCamerinos
    AS
SELECT 
    numCamerino,
    nombreCamerino,
    disponibilidad
    nombreProducto,
    cantidad
FROM 
    Camerinos 
    INNER JOIN 
    seAbasteceCon
        ON noCamerino = numCamerino
    INNER JOIN 
    Productos 
        ON coProduct = coProducto
ORDER BY noCamerino,nombreProducto;

--consultar informacion de  patrocinadores  de los eventos del año actual

CREATE OR REPLACE VIEW InfPatro
  AS 
SELECT 
    razonSocial,
    correo,
    telefono,
    COUNT(coEvento) AS Times
FROM 
    Patrocinadores
    INNER JOIN
    fechaPatrocinio 
        ON idPatrocinador = nitPatrocinador
WHERE TO_CHAR(SYSDATE,'YYYY') = TO_CHAR(fecha,'YYYY')
GROUP  BY razonSocial,correo,telefono
ORDER BY Times DESC; 