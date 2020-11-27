---------------------------------------------------------------------------- attributes ( CK )

ALTER TABLE  Proveedores
ADD CONSTRAINT CK_Proveedores_idProveedor 
CHECK( 
   idProveedor BETWEEN 1000000 AND 9999999
);

ALTER TABLE  Proveedores
ADD CONSTRAINT CK_Proveedores_nit 
CHECK( 
   nit >= 1111111111
);


ALTER TABLE Proveedores
ADD CONSTRAINT CK_Proveedores_tipoNit 
CHECK( 
   tipoNiT IN ('NT','CC')
);


ALTER TABLE Proveedores
ADD CONSTRAINT CK_Proveedores_telefono 
CHECK( 
   telefono BETWEEN 3000000000 AND 3999999999
);


ALTER TABLE  PersonasNaturales
ADD CONSTRAINT CK_PersonasNaturales_nombre
CHECK( 
   REGEXP_LIKE( nombre,'^[A-Za-z]* [A-Za-z]*$')
);

ALTER TABLE  PersonasNaturales
ADD CONSTRAINT CK_PersonasNaturales_correo
CHECK( 
   REGEXP_LIKE( correo,'^[A-Za-z0-9]*@[A-Za-z0-9]*.[A-Za-z]*$')
);

ALTER TABLE  Insumos
ADD CONSTRAINT CK_Insumos_coInsumo
CHECK( 
   REGEXP_LIKE( coInsumo, '^[A-Z]+-[0-9]+$')
);

ALTER TABLE  Productos
ADD CONSTRAINT CK_Productos_coProducto
CHECK( 
   coProducto BETWEEN 1000000 AND 9999999 
);


ALTER TABLE CantidadInsumo
 ADD CONSTRAINT Ck_CantidadInsumo
  CHECK (
          cantidad > 0 AND 
          precioCompra> 0
);


ALTER TABLE  CantidadProducto
ADD CONSTRAINT CK_CantidadProducto_cantidad
CHECK( 
   cantidad > 0
);


ALTER TABLE  CantidadProducto
ADD CONSTRAINT CK_CantidadProducto
CHECK( 
   precioCompra  > 0
);

ALTER TABLE  Zonas
ADD CONSTRAINT CK_Zonas_ubicacionZona
CHECK( 
   ubicacionZona IN ('O','N','S','E')
);

--se pueden volver trigger 

ALTER TABLE  EstaEn
ADD CONSTRAINT CK_EstaEn_cantidad
CHECK( 
   cantidad > 0
);

ALTER TABLE  Pedidos
ADD CONSTRAINT CK_Pedidos_nombreCliente
CHECK( 
   REGEXP_LIKE( nombreCliente,'^[A-Za-z]+ [A-Za-z]+$')
);

ALTER TABLE  Mesas
ADD CONSTRAINT CK_Mesas_estadoMesa
CHECK( 
   estadoMesa IN ('NA','AS','EA')
);

ALTER TABLE  Empleados
ADD CONSTRAINT CK_Empleados_idEmpleado
CHECK( 
   idEmpleado BETWEEN 1000000 AND 9999999
);

ALTER TABLE  Empleados
ADD CONSTRAINT CK_Empleados_nombreEmpleado
CHECK( 
   REGEXP_LIKE( nombreEmpleado,'^[A-Za-z]+ [A-Za-z]+$')
);

ALTER TABLE Empleados
ADD CONSTRAINT CK_Empleados_telefono 
CHECK( 
   telefono BETWEEN 3000000000 AND 3999999999
);

ALTER TABLE  sobreUna
ADD CONSTRAINT CK_sobreUna_cantidadDespachada
CHECK( 
   cantidadDespachada > 0
);




