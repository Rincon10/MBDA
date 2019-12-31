CREATE OR REPLACE PACKAGE BODY PA_Musico IS
    PROCEDURE  Ad_Musico( 
        Xm_name IN VARCHAR , 
		Xborn IN DATE, 
		Xdied IN DATE , 
		Xborn_in IN NUMBER, 
		Xliving_in IN NUMBER,
        Xdetalle XMLTYPE ) IS
	BEGIN
        PC_Musico.Ad_Musico(Xm_name,Xborn,Xdied,Xborn_in,Xliving_in,Xdetalle);
	END;
	
    PROCEDURE Mod_Musico( 
        Xm_no IN NUMBER, 
        Xdied IN DATE,
		Xliving_in IN VARCHAR ) IS 
    BEGIN
        PC_Musico.Mod_Musico(Xm_no,Xdied,Xliving_in);
    END;

    PROCEDURE El_Musico( 
        Xm_no IN NUMBER ) IS 
    BEGIN 
        PC_Musico.El_Musico( Xm_no );
	END;

    FUNCTION CO_Musico RETURN XMLTYPE 
	    IS CO_XML XMLTYPE ;
	BEGIN
        CO_XML := PC_Musico.CO_Musico( );
	    RETURN CO_XML;
	END;

	FUNCTION CO_Musico_Ciudad( xplace_town IN VARCHAR ) RETURN SYS_REFCURSOR  
	    IS  musicoPorCiudad SYS_REFCURSOR ;
	BEGIN 
        musicoPorCiudad := PC_Musico.CO_Musico_Ciudad( xplace_town );
	    RETURN musicoPorCiudad;
	END;
	
	FUNCTION CO_Musico_Universidad( xuni IN VARCHAR ) RETURN SYS_REFCURSOR 
	    IS musicoUniverdiad SYS_REFCURSOR;
	BEGIN
        musicoUniverdiad := PC_Musico.CO_Musico_Universidad( xuni );
        RETURN 	musicoUniverdiad;		
	END;
    
	FUNCTION CO_Musico_mas_Premiado( xaño IN VARCHAR ) RETURN SYS_REFCURSOR
	    IS musicosPremiados SYS_REFCURSOR;
	BEGIN
        musicosPremiados := PC_Musico.CO_Musico_mas_Premiado( xaño) ;
	    RETURN musicosPremiados ;
	END;
END PA_Musico ;

/

CREATE OR REPLACE  PACKAGE BODY PA_Administrador IS
    FUNCTION CO_Musico_mas_Premiado( xaño IN VARCHAR ) RETURN SYS_REFCURSOR
	    IS musicosPremiados SYS_REFCURSOR;
	BEGIN
        musicosPremiados := PC_Musico.CO_Musico_mas_Premiado( xaño  );
        RETURN musicosPremiados ;
	END;
    
	FUNCTION CO_Composicion_Popular RETURN SYS_REFCURSOR
	    IS RTA SYS_REFCURSOR;
	BEGIN
		RTA := PC_Composicion.CO_Composicion_Popular;
		RETURN RTA;
	END;

END PA_Administrador;

/

CREATE OR REPLACE PACKAGE BODY PA_Compositor IS 
    PROCEDURE  Ad_Composicion( 
	    Xcomp_date IN DATE , 
	    Xc_title IN VARCHAR, 
	    Xc_in IN NUMBER) IS 
    BEGIN
        PC_Composicion.Ad_Composicion( Xcomp_date, Xc_title,Xc_in );
    END;
    
    FUNCTION CO_Composition RETURN XMLTYPE 
	    IS CO_XML XMLTYPE;
	BEGIN
		CO_XML := PC_Composicion.CO_Composition();
		RETURN CO_XML;
	END;
END  PA_Compositor ;
/