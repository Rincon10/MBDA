CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR IS 
    PROCEDURE AD_Miembros;
    PROCEDURE AD_Personas; 
    PROCEDURE AD_Empresas;
    PROCEDURE AD_Ciclistas;
END PA_ADMINISTRADOR;
/

CREATE OR REPLACE PACKAGE PA_PARTICIPANTE IS 
    PROCEDURE	AD_Registros(
	     xcomentario IN VARCHAR,
		 xtiempo IN NUMBER,
		 xposicion NUMBER,
		 xrevision IN XMLTYPE,
		 xdificultad IN CHAR,
		 xnomSegmento IN VARCHAR,
		 xidCiclista IN NUMBER );
		 	 
	PROCEDURE MOD_Registros(
	     xnumero IN NUMBER,
		 xrevision IN XMLTYPE,
		 xcomentario IN VARCHAR) ;
	
	PROCEDURE EL_Registros(
	    xnumero IN NUMBER );
	   
	FUNCTION CO_Registros
	    RETURN SYS_REFCURSOR;
        
	FUNCTION CO_SeccionesDesc
        RETURN SYS_REFCURSOR;
    
	PROCEDURE AD_Registros_Foto(
	     xnoFoto IN NUMBER ,
		 xfoto IN VARCHAR ,
		 xnoRegistro IN NUMBER );
	
	PROCEDURE MOD_Fotos(
	     xnoFoto IN NUMBER,
		 xfoto IN VARCHAR );
	
	FUNCTION CO_Fotos
	    RETURN SYS_REFCURSOR;
END PA_PARTICIPANTE ;
/

