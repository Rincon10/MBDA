
/*
DROP ROLE elAdministrador;
DROP ROLE musicos;
DROP ROLE Compositor;*/


CREATE ROLE elAdministrador;
CREATE ROLE musicos IDENTIFIED BY musicos;
CREATE  ROLE Compositor;


GRANT EXECUTE 
ON PA_Administrador TO elAdministrador;

GRANT EXECUTE 
ON PA_Musico TO  musicos ;

GRANT EXECUTE 
ON PC_Musico TO  musicos ;

GRANT EXECUTE 
ON PC_Musico TO  Compositor ;

GRANT EXECUTE 
ON PA_Compositor TO  Compositor ;


