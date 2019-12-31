CREATE OR REPLACE PACKAGE BODY PC_Artistas IS 
    PROCEDURE AD_Artistas(
        xidArtista IN NUMBER,
        xnombreArtistico IN VARCHAR , 
        xtelefono IN NUMBER,
        xnumcamerino IN NUMBER ) IS
    BEGIN
        INSERT INTO Artistas(idArtista,nombreArtistico,telefono,numcamerino)
            VALUES (xidArtista,xnombreArtistico,xtelefono,xnumcamerino);
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'El artista ya fue ingresado en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al insertar el Artista.');
    END;
        
    PROCEDURE MOD_Artistas(
        xidArtista IN NUMBER,
        xtelefono IN NUMBER,
        xnumcamerino IN NUMBER ) IS
    BEGIN
        UPDATE Artistas 
            SET telefono = xtelefono, numcamerino = xnumcamerino
        WHERE xidArtista = idArtista; 
        
        COMMIT;
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al modificar la informacion del Artista.');
    END;
    
    PROCEDURE EL_Artistas(
        xidArtista IN NUMBER) IS 
    BEGIN
        DELETE 
           FROM Artistas
        WHERE  xidArtista = idArtista;
        COMMIT;
        
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al eliminar la informacion del Artista.');
    END;
    
    FUNCTION CO_Artistas
        RETURN SYS_REFCURSOR 
    IS  INF_ARTISTAS SYS_REFCURSOR;
    BEGIN
        OPEN INF_ARTISTAS  FOR
            SELECT *
            FROM Artistas;
        RETURN INF_ARTISTAS ;
    END;
	
    FUNCTION CO_duoArtistas
        RETURN SYS_REFCURSOR 
    IS INF_duoArtistas SYS_REFCURSOR;
    BEGIN
        OPEN INF_duoArtistas FOR
            SELECT *
            FROM duoArtistas;
        RETURN INF_duoArtistas ;
    END;
    
    FUNCTION CO_gustosA
        RETURN SYS_REFCURSOR
    IS INF_gustosA SYS_REFCURSOR;
    BEGIN
        OPEN INF_gustosA FOR
            SELECT *
            FROM gustosA;
        RETURN INF_gustosA;
    END;
	
END PC_Artistas;

/

CREATE OR REPLACE PACKAGE BODY PC_Patrocinadores IS 
    PROCEDURE AD_Patrocinadores (
        xnitPatrocinador IN NUMBER,
        xrazonSocial IN VARCHAR , 
        xcorreo IN VARCHAR,
        xtelefono IN NUMBER) IS
    BEGIN
        INSERT INTO Patrocinadores(nitPatrocinador,razonSocial,correo,telefono)
            VALUES (xnitPatrocinador,xrazonSocial,xcorreo,xtelefono);
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'El patrocinador ya fue ingresado en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al insertar al patrocinador.');
    END;
        
    PROCEDURE MOD_Patrocinadores (
        xnitPatrocinador IN NUMBER,
        xtelefono IN NUMBER ) IS 
    BEGIN
        UPDATE Patrocinadores
            SET  telefono = xtelefono
        WHERE nitPatrocinador = xnitPatrocinador; 
        
        COMMIT;
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al modificar la informacion del Patrocinador.');
    END;
    
     PROCEDURE MOD_fechaPatrocinio(
        xidPatrocinador IN NUMBER,
        xcoEvento IN NUMBER,
        xfecha IN DATE) IS 
    BEGIN
        UPDATE fechaPatrocinio
            SET  fecha = xfecha
        WHERE idPatrocinador = xidPatrocinador AND 
              xcoEvento = coEvento; 
        
        COMMIT;
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al modificar la fecha de patrocinio.');
    END;
    
    PROCEDURE EL_Patrocinadores (
        xnitPatrocinador IN NUMBER ) IS
    BEGIN
        DELETE 
           FROM Patrocinadores 
        WHERE  xnitPatrocinador = nitPatrocinador;
        COMMIT;
        
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al eliminar el patrocinador.');
    END;
    
    FUNCTION CO_Patrocinadores 
        RETURN SYS_REFCURSOR
    IS INF_Patrocinadores  SYS_REFCURSOR ;
    BEGIN
       OPEN INF_Patrocinadores FOR 
       SELECT * 
       FROM Patrocinadores ;
       RETURN INF_Patrocinadores;
    END;
	
    FUNCTION CO_InfPatro
        RETURN SYS_REFCURSOR
    IS INF_InfPatro SYS_REFCURSOR;
    BEGIN
       OPEN INF_InfPatro FOR
           SELECT *
           FROM InfPatro;
       RETURN INF_InfPatro;
 
    END;
END PC_Patrocinadores ;

/

CREATE OR REPLACE PACKAGE BODY PC_Conciertos IS 
    PROCEDURE AD_Conciertos (
        xnombreConcierto IN VARCHAR , 
        xnuEvento  IN NUMBER ) IS
    BEGIN
        INSERT INTO Conciertos(nombreConcierto,nuEvento)
            VALUES (xnombreConcierto,xnuEvento);
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'El concierto ya fue ingresado en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al insertar el concierto.');
    END;
        
    PROCEDURE MOD_esAsignado (
        xnumConcierto IN NUMBER,
        xnumCamerino IN NUMBER,
        xfecha IN DATE) IS
    BEGIN
        UPDATE esAsignado 
            SET fecha = xfecha
        WHERE
            xnumConcierto = numConcierto AND 
            xnumCamerino = numCamerino ;   
        
        COMMIT;
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al modificar la fecha  de asignacion de un camerion para un concierto.');
    END;
    
    PROCEDURE MOD_Tiene (
        xidArti IN NUMBER,
        xnoCon IN NUMBER,
        xfecha IN DATE) IS 
    BEGIN
        UPDATE Tiene
            SET fecha = xfecha
        WHERE xidArti = idArti AND 
            xnoCon = noCon; 
        COMMIT;
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al modificar la informacion de la presentacion de los artistas a un concierto.');
    END;
    
    FUNCTION CO_Conciertos
        RETURN SYS_REFCURSOR 
    IS SYS_Conciertos SYS_REFCURSOR;
    BEGIN
        OPEN SYS_Conciertos FOR
            SELECT *
            FROM Conciertos ;
        RETURN SYS_Conciertos;
    END;
	
END PC_Conciertos ;

/

CREATE OR REPLACE PACKAGE BODY PC_Eventos IS 
    PROCEDURE AD_Eventos (
        xnomEvento IN VARCHAR , 
        xfechaEvento  IN DATE,
        xvalorEvento IN NUMBER) IS
    BEGIN
        INSERT INTO Eventos(nomEvento ,fechaEvento,valorEvento)
            VALUES (xnomEvento ,xfechaEvento,xvalorEvento);
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'El evento ya fue ingresado en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al insertar el evento.');
    END;
    
    PROCEDURE AD_Boletas(
        xcodigoBoleta IN VARCHAR,
        xcategoria IN VARCHAR , 
        xnumEvento  IN NUMBER,
        xnoZona IN NUMBER) IS
    BEGIN
        INSERT INTO Boletas(codigoBoleta ,categoria,numEvento,noZona)
            VALUES (xcodigoBoleta ,xcategoria,xnumEvento,xnoZona);
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'La boleta  ya fue ingresado en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al insertar la boleta.');
    END;
        
    PROCEDURE MOD_Eventos (
        xnoEvento IN NUMBER,
        xfechaEvento IN DATE )
    IS 
    BEGIN
        UPDATE Eventos
           SET fechaEvento = xfechaEvento
        WHERE xnoEvento = noEvento;
        COMMIT ;
        EXCEPTION 
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20001,'Error al modificarel evento.');
        
    END;
  
    FUNCTION CO_Eventos
        RETURN SYS_REFCURSOR
	IS INF_EVENTOS SYS_REFCURSOR;
    BEGIN
        OPEN INF_EVENTOS  FOR
            SELECT *
            FROM Eventos;
        RETURN INF_EVENTOS ;
    END;
    
END PC_Eventos ;

/


CREATE OR REPLACE PACKAGE BODY PC_Camerinos IS 
    PROCEDURE AD_Camerinos( 
        xnombreCamerino IN VARCHAR ,
        xdisponibilidad IN NUMBER ) IS
    BEGIN
        INSERT INTO Camerinos(nombreCamerino ,disponibilidad)
            VALUES (xnombreCamerino ,xdisponibilidad);
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'El camerino  ya fue ingresado en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al insertar el camerino.');
    END;
    
    PROCEDURE MOD_Camerinos(
        xnoCamerino IN NUMBER, 
        xdisponibilidad IN NUMBER ) IS
    BEGIN
        UPDATE Camerinos
           SET disponibilidad = xdisponibilidad
        WHERE xnoCamerino = noCamerino;
        COMMIT ;
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al modificar el camerino.');
        
        
    END;
        
    FUNCTION CO_Camerinos
        RETURN SYS_REFCURSOR
    IS INF_Camerinos SYS_REFCURSOR;
    BEGIN
        OPEN INF_Camerinos FOR 
            SELECT *
            FROM Camerinos ;
        RETURN INF_Camerinos ;
    END;
	
    FUNCTION CO_reporteCamerinos
        RETURN SYS_REFCURSOR
    IS INF_reporteCamerinos SYS_REFCURSOR;
    BEGIN
        OPEN INF_reporteCamerinos FOR 
            SELECT *
            FROM reporteCamerinos ;
        RETURN INF_reporteCamerinos  ;
    END;
END PC_Camerinos;

/