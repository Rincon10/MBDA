DROP ROLE ADMINISTRADOR_;
DROP ROLE PARTICIPANTE_;

/*B Asumiendo que uno de sus compañeros del curso (no del equipo) es el administrador,
otorguen los permisos correspondientes. Prueben la ejecución desde esa cuenta.*/
CREATE ROLE ADMINISTRADOR_;

GRANT EXECUTE 
ON PA_ADMINISTRADOR
TO ADMINISTRADOR_;

GRANT ADMINISTRADOR_
TO BD2162405;

/* Creen el rol de participantes, .....*/
CREATE ROLE PARTICIPANTE_;

GRANT EXECUTE
ON PA_PARTICIPANTE
TO PARTICIPANTE_ ;

GRANT PARTICIPANTE_
TO BD2161454;


GRANT PARTICIPANTE_
TO BD2161335;

