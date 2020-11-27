/*CK_Pedidos_fecha*/ 

/*Tuplas NoOk*/
 /* La fecha de hora de incio en la que se crea el pedido, no puede ser mayor a la fecha de hora de finalizacion del pedido */
INSERT INTO Pedidos(noPedido, nombreCliente, fechaHoraini, fechaHorafin,noMesa) 
VALUES(395, 'Rick Rincon', TO_DATE('05/27/2019','MM/DD/YYYY'), TO_DATE('05/27/2018','MM/DD/YYYY'),01);


/*CK_AccesoTiempo_fecha*/
 /* La fecha de inicio sobre el acceso de un empleado a una zona, no puede ser mayor  a la fecha en cual finalizo dicho acceso.*/
INSERT INTO AccesoTiempo(idEmpleado, noZona, fechaInicio, fechaFin) 
VALUES(6016722,2,TO_DATE('05/27/2019','MM/DD/YYYY'), TO_DATE('05/27/2017','MM/DD/YYYY'));
