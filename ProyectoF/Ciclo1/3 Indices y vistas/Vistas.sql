

/*1)Productos BC ( BC = Bajo Consumo )
Mostrar los 10 productos menos consumidos.*/

CREATE OR REPLACE VIEW ProductosBC
   AS SELECT 
        cP1, 
        nombreProducto,
        COUNT( cP1 ) AS Apariciones
      FROM 
        Productos 
        INNER JOIN 
        (SELECT coProducto AS cP1,
               noPedido AS noP1
        FROM EstaEn)  R
          ON cP1 = coProducto
      GROUP BY cP1,
              nombreProducto
      ORDER BY Apariciones;
      
/*
SELECT *
FROM ProductosBC
WHERE ROWNUM <= 10;*/

      

/*2)Mostar el numero de pedidos realizados por zonas */

CREATE OR REPLACE VIEW PedidosPorZ
   AS SELECT 
           noZ1 AS numeroZona ,
           nZ AS nombreZona,
           COUNT( noP1 ) AS pedidosTotales
       FROM
           (SELECT noZona AS noZ1,nombreZona AS nZ FROM   zonas ) Z ,
           (SELECT noSector AS noS1,noZona AS noZ2 FROM sectores) S,
           (SELECT noMesa AS noM1, noSector AS noS2 FROM mesas ) M,
           ( SELECT noPedido AS noP1, noMesa AS noM2 FROM Pedidos) P
           

        WHERE 
            noZ1 = noZ2 AND 
            noS1 = noS2 AND
            noM1 = noM2 
        GROUP BY 
           noZ1,
           nZ
         ORDER BY pedidosTotales ,noZ1;


/*3)Consultar las mesas libres y aseadas en un sector */

CREATE OR REPLACE VIEW MesasLibreS
  AS 
    SELECT 
         noSector,
         nombreSector,
         noMesa  
    FROM
        (SELECT noSector AS noS, nombreSector FROM Sectores ) S ,
        Mesas
    WHERE noS = noSector AND 
          estadoMesa = 'AS' AND 
          idEmpleado IS NULL
    ORDER BY noSector,noMesa; 
          

/*4)
Consultar los   Empleados  que tengan una  experiencia de mesero mayor a 2 años
*/

CREATE OR REPLACE VIEW empleadosCandidatos 
 AS 
   SELECT 
        DISTINCT 
        idE,
        nombreEmpleado,
        telefono
   FROM 
        (SELECT
               idEmpleado AS idE,
               nombreEmpleado, 
               telefono 
        FROM Empleados )  E ,
        FechaLaboral,
        ( SELECT 
               noLabor AS noL, 
               nombreLabor AS 
               nomL 
        FROM Labores ) L
        WHERE 
            idE = idEmpleado AND 
            noLabor = noL AND 
            nomL = 'Waiter' AND 
            FLOOR(ABS(TO_NUMBER(TO_CHAR( fechaFin ,'MM')) - TO_NUMBER(TO_CHAR( fechaInicio ,'MM')))/12) +  
			(TO_NUMBER(TO_CHAR( fechaFin ,'YYYY')) - TO_NUMBER(TO_CHAR( fechaInicio ,'YYYY'))) > 2;
  

/*

5)consultar los proovedor cuyos   productos son los mas solicitados del ultimo mes
*/

CREATE OR REPLACE VIEW ProveedoresPM AS 
SELECT   
     idProveedor,
	 tipoNit,
	 telefono,
	 nomP, 
	 Times
FROM
    ( SELECT  
            idProveedor, 
            tipoNit, 
            telefono 
      FROM Proveedores ) P,
    ( SELECT 
           noCompra AS noC, 
           idProveedor AS idP 
      FROM Compras ) C,
      CantidadProducto,
      (SELECT 
            coProducto AS coPro2 ,
            nombreProducto AS nomP
      FROM Productos)Prod,
     (SELECT 
           coPro ,
           COUNT( noPedido ) AS Times 
     FROM
         (SELECT 
               coProducto AS coPro,
               noPedido AS noP1 
          FROM EstaEn) P,
     Pedidos
     WHERE  
          noP1 = noPedido AND 
          TO_CHAR(SYSDATE ,'MM/YYYY') = TO_CHAR( fechaHorafin,'MM/YYYY')
     GROUP BY coPro ) Pro
     
     
WHERE idProveedor = idP AND 
      noC = noCompra AND  
      coProducto = coPro2 AND 
      coPro = coPro2
ORDER BY Times;
	 
    
  