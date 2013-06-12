SELECT t1.producto_id, t2.nombre, t1.cantidad FROM Venta_detalles t1, Productos t2 
	WHERE t1.producto_id = t2.id ORDER BY t1.cantidad DESC LIMIT 5;

SELECT t1.cliente, t2.nombre, SUM(t3.monto_total) AS monto_total FROM Venta_facturas t1, Clientes t2, Venta_detalles t3
	WHERE (t1.cliente = t2.id AND t3.venta_id = t1.id) GROUP BY t1.cliente ORDER BY t3.monto_total DESC LIMIT 5;

SELECT t1.proveedor, t2.nombre, SUM(t1.monto_total) AS monto_total FROM Compra_facturas t1, Proveedores t2
	WHERE (t1.proveedor = t2.id) GROUP BY t1.proveedor ORDER BY t1.monto_total DESC LIMIT 5;



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
