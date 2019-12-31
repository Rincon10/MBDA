/*XSeguridad*/

/* Mesero*/
REVOKE ALL 
ON PA_Mesero
FROM Mesero;

/* SupervisorDeZona*/
REVOKE ALL 
ON PA_SupervisorDeZona
FROM SupervisorDeZona_;

/* 
/* GerenteDeAlimentos*/
REVOKE ALL 
ON PA_GerenteDeAlimentos
FROM GerenteDeAlimentos_;



/* Administrador*/
REVOKE ALL 
ON PA_Administrador
FROM Administrador_;