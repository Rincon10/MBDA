/*Disparadores Ok*/

--unicamente se pueden actualizar las preferencias del artista, asi como su telefono y camerino.
UPDATE Artistas
    SET telefono = 3212139501
WHERE idArtista = 9788379 ;

/*Patrocinadores*/
--generar de forma automatica el correo, si el patrocinador no lo suministra,tomando la primeras 5 letras de la razon social y concatenandolo con @empresarial.com

insert into Patrocinadores (nitPatrocinador, razonSocial, telefono) values (11427452481, 'Coca Cola',3211221963);


--Unicamente se puede actualizar las fechas del patrocinio, por un motivo externo. 

UPDATE fechaPatrocinio
    SET fecha = TO_DATE('07/19/2019','MM/DD/YYYY')
WHERE idPatrocinador = 23214856062 AND 
    coEvento = 2;

/*Conciertos*/

--Generar de forma automatica el numero del concierto, si este no se ingresa. 
insert into Conciertos ( nombreConcierto, nuEvento) values ( 'Si te quedas que', 2);

--Unicamente se puede actualizar las fechas de asignacion de los camerinos para un  concierto, generado por un motivo externo. 
UPDATE esAsignado
    SET fecha =  TO_DATE('02/15/2019','MM/DD/YYYY')
WHERE
    numConcierto = 2 AND 
    numCamerino = 10 ;

/*Eventos*/

--Generar de forma automatica el codigo de la boleta del concierto.
insert into Boletas (categoria, numEvento, noZona) values ('General', 1, 2);

--Unicamente se puede actualizar las fechas del evento y el valor del evento .

/*Camerinos*/
--si no se ingresa el numero del camerino este se generara de forma automatica.
insert into Camerinos ( nombreCamerino, disponibilidad) values ('Estrella', 0);

--Lo unico que se puede modificar es la disponibilidad.
UPDATE Camerinos
    SET disponibilidad = 3
WHERE 16 = nocamerino;