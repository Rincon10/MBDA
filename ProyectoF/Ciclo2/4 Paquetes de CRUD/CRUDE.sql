CREATE OR REPLACE PACKAGE PC_Artistas IS 
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
	
    FUNCTION CO_duoArtistas
        RETURN SYS_REFCURSOR;
    
    FUNCTION CO_gustosA
        RETURN SYS_REFCURSOR;
	
END PC_Artistas;

/

CREATE OR REPLACE PACKAGE PC_Patrocinadores IS 
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
    
     PROCEDURE MOD_fechaPatrocinio(
        xidPatrocinador IN NUMBER,
        xcoEvento IN NUMBER,
        xfecha IN DATE
    );
    
    PROCEDURE EL_Patrocinadores (
        xnitPatrocinador IN NUMBER
    );
    
    FUNCTION CO_Patrocinadores 
        RETURN SYS_REFCURSOR;
	
    FUNCTION CO_InfPatro
        RETURN SYS_REFCURSOR;
END PC_Patrocinadores ;

/

CREATE OR REPLACE PACKAGE PC_Conciertos IS 
    PROCEDURE AD_Conciertos (
        xnombreConcierto IN VARCHAR , 
        xnuEvento  IN NUMBER
    );
        
    PROCEDURE MOD_esAsignado (
        xnumConcierto IN NUMBER,
        xnumCamerino IN NUMBER,
        xfecha IN DATE
    );
    
    PROCEDURE MOD_Tiene (
        xidArti IN NUMBER,
        xnoCon IN NUMBER,
        xfecha IN DATE
    );
    
    FUNCTION CO_Conciertos
        RETURN SYS_REFCURSOR;
	
END PC_Conciertos ;

/

CREATE OR REPLACE PACKAGE PC_Eventos IS 
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
	
END PC_Eventos ;

/

CREATE OR REPLACE PACKAGE PC_Camerinos IS 
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
	
    FUNCTION CO_reporteCamerinos
        RETURN SYS_REFCURSOR;
        
END PC_Camerinos;

/