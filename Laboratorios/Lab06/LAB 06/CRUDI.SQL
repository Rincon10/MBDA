CREATE OR REPLACE PACKAGE BODY PC_Registros IS 
    PROCEDURE	AD_Registros(
	     xcomentario IN VARCHAR,
		 xtiempo IN NUMBER,
		 xposicion NUMBER,
		 xrevision IN XMLTYPE,
		 xdificultad IN CHAR,
		 xnomSegmento IN VARCHAR,
		 xidCiclista IN NUMBER )IS
	cError NUMBER;
	BEGIN
        INSERT INTO Registros(comentario,tiempo,posicion,revision,dificultad,nomSegmento,idCiclista)
		    VALUES(xcomentario,xtiempo,xposicion,xrevision,xdificultad,xnomSegmento,xidCiclista);
		COMMIT;
		EXCEPTION 
		WHEN DUP_VAL_ON_INDEX THEN 
		    ROLLBACK;
			cError := -20001;
			RAISE_APPLICATION_ERROR(cError,'No Pueden existir comentarios repetidos en la tabla de registros.');
		WHEN OTHERS THEN
		    ROLLBACK;
			cError := -20001;
			RAISE_APPLICATION_ERROR(cError,'Error al momento de insertar en registros.');
	END;
		 
	PROCEDURE MOD_Registros(
	     xnumero IN NUMBER,
		 xrevision IN XMLTYPE,
		 xcomentario IN VARCHAR)  IS
	cError NUMBER;
	BEGIN 
	    UPDATE Registros  
		    SET  revision = xrevision,
			     comentario = xcomentario
		WHERE numero = xnumero;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN 
		   ROLLBACK;
		   cError := -20001;
		   RAISE_APPLICATION_ERROR(cError,'Error al modificar el registro.');
	END;
	
	PROCEDURE EL_Registros(
	    xnumero IN NUMBER ) IS 
	cError NUMBER;
	BEGIN
	    DELETE 
		FROM Fotos
        WHERE noRegistro = xnumero;		
		
	    DELETE 
        FROM Registros
        WHERE numero = xnumero;		
		
		COMMIT ;
		EXCEPTION
		WHEN OTHERS THEN
		    ROLLBACK;
			cError := -20001;
		    RAISE_APPLICATION_ERROR(cError,'Error al eliminar el registro.');
	END;
	
	
	FUNCTION CO_Registros
	    RETURN SYS_REFCURSOR IS
	INF_Registros  SYS_REFCURSOR;
	BEGIN 
	    OPEN INF_Registros FOR
		    SELECT *
			FROM Registros;
		RETURN INF_Registros;
	END;
	
    FUNCTION CO_SeccionesDesc 
         RETURN SYS_REFCURSOR 
    IS INF_SeccionesDesc SYS_REFCURSOR;
    BEGIN 
       OPEN INF_SeccionesDesc  FOR 
           SELECT  *
           FROM SeccionesDescenso;
        RETURN INF_SeccionesDesc;
    END;
    
    PROCEDURE AD_Registros_Foto(
	     xnoFoto IN NUMBER ,
		 xfoto IN VARCHAR ,
		 xnoRegistro IN NUMBER )IS
    cError NUMBER;
    BEGIN 
         INSERT INTO Fotos(noFoto,foto,noRegistro)
             VALUES(xnoFoto,xfoto,xnoRegistro);
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK ;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError ,'El numero de la foto ingresado ya se encuentra en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK ;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError ,'Error al insertar la(s) foto(s) de un registro.');
    END;
	
	PROCEDURE MOD_Fotos(
	     xnoFoto IN NUMBER,
		 xfoto IN VARCHAR ) IS
    cError NUMBER;
    BEGIN 
        UPDATE Fotos
            SET foto = xfoto
        WHERE xnoFoto = noFoto;
        COMMIT;
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK ;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError ,'Error al modificar la(s) foto(s) de un registro.');
    END;
	
	FUNCTION CO_Fotos
	    RETURN SYS_REFCURSOR 
    IS INF_Fotos SYS_REFCURSOR;
    BEGIN 
        OPEN INF_Fotos FOR
            SELECT   * 
            FROM Fotos
            ORDER BY noFoto;
        RETURN INF_Fotos;
    END;

END PC_Registros;
/


CREATE OR REPLACE PACKAGE BODY  PC_Carreras IS 
    PROCEDURE AD_Carreras(
		xnombre IN VARCHAR,
		xpais IN VARCHAR,
		xcategoria IN NUMBER,
		xperiodicidad IN VARCHAR) IS
    cError NUMBER;
    BEGIN 
        INSERT INTO Carreras(nombre,pais,categoria,periodicidad)
            VALUES (xnombre,xpais,xcategoria,xperiodicidad);
        COMMIT;
        EXCEPTION 
        WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError, 'Error al insertar la carrera.');
    END;
    
    PROCEDURE MOD_Carreras(
        xcodigo IN VARCHAR,
        xcategoria IN NUMBER,
		xperiodicidad IN VARCHAR) IS
    cError NUMBER;
    BEGIN 
        UPDATE Carreras 
           SET categoria = xcategoria, periodicidad = xperiodicidad
        WHERE xcodigo = codigo;
    EXCEPTION 
        WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError, 'Error al intentar modificar  la carrera.');
    END;
    PROCEDURE EL_Carreras(
        xcodigo IN VARCHAR )IS
    cError NUMBER;
    BEGIN 
        DELETE 
        FROM Carreras 
        WHERE xcodigo = codigo ;
    EXCEPTION 
        WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError, 'Error al eliminar la carrera.');
    END;
    
    FUNCTION CO_Carreras 
        RETURN SYS_REFCURSOR 
    IS INF_Carreras SYS_REFCURSOR;
    BEGIN
        OPEN INF_Carreras FOR
            SELECT *
            FROM Carreras;
        RETURN INF_Carreras;
    END;

    PROCEDURE AD_Carreras_Pun(
        xcoPunto IN NUMBER,
        xnombre IN VARCHAR,
        xtipo IN CHAR ,
        xdistancia IN NUMBER ,
        xtiempoLimite IN VARCHAR  ,
        xcoCarrera IN  NUMBER ) IS 
    cError NUMBER;
    BEGIN 
        INSERT INTO Puntos(coPunto,nombre,tipo,distancia,tiempoLimite,coCarrera)
            VALUES (xcoPunto,xnombre,xtipo,xdistancia,xtiempoLimite,xcoCarrera);
        COMMIT;
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            cError := -20001 ;
            RAISE_APPLICATION_ERROR(cError ,'Error el codigo del punto ya existe.');
        WHEN OTHERS THEN 
            ROLLBACK;
            cError := -20001 ;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar el punto ');            
    END;
        
    PROCEDURE MOD_Carreras_Pun(
       xcoPunto IN NUMBER,
       xtipo IN CHAR ,
       xtiempoLimite IN VARCHAR ) IS
    BEGIN 
       UPDATE Puntos
           SET tiempoLimite = xtiempoLimite, tipo = xtipo
       WHERE xcoPunto = coPunto ;
    END;

    FUNCTION CO_Carreras_Pun 
       RETURN SYS_REFCURSOR 
    IS
    INF_Carreras SYS_REFCURSOR; 
    BEGIN
       OPEN INF_Carreras FOR
           SELECT * 
           FROM Puntos;
       RETURN INF_Carreras;
    END;
    
    PROCEDURE AD_Carreras_Prop(
        xidMiembro IN NUMBER,
        xcoCarrera IN VARCHAR,
        xporcentaje IN NUMBER ) IS
    cError NUMBER;
    BEGIN 
        INSERT INTO PropiedadDe 
            VALUES(xidMiembro,xcoCarrera,xporcentaje);
        COMMIT ;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'la carrera  ya fue registrada con el miebro especificado.');
        WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar en Propiedad de.');
        
    END;
        
    PROCEDURE EL_Carreras_Prop(
        xidMiembro IN NUMBER,
        xcoCarrera IN VARCHAR) IS 
    cError NUMBER;
    BEGIN
        DELETE PropiedadDe  
        WHERE 
            xidMiembro = idMiembro AND 
            xcoCarrera = coCarrera   ;
        COMMIT ;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'la carrera  ya fue registrada con el miebro especificado.');
        WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar en Propiedad de.');
        
    END;
    FUNCTION CO_Carreras_Prop
        RETURN SYS_REFCURSOR IS 
    INF_Carreras_Prop SYS_REFCURSOR;
    BEGIN 
        OPEN INF_Carreras_Prop FOR
            SELECT *
            FROM PropiedadDe;
        RETURN INF_Carreras_Prop;
    END;
END PC_Carreras;
/


CREATE OR REPLACE PACKAGE BODY PC_Miembros IS
    PROCEDURE AD_Miembros IS
    cError NUMBER;
    BEGIN
        
        INSERT INTO Miembros
            SELECT  
                C,
                TIPO,
                NUMERO,
                PAIS,
                CORREO
            FROM V_Miembros;
        COMMIT;
        EXCEPTION 
        WHEN  OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'La base de datos ya fue importada a miembros');
    END;
    
    PROCEDURE AD_Personas IS
    cError NUMBER;
    BEGIN
        INSERT INTO Personas
            SELECT *
            FROM V_Personas;
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'La base de datos ya fue importada a Personas');
        WHEN  OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Se debe importar primero la base de datos de Miembros');
    END;
    
    PROCEDURE AD_Empresas IS
    cError NUMBER;
    BEGIN
        INSERT INTO Empresas
            SELECT *
            FROM V_Empresas;
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'La base de datos ya fue importada a Empresas');
        WHEN  OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Se debe importar primero la base de datos de Miembros o de Personas.');
    END;
    
    PROCEDURE AD_Ciclistas IS
    cError NUMBER;
    BEGIN
        INSERT INTO Ciclistas
            SELECT 
                C,
                TO_DATE(NACIMIENTO,'YYYY-MM-DD'),
                CATEGORIA
            FROM V_Ciclistas
            WHERE LENGTH( NACIMIENTO ) = 10;
        COMMIT;
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'La base de datos ya fue importada a Personas');
        WHEN  OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Se debe importar primero la base de datos de Personas');
    END;
END PC_Miembros;





