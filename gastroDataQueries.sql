-- ========= CONSULTAS SQL (Ejercicios 1-7) =========

-- 1. Obtener el nombre y apellido de los clientes que hayan consumido un platillo específico (Ej: 'Pescado Frito').
SELECT c.Nombre, c.Apellido
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
WHERE p.Nombre = 'Pescado Frito';

-- 2. Obtener el nombre y apellido de los clientes que hayan consumido 'Arroz a la Marinera'.
SELECT c.Nombre, c.Apellido
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
WHERE p.Nombre = 'Arroz a la Marinera';

-- 3. Listar el nombre del mesero y la fecha en la que atendió una mesa 10 que se encuentra ubicada en el segundo piso del restaurante.
SELECT m.Nombre AS NombreMesero, f.Fecha_factura
FROM Mesero m
JOIN Factura f ON m.id_mesero = f.id_mesero
JOIN Mesa me ON f.id_mesa = me.id_mesa
WHERE me.id_mesa = 10 AND me.Ubicacion = 'Segundo Piso';

-- 4. Mostrar el nombre de los clientes junto con los nombres de las bebidas que consumieron en sus facturas.
SELECT c.Nombre AS NombreCliente, c.Apellido, b.Nombre AS NombreBebida
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Bebida b ON f.id_bebida = b.id_bebida;

-- 5. Consultar todas las facturas que incluyan platillos con un importe mayor a $300000, incluyendo el nombre del cliente y del platillo.
SELECT f.id_factura, c.Nombre AS NombreCliente, c.Apellido, p.Nombre AS NombrePlatillo, p.Importe AS ImportePlatillo
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
WHERE p.Importe > 300000;

-- 6. Listar el total de consumo (importe de platillos y bebidas) del cliente llamado Manuel Pedroza Gonzalez.
SELECT SUM(p.Importe + b.Importe) AS TotalConsumo
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida
WHERE c.Nombre = 'Manuel' AND c.Apellido = 'Pedroza Gonzalez';

-- 7. Liste las mesas que han sido utilizadas al menos una vez, indicando su ubicación y el número de comensales.
SELECT DISTINCT me.id_mesa, me.Ubicacion, me.num_Comensales
FROM Mesa me
JOIN Factura f ON me.id_mesa = f.id_mesa;

-- ========= CREACIÓN DE VISTAS (Ejercicios 1-4) =========

-- 1. Cree una vista (VIEW) que presente del consumo de cada cliente (nombre, bebida, platillo, fecha y montos).
CREATE VIEW Vista_ConsumoCliente AS
SELECT
    c.Nombre AS ClienteNombre,
    c.Apellido AS ClienteApellido,
    b.Nombre AS NombreBebida,
    p.Nombre AS NombrePlatillo,
    f.Fecha_factura,
    p.Importe AS MontoPlatillo,
    b.Importe AS MontoBebida
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida;

-- 2. Cree una vista (VIEW) que presente el mesero, el numero de factura que atendió, la fecha y la mesa.
CREATE VIEW Vista_AtencionMesero AS
SELECT
    m.Nombre AS MeseroNombre,
    m.Apellido1 AS MeseroApellido1,
    m.Apellido2 AS MeseroApellido2,
    f.id_factura,
    f.Fecha_factura,
    f.id_mesa
FROM Mesero m
JOIN Factura f ON m.id_mesero = f.id_mesero;

-- 3. Cree una vista (VIEW) que el valor total de compra por cada cliente en todas sus facturas (platillo + bebida).
CREATE VIEW Vista_TotalPorCliente AS
SELECT
    c.id_cliente,
    c.Nombre,
    c.Apellido,
    SUM(p.Importe + b.Importe) AS ValorTotalComprado
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida
GROUP BY c.id_cliente, c.Nombre, c.Apellido;

-- 4. Conviera a vista las consultas 6 y 7 del anterior ejercicio.

-- Vista para la Consulta 6 (Total Consumo Manuel Pedroza Gonzalez)
CREATE VIEW Vista_ConsumoManuelPedroza AS
SELECT SUM(p.Importe + b.Importe) AS TotalConsumo
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida
WHERE c.Nombre = 'Manuel' AND c.Apellido = 'Pedroza Gonzalez';

-- Vista para la Consulta 7 (Mesas Utilizadas)
CREATE VIEW Vista_MesasUtilizadas AS
SELECT DISTINCT me.id_mesa, me.Ubicacion, me.num_Comensales
FROM Mesa me
JOIN Factura f ON me.id_mesa = f.id_mesa;