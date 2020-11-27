                                                                                            /* POBLANDO_NO_OK*/
/* TABLA CANTIDAD INSUMO*/
insert into CantidadInsumo  (coInsumo, noVenta, fechaExpiracion, cantidad, precioCompra) values ('RH-6765', 677, TO_DATE('01/29/2016','MM/DD/YYYY'), -327, 385782);
/* Al insertar la tabla CantidadInsumo el atributo de cantidad especifica que tiene que ser mayor a 0, por ende al insertar el valor de -2, se presenta un error en el atributo cantidad./**//
insert into CantidadInsumo  (coInsumo, noVenta, fechaExpiracion, cantidad, precioCompra) values ('OO-0127', 268, TO_DATE('-2/20/2016','MM/DD/YYYY'), 685, 155209);
/* Al insertar la tabla CantidadInsumo el atributo de DATE especifica que tiene que ser mayor a positivo, por ende al insertar el valor de -2, se presenta un error en el atributo cantidad./**//

/* TABLA CANTIDAD PRODUCTO*/
insert into CantidadProducto  (coProducto, noVenta, cantidad, noLote, precioCompra) values (1562819, 536, -50, 80, 1029784);
/* Al insertar la tabla CantidadProducto el atributo de cantidad especifica que tiene que ser mayor a 0, por ende al insertar el valor de -50, se presenta un error en el atributo cantidad./**//
insert into CantidadProducto  (coProducto, noVenta, cantidad, noLote, precioCompra) values (9474617, 496, 43, 276, -2069309);
/* Al insertar la tabla CantidadProducto el atributo de precioCompra especifica que tiene que ser mayor a 0, por ende al insertar el valor de -2069309, se presenta un error en el atributo precioCompra./**//



/*DESPACHOS*/
insert into Despachos (noDesp , noZona ) values (1, -777);
/* Al insertar la tabla despachos el atributo de noZona que tiene que ser mayor a 0, por ende al insertar el valor de -777, se presenta un error en el atributo noZona./**//
insert into Despachos (noDesp , noZona ) values (-2, 403);
/* Al insertar la tabla despachos el atributo de noDesp que tiene que ser mayor a 0, por ende al insertar el valor de -2, se presenta un error en el atributo noDesp./**//


/*Insumos*/

insert into Insumos (coInsumo, nombreInsumo) values ('MI--9432', 'Pail For Lid 1537');
/* Al insertar la tabla Insumos el atributo de coInsumo que tiene ser positivo, por ende al insertar el valor de MI--9432 , se presenta un error en el atributo coInsumo./**//

