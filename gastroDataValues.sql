-- ========= INSERCIÓN DE DATOS =========

-- Insertar Clientes
INSERT INTO Cliente (id_cliente, Nombre, Apellido, Observaciones) VALUES
(1, 'Juan', 'Perez', 'Cliente frecuente'),
(2, 'Maria', 'Lopez', NULL),
(3, 'Manuel', 'Pedroza Gonzalez', 'VIP'), -- Cliente específico para consulta 6
(4, 'Ana', 'Garcia', 'Alergias: Mariscos');

-- Insertar Meseros
INSERT INTO Mesero (id_mesero, Nombre, Apellido1, Apellido2) VALUES
(101, 'Carlos', 'Gomez', 'Silva'), -- Mesero para consulta 3
(102, 'Ana', 'Martinez', 'Ruiz');

-- Insertar Mesas
INSERT INTO Mesa (id_mesa, num_Comensales, Ubicacion) VALUES
(5, 4, 'Primer Piso'),
(10, 6, 'Segundo Piso'), -- Mesa específica para consulta 3 y 7
(15, 2, 'Terraza'),      -- Mesa no usada (para probar consulta 7)
(20, 4, 'Primer Piso'); -- Mesa usada

-- Insertar Platillos
INSERT INTO Platillo (id_platillo, Nombre, Importe) VALUES
(201, 'Pescado Frito', 25000),          -- Platillo específico para consulta 1
(202, 'Arroz a la Marinera', 35000),    -- Platillo específico para consulta 2
(203, 'Lomo Saltado', 28000),
(204, 'Bandeja Paisa Super', 350000); -- Platillo para consulta 5 (>300k)

-- Insertar Bebidas
INSERT INTO Bebida (id_bebida, Nombre, Importe) VALUES
(301, 'Jugo de Naranja', 5000),
(302, 'Limonada', 4000),
(303, 'Gaseosa', 3000),
(304, 'Agua con Gas', 2500);

-- Insertar Facturas (vinculando los datos anteriores)
-- Usamos fechas distintas para que tengan sentido
INSERT INTO Factura (id_factura, Fecha_factura, id_cliente, id_mesero, id_mesa, id_platillo, id_bebida) VALUES
(1001, '2025-04-20', 1, 101, 5, 201, 301), -- Juan pide Pescado Frito (Q1), Mesa 5 (Q7)
(1002, '2025-04-21', 2, 102, 20, 202, 302), -- Maria pide Arroz a la Marinera (Q2), Mesa 20 (Q7)
(1003, '2025-04-22', 1, 101, 10, 203, 303), -- Juan, atendido por Carlos en Mesa 10 (Q3), Mesa 10 (Q7)
(1004, '2025-04-23', 3, 102, 5, 204, 301), -- Manuel pide Bandeja > 300k (Q5, Q6), Mesa 5 (Q7)
(1005, '2025-04-24', 3, 101, 10, 201, 302), -- Manuel pide Pescado Frito (Q1, Q6), atendido por Carlos en Mesa 10 (Q3), Mesa 10 (Q7)
(1006, '2025-04-25', 4, 102, 20, 203, 304); -- Ana, Mesa 20 (Q7)

-- ========= FIN INSERCIÓN DE DATOS =========