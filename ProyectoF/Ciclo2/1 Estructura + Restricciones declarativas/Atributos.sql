/*attributes ( CK )*/

/*Patrocinador */
--TipoNit

ALTER TABLE  Patrocinadores
ADD CONSTRAINT CK_Patrocinador_nit
CHECK( 
   nitPatrocinador >= 1111111111
);


--TipoCorreo
ALTER TABLE  Patrocinadores
ADD CONSTRAINT CK_Patrocinador_correo
CHECK( 
   REGEXP_LIKE( correo,'^[A-Za-z0-9]*@[A-Za-z0-9]*.[A-Za-z]*$')
);


--tTtelefono
ALTER TABLE  Patrocinadores
ADD CONSTRAINT CK_Patrocinador_telefono
CHECK(  
    telefono BETWEEN 3000000000 AND 3999999999
   
);


/*Eventos*/

--Cantidad
ALTER TABLE  Eventos
ADD CONSTRAINT CK_Eventos_valorEvento
CHECK( 
   valorEvento >= 0
);


--Tcategoria
ALTER TABLE Boletas
ADD CONSTRAINT CK_Boletas
CHECK( 
   REGEXP_LIKE(codigoBoleta, '^[A-Z]*-[0-9]' )
);

ALTER TABLE Boletas
ADD CONSTRAINT CK_Boletas_categoria
CHECK( 
   categoria IN ('General','Platino','VIP')
);


/*Camerinos*/

--Tdisponibilidad
ALTER TABLE Camerinos
ADD CONSTRAINT CK_Camerinos
CHECK( 
   disponibilidad BETWEEN 0 AND 3
);


--Cantidad
ALTER TABLE  seAbasteceCon
ADD CONSTRAINT CK_seAbasteceCon
CHECK( 
   cantidad >= 0
);


/*Artistas*/

--Tconsecutivo

ALTER TABLE  Artistas
ADD CONSTRAINT CK_Artistas_idArtista
CHECK(  
    idArtista BETWEEN 1000000 AND 9999999
   
);

--tTtelefono

ALTER TABLE  Artistas
ADD CONSTRAINT CK_Artistas_telefono
CHECK(  
    telefono BETWEEN 3000000000 AND 3999999999
   
);
