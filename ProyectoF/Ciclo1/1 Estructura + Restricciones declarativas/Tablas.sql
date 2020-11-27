BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                     FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;
/




----------------------
CREATE TABLE Proveedores (
    idProveedor number(7,0)  NOT NULL,
    nit number(11,0)  NOT NULL,
    tipoNit CHAR(2)  NOT NULL,
    telefono number(10,0)   NOT NULL
) ;


CREATE TABLE Empresas (
    idProveedor number(7,0)  NOT NULL,
    idRepresentante number(7,0)  NOT NULL,
    razonSocial varchar(30)  NOT NULL
) ;


CREATE TABLE PersonasNaturales (
    idProveedor number(7,0)  NOT NULL,
    nombre varchar(30)  NOT NULL,
    correo varchar(40)  
) ;

----------------------

CREATE TABLE Compras(
    noCompra number NOT NULL,
    fechaCompra date  NOT NULL,
    idProveedor number(7,0)  
) ;

----------------------

CREATE TABLE Insumos (
    coInsumo VARCHAR(7)  NOT NULL,
    nombreInsumo varchar(40)  NOT NULL
) ;

CREATE TABLE CantidadInsumo (
    coInsumo VARCHAR(7)  NOT NULL,
    noCompra  number NOT NULL,
    fechaExpiracion date  NOT NULL,
    cantidad number NOT NULL,
    precioCompra number NOT NULL
) ;

----------------------

CREATE TABLE Productos (
    coProducto number(7,0)  NOT NULL,
    nombreProducto varchar(40)  NOT NULL
) ;

CREATE TABLE CantidadProducto (
    coProducto number(7,0)  NOT NULL,
    noCompra number  NOT NULL,
    cantidad number  NOT NULL,
    noLote number NOT NULL,
    precioCompra number  NOT NULL
) ;

----------------------

CREATE TABLE Zonas (
    noZona number NOT NULL,
    nombreZona varchar(40)  NOT NULL,
    ubicacionZona char(1)  NOT NULL
) ;



CREATE TABLE Sectores (
    noSector number NOT NULL,
    nombreSector varchar(20)  NOT NULL,
    noZona number NOT NULL
) ;

----------------------

CREATE TABLE Mesas (
    noMesa number NOT NULL,
    estadoMesa char(2)  NOT NULL,
    noSector number  NOT NULL,
    idEmpleado number(7,0)  
) ;

----------------------

CREATE TABLE Pedidos (
    noPedido number NOT NULL,
    nombreCliente varchar(30)  ,
    fechaHoraini date  NOT  NULL,
    fechaHorafin date  ,
    noMesa number NOT NULL
) ;

CREATE TABLE EstaEn (
    coProducto number  NOT NULL,
    noPedido number NOT NULL,
    Cantidad number NOT NULL,
    Comentario varchar2(70) 
) ;

----------------------

CREATE TABLE Empleados (
    idEmpleado number(7,0)  NOT NULL,
    nombreEmpleado varchar(30)  NOT NULL,
    telefono number(10,0)  NOT NULL,
    detalle XMLTYPE
) ;

CREATE TABLE AccesoTiempo (
    idEmpleado number(7,0)  NOT NULL,
    noZona number  NOT NULL,
    fechaInicio date  NOT NULL,
    fechaFin date  
) ;

CREATE TABLE FechaLaboral (
    idEmpleado number(7,0)  NOT NULL,
    noLabor number  NOT NULL,
    nombreCompañia varchar(40)  NOT NULL,
    fechaInicio date  NOT NULL,
    fechaFin date  NOT NULL
) ;

----------------------

CREATE TABLE Labores (
    noLabor number  NOT NULL,
    nombreLabor varchar(40)  NOT NULL
) ;

----------------------

CREATE TABLE Despachos (
    noDesp number NOT NULL,
    noZona number NOT NULL
) ;

CREATE TABLE sobreUna (
    noCompra number NOT NULL,
    noDesp number NOT NULL,
    cantidadDespachada number(5, 0) NOT NULL
) ;
