SELECT fecha_emision AS Fecha, deposito_egreso AS Deposito, COUNT(deposito_egreso) AS Total_de_Ventas FROM Venta_facturas 
	WHERE (fecha_emision > "13-05-14" AND fecha_emision < "13-06-14") GROUP BY fecha_emision;

SELECT fecha_emision AS Fecha, deposito_ingreso AS Deposito, COUNT(deposito_ingreso) AS Total_de_Compras FROM Compra_facturas 
	WHERE (fecha_emision > "13-05-14" AND fecha_emision < "13-06-14") GROUP BY fecha_emision;

SELECT t1.id, t1.fecha_vencimiento, t1.cliente, t2.nombre, t1.saldo FROM Venta_facturas t1, Clientes t2
	WHERE ((t1.fecha_vencimiento < CURDATE() AND t1.saldo > 0) AND t1.cliente = t2.id);

SELECT t1.id, t1.fecha_vencimiento, t1.cliente, t2.nombre, t1.saldo FROM Venta_facturas t1, Clientes t2
	WHERE ((t1.fecha_vencimiento > CURDATE() AND t1.saldo > 0) AND t1.cliente = t2.id);

SELECT t1.id, t1.fecha_vencimiento, t1.proveedor, t2.nombre, t1.saldo FROM Compra_facturas t1, Proveedores t2
	WHERE ((t1.fecha_vencimiento < CURDATE() AND t1.saldo > 0) AND (t1.proveedor = t2.id));

SELECT t1.id, t1.fecha_vencimiento, t1.proveedor, t2.nombre, t1.saldo FROM Compra_facturas t1, Proveedores t2
	WHERE ((t1.fecha_vencimiento > CURDATE() AND t1.saldo > 0) AND (t1.proveedor = t2.id));

SELECT t1.producto_id, t2.nombre, t1.cantidad FROM Venta_detalles t1, Productos t2 
	WHERE t1.producto_id = t2.id ORDER BY t1.cantidad DESC LIMIT 5;

SELECT t1.cliente, t2.nombre, SUM(t1.monto_total) AS monto_total FROM Venta_facturas t1, Clientes t2
	WHERE (t1.cliente = t2.id ) GROUP BY t1.cliente ORDER BY t1.monto_total DESC LIMIT 5;

SELECT t1.proveedor, t2.nombre, SUM(t1.monto_total) AS monto_total FROM Compra_facturas t1, Proveedores t2
	WHERE (t1.proveedor = t2.id) GROUP BY t1.proveedor ORDER BY t1.monto_total DESC LIMIT 5;

SELECT t1.id AS Producto, t1.nombre AS Descripcion, t2.precio, MAX(t3.fecha_emision) AS Ultima_venta FROM Productos t1, Lista_precios t2,  Venta_detalles t4, Venta_Facturas t3
	WHERE ((t3.fecha_emision < "13-05-14" OR t3.fecha_emision > "13-06-14") AND (t4.venta_id = t3.id AND t1.id = t4.producto_id AND t2.producto_id = t1.id)) GROUP BY t1.id;



SELECT * FROM Calles;
SELECT * FROM Categorias;
SELECT * FROM Clientes;
SELECT * FROM Compra_detalles;
SELECT * FROM Compra_facturas;
SELECT * FROM Condiciones;
SELECT * FROM Depositos;
SELECT * FROM Detalles_orden_de_pago_proveedores;
SELECT * FROM Direcciones;
SELECT * FROM Empleados;
SELECT * FROM Impuestos;
SELECT * FROM Lineas_productos;
SELECT * FROM Lista_precios;
SELECT * FROM Marcas_productos;
SELECT * FROM Ordenes_de_pago_clientes;
SELECT * FROM Ordenes_de_pago_proveedores;
SELECT * FROM Pago_cliente;
SELECT * FROM Pago_proveedor;
SELECT * FROM Productos;
SELECT * FROM Proveedores;
SELECT * FROM Stocks;
SELECT * FROM Transferencia_detalles;
SELECT * FROM Transferencias;
SELECT * FROM Venta_detalles;
SELECT * FROM Venta_facturas;
