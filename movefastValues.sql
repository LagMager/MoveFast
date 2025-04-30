INSERT INTO cliente (nombre, telefono, email) VALUES
('Carlos Rodriguez', '3101112233', 'carlos.r@email.com'),
('Maria Fernanda Lopez', '3112223344', 'maria.f.lopez@email.com'),
('Javier Gutierrez', '3123334455', 'javier.g@email.com'),
('Sofia Hernandez', '3134445566', 'sofia.h@email.com'),
('Andres Morales', '3145556677', 'andres.m@email.com'),
('Valentina Diaz', '3156667788', 'valentina.d@email.com'),
('Diego Rojas', '3167778899', 'diego.r@email.com'),
('Camila Silva', '3178889900', 'camila.s@email.com'),
('Ricardo Perez', '3189990011', 'ricardo.p@email.com'),
('Isabella Vargas', '3190001122', 'isabella.v@email.com');

INSERT INTO sucursal (sucursal_name, sucursal_ciudad, direccion, telefono) VALUES
('Sucursal Principal Cali', 'Cali', 'Avenida Siempre Viva 123, Cali', '6021112233'),
('Sucursal Norte Bogotá', 'Bogotá', 'Calle 100 # 20-30, Bogotá', '6012223344'),
('Sucursal El Poblado Medellín', 'Medellín', 'Carrera 43A # 7-50, Medellín', '6043334455'),
('Sucursal Bocagrande Cartagena', 'Cartagena', 'Calle 5 # 3-10, Cartagena', NULL), -- Telefono opcional
('Sucursal Centro Barranquilla', 'Barranquilla', 'Carrera 50 # 80-45, Barranquilla', '6055556677'),
('Sucursal Aeropuerto Cali', 'Palmira', 'Aeropuerto Alfonso Bonilla Aragón, Palmira', '6028889900'),
('Sucursal Chapinero Bogotá', 'Bogotá', 'Carrera 7 # 60-15, Bogotá', '6019990011'),
('Sucursal Sur Cali', 'Cali', 'Calle 5 # 80-90, Cali', '6022221100'),
('Sucursal Laureles Medellín', 'Medellín', 'Avenida Nutibara # 70-25, Medellín', NULL), -- Telefono opcional
('Sucursal Pereira Centro', 'Pereira', 'Calle 19 # 8-30, Pereira', '6064445566');

INSERT INTO vehiculo (vin, sucursal_id, placa, anio, modelo, marca, estado_vehiculo) VALUES
('VIN0000000000000001', 1, 'HKL123', 2023, 'Picanto', 'Kia', 'Disponible'),
('VIN0000000000000002', 2, 'JKL456', 2022, 'Onix', 'Chevrolet', 'Alquilado'),
('VIN0000000000000003', 3, 'MNP789', 2024, 'Duster', 'Renault', 'Disponible'),
('VIN0000000000000004', 1, 'QRS012', 2021, 'Mazda 2', 'Mazda', 'Mantenimiento'),
('VIN0000000000000005', 4, 'TUV345', 2023, 'Corolla', 'Toyota', 'Disponible'),
('VIN0000000000000006', 6, 'WXY678', 2022, 'Versa', 'Nissan', 'Limpieza'),
('VIN0000000000000007', 7, 'ZAB901', 2020, 'Swift', 'Suzuki', 'Fuera de Servicio'),
('VIN0000000000000008', 8, 'CDE234', 2024, 'Tracker', 'Chevrolet', 'Disponible'),
('VIN0000000000000009', 5, 'FGH567', 2023, 'Kwid', 'Renault', 'Alquilado'),
('VIN0000000000000010', 10, 'IJK890', 2022, 'Accent', 'Hyundai', 'Disponible')

INSERT INTO alquiler (cliente_id, vehiculo_id, estado_alquiler, fecha_inicio, fecha_fin, costo_estimado) VALUES
(1, 2, 'Activo', '2025-04-28 10:00:00', '2025-05-03 10:00:00', 450000.50),
(2, 3, 'Completado', '2025-04-15 09:30:00', '2025-04-20 17:00:00', 600000.00),
(3, 5, 'Reservado', '2025-05-05 14:00:00', '2025-05-10 14:00:00', 550000.75),
(4, 1, 'Completado', '2025-04-21 11:00:00', '2025-04-25 11:00:00', 300000.00),
(5, 8, 'Activo', '2025-04-29 08:00:00', '2025-05-06 08:00:00', 700000.00),
(6, 9, 'Activo', '2025-04-27 16:00:00', '2025-05-01 16:00:00', 280000.25),
(7, 10, 'Reservado', '2025-06-01 10:00:00', '2025-06-10 10:00:00', 480000.00),
(8, 1, 'Cancelado', '2025-04-20 12:00:00', '2025-04-22 12:00:00', 150000.00),
(9, 3, 'Completado', '2025-03-10 07:00:00', '2025-03-15 19:00:00', 580000.00),
(10, 5, 'Completado', '2025-04-01 15:00:00', '2025-04-08 15:00:00', 620000.50);

INSERT INTO Pago (alquiler_id, monto, fecha_pago) VALUES
(1, 200000.00, '2025-04-28 10:05:00'), 
(2, 600000.00, '2025-04-20 17:05:00'), 
(3, 100000.00, '2025-04-29 09:00:00'), 
(4, 300000.00, '2025-04-25 11:10:00'), 
(5, 350000.00, '2025-04-29 08:05:00'), 
(6, 280000.25, '2025-04-27 16:05:00'), 
(9, 580000.00, '2025-03-15 19:05:00'), 
(10, 620000.50, '2025-04-08 15:10:00'), 
(1, 250000.50, '2025-05-03 10:15:00'); 

----------VALORES NO VALIDOS------------------------

-- ========= Tabla Cliente =========

-- ERROR: Viola restriccion NOT NULL en 'nombre'
INSERT INTO cliente (nombre, telefono, email) VALUES
(NULL, '3201112233', 'fail.null.name@email.com');

-- ERROR: Viola restriccion UNIQUE en 'telefono' (usa un telefono existente'3101112233')
INSERT INTO cliente (nombre, telefono, email) VALUES
('Test Duplicado Telefono', '3101112233', 'fail.dup.phone@email.com');

-- ========= Tabla Sucursal =========

-- ERROR: Viola restriccion NOT NULL en 'direccion'
INSERT INTO sucursal (sucursal_name, sucursal_ciudad, direccion, telefono) VALUES
('Sucursal Sin Direccion', 'Ciudad Fantasma', NULL, '6001112233');

-- ERROR: Viola restriccion UNIQUE en 'direccion' (uses existing address 'Avenida Siempre Viva 123, Cali')
INSERT INTO sucursal (sucursal_name, sucursal_ciudad, direccion, telefono) VALUES
('Sucursal Direccion Duplicada', 'Cali', 'Avenida Siempre Viva 123, Cali', '6029998877');


-- ========= Tabla Vehiculo =========

-- ERROR: Viola restriccion CHECK en 'anio' (Anio 1949 is menor que 1950)
INSERT INTO vehiculo (vin, sucursal_id, placa, anio, modelo, marca, estado_vehiculo) VALUES
('FAILCHECKANIO12345', 7, 'FLN006', 1949, 'Model T', 'Ford', 'Mantenimiento');

-- ERROR: Viola restriccion CHECK en 'estado_vehiculo' (Estado Invalido 'Rentado')
INSERT INTO vehiculo (vin, sucursal_id, placa, anio, modelo, marca, estado_vehiculo) VALUES
('FAILCHECKESTADO123', 9, 'FLN008', 2022, 'Rio', 'Kia', 'Rentado');

-- ERROR: Viola restriccion FOREIGN KEY en 'sucursal_id' (Sucursal con ID 99 no existe)
INSERT INTO vehiculo (vin, sucursal_id, placa, anio, modelo, marca, estado_vehiculo) VALUES
('FAILFKSUCURSAL1234', 99, 'FLN009', 2023, 'CX-5', 'Mazda', 'Disponible');