/*DisparadoresOK*/

INSERT INTO Registros(comentario, tiempo,posicion, revision, dificultad,nomSegmento, idCiclista )  VALUES(NULL,50,32,NULL,'A','Carrera',82655);
INSERT INTO Registros(comentario, tiempo,posicion, revision, dificultad,nomSegmento, idCiclista )  VALUES('Curvas peligrosas',80,8,NULL,'A','RetoMont',41095);

INSERT INTO Puntos(coPunto,orden,nombre,tipo,distancia,tiempolimite,coCarrera) VALUES (13,16,'Adidas','H',30.45,60,'COLAS');

INSERT INTO Registros(numero,comentario,fecha, tiempo,posicion, revision, dificultad,nomSegmento, idCiclista )  VALUES(08,NULL ,TO_DATE('05/04/2018','MM/DD/YYYY'),40,1,NULL,'A','Carrera',23281);

INSERT INTO Registros  (numero,comentario,fecha, tiempo,posicion, revision, dificultad,nomSegmento, idCiclista ) VALUES (09,NULL ,TO_DATE('05/07/2018','MM/DD/YYYY'),80,12,NULL,'A','Carrera',12345);

INSERT INTO Registros  (numero,comentario,fecha, tiempo,posicion, revision, dificultad,nomSegmento, idCiclista ) VALUES (10,NULL ,TO_DATE('05/02/2019','MM/DD/YYYY'),120,1,NULL,'A','MontañasAl',12345);

UPDATE Registros 
  SET   comentario = 'Deben  hacerla',revision = NULL
WHERE numero = 1 ;

UPDATE fotos 
  SET  noFoto  = 1 ,foto ='www.actualizacionFoto.gif' , noRegistro = 01
WHERE noFoto = 1 ;


DELETE FROM Registros
WHERE numero=01;

INSERT INTO Puntos(coPunto,nombre,tipo,distancia,tiempolimite,coCarrera) VALUES (12,'Nike','H',13.45,60,'COLAS');

INSERT INTO Puntos(coPunto,orden,nombre,tipo,distancia,tiempolimite,coCarrera) VALUES (14,20,'underr','L',35.45,60,'PERBR');

INSERT INTO Puntos(coPunto,orden,nombre,distancia,tiempolimite,coCarrera) VALUES (15,5,'AIR',5.35,30,'PERBR');