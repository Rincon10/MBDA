CREATE INDEX IndFechaPedido
   ON Pedidos (   
               fechaHoraFin 			
);
  
CREATE INDEX IndEstadoMesa
    ON Mesas(
	           estadoMesa
);



CREATE  INDEX  IndNombreEmpleado
   ON Empleados ( 
                 nombreEmpleado
);
   
 

CREATE  INDEX  IndFechaFin
   ON FechaLaboral( 
                fechaFin
);