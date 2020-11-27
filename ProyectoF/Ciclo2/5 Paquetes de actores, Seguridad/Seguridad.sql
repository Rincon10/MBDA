DROP ROLE DirectorDeLogistica;
DROP ROLE SupervisorDeZona;
DROP ROLE MeseroBackstage;


/*Seguridad*/

/*ROL DirectorDeLogistica*/

CREATE ROLE DirectorDeLogistica;

GRANT EXECUTE 
ON PA_Director_Logistica
TO DirectorDeLogistica;

GRANT DirectorDeLogistica
TO BD2159820;
/*ROL SupervisorDeZona*/

CREATE ROLE SupervisorDeZona;

GRANT EXECUTE 
ON PA_SupervisorZona
TO SupervisorDeZona;

/*ROL MeseroBackstage*/

CREATE ROLE MeseroBackstage;

GRANT EXECUTE 
ON PA_MeseroBackstage
TO MeseroBackstage;


