/*SeguridadNoOK*/

/*
1) el participante no puede añadir los miembros
*/

EXECUTE PA_ADMINISTRADOR.AD_Miembros

/*
2) el participante no puede añadir a las personas
*/
EXECUTE PA_ADMINISTRADOR.AD_Personas
/*
3) el participante no puede añadir los ciclistas
*/

EXECUTE PA_ADMINISTRADOR.AD_Ciclistas