/*ActoresE*/


CREATE OR REPLACE PACKAGE PA_Mesero IS
    PROCEDURE AD_Mesas(
        xestadoMesa  IN VARCHAR,
		xnoSector IN NUMBER ,
		xidEmpleado IN NUMBER );
	
    
    PROCEDURE AD_Pedidos(
	    xnombreCliente IN VARCHAR,
		xfechaHorafin IN DATE,
		xnoMesa	IN NUMBER );
    
    PROCEDURE AD_Pedidos_Est(
	    xcoProducto IN NUMBER ,
		xnoPedido IN NUMBER ,
		xCantidad IN NUMBER ,
		xComentario VARCHAR2);
    	
	PROCEDURE MOD_Mesas(
	    xnoMesa IN NUMBER,
		xestadoMesa  IN VARCHAR,
		xidEmpleado IN NUMBER );
		
    PROCEDURE MOD_Pedidos(
	    xnoPedido IN NUMBER );
    
    PROCEDURE EL_Pedidos(
	     xnoPedido IN NUMBER );
        
	FUNCTION CO_Mesas
	    RETURN SYS_REFCURSOR;
	
    FUNCTION CO_Pedidos
     	RETURN SYS_REFCURSOR;	
        
	FUNCTION CO_Pedidos_Est 
        RETURN SYS_REFCURSOR;
        
	FUNCTION CO_Mesas_Libres	
	    RETURN SYS_REFCURSOR; 
		
END PA_Mesero;

/

CREATE OR REPLACE PACKAGE PA_SupervisorDeZona IS 
    PROCEDURE AD_Despachos(
	    xnoZona IN NUMBER );
    
    PROCEDURE AD_Despachos_sobreU(
        xnoCompra IN NUMBER,
        xnoDesp IN NUMBER,
        xcantidadDespachada IN NUMBER);
    
    PROCEDURE AD_Empleado(
        xidEmpleado IN NUMBER,
        xnombreEmpleado IN VARCHAR ,
        xtelefono IN NUMBER,
        xdetalle IN XMLTYPE);
    
    PROCEDURE AD_Empleado_Acce(
        xidEmpleado IN NUMBER,
        xnoZona IN NUMBER ,
        xfechaInicio IN DATE ,
        xfechaFin IN DATE );
        
    PROCEDURE AD_Empleado_FeLab(
        xidEmpleado IN NUMBER,
        xnoLabor IN NUMBER,
        xnombreCompañia IN VARCHAR,
        xfechaInicio IN DATE,
        xfechaFin IN DATE);
    
    PROCEDURE MOD_Empleado(
        xidEmpleado IN NUMBER,
        xtelefono IN NUMBER );
    
    PROCEDURE MOD_Empleado_Acce(
        xidEmpleado IN NUMBER,
        xnoZona IN NUMBER , 
        xfechaFin IN DATE  );
        
    PROCEDURE EL_Empleado(
        xidEmpleado IN NUMBER);
        
    FUNCTION CO_Despachos
        RETURN SYS_REFCURSOR;
    
    FUNCTION CO_Despachos_sobreU
        RETURN SYS_REFCURSOR;
    
    FUNCTION CO_Empleado
        RETURN SYS_REFCURSOR;
    
    FUNCTION CO_AccesoTiempo
        RETURN SYS_REFCURSOR;
    
    FUNCTION CO_FechaLaboral
        RETURN SYS_REFCURSOR;
    
    FUNCTION CO_empleadosCan
        RETURN SYS_REFCURSOR;
        
END PA_SupervisorDeZona;

/


CREATE OR REPLACE PACKAGE PA_GerenteDeAlimentos IS 
    PROCEDURE  AD_Insumos(
        xnombreInsumo IN VARCHAR) ;
		
	PROCEDURE AD_CantidadInsumo(
        xcoInsumo IN VARCHAR ,
        xnoCompra IN NUMBER,
        xfechaExpiracion IN DATE ,
        xcantidad IN NUMBER ,
        xprecioCompra IN NUMBER );
    
    PROCEDURE  AD_Proveedores(
        xidProveedor IN NUMBER,
        xnit IN NUMBER,
        xtipoNit IN CHAR ,
        xtelefono IN NUMBER );
		
	PROCEDURE  AD_PersonasNaturales(
        xidProveedor IN NUMBER,
        xnombre IN VARCHAR  ,
        xcorreo IN VARCHAR );
   
   PROCEDURE  AD_Empresas(
        xidProveedor IN NUMBER,
        xidRepresentante IN NUMBER,
        xrazonSocial IN VARCHAR);
        
    PROCEDURE AD_Compras(
		xfechaCompra IN DATE,
		xidProveedor IN NUMBER);
        
    PROCEDURE AD_Productos (
		xnombreProducto IN VARCHAR);
	
	PROCEDURE AD_CantidadProducto(
		xcoProducto IN NUMBER,
		xnoCompra IN NUMBER,
		xcantidad IN NUMBER,
		xnoLote IN NUMBER,
		xprecioCompra IN NUMBER);   
   

	PROCEDURE MOD_Proveedores(
        xidProveedor IN NUMBER,
        xtelefono IN NUMBER );
		
	PROCEDURE MOD_Empresas(
        xidProveedor IN NUMBER,
        xidRepresentante IN NUMBER );
		
	PROCEDURE EL_Proveedores(
        xidProveedor IN NUMBER);
    
    
    FUNCTION CO_Insumos
        RETURN SYS_REFCURSOR;
		
    
    FUNCTION CO_CantidadInsumo
        RETURN SYS_REFCURSOR;
    
	FUNCTION CO_Proveedores
        RETURN SYS_REFCURSOR;
		
	FUNCTION CO_PersonasNaturales
        RETURN SYS_REFCURSOR;
        
    FUNCTION CO_Empresas
        RETURN SYS_REFCURSOR;
    
    FUNCTION CO_ProveedoresPM
        RETURN SYS_REFCURSOR; 
    
	FUNCTION CO_Compras
        RETURN SYS_REFCURSOR ;	
			
	FUNCTION CO_Productos 
        RETURN SYS_REFCURSOR;
		
	FUNCTION CO_CantidadProducto
        RETURN SYS_REFCURSOR;
	
    
END PA_GerenteDeAlimentos;

/

CREATE OR REPLACE PACKAGE PA_Administrador IS 
    PROCEDURE AD_Zonas(
        xnombreZona IN VARCHAR,
        xubicacionZona IN CHAR);
        
    PROCEDURE AD_Sectores(
        xnombreSector IN VARCHAR,
        xnoZona IN NUMBER) ; 
        
    PROCEDURE AD_Labores(
		xnombreLabor IN VARCHAR);
        
    FUNCTION CO_Zonas
        RETURN SYS_REFCURSOR; 
        
    FUNCTION CO_Sectores
        RETURN SYS_REFCURSOR;
		
	FUNCTION CO_Labores
		RETURN SYS_REFCURSOR;	
		
END PA_ADMINISTRADOR;

/