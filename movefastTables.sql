-- ========= Tabla Cliente =========
-- Almacena la información de los clientes que alquilan vehículos.
CREATE TABLE cliente (
  cliente_id SERIAL PRIMARY KEY, -- Identificador único manual para cada cliente. -- NOTA: Considerar SERIAL para autoincremento.
  nombre VARCHAR(50) NOT NULL, -- Nombre completo del cliente, obligatorio.
  telefono VARCHAR(20) UNIQUE NOT NULL, -- Teléfono del cliente, debe ser único y es obligatorio.
  email VARCHAR(30) UNIQUE NOT NULL -- Email del cliente, debe ser único y obligatorio. -- NOTA: VARCHAR(30) podría ser corto. Considerar VARCHAR(255).
  -- Falta la coma eliminada aquí
);

-- ========= Tabla Sucursal =========
-- Almacena información sobre las diferentes sucursales de la empresa.
CREATE TABLE sucursal (
  sucursal_id SERIAL PRIMARY KEY, -- Identificador único autoincremental para la sucursal (PostgreSQL).
  sucursal_name VARCHAR(120), -- Nombre de la sucursal. -- NOTA: Prefijo redundante. Considerar 'nombre NOT NULL'.
  sucursal_ciudad VARCHAR(120), -- Ciudad de la sucursal. -- NOTA: Prefijo redundante. Considerar 'ciudad NOT NULL'. VARCHAR(30) podría ser corto.
  direccion VARCHAR(255) UNIQUE NOT NULL,
  telefono VARCHAR(20) -- Teléfono de la sucursal (opcional).
);

-- ========= Tabla Vehiculo =========
-- Almacena la información detallada de cada vehículo.
CREATE TABLE vehiculo (
  vehiculo_id SERIAL PRIMARY KEY, -- Identificador único manual para el vehículo. -- NOTA: Considerar SERIAL.
  vin VARCHAR(30) UNIQUE NOT NULL, -- VIN (Número de Identificación Vehicular), único y obligatorio.
  sucursal_id INT NOT NULL,

  placa VARCHAR(10) UNIQUE, -- Placa/Matrícula del vehículo, única si se especifica.
  anio INT NOT NULL CHECK (anio BETWEEN 1950 AND 2025), -- Año de fabricación, obligatorio y dentro del rango 1950-2025.
  modelo VARCHAR(50) NOT NULL,
  marca VARCHAR(50) NOT NULL, 
  estado_vehiculo VARCHAR(20) NOT NULL
  DEFAULT 'Disponible' -- Valor por defecto si no se especifica.
  CHECK (estado_vehiculo IN ( -- Restringe los posibles valores del estado.
  'Disponible',
  'Alquilado',
  'Mantenimiento',
  'Limpieza',
  'Fuera de Servicio'
  )), 

  -- Definición de la Llave Foránea para sucursal_id
  FOREIGN KEY(sucursal_id) REFERENCES sucursal(sucursal_id)
  ON UPDATE CASCADE -- Si el ID de la sucursal cambia en la tabla 'sucursal', se actualiza aquí automáticamente.
);

-- ========= Tabla Alquiler =========
-- Registra cada transacción de alquiler de un vehículo por un cliente.
CREATE TABLE alquiler (
  alquiler_id SERIAL PRIMARY KEY, -- Identificador único autoincremental para el alquiler.
  cliente_id INT NOT NULL, -- ID del cliente que alquila (FK a cliente).
  vehiculo_id INT NOT NULL, -- ID del vehículo alquilado (FK a vehiculo).
  estado_alquiler VARCHAR(20) NOT NULL
  CHECK (estado_alquiler IN ( -- Restringe los posibles estados del alquiler.
  'Activo',
  'Completado',
  'Cancelado',
  'Reservado' 
  )),
  fecha_inicio TIMESTAMP NOT NULL, 
  fecha_fin TIMESTAMP NOT NULL, 
  costo_estimado DECIMAL(10, 2),

  FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id) ON DELETE CASCADE,
  FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(vehiculo_id) 
);

CREATE TABLE Pago (
  PagoID SERIAL PRIMARY KEY, 
  alquiler_id INT NOT NULL,
  monto DECIMAL(12, 2) NOT NULL,
  fecha_pago TIMESTAMP NOT NULL, 
  FOREIGN KEY (alquiler_id) REFERENCES alquiler(alquiler_id)
);