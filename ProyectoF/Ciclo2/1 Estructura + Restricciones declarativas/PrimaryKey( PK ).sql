----------------------------------------------------------------------------primary key (PK)

ALTER TABLE Patrocinadores
ADD CONSTRAINT PK_Patrocinadores
PRIMARY KEY (nitPatrocinador ); 


ALTER TABLE fechaPatrocinio 
ADD CONSTRAINT PK_fechaPatrocinio
PRIMARY KEY (idPatrocinador,coEvento  ); 


ALTER TABLE Eventos 
ADD CONSTRAINT PK_Eventos
PRIMARY KEY (noEvento );



ALTER TABLE Boletas
ADD CONSTRAINT PK_Boletas
PRIMARY KEY (codigoBoleta );


ALTER TABLE Conciertos
ADD CONSTRAINT PK_Conciertos
PRIMARY KEY (noConcierto );


ALTER TABLE esAsignado 
ADD CONSTRAINT PK_esAsignado
PRIMARY KEY (numConcierto ,numCamerino );


ALTER TABLE Tiene 
ADD CONSTRAINT PK_Tiene
PRIMARY KEY (idArti ,noCon );


ALTER TABLE Camerinos
ADD CONSTRAINT PK_Camerinos
PRIMARY KEY (noCamerino );


ALTER TABLE seAbasteceCon
ADD CONSTRAINT PK_seAbasteceCon
PRIMARY KEY (numCamerino,coProduct  );

ALTER TABLE Artistas
ADD CONSTRAINT PK_Artistas
PRIMARY KEY (idArtista ); 

ALTER TABLE Zonas
ADD CONSTRAINT PK_Zonas
PRIMARY KEY (noZona);

 
ALTER TABLE Productos
ADD CONSTRAINT PK_Productos
PRIMARY KEY (coProducto);

