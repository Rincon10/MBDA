CREATE OR REPLACE PACKAGE PC_Registros IS 
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
    
END PC_Registros;
/

CREATE OR REPLACE PACKAGE PC_Carreras IS 
    PROCEDURE AD_Carreras(
		xnombre IN VARCHAR,
		xpais IN VARCHAR,
		xcategoria IN NUMBER,
		xperiodicidad IN VARCHAR);
    
    PROCEDURE MOD_Carreras(
        xcodigo IN VARCHAR,
        xcategoria IN NUMBER,
		xperiodicidad IN VARCHAR);
        
    PROCEDURE EL_Carreras(
        xcodigo IN VARCHAR );
        
    FUNCTION CO_Carreras 
        RETURN SYS_REFCURSOR ;
    
    PROCEDURE AD_Carreras_Pun(
        xcoPunto IN NUMBER,
        xnombre IN VARCHAR,
        xtipo IN CHAR ,
        xdistancia IN NUMBER ,
        xtiempoLimite IN VARCHAR  ,
        xcoCarrera IN  NUMBER );
        
    PROCEDURE MOD_Carreras_Pun(
       xcoPunto IN NUMBER,
       xtipo IN CHAR ,
       xtiempoLimite IN VARCHAR ) ;

    FUNCTION CO_Carreras_Pun 
       RETURN SYS_REFCURSOR;
    
    PROCEDURE AD_Carreras_Prop(
        xidMiembro IN NUMBER,
        xcoCarrera IN VARCHAR,
        xporcentaje IN NUMBER );
        
    PROCEDURE EL_Carreras_Prop(
        xidMiembro IN NUMBER,
        xcoCarrera IN VARCHAR);
    
    FUNCTION CO_Carreras_Prop
        RETURN SYS_REFCURSOR;
        
END PC_Carreras;
/


CREATE OR REPLACE PACKAGE PC_Miembros IS
    PROCEDURE AD_Miembros;
    PROCEDURE AD_Personas; 
    PROCEDURE AD_Empresas;
    PROCEDURE AD_Ciclistas;
END PC_Miembros;
