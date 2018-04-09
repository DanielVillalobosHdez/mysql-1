/************************************************************************************************
 *  Autor: Cristian Lérida Sánchez									*
 *  Fecha: 20/03/2018										*
 *												*
 *			TITULO: Consultas							*
 *												*
 ************************************************************************************************/

/* FUNCIONES DE AGREGACIÓN */
/* GROUP BY [DESC || ASC]*/

/*Columnas de agregación*/
/*SUM(), MAX(), MIN(), AVG(), COUNT()*/


USE jardineria;

/*Palabras que empiezan por OR*/
SELECT Codigoproducto FROM Productos WHERE Codigoproducto LIKE "OR%";														
																						
/*ERROR*/ 																					
SELECT Estado, CodigoPedido FROM Pedidos GROUP BY Estado;							

/*Devuelve las repeticiones de una palabra*/ 																
SELECT Estado, COUNT(*) FROM Pedidos GROUP BY Estado;

/*Muestra el valor más alto*/
SELECT MAX(PrecioVenta) FROM Productos;

/*Muestra numero de oficinas por pais*/
SELECT Pais, COUNT(*) FROM Oficinas GROUP BY Pais;

/*Media de cada gama de productos*/
SELECT Gama, AVG(PrecioVenta) FROM Productos GROUP BY Gama;

/*De cada producto cuantos pedidos tiene*/
SELECT CodigoPedido, SUM(Cantidad) FROM DetallePedidos GROUP BY CodigoPedido;

/*De cada pedido cuanto cuesta en total*/
SELECT CodigoPedido, SUM(Cantidad * PrecioUnidad) FROM DetallePedidos GROUP BY CodigoPedido;

/*De cada pedido cuanto cuesta en total mayores de 1500*/
/*comparar función de agregación*/
SELECT CodigoPedido, SUM(Cantidad * PrecioUnidad) AS total FROM DetallePedidos GROUP BY CodigoPedido HAVING total>1500;
SELECT CodigoPedido, SUM(Cantidad * PrecioUnidad) AS 'total' FROM DetallePedidos GROUP BY CodigoPedido HAVING total>1500;

/*Mostra los productos mayores que le media*/
SELECT CodigoProducto, PrecioVenta FROM Productos WHERE PrecioVenta>(SELECT AVG(PrecioVenta) FROM Productos);

/*Mostrar producto más caro*/
SELECT CodigoProducto, PrecioVenta FROM Productos WHERE PrecioVenta>(SELECT MAX(PrecioVenta) FROM Productos);

/*Mostrar productos entre 200 y 400*/
SELECT CodigoProducto, PrecioVenta FROM Productos WHERE PrecioVenta>=200 AND PrecioVenta<=400;
SELECT CodigoProducto, PrecioVenta FROM Productos WHERE PrecioVenta BETWEEN 200 AND 400;

/*Mostrar el codigo de oficina de España y EEUU*/
SELECT CodigoOficina, Pais FROM Oficinas WHERE Pais IN ('España', 'EEUU');

/*Mostrar empleados que no tengan jefe*/
SELECT CodigoEmpleado, CodigoJefe FROM Empleados WHERE CodigoJefe IS NULL;

/*Mostrar empleados que tienen jefe*/
SELECT CodigoEmpleado, CodigoJefe FROM Empleados WHERE CodigoJefe IS NOT NULL;

/*Sacar el Codigo de oficina y la ciudad donde hay oficina */
SELECT CodigoOficina, Ciudad FROM Oficinas WHERE Ciudad IS NOT NULL;

/*Sacar cuantos empleados hay en la compañia*/
SELECT COUNT(CodigoEmpleado) FROM Empleados;

/*Sacar cuantos clientes tiene cada pais*/
SELECT Pais, COUNT(CodigoCliente) FROM Clientes GROUP BY Pais;

/*Sacar cual fue el pago medio en 2009*/
SELECT AVG(Cantidad) FROM Pagos WHERE YEAR(FechaPago)=2009;

/*Sacar cuantos pedidos estan en cada estado ordenado descendentemente por el numero de pedidos*/
SELECT Estado, COUNT(CodigoPedido) AS Pedido FROM Pedidos GROUP BY Estado ORDER BY Pedido DESC;

/*Sacar el precio del producto mas caro y mas barato*/
SELECT (SELECT MIN(PrecioVenta) FROM Productos) AS Minimo, (SELECT MAX(PrecioVenta) FROM Productos) AS Maximo FROM Productos LIMIT 1;

/*Sacar el producto mas caro de cada gama*/
SELECT Gama,MAX(PrecioVenta) FROM Productos GROUP BY Gama;

/*Sacar el producto mas caro de Gama Aromaticas, pero tambien saber el codigo del producto*/
SELECT 

/*Sacar en la misma consulta el empleado y el jefe que tiene cada empleado*/
SELECT Curritos.CodigoEmpleado, Curritos.Nombre, Curritos.Apellido1, Jefes.Nombre, Jefes.Apellido1 FROM Empleados AS Curritos, Empleados AS Jefes WHERE Curritos.CodigoJefe=Jefes.CodigoEmpleado;

/*Sacar en la misma consulta el empleado juntando en misma columna Nombre y Apellido, y lo mismo con el jefe*/
SELECT Curritos.CodigoEmpleado, CONCAT(Curritos.Nombre,' ', Curritos.Apellido1) AS NombreEmpleado, CONCAT(Jefes.Nombre,' ', Jefes.Apellido1) AS NombreJefe FROM Empleados AS Curritos, Empleados AS Jefes WHERE Curritos.CodigoJefe=Jefes.CodigoEmpleado;

/*Sacar cuantos pedidos hay por pais*/
SELECT Pedidos.CodigoPedido, Pedidos.CodigoCliente, Clientes.Pais FROM Pedidos, Clientes WHERE Clientes.CodigoCliente=Pedidos.CodigoCliente;

/*Sacar cuantos pedidos hay de cada pais*/
SELECT Clientes.Pais, COUNT(*) FROM Pedidos, Clientes WHERE Clientes.CodigoCliente=Pedidos.CodigoCliente GROUP BY Clientes.Pais;

/*Sacar cuantos pedidos ha hecho cada cliente*/
SELECT Pedidos.CodigoCliente, COUNT(*) FROM Pedidos GROUP BY Pedidos.CodigoCliente;

/*Sacar cuanto dinero cuesta cada pedido*/
SELECT CodigoPedido, SUM(PrecioUnidad*Cantidad) FROM DetallePedidos GROUP BY CodigoPedido;

/*Sacar cuanto dinero se ha gastado cada cliente*/
SELECT Pedidos.CodigoCliente, SUM(PrecioUnidad*Cantidad) FROM DetallePedidos, Pedidos WHERE Pedidos.CodigoPedido=DetallePedidos.CodigoPedido GROUP BY Pedidos.CodigoCliente;

/*Sacar el responsable de venta de cada cliente*/
SELECT Clientes.CodigoCliente, Clientes.NombreCliente, Empleados.CodigoEmpleado, Empleados.Nombre FROM Clientes JOIN Empleados ON Empleados.CodigoEmpleado=Clientes.CodigoEmpleadoRepVentas;

/*Sacar el nombre de los empleados que llevan ventas */
SELECT DISTINCT Clientes.CodigoEmpleadoRepVentas, Empleados.Nombre FROM Clientes JOIN Empleados ON Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado;

/*Sacar todos los empleados y decir a que cliente lleva*/
SELECT Empleados.CodigoEmpleado, Empleados.Nombre, Clientes.CodigoCliente, Clientes.NombreCliente FROM Empleados LEFT JOIN Clientes ON Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado;

