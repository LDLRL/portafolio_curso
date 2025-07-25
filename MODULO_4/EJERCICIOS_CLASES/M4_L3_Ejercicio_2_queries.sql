-- CREACIÓN DE TABLAS

CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  correo VARCHAR(100),
  telefono VARCHAR(20)
);

CREATE TABLE productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  categoria VARCHAR(100),
  precio DECIMAL(10, 2)
);

CREATE TABLE pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  producto_id INT,
  fecha DATE,
  estado VARCHAR(50),
  cantidad INT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- INSERCIÓN DE DATOS

INSERT INTO clientes (nombre, correo, telefono) VALUES
('Juan Pérez', 'juan.perez@email.com', '987654321'),
('María López', 'maria.lopez@email.com', '912345678'),
('Carlos Núñez', 'carlos.nunez@email.com', '923456789');

INSERT INTO productos (nombre, categoria, precio) VALUES
('Notebook Lenovo', 'Tecnología', 850000),
('Celular Samsung', 'Tecnología', 650000),
('Silla Ergonómica', 'Oficina', 120000),
('Router TP-Link', 'Tecnología WiFi', 45000),
('Monitor LG 24"', 'Tecnología', 180000);

INSERT INTO pedidos (cliente_id, producto_id, fecha, estado, cantidad) VALUES
(1, 1, '2023-01-15', 'entregado', 1),
(1, 2, '2023-02-20', 'pendiente', 2),
(2, 3, '2023-03-10', 'entregado', 1),
(3, 4, '2022-12-05', 'entregado', 1),
(1, 5, '2023-05-22', 'entregado', 1),
(2, 1, '2023-07-01', 'entregado', 1),
(3, 2, '2023-08-12', 'cancelado', 1);

-- CONSULTA ORIGINAL (NO OPTIMIZADA)

SELECT *
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id
JOIN productos ON pedidos.producto_id = productos.id
WHERE UPPER(clientes.nombre) = 'JUAN PÉREZ'
  AND YEAR(pedidos.fecha) = 2023
  AND productos.categoria LIKE '%tecnología%'
  AND pedidos.estado = 'entregado';

-- CONSULTA OPTIMIZADA

SELECT pedidos.id, pedidos.fecha, pedidos.estado, pedidos.cantidad,
       clientes.nombre, productos.nombre AS producto, productos.categoria
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id
JOIN productos ON pedidos.producto_id = productos.id
WHERE clientes.nombre = 'Juan Pérez'
  AND pedidos.fecha BETWEEN '2023-01-01' AND '2023-12-31'
  AND productos.categoria LIKE '%Tecnología%'
  AND pedidos.estado = 'entregado';

-- CONSULTA EXPLAIN (ANÁLISIS DE PLAN DE EJECUCIÓN)

EXPLAIN SELECT pedidos.id, pedidos.fecha, pedidos.estado, pedidos.cantidad,
                clientes.nombre, productos.nombre AS producto, productos.categoria
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id
JOIN productos ON pedidos.producto_id = productos.id
WHERE clientes.nombre = 'Juan Pérez'
  AND pedidos.fecha BETWEEN '2023-01-01' AND '2023-12-31'
  AND productos.categoria LIKE '%Tecnología%'
  AND pedidos.estado = 'entregado';
