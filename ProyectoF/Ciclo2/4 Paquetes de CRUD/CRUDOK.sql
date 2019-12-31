/*CRUDOK*/



--correr borrado 
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


--Adicionar los eventos 

EXECUTE PC_Eventos.AD_Eventos('Caliangt', TO_DATE('07/17/2019','MM/DD/YYYY'), 1530950360);
EXECUTE PC_Eventos.AD_Eventos('Kropf', TO_DATE('11/19/2019','MM/DD/YYYY'), 2606271533);
EXECUTE PC_Eventos.AD_Eventos('Schurz', TO_DATE('10/20/2019','MM/DD/YYYY'), 771761715);


SELECT 
PC_Eventos.CO_Eventos
FROM DUAL;

EXECUTE PC_Eventos.MOD_Eventos(17, TO_DATE('11/20/2019','MM/DD/YYYY'));

--Adicionar Patrocinadores
EXECUTE PC_Patrocinadores.AD_Patrocinadores(23214856062,'Otha', 'omateescud@ebay.com',3197561912);
EXECUTE PC_Patrocinadores.AD_Patrocinadores(29104508491, 'Roda', 'rfreund1@google.comhk',3197658390);
EXECUTE PC_Patrocinadores.AD_Patrocinadores(42614047991, 'Tommy', 'tpursey2@indiegogo.com',3197195777);

SELECT 
PC_Patrocinadores.CO_Patrocinadores
FROM DUAL;

EXECUTE PC_Patrocinadores.MOD_Patrocinadores(23214856062,3142139502);

EXECUTE  PC_Patrocinadores.EL_Patrocinadores (42614047991);
    

--camerinos

EXECUTE PC_Camerinos.AD_Camerinos('Wrapsafe', 3);
EXECUTE PC_Camerinos.AD_Camerinos('Tin', 3);
EXECUTE PC_Camerinos.AD_Camerinos( 'Flexidy', 2);
EXECUTE PC_Camerinos.AD_Camerinos('Redhold', 3);

SELECT 
PC_Camerinos.CO_Camerinos
FROM DUAL;

EXECUTE PC_Camerinos.MOD_Camerinos(18,2);


SELECT  
PC_Camerinos.CO_reporteCamerinos
FROM DUAL;

/*Artistas*/
EXECUTE PC_Artistas.AD_Artistas(6472757, 'Greeicy Rendon ',3436889931,NULL);

EXECUTE PC_Artistas.AD_Artistas(2208237, 'Juanes', 3052196770,NULL);

EXECUTE PC_Artistas.AD_Artistas(6992855, 'Jbalvin', 3068409271,NULL);


SELECT
PC_Artistas.CO_Artistas
FROM DUAL;

EXECUTE PC_Artistas.EL_Artistas(2208237);

EXECUTE PC_Artistas.MOD_Artistas(6472757,3436889931,16);
EXECUTE PC_Artistas.MOD_Artistas(6992855,3068409271,16);

EXECUTE PC_Camerinos.MOD_Camerinos(16,1);
