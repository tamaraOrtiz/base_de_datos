--
-- ER/Studio 7.5 SQL Code Generation
-- Company :      Microsoft
-- Project :      basededatos.dm1
-- Author :       Microsoft
--
-- Date Created : Sunday, May 19, 2013 16:07:33
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
    nombre           VARCHAR(100)      NOT NULL,
    linea_credito    DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Clientes 
--

CREATE TABLE Clientes(
    id           DECIMAL(10, 0)    NOT NULL,
    direccion    DECIMAL(10, 0),
    nombre       VARCHAR(100)      NOT NULL,
    categoria    DECIMAL(1, 0)     NOT NULL,
    telefono     VARCHAR(100)      NOT NULL,
    contacto     VARCHAR(100)      NOT NULL,
    mail         VARCHAR(100)      NOT NULL,
    saldo        DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Compra_detalles 
--

CREATE TABLE Compra_detalles(
    id                DECIMAL(10, 0)    NOT NULL,
    compra_id         DECIMAL(10, 0)    NOT NULL,
    producto_id       DECIMAL(10, 0)    NOT NULL,
    costo_unitario    DECIMAL(10, 0)    NOT NULL,
    cantidad          DECIMAL(10, 0)    NOT NULL,
    iva               DECIMAL(2, 0)     NOT NULL,
    PRIMARY KEY (id, compra_id)
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
    saldo                DECIMAL(10, 0)    NOT NULL,
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
    nombre       VARCHAR(100)      NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Detalles_orden_de_pago_clientes 
--

CREATE TABLE Detalles_orden_de_pago_clientes(
    id               DECIMAL(10, 0)    NOT NULL,
    orden_pago_id    DECIMAL(10, 0)    NOT NULL,
    pc_id            DECIMAL(10, 0)    NOT NULL,
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
    pp_id            DECIMAL(10, 0)    NOT NULL,
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
    calle_principal    DECIMAL(10, 0)    NOT NULL,
    calle1             DECIMAL(10, 0)    NOT NULL,
    calle2             DECIMAL(10, 0)    NOT NULL,
    numero             DECIMAL(10, 0),
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
    nombre        VARCHAR(100)     NOT NULL,
    porcentaje    DECIMAL(5, 2)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Lineas_productos 
--

CREATE TABLE Lineas_productos(
    id             DECIMAL(10, 0)    NOT NULL,
    nombre         VARCHAR(100)      NOT NULL,
    descripcion    VARCHAR(100),
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Lista_precios 
--

CREATE TABLE Lista_precios(
    id                   DECIMAL(10, 0)    NOT NULL,
    producto_id          DECIMAL(10, 0)    NOT NULL,
    precio               DECIMAL(10, 0)    NOT NULL,
    fecha_actualizada    DATE              NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Marcas_productos 
--

CREATE TABLE Marcas_productos(
    id        DECIMAL(10, 0)    NOT NULL,
    nombre    VARCHAR(100)      NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Ordenes_de_pago_clientes 
--

CREATE TABLE Ordenes_de_pago_clientes(
    id            DECIMAL(10, 0)    NOT NULL,
    factura_id    DECIMAL(10, 0)    NOT NULL,
    pc_id         DECIMAL(10, 0)    NOT NULL,
    importe       DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Ordenes_de_pago_proveedores 
--

CREATE TABLE Ordenes_de_pago_proveedores(
    id            DECIMAL(10, 0)    NOT NULL,
    importe       DECIMAL(10, 0)    NOT NULL,
    factura_id    DECIMAL(10, 0)    NOT NULL,
    pp_id         DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Pago_cliente 
--

CREATE TABLE Pago_cliente(
    id             DECIMAL(10, 0)    NOT NULL,
    cliente        DECIMAL(10, 0)    NOT NULL,
    fecha          DATE              NOT NULL,
    observacion    VARCHAR(100),
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: pago_proveedor 
--

CREATE TABLE pago_proveedor(
    id             DECIMAL(10, 0)    NOT NULL,
    proveedor      DECIMAL(10, 0)    NOT NULL,
    fecha          DATE              NOT NULL,
    Observacion    VARCHAR(100),
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Productos 
--

CREATE TABLE Productos(
    id                 DECIMAL(10, 0)    NOT NULL,
    codigo_de_barra    DECIMAL(13, 0)    NOT NULL,
    marca              DECIMAL(10, 0),
    linea              DECIMAL(10, 0)    NOT NULL,
    iva_impuesto       DECIMAL(2, 0)     NOT NULL,
    costo_unitario     DECIMAL(10, 0)    NOT NULL,
    descripcion        VARCHAR(100),
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
    categoria    DECIMAL(1, 0),
    telefono     VARCHAR(100)      NOT NULL,
    contacto     VARCHAR(100)      NOT NULL,
    mail         VARCHAR(100)      NOT NULL,
    saldo        DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Stocks 
--

CREATE TABLE Stocks(
    producto_id     DECIMAL(10, 0)    NOT NULL,
    depositos_id    DECIMAL(10, 0)    NOT NULL,
    cantidad        DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (producto_id, depositos_id)
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
    PRIMARY KEY (id, transferencia_id)
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
    PRIMARY KEY (id, venta_id)
)ENGINE=MYISAM
;



-- 
-- TABLE: Venta_facturas 
--

CREATE TABLE Venta_facturas(
    id                   DECIMAL(10, 0)    NOT NULL,
    cliente              DECIMAL(10, 0)    NOT NULL,
    deposito_egreso      DECIMAL(10, 0),
    condicion            DECIMAL(1, 0),
    fecha_emision        DATE              NOT NULL,
    fecha_vencimiento    DATE              NOT NULL,
    PRIMARY KEY (id)
)ENGINE=MYISAM
;



-- 
-- INDEX: Ref2553 
--

CREATE INDEX Ref2553 ON Clientes(direccion)
;
-- 
-- INDEX: Ref52 
--

CREATE INDEX Ref52 ON Clientes(categoria)
;
-- 
-- INDEX: Ref838 
--

CREATE INDEX Ref838 ON Compra_detalles(compra_id)
;
-- 
-- INDEX: Ref166 
--

CREATE INDEX Ref166 ON Compra_detalles(producto_id)
;
-- 
-- INDEX: Ref94 
--

CREATE INDEX Ref94 ON Compra_facturas(proveedor)
;
-- 
-- INDEX: Ref45 
--

CREATE INDEX Ref45 ON Compra_facturas(condicion)
;
-- 
-- INDEX: Ref77 
--

CREATE INDEX Ref77 ON Compra_facturas(deposito_ingreso)
;
-- 
-- INDEX: Ref2551 
--

CREATE INDEX Ref2551 ON Depositos(direccion)
;
-- 
-- INDEX: Ref3073 
--

CREATE INDEX Ref3073 ON Detalles_orden_de_pago_clientes(orden_pago_id)
;
-- 
-- INDEX: Ref3278 
--

CREATE INDEX Ref3278 ON Detalles_orden_de_pago_clientes(pc_id)
;
-- 
-- INDEX: Ref2345 
--

CREATE INDEX Ref2345 ON Detalles_orden_de_pago_proveedores(orden_pago_id)
;
-- 
-- INDEX: Ref3381 
--

CREATE INDEX Ref3381 ON Detalles_orden_de_pago_proveedores(pp_id)
;
-- 
-- INDEX: Ref2647 
--

CREATE INDEX Ref2647 ON Direcciones(calle_principal)
;
-- 
-- INDEX: Ref2648 
--

CREATE INDEX Ref2648 ON Direcciones(calle1)
;
-- 
-- INDEX: Ref2649 
--

CREATE INDEX Ref2649 ON Direcciones(calle2)
;
-- 
-- INDEX: Ref2552 
--

CREATE INDEX Ref2552 ON Empleados(direccion)
;
-- 
-- INDEX: Ref170 
--

CREATE INDEX Ref170 ON Lista_precios(producto_id)
;
-- 
-- INDEX: Ref1174 
--

CREATE INDEX Ref1174 ON Ordenes_de_pago_clientes(factura_id)
;
-- 
-- INDEX: Ref3277 
--

CREATE INDEX Ref3277 ON Ordenes_de_pago_clientes(pc_id)
;
-- 
-- INDEX: Ref844 
--

CREATE INDEX Ref844 ON Ordenes_de_pago_proveedores(factura_id)
;
-- 
-- INDEX: Ref3380 
--

CREATE INDEX Ref3380 ON Ordenes_de_pago_proveedores(pp_id)
;
-- 
-- INDEX: Ref375 
--

CREATE INDEX Ref375 ON Pago_cliente(cliente)
;
-- 
-- INDEX: Ref982 
--

CREATE INDEX Ref982 ON pago_proveedor(proveedor)
;
-- 
-- INDEX: Ref1831 
--

CREATE INDEX Ref1831 ON Productos(linea)
;
-- 
-- INDEX: Ref1932 
--

CREATE INDEX Ref1932 ON Productos(marca)
;
-- 
-- INDEX: Ref263 
--

CREATE INDEX Ref263 ON Productos(iva_impuesto)
;
-- 
-- INDEX: Ref2550 
--

CREATE INDEX Ref2550 ON Proveedores(direccion)
;
-- 
-- INDEX: Ref53 
--

CREATE INDEX Ref53 ON Proveedores(categoria)
;
-- 
-- INDEX: Ref767 
--

CREATE INDEX Ref767 ON Stocks(depositos_id)
;
-- 
-- INDEX: Ref168 
--

CREATE INDEX Ref168 ON Stocks(producto_id)
;
-- 
-- INDEX: Ref1741 
--

CREATE INDEX Ref1741 ON Transferencia_detalles(transferencia_id)
;
-- 
-- INDEX: Ref169 
--

CREATE INDEX Ref169 ON Transferencia_detalles(producto_id)
;
-- 
-- INDEX: Ref1026 
--

CREATE INDEX Ref1026 ON Transferencias(autorizado_empleado)
;
-- 
-- INDEX: Ref727 
--

CREATE INDEX Ref727 ON Transferencias(deposito_origen)
;
-- 
-- INDEX: Ref728 
--

CREATE INDEX Ref728 ON Transferencias(deposito_destino)
;
-- 
-- INDEX: Ref1139 
--

CREATE INDEX Ref1139 ON Venta_detalles(venta_id)
;
-- 
-- INDEX: Ref171 
--

CREATE INDEX Ref171 ON Venta_detalles(producto_id)
;
-- 
-- INDEX: Ref312 
--

CREATE INDEX Ref312 ON Venta_facturas(cliente)
;
-- 
-- INDEX: Ref714 
--

CREATE INDEX Ref714 ON Venta_facturas(deposito_egreso)
;
-- 
-- INDEX: Ref417 
--

CREATE INDEX Ref417 ON Venta_facturas(condicion)
;
-- 
-- TABLE: Clientes 
--

ALTER TABLE Clientes ADD CONSTRAINT RefDirecciones53 
    FOREIGN KEY (direccion)
    REFERENCES Direcciones(id)
;

ALTER TABLE Clientes ADD CONSTRAINT RefCategorias2 
    FOREIGN KEY (categoria)
    REFERENCES Categorias(id)
;


-- 
-- TABLE: Compra_detalles 
--

ALTER TABLE Compra_detalles ADD CONSTRAINT RefCompra_facturas38 
    FOREIGN KEY (compra_id)
    REFERENCES Compra_facturas(id)
;

ALTER TABLE Compra_detalles ADD CONSTRAINT RefProductos66 
    FOREIGN KEY (producto_id)
    REFERENCES Productos(id)
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

ALTER TABLE Detalles_orden_de_pago_clientes ADD CONSTRAINT RefPago_cliente78 
    FOREIGN KEY (pc_id)
    REFERENCES Pago_cliente(id)
;


-- 
-- TABLE: Detalles_orden_de_pago_proveedores 
--

ALTER TABLE Detalles_orden_de_pago_proveedores ADD CONSTRAINT RefOrdenes_de_pago_proveedores45 
    FOREIGN KEY (orden_pago_id)
    REFERENCES Ordenes_de_pago_proveedores(id)
;

ALTER TABLE Detalles_orden_de_pago_proveedores ADD CONSTRAINT Refpago_proveedor81 
    FOREIGN KEY (pp_id)
    REFERENCES pago_proveedor(id)
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

ALTER TABLE Ordenes_de_pago_clientes ADD CONSTRAINT RefPago_cliente77 
    FOREIGN KEY (pc_id)
    REFERENCES Pago_cliente(id)
;


-- 
-- TABLE: Ordenes_de_pago_proveedores 
--

ALTER TABLE Ordenes_de_pago_proveedores ADD CONSTRAINT RefCompra_facturas44 
    FOREIGN KEY (factura_id)
    REFERENCES Compra_facturas(id)
;

ALTER TABLE Ordenes_de_pago_proveedores ADD CONSTRAINT Refpago_proveedor80 
    FOREIGN KEY (pp_id)
    REFERENCES pago_proveedor(id)
;


-- 
-- TABLE: Pago_cliente 
--

ALTER TABLE Pago_cliente ADD CONSTRAINT RefClientes75 
    FOREIGN KEY (cliente)
    REFERENCES Clientes(id)
;


-- 
-- TABLE: pago_proveedor 
--

ALTER TABLE pago_proveedor ADD CONSTRAINT RefProveedores82 
    FOREIGN KEY (proveedor)
    REFERENCES Proveedores(id)
;


-- 
-- TABLE: Productos 
--

ALTER TABLE Productos ADD CONSTRAINT RefLineas_productos31 
    FOREIGN KEY (linea)
    REFERENCES Lineas_productos(id)
;

ALTER TABLE Productos ADD CONSTRAINT RefMarcas_productos32 
    FOREIGN KEY (marca)
    REFERENCES Marcas_productos(id)
;

ALTER TABLE Productos ADD CONSTRAINT RefImpuestos63 
    FOREIGN KEY (iva_impuesto)
    REFERENCES Impuestos(id)
;


-- 
-- TABLE: Proveedores 
--

ALTER TABLE Proveedores ADD CONSTRAINT RefDirecciones50 
    FOREIGN KEY (direccion)
    REFERENCES Direcciones(id)
;

ALTER TABLE Proveedores ADD CONSTRAINT RefCategorias3 
    FOREIGN KEY (categoria)
    REFERENCES Categorias(id)
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

ALTER TABLE Transferencia_detalles ADD CONSTRAINT RefTransferencias41 
    FOREIGN KEY (transferencia_id)
    REFERENCES Transferencias(id)
;

ALTER TABLE Transferencia_detalles ADD CONSTRAINT RefProductos69 
    FOREIGN KEY (producto_id)
    REFERENCES Productos(id)
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

ALTER TABLE Venta_detalles ADD CONSTRAINT RefVenta_facturas39 
    FOREIGN KEY (venta_id)
    REFERENCES Venta_facturas(id)
;

ALTER TABLE Venta_detalles ADD CONSTRAINT RefProductos71 
    FOREIGN KEY (producto_id)
    REFERENCES Productos(id)
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


