/* Historia de uso */ 
--Borrado


-- El supervisor de zona en un evento de movistar(un dia cotidiano de su trabajo), debia recibir a una serie de artistas y registrarlos en la base de datos
-- entre estos artistas se encontraba maluma y nicky jam, los cuales  habian solicitado quedarse en el mismo camerino.(Su camerino asociado era el 19)

EXECUTE PA_Director_Logistica. AD_Artistas(1003823074,'Maluma',3112393986,19);
EXECUTE PA_Director_Logistica. AD_Artistas(1003783071,'Nicky Jam',3141292916,19);

SELECT
PA_Director_Logistica.CO_Artistas
FROM DUAL;


--lo siguiente que debia hacer era notificarle al supervisor de zona que debia actualizar la disponibilida del camerino dado, era actualizar la disponibilidad asociada a ese camerino, para tener la informacion actualizada en la base de datos

EXECUTE PA_SupervisorZona.MOD_Camerinos(19,1);


SELECT 
PA_SupervisorZona .reporteCamerinos
FROM DUAL;
--una vez establecido los artistas en los camerinos el Mesero Backstage debia consultar los gustos que tienen los artistas, para poder surtirlo en su respectivo camerino


SELECT 
PA_MeseroBackstage.CO_gustosA
FROM DUAL;
