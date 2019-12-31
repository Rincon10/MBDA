CREATE OR REPLACE PACKAGE PC_Musico IS 
    PROCEDURE  Ad_Musico( 
        Xm_name IN VARCHAR , 
		Xborn IN DATE, 
		Xdied IN DATE , 
		Xborn_in IN NUMBER, 
		Xliving_in IN NUMBER,
        Xdetalle XMLTYPE );
	
	PROCEDURE Mod_Musico( 
        Xm_no IN NUMBER, 
        Xdied IN DATE,
		Xliving_in IN VARCHAR );
    
	PROCEDURE El_Musico( 
        Xm_no IN NUMBER );
	
	FUNCTION CO_Musico 
	    RETURN XMLTYPE;
	
	FUNCTION CO_Musico_Ciudad( xplace_town IN VARCHAR )
       	RETURN SYS_REFCURSOR ;
		
	FUNCTION CO_Musico_Universidad( xuni IN VARCHAR ) 
	    RETURN SYS_REFCURSOR ;
		
	FUNCTION CO_Musico_mas_Premiado( xaño IN VARCHAR )
	    RETURN SYS_REFCURSOR;
END PC_Musico;
/


CREATE OR REPLACE  PACKAGE  PC_Composicion IS
    PROCEDURE Ad_Composicion( 
	   Xcomp_date IN DATE , 
	   Xc_title IN VARCHAR, 
	   Xc_in IN NUMBER );
       
	FUNCTION CO_Composition
       RETURN XMLTYPE ;
       
	FUNCTION CO_Composicion_Popular
       RETURN SYS_REFCURSOR;
END PC_Composicion;


	