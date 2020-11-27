/*MESAS*/

/*Generar de forma automatica el numero de la mesa
No hay forma de causar error*/

/*Lo unico que se puede modificar de la informacion de la mesa es su estado y el empleado encargado a esta;

Al cambiar el numero de sector esto causa que se active el trigger y no deje actualizar */

UPDATE Mesas
 SET noMesa = 1, estadoMesa = 'AS' , noSector = 318 , idEmpleado = 8456153
WHERE noMesa = 1;



/*PEDIDOS*/

/*si no se especifica la fecha de generacion del pedido esta se debe generar de forma automatica.
No hay forma de causar Error*/

/* si no se indica el numero del pedido, este se debe generar de forma automatica.
No hay forma de causar Error*/

/* unicamente se pueden actualizar los productos, fechaHorafin y la cantidad de estos de un pedido ya realizado 
Se a modificado el numero del pedido y la fecha inicio que se genero*/

UPDATE Pedidos 
 SET noPedido = 1000, nombreCliente = 'Camilo Rincon', fechaHoraini = TO_DATE('2017/09/05 21:13:42','YYYY/MM/DD HH24:MI:SS') ,  fechaHorafin = NULL, noMesa = 503 
WHERE noPedido = 994 ;


/*DESPACHOS*/
/*no se puede modificar la informacion de los despachos. */

/* AccesoTiempo */
/*Lo unico que se puede modificar en el acceso tiempo  es la fecha en la que termino dicho acceso
Se modifico la fecha en la cual se inicio el permiso de acceso.*/

UPDATE AccesoTiempo
 SET idEmpleado = 9548859 , noZona = 299 , fechaInicio = TO_DATE('09/10/2015','MM/DD/YYYY') , fechaFin = TO_DATE('07/24/2017','MM/DD/YYYY')
WHERE idEmpleado = 9548859 ;

/* lo unico que se puede modificar de los empleados es su numero de telefono.
se cambio el nombre del empleado*/

UPDATE Empleados 
 SET idEmpleado = 2302931, nombreEmpleado = 'Alejandra Rincon', telefono =  3213238959
WHERE idEmpleado = 2302931;

/*INSUMOS*/
/*si no se ingresa el codigo de insumo este se debe generar de forma automatica, tomando las dos primeras letras del nombre en mayuscula seguido de el caracter '-' y por ultimo 4 numeros aleatorios
No hay forma de causar Error*/

/*No se puede modificar nada de un insumo 
se cambio el codigo del producto y el nombre*/

UPDATE Insumos
 SET coInsumo = 'KS-4344', nombreInsumo = 'Wine - fdf Fetzer'
WHERE coInsumo = 'KS-2259';

/*Unicamente se pueden eliminar los insumos que no aparezcan en una compra */

DELETE FROM Insumos
WHERE coInsumo = 'KS-2259' ;

/*PROVEEDORES*/
/*Si no se especifica el tipoNit se asume que es tipo empresa 
No hay forma que cause error */

/* Lo unico que se puede modificar en los proveedores es su telefono.
en este caso se esta actualizando el nit del proovedor por lo cual causara que se active el trigger .*/

UPDATE Proveedores 
  SET idProveedor = 1234567 , nit= 2222567123, tipoNit = 'NT', telefono = 3212139501
WHERE idProveedor = 1234567;

/*EMPRESAS*/
/* Lo Unico que puede actualizarce en las empresas son los representantes 
no se puede actualizar el nombre de la compañia */

UPDATE Empresas 
SET idProveedor = 5758890 ,idRepresentante = 8942702 , razonSocial = 'googlefe'
WHERE idProveedor = 5758890 ;

/*PERSONAS NATURALES*/
/*Si no se ingresa el correo , este se generara con las primeras 5 letras del primer nombre y se le añadira 3 numeros al azar junto a @mail.com
no hay forma de causar error */

/*COMPRAS*/

/*EL numero de la compra se genera automaticamente 
No hay forma de generar error.*/

/*Si no se especifica la fecha de la compra se asignara de forma automatica 
No hay forma de generar error.*/

/*una compra se puede eliminar si ya paso mas de 5 meses desde que se realizo*/

/*PRODUCTOS*/
/*si no se ingresa el codigo del producto este se generara de forma automatica, generando un numero al azar 
no hay forma de causar error */
