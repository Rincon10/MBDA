/*TRIGGERS */

/*MESAS*/


/*Generar de forma automatica el numero de la mesa*/

CREATE OR REPLACE TRIGGER Ad_Mesas_noMesa
  BEFORE INSERT 
  ON Mesas
  FOR EACH ROW 
BEGIN
  IF :new.noMesa IS NULL
    THEN :new.noMesa := Ad_noMesa.NEXTVAL;
  END IF;
END;
/


/*Lo unico que se puede modificar de la informacion de la mesa es su estado y el empleado encargado a esta*/

CREATE OR REPLACE TRIGGER Mo_Mesas
  BEFORE UPDATE
  ON Mesas
  FOR EACH ROW
BEGIN
  IF :new.noMesa <> :old.noMesa OR
     :new.noSector <> :old.noSector
     THEN RAISE_APPLICATION_ERROR(-20001,'Lo unico que se puede modificar de la informacion de la mesa es su estado y el empleado encargado a esta');
  END IF;
END;
/


/*PEDIDOS*/

/*si no se especifica la fecha de generacion del pedido esta se debe generar de forma automatica.*/


CREATE OR REPLACE TRIGGER Ad_Pedidos_fechaHoraini
  BEFORE INSERT
  ON Pedidos
  FOR EACH ROW
BEGIN
  IF :new.fechaHoraini  IS NULL THEN 
     :new.fechaHoraini := sysdate;
  END IF;
END;
/



/* si no se indica el numero del pedido, este se debe generar de forma automatica.*/

CREATE OR REPLACE TRIGGER Ad_Pedidos_noPedido
  BEFORE INSERT 
  ON Pedidos
  FOR EACH ROW
BEGIN
  IF :new.noPedido IS NULL THEN 
    :new.noPedido := Ad_noPedido.NEXTVAL;
  END IF;
END;
/



/* unicamente se puede, fechaHorafin y la cantidad de los productos  de un pedido ya realizado */

CREATE OR REPLACE TRIGGER Mo_Pedido
  BEFORE UPDATE 
  ON Pedidos 
  FOR EACH ROW
BEGIN
  IF :old.noPedido <> :new.noPedido OR
     :old.noMesa <> :new.noMesa  OR 
	 :old.fechaHoraini <> :new.fechaHoraini
     THEN RAISE_APPLICATION_ERROR(-20001,'No se puede modificar el numero del pedido o el numero de mesa de un pedido, o de de su fecha en que inicio.');
  END IF;
END;
/



/* se puede eliminar un pedido si a pasado menos de 10 minutos.*/


CREATE OR REPLACE TRIGGER EL_Pedido
    BEFORE DELETE 
    ON Pedidos 
    FOR EACH ROW 
BEGIN 
    IF  SYSDATE > :old.fechaHorafin + 15 / 1440  THEN 
        RAISE_APPLICATION_ERROR(-20005,'No se puede cancelar el pedido, ya que se encuentra en preparacion.');
    END IF;
END;
/

/*DESPACHOS*/


/*si no se coloca el numero del despacho, se genera de forma automatica */


CREATE OR REPLACE TRIGGER Ad_Despachos_noDesp
  BEFORE INSERT 
  ON Despachos
  FOR EACH ROW
BEGIN
  IF :new.noDesp IS NULL THEN 
     :new.noDesp  := Ad_noDesp.NEXTVAL;
  END IF;
  
END;
/



/*no se puede modificar la informacion de los despachos. */

CREATE OR REPLACE TRIGGER Mo_Despachos
  BEFORE UPDATE 
  ON Despachos
  FOR EACH ROW
BEGIN
  IF :old.noDesp <> :new.noDesp OR
     :old.noZona <> :new.noZona
    THEN RAISE_APPLICATION_ERROR(-20002,'no se puede modificar la informacion de los despachos. ');
  END IF;  
END;
/

/* AccesoTiempo */
/*Lo unico que se puede modificar en el acceso tiempo  es la fecha en la que termino dicho acceso*/

CREATE OR REPLACE TRIGGER Mo_AccesoTiempo
  BEFORE UPDATE
  ON AccesoTiempo
  FOR EACH ROW
BEGIN
  IF :old.idEmpleado <> :new.idEmpleado OR
     :old.noZona <> :new.noZona OR 
     :old.fechaInicio <> :new.fechaInicio 
     THEN RAISE_APPLICATION_ERROR(-20011,'Lo unico que se puede modificar en el acceso tiempo  es la fecha  en la que termino dicho acceso');
  END IF;
END; 
/



/* lo unico que se puede modificar de los empleados es su numero de telefono.*/
CREATE OR REPLACE TRIGGER Mo_Empleados
  BEFORE UPDATE
  ON Empleados
  FOR EACH ROW
BEGIN
  IF :old.idEmpleado <> :new.idEmpleado OR
     :old.nombreEmpleado <> :new.nombreEmpleado
     THEN RAISE_APPLICATION_ERROR(-20010,'Solo se puede alterar el numero de los empleados.');
  END IF;
END; 
/


/*INSUMOS*/
/*si no se ingresa el codigo de insumo este se debe generar , tomando las dos primeras letras del nombre en mayuscula seguido de el caracter '-' y por ultimo concatenarlo con el numero consecutivo correspondiente*/

CREATE OR REPLACE TRIGGER Ad_Insumos_coInsumo
  BEFORE INSERT 
  ON Insumos
  FOR EACH ROW
DECLARE
cont NUMBER;
BEGIN
  SELECT COUNT(*) INTO cont
  FROM Insumos
  WHERE :new.nombreInsumo = nombreInsumo;
  
  IF :new.coInsumo IS NULL AND cont = 0
    THEN :new.coInsumo := UPPER( SUBSTR(:new.nombreInsumo,1,2) )||'-'||TO_CHAR(Ad_coInsumo.NEXTVAL);
  END IF;
  
END;
/



/*No se puede modificar nada de un insumo */

CREATE OR REPLACE TRIGGER Mo_Insumos
 BEFORE UPDATE 
 ON Insumos
 FOR EACH ROW
BEGIN
  IF :old.coInsumo <> :new.coInsumo OR
     :old.nombreInsumo <> :new.nombreInsumo
    THEN RAISE_APPLICATION_ERROR(-20006,'No se puede actualizar nada de insumos');
  END IF;
END;
/




/*PROVEEDORES*/
/*Si no se especifica el tipoNit se asume que es tipo empresa */

CREATE OR REPLACE TRIGGER Ad_Proveedores_tipoNit
  BEFORE 
  INSERT 
  ON Proveedores
  FOR EACH ROW
BEGIN
  IF :new.tipoNit IS NULL
    THEN :new.tipoNit := 'NT';
  END IF;
END;
/



/* Lo unico que se puede modificar en los proveedores es su telefono.*/

CREATE OR REPLACE TRIGGER Md_Proveedores
  BEFORE 
  UPDATE OR DELETE
  ON Proveedores
  FOR EACH ROW
BEGIN
  IF :old.idProveedor <> :new.idProveedor OR
     :old.nit <> :new.nit OR
     :old.tipoNit <> :new.tipoNit
    THEN RAISE_APPLICATION_ERROR(-20006,'Unicamente se puede modificar el telefono del proveedor.');
  END IF;
END;
/




/*EMPRESAS*/
/* Lo Unico que puede actualizarce en las empresas son los representantes */

CREATE OR REPLACE TRIGGER Md_Empresas
  BEFORE 
  UPDATE OR DELETE 
  ON Empresas
  FOR EACH ROW
BEGIN 
  IF :old.idProveedor <> :new.idProveedor OR
     :old.razonSocial <> :new.razonSocial
    THEN RAISE_APPLICATION_ERROR(-20008,'Unicamente se puede modificar el id del representante de una empresa .');
  END IF; 
END;
/


/*PERSONAS NATURALES*/
/*Si no se ingresa el correo , este se generara con las primeras 5 letras del primer nombre y se le añadira 3 numeros al azar junto a @mail.com*/

CREATE OR REPLACE TRIGGER Ad_PersonasNaturales_correo
  BEFORE 
  INSERT 
  ON PersonasNaturales
  FOR EACH ROW
DECLARE
numer NUMBER;
cont NUMBER;
nCorreo VARCHAR(40);
BEGIN 
  SELECT 
    CEIL(dbms_random.value(111,999)) INTO numer
  FROM dual;
  
  nCorreo := SUBSTR(:new.nombre,1, 5 )||TO_CHAR(numer)||'@mail.com';
  
  SELECT 
    COUNT( * ) INTO cont
  FROM PersonasNaturales
  WHERE correo = nCorreo ;
  
  IF :new.correo IS NULL AND cont = 0
     THEN :new.correo := nCorreo ;
  ELSIF :new.correo IS NULL AND cont<>0 THEN 
     RAISE_APPLICATION_ERROR(-20005,'Debe ingresar el correo de forma manual');
  END IF;
END; 
/



/*COMPRAS*/
/*EL numero de la compra se genera automaticamente */

CREATE OR REPLACE TRIGGER Ad_Compras_noCompra
  BEFORE INSERT 
  ON Compras
  FOR EACH ROW 
BEGIN
  IF :new.noCompra IS NULL
    THEN :new.noCompra := Ad_noCompra.NEXTVAL;
  END IF;
END;
/



/*en una compra no se puede modificar nada*/

CREATE OR REPLACE TRIGGER Mo_Compras
  BEFORE UPDATE 
  ON Compras
  FOR EACH ROW 
BEGIN
    RAISE_APPLICATION_ERROR(-20009,'No se puede Modificar las informacion de las compras');
END;
/



/*PRODUCTOS*/
/*si no se ingresa el codigo del producto este se generara de forma automatica, generando un numero al azar */

CREATE OR REPLACE TRIGGER Ad_Productos_coProducto
  BEFORE INSERT 
  ON Productos
  FOR EACH ROW
DECLARE 
cont NUMBER;
BEGIN
  SELECT COUNT(*) INTO cont
  FROM Productos
  WHERE nombreProducto = :new.nombreProducto;
  
  IF :new.coProducto IS NULL AND cont = 0
    THEN :new.coProducto := Ad_coProducto.NEXTVAL;
  ELSIF cont <> 0
    THEN RAISE_APPLICATION_ERROR(-20001,'El producto ya fue registrado.');
  END IF;
END;
/




/*ZONAS */
/*si no se coloca el numero de la zona , se genera de forma automatica */


CREATE OR REPLACE TRIGGER Ad_Zonas_noZona
  BEFORE INSERT 
  ON Zonas
  FOR EACH ROW
BEGIN
   IF :new.noZona IS NULL 
      THEN :new.noZona := Ad_noZona.NEXTVAL;
   END IF;
END;
/



/*SECTORES*/

/*si no se coloca el numero del sector, se genera de forma automatica */
CREATE OR REPLACE TRIGGER Ad_Sectores_noSector
  BEFORE INSERT 
  ON Sectores
  FOR EACH ROW
DECLARE
cont NUMBER ;
BEGIN
   SELECT COUNT( * ) INTO cont
   FROM Sectores 
   WHERE nombreSector = :new.nombreSector;
   IF :new.noSector IS NULL AND cont = 0
      THEN :new.noSector := Ad_noSector.NEXTVAL;
   ELSIF :new.noSector IS NULL AND cont <> 0 THEN
      RAISE_APPLICATION_ERROR(-20001,'El  sector ya fue registrado con ese nombre.');
   END IF;
   
END;
/


/*LABORES*/

/*si no se coloca el numero del labor, se genera de forma automatica */
CREATE OR REPLACE TRIGGER Ad_Labores_noLabor
  BEFORE INSERT 
  ON Labores
  FOR EACH ROW
BEGIN
   IF :new.noLabor IS NULL 
      THEN :new.noLabor := Ad_noLabor.NEXTVAL;
   END IF;
END;
/
