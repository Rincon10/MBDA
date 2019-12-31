/*SeguridadOK*/

/*
1) Que el administrador pueda importar los miembros  de la base de datos MBDA.MIEBROS
*/
EXECUTE PA_ADMINISTRADOR.AD_Miembros

/*
2)Que el administrador pueda adicionar las Personas  de la base de datos importada
*/

EXECUTE PA_ADMINISTRADOR.AD_Personas
/*
3)Un participante puede consultar los segmentos con secciones de descenso 
*/

SELECT 
PA_PARTICIPANTE.CO_SeccionesDesc
FROM DUAL;

/*
4)Que el administrador pueda adicionar los Ciclistas  de la base de datos importada
*/

EXECUTE PA_ADMINISTRADOR.AD_Ciclistas

/*
5)  un participante puede adicionar un registro

*/

EXECUTE PA_PARTICIPANTE.AD_Registros(NULL,30,65,NULL,'A','Sisga',162);

