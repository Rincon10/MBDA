/*
1)No se puede insertar ya que viola la integridad, que la fecha de nacimmiento < a la fecha de su muerte 
*/
EXECUTE PC_Musico.Ad_Musico ('David Santiago', TO_DATE('1968/11/11','YYYY/MM/DD'), TO_DATE('1963/11/11','YYYY/MM/DD') , 3, 1,NULL);

/*
--2)No se puede insertar ya que viola la integridad que el nombre debe llevar nombre y apellido
*/
EXECUTE PC_Musico.Ad_Musico('Steve', TO_DATE('1978/11/21','YYYY/MM/DD'), NULL, 4, 7, NULL);

/*
3)los valores a insertar no cumplen con el tipo 
*/
EXECUTE PC_Musico.Ad_Musico ('David Santiago','1968/11/11', TO_DATE('1963/11/11','YYYY/MM/DD') , 3, 1,NULL);