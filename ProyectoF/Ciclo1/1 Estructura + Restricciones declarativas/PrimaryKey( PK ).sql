----------------------------------------------------------------------------primary key (PK)

ALTER TABLE Proveedores 
ADD CONSTRAINT PK_Proveedores 
PRIMARY KEY (idProveedor); 


ALTER TABLE Empresas 
ADD CONSTRAINT PK_Empresas
PRIMARY KEY (idProveedor); 


ALTER TABLE PersonasNaturales 
ADD CONSTRAINT PK_PersonasNaturales 
PRIMARY KEY (idProveedor);



ALTER TABLE Compras
ADD CONSTRAINT PK_Compras
PRIMARY KEY (noCompra);


ALTER TABLE Insumos
ADD CONSTRAINT PK_Insumos
PRIMARY KEY (coInsumo);


ALTER TABLE CantidadInsumo 
ADD CONSTRAINT PK_CantidadInsumo
PRIMARY KEY (coInsumo,noCompra);


ALTER TABLE Productos
ADD CONSTRAINT PK_Productos
PRIMARY KEY (coProducto);


ALTER TABLE CantidadProducto
ADD CONSTRAINT PK_CantidadProducto
PRIMARY KEY (coProducto,noCompra);


ALTER TABLE Zonas
ADD CONSTRAINT PK_Zonas
PRIMARY KEY (noZona);


ALTER TABLE Sectores
ADD CONSTRAINT PK_Sectores
PRIMARY KEY (noSector);


ALTER TABLE Mesas
ADD CONSTRAINT PK_Mesas
PRIMARY KEY (noMesa);


ALTER TABLE Pedidos 
ADD CONSTRAINT PK_Pedidos
PRIMARY KEY (noPedido);


ALTER TABLE EstaEn
ADD CONSTRAINT PK_EstaEn
PRIMARY KEY (coProducto,noPedido);


ALTER TABLE Empleados
ADD CONSTRAINT PK_Empleados
PRIMARY KEY (idEmpleado);


ALTER TABLE AccesoTiempo
ADD CONSTRAINT PK_AccesoTiempo
PRIMARY KEY (idEmpleado,noZona);


ALTER TABLE FechaLaboral 
ADD CONSTRAINT PK_FechaLaboral
PRIMARY KEY (idEmpleado,noLabor);


ALTER TABLE Labores
ADD CONSTRAINT PK_Labores
PRIMARY KEY ( noLabor );


ALTER TABLE Despachos 
ADD CONSTRAINT PK_Despachos
PRIMARY KEY (noDesp);


ALTER TABLE sobreUna
ADD CONSTRAINT PK_sobreUna
PRIMARY KEY (noCompra,noDesp);

