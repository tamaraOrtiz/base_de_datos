USE proyectodb;
DROP PROCEDURE IF EXISTS p_generar_factura_de_venta;
DELIMITER | 
CREATE PROCEDURE p_generar_factura_de_venta(cliente_id INT,deposito_de_egreso_id INT,
	condicion_id INT,fecha_de_emision DATE,fecha_de_vencimiento DATE)
BEGIN
	DECLARE id decimal;
	IF (fecha_de_emision < CURDATE() OR fecha_de_vencimiento < CURDATE()) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fecha no valida';
	END IF;
	INSERT INTO Venta_facturas(cliente,deposito_egreso,condicion,fecha_emision,fecha_vencimiento)
		VALUES(cliente_id,deposito_de_egreso_id,condicion_id,fecha_de_emision,fecha_de_vencimiento);
END | 
DELIMITER ;

DROP PROCEDURE IF EXISTS p_agregar_detalles_factura_de_venta;
DELIMITER | 
CREATE PROCEDURE p_agregar_detalles_factura_de_venta(producto_agregado_id INT,cantidad_vendida INT, saldo INT)
BEGIN
	DECLARE id_venta, condicion_de_venta,precio_por_unidad,iva_id, cantidad_stock, costo_total,
		descuento_limite INT;
	SET id_venta = (SELECT MAX(id) FROM Venta_facturas);
	SET precio_por_unidad = (SELECT costo_unitario FROM Productos p WHERE p.id = producto_agregado_id);
	SET iva_id = (SELECT iva_impuesto FROM Productos p WHERE p.id = producto_agregado_id);
	SET condicion_de_venta = (SELECT condicion FROM Venta_facturas vf WHERE vf.id = id_venta);
	SET costo_total = precio_por_unidad*cantidad_vendida;
	SET descuento_limite = IF(condicion_de_venta=1,costo_total*20/100,costo_total*10/100);
	IF (saldo < costo_total - descuento_limite) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Saldo inferior al maximo de descuento permitido para esta cuenta';
	END IF;
	SET cantidad_stock = (SELECT SUM(cantidad) FROM Stocks s WHERE s.producto_id = producto_agregado_id);
	IF (cantidad_stock < cantidad_vendida ) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error la cantidad en stock no es suficiente para cubrir la demanda';
	END IF;
	INSERT INTO Venta_detalles(venta_id,producto_id,precio_unitario,cantidad,iva,saldo)
		VALUES(id_venta,producto_agregado_id,precio_por_unidad,cantidad_vendida,iva_id,saldo);
END | 
DELIMITER ;

DROP TRIGGER IF EXISTS t_venta_detalles;
DELIMITER | 
CREATE TRIGGER t_venta_detalles AFTER INSERT ON Venta_detalles
FOR EACH ROW 
BEGIN
	DECLARE deposito INT;
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
	DECLARE cantidad_stock, id_transferencia, deposito_o , deposito_d  INT;
	SET id_transferencia = (SELECT MAX(id) FROM Transferencias);
	SET deposito_o = (SELECT deposito_origen FROM Transferencias t WHERE t.id = id_transferencia);
	SET deposito_d = (SELECT deposito_destino FROM Transferencias t WHERE t.id = id_transferencia);
	SET cantidad_stock = (SELECT SUM(cantidad) FROM Stocks s WHERE s.producto_id = producto_id AND s.depositos_id = deposito_o);
	
	IF (cantidad_p > cantidad_stock) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error la cantidad en stock no es suficiente para cubrir la demanda';
	END IF;
	
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

#-- Test Unitario
#SELECT * FROM Venta_facturas;
#SELECT * FROM Venta_detalles;
#SELECT * FROM Stocks;
#call p_generar_factura_de_venta(1,1,1,NOW(),NOW()); 
#call p_agregar_detalles_factura_de_venta(1,3,20000);
#SELECT * FROM Venta_facturas;
#SELECT * FROM Venta_detalles;
#SELECT * FROM Stocks;