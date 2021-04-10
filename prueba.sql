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
cliente_id INT NOT NULL,
PRIMARY KEY (numero_fac),
FOREIGN KEY (cliente_id) REFERENCES
clientes(id));

CREATE TABLE detalle_facturas(
id SERIAL,
subtotal INT NOT NULL,
iva FLOAT NOT NULL,
precio_total FLOAT NOT NULL,
factura_numero INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (factura_numero) REFERENCES
facturas(numero_fac));

CREATE TABLE categorias(
id SERIAL,
nombre_cat VARCHAR(30) NOT NULL,
descripcion_cat VARCHAR(100),
PRIMARY KEY (id));

CREATE TABLE productos(
id SERIAL,
nombre_prod VARCHAR(30) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
valor_unitario INT NOT NULL,
categoria_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES
categorias(id));

CREATE TABLE listado_productos(
id SERIAL,
producto_id INT NOT NULL,
precio_unitario INT NOT NULL,
cantidad INT NOT NULL,
total_prod INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (producto_id) REFERENCES
productos(id));

CREATE TABLE detallefacturas_listas(
detallefactura_id INT NOT NULL,
listaproduc_id INT NOT NULL,
FOREIGN KEY (detallefactura_id) REFERENCES
detalle_facturas(id),
FOREIGN KEY (listaproduc_id) REFERENCES
listado_productos(id));


-- Insertando registros

-- Clientes
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Maria Lopez', '13.545.232-8', 'Av. Kennedy, Vitacura');
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Edgardo Rodriguez', '17.834.212-1', 'San Francisco, Santiago');
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Daniela Ruffa', '25.893.291-5', 'Las Torres, Quilicura');
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Jesus Perez', '10.523.912-6', 'Irrarazaval, Ñuñoa');
INSERT INTO clientes (nombre, rut, direccion) VALUES ('Luis Vasquez', '15.383.423-K', 'Av. Las Condes, Las Condes');

-- Categorias
INSERT INTO categorias (nombre_cat, descripcion_cat) VALUES ('herramientas','todo para construcción');
INSERT INTO categorias (nombre_cat, descripcion_cat) VALUES ('redes','elementos para redes de comunicaciones');
INSERT INTO categorias (nombre_cat, descripcion_cat) VALUES ('seguridad','implementos de seguridad industrial');

-- Productos
INSERT INTO productos (nombre_prod, descripcion, valor_unitario, categoria_id) VALUES ('taladro', 'Taladro makita con percutor HP2070FX con maleta', '100', '1');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario, categoria_id) VALUES ('crimpeadora', 'Crimpeadora conector para rj45 y Rj-11 , tambien es un pelacable stanley', '20', '2');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario, categoria_id) VALUES ('alicate', 'Alicate de punta bahco 6"', '13', '1');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario, categoria_id) VALUES ('Modulo RJ-45', 'Categoría 6 Blanco Netkey Panduit', '4', '2');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario, categoria_id) VALUES ('martillo carpintero', 'Martillo de carpintero con mango en fibra de vidrio, para una mejor absorción de los golpes', '16', '1');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario, categoria_id) VALUES ('lentes de seguridad', '3M virtual oscuro', '2', '3');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario, categoria_id) VALUES ('arnes', 'Arnés de seguridad 3 argollas', '12', '3');
INSERT INTO productos (nombre_prod, descripcion, valor_unitario, categoria_id) VALUES ('cable utp', 'Cat 5e Netkey Panduit', '90', '2');

-- Facturas

-- 2 para el cliente 1, con 2 y 3 productos

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('1', '06-02-2020', '1');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('6', '2', '1', '2');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('7', '12', '1', '12');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('14','2.66','16.66', '1');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('1','1');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('1','2');

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('2', '13-03-2020', '1');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('4', '4', '2', '8');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('2', '20', '1', '20');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('28', '5.32', '33.32', '2');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('2','3');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('2','4');

-- 3 para el cliente 2, con 3, 2 y 3 productos

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('3', '20-03-2020', '2');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('1', '100', '1', '100');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('3', '13', '1', '13');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('5', '16', '1', '16');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('129', '24.51', '153.51','3');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('3','5');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('3','6');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('3','7');

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('4', '05-04-2020', '2');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('6', '2', '2', '4');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('4', '0.76', '4.76', '4');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('4','8');

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('5', '01-05-2020', '2');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('4', '4', '3', '12');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('12', '2.28', '14.28', '5');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('5','9');

-- 1 para el cliente 3, con 1 producto

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('6', '15-06-2020', '3');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('8', '90', '1', '90');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('90', '17.1', '107.1', '6');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('6','10');

-- 4 para el cliente 4, con 2, 3, 4 y 1 producto

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('7', '04-07-2020', '4');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('7', '12', '2', '24');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('24', '4.56', '28.56', '7');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('7','11');

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('8', '15-08-2020', '4');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('6', '2', '3', '6');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('6', '1.14', '7.14', '8');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('8','12');

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('9', '05-09-2020', '4');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('4', '4', '4', '16');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('16', '3.04', '19.04', '9');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('9','13');

INSERT INTO facturas (numero_fac, fecha, cliente_id) VALUES ('10', '10-10-2020', '4');
INSERT INTO listado_productos (producto_id, precio_unitario, cantidad, total_prod) VALUES ('1', '100', '1', '100');
INSERT INTO detalle_facturas (subtotal, iva, precio_total, factura_numero) VALUES ('100', '19', '119', '10');
INSERT INTO detallefacturas_listas (detallefactura_id, listaproduc_id) VALUES ('10','14');


-- Consultas

-- ¿Que cliente realizó la compra más cara?

SELECT nombre FROM clientes INNER JOIN facturas ON clientes.id=facturas.cliente_id INNER JOIN detalle_facturas ON facturas.numero_fac=detalle_facturas.factura_numero ORDER BY detalle_facturas.precio_total DESC LIMIT 1;

-- ¿Que cliente pagó sobre 100 de monto?

SELECT nombre FROM clientes INNER JOIN facturas ON clientes.id=facturas.cliente_id INNER JOIN detalle_facturas ON facturas.numero_fac=detalle_facturas.factura_numero WHERE detalle_facturas.precio_total>100;

-- ¿Cuantos clientes han comprado el producto 6.

SELECT COUNT(cliente_id) AS clientes_compraron_prod6 FROM facturas
INNER JOIN detalle_facturas ON facturas.numero_fac=detalle_facturas.factura_numero 
INNER JOIN detallefacturas_listas ON detalle_facturas.id=detallefacturas_listas.detallefactura_id
INNER JOIN listado_productos ON detallefacturas_listas.listaproduc_id=listado_productos.id
WHERE listado_productos.producto_id=6;