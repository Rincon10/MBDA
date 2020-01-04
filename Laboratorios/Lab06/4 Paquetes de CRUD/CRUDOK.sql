/*
5 Casos de Exito
*/

/*
1) Realizar un registro desde AD_Registros 
*/
EXECUTE PC_Registros.AD_Registros('dificil',150,100,NULL,'A','Sisga',41095);

/*
--2) Consultar todas  las fotos de un registros . 
*/

SELECT
    PC_Registros.CO_Fotos
FROM DUAL;


/*
3) Consultar segmentos de montaña con secciones de descenso
*/
SELECT
    PC_Registros.CO_SeccionesDesc
FROM DUAL;


/*
4)eliminacion de la carrera 
*/

EXECUTE PC_Registros.EL_Registros(2);

/*
5) adicionar las fotos de un registro 
*/
SELECT * FROM Fotos;
EXECUTE  PC_Registros.AD_Registros_Foto(2,'www.fotosegunda.gif ',1);

