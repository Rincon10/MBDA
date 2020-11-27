/*CK_Pedidos_fecha*/

INSERT INTO Pedidos(noPedido,  nombreCliente,  fechaHoraini,fechaHorafin, noMesa)
 VALUES(394, 'Rick Bernal', TO_DATE('05/27/2018','MM/DD/YYYY'), TO_DATE('05/27/2019','MM/DD/YYYY'),01);

/*CK_AccesoTiempo_fecha*/

INSERT INTO AccesoTiempo(idEmpleado, noZona, fechaInicio, fechaFin) 
VALUES(6016722,1, TO_DATE('02/15/2015','MM/DD/YYYY'), TO_DATE('02/15/2016','MM/DD/YYYY'));
