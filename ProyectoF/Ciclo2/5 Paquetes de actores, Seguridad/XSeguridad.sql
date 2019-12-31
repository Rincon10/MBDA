/*XSeguridad*/

/* Mesero*/
REVOKE ALL 
ON PA_Director_Logistica
FROM DirectorDeLogistica;

/* SupervisorDeZona*/
REVOKE ALL 
ON PA_SupervisorZona
FROM SupervisorDeZona;

/* 
/* GerenteDeAlimentos*/
REVOKE ALL 
ON PA_MeseroBackstage
FROM MeseroBackstage;

