/*ActoresE*/


CREATE OR REPLACE PACKAGE PA_MeseroBackstage IS
    FUNCTION CO_gustosA
        RETURN SYS_REFCURSOR;
        
END PA_MeseroBackstage ;
/
CREATE OR REPLACE PACKAGE PA_Director_Logistica IS 
    PROCEDURE AD_Artistas(
        xidArtista IN NUMBER,
        xnombreArtistico IN VARCHAR , 
        xtelefono IN NUMBER,
        xnumcamerino IN NUMBER
    );
        
    PROCEDURE MOD_Artistas(
        xidArtista IN NUMBER,
        xtelefono IN NUMBER,
        xnumcamerino IN NUMBER
    );
    
    PROCEDURE EL_Artistas(
        xidArtista IN NUMBER
    );
    
    FUNCTION CO_Artistas
        RETURN SYS_REFCURSOR;
	
    
    PROCEDURE AD_Patrocinadores (
        xnitPatrocinador IN NUMBER,
        xrazonSocial IN VARCHAR , 
        xcorreo IN VARCHAR,
        xtelefono IN NUMBER
    );
        
    PROCEDURE MOD_Patrocinadores (
        xnitPatrocinador IN NUMBER,
        xtelefono IN NUMBER
    );
    
    
    PROCEDURE EL_Patrocinadores (
        xnitPatrocinador IN NUMBER
    );
    
    FUNCTION CO_Patrocinadores 
        RETURN SYS_REFCURSOR;
	
    FUNCTION CO_InfPatro
        RETURN SYS_REFCURSOR;
    
    PROCEDURE AD_Conciertos (
        xnombreConcierto IN VARCHAR , 
        xnuEvento  IN NUMBER
    );
        
        
    FUNCTION CO_Conciertos
        RETURN SYS_REFCURSOR;
    
        
     PROCEDURE AD_Eventos (
        xnomEvento IN VARCHAR , 
        xfechaEvento  IN DATE,
        xvalorEvento IN NUMBER
    );
    
    PROCEDURE AD_Boletas(
        xcodigoBoleta IN VARCHAR,
        xcategoria IN VARCHAR , 
        xnumEvento  IN NUMBER,
        xnoZona IN NUMBER
    );
        
    PROCEDURE MOD_Eventos (
        xnoEvento IN NUMBER,
        xfechaEvento IN DATE 
    );
  
    FUNCTION CO_Eventos
        RETURN SYS_REFCURSOR;
        
END PA_Director_Logistica;

/

CREATE OR REPLACE PACKAGE PA_SupervisorZona IS 
    PROCEDURE AD_Camerinos(
        xnombreCamerino IN VARCHAR ,
        xdisponibilidad IN NUMBER 
    );
    
    PROCEDURE MOD_Camerinos(
        xnoCamerino IN NUMBER, 
        xdisponibilidad IN NUMBER 
    );
        
    FUNCTION CO_Camerinos
        RETURN SYS_REFCURSOR;
	
    FUNCTION reporteCamerinos
        RETURN SYS_REFCURSOR;
END PA_SupervisorZona ;
/