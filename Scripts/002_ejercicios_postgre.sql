
-- Recupera todos los clientes (name y email) ordenados alfabéticamente por nombre.

SELECT name
     , email
  FROM customer
 ORDER BY email ASC

-- Encuentra el número total de reservas.

SELECT COUNT(*) AS total_reservas
  FROM reservation

-- Muestra los detalles de las reservas (reservation_id, start_date, end_date) para un cliente específico (puedes elegir el customer_id).

SELECT reservation_id
     , start_date
     , end_date
  FROM reservation
 WHERE customer_id = 5

-- Encuentra el nombre y apellido de los propietarios que tienen apartamentos.

SELECT DISTINCT owner.name
     , owner.surname
  FROM owner
  JOIN apartment
    ON owner.owner_id = apartment.owner_id

-- Recupera el nombre y la ubicación de los apartamentos propiedad de un propietario específico (puedes elegir el owner_id).

SELECT owner.name
     , owner.surname
     , apartment.location
  FROM owner
  JOIN apartment
    ON owner.owner_id = apartment.owner_id
 WHERE owner.owner_id = 7

-- Muestra las comodidades asociadas a un apartamento específico (puedes elegir el apartment_id).

SELECT apt_amenity.apartment_id
     , amenity.name
  FROM apt_amenity
  JOIN amenity
    ON amenity.amenity_id = apt_amenity.amenity_id
 WHERE apt_amenity.apartment_id = 9

-- Encuentra los clientes que no han realizado ninguna reserva.

SELECT customer.*
  FROM customer
  LEFT
  JOIN reservation
    ON customer.customer_id = reservation.customer_id
 WHERE reservation.customer_id IS NULL

-- Obtén el número total de apartamentos en una ubicación específica (puedes elegir la ubicación).

SELECT location
     , COUNT(*) AS total_apartamentos
  FROM apartment
 WHERE location = 'Vigo'
 GROUP BY location

-- Recupera la información completa de las reservas (reservation_id, start_date, end_date) para los apartamentos que tienen un precio superior a cierto valor (puedes elegir el valor).

SELECT reservation_id
     , start_date
     , end_date
  FROM reservation
  JOIN apartment
    ON reservation.apartment_id = apartment.apartment_id
 WHERE apartment.price > 141

-- Encuentra el propietario con más apartamentos y muestra sus detalles (name, surname, email).

SELECT owner.name
     , owner.surname
     , owner.email
     , max_apt.total_apartamentos
  FROM owner
  JOIN (SELECT owner_id
             , COUNT(*) AS total_apartamentos
          FROM apartment
         GROUP BY owner_id
         ORDER BY total_apartamentos DESC
             , owner_id
         LIMIT 1) max_apt
    ON owner.owner_id = max_apt.owner_id

-- Muestra la ubicación y el número de reservas para cada ubicación, ordenado por número de reservas descendente.

SELECT apartment.location
     , COUNT(*) AS total_reservas
  FROM reservation
  JOIN apartment
    ON reservation.apartment_id = apartment.apartment_id
 GROUP BY apartment.location
 ORDER BY total_reservas DESC

-- Encuentra los clientes que han realizado al menos una reserva y muestra cuántas reservas han hecho.

SELECT reservation.customer_id
     , COUNT(*) AS total_reservas
  FROM reservation
 GROUP BY reservation.customer_id

-- Obtén el precio promedio de los apartamentos.

SELECT AVG(price) AS precio_medio
  FROM apartment

-- Recupera el nombre de las comodidades que están asociadas a más de un apartamento.

SELECT amenity.name
  FROM amenity
  JOIN (SELECT amenity_id
             , COUNT(*) AS total_apartamentos
          FROM apt_amenity
         GROUP BY amenity_id
        HAVING COUNT(*) > 1) usual_amenity
    ON amenity.amenity_id = usual_amenity.amenity_id

-- Encuentra los propietarios que tienen apartamentos en más de una ubicación.

SELECT owner.*
  FROM owner
  JOIN (SELECT owner_id
             , COUNT(*) AS total_localizaciones
          FROM (SELECT owner_id
                     , location
                     , COUNT(*) AS total_apartamentos
                  FROM apartment
                 GROUP BY owner_id
                     , location) ow_loc
         GROUP BY owner_id
        HAVING COUNT(*) > 1) multi_location
    ON owner.owner_id = multi_location.owner_id

SELECT owner.*
  FROM owner
  JOIN (SELECT DISTINCT apartment.owner_id
          FROM apartment 
          JOIN apartment AS bis
            ON apartment.owner_id = bis.owner_id
           AND apartment.location <> bis.location) multi_location
    ON multi_location.owner_id = owner.owner_id

-- Muestra las reservas que están programadas desde una fecha futura (puedes elegir la fecha).

SELECT *
  FROM reservation
 WHERE start_date > '2024-01-01'

-- Obtén el nombre de los clientes que han realizado reservas en al menos dos ubicaciones diferentes.

WITH multi_location
  AS (SELECT customer_id
           , COUNT(*) AS total_localizaciones
        FROM (SELECT reservation.customer_id
                   , apartment.location
                   , COUNT(*) AS total_reservas
                FROM reservation
                JOIN apartment
                  ON reservation.apartment_id = apartment.apartment_id
               GROUP BY reservation.customer_id
                   , apartment.location) rv_apt
       GROUP BY customer_id
      HAVING COUNT(*) > 1)
SELECT customer.*
  FROM customer
  JOIN multi_location
    ON customer.customer_id = multi_location.customer_id

-- Obtén la ubicación con el mayor número de comodidades, mostrando el nombre de la ubicación y la cantidad de comodidades.

SELECT apartment.location
     , SUM(apt_num_amen.total_comodidades) AS total_comodidades
  FROM apartment
  JOIN (SELECT apartment_id
             , COUNT(*) AS total_comodidades
          FROM apt_amenity
         GROUP BY apartment_id) apt_num_amen
    ON apartment.apartment_id = apt_num_amen.apartment_id
 GROUP BY apartment.location
 ORDER BY total_comodidades DESC
     , location
 LIMIT 1

-- Obtén la cantidad total de reservas realizadas por cada cliente, ordenado de mayor a menor.

SELECT customer_id
     , COUNT(*) AS total_reservas
  FROM reservation
 GROUP BY customer_id
 ORDER BY total_reservas DESC

-- Clientes que han repetido en un mismo apartment

SELECT DISTINCT reservation.customer_id
  FROM reservation
  JOIN reservation AS bis
    ON reservation.reservation_id <> bis.reservation_id
   AND reservation.customer_id = bis.customer_id
   AND reservation.apartment_id = bis.apartment_id;


