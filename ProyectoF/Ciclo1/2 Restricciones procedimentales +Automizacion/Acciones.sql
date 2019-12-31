ALTER TABLE PersonasNaturales
DROP CONSTRAINT FK_PersonasNat_idPro ;

ALTER TABLE Empresas 
DROP CONSTRAINT FK_Empresa_idRepresentante ;

ALTER TABLE Empresas 
DROP CONSTRAINT FK_Empresa_idProveedor ;

ALTER TABLE Compras 
DROP CONSTRAINT FK_Compras_idProveedor ;

ALTER TABLE EstaEn 
DROP CONSTRAINT FK_EstaEn_noPedido ;

ALTER TABLE Mesas 
DROP CONSTRAINT FK_Mesas_idEmpleado ;

ALTER TABLE AccesoTiempo 
DROP CONSTRAINT FK_AccesoTiempo_idEmpleado ;

ALTER TABLE FechaLaboral 
DROP CONSTRAINT FK_FechaLaboral_idEmpleado ;




/*Acciones*/ 

ALTER TABLE PersonasNaturales
ADD CONSTRAINT FK_PersonasNat_idPro 
FOREIGN KEY (idProveedor) REFERENCES Proveedores (idProveedor) ON DELETE CASCADE;


ALTER TABLE Empresas 
ADD CONSTRAINT FK_Empresa_idProveedor 
FOREIGN KEY (idProveedor ) REFERENCES Proveedores (idProveedor)ON DELETE CASCADE;

ALTER TABLE Empresas 
ADD CONSTRAINT FK_Empresa_idRepresentante
FOREIGN KEY (idRepresentante) REFERENCES PersonasNaturales(idProveedor)ON DELETE CASCADE;

ALTER TABLE Compras
ADD CONSTRAINT FK_Compras_idProveedor
FOREIGN KEY (idProveedor) REFERENCES Proveedores (idProveedor)ON DELETE SET NULL;

ALTER TABLE EstaEn
ADD CONSTRAINT FK_EstaEn_noPedido
FOREIGN KEY (noPedido) REFERENCES Pedidos (noPedido) ON DELETE CASCADE ;

ALTER TABLE Mesas
ADD CONSTRAINT FK_Mesas_idEmpleado
FOREIGN KEY (idEmpleado) REFERENCES Empleados (idEmpleado)ON  DELETE SET NULL;


ALTER TABLE AccesoTiempo 
ADD CONSTRAINT FK_AccesoTiempo_idEmpleado
FOREIGN KEY (idEmpleado) REFERENCES Empleados (idEmpleado)ON DELETE CASCADE;


ALTER TABLE FechaLaboral 
ADD CONSTRAINT FK_FechaLaboral_idEmpleado
FOREIGN KEY (idEmpleado) REFERENCES Empleados (idEmpleado)ON DELETE CASCADE;







