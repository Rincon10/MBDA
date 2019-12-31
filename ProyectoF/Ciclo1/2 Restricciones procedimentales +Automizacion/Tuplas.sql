/*Tuplas*/

ALTER TABLE Pedidos 
 ADD CONSTRAINT CK_Pedidos_fecha
 CHECK(fechaHoraini<=fechaHorafin
);
 

ALTER TABLE AccesoTiempo 
  ADD CONSTRAINT CK_AccesoTiempo_fecha
  CHECK(fechaInicio <= fechaFin
);


