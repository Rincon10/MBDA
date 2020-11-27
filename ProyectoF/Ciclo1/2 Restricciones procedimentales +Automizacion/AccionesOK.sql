
/* Acciones ok  */


/* FK_PersonasNat_idPro */

insert into Proveedores (idProveedor , nit, tipoNit, telefono) values (4320624, 2158369687, 'CC', 3863110495);
insert into PersonasNaturales   (idProveedor  , nombre, correo) values (4320624, 'Heath Barry', 'hbarrycn@w3.org');

DELETE FROM Proveedores
WHERE idProveedor = 4320624 ;


/* FK_Empresa_idRepresentante */

insert into Proveedores (idProveedor , nit, tipoNit, telefono) values (4320624, 2158369687, 'CC', 3863110495);
insert into Proveedores (idProveedor , nit, tipoNit, telefono) values (1980900, 5644500263, 'CC', 3569258472);
insert into PersonasNaturales   (idProveedor  , nombre, correo) values (4320624, 'Heath Barry', 'hbarrycn@w3.org');
insert into Empresas  (idProveedor,idRepresentante, razonSocial) values ( 1980900 ,4320624, 'Fanoodle');

DELETE FROM Proveedores
WHERE idProveedor = 1980900 ;

/* FK_Empresa_idProveedor  */


insert into Proveedores (idProveedor , nit, tipoNit, telefono) values (1980900, 5644500263, 'CC', 3569258472);
insert into Empresas  (idProveedor,idRepresentante, razonSocial) values ( 1980900 ,4320624, 'Fanoodle');

DELETE FROM Proveedores
WHERE idProveedor = 1980900 ;

/*FK_Compras_idProveedor*/

insert into Proveedores (idProveedor , nit, tipoNit, telefono) values (7543913, 9136885308, 'CC', 3618312530);
insert into Compras  (noCompra, fechaCompra, idProveedor) values (1,TO_DATE( '03/29/2016','MM/DD/YYYY'), 7543913);


DELETE FROM Proveedores
  WHERE idProveedor = 7543913 ;
/* FK_Mesas_idEmpleado  */

insert into Zonas (noZona, nombreZona , ubicacionZona ) values (725, 'Viburnum','E');
insert into Sectores  (noSector , nombreSector, noZona) values (313, 'Paget',725);
insert into Empleados (idEmpleado, nombreEmpleado, telefono) values (8456153, 'Mellicent MacCafferty',  3626427845);
insert into Mesas (noMesa, estadoMesa, noSector , idEmpleado ) values (1,'EA', 313, 8456153);

DELETE FROM Empleados 
 WHERE idEmpleado = 8456153;

/* FK_AccesoTiempo_idEmpleado */

insert into Zonas (noZona, nombreZona , ubicacionZona ) values (299, 'Pungent Oak','N');
insert into Empleados (idEmpleado, nombreEmpleado, telefono) values (9548859, 'Allianora Corkett',  3085711707);
insert into AccesoTiempo  (idEmpleado, noZona, fechaInicio , fechaFin ) values (9548859, 299, TO_DATE('09/19/2015','MM/DD/YYYY'), TO_DATE('06/28/2017','MM/DD/YYYY'));


DELETE FROM Empleados
 WHERE idEmpleado = 9548859;

/* FK_FechaLaboral_idEmpleado  */ 

insert into Empleados (idEmpleado, nombreEmpleado, telefono) values (3333048, 'Grete Grosvener',  3320846392);
insert into Labores  (noLabor , nombreLabor) values (389, 'wviykchzevqusfht');
insert into FechaLaboral (idEmpleado, noLabor,  nombreCompañia, fechaInicio, fechaFin) values (3333048, 389, 'Skinix', TO_DATE('05/25/2015','MM/DD/YYYY'), TO_DATE( '01/27/2018','MM/DD/YYYY'));

DELETE FROM Empleados
  WHERE idEmpleado = 3333048;
 