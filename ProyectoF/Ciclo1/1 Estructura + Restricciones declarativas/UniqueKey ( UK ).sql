----------------------------------------------------------------------------unique key (UK)
ALTER TABLE Proveedores 
ADD CONSTRAINT UK_Proveedores 
UNIQUE (nit);


ALTER TABLE PersonasNaturales
ADD CONSTRAINT UK_correo
UNIQUE( correo );


ALTER TABLE Insumos
ADD CONSTRAINT UK_Insumos
UNIQUE (nombreInsumo);

ALTER TABLE Productos
ADD CONSTRAINT UK_Productos
UNIQUE (nombreProducto);

ALTER TABLE Zonas
ADD CONSTRAINT UK_Zonas
UNIQUE (nombreZona);


ALTER TABLE Labores
ADD CONSTRAINT UK_Labor 
UNIQUE( nombreLabor );


