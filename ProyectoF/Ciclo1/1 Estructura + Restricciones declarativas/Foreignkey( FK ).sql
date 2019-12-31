----------------------------------------------------------------------------foreign keys (FK)

ALTER TABLE PersonasNaturales
ADD CONSTRAINT FK_PersonasNat_idPro
FOREIGN KEY (idProveedor) REFERENCES Proveedores (idProveedor);

ALTER TABLE Empresas 
ADD CONSTRAINT FK_Empresa_idProveedor 
FOREIGN KEY (idProveedor ) REFERENCES Proveedores (idProveedor);

ALTER TABLE Empresas 
ADD CONSTRAINT FK_Empresa_idRepresentante
FOREIGN KEY (idRepresentante) REFERENCES PersonasNaturales(idProveedor);

ALTER TABLE Compras
ADD CONSTRAINT FK_Compras_idProveedor
FOREIGN KEY (idProveedor) REFERENCES Proveedores (idProveedor);

ALTER TABLE sobreUna 
ADD CONSTRAINT FK_sobreUna_noCompra
FOREIGN KEY (noCompra) REFERENCES Compras (noCompra);

ALTER TABLE sobreUna 
ADD CONSTRAINT FK_sobreUna_noDesp 
FOREIGN KEY (noDesp) REFERENCES Despachos (noDesp);

ALTER TABLE CantidadInsumo 
ADD CONSTRAINT FK_CantidadInsumo_coInsumo
FOREIGN KEY (coInsumo) REFERENCES Insumos (coInsumo);

ALTER TABLE CantidadInsumo 
ADD CONSTRAINT FK_CantidadInsumo_noCompra
FOREIGN KEY (noCompra) REFERENCES Compras (noCompra);

ALTER TABLE CantidadProducto 
ADD CONSTRAINT FK_CantidadProducto_coProducto
FOREIGN KEY (coProducto)REFERENCES Productos (coProducto);

ALTER TABLE CantidadProducto
ADD CONSTRAINT FK_CantidadProducto_noCompra
FOREIGN KEY (noCompra)REFERENCES Compras (noCompra);


ALTER TABLE Mesas
ADD CONSTRAINT FK_Mesas_idEmpleado
FOREIGN KEY (idEmpleado) REFERENCES Empleados (idEmpleado);

ALTER TABLE Mesas 
ADD CONSTRAINT FK_Mesas_noSector
FOREIGN KEY (noSector) REFERENCES Sectores (noSector);

ALTER TABLE Sectores 
ADD CONSTRAINT FK_Sectores_noZona
FOREIGN KEY (noZona) REFERENCES Zonas (noZona);

ALTER TABLE Despachos 
ADD CONSTRAINT FK_Despachos_noZona
FOREIGN KEY (noZona)REFERENCES Zonas (noZona);

ALTER TABLE AccesoTiempo 
ADD CONSTRAINT FK_AccesoTiempo_idEmpleado
FOREIGN KEY (idEmpleado) REFERENCES Empleados (idEmpleado);

ALTER TABLE AccesoTiempo 
ADD CONSTRAINT FK_AccesoTiempo_noZona
FOREIGN KEY (noZona) REFERENCES Zonas (noZona);

ALTER TABLE FechaLaboral 
ADD CONSTRAINT FK_FechaLaboral_idEmpleado
FOREIGN KEY (idEmpleado) REFERENCES Empleados (idEmpleado);

ALTER TABLE FechaLaboral 
ADD CONSTRAINT FK_FechaLaboral_noLabor
FOREIGN KEY (noLabor) REFERENCES Labores (noLabor);

ALTER TABLE Pedidos
ADD CONSTRAINT FK_Pedidos_noMesa
FOREIGN KEY (noMesa) REFERENCES Mesas (noMesa);

ALTER TABLE EstaEn
ADD CONSTRAINT FK_EstaEn_noPedido
FOREIGN KEY (noPedido) REFERENCES Pedidos (noPedido);

ALTER TABLE EstaEn
ADD CONSTRAINT FK_esta_en_coProducto 
FOREIGN KEY (coProducto) REFERENCES Productos (coProducto);


