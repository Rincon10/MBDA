/*Disparadores NoOk*/

--1) Lo unico que se puede modificar es la disponibilidad, pero se modifico el nombre del camerino 

UPDATE Camerinos
    SET nombreCamerino ='Prueba'
WHERE 16 = nocamerino;

--2)se intenta cambiar un artista a un camerino el cual ya no tiene disponibilida.
UPDATE Artistas
    SET numcamerino = 15
WHERE idArtista = 9788379 ;

--3)se modifico el nombre artistico de un artista
UPDATE Artistas
    SET nombreArtistico = 'Bradtke'
WHERE idArtista = 9788379 ;
