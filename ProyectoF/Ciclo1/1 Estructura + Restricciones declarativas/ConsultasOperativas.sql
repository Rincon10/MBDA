/*
1)Consultar las mesas  aseadas en un sector especifico.
*/

SELECT 
         noSector,
         nombreSector,
         noMesa  
    FROM
        (SELECT 
              noSector AS noS,
              nombreSector 
        FROM Sectores ) S ,
        Mesas
    WHERE noS = noSector AND 
          estadoMesa = 'AS' AND 
          idEmpleado IS NOT NULL
ORDER BY noSector,noMesa ;

/*2)
Consultar los   Empleados  que tengan una  experiencia de mesero mayor a 2 años
*/

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
3)consultar los proovedor cuyos   productos son los mas solicitados del ultimo mes
*/

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
      
