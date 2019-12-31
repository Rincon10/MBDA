/*foreign keys (FK)*/

ALTER TABLE fechaPatrocinio
ADD CONSTRAINT FK_fechaPatrocinio_p
FOREIGN KEY (idPatrocinador ) REFERENCES Patrocinadores (nitPatrocinador );

ALTER TABLE fechaPatrocinio
ADD CONSTRAINT FK_fechaPatrocinio_e
FOREIGN KEY (coEvento   ) REFERENCES Eventos (noEvento );

ALTER TABLE Boletas 
ADD CONSTRAINT FK_Boletas_z
FOREIGN KEY (noZona) REFERENCES Zonas  (noZona);


ALTER TABLE Boletas 
ADD CONSTRAINT FK_Boletas_e
FOREIGN KEY (numEvento  ) REFERENCES Eventos (noEvento );


ALTER TABLE Conciertos 
ADD CONSTRAINT FK_Conciertos
FOREIGN KEY (nuEvento  ) REFERENCES Eventos (noEvento );

ALTER TABLE esAsignado
ADD CONSTRAINT FK_esAsignado_co
FOREIGN KEY (numConcierto ) REFERENCES Conciertos (noConcierto);


ALTER TABLE esAsignado
ADD CONSTRAINT FK_esAsignado_ca
FOREIGN KEY (numCamerino  ) REFERENCES Camerinos (noCamerino );


ALTER TABLE Tiene
ADD CONSTRAINT FK_Tiene_a
FOREIGN KEY (idArti ) REFERENCES Artistas (idArtista);

ALTER TABLE Tiene
ADD CONSTRAINT FK_Tiene_c
FOREIGN KEY (noCon ) REFERENCES Conciertos (noConcierto);


ALTER TABLE seAbasteceCon 
ADD CONSTRAINT FK_seAbasteceCon_c
FOREIGN KEY (numCamerino ) REFERENCES Camerinos(noCamerino  );


ALTER TABLE seAbasteceCon 
ADD CONSTRAINT FK_seAbasteceCon_p
FOREIGN KEY (coProduct  ) REFERENCES Productos  (coProducto );


ALTER TABLE Artistas 
ADD CONSTRAINT FK_Artistas
FOREIGN KEY (numCamerino) REFERENCES Camerinos (noCamerino );
