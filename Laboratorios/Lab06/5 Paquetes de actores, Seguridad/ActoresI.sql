CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRADOR IS 
    PROCEDURE AD_Miembros IS
    BEGIN
       PC_Miembros.AD_Miembros;
    END;
    
    PROCEDURE AD_Personas IS
    BEGIN
        PC_Miembros.AD_Personas;
    END;
    
    PROCEDURE AD_Empresas IS
    BEGIN
        PC_Miembros.AD_Empresas;
    END;
    
    PROCEDURE AD_Ciclistas IS
    BEGIN
        PC_Miembros.AD_Ciclistas;
    END;
    
END PA_ADMINISTRADOR;
/

CREATE OR REPLACE PACKAGE BODY PA_PARTICIPANTE IS 
    PROCEDURE	AD_Registros(
	     xcomentario IN VARCHAR,
		 xtiempo IN NUMBER,
		 xposicion NUMBER,
		 xrevision IN XMLTYPE,
		 xdificultad IN CHAR,
		 xnomSegmento IN VARCHAR,
		 xidCiclista IN NUMBER ) IS
    BEGIN
         PC_Registros.AD_Registros(
             xcomentario,
             xtiempo,
             xposicion,
             xrevision,
             xdificultad,
             xnomSegmento,
             xidCiclista);
    END;
		 	 
	PROCEDURE MOD_Registros(
	     xnumero IN NUMBER,
		 xrevision IN XMLTYPE,
		 xcomentario IN VARCHAR) IS
    BEGIN
         PC_Registros.MOD_Registros(
	         xnumero,
             xrevision,
             xcomentario);
    END;
	
	PROCEDURE EL_Registros(
	    xnumero IN NUMBER ) IS 
    BEGIN 
        PC_Registros.EL_Registros(xnumero);
    END;
	   
	FUNCTION CO_Registros
	    RETURN SYS_REFCURSOR IS
    INF_Registros SYS_REFCURSOR;
    BEGIN
        INF_Registros := PC_Registros.CO_Registros();
        RETURN INF_Registros ;
    END;
        
	FUNCTION CO_SeccionesDesc
        RETURN SYS_REFCURSOR IS
    INF_SeccionesDesc SYS_REFCURSOR;
    BEGIN
        INF_SeccionesDesc := PC_Registros.CO_SeccionesDesc();
        RETURN INF_SeccionesDesc ;
    END;
    
	PROCEDURE AD_Registros_Foto(
	     xnoFoto IN NUMBER ,
		 xfoto IN VARCHAR ,
		 xnoRegistro IN NUMBER ) IS
    BEGIN
         PC_Registros.AD_Registros_Foto(
             xnoFoto,
             xfoto,
             xnoRegistro) ; 
    END;
         
	
	PROCEDURE MOD_Fotos(
	     xnoFoto IN NUMBER,
		 xfoto IN VARCHAR ) IS
    BEGIN 
         PC_Registros.MOD_Fotos(
             xnoFoto,
             xfoto);
    END;
	
	FUNCTION CO_Fotos
	    RETURN SYS_REFCURSOR IS
    INF_Fotos SYS_REFCURSOR;
    BEGIN
        INF_Fotos := PC_Registros.CO_Fotos();
        RETURN INF_Fotos;
    END;
    
END PA_PARTICIPANTE ;
/

