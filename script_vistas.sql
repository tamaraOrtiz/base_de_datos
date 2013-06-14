DROP VIEW IF EXISTS v_facturas_clientes_pendientes;
CREATE VIEW v_facturas_clientes_pendientes AS SELECT t1.id AS factura, t1.cliente, t2.nombre FROM Venta_facturas t1, Clientes t2 WHERE t1.saldo > 0 AND t1.cliente = t2.id;

DROP VIEW IF EXISTS v_facturas_proveedores_pendientes;
CREATE VIEW v_facturas_proveedores_pendientes AS SELECT t1.id AS factura, t1.proveedor, t2.nombre FROM Compra_facturas t1, Proveedores t2 WHERE t1.saldo > 0 AND t1.proveedor = t2.id;

CREATE VIEW v_clientes_credito AS SELECT id, nombre FROM Clientes WHERE linea_de_credito > 0;

CREATE VIEW v_Stock AS SELECT * FROM Stocks;

SELECT * FROM v_Stock;
SELECT * FROM v_facturas_clientes_pendientes;
SELECT * FROM v_facturas_proveedores_pendientes;
SELECT * FROM v_clientes_credito;