/*ActoresI*/


CREATE OR REPLACE PACKAGE BODY PA_MeseroBackstage IS
    FUNCTION CO_gustosA
        RETURN SYS_REFCURSOR 
    IS INF_gustosA SYS_REFCURSOR;
    BEGIN
        INF_gustosA := PC_Artistas.CO_gustosA;
        RETURN INF_gustosA;
    END;
    
END PA_MeseroBackstage ;
/

CREATE OR REPLACE PACKAGE BODY  PA_Director_Logistica IS 
    PROCEDURE AD_Artistas(
        xidArtista IN NUMBER,
        xnombreArtistico IN VARCHAR , 
        xtelefono IN NUMBER,
        xnumcamerino IN NUMBER) IS
    BEGIN
        PC_Artistas.AD_Artistas( xidArtista,xnombreArtistico , xtelefono , xnumcamerino );
    END;
        
    PROCEDURE MOD_Artistas(
        xidArtista IN NUMBER,
        xtelefono IN NUMBER,
        xnumcamerino IN NUMBER) IS
    BEGIN
        PC_Artistas.MOD_Artistas(xidArtista,xtelefono,xnumcamerino);
    END;
    
    PROCEDURE EL_Artistas(
        xidArtista IN NUMBER) IS
    BEGIN
        PC_Artistas.EL_Artistas(xidArtista);
    END;
    
    FUNCTION CO_Artistas
        RETURN SYS_REFCURSOR 
    IS INF_Artistas SYS_REFCURSOR ;
    BEGIN
        INF_Artistas := PC_Artistas.CO_Artistas;
        RETURN INF_Artistas;
    END;
	
    
    PROCEDURE AD_Patrocinadores (
        xnitPatrocinador IN NUMBER,
        xrazonSocial IN VARCHAR , 
        xcorreo IN VARCHAR,
        xtelefono IN NUMBER ) IS
    BEGIN
       PC_Patrocinadores.AD_Patrocinadores(xnitPatrocinador,xrazonSocial,xcorreo,xtelefono);
    END;
    
        
    PROCEDURE MOD_Patrocinadores (
        xnitPatrocinador IN NUMBER,
        xtelefono IN NUMBER) IS
    BEGIN
        PC_Patrocinadores.MOD_Patrocinadores(xnitPatrocinador,xtelefono);
    END;
    
    PROCEDURE MOD_fechaPatrocinio(
        xidPatrocinador IN NUMBER,
        xcoEvento IN NUMBER,
        xfecha IN DATE) IS
    BEGIN
        PC_Patrocinadores.MOD_fechaPatrocinio(xidPatrocinador,xcoEvento,xfecha);
    END;
    
    PROCEDURE EL_Patrocinadores (
        xnitPatrocinador IN NUMBER) IS
    BEGIN
        PC_Patrocinadores.EL_Patrocinadores(xnitPatrocinador);
    END;
    
    FUNCTION CO_Patrocinadores 
        RETURN SYS_REFCURSOR
    IS INF_Patrocinadores SYS_REFCURSOR;
    BEGIN
        INF_Patrocinadores  := PC_Patrocinadores.CO_Patrocinadores;
        RETURN INF_Patrocinadores  ; 
    END;
	
    FUNCTION CO_InfPatro
        RETURN SYS_REFCURSOR
    IS INF_InfPatro SYS_REFCURSOR;
    BEGIN
        INF_InfPatro:= PC_Patrocinadores.CO_InfPatro;
        RETURN INF_InfPatro; 
    END;
    
    PROCEDURE AD_Conciertos (
        xnombreConcierto IN VARCHAR , 
        xnuEvento  IN NUMBER) IS
    BEGIN
        PC_Conciertos.AD_Conciertos(xnombreConcierto,xnuEvento);
    END;
        
    FUNCTION CO_Conciertos
        RETURN SYS_REFCURSOR
    IS INF_Conciertos SYS_REFCURSOR;
    BEGIN
        INF_Conciertos := PC_Conciertos.CO_Conciertos;
        RETURN INF_Conciertos; 
    END;
    
        
     PROCEDURE AD_Eventos (
        xnomEvento IN VARCHAR , 
        xfechaEvento  IN DATE,
        xvalorEvento IN NUMBER) IS
    BEGIN
        PC_Eventos.AD_Eventos(xnomEvento,xfechaEvento,xvalorEvento);
    END;
    
    PROCEDURE AD_Boletas(
        xcodigoBoleta IN VARCHAR,
        xcategoria IN VARCHAR , 
        xnumEvento  IN NUMBER,
        xnoZona IN NUMBER) IS
    BEGIN
        PC_Eventos.AD_Boletas(xcodigoBoleta,xcategoria,xnumEvento,xnoZona);
    END;
        
    PROCEDURE MOD_Eventos (
        xnoEvento IN NUMBER,
        xfechaEvento IN DATE ) IS
    BEGIN
        PC_Eventos.MOD_Eventos(xnoEvento,xfechaEvento);
    END;
  
    FUNCTION CO_Eventos
        RETURN SYS_REFCURSOR
    IS INF_Eventos SYS_REFCURSOR;
    BEGIN
        INF_Eventos  := PC_Eventos.CO_Eventos;
        RETURN INF_Eventos  ; 
    END;
        
END PA_Director_Logistica;

/

CREATE OR REPLACE PACKAGE BODY  PA_SupervisorZona IS 
    PROCEDURE AD_Camerinos(
        xnombreCamerino IN VARCHAR ,
        xdisponibilidad IN NUMBER ) IS
    BEGIN 
        PC_Camerinos.AD_Camerinos(xnombreCamerino,xdisponibilidad);
    END;
    
    PROCEDURE MOD_Camerinos(
        xnoCamerino IN NUMBER, 
        xdisponibilidad IN NUMBER ) IS
    BEGIN
        PC_Camerinos.MOD_Camerinos(xnoCamerino,xdisponibilidad);
    END;
        
    FUNCTION CO_Camerinos
        RETURN SYS_REFCURSOR
    IS INF_Camerinos SYS_REFCURSOR;
    BEGIN
       INF_Camerinos := PC_Camerinos.CO_Camerinos;
       RETURN INF_Camerinos;
    END;
	
    FUNCTION reporteCamerinos
        RETURN SYS_REFCURSOR
    IS INF_reporteCamerinos SYS_REFCURSOR;
    BEGIN 
       INF_reporteCamerinos := PC_Camerinos.CO_reporteCamerinos;
       RETURN INF_reporteCamerinos;
    END;
        
END PA_SupervisorZona ;
/