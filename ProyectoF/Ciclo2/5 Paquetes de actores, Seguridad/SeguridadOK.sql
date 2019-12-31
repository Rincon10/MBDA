/*Seguridad OK */
-- hacer borrado
EXECUTE PA_Director_Logistica.AD_Artistas(9788379, 'Drake Bell', 3163729761,NULL);
EXECUTE PA_Director_Logistica.AD_Artistas(4082404, 'Conn-Mitchell', 3807189529,NULL);
EXECUTE PA_Director_Logistica.AD_Artistas(1007519, 'Connelly-Hills', 3915815059,NULL);

EXECUTE PA_Director_Logistica.MOD_Artistas(9788379, 3123536920,NULL);

SELECT 
PA_Director_Logistica.CO_Artistas
FROM DUAL;