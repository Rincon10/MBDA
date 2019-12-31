/*CRUDNoOK*/

/* 
3 de
fracaso.
*/


/*
1) Se activa ya que esta ingresando un comentario que ya existe y no puede repetirse 
*/
EXECUTE PC_Registros.AD_Registros('dificil',150,100,NULL,'A','Carrera',4321);

/*
--2) se ingresa un participante que no existe 
*/

EXECUTE PC_Registros.AD_Registros('facil ',150,100,NULL,'A','Carrera',4321);
/*
3)se ingresa un miembro que es dueño de una carrera ya introducido
*/


EXECUTE PC_Carreras.AD_Carreras_Prop(48633,'FRIB',50 );
