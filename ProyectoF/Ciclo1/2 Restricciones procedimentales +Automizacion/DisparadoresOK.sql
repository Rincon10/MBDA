/*MESAS*/

/*Generar de forma automatica el numero de la mesa*/
insert into Mesas 
 ( estadoMesa, noSector , idEmpleado ) values ('EA', 313, 8456153);

/*Lo unico que se puede modificar de la informacion de la mesa es su estado y el empleado encargado a esta*/

UPDATE Mesas
 SET noMesa = 1, estadoMesa = 'AS' , noSector = 313 , idEmpleado = 8456153
WHERE noMesa = 1;


/*PEDIDOS*/

/*si no se especifica la fecha de generacion del pedido esta se debe generar de forma automatica.*/

insert into Pedidos (noPedido, nombreCliente,  fechaHorafin, noMesa)
 values (994, 'Camilo Rincon', TO_DATE('2020/09/03 21:13:42','YYYY/MM/DD HH24:MI:SS'), 503);

/* si no se indica el numero del pedido, este se debe generar de forma automatica.*/

insert into Pedidos ( nombreCliente, fechaHoraini, fechaHorafin, noMesa) 
 values ( 'Jeisson Otalvaro', TO_DATE('2017/09/03 21:13:42','YYYY/MM/DD HH24:MI:SS'), TO_DATE('2017/09/03 21:13:42','YYYY/MM/DD HH24:MI:SS'), 503);

/* unicamente se pueden actualizar los productos, fechaHorafin y la cantidad de estos de un pedido ya realizado */

UPDATE Pedidos 
 SET noPedido = 994, nombreCliente = 'Camilo Rincon', fechaHoraini = TO_DATE('2017/09/03 21:13:42','YYYY/MM/DD HH24:MI:SS') ,  fechaHorafin = NULL, noMesa = 503 
WHERE noPedido = 994 ;

/*DESPACHOS*/

/*si no se coloca el numero del despacho, se genera de forma automatica */
insert into Despachos (noDesp , noZona ) values (1, 143);

/*no se puede modificar la informacion de los despachos. */

/* AccesoTiempo */
/*Lo unico que se puede modificar en el acceso tiempo  es la fecha en la que termino dicho acceso*/

UPDATE AccesoTiempo
 SET idEmpleado = 9548859 , noZona = 299 , fechaInicio = TO_DATE('09/19/2015','MM/DD/YYYY') , fechaFin = TO_DATE('07/24/2017','MM/DD/YYYY')
WHERE idEmpleado = 9548859 ;

/* lo unico que se puede modificar de los empleados es su numero de telefono.*/

UPDATE Empleados 
 SET idEmpleado = 2302931, nombreEmpleado = 'Lissy Fellis', telefono =  3213238959
WHERE idEmpleado = 2302931;

/*INSUMOS*/
/*si no se ingresa el codigo de insumo este se debe generar de forma automatica, tomando las dos primeras letras del nombre en mayuscula seguido de el caracter '-' y por ultimo 4 numeros aleatorios*/

insert into Insumos ( nombreInsumo )
  values ( 'Carne de vaca');
  
/*No se puede modificar nada de un insumo */

UPDATE Insumos
 SET coInsumo = 'KS-2259', nombreInsumo = 'Wine - Fume Blanc Fetzer'
WHERE coInsumo = 'KS-2259' ;

/*PROVEEDORES*/
/*Si no se especifica el tipoNit se asume que es tipo empresa */

INSERT INTO Proveedores (idProveedor , nit,telefono)
 VALUES (1234567,1234567123,3142139501);

/* Lo unico que se puede modificar en los proveedores es su telefono.*/

UPDATE Proveedores 
  SET idProveedor = 1234567 , nit= 1234567123, tipoNit = 'NT', telefono = 3212139501
WHERE idProveedor = 1234567;

/*EMPRESAS*/
/* Lo Unico que puede actualizarce en las empresas son los representantes */


UPDATE Empresas 
SET idProveedor = 6619911  ,idRepresentante = 6114698 , razonSocial = 'Kayveo'
WHERE idProveedor = 6619911 ;

/*PERSONAS NATURALES*/
/*Si no se ingresa el correo , este se generara con las primeras 5 letras del primer nombre y se le añadira 3 numeros al azar junto a @mail.com*/

insert into Proveedores (idProveedor , nit, tipoNit,telefono) 
 values (7654322, 7123456789, 'CC',3115276998 );

insert into PersonasNaturales   (idProveedor  , nombre) 
 values (7654322, 'Karen Escolar');

/*COMPRAS*/
/*EL numero de la compra se genera automaticamente */

insert into Compras  ( fechaCompra, idProveedor)
 values (TO_DATE('02/12/2016','MM/DD/YYYY') , 7654322);
 




/*PRODUCTOS*/
/*si no se ingresa el codigo del producto este se generara de forma automatica, generando un numero al azar */

insert into Productos ( nombreProducto) values ( 'Gaseosa');

/*ZONAS */

insert into Zonas (nombreZona , ubicacionZona ) values ( 'Colorida','O');

/*SECTORES*/

insert into Sectores  ( nombreSector, noZona) values ('Vip',1);

/*LABORES*/
insert into Labores  (nombreLabor) values ('Mesero');
