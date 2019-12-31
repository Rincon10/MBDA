CREATE OR REPLACE PACKAGE BODY PC_Musico IS
    PROCEDURE  Ad_Musico( 
        Xm_name IN VARCHAR , 
		Xborn IN DATE, 
		Xdied IN DATE , 
		Xborn_in IN NUMBER, 
		Xliving_in IN NUMBER,
        Xdetalle XMLTYPE ) IS
	BEGIN
        INSERT INTO musician( m_name, born, died, born_in, living_in,detalle) 
            VALUES(Xm_name,Xborn,Xdied,Xborn_in,Xliving_in,Xdetalle);
        COMMIT; 
        EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001,'Error al momento de insertar el musico');
	END;
	
    PROCEDURE Mod_Musico( 
        Xm_no IN NUMBER, 
        Xdied IN DATE,
		Xliving_in IN VARCHAR ) IS 
    BEGIN
        UPDATE musician 
		   SET died = Xdied, living_in = Xliving_in
		WHERE m_no = Xm_no;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
		    ROLLBACK;
		    RAISE_APPLICATION_ERROR(-20002,'Error al modificar la informacion del musico ');
			
    END;

    PROCEDURE El_Musico( 
        Xm_no IN NUMBER ) IS 
    BEGIN 
        DELETE  FROM  musician
            WHERE m_no = Xm_no;
		COMMIT;
        EXCEPTION
        WHEN OTHERS THEN 
            ROLLBACK;
			RAISE_APPLICATION_ERROR(-20003,'Error al eliminar el musico');		
	END;

    FUNCTION CO_Musico RETURN XMLTYPE 
	    IS CO_XML XMLTYPE ;
	BEGIN
	    CO_XML :=  dbms_xmlgen.getxmltype(
		                        'SELECT *
								FROM musician');
		RETURN CO_XML;
	END;

	FUNCTION CO_Musico_Ciudad( xplace_town IN VARCHAR ) RETURN SYS_REFCURSOR  
	    IS  musicoPorCiudad SYS_REFCURSOR ;
	BEGIN 
	    OPEN musicoPorCiudad FOR 
		    SELECT *
			FROM HARD14
			WHERE place_town = xplace_town;
		RETURN musicoPorCiudad;
	END;
	
	FUNCTION CO_Musico_Universidad( xuni IN VARCHAR ) RETURN SYS_REFCURSOR 
	    IS musicoUniverdiad SYS_REFCURSOR;
	BEGIN
	    OPEN musicoUniverdiad FOR
            SELECT *
            FROM mUniversidad
			WHERE uni = xuni;
        RETURN 	musicoUniverdiad;		
	END;
    
	FUNCTION CO_Musico_mas_Premiado( xaño IN VARCHAR ) RETURN SYS_REFCURSOR
	    IS musicosPremiados SYS_REFCURSOR;
	BEGIN
	    OPEN musicosPremiados FOR
            SELECT *
			FROM musicoMasPremiado
            WHERE xaño = año;
        RETURN musicosPremiados ;
	END;
END PC_Musico;

/

CREATE OR REPLACE  PACKAGE BODY PC_Composicion IS
    PROCEDURE Ad_Composicion( 
	   Xcomp_date IN DATE , 
	   Xc_title IN VARCHAR, 
	   Xc_in IN NUMBER ) IS 
    BEGIN
        INSERT INTO composition( comp_date , c_title,c_in )
		    VALUES( Xcomp_date, Xc_title,Xc_in );
		COMMIT;
		EXCEPTION 
		WHEN OTHERS THEN 
		    ROLLBACK;
		    RAISE_APPLICATION_ERROR(-20008,'Se presento un erro al momento de insertar la composicion');
			
	END;
    
	FUNCTION CO_Composition RETURN XMLTYPE 
	    IS CO_XML XMLTYPE;
	BEGIN
		CO_XML := dbms_xmlgen.getxmltype( 
		                        'SELECT *
								FROM composition');
		RETURN CO_XML;
	END;
	FUNCTION CO_Composicion_Popular RETURN SYS_REFCURSOR
	    IS RTA SYS_REFCURSOR;
	BEGIN
	    OPEN RTA FOR 
		    SELECT * 
			FROM compPopu;
		RETURN RTA;
	END;
END PC_Composicion;
