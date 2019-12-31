/*
Mantener musico
*/

/*Adicionar*/
EXECUTE PC_Musico.Ad_Musico ('Camilo Rincon',TO_DATE('1980/05/11','YYYY/MM/DD'),NULL,6,7,NULL);
EXECUTE PC_Musico.Ad_Musico ('Fabian Ramirez',TO_DATE('1980/05/11','YYYY/MM/DD'),NULL,6,2,NULL);
/*Modificar*/
EXECUTE PC_Musico.Mod_Musico (23,NULL,8);

/*Eliminar*/
EXECUTE PC_Musico.El_Musico (23);

/*Consultar*/
SELECT 
     PC_Musico.CO_Musico()
FROM DUAL;


/*Consulta 1*/
SELECT 
     PC_Musico.CO_Musico_Ciudad('Manchester')
FROM DUAL;

/*Consulta 2*/
SELECT 
     PC_Musico.CO_Musico_Universidad('Yale Schoo')
FROM DUAL;

/*Consulta 3*/
SELECT 
    PC_Musico.CO_Musico_mas_Premiado('1812')
FROM DUAL;

		
/*
Registrar Composicion 
*/

/*Adicionar*/

EXECUTE PC_Composicion.Ad_Composicion(TO_DATE('1990/07/12','YYYY/MM/DD'),'Just Friends',6);

/*Consultar*/

SELECT
     PC_Composicion.CO_Composition
FROM DUAL;
/*Consulta 4*/
