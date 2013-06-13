USE proyectodb;

DROP PROCEDURE IF EXISTS p_generar_factura_de_venta;
DELIMITER | 
CREATE PROCEDURE p_generar_factura_de_venta(cliente_id INT,deposito_de_egreso_id INT,
	condicion_id INT,fecha_de_emision DATE,fecha_de_vencimiento DATE)
BEGIN
	INSERT INTO Venta_facturas(cliente,deposito_egreso,condicion,fecha_emision,fecha_vencimiento,monto_total,saldo)
		VALUES(cliente_id,deposito_de_egreso_id,condicion_id,fecha_de_emision,fecha_de_vencimiento,0,0);
END | 
DELIMITER ;


DROP TRIGGER IF EXISTS t_factura_de_venta;
DELIMITER | 
CREATE TRIGGER t_factura_de_venta BEFORE INSERT ON Venta_facturas
FOR EACH ROW
BEGIN
	IF (NEW.fecha_emision < CURDATE() OR NEW.fecha_vencimiento < CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fecha no valida';
	END IF;
END|
DELIMITER ;


DROP PROCEDURE IF EXISTS p_generar_factura_de_compra;
DELIMITER | 
CREATE PROCEDURE p_generar_factura_de_compra(proveedor_id INT,deposito_de_ingreso_id INT,
	condicion_id INT,fecha_de_emision DATE,fecha_de_vencimiento DATE)
BEGIN
	INSERT INTO Compra_facturas(proveedor,deposito_ingreso,condicion,fecha_emision,fecha_vencimiento,monto_total,saldo)
		VALUES(proveedor_id,deposito_de_ingreso_id,condicion_id,fecha_de_emision,fecha_de_vencimiento,0,0);
END | 
DELIMITER ;



DROP TRIGGER IF EXISTS t_factura_de_compra;
DELIMITER | 
CREATE TRIGGER t_factura_de_compra BEFORE INSERT ON Compra_facturas
FOR EACH ROW
BEGIN
	IF (NEW.fecha_emision < CURDATE() OR NEW.fecha_vencimiento < CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fecha no valida';
	END IF;
END|
DELIMITER ;

call p_generar_factura_de_venta(1,1,1,NOW(),NOW()); 
call p_generar_factura_de_compra(1,1,1,NOW(),NOW()); 

DROP PROCEDURE IF EXISTS p_agregar_detalles_factura_de_compra;
DELIMITER |
/*
* producto_agregado_id	es la referencia a un objeto del tipo producto
* cantidad_vcomprada		es la cantidad de productos comprada
*/ 
CREATE PROCEDURE p_agregar_detalles_factura_de_compra(producto_agregado_id INT,cantidad_comprada INT)
BEGIN
	DECLARE id_compra, condicion_de_venta,precio_por_unidad,iva_id, costo_del_detalle INT;
	SET id_compra			= (SELECT MAX(id) FROM Compra_facturas);
	SET precio_por_unidad	= (SELECT costo_unitario FROM Productos p WHERE p.id = producto_agregado_id);
	SET iva_id				= (SELECT iva_impuesto FROM Productos p WHERE p.id = producto_agregado_id);
	SET costo_del_detalle = precio_por_unidad*cantidad_comprada;
	INSERT INTO Compra_detalles(compra_id,producto_id,costo_unitario,cantidad,iva,monto_total,saldo)
		VALUES(id_compra,producto_agregado_id,precio_por_unidad,cantidad_comprada,iva_id,costo_total,0);
END | 
DELIMITER ;



DROP PROCEDURE IF EXISTS p_agregar_detalles_factura_de_venta;
DELIMITER |
/*
* producto_agregado_id	es la referencia a un objeto del tipo producto
* cantidad_vendida		es la cantidad de productos vendidos
* descuento				es el dinero que se descontara
*/ 
CREATE PROCEDURE p_agregar_detalles_factura_de_venta(producto_agregado_id INT,cantidad_vendida INT, descuento INTEGER)
BEGIN
	DECLARE id_venta, condicion_de_venta,precio_por_unidad,iva_id, cantidad_stock, costo_total,descuento_limite INT;
	SET id_venta = (SELECT MAX(id) FROM Venta_facturas);
	SET precio_por_unidad = (SELECT costo_unitario FROM Productos p WHERE p.id = producto_agregado_id);
	SET iva_id = (SELECT iva_impuesto FROM Productos p WHERE p.id = producto_agregado_id);
	SET costo_total = precio_por_unidad*cantidad_vendida;
	INSERT INTO Venta_detalles(venta_id,producto_id,precio_unitario,cantidad,iva,monto_total,descuento,saldo)
		VALUES(id_venta,producto_agregado_id,precio_por_unidad,cantidad_vendida,iva_id,costo_total,descuento,0);
END | 
DELIMITER ;



DROP TRIGGER IF EXISTS t_venta_detalles;
DELIMITER | 
CREATE TRIGGER t_venta_detalles BEFORE INSERT ON Venta_detalles
FOR EACH ROW 
BEGIN
	DECLARE deposito, limite_credito,condicion_de_venta, limite_descuento, cantidad_stock INTEGER;
	SET limite_credito = 1000000;
	SET condicion_de_venta = (SELECT condicion FROM Venta_facturas vf WHERE vf.id = NEW.venta_id);
	IF (NEW.saldo> limite_credito) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error Saldo inferior al maximo de descuento permitido para esta cuenta';
	END IF;
	SET limite_descuento = IF(condicion_de_venta=1,NEW.monto_total*20/100,NEW.monto_total*10/100);
	IF (NEW.descuento > limite_descuento) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error descuento mayor al limite_descuento';
	END IF;
	SET cantidad_stock = (SELECT SUM(cantidad) FROM Stocks s WHERE s.producto_id = producto_id);
	IF (cantidad_stock < NEW.cantidad ) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error la cantidad en stock no es suficiente para cubrir la demanda';
	END IF;
	SET deposito = (SELECT deposito_egreso FROM Venta_facturas vf WHERE vf.id = last_insert_id());
	UPDATE Stocks s
		SET cantidad = cantidad - NEW.cantidad
		WHERE s.depositos_id = deposito and s.producto_id = NEW.producto_id;
	
END | 
DELIMITER ;

DROP PROCEDURE IF EXISTS p_generar_transferencia;
DELIMITER | 
CREATE PROCEDURE p_generar_transferencia(encargado_traslado VARCHAR(100), autorizado_empleado_id INT, deposito_origen_id INT, deposito_destino_id INT)
BEGIN
	INSERT INTO Transferencias(encargado_traslado,autorizado_empleado,deposito_origen,deposito_destino)
		VALUES(encargado_traslado,autorizado_empleado_id,deposito_origen_id,deposito_destino_id);
END | 
DELIMITER ;

DROP PROCEDURE IF EXISTS p_agregar_transferencia_detalles;
DELIMITER | 
CREATE PROCEDURE p_agregar_transferencia_detalles(producto_id INT, cantidad_p DECIMAl(10,0))
BEGIN
	DECLARE id_transferencia, deposito_o , deposito_d  INT;
	SET id_transferencia = (SELECT MAX(id) FROM Transferencias);
	SET deposito_o = (SELECT deposito_origen FROM Transferencias t WHERE t.id = id_transferencia);
	SET deposito_d = (SELECT deposito_destino FROM Transferencias t WHERE t.id = id_transferencia);
	
	UPDATE Stocks s
		SET cantidad = cantidad - cantidad_p
		WHERE s.depositos_id = deposito_o;
	UPDATE Stocks s 
		SET cantidad = cantidad + cantidad_p
		WHERE s.depositos_id = deposito_d;

	INSERT INTO Transferencia_detalles(transferencia_id,producto_id,cantidad)
		VALUES(id_transferencia,producto_id,cantidad_p);
END | 
DELIMITER ;

DROP PROCEDURE IF EXISTS p_agregar_pago_cliente;
DELIMITER |
CREATE PROCEDURE p_agregar_pago_cliente(cliente_id INT, observacion DATE)
BEGIN
	DECLARE fecha_actual DATE;
	SET fecha_actual = CURDATE();
	INSERT INTO Pago_cliente(cliente,fecha,observacion)
		VALUES(cliente_id,fecha_actual,observacion);
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS p_ordenes_de_pago_clientes;
DELIMITER |
CREATE PROCEDURE p_ordenes_de_pago_clientes(factura_id INT, importe INT)
BEGIN
	DECLARE id_pc INT; 
	SET id_pc = (SELECT MAX(id) FROM Pago_cliente);
	UPDATE Venta_detalles vd 
		SET saldo = saldo - importe
		WHERE vd.id = factura_id;

	INSERT INTO Ordenes_de_pago_clientes(pc_id,factura_id,importe)
		VALUES(id_pc,factura_id,importe);
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS p_detalles_orden_de_pago_clientes;
DELIMITER |
CREATE PROCEDURE p_detalles_orden_de_pago_clientes(forma_de_pago VARCHAR(100))
BEGIN
	DECLARE id_pc, orden_de_pago_id, importe_od INT; 
	SET id_pc = (SELECT MAX(id) FROM Pago_cliente);
	SET orden_de_pago_id = (SELECT MAX(id) FROM Ordenes_de_pago_clientes);
	SET importe_od = (SELECT importe FROM Ordenes_de_pago_clientes op WHERE op.id = orden_de_pago_id);
	INSERT INTO Detalles_orden_de_pago_clientes(pc_id,orden_pago_id,importe,forma_de_pago)
		VALUES(id_pc,orden_de_pago_id,importe_od,forma_de_pago);
END |
DELIMITER ;

DROP TRIGGER IF EXISTS t_ordenes_de_pago_clientes;
DELIMITER | 
CREATE TRIGGER t_ordenes_de_pago_clientes BEFORE INSERT ON Ordenes_de_pago_clientes
FOR EACH ROW 
BEGIN
	DECLARE condicion_id INT;
	SET condicion_id = (SELECT condicion FROM Venta_facturas vf WHERE vf.id = NEW.factura_id);
	IF (condicion_id = 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura ya fue pagada';
	END IF;
END | 
DELIMITER ;


DROP TRIGGER IF EXISTS t_stock;
DELIMITER | 
CREATE TRIGGER t_stock BEFORE UPDATE ON Stocks
FOR EACH ROW 
BEGIN
	IF (NEW.cantidad < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error la cantidad en stock no es suficiente para cubrir la demanda';
	END IF;
END | 
DELIMITER ;

DROP PROCEDURE IF EXISTS p_agregar_pago_proveedores;
DELIMITER |
CREATE PROCEDURE p_agregar_pago_proveedores(proveerdor_id INT, observacion DATE)
BEGIN
	DECLARE fecha_actual DATE;
	SET fecha_actual = CURDATE();
	INSERT INTO Pago_cliente(proveedor,fecha,observacion)
		VALUES(proveedor_id,fecha_actual,observacion);
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS p_ordenes_de_pago_proveedores;
DELIMITER |
CREATE PROCEDURE p_ordenes_de_pago_proveedores(factura_id INT, importe INT)
BEGIN
	DECLARE id_pp INT; 
	SET id_pp = (SELECT MAX(id) FROM Pago_proveedores);
	UPDATE Compra_facturas cf
		SET saldo = saldo - importe
		WHERE cf.id = factura_id;

	INSERT INTO Ordenes_de_pago_proveedores(pp_id,importe,factura_id)
		VALUES(id_pp,importe,factura_id);
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS p_detalles_orden_de_pago_proveedores;
DELIMITER |
CREATE PROCEDURE p_detalles_orden_de_pago_proveedores(forma_de_pago VARCHAR(100))
BEGIN
	DECLARE id_pp, orden_de_pago_id, importe_od INT; 
	SET id_pp = (SELECT MAX(id) FROM Pago_proveedores);
	SET orden_de_pago_id = (SELECT MAX(id) FROM Ordenes_de_pago_proveedores);
	SET importe_od = (SELECT importe FROM Ordenes_de_pago_proveedores op WHERE op.id = orden_de_pago_id);
	INSERT INTO Detalles_orden_de_pago_proveedores(pp_id,orden_pago_id,importe,forma_de_pago)
		VALUES(id_pp,orden_de_pago_id,importe_od,forma_de_pago);
END |
DELIMITER ;

DROP TRIGGER IF EXISTS t_ordenes_de_pago_proveedores;
DELIMITER |
CREATE TRIGGER t_ordenes_de_pago_proveedores BEFORE INSERT ON Ordenes_de_pago_proveedores
FOR EACH ROW 
BEGIN
	DECLARE condicion_id INT;
	SET condicion_id = (SELECT condicion FROM Compra_facturas cf WHERE cf.id = NEW.factura_id);
	IF (condicion_id = 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura ya fue pagada';
	END IF;
END | 
DELIMITER ;

SELECT * FROM Compra_facturas;
SELECT * FROM Venta_detalles;
SELECT * FROM Stocks;
call p_generar_factura_de_venta(1,1,1,NOW(),NOW()); 
call p_agregar_detalles_factura_de_venta(1,3,200);
-- call p_agregar_transferencia_detalles(1,3);
SELECT * FROM Venta_facturas;
SELECT * FROM Venta_detalles;
SELECT * FROM Stocks;