DROP ROLE Mesero_;
DROP ROLE SupervisorDeZona_;
DROP ROLE GerenteDeAlimentos_;
DROP ROLE Administrador_;

/*Seguridad*/

/*ROL MESERO*/

CREATE ROLE Mesero_;

GRANT EXECUTE 
ON PA_Mesero
TO Mesero_;

/*ROL SupervisorDeZona*/

CREATE ROLE SupervisorDeZona_;

GRANT EXECUTE 
ON PA_SupervisorDeZona
TO SupervisorDeZona_;

/*ROL GerenteDeAlimentos*/

CREATE ROLE GerenteDeAlimentos_;

GRANT EXECUTE 
ON PA_GerenteDeAlimentos
TO GerenteDeAlimentos_;


/*ROL Administrador*/

CREATE ROLE Administrador_;

GRANT EXECUTE 
ON PA_Administrador
TO Administrador_;

GRANT Administrador
TO BD2159820, BD2132306;

