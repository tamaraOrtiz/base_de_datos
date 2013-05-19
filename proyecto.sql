--
-- ER/Studio 7.5 SQL Code Generation
-- Company :      Microsoft
-- Project :      ProyectoDB.dm1
-- Author :       Microsoft
--
-- Date Created : Saturday, May 18, 2013 14:10:46
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Calles 
--

CREATE TABLE Calles(
    id        DECIMAL(10, 0)    NOT NULL,
    nombre    VARCHAR(100)      NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Categorias 
--

CREATE TABLE Categorias(
    id               DECIMAL(1, 0)     NOT NULL,
    nombre           VARCHAR(18)       NOT NULL,
    linea_credito    DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Clientes 
--

CREATE TABLE Clientes(
    id           DECIMAL(10, 0)    NOT NULL,
    nombre       VARCHAR(100)      NOT NULL,
    direccion    DECIMAL(10, 0),
    telefono     VARCHAR(100)      NOT NULL,
    contacto     VARCHAR(100)      NOT NULL,
    mail         VARCHAR(100)      NOT NULL,
    saldo        DECIMAL(10, 0)    NOT NULL,
    categoria    DECIMAL(1, 0)     NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Compra_detalles 
--

CREATE TABLE Compra_detalles(
    id                DECIMAL(10, 0)    NOT NULL,
    compra_id         DECIMAL(10, 0),
    producto_id       DECIMAL(10, 0)    NOT NULL,
    costo_unitario    DECIMAL(10, 0)    NOT NULL,
    cantidad          DECIMAL(6, 0)     NOT NULL,
    iva               DECIMAL(2, 0)     NOT NULL,
    saldo             DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Compra_facturas 
--

CREATE TABLE Compra_facturas(
    id                   DECIMAL(10, 0)    NOT NULL,
    proveedor            DECIMAL(10, 0)    NOT NULL,
    deposito_ingreso     DECIMAL(10, 0)    NOT NULL,
    condicion            DECIMAL(1, 0)     NOT NULL,
    fecha_emision        DATE              NOT NULL,
    fecha_vencimiento    DATE              NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Condiciones 
--

CREATE TABLE Condiciones(
    id        DECIMAL(1, 0)    NOT NULL,
    nombre    VARCHAR(100)     NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Depositos 
--

CREATE TABLE Depositos(
    id           DECIMAL(10, 0)    NOT NULL,
    direccion    DECIMAL(10, 0),
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Detalles_orden_de_pago_clientes 
--

CREATE TABLE Detalles_orden_de_pago_clientes(
    id               DECIMAL(10, 0)    NOT NULL,
    orden_pago_id    DECIMAL(10, 0)    NOT NULL,
    importe          DECIMAL(10, 0)    NOT NULL,
    forma_de_pago    VARCHAR(100)      NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Detalles_orden_de_pago_proveedores 
--

CREATE TABLE Detalles_orden_de_pago_proveedores(
    id               DECIMAL(10, 0)    NOT NULL,
    orden_pago_id    DECIMAL(10, 0)    NOT NULL,
    importe          DECIMAL(10, 0)    NOT NULL,
    forma_de_pago    VARCHAR(100)      NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Direcciones 
--

CREATE TABLE Direcciones(
    id                 DECIMAL(10, 0)    NOT NULL,
    numero             DECIMAL(10, 0),
    calle_principal    DECIMAL(10, 0)    NOT NULL,
    calle1             DECIMAL(10, 0)    NOT NULL,
    calle2             DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Empleados 
--

CREATE TABLE Empleados(
    id           DECIMAL(10, 0)    NOT NULL,
    nombre       VARCHAR(100)      NOT NULL,
    direccion    DECIMAL(10, 0),
    telefono     VARCHAR(100)      NOT NULL,
    mail         VARCHAR(100)      NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Impuestos 
--

CREATE TABLE Impuestos(
    id            DECIMAL(2, 0)    NOT NULL,
    nombre        CHAR(10),
    porcentaje    DECIMAL(5, 2)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Lineas_productos 
--

CREATE TABLE Lineas_productos(
    id             DECIMAL(10, 0)    NOT NULL,
    descripcion    VARCHAR(100),
    nombre         VARCHAR(100)      NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Lista_precios 
--

CREATE TABLE Lista_precios(
    id             CHAR(10)          NOT NULL,
    producto_id    DECIMAL(10, 0)    NOT NULL,
    precio         DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Marcas_productos 
--

CREATE TABLE Marcas_productos(
    id        DECIMAL(10, 0)    NOT NULL,
    nombre    VARCHAR(10),
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Ordenes_de_pago_clientes 
--

CREATE TABLE Ordenes_de_pago_clientes(
    id               DECIMAL(10, 0)    NOT NULL,
    factura_id       DECIMAL(10, 0)    NOT NULL,
    fecha_de_pago    DATE              NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Ordenes_de_pago_proveedores 
--

CREATE TABLE Ordenes_de_pago_proveedores(
    id               DECIMAL(10, 0)    NOT NULL,
    factura_id       DECIMAL(10, 0)    NOT NULL,
    fecha_de_pago    DATE              NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Productos 
--

CREATE TABLE Productos(
    id                 DECIMAL(10, 0)    NOT NULL,
    marca              DECIMAL(10, 0),
    linea              DECIMAL(10, 0)    NOT NULL,
    codigo_de_barra    DECIMAL(13, 0)    NOT NULL,
    descripcion        VARCHAR(100),
    costo_unitario     DECIMAL(10, 0)    NOT NULL,
    iva_impuesto       DECIMAL(2, 0)     NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Proveedores 
--

CREATE TABLE Proveedores(
    id           DECIMAL(10, 0)    NOT NULL,
    nombre       VARCHAR(100)      NOT NULL,
    direccion    DECIMAL(10, 0),
    telefono     VARCHAR(100)      NOT NULL,
    contacto     VARCHAR(100)      NOT NULL,
    mail         VARCHAR(100)      NOT NULL,
    saldo        DECIMAL(10, 0)    NOT NULL,
    categoria    DECIMAL(1, 0),
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Stocks 
--

CREATE TABLE Stocks(
    id              DECIMAL(10, 0)    NOT NULL,
    producto_id     DECIMAL(10, 0)    NOT NULL,
    cantidad        DECIMAL(10, 0)    NOT NULL,
    depositos_id    DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Transferencia_detalles 
--

CREATE TABLE Transferencia_detalles(
    id                  DECIMAL(10, 0)    NOT NULL,
    transferencia_id    DECIMAL(10, 0)    NOT NULL,
    producto_id         DECIMAL(10, 0)    NOT NULL,
    cantidad            DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Transferencias 
--

CREATE TABLE Transferencias(
    id                     DECIMAL(10, 0)    NOT NULL,
    encargado_traslado     VARCHAR(100)      NOT NULL,
    autorizado_empleado    DECIMAL(10, 0),
    deposito_origen        DECIMAL(10, 0),
    deposito_destino       DECIMAL(10, 0),
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Venta_detalles 
--

CREATE TABLE Venta_detalles(
    id                 DECIMAL(10, 0)    NOT NULL,
    venta_id           DECIMAL(10, 0)    NOT NULL,
    producto_id        DECIMAL(10, 0)    NOT NULL,
    precio_unitario    DECIMAL(10, 0)    NOT NULL,
    cantidad           DECIMAL(6, 0)     NOT NULL,
    iva                DECIMAL(2, 0)     NOT NULL,
    saldo              DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Venta_facturas 
--

CREATE TABLE Venta_facturas(
    id                   DECIMAL(10, 0)    NOT NULL,
    cliente              DECIMAL(10, 0)    NOT NULL,
    fecha_emision        DATE              NOT NULL,
    fecha_vencimiento    DATE              NOT NULL,
    condicion            DECIMAL(1, 0),
    deposito_egreso      DECIMAL(10, 0),
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Clientes 
--

ALTER TABLE Clientes ADD CONSTRAINT RefCategorias2 
    FOREIGN KEY (categoria)
    REFERENCES Categorias(id)
;

ALTER TABLE Clientes ADD CONSTRAINT RefDirecciones53 
    FOREIGN KEY (direccion)
    REFERENCES Direcciones(id)
;


-- 
-- TABLE: Compra_detalles 
--

ALTER TABLE Compra_detalles ADD CONSTRAINT RefProductos66 
    FOREIGN KEY (producto_id)
    REFERENCES Productos(id)
;

ALTER TABLE Compra_detalles ADD CONSTRAINT RefCompra_facturas38 
    FOREIGN KEY (compra_id)
    REFERENCES Compra_facturas(id)
;


-- 
-- TABLE: Compra_facturas 
--

ALTER TABLE Compra_facturas ADD CONSTRAINT RefProveedores4 
    FOREIGN KEY (proveedor)
    REFERENCES Proveedores(id)
;

ALTER TABLE Compra_facturas ADD CONSTRAINT RefCondiciones5 
    FOREIGN KEY (condicion)
    REFERENCES Condiciones(id)
;

ALTER TABLE Compra_facturas ADD CONSTRAINT RefDepositos7 
    FOREIGN KEY (deposito_ingreso)
    REFERENCES Depositos(id)
;


-- 
-- TABLE: Depositos 
--

ALTER TABLE Depositos ADD CONSTRAINT RefDirecciones51 
    FOREIGN KEY (direccion)
    REFERENCES Direcciones(id)
;


-- 
-- TABLE: Detalles_orden_de_pago_clientes 
--

ALTER TABLE Detalles_orden_de_pago_clientes ADD CONSTRAINT RefOrdenes_de_pago_clientes73 
    FOREIGN KEY (orden_pago_id)
    REFERENCES Ordenes_de_pago_clientes(id)
;


-- 
-- TABLE: Detalles_orden_de_pago_proveedores 
--

ALTER TABLE Detalles_orden_de_pago_proveedores ADD CONSTRAINT RefOrdenes_de_pago_proveedores45 
    FOREIGN KEY (orden_pago_id)
    REFERENCES Ordenes_de_pago_proveedores(id)
;


-- 
-- TABLE: Direcciones 
--

ALTER TABLE Direcciones ADD CONSTRAINT RefCalles47 
    FOREIGN KEY (calle_principal)
    REFERENCES Calles(id)
;

ALTER TABLE Direcciones ADD CONSTRAINT RefCalles48 
    FOREIGN KEY (calle1)
    REFERENCES Calles(id)
;

ALTER TABLE Direcciones ADD CONSTRAINT RefCalles49 
    FOREIGN KEY (calle2)
    REFERENCES Calles(id)
;


-- 
-- TABLE: Empleados 
--

ALTER TABLE Empleados ADD CONSTRAINT RefDirecciones52 
    FOREIGN KEY (direccion)
    REFERENCES Direcciones(id)
;


-- 
-- TABLE: Lista_precios 
--

ALTER TABLE Lista_precios ADD CONSTRAINT RefProductos70 
    FOREIGN KEY (producto_id)
    REFERENCES Productos(id)
;


-- 
-- TABLE: Ordenes_de_pago_clientes 
--

ALTER TABLE Ordenes_de_pago_clientes ADD CONSTRAINT RefVenta_facturas74 
    FOREIGN KEY (factura_id)
    REFERENCES Venta_facturas(id)
;


-- 
-- TABLE: Ordenes_de_pago_proveedores 
--

ALTER TABLE Ordenes_de_pago_proveedores ADD CONSTRAINT RefCompra_facturas44 
    FOREIGN KEY (factura_id)
    REFERENCES Compra_facturas(id)
;


-- 
-- TABLE: Productos 
--

ALTER TABLE Productos ADD CONSTRAINT RefImpuestos63 
    FOREIGN KEY (iva_impuesto)
    REFERENCES Impuestos(id)
;

ALTER TABLE Productos ADD CONSTRAINT RefLineas_productos31 
    FOREIGN KEY (linea)
    REFERENCES Lineas_productos(id)
;

ALTER TABLE Productos ADD CONSTRAINT RefMarcas_productos32 
    FOREIGN KEY (marca)
    REFERENCES Marcas_productos(id)
;


-- 
-- TABLE: Proveedores 
--

ALTER TABLE Proveedores ADD CONSTRAINT RefCategorias3 
    FOREIGN KEY (categoria)
    REFERENCES Categorias(id)
;

ALTER TABLE Proveedores ADD CONSTRAINT RefDirecciones50 
    FOREIGN KEY (direccion)
    REFERENCES Direcciones(id)
;


-- 
-- TABLE: Stocks 
--

ALTER TABLE Stocks ADD CONSTRAINT RefDepositos67 
    FOREIGN KEY (depositos_id)
    REFERENCES Depositos(id)
;

ALTER TABLE Stocks ADD CONSTRAINT RefProductos68 
    FOREIGN KEY (producto_id)
    REFERENCES Productos(id)
;


-- 
-- TABLE: Transferencia_detalles 
--

ALTER TABLE Transferencia_detalles ADD CONSTRAINT RefProductos69 
    FOREIGN KEY (producto_id)
    REFERENCES Productos(id)
;

ALTER TABLE Transferencia_detalles ADD CONSTRAINT RefTransferencias41 
    FOREIGN KEY (transferencia_id)
    REFERENCES Transferencias(id)
;


-- 
-- TABLE: Transferencias 
--

ALTER TABLE Transferencias ADD CONSTRAINT RefEmpleados26 
    FOREIGN KEY (autorizado_empleado)
    REFERENCES Empleados(id)
;

ALTER TABLE Transferencias ADD CONSTRAINT RefDepositos27 
    FOREIGN KEY (deposito_origen)
    REFERENCES Depositos(id)
;

ALTER TABLE Transferencias ADD CONSTRAINT RefDepositos28 
    FOREIGN KEY (deposito_destino)
    REFERENCES Depositos(id)
;


-- 
-- TABLE: Venta_detalles 
--

ALTER TABLE Venta_detalles ADD CONSTRAINT RefProductos71 
    FOREIGN KEY (producto_id)
    REFERENCES Productos(id)
;

ALTER TABLE Venta_detalles ADD CONSTRAINT RefVenta_facturas39 
    FOREIGN KEY (venta_id)
    REFERENCES Venta_facturas(id)
;


-- 
-- TABLE: Venta_facturas 
--

ALTER TABLE Venta_facturas ADD CONSTRAINT RefClientes12 
    FOREIGN KEY (cliente)
    REFERENCES Clientes(id)
;

ALTER TABLE Venta_facturas ADD CONSTRAINT RefDepositos14 
    FOREIGN KEY (deposito_egreso)
    REFERENCES Depositos(id)
;

ALTER TABLE Venta_facturas ADD CONSTRAINT RefCondiciones17 
    FOREIGN KEY (condicion)
    REFERENCES Condiciones(id)
;


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

insert into Clientes(id,nombre,direccion,telefono,contacto,mail,saldo,categoria) values
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




