--
-- ER/Studio 7.5 SQL Code Generation
-- Company :      Microsoft
-- Project :      ProyectoDB.dm1
-- Author :       Microsoft
--
-- Date Created : Sunday, April 28, 2013 16:15:35
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Categorias 
--
CREATE DATABASE grupo_1;
USE grupo_1;

CREATE TABLE Categorias(
    id               DECIMAL(1, 0)     NOT NULL,
    nombre           VARCHAR(18)       NOT NULL,
    linea_credito    DECIMAL(10, 0)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Cliente 
--

CREATE TABLE Cliente(
    id                   DECIMAL(10, 0)    NOT NULL,
    nombre               VARCHAR(100)      NOT NULL,
    direccion            VARCHAR(100)      NOT NULL,
    telefono             VARCHAR(100)      NOT NULL,
    contacto             VARCHAR(100)      NOT NULL,
    mail                 VARCHAR(100)      NOT NULL,
    categoria_cliente    DECIMAL(1, 0),
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Compra_detalles 
--

CREATE TABLE Compra_detalles(
    id             DECIMAL(10, 0)    NOT NULL,
    cantidad       DECIMAL(6, 0)     NOT NULL,
    producto_id    DECIMAL(10, 0),
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Compra_facturas 
--

CREATE TABLE Compra_facturas(
    id                   DECIMAL(10, 0)    NOT NULL,
    fecha_emision        DATE              NOT NULL,
    fecha_vencimiento    DATE              NOT NULL,
    proveedor            DECIMAL(10, 0),
    condicion            DECIMAL(1, 0),
    deposito_ingreso     DECIMAL(10, 0),
    compra_id            DECIMAL(10, 0),
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Condiciones 
--

CREATE TABLE Condiciones(
    id        DECIMAL(1, 0)    NOT NULL,
    nombre    VARCHAR(100)     NOT NULL,
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Depositos 
--

CREATE TABLE Depositos(
    id           DECIMAL(10, 0)    NOT NULL,
    direccion    VARCHAR(100)      NOT NULL,
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Empleados 
--

CREATE TABLE Empleados(
    id           DECIMAL(10, 0)    NOT NULL,
    nombre       VARCHAR(100)      NOT NULL,
    direccion    VARCHAR(100)      NOT NULL,
    telefono     VARCHAR(100)      NOT NULL,
    mail         VARCHAR(100)      NOT NULL,
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Impuestos 
--

CREATE TABLE Impuestos(
    id            DECIMAL(2, 0)    NOT NULL,
    nombre        CHAR(10),
    porcentaje    DECIMAL(5, 2)    NOT NULL,
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Productos 
--

CREATE TABLE Productos(
    id                 DECIMAL(10, 0)    NOT NULL,
    codigo_de_barra    DECIMAL(13, 0)    NOT NULL,
    descripcion        VARCHAR(100),
    ultimo_costo       DECIMAL(10, 0)    NOT NULL,
    marca              CHAR(100)         NOT NULL,
    linea              CHAR(100)         NOT NULL,
    impuesto_id        DECIMAL(2, 0),
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Proveedores 
--

CREATE TABLE Proveedores(
    id                     DECIMAL(10, 0)    NOT NULL,
    nombre                 VARCHAR(100)      NOT NULL,
    direccion              VARCHAR(100)      NOT NULL,
    telefono               VARCHAR(100)      NOT NULL,
    contacto               VARCHAR(100)      NOT NULL,
    mail                   VARCHAR(100)      NOT NULL,
    categoria_proveedor    DECIMAL(1, 0),
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Transferencias 
--

CREATE TABLE Transferencias(
    id                     DECIMAL(10, 0)    NOT NULL,
    encargado_translado    VARCHAR(100)      NOT NULL,
    cantidad               DECIMAL(10, 0)    NOT NULL,
    autorizado_empleado    DECIMAL(10, 0),
    deposito_origen        DECIMAL(10, 0),
    deposito_destino       DECIMAL(10, 0),
    producto               DECIMAL(10, 0),
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Venta_detalles 
--

CREATE TABLE Venta_detalles(
    id             DECIMAL(10, 0)    NOT NULL,
    cantidad       DECIMAL(6, 0)     NOT NULL,
    producto_id    DECIMAL(10, 0),
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Venta_facturas 
--

CREATE TABLE Venta_facturas(
    id                   DECIMAL(10, 0)    NOT NULL,
    fecha_emision        DATE              NOT NULL,
    fecha_vencimiento    DATE              NOT NULL,
    cliente              DECIMAL(10, 0),
    condicion            DECIMAL(1, 0),
    deposito_egreso      DECIMAL(10, 0),
    venta_id             DECIMAL(10, 0),
    PRIMARY KEY (id)
)ENGINE=INNODB
;



-- 
-- TABLE: Cliente 
--

ALTER TABLE Cliente ADD CONSTRAINT RefCategorias2 
    FOREIGN KEY (categoria_cliente)
    REFERENCES Categorias(id)
;


-- 
-- TABLE: Compra_detalles 
--

ALTER TABLE Compra_detalles ADD CONSTRAINT RefProductos21 
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

ALTER TABLE Compra_facturas ADD CONSTRAINT RefCompra_detalles23 
    FOREIGN KEY (compra_id)
    REFERENCES Compra_detalles(id)
;


-- 
-- TABLE: Productos 
--

ALTER TABLE Productos ADD CONSTRAINT RefImpuestos1 
    FOREIGN KEY (impuesto_id)
    REFERENCES Impuestos(id)
;


-- 
-- TABLE: Proveedores 
--

ALTER TABLE Proveedores ADD CONSTRAINT RefCategorias3 
    FOREIGN KEY (categoria_proveedor)
    REFERENCES Categorias(id)
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

ALTER TABLE Transferencias ADD CONSTRAINT RefProductos29 
    FOREIGN KEY (producto)
    REFERENCES Productos(id)
;


-- 
-- TABLE: Venta_detalles 
--

ALTER TABLE Venta_detalles ADD CONSTRAINT RefProductos24 
    FOREIGN KEY (producto_id)
    REFERENCES Productos(id)
;


-- 
-- TABLE: Venta_facturas 
--

ALTER TABLE Venta_facturas ADD CONSTRAINT RefCliente12 
    FOREIGN KEY (cliente)
    REFERENCES Cliente(id)
;

ALTER TABLE Venta_facturas ADD CONSTRAINT RefDepositos14 
    FOREIGN KEY (deposito_egreso)
    REFERENCES Depositos(id)
;

ALTER TABLE Venta_facturas ADD CONSTRAINT RefCondiciones17 
    FOREIGN KEY (condicion)
    REFERENCES Condiciones(id)
;

ALTER TABLE Venta_facturas ADD CONSTRAINT RefVenta_detalles25 
    FOREIGN KEY (venta_id)
    REFERENCES Venta_detalles(id)
;


