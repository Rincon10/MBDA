/*unique key (UK)*/


ALTER TABLE Patrocinadores 
ADD CONSTRAINT UK_Patrocinadores_r
UNIQUE (razonSocial);


ALTER TABLE Patrocinadores 
ADD CONSTRAINT UK_Patrocinadores_c
UNIQUE (correo  );


ALTER TABLE Eventos
ADD CONSTRAINT UK_Eventos
UNIQUE (nomEvento);



ALTER TABLE Productos
ADD CONSTRAINT UK_Productos
UNIQUE (nombreProducto);


ALTER TABLE Zonas
ADD CONSTRAINT UK_Zonas
UNIQUE (nombreZona);