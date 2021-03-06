insert into Calles(id,nombre) values
	(1, 'Mcal Estigarribia'),
	(2, 'Juan Leon Mayorquin'),
	(3, 'Carlos Antonio Lopez'),
	(4, 'Cerro Cora'),
	(5, '14 de mayo'),
	(6, 'Tomas Romero Pereira');

insert into Direcciones(id,numero,calle_principal,calle1,calle2) values
	(1, 110, 1,2,3),
	(2, 120, 1,3,4),
	(3, 150, 2,3,4),
	(4, 170, 3,4,5),
	(5, 190, 4,5,6),
	(6, 210, 1,5,6);

insert into Clientes(id,nombre,direccion,telefono,contacto,mail,linea_de_credito,categoria) values
	(1,'Juan Petta',1,'200305','Juan Petta','juan@uni.edu.py',0,1),
	(2,'Cesar Ibarrola',2,'200306','Cesar Ibarrola','cesar@uni.edu.py',0,1),
	(3,'Petrosur',3,'200307','Marian Aranda','marian@uni.edu.py',0,1),
	(4,'Rocio Otazu',4,'200308','Rocio Otazu','roco@uni.edu.py',1000000,2),
	(5,'Liz Garcia',5,'200308','Liz Garcia','liz@uni.edu.py',1000000,2),
	(6,'Marcos Ledezma',6,'200310','Marcos Ledezma','marcos@uni.edu.py',1000000,2);

insert into Marcas_productos(id,nombre) values
	(1,'Tramontina'),
	(2,'Brisa'),
	(3,'Impaco'),
	(4,'Tigre'),
	(5,'Leon'),
	(6,'Fore');

insert into Lineas_productos(id,descripcion,nombre) values
	(1,'4 mm', 'cable'),
	(2,'macho','toma corriente'),
	(3,'2 mtrs. bronce','jabalina'),
	(4,'3/4','canho corrugado'),
	(5,'negro, marron y blanco','porta foco'),
	(6,'100 w','foco');

insert into Impuestos(id,nombre,porcentaje) values
	(1,'IVA 0%',0),
	(2,'IVA 5%',5),
	(3,'IVA 10%',10);

insert into Categorias(id,nombre,linea_credito) values
	(1,'minorista',2000000),
	(2,'mayorista',10000000);

insert into Productos(id,marca,linea,codigo_de_barra,nombre,descripcion,costo_unitario,iva_impuesto) values
	(1,1,1,254678559,'cable caoxil','4 mm',800,2),
	(2,2,2,145758895,'toma corriente','macho',300,3),
	(3,3,3,558799486,'jabalina','1 mtr.',400,1),
	(4,4,4,587945784,'canho T','3/4',1000,2),
	(5,5,4,784595227,'portafoco grande','blanco',1500,1),
	(6,6,6,214557845,'foco grande','60 w',1000,3);

insert into Empleados(id,nombre,direccion,telefono,mail) values
	(1,'Juan Petta',1,'200305','juan@uni.edu.py'),
	(2,'Cesar Ibarrola',2,'200306','cesar@uni.edu.py'),
	(3,'Petrosur',3,'200307','marian@uni.edu.py'),
	(4,'Rocio Otazu',4,'200308','roco@uni.edu.py'),
	(5,'Liz Garcia',5,'200308','liz@uni.edu.py'),
	(6,'Marcos Ledezma',6,'200310','marcos@uni.edu.py');

insert into Lista_precios(id,producto_id,precio,fecha_actualizada) values
	(1,1,1000,'13-05-05'),
	(2,2,700,'13-05-05'),
	(3,3,800,'13-05-08'),
	(4,4,2000,'13-05-08'),
	(5,5,3000,'13-05-10'),
	(6,6,2000,'13-05-18');

insert into Depositos(id, direccion, nombre) values
	(1,1,'Deposito A'),
	(2,5,'Deposito A'),
	(3,4,'Salon de Ventas Principal');

insert into Stocks(producto_id,deposito_id,cantidad) values
	(1,1,10),
	(2,1,12),
	(3,1,14),
	(4,1,16),
	(5,1,18),
	(6,2,4),
	(1,2,10);

insert into Proveedores(id,nombre,direccion,telefono,contacto,mail,saldo,categoria) values
	(1,'CablePar',1,071200093,'Juan Gomez','juan@gmail.com',1000000,1),
	(2,'Focus',2,071205630,'Hernan Noguera','hernan@gmail.com',500000,2),
	(3,'Luminotecnia',3,071205478,'Maria Martinez','maria@gmail.com',0,2),
	(4,'ElectroPar',4,071205064,'Elena Aranda','elena@gmail.com',100000,2),
	(5,'Ogara',5,071203565,'Jose Baez','jose@gmail.com',0,1),
	(6,'Mbarete',6,071205489,'Angel Miranda','angel@gmail.com',50000,1);

insert into Transferencias(id, encargado_traslado, autorizado_empleado, deposito_origen, deposito_destino) values
	(1,'Hector Nuñez',1,1,2),
	(2,'Gregorio Faraldo',2,1,3),
	(3,'Gregorio Faraldo',3,3,2),
	(4,'Hector Nuñez',4,2,1),
	(5,'Gregorio Faraldo',5,3,2),
	(6,'Alejandro Saucedo',5,1,2);

insert into Transferencia_detalles(id, transferencia_id, producto_id, cantidad) values
	(1,1,2,20),
	(2,2,1,40),
	(3,3,3,60),
	(4,4,4,80),
	(5,5,6,90),
	(6,6,5,110);

insert into Condiciones(id,nombre) values
	(1,'contado'),
	(2,'credito');

insert into Compra_facturas(id,proveedor,deposito_ingreso,condicion,fecha_emision,fecha_vencimiento, monto_total,saldo) values
	(1,1,1,1,'13-05-10','13-05-18',20000,0),
	(2,2,2,2,'13-05-15','13-05-23',400000,1000000),
	(3,3,3,1,'13-05-16','13-05-20',34670,0),
	(4,4,1,2,'13-05-18','13-05-21',112000,500000),
	(5,5,3,2,'13-05-20','13-05-24',11111,1000000),
	(6,6,3,1,'13-05-24','13-06-01',876543,0),
	(7,3,3,1,'13-05-17','13-05-20',34670,0);
	

insert into Compra_detalles(id,compra_id,producto_id,costo_unitario,cantidad,iva) values
	(1,1,1,800,10000,5),
	(2,2,2,300,10000,10),
	(3,3,3,400,1000,0),
	(4,4,4,1000,5000,10),
	(5,5,5,1500,10000,10),
	(6,6,6,1000,500,0),
	(7,7,2,1000,500,0);

insert into Venta_facturas(id,cliente,fecha_emision,fecha_vencimiento,condicion,deposito_egreso,monto_total,saldo) values
	(1,1,'13-05-10','13-05-18',2,1,10000,10000),
	(2,2,'13-05-08','13-06-23',2,2,16000,0),
	(3,3,'13-05-13','13-05-20',1,3,53000,0),
	(4,4,'13-05-18','13-05-21',1,3,15000,0),
	(5,5,'13-05-20','13-05-24',2,1,45000,45000),
	(6,6,'13-05-24','13-06-01',1,1,2400,0);

insert into Venta_detalles(id,venta_id,producto_id,precio_unitario,cantidad,iva,descuento) values
	(1,1,1,800,10,5,1),
	(2,2,2,300,5,10,1),
	(3,3,2,400,10,0,0),
	(4,4,4,1000,8,10,1),
	(5,5,5,1500,5,10,0),
	(6,6,6,1000,4,0,1);

insert into Pago_cliente(id,fecha,observacion,cliente) values
	(1,'13-05-18','pago atrasado',1),
	(2,'13-05-23','pago atrasado',2),
	(3,'13-05-20','pago atrasado',3),
	(4,'13-05-21','pago atrasado',4),
	(5,'13-05-24','pago atrasado',5),
	(6,'13-06-01','pago atrasado',6);

insert into Ordenes_de_pago_clientes(id,factura_id,pc_id,importe) values
	(1,1,1,100000),
	(2,2,2,50000),
	(3,3,3,10000),
	(4,4,4,60000),
	(5,5,5,40000),
	(6,6,6,10000);

insert into Detalles_orden_de_pago_clientes(id,orden_pago_id,importe,forma_de_pago,pc_id) values
	(1,1,100000,'contado',1),
	(2,2,50000,'cheque',2),
	(3,3,10000,'cheque',3),
	(4,4,60000,'cheque',4),
	(5,5,40000,'contado',5),
	(6,6,10000,'contado',6);

insert into Pago_proveedor(id,proveedor,fecha, observacion) value
	(1,1,'13-05-12','Pago atrasado'),
	(2,2,'13-05-10','Pago atrasado'),
	(3,3,'13-05-09','Pago atrasado'),
	(4,4,'13-05-04','Pago atrasado'),
	(5,5,'13-05-07','Pago atrasado'),
	(6,6,'13-05-08','Pago atrasado');
	

insert into Ordenes_de_pago_proveedores(id,importe,factura_id,pp_id) values
	(1,50000,1,1),
	(2,500000,1,1),
	(3,45000,1,1),
	(4,300000,1,1),
	(5,60000,1,1),
	(6,150000,1,1);

insert into Detalles_orden_de_pago_proveedores(id, orden_pago_id,importe, forma_de_pago,pp_id) values
	(1,1,20000,'Contado',1),
	(2,2,40000,'Contado',2),
	(3,3,50000,'Contado',3),
	(4,4,60000,'Contado',4),
	(5,5,80000,'Contado',5),
	(6,6,90000,'Contado',6);