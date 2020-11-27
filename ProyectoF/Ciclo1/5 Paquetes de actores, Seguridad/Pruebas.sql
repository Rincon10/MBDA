/*Borrar Triggers, Y */
insert into Zonas (noZona,nombreZona , ubicacionZona ) values (1,'VIP','O');
insert into Sectores  (noSector,nombreSector, noZona) values (1, 'Fuller',1);
insert into Productos (coProducto, nombreProducto) values (1183209, 'Fond - Chocolate');
insert into Mesas (noMesa, estadoMesa, noSector , idEmpleado ) values (1,'AS', 1, NULL);
insert into Mesas (noMesa, estadoMesa, noSector , idEmpleado ) values (2,'AS', 1, NULL);
insert into Empleados (idEmpleado, nombreEmpleado, telefono) values (9635795, 'Elwyn Dank',  3952410400);
insert into Labores  (noLabor , nombreLabor) values (1, 'Waiter');
insert into FechaLaboral (idEmpleado, noLabor,  nombreCompañia, fechaInicio, fechaFin) values (9635795, 1, 'Oozz', TO_DATE('03/20/2015','MM/DD/YYYY'), TO_DATE( '09/17/2019','MM/DD/YYYY'));
/* Historia de uso MESEROS*/

-- El supervisor de zona en un evento  del movistar arena observo que le hacia falta meseros en el sector  que se encontraba, por lo tanto solicita que se contraten a mas meseros-

-- Una vez su solicitud fue aprovada,la persona Fabian Ramirez Pinto ,junto a otras personas fueron contratadas y asignadas a la zona 1, pero  a diferentes sectores.

--El gerente debe añadir a los empleados con su respectivo acceso a tiempo a la zona mencionada anteriormente

/*
EXECUTE PA_SupervisorDeZona.AD_Empleado(1032501, 'Fabian Ramirez',3197065840,'<Detalle>
    <Estudios>
        <Bachillerato>
            <Colegio
                nombre = "Liceo Segovia"
                añoFin = "2015"></Colegio>
        </Bachillerato>
        <Universidades>
            <Universidad
                nombre = "Escuela de ingenieros"
                semestre = "10"
            >
            <añoFin>"2019"</añoFin>
            </Universidad>
            <Universidad
                nombre = "Los andes"
                semestre = "10"
            >
            <añoFin>"2019"</añoFin>
            </Universidad>
        </Universidades>
    </Estudios>
    <Referencias>
        
        <Laborales
            nombrePer = "Ivan Camilo"
            telefono = "31423139501">
        "Es capaz de tomar decisiones de forma autonoma"
        </Laborales>
        
        <Personales
            nombrePer = "Fabio Ramirez"
            telefono = "3213238959">
        "Es un joven muy comprometido con lo que hace."
        </Personales>
        
    </Referencias>
    <Aptitudes>
        <Fortalezas>
            <Fortaleza>
                "Perseverante"
            </Fortaleza>
        </Fortalezas>
        
        <Debilidades>
            <Debilidad>
                "Impulsivo"
            </Debilidad>
        </Debilidades>
    </Aptitudes>
</Detalle>');
*/
select * from Empleados;
EXECUTE PA_SupervisorDeZona.AD_Empleado(1032501, 'Fabian Ramirez',3197065840,NULL);

EXECUTE PA_SupervisorDeZona.AD_Empleado(1058987, 'Nicolas Aguilera',3254587624, NULL);
 

EXECUTE PA_SupervisorDeZona.AD_Empleado(1020548, 'Camilo Rincon',3154855468, NULL)
 

EXECUTE PA_SupervisorDeZona.AD_Empleado(1035578, 'Miguel Fuquene',3145976898,  NULL);

EXECUTE PA_SupervisorDeZona.AD_Empleado_Acce(1058987,1,SYSDATE, NULL);
EXECUTE PA_SupervisorDeZona.AD_Empleado_Acce(1020548,1,SYSDATE, NULL);
EXECUTE PA_SupervisorDeZona.AD_Empleado_Acce(1035578,1,SYSDATE, NULL);
EXECUTE PA_SupervisorDeZona.AD_Empleado_Acce(1032501,1,SYSDATE, NULL);

--- Una vez dado los permisos de acceso a la zona 1, el gerente general le solicito un informe de los empleados que tienen una experiencia mayor a 2 años, para tranferirlos a un nueva zona (mas exclusiva). "acceso a una nueva zona".

SELECT
PA_SupervisorDeZona .CO_empleadosCan
FROM DUAL;

--al tener la informacion (proporcionada por la base de datos ), este debe enviarla al supervisor con los datos de su identificacion , su nombre  y su telefono para notificarle del posible ascenso.

--Los nuevos empleados en su primer dia de trabajo, recibieron clientes los cuales debian atender; lo primero que realizaron fue revisar que mesas se encontraban libres y aseadas para poder realizar la toma de un pedido.

SELECT 
PA_Mesero.CO_Mesas_Libres
FROM DUAL;

-- al encontrarla cambio el empleado asignado( NULL ) con su numero de identificacion
EXECUTE PA_Mesero.MOD_Mesas(1,'AS',1032501);

--al cabo de unos minutos, fabian debe registrar el pedido de los clientes 
EXECUTE PA_Mesero.AD_Pedidos('Camilo Rincon',NULL,1);

EXECUTE PA_Mesero.AD_Pedidos_Est(1183209,3,5,NULL);

-- cuando los clientes terminen su comida fabian debe cambiar el estado de la mesa Aseado y borrase como empleado encargado de la zona  
EXECUTE PA_Mesero.MOD_Mesas(1,'AS',NULL);
