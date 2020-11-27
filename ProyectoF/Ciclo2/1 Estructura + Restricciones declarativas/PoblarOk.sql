/*Productos*/

INSERT INTO Productos (coProducto, nombreProducto)
    VALUES (3979129, 'Fond - Chocolate');
	
INSERT INTO Productos (coProducto, nombreProducto) 
    VALUES (9765550, 'Gaseosa Sprite');
	
INSERT INTO Productos (coProducto, nombreProducto) 
    VALUES (3780348, 'Whisky');
	
INSERT INTO Productos (coProducto, nombreProducto) 
    VALUES (9169861, 'Fish - Soup Base, Bouillon');
	
INSERT INTO Productos (coProducto, nombreProducto) 
    VALUES (5691220, 'Crush - Cream Soda');
	
INSERT INTO Productos (coProducto, nombreProducto)
    VALUES (1943418, 'Cake - Mini Cheesecake');
	
INSERT INTO Productos (coProducto, nombreProducto) 
    VALUES (2940166, 'Potatoes - Yukon Gold 5 Oz');

INSERT INTO Productos (coProducto, nombreProducto) 
    VALUES (4765686, 'Barley - Pearl');

INSERT INTO Productos (coProducto, nombreProducto) 
    VALUES (8161718, 'Scampi Tail');

INSERT INTO Productos (coProducto, nombreProducto)
    VALUES (3338308, 'Muffin Hinge Container 6');

INSERT INTO Productos (coProducto, nombreProducto)
    VALUES (4885138, 'Soup - Boston Clam Chowder');

/*Zonas*/

INSERT INTO Zonas (noZona, nombreZona , ubicacionZona )
    VALUES (1, 'Citroncirus','O');
	
INSERT INTO Zonas (noZona, nombreZona , ubicacionZona ) 
    VALUES (2, 'Dwarf Red Blackberry','O');

INSERT INTO Zonas (noZona, nombreZona , ubicacionZona )   
    VALUES (3, 'Uinta Basin Springparsley','S');

INSERT INTO Zonas (noZona, nombreZona , ubicacionZona ) 
    VALUES (4, 'Hinahina','S');

INSERT INTO Zonas (noZona, nombreZona , ubicacionZona ) 
    VALUES (5, 'Florida Balm','S');

INSERT INTO Zonas (noZona, nombreZona , ubicacionZona ) 
    VALUES (6, 'Water Sphagnum','S');

INSERT INTO Zonas (noZona, nombreZona , ubicacionZona ) 
    VALUES (7, 'Mycoglaena','E');

INSERT INTO Zonas (noZona, nombreZona , ubicacionZona ) 
    VALUES (8, 'Bolander''s Madia','N');

INSERT INTO Zonas (noZona, nombreZona , ubicacionZona ) 
    VALUES (9, 'Asian Pigeonwings','S');

INSERT INTO Zonas (noZona, nombreZona , ubicacionZona ) 
    VALUES (10, 'Brome','O');


/*Eventos*/
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (1, 'Caliangt', TO_DATE('07/17/2019','MM/DD/YYYY'), 1530950360);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (2, 'Kropf', TO_DATE('11/19/2019','MM/DD/YYYY'), 2606271533);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (3, 'Schurz', TO_DATE('10/20/2019','MM/DD/YYYY'), 771761715);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (4, 'Bartelt', TO_DATE('11/21/2019','MM/DD/YYYY'), 2697052680);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (5, 'Ilene', TO_DATE('08/18/2019','MM/DD/YYYY'), 1475314606);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (6, 'Dahle', TO_DATE('08/14/2019','MM/DD/YYYY'), 768001637);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (7, 'Spenser', TO_DATE('09/20/2019','MM/DD/YYYY'), 1338770900);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (8, 'Kings', TO_DATE('12/13/2018','MM/DD/YYYY'), 1329479489);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (9, 'Oneill', TO_DATE('07/02/2019','MM/DD/YYYY'), 2031557024);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (10, 'Summit', TO_DATE('12/13/2018','MM/DD/YYYY'), 829622606);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (11, 'Butternut', TO_DATE('10/14/2019','MM/DD/YYYY'), 459762054);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (12, 'Elmside', TO_DATE('12/29/2018','MM/DD/YYYY'), 2501959019);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (13, 'Sachs', TO_DATE('04/06/2019','MM/DD/YYYY'), 1404998677);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (14, 'Independence', TO_DATE('09/09/2019','MM/DD/YYYY'), 2081571355);
insert into Eventos (noEvento, nomEvento, fechaEvento, valorEvento) values (15, 'Northridge', TO_DATE('07/17/2019','MM/DD/YYYY'), 1042555364);


insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('FYOR-11', 'General', 6, 4);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('RJWN-12', 'VIP', 5, 4);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('NDGA-13', 'VIP', 5, 4);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('IYEC-14', 'General', 4, 8);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('DIEQ-15', 'Platino', 5, 4);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('EADP-16', 'Platino', 3, 7);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('TCGW-17', 'Platino', 7, 6);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('NXWR-18', 'Platino', 9, 1);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('GTGY-19', 'Platino', 2, 9);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('TJGD-110', 'General', 5, 6);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('OBTV-111', 'VIP', 8, 10);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('VIWP-112', 'Platino', 5, 5);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('WDHE-113', 'VIP', 9, 1);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('QPWI-114', 'Platino', 7, 6);
insert into Boletas (codigoBoleta, categoria, numEvento, noZona) values ('QIAG-115', 'General', 1, 2);

/*Patrocinadores*/
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (4194641811, 'Breena', 'bowlner0@java.com',3197118395);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (29104508491, 'Roda', 'rfreund1@google.comhk',3197658390);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (42614047991, 'Tommy', 'tpursey2@indiegogo.com',3197195777);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (94642875610, 'Ilene',  'ijorgesen3@discuz.net',3197275300);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (20398193734, 'Filmore', 'fbroggetti4@nih.gov',3197873149);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (17357975545, 'Fredrick', 'frotge5@odnoklassniki.ru',3197637866);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (57528553560, 'Wheeler','whaggus6@icio.us',3197782743);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (47885161881, 'Al','agerbel7@bing.com',3197119254);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (46040120961, 'Adelheid',  'aquarrell8@addthis.com',3197770514);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (26433786068, 'Enos', 'efisby9@miitbeian.govcn',3197324303);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (96031220389, 'Sharline', 'swardingleya@usda.gov',3197621642);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (14656149457, 'Yoshi', 'ykinkerb@biglobe.nejp',3197189745);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (68007853392, 'Langston', 'ljanuszkiewiczc@reverbnation.com',3197463671);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (23214856062, 'Otha', 'omateescud@ebay.com',3197561912);
insert into Patrocinadores (nitPatrocinador, razonSocial, correo, telefono) values (17647558481, 'Roderich', 'rredwoode@state.gov',3197181963);


/*fechaPatrocinio*/


insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (23214856062, 2, TO_DATE('07/14/2019','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (20398193734, 4, TO_DATE('02/11/2019','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (17647558481, 5, TO_DATE('06/04/2019','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (26433786068, 2, TO_DATE('10/12/2019','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (68007853392, 8, TO_DATE('07/07/2019','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (4194641811, 5, TO_DATE('10/31/2019','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (94642875610, 9, TO_DATE('12/29/2018','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (26433786068, 1, TO_DATE('08/08/2019','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (26433786068, 5, TO_DATE('07/14/2019','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (26433786068, 4, TO_DATE('10/31/2019','MM/DD/YYYY'));
insert into fechaPatrocinio (idPatrocinador, coEvento, fecha) values (94642875610, 7, TO_DATE('01/01/2019','MM/DD/YYYY'));

/*Camerinos*/
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (1, 'Wrapsafe', 3);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (2, 'Tin', 3);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (3, 'Flexidy', 2);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (4, 'Redhold', 3);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (5, 'It', 2);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (6, 'Aerified', 1);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (7, 'Fix San', 2);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (8, 'Voyatouch', 2);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (9, 'Veribet', 2);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (10, 'Treeflex', 0);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (11, 'Sonsing', 2);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (12, 'Bamity', 2);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (13, 'Holdlamis', 0);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (14, 'Fixflex', 1);
insert into Camerinos (noCamerino, nombreCamerino, disponibilidad) values (15, 'Wrapsafe', 0);

/*Artistas*/
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (6472757, 'Greeicy Rendon ',3436889931,3);
insert into Artistas (idArtista, nombreArtistico,Preferencias, telefono,numcamerino) values (1565544, 'Mike Bahia','<Preferencias>
    <Productos>
        <Producto
            codigo = "3979129">
            <Descripcion> Una rica chocolatina de sabor baja en calorias </Descripcion>
        </Producto>
        <Producto
            codigo = "3780348">
            <Descripcion> Un rico Trago de 18 años</Descripcion>
        </Producto>
    </Productos>
    <artistas>
        <artista
            id = "6992855">
            <nombre>José Álvaro Osorio Balvin</nombre>
            <nArtistico> Jbalvin </nArtistico>
        </artista>
        <artista
            id = "6472757">
            <nombre>Greeicy Yeliana Rendon</nombre>
            <nArtistico> Greeicy Rendon </nArtistico>
        </artista>
    </artistas>
    <horarios>
        <horario> 2:00PM - 4:00PM</horario>
    </horarios>
</Preferencias>', 3873809433,10);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (2208237, 'Juanes', 3052196770,10);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (6992855, 'Jbalvin', 3068409271,10);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (3559347, 'Gerhold Group', 3681141725,15);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (5645054, 'Muller and Thompson', 3313987670,13);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (8905992, 'Ryan and Kshlerin', 3763955090,15);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (7904808, 'Wehner-Mayer', 3110310990,13);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (4182956, 'Lowe and Sons', 3402754670,15);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (2589322, 'Raynor-Langworth', 3995076117,13);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (2085156, 'Zieme, Daugherty and Ratke', 3828332616,12);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (4051581, 'Becker and Langworth', 3076081124,12);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (4082404, 'Conn-Mitchell', 3807189529,7);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (1007519, 'Connelly-Hills', 3915815059,8);
insert into Artistas (idArtista, nombreArtistico, telefono,numcamerino) values (9788379, 'Bradtke Inc', 3163729761,9);



/*seAbasteceCon*/

insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (14, '5691220', 13);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (15, '5691220', 6);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (12, '5691220', 20);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (10, '3338308', 10);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (10, '1943418', 20);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (8, '5691220', 3);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (11, '1943418', 19);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (14, '3338308', 11);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (10, '5691220', 12);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (3, '1943418', 15);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (13, '5691220', 13);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (4, '1943418', 10);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (8, '3338308', 8);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (12, '1943418', 6);
insert into seAbasteceCon (numCamerino, coProduct, cantidad) values (15, '3338308', 17);

/*Conciertos*/

insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (1, 'Porsild s Draba',1);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (2, 'Whorled Rosinweed', 1);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (3, 'European Ash', 1);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (4, 'Saskatoon Serviceberry', 2);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (5, 'Tropical Whiteweed', 2);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (6, 'Woollyfruit Desertparsley', 5);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (7, 'New Mexico Raspberry', 1);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (8, 'Appalachia False Bindweed', 4);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (9, 'Buttonbush Dodder', 5);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (10, 'Sanborn''s Onion',4);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (11, 'Yellowstone Draba', 6);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (12, 'Hookeria Moss', 6);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (13, 'False Amaranth', 2);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (14, 'River Junction Hawthorn', 2);
insert into Conciertos (noConcierto, nombreConcierto, nuEvento) values (15, 'Jelly Lichen', 1);
/*esAsignado*/

insert into esAsignado (numConcierto, numCamerino, fecha) values (2, 10, TO_DATE('02/11/2019','MM/DD/YYYY'));
insert into esAsignado (numConcierto, numCamerino, fecha) values (2, 15, TO_DATE('05/16/2019','MM/DD/YYYY'));
insert into esAsignado (numConcierto, numCamerino, fecha) values (3, 12,TO_DATE('09/09/2019','MM/DD/YYYY'));
insert into esAsignado (numConcierto, numCamerino, fecha) values (3, 14, TO_DATE('03/28/2019','MM/DD/YYYY'));
insert into esAsignado (numConcierto, numCamerino, fecha) values (4, 13, TO_DATE('02/14/2019','MM/DD/YYYY'));


/*Tiene*/

insert into Tiene (idArti, noCon, fecha) values (1565544, 10, TO_DATE('02/11/2019','MM/DD/YYYY'));
insert into Tiene (idArti, noCon, fecha) values (6472757, 10, TO_DATE('02/11/2019','MM/DD/YYYY'));
insert into Tiene (idArti, noCon, fecha) values (6992855, 10, TO_DATE('02/11/2019','MM/DD/YYYY'));
insert into Tiene (idArti, noCon, fecha) values (7904808, 13, TO_DATE('03/28/2019','MM/DD/YYYY'));
insert into Tiene (idArti, noCon, fecha) values (5645054, 13, TO_DATE('03/28/2019','MM/DD/YYYY'));


