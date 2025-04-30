
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Apellido VARCHAR(45),
    Observaciones VARCHAR(45)
);

-- Tabla Mesero: Almacena información de los meseros.
CREATE TABLE Mesero (
    id_mesero INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Apellido1 VARCHAR(45),
    Apellido2 VARCHAR(45)
);

-- Tabla Platillo: Almacena información de los platillos ofrecidos.
CREATE TABLE Platillo (
    id_platillo INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Importe INT -- Asumiendo que 'Importe' es el precio o costo.
);

-- Tabla Bebida: Almacena información de las bebidas ofrecidas.
CREATE TABLE Bebida (
    id_bebida INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Importe INT -- Asumiendo que 'Importe' es el precio o costo.
);

-- Tabla Mesa: Almacena información de las mesas del restaurante.
CREATE TABLE Mesa (
    id_mesa INT PRIMARY KEY,
    num_Comensales INT, -- Número de comensales que soporta la mesa.
    Ubicacion VARCHAR(45) -- Descripción de la ubicación de la mesa.
);


-- Creación de Tabla Dependiente (con llaves foráneas)

-- Tabla Factura: Registra la información principal de la factura/orden.
-- Se relaciona con todas las demás tablas.
CREATE TABLE Factura (
    id_factura INT PRIMARY KEY,
    Fecha_factura DATE,       -- Fecha en que se generó la factura.
    id_cliente INT NOT NULL,  -- Referencia al cliente asociado a la factura.
    id_mesero INT NOT NULL,   -- Referencia al mesero que atendió.
    id_mesa INT NOT NULL,     -- Referencia a la mesa utilizada.
    id_platillo INT NOT NULL, -- Referencia al platillo principal de esta factura.
    id_bebida INT NOT NULL,   -- Referencia a la bebida principal de esta factura.

    -- Definición de las restricciones de Llave Foránea
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_mesero) REFERENCES Mesero(id_mesero),
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa),
    FOREIGN KEY (id_platillo) REFERENCES Platillo(id_platillo),
    FOREIGN KEY (id_bebida) REFERENCES Bebida(id_bebida)
);
