----Listado de Consultas SQL----

--Obtener los vehículos disponibles en una ciudad específica.
SELECT
    v.vehiculo_id,
    v.marca,
    v.modelo,
    v.anio,
    v.placa,
    s.sucursal_name,
    s.sucursal_ciudad
FROM
    vehiculo v
JOIN
    sucursal s ON v.sucursal_id = s.sucursal_id
WHERE
    v.estado_vehiculo = 'Disponible'
AND
    s.sucursal_ciudad = 'Cali'; 

--Listar los alquileres activos con información del cliente y vehículo.
SELECT
    a.alquiler_id,
    a.fecha_inicio,
    a.fecha_fin,
    a.costo_estimado,
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.telefono AS telefono_cliente,
    c.email AS email_cliente,
    v.vehiculo_id,
    v.marca AS marca_vehiculo,
    v.modelo AS modelo_vehiculo,
    v.placa AS placa_vehiculo
FROM
    alquiler a
JOIN
    cliente c ON a.cliente_id = c.cliente_id
JOIN
    vehiculo v ON a.vehiculo_id = v.vehiculo_id
WHERE
    a.estado_alquiler = 'Activo';

--Calcular los ingresos totales por sucursal considerando solo vehículos con más de 3 alquileres.--
WITH VehiculosFrecuentes AS (
    SELECT
        vehiculo_id
    FROM
        alquiler
    GROUP BY
        vehiculo_id
    HAVING
        COUNT(alquiler_id) > 3 -- Vehículos con más de 3 alquileres
),
PagosVehiculosFrecuentes AS (
    SELECT
        a.alquiler_id,
        p.monto,
        v.sucursal_id
    FROM
        Pago p
    JOIN
        alquiler a ON p.alquiler_id = a.alquiler_id
    JOIN
        vehiculo v ON a.vehiculo_id = v.vehiculo_id
    WHERE
        a.vehiculo_id IN (SELECT vehiculo_id FROM VehiculosFrecuentes) -- Filtrar por vehículos frecuentes
)
SELECT
    s.sucursal_id,
    s.sucursal_name,
    s.sucursal_ciudad,
    COALESCE(SUM(pvf.monto), 0) AS ingresos_totales -- Usar COALESCE por si una sucursal no tiene ingresos de estos vehículos
FROM
    sucursal s
LEFT JOIN
    PagosVehiculosFrecuentes pvf ON s.sucursal_id = pvf.sucursal_id
GROUP BY
    s.sucursal_id, s.sucursal_name, s.sucursal_ciudad
ORDER BY
    s.sucursal_id;

--Filtrar solo vehículos con más de 5 alquileres (usar subconsulta)
SELECT
    v.vehiculo_id,
    v.marca,
    v.modelo,
    v.placa,
    v.anio,
    (SELECT COUNT(*) FROM alquiler a WHERE a.vehiculo_id = v.vehiculo_id) AS numero_alquileres -- Opcional: muestra el conteo
FROM
    vehiculo v
WHERE
    v.vehiculo_id IN (
        -- Subconsulta: Obtiene los ID de vehículos con más de 5 alquileres
        SELECT
            a.vehiculo_id
        FROM
            alquiler a
        GROUP BY
            a.vehiculo_id
        HAVING
            COUNT(a.alquiler_id) > 5
    );

--Sumar los montos de todos los pagos asociados

SELECT
    SUM(monto) AS total_ingresos_pagos
FROM
    Pago;