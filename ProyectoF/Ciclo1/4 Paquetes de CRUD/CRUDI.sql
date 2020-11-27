CREATE OR REPLACE PACKAGE BODY PC_Mesas IS 
    PROCEDURE AD_Mesas(
        xestadoMesa  IN VARCHAR,
		xnoSector IN NUMBER ,
		xidEmpleado IN NUMBER ) IS 
	cError  NUMBER ;
	BEGIN
	    INSERT INTO Mesas (estadoMesa,noSector,idEmpleado)
		    VALUES(xestadoMesa,xnoSector,xidEmpleado);
		COMMIT;
		EXCEPTION 
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Ocurrio un error al insertar la mesa ');
	END ;
	
	PROCEDURE MOD_Mesas(
	    xnoMesa IN NUMBER,
		xestadoMesa  IN VARCHAR,
		xidEmpleado IN NUMBER )IS
	cError  NUMBER ;
	BEGIN
        UPDATE Mesas 
		    SET estadoMesa = xestadoMesa,
                idEmpleado = xidEmpleado
        WHERE xnoMesa = noMesa;
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
		WHEN OTHERS THEN 
		    ROLLBACK;
		    cError := -20001;
		    RAISE_APPLICATION_ERROR(cError, 'Ocurrio un error al actualizar la mesa');		
	END;
		
	PROCEDURE EL_Mesas(
	    xnoMesa IN NUMBER) IS 
	cError  NUMBER ;
	BEGIN
	    DELETE 
		    FROM Mesas
		WHERE xnoMesa = noMesa;
        COMMIT;
		EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
	    WHEN OTHERS THEN 
		    ROLLBACK;
		    cError := -20001;
		    RAISE_APPLICATION_ERROR(cError, 'No se puede eliminar una mesa que tiene pedidos ');	
	END;
	
	FUNCTION CO_Mesas 
	    RETURN SYS_REFCURSOR
	IS CO_Mesas_INF SYS_REFCURSOR;
	BEGIN
        OPEN CO_Mesas_INF FOR
            SELECT *
            FROM Mesas;
        RETURN 	CO_Mesas_INF;
	END;
	
	FUNCTION CO_Mesas_Libres 
	    RETURN SYS_REFCURSOR 
	IS INF_Mesas_Libres SYS_REFCURSOR;
    BEGIN
        OPEN INF_Mesas_Libres  FOR 
            SELECT *
            FROM MesasLibreS;	
        RETURN INF_Mesas_Libres ;			
    END;	
END PC_Mesas;

/

CREATE OR REPLACE PACKAGE BODY PC_Pedidos IS
    PROCEDURE AD_Pedidos(
	    xnombreCliente IN VARCHAR,
		xfechaHorafin IN DATE ,
		xnoMesa	IN NUMBER ) IS
	cError  NUMBER ;
	BEGIN
        INSERT INTO Pedidos(nombreCliente,fechaHorafin,noMesa)
		    VALUES(xnombreCliente,xfechaHorafin,xnoMesa);
		COMMIT;
		EXCEPTION 
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
		WHEN OTHERS THEN 
		    ROLLBACK;
		    cError := -20001;
		    RAISE_APPLICATION_ERROR(cError,'Error al momento de insertar el pedido');
	END;
	
    PROCEDURE AD_Pedidos_Est(
	    xcoProducto IN NUMBER ,
		xnoPedido IN NUMBER ,
		xCantidad IN NUMBER ,
		xComentario VARCHAR2) IS
    cError  NUMBER ;
	BEGIN 
	    INSERT INTO EstaEn(coProducto,noPedido,Cantidad,Comentario)
		    VALUES(xcoProducto,xnoPedido,xCantidad,xComentario);
		COMMIT;
		EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
		WHEN DUP_VAL_ON_INDEX THEN 
		    ROLLBACK;
            cError := -20001;
		    RAISE_APPLICATION_ERROR(cError,'El producto especificado ya fue ingresado en el pedido');
		WHEN OTHERS THEN 
		    ROLLBACK;
            cError := -20001;
		    RAISE_APPLICATION_ERROR(cError,'Error al insertar la informacion especifica del pedido');
	END;
    
	PROCEDURE MOD_Pedidos(
	    xnoPedido IN NUMBER ) 	IS
	cError  NUMBER ;
	BEGIN
	    UPDATE  Pedidos
		    SET fechaHorafin = SYSDATE
		WHERE xnoPedido = noPedido;
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN OTHERS THEN 
		    ROLLBACK;
		    cError := -20001;
		    RAISE_APPLICATION_ERROR(cError,'Error al momento de modificar el pedido');
	END;
		
	PROCEDURE EL_Pedidos(
	     xnoPedido IN NUMBER )IS
	cError  NUMBER ;
	BEGIN
	    DELETE 
		    FROM Pedidos
		WHERE xnoPedido = noPedido;
		COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
       	WHEN OTHERS THEN
		    ROLLBACK;
		    cError := -20001;
		    RAISE_APPLICATION_ERROR(cError,'Error al momento de eliminar  el pedido');
	END;
	
	FUNCTION CO_Pedidos 
	    RETURN SYS_REFCURSOR 
	IS CO_PedidosINF SYS_REFCURSOR;
	BEGIN
        OPEN CO_PedidosINF  FOR
            SELECT *
            FROM Pedidos;
		RETURN CO_PedidosINF;
	END;
    
    FUNCTION CO_Pedidos_Est 
        RETURN SYS_REFCURSOR
    IS INF_Pedidos_est SYS_REFCURSOR;
    BEGIN
        OPEN INF_Pedidos_est FOR
            SELECT * 
            FROM EstaEn;
        RETURN INF_Pedidos_est;
    END;
    
    FUNCTION CO_PedidosPorZ 
        RETURN SYS_REFCURSOR
    IS INF_PedidosPorZ SYS_REFCURSOR;
    BEGIN
        OPEN INF_PedidosPorZ FOR
            SELECT * 
            FROM PedidosPorZ;
        RETURN INF_PedidosPorZ;
    END;
END PC_Pedidos;

/

CREATE OR REPLACE PACKAGE BODY PC_Despachos IS
    PROCEDURE AD_Despachos(
	    xnoZona IN NUMBER ) IS
	cError  NUMBER ;
	BEGIN
        INSERT INTO Despachos(noZona)
            VALUES( xnoZona );
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
       	WHEN OTHERS THEN
		    ROLLBACK;
		    cError := -20001;
		    RAISE_APPLICATION_ERROR(cError,'Error al momento de insertar en despachos Revisar que el numero de la zona insertada exista.');	
	END;
    
    PROCEDURE AD_Despachos_sobreU(
        xnoCompra IN NUMBER,
        xnoDesp IN NUMBER,
        xcantidadDespachada IN NUMBER) IS 
    cError  NUMBER ;
    BEGIN 
        INSERT INTO sobreUna (noCompra,noDesp,cantidadDespachada)
            VALUES(xnoCompra,xnoDesp,xcantidadDespachada);
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN
           ROLLBACK;
           cError := -20001;
           RAISE_APPLICATION_ERROR(cError,'Ese despacho ya se realizo con la compra introducida');
        WHEN OTHERS THEN
           ROLLBACK;
           cError := -20001;
           RAISE_APPLICATION_ERROR(cError,'Existio un error al insertar en sobre una');
    END;
    
    FUNCTION CO_Despachos
        RETURN SYS_REFCURSOR IS 
    CO_Despachos_INF SYS_REFCURSOR;
    BEGIN
        OPEN CO_Despachos_INF FOR 
            SELECT *
            FROM Despachos;
        RETURN CO_Despachos_INF;
    END;
    
    FUNCTION CO_Despachos_sobreU
        RETURN SYS_REFCURSOR IS 
    CO_sobreU_INF SYS_REFCURSOR ;
    BEGIN 
        OPEN CO_sobreU_INF FOR
            SELECT *
            FROM sobreUna;
        RETURN CO_sobreU_INF;
    END;
    
END PC_Despachos ;
/

CREATE OR REPLACE PACKAGE BODY PC_Empleados IS
    PROCEDURE AD_Empleado(
        xidEmpleado IN NUMBER,
        xnombreEmpleado IN VARCHAR ,
        xtelefono IN NUMBER,
        xdetalle IN XMLTYPE) IS
    cError NUMBER;
    BEGIN
        INSERT INTO Empleados(idEmpleado, nombreEmpleado, telefono,detalle)
            VALUES(xidEmpleado,xnombreEmpleado,xtelefono,xdetalle );
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN 
             ROLLBACK;
             cError := -20001;
             RAISE_APPLICATION_ERROR(cError,'El empleado ya fue ingresado.');
        WHEN OTHERS THEN 
             ROLLBACK;
             cError := -20001;
             RAISE_APPLICATION_ERROR(cError,'Error al insertar Empleado.');
    END;
    
    
    
    PROCEDURE AD_Empleado_Acce(
        xidEmpleado IN NUMBER,
        xnoZona IN NUMBER ,
        xfechaInicio IN DATE ,
        xfechaFin IN DATE ) IS
    cError NUMBER;
    BEGIN
        INSERT INTO AccesoTiempo(idEmpleado,noZona,fechaInicio,fechaFin )
            VALUES(xidEmpleado,xnoZona,xfechaInicio, xfechaFin);
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN 
             ROLLBACK;
             cError := -20001;
             RAISE_APPLICATION_ERROR(cError,'El empleado ya fue ingresado.');
        WHEN OTHERS THEN 
             ROLLBACK;
             cError := -20001;
             RAISE_APPLICATION_ERROR(cError,'Error al insertar Empleado.');
    END;
    
    PROCEDURE AD_Empleado_FeLab(
        xidEmpleado IN NUMBER,
        xnoLabor IN NUMBER,
        xnombreCompañia IN VARCHAR,
        xfechaInicio IN DATE,
        xfechaFin IN DATE)  IS
    cError NUMBER;
    BEGIN
        INSERT INTO FechaLaboral(idEmpleado,noLabor,nombreCompañia,fechaInicio,fechaFin )
            VALUES(xidEmpleado,xnoLabor,xnombreCompañia,xfechaInicio ,xfechaFin);
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN 
             ROLLBACK;
             cError := -20001;
             RAISE_APPLICATION_ERROR(cError,'El ultimo trabajo del empleado ya fue insertado.');
        WHEN OTHERS THEN 
             ROLLBACK;
             cError := -20001;
             RAISE_APPLICATION_ERROR(cError,'Error al insertar el ultimo labor  del empleado.');
    END;    
     
    PROCEDURE MOD_Empleado(
        xidEmpleado IN NUMBER,
        xtelefono IN NUMBER ) IS
    cError NUMBER;
    BEGIN
        UPDATE Empleados
            SET telefono = xtelefono
        WHERE xidEmpleado = idEmpleado ;
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN OTHERS THEN 
             ROLLBACK;
             cError := -20001;
             RAISE_APPLICATION_ERROR(cError,'Error al intentar modificar el numero del empleado');
    END;    
    
    
    PROCEDURE MOD_Empleado_Acce(
        xidEmpleado IN NUMBER,
        xnoZona IN NUMBER , 
        xfechaFin IN DATE  ) IS
    cError NUMBER;
    BEGIN
        UPDATE AccesoTiempo
            SET fechaFin = xfechaFin
        WHERE 
            xidEmpleado = idEmpleado AND
            xnoZona = noZona;
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN OTHERS THEN 
             ROLLBACK;
             cError := -20001;
             RAISE_APPLICATION_ERROR(cError,'Error al intentar modificar la fecha de acceso del empleado');
    END;    
        
    PROCEDURE EL_Empleado(
        xidEmpleado IN NUMBER) IS
    cError NUMBER;
    BEGIN
        DELETE 
        FROM Empleados
        WHERE 
            xidEmpleado = idEmpleado ;
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN OTHERS THEN 
             ROLLBACK;
             cError := -20001;
             RAISE_APPLICATION_ERROR(cError,'Error al intentar eliminar el empleado.');
    END;    
        
    FUNCTION CO_Empleado
        RETURN SYS_REFCURSOR 
    IS INF_Empleados SYS_REFCURSOR;
    BEGIN
        OPEN INF_Empleados FOR
            SELECT *
            FROM Empleados;
        RETURN INF_Empleados;
    END;
        
    FUNCTION CO_AccesoTiempo
        RETURN SYS_REFCURSOR
    IS INF_AccesoTiempo SYS_REFCURSOR;
    BEGIN
        OPEN INF_AccesoTiempo FOR
            SELECT *
            FROM Empleados
                 NATURAL JOIN
                 AccesoTiempo;
        RETURN INF_AccesoTiempo;
    END;
    
    FUNCTION CO_FechaLaboral
        RETURN SYS_REFCURSOR
    IS INF_FechaLaboral SYS_REFCURSOR;
    BEGIN
        OPEN INF_FechaLaboral FOR
            SELECT *
            FROM Empleados
                 NATURAL JOIN
                 (SELECT 
                      idEmpleado,
                      noLabor,
                      nombreCompañia,
                      fechaInicio AS FiL,
                      fechaFin AS FfL
                  FROM FechaLaboral) ;
        RETURN INF_FechaLaboral;
    END;
    
    FUNCTION CO_empleadosCan
        RETURN SYS_REFCURSOR
    IS INF_empleadosCan SYS_REFCURSOR;
    BEGIN
        OPEN INF_empleadosCan FOR
            SELECT *
            FROM empleadosCandidatos;
        RETURN INF_empleadosCan;
    END;
END PC_Empleados;

/

CREATE OR REPLACE PACKAGE BODY PC_Insumos IS
    PROCEDURE  AD_Insumos(
        xnombreInsumo IN VARCHAR) IS
    cError NUMBER;
    BEGIN
        INSERT INTO Insumos(nombreInsumo)
            VALUES(xnombreInsumo);
        COMMIT;
        EXCEPTION 
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'El insumo ingresado ya fue insertado');
        WHEN OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar el insumo.');
            
    END;
    
    PROCEDURE AD_CantidadInsumo(
        xcoInsumo IN VARCHAR ,
        xnoCompra IN NUMBER,
        xfechaExpiracion IN DATE ,
        xcantidad IN NUMBER ,
        xprecioCompra IN NUMBER ) IS 
    cError NUMBER;
    BEGIN
        INSERT INTO CantidadInsumo(coInsumo,noCompra,fechaExpiracion,cantidad,precioCompra)
             VALUES(xcoInsumo,xnoCompra,xfechaExpiracion,xcantidad,xprecioCompra);
        COMMIT;
        EXCEPTION 
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'El insumo ya registrado insertado en la compra ingresada.');    
        WHEN OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar las compras de insumos realizadas.');    
    END;
        
    FUNCTION CO_Insumos
        RETURN SYS_REFCURSOR IS
    INF_insumos SYS_REFCURSOR;
    BEGIN
        OPEN INF_Insumos FOR 
            SELECT *
            FROM Insumos;
        RETURN INF_Insumos;
    END;
    
    FUNCTION CO_CantidadInsumo
        RETURN SYS_REFCURSOR IS
    INF_CantidadInsumo SYS_REFCURSOR;
    BEGIN
        OPEN INF_CantidadInsumo FOR
            SELECT *
            FROM CantidadInsumo;
        RETURN INF_CantidadInsumo;
    END;
END PC_Insumos;

/

CREATE OR REPLACE PACKAGE BODY PC_Proveedores IS
   PROCEDURE  AD_Proveedores(
        xidProveedor IN NUMBER,
        xnit IN NUMBER,
        xtipoNit IN CHAR ,
        xtelefono IN NUMBER ) IS 
    cError NUMBER;
    BEGIN
    
        INSERT INTO Proveedores(idProveedor,nit,tipoNit,telefono)
            VALUES(xidProveedor,xnit,xtipoNit,xtelefono);
        COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'El Proveedor ingresado ya se encuentra registrado en la base de datos.');
            
        WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar el Proveedor.');
        
    END;
       
   PROCEDURE  AD_PersonasNaturales(
        xidProveedor IN NUMBER,
        xnombre IN VARCHAR  ,
        xcorreo IN VARCHAR ) IS 
   cError NUMBER;
   BEGIN
       INSERT INTO PersonasNaturales(idProveedor,nombre,correo)
           VALUES (xidProveedor,xnombre,xcorreo);
       COMMIT;
       EXCEPTION
       WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
       WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'La persona natural o el correo  ya se encuentra registrada en la base de datos.');     
       WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar la persona natural.');
       
   END;
   
   PROCEDURE  AD_Empresas(
        xidProveedor IN NUMBER,
        xidRepresentante IN NUMBER,
        xrazonSocial IN VARCHAR) IS 
    cError NUMBER;
    BEGIN
       INSERT INTO Empresas(idProveedor,idRepresentante,razonSocial)
           VALUES (xidProveedor,xidRepresentante,xrazonSocial);
       COMMIT;
       EXCEPTION
       WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
       WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'La Empresa  ya se encuentra registrada en la base de datos.');
            
       WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar la empresa.');
       
   END;
       
    PROCEDURE MOD_Proveedores(
        xidProveedor IN NUMBER,
        xtelefono IN NUMBER ) IS 
    cError NUMBER;
    BEGIN
       UPDATE Proveedores
           SET telefono = xtelefono
       WHERE  xidProveedor = idProveedor;
       COMMIT;
       EXCEPTION
       WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
       WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al modificar el telefono del proveedor.');
   END;    
    
    PROCEDURE MOD_Empresas(
        xidProveedor IN NUMBER,
        xidRepresentante IN NUMBER ) IS 
    cError NUMBER;
    BEGIN
       UPDATE Empresas
           SET idRepresentante = xidRepresentante
       WHERE  xidProveedor = idProveedor;
       COMMIT;
       EXCEPTION
       WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
       WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'El representante ingresado no se encuentra registrado en la base de datos.');
    END;
    
    PROCEDURE EL_Proveedores(
        xidProveedor IN NUMBER) IS 
    cError NUMBER;
    BEGIN
       DELETE
           FROM Proveedores
       WHERE  xidProveedor = idProveedor;
       COMMIT;
       EXCEPTION
       WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
       WHEN OTHERS THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'No se logro borrar a el proveedor, intente de nuevo.');
    END;
    
    FUNCTION CO_Proveedores
        RETURN SYS_REFCURSOR IS 
    INF_Proveedores SYS_REFCURSOR;
    BEGIN
        OPEN INF_Proveedores  FOR
            SELECT * 
            FROM Proveedores;
        RETURN INF_Proveedores;
    END;
        
    FUNCTION CO_PersonasNaturales
        RETURN SYS_REFCURSOR IS
    INF_PersonasNaturales SYS_REFCURSOR;
    BEGIN
        OPEN INF_PersonasNaturales   FOR
            SELECT * 
            FROM PersonasNaturales;
        RETURN INF_PersonasNaturales ;
    END;
        
    FUNCTION CO_Empresas
        RETURN SYS_REFCURSOR IS
    INF_Empresas SYS_REFCURSOR;
    BEGIN
        OPEN INF_Empresas  FOR
            SELECT * 
            FROM Empresas;
        RETURN INF_Empresas;
    END;
    
    FUNCTION CO_ProveedoresPM
        RETURN SYS_REFCURSOR IS
    INF_ProveedoresPM SYS_REFCURSOR;
    BEGIN
        OPEN INF_ProveedoresPM  FOR
            SELECT * 
            FROM ProveedoresPM;
        RETURN INF_ProveedoresPM;
    END;
    
END PC_Proveedores;

/

CREATE OR REPLACE PACKAGE BODY PC_Compras IS 
    PROCEDURE AD_Compras(
		xfechaCompra IN DATE,
		xidProveedor IN NUMBER) IS
    cError NUMBER;
    BEGIN
        INSERT INTO  Compras(fechaCompra ,idProveedor )
            VALUES(xfechaCompra,xidProveedor );
        COMMIT;
        EXCEPTION 
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar la compra.');
    END;
	
	FUNCTION CO_Compras
        RETURN SYS_REFCURSOR 
    IS INF_Compras SYS_REFCURSOR ;
    BEGIN
        OPEN INF_Compras  FOR 
            SELECT *
            FROM Compras;
        
        RETURN INF_Compras ;
    END;
END PC_Compras ;

/

CREATE OR REPLACE PACKAGE BODY PC_Productos IS 
    PROCEDURE AD_Productos (
		xnombreProducto IN VARCHAR) IS 
    cError NUMBER;
    BEGIN
        INSERT INTO Productos(nombreProducto)
            VALUES(xnombreProducto);
        COMMIT;
        EXCEPTION 
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'El nombre del producto ya fue registrado en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar el producto.');
            
    END;
    
	PROCEDURE AD_CantidadProducto(
		xcoProducto IN NUMBER,
		xnoCompra IN NUMBER,
		xcantidad IN NUMBER,
		xnoLote IN NUMBER,
		xprecioCompra IN NUMBER) IS 
    cError NUMBER;
    BEGIN
        INSERT INTO CantidadProducto(coProducto,noCompra,cantidad,noLote,precioCompra)
             VALUES(xcoProducto,xnoCompra,xcantidad,xnoLote,xprecioCompra);
        COMMIT;
        EXCEPTION 
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'El producto ya se encuentra registrado con la compra ingresada.');
        WHEN OTHERS  THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al ingresar  la  compra del producto ingresado.');
    END;
    
    FUNCTION CO_Productos 
        RETURN SYS_REFCURSOR IS
    INF_Productos SYS_REFCURSOR;
    BEGIN 
        OPEN INF_Productos FOR  
            SELECT  *
            FROM Productos;
        RETURN INF_Productos;
    END;
        
    FUNCTION CO_CantidadProducto
        RETURN SYS_REFCURSOR IS 
    INF_CantidadProducto SYS_REFCURSOR;
    BEGIN
        OPEN INF_CantidadProducto  FOR
            SELECT *
            FROM CantidadProducto ;
        RETURN INF_CantidadProducto ;
    END;
    
    FUNCTION CO_ProductosBC 
        RETURN SYS_REFCURSOR 
    IS INF_ProductosBC SYS_REFCURSOR;
    BEGIN
        OPEN INF_ProductosBC FOR 
            SELECT *
            FROM ProductosBC
            WHERE  ROWNUM <= 10;
    END;
    
    
END PC_Productos;

/

CREATE OR REPLACE PACKAGE BODY PC_Zonas IS
    PROCEDURE AD_Zonas(
        xnombreZona IN VARCHAR,
        xubicacionZona IN CHAR) IS
    cError NUMBER;
    BEGIN
        INSERT INTO Zonas(nombreZona,ubicacionZona)
            VALUES(xnombreZona,xubicacionZona);
        COMMIT;
        EXCEPTION 
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'El nombre de la zona  ya fue registrado en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar la zona.');
            
    END;
        
    PROCEDURE AD_Sectores(
        xnombreSector IN VARCHAR,
        xnoZona IN NUMBER) IS
    cError NUMBER;
    BEGIN
        INSERT INTO Sectores(nombreSector,noZona)
            VALUES(xnombreSector,xnoZona);
        COMMIT;
        EXCEPTION 
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error al insertar el sector.');
            
    END;
        
    FUNCTION CO_Zonas
        RETURN SYS_REFCURSOR 
    IS INF_Zonas SYS_REFCURSOR ;
    BEGIN
        OPEN INF_Zonas FOR 
            SELECT *
            FROM Zonas;
        RETURN INF_Zonas;
    END;
    
        
    FUNCTION CO_Sectores
        RETURN SYS_REFCURSOR
    IS INF_Sectores SYS_REFCURSOR ;
    BEGIN
        OPEN INF_Sectores FOR 
            SELECT *
            FROM Sectores;
        RETURN INF_Sectores;
    END;
END  PC_Zonas;

/

CREATE OR REPLACE PACKAGE BODY PC_Labores IS 
    PROCEDURE AD_Labores(
		xnombreLabor IN VARCHAR) IS
	cError  NUMBER ;
	BEGIN
	    INSERT INTO Labores (nombreLabor)
		    VALUES(xnombreLabor);
		COMMIT;
        EXCEPTION
        WHEN VALUE_ERROR THEN
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Verificar los tipos de los valores insertados.');
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'La labor ya fue insertado en la base de datos.');
        WHEN OTHERS THEN 
            ROLLBACK;
            cError := -20001;
            RAISE_APPLICATION_ERROR(cError,'Error, al insertar la labor en la base de datos.');
	END;
    
	FUNCTION CO_Labores
		RETURN SYS_REFCURSOR
	IS INF_CO_Labores SYS_REFCURSOR;
	
	BEGIN
        OPEN INF_CO_Labores FOR
            SELECT *
            FROM Labores;
        RETURN 	INF_CO_Labores ;
	END;
END PC_Labores ;

/