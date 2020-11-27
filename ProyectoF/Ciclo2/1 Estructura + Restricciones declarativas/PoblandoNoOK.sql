/*PoblandoNoOK*/
--Causaria error debido que el artista ya se encuentra registrado en la base de datos
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (9788379, 'Bradtke Inc', 3163729761,9);

--Causaria error debido que el correo de camilo no tiene un  @ ni el punto 
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (4194641822, 'Camilo', 'camilohomtailcom',3197065840);

--Causaria erro ya que en un camerino solo es permitido un maximo  de 3 personas
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (16, 'vip', 5);