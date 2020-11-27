/*ConsultasOperativas*/

--consultar los gustos que tienen los artistas
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

SELECT 
    numCamerino,
    nombreCamerino,
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