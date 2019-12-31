/*ActoresI*/
CREATE OR REPLACE PACKAGE BODY PA_Mesero IS
    
    PROCEDURE AD_Mesas(
        xestadoMesa  IN VARCHAR,
		xnoSector IN NUMBER ,
		xidEmpleado IN NUMBER ) IS
    BEGIN 
        PC_Mesas.AD_Mesas(
            xestadoMesa,
            xnoSector,
            xidEmpleado
        );
    END;
	
    PROCEDURE AD_Pedidos(
	    xnombreCliente IN VARCHAR,
		xfechaHorafin IN DATE,
		xnoMesa	IN NUMBER ) IS
    BEGIN
        PC_Pedidos.AD_Pedidos(
            xnombreCliente,
            xfechaHorafin,
            xnoMesa
        );
    END;
    
    PROCEDURE AD_Pedidos_Est(
	    xcoProducto IN NUMBER ,
		xnoPedido IN NUMBER ,
		xCantidad IN NUMBER ,
		xComentario VARCHAR2) IS 
    BEGIN
        PC_Pedidos.AD_Pedidos_Est(
            xcoProducto,
            xnoPedido,
            xCantidad,
            xComentario
        );
    END;
    	
	PROCEDURE MOD_Mesas(
	    xnoMesa IN NUMBER,
		xestadoMesa  IN VARCHAR,
		xidEmpleado IN NUMBER ) IS
    BEGIN
        PC_Mesas.MOD_Mesas(
            xnoMesa,
            xestadoMesa,
            xidEmpleado
        );
    END;
		
    PROCEDURE MOD_Pedidos(
	    xnoPedido IN NUMBER ) IS
    BEGIN
        PC_Pedidos.MOD_Pedidos(
            xnoPedido
        );
    END;
    
    PROCEDURE EL_Pedidos(
	     xnoPedido IN NUMBER ) IS
    BEGIN
        PC_Pedidos.EL_Pedidos(
            xnoPedido
        );
    END;
        
	FUNCTION CO_Mesas
	    RETURN SYS_REFCURSOR 
    IS CO_Mesas_INF SYS_REFCURSOR;
	BEGIN
        CO_Mesas_INF := PC_Mesas.CO_Mesas;
        RETURN 	CO_Mesas_INF;
	END;
	
    FUNCTION CO_Pedidos
     	RETURN SYS_REFCURSOR
    IS CO_PedidosINF SYS_REFCURSOR;
	BEGIN
        CO_PedidosINF  :=  PC_Pedidos.CO_Pedidos;
		RETURN CO_PedidosINF;
	END;
        
	FUNCTION CO_Pedidos_Est 
        RETURN SYS_REFCURSOR
    IS INF_Pedidos_est SYS_REFCURSOR;
    BEGIN
        INF_Pedidos_est := PC_Pedidos.CO_Pedidos_Est;
        RETURN INF_Pedidos_est;
    END;
        
	FUNCTION CO_Mesas_Libres	
	    RETURN SYS_REFCURSOR
    IS INF_Mesas_Libres SYS_REFCURSOR;
    BEGIN
        INF_Mesas_Libres := PC_Mesas.CO_Mesas_Libres;	
        RETURN INF_Mesas_Libres ;			
    END;
		
END PA_Mesero;

/

CREATE OR REPLACE PACKAGE BODY PA_SupervisorDeZona IS
    PROCEDURE AD_Despachos(
	    xnoZona IN NUMBER ) IS
    BEGIN
        PC_Despachos.AD_Despachos(
            xnoZona
        );
    END;
    
    PROCEDURE AD_Despachos_sobreU(
        xnoCompra IN NUMBER,
        xnoDesp IN NUMBER,
        xcantidadDespachada IN NUMBER) IS
    BEGIN
        PC_Despachos.AD_Despachos_sobreU(
            xnoCompra,
            xnoDesp,
            xcantidadDespachada
        );
    END;
    
    PROCEDURE AD_Empleado(
        xidEmpleado IN NUMBER,
        xnombreEmpleado IN VARCHAR ,
        xtelefono IN NUMBER,
        xdetalle IN XMLTYPE) IS 
    BEGIN
        PC_Empleados.AD_Empleado(
            xidEmpleado,
            xnombreEmpleado,
            xtelefono,
            xdetalle 
        );
    END;
    
    PROCEDURE AD_Empleado_Acce(
        xidEmpleado IN NUMBER,
        xnoZona IN NUMBER ,
        xfechaInicio IN DATE ,
        xfechaFin IN DATE ) IS
    BEGIN
        PC_Empleados.AD_Empleado_Acce(
            xidEmpleado,
            xnoZona,
            xfechaInicio,
            xfechaFin
        );
    END;
        
    PROCEDURE AD_Empleado_FeLab(
        xidEmpleado IN NUMBER,
        xnoLabor IN NUMBER,
        xnombreCompañia IN VARCHAR,
        xfechaInicio IN DATE,
        xfechaFin IN DATE) IS
    BEGIN
        PC_Empleados.AD_Empleado_FeLab(
            xidEmpleado,
            xnoLabor,
            xnombreCompañia,
            xfechaInicio,
            xfechaFin
        );
    END;
    
    PROCEDURE MOD_Empleado(
        xidEmpleado IN NUMBER,
        xtelefono IN NUMBER ) IS
    BEGIN
        PC_Empleados.MOD_Empleado(
            xidEmpleado,
            xtelefono
        );
    END;
    
    PROCEDURE MOD_Empleado_Acce(
        xidEmpleado IN NUMBER,
        xnoZona IN NUMBER , 
        xfechaFin IN DATE  ) IS
    BEGIN
        PC_Empleados.MOD_Empleado_Acce(
            xidEmpleado,
            xnoZona,
            xfechaFin
        );
    END;
        
    PROCEDURE EL_Empleado(
        xidEmpleado IN NUMBER) IS
    BEGIN
        PC_Empleados.EL_Empleado(
            xidEmpleado
        );
    END;
        
    FUNCTION CO_Despachos
        RETURN SYS_REFCURSOR IS 
    CO_Despachos_INF SYS_REFCURSOR;
    BEGIN
        CO_Despachos_INF :=  PC_Despachos.CO_Despachos;
        RETURN CO_Despachos_INF;
    END;
    
    FUNCTION CO_Despachos_sobreU
        RETURN SYS_REFCURSOR IS 
    CO_sobreU_INF SYS_REFCURSOR ;
    BEGIN 
        CO_sobreU_INF := PC_Despachos.CO_Despachos_sobreU;
        RETURN CO_sobreU_INF;
    END;
    
    FUNCTION CO_Empleado
        RETURN SYS_REFCURSOR
    IS INF_Empleados SYS_REFCURSOR;
    BEGIN
        INF_Empleados := PC_Empleados.CO_Empleado;
        RETURN INF_Empleados;
    END;
    
    FUNCTION CO_AccesoTiempo
        RETURN SYS_REFCURSOR
    IS INF_AccesoTiempo SYS_REFCURSOR;
    BEGIN
        INF_AccesoTiempo := PC_Empleados.CO_AccesoTiempo;
        RETURN INF_AccesoTiempo;
    END;
    
    FUNCTION CO_FechaLaboral
        RETURN SYS_REFCURSOR
    IS INF_FechaLaboral SYS_REFCURSOR;
    BEGIN
        INF_FechaLaboral := PC_Empleados.CO_FechaLaboral ;
        RETURN INF_FechaLaboral;
    END;
    
    FUNCTION CO_empleadosCan
        RETURN SYS_REFCURSOR
    IS INF_empleadosCan SYS_REFCURSOR;
    BEGIN
       INF_empleadosCan := PC_Empleados.CO_empleadosCan;
        RETURN INF_empleadosCan;
    END;
END PA_SupervisorDeZona;

/

CREATE OR REPLACE PACKAGE BODY PA_GerenteDeAlimentos IS
    PROCEDURE  AD_Insumos(
        xnombreInsumo IN VARCHAR) IS
    BEGIN
        PC_Insumos.AD_Insumos(
            xnombreInsumo
        );
    END;
		
	PROCEDURE AD_CantidadInsumo(
        xcoInsumo IN VARCHAR ,
        xnoCompra IN NUMBER,
        xfechaExpiracion IN DATE ,
        xcantidad IN NUMBER ,
        xprecioCompra IN NUMBER )IS
    BEGIN
        PC_Insumos.AD_CantidadInsumo(
            xcoInsumo,
            xnoCompra,
            xfechaExpiracion,
            xcantidad,
            xprecioCompra
        );
    END;
    
    PROCEDURE  AD_Proveedores(
        xidProveedor IN NUMBER,
        xnit IN NUMBER,
        xtipoNit IN CHAR ,
        xtelefono IN NUMBER ) IS
    BEGIN
        PC_Proveedores.AD_Proveedores(
            xidProveedor,
            xnit,
            xtipoNit,
            xtelefono
        );
    END;
		
	PROCEDURE  AD_PersonasNaturales(
        xidProveedor IN NUMBER,
        xnombre IN VARCHAR  ,
        xcorreo IN VARCHAR ) IS
    BEGIN
        PC_Proveedores.AD_PersonasNaturales(
            xidProveedor,
            xnombre,
            xcorreo
        );
    END;
   
   PROCEDURE  AD_Empresas(
        xidProveedor IN NUMBER,
        xidRepresentante IN NUMBER,
        xrazonSocial IN VARCHAR) IS
    BEGIN
        PC_Proveedores.AD_Empresas(
            xidProveedor,
            xidRepresentante,
            xrazonSocial
        );
    END;
        
    PROCEDURE AD_Compras(
		xfechaCompra IN DATE,
		xidProveedor IN NUMBER)IS
    BEGIN
        PC_Compras.AD_Compras(
            xfechaCompra,
            xidProveedor
        );
    END;
        
    PROCEDURE AD_Productos (
		xnombreProducto IN VARCHAR) IS
    BEGIN
        PC_Productos.AD_Productos(
            xnombreProducto
        );
    END;
	
	PROCEDURE AD_CantidadProducto(
		xcoProducto IN NUMBER,
		xnoCompra IN NUMBER,
		xcantidad IN NUMBER,
		xnoLote IN NUMBER,
		xprecioCompra IN NUMBER) IS
    BEGIN
        PC_Productos.AD_CantidadProducto(
            xcoProducto,
            xnoCompra,
            xcantidad,
            xnoLote,
            xprecioCompra
        );
    END;
   

	PROCEDURE MOD_Proveedores(
        xidProveedor IN NUMBER,
        xtelefono IN NUMBER ) IS
    BEGIN
        PC_Proveedores.MOD_Proveedores(
            xidProveedor,
            xtelefono
        );
    END;
		
	PROCEDURE MOD_Empresas(
        xidProveedor IN NUMBER,
        xidRepresentante IN NUMBER ) IS
    BEGIN
        PC_Proveedores.MOD_Empresas(
            xidProveedor,
            xidRepresentante
        );
    END;
		
	PROCEDURE EL_Proveedores(
        xidProveedor IN NUMBER) IS
    BEGIN
        PC_Proveedores.EL_Proveedores(
            xidProveedor
        );
    END;
    
    
    FUNCTION CO_Insumos
        RETURN SYS_REFCURSOR
    IS INF_insumos SYS_REFCURSOR;
    BEGIN
        INF_Insumos := PC_Insumos.CO_Insumos;
        RETURN INF_Insumos;
    END;
		
    
    FUNCTION CO_CantidadInsumo
        RETURN SYS_REFCURSOR
    IS INF_CantidadInsumo SYS_REFCURSOR;
    BEGIN
        INF_CantidadInsumo := PC_Insumos.CO_CantidadInsumo;
        RETURN INF_CantidadInsumo;
    END;
    
	FUNCTION CO_Proveedores
        RETURN SYS_REFCURSOR IS 
    INF_Proveedores SYS_REFCURSOR;
    BEGIN
        INF_Proveedores := PC_Proveedores.CO_Proveedores;
        RETURN INF_Proveedores;
    END;
		
	FUNCTION CO_PersonasNaturales
        RETURN SYS_REFCURSOR IS
    INF_PersonasNaturales SYS_REFCURSOR;
    BEGIN
        INF_PersonasNaturales := PC_Proveedores.CO_PersonasNaturales;
        RETURN INF_PersonasNaturales;
    END;
        
    FUNCTION CO_Empresas
        RETURN SYS_REFCURSOR IS
    INF_Empresas SYS_REFCURSOR;
    BEGIN
        INF_Empresas := PC_Proveedores.CO_Empresas;
        RETURN INF_Empresas;
    END;
    
    FUNCTION CO_ProveedoresPM
        RETURN SYS_REFCURSOR IS
    INF_ProveedoresPM SYS_REFCURSOR;
    BEGIN
        INF_ProveedoresPM := PC_Proveedores.CO_ProveedoresPM;
        RETURN INF_ProveedoresPM;
    END;
    
	FUNCTION CO_Compras
        RETURN SYS_REFCURSOR  IS
    INF_Compras SYS_REFCURSOR;
    BEGIN
        INF_Compras := PC_Compras.CO_Compras;
        RETURN INF_Compras;
    END;
			
	FUNCTION CO_Productos 
        RETURN SYS_REFCURSOR IS
    INF_Productos SYS_REFCURSOR;
    BEGIN
        INF_Productos := PC_Productos.CO_Productos;
        RETURN INF_Productos;
    END;
		
	FUNCTION CO_CantidadProducto
        RETURN SYS_REFCURSOR IS
    INF_CantidadProducto SYS_REFCURSOR;
    BEGIN
        INF_CantidadProducto := PC_Productos.CO_CantidadProducto;
        RETURN INF_CantidadProducto;
    END;
        
END PA_GerenteDeAlimentos;

/

CREATE OR REPLACE PACKAGE BODY PA_Administrador IS
    PROCEDURE AD_Zonas(
        xnombreZona IN VARCHAR,
        xubicacionZona IN CHAR) IS
	BEGIN
		 PC_Zonas.AD_Zonas(xnombreZona,xubicacionZona);
	END;
        
    PROCEDURE AD_Sectores(
        xnombreSector IN VARCHAR,
        xnoZona IN NUMBER) IS
	BEGIN 
		PC_Zonas.AD_Sectores(xnombreSector,xnoZona);
		
	END;
        
    PROCEDURE AD_Labores(
		xnombreLabor IN VARCHAR)IS
	
	BEGIN 
		PC_Labores.AD_Labores(xnombreLabor);
		
	END;
        
		
    FUNCTION CO_Zonas
        RETURN SYS_REFCURSOR 
	IS INF_Zonas SYS_REFCURSOR;
	BEGIN
		INF_Zonas := PC_Zonas.CO_Zonas;
		RETURN INF_Zonas;
	END;
	
        
    FUNCTION CO_Sectores
        RETURN SYS_REFCURSOR
	IS INF_Sectores SYS_REFCURSOR;
	
	BEGIN 
		INF_Sectores := PC_Zonas.CO_Sectores;
		RETURN INF_Sectores;
	END;
		
	FUNCTION CO_Labores
		RETURN SYS_REFCURSOR
	IS INF_Labores SYS_REFCURSOR;
	
	BEGIN
		INF_Labores := PC_Labores.CO_Labores;
		RETURN INF_Labores;
	END;
	   
END PA_Administrador;

/