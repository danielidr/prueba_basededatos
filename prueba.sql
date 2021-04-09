-- Creando base de datos

CREATE DATABASE prueba;
\c prueba

-- Creando tablas

CREATE TABLE clientes(
id SERIAL,
nombre VARCHAR(30) NOT NULL,
rut VARCHAR(12) NOT NULL,
direccion VARCHAR(60) NOT NULL,
PRIMARY KEY (id));

CREATE TABLE facturas(
numero_fac INT NOT NULL UNIQUE,
fecha DATE NOT NULL,
subtotal INT NOT NULL,
iva FLOAT NOT NULL,
precio_total INT NOT NULL,
PRIMARY KEY (numero_fac));

CREATE TABLE clientes_facturas(
cliente_id INT NOT NULL,
factura_num INT NOT NULL,
FOREIGN KEY (cliente_id) REFERENCES
clientes(id),
FOREIGN KEY (factura_num) REFERENCES
facturas(numero_fac));

CREATE TABLE productos(
id SERIAL,
nombre_prod VARCHAR(30) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
valor_unitario INT NOT NULL,
PRIMARY KEY (id));

CREATE TABLE categorias(
id SERIAL,
nombre_cat VARCHAR(30) NOT NULL,
descripcion_cat VARCHAR(100),
PRIMARY KEY (id));

CREATE TABLE productos_categorias(
producto_id INT NOT NULL,
categoria_id INT NOT NULL,
FOREIGN KEY (producto_id) REFERENCES
productos(id),
FOREIGN KEY (categoria_id) REFERENCES
categorias(id));

CREATE TABLE listado_productos(
id SERIAL,
precio_unitario INT NOT NULL,
cantidad INT NOT NULL,
valor_total INT NOT NULL,
PRIMARY KEY (id));

CREATE TABLE facturas_productos_listas(
factura_num INT NOT NULL,
producto_id INT NOT NULL,
listaproductos_id INT NOT NULL,
FOREIGN KEY (factura_num) REFERENCES
facturas(numero_fac),
FOREIGN KEY (producto_id) REFERENCES
productos(id),
FOREIGN KEY (listaproductos_id) REFERENCES
listado_productos(id));

-- Insertando registros

-- Clientes
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Maria Lopez', '13.545.232-8', 'Av. Kennedy, Vitacura');
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Edgardo Rodriguez', '17.834.212-1', 'San Francisco, Santiago');
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Daniela Ruffa', '25.893.291-5', 'Las Torres, Quilicura');
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Jesus Perez', '10.523.912-6', 'Irrarazaval, Ñuñoa');
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Luis Vasquez', '15.383.423-K', 'Av. Las Condes, Las Condes');

-- Productos
INSERT INTO productos (nombre_prod, descripcion, valor_unitario) VALUES ('taladro', 'Taladro makita con percutor HP2070FX con maleta', '100');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario) VALUES ('crimpeadora', 'Crimpeadora conector para rj45 y Rj-11 , tambien es un pelacable stanley', '20');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario) VALUES ('alicate', 'Alicate de punta bahco 6"', '13');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario) VALUES ('Modulo RJ-45', 'Categoría 6 Blanco Netkey Panduit', '4');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario) VALUES ('martillo carpintero', 'Martillo de carpintero con mango en fibra de vidrio, para una mejor absorción de los golpes', '16');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario) VALUES ('lentes de seguridad', '3M virtual oscuro', '2');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario) VALUES ('arnes', 'Arnés de seguridad 3 argollas', '12');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario) VALUES ('cable utp', 'Cat 5e Netkey Panduit', '90');

-- Categorias
INSERT INTO categorias (nombre_cat, descripcion_cat) VALUES ('herramientas','todo para construcción');
INSERT INTO categorias (nombre_cat, descripcion_cat) VALUES ('redes','elementos para redes de comunicaciones');
INSERT INTO categorias (nombre_cat, descripcion_cat) VALUES ('seguridad','implementos de seguridad industrial');

