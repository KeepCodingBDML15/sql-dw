-- Crear la tabla customer
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20)
);

ALTER TABLE customer
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE customer
ALTER COLUMN email SET NOT NULL;

-- Crear la tabla OWNER
CREATE TABLE owner (
    owner_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    nif VARCHAR(15)
);

ALTER TABLE customer
ADD CONSTRAINT unique_email UNIQUE (email);

-- Crear la tabla APARTMENT
CREATE TABLE apartment (
    apartment_id SERIAL PRIMARY KEY,
    price DECIMAL(10, 2),
    owner_id INT,
    location VARCHAR(255),
    FOREIGN KEY (owner_id) REFERENCES OWNER(owner_id)
);

-- Crear la tabla RESERVATION
CREATE TABLE reservation (
    reservation_id SERIAL PRIMARY KEY,
    customer_id INT,
    apartment_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (apartment_id) REFERENCES APARTMENT(apartment_id)
);

CREATE INDEX idx_start_date ON reservation (start_date);

-- Crear la tabla AMENITY
CREATE TABLE amenity (
    amenity_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Crear la tabla APT_AMENITY (relación muchos a muchos entre APARTMENT y AMENITY)
CREATE TABLE apt_amenity (
    apt_amenity_id SERIAL PRIMARY KEY,
    apartment_id INT,
    amenity_id INT,
    FOREIGN KEY (apartment_id) REFERENCES APARTMENT(apartment_id),
    FOREIGN KEY (amenity_id) REFERENCES AMENITY(amenity_id),
    UNIQUE (apartment_id, amenity_id)
);

INSERT INTO customer (name, surname, email, phone) VALUES
('Ana', 'González', 'ana.gonzalez@email.com', '912-222333'),
('Juan', 'Martínez', 'juan.martinez@email.com', '944-555666'),
('Laura', 'Hernández', 'laura.hernandez@email.com', '977-888999'),
('Pedro', 'López', 'pedro.lopez@email.com', '910-112131'),
('María', 'Rodríguez', 'maria.rodriguez@email.com', '915-161718'),
('Javier', 'Sánchez', 'javier.sanchez@email.com', '919-021222'),
('Carmen', 'Pérez', 'carmen.perez@email.com', '924-252627'),
('Antonio', 'García', 'antonio.garcia@email.com', '928-293031'),
('Isabel', 'Fernández', 'isabel.fernandez@email.com', '932-333435'),
('Sergio', 'Martín', 'sergio.martin@email.com', '936-373839'),
('Lucía', 'Díaz', 'lucia.diaz@email.com', '940-414243'),
('Elena', 'Moreno', 'elena.moreno@email.com', '948-495051'),
('José', 'Blanco', 'jose.blanco@email.com', '952-535455'),
('Paula', 'Navarro', 'paula.navarro@email.com', '956-575859'),
('Miguel', 'Romero', 'miguel.romero@email.com', '960-616263'),
('Natalia', 'Alonso', 'natalia.alonso@email.com', '964-656667'),
('Diego', 'Ferrer', 'diego.ferrer@email.com', '968-697071'),
('Sofía', 'Vidal', 'sofia.vidal@email.com', '972-737475'),
('Alonso', 'López', 'alonso.lopez@email.com', '976-777879'),
('Sara', 'Gutiérrez', 'sara.gutierrez@email.com', '980-818283');

INSERT INTO owner (name, surname, email, phone, nif) VALUES
('Carlos', 'Gómez', 'carlos.gomez@email.com', '123-456-7890', 'A12345678'),
('Elena', 'Rodríguez', 'elena.rodriguez@email.com', '987-654-3210', 'B23456789'),
('Antonio', 'López', 'antonio.lopez@email.com', '555-123-4567', 'C34567890'),
('María', 'Fernández', 'maria.fernandez@email.com', '789-456-1230', 'D45678901'),
('Javier', 'Sánchez', 'javier.sanchez@email.com', '111-222-3333', 'E56789012'),
('Ana', 'Pérez', 'ana.perez@email.com', '444-555-6666', 'F67890123'),
('José', 'García', 'jose.garcia@email.com', '777-888-9999', 'G78901234'),
('Carmen', 'Martínez', 'carmen.martinez@email.com', '101-112-1314', 'H89012345'),
('Juan', 'Díaz', 'juan.diaz@email.com', '151-161-1718', 'I90123456'),
('Laura', 'Moreno', 'laura.moreno@email.com', '192-021-2223', 'J01234567'), 
('Pedro', 'Blanco', 'pedro.blanco@email.com', '242-252-2627', 'K12345678'),
('Isabel', 'Molina', 'isabel.molina@email.com', '282-293-3031', 'L23456789'),
('Sergio', 'Vidal', 'sergio.vidal@email.com', '323-333-3435', 'M34567890'),
('Lucía', 'Fernández', 'lucia.fernandez@email.com', '363-373-3839', 'N45678901'),
('Miguel', 'Taylor', 'miguel.taylor@email.com', '404-414-4243', 'O56789012'),
('Paula', 'Clark', 'paula.clark@email.com', '444-454-4647', 'P67890123'),
('Alonso', 'Turner', 'alonso.turner@email.com', '484-495-5051', 'Q78901234'),
('Natalia', 'Hall', 'natalia.hall@email.com', '525-535-5455', 'R90123456'),
('Diego', 'Walker', 'diego.walker@email.com', '565-575-5859', 'S12345678'),
('Sofía', 'King', 'sofia.king@email.com', '606-616-6263', 'T23456789'),
('Sara', 'Gutiérrez', 'sara.gutierrez@email.com', '980-818283', 'R12345678');

INSERT INTO apartment (price, owner_id, location) VALUES
(130.25, 1, 'Madrid'),
(140.50, 2, 'Barcelona'),
(125.75, 3, 'Valencia'),
(145.00, 4, 'Sevilla'),
(135.25, 5, 'Zaragoza'),
(128.75, 8, 'Zaragoza'),
(132.00, 7, 'Murcia'),
(138.50, 8, 'Murcia'),
(141.25, 9, 'Barcelona'),
(126.50, 10, 'Bilbao'),
(148.00, 11, 'Alicante'),
(130.75, 12, 'Valladolid'),
(143.25, 13, 'Valladolid'),
(137.00, 14, 'Vigo'),
(129.00, 15, 'Vigo'),
(134.50, 16, 'Madrid'),
(142.75, 17, 'Madrid'),
(146.00, 18, 'Bilbao'),
(136.25, 19, 'Granada'),
(147.50, 20, 'Elche'),
(155.00, 11, 'Toledo'),
(120.50, 2, 'Segovia'),
(133.75, 13, 'Salamanca'),
(149.00, 4, 'Salamanca'),
(138.25, 5, 'Badajoz'),
(121.50, 3, 'Cáceres'),
(142.00, 17, 'Pontevedra'),
(123.75, 18, 'Vigo'),
(137.50, 9, 'Albacete'),
(150.25, 3, 'Huelva'),
(132.50, 1, 'Burgos'),
(124.00, 12, 'Sevilla'),
(139.75, 9, 'Madrid'),
(146.50, 8, 'Lleida'),
(128.00, 5, 'Ourense'),
(135.50, 4, 'Cuenca'),
(141.00, 3, 'Guadalajara'),
(125.25, 9, 'Huelva'),
(144.25, 9, 'Zamora'),
(130.00, 1, 'Zaragoza');

INSERT INTO reservation (customer_id, apartment_id, start_date, end_date)
VALUES
  (1, 1, DATE '2023-07-01', DATE '2023-07-03'),
  (2, 2, DATE '2023-07-04', DATE '2023-07-06'),
  (4, 4, DATE '2023-07-10', DATE '2023-07-12'),
  (5, 5, DATE '2023-07-13', DATE '2023-07-15'),
  (6, 6, DATE '2023-07-16', DATE '2023-07-18'),
  (7, 7, DATE '2023-07-19', DATE '2023-07-21'),
  (8, 8, DATE '2023-07-22', DATE '2023-07-24'),
  (9, 9, DATE '2023-07-25', DATE '2023-07-27'),
  (10, 10, DATE '2023-07-28', DATE '2023-07-30'),
  (11, 11, DATE '2023-08-01', DATE '2023-08-03'),
  (12, 12, DATE '2023-08-04', DATE '2023-08-06'),
  (13, 13, DATE '2023-08-07', DATE '2023-08-09'),
  (14, 14, DATE '2023-08-10', DATE '2023-08-12'),
  (15, 15, DATE '2023-08-13', DATE '2023-08-15'),
  (16, 16, DATE '2023-08-16', DATE '2023-08-18'),
  (17, 17, DATE '2023-08-19', DATE '2023-08-21'),
  (18, 18, DATE '2023-08-22', DATE '2023-08-24'),
  (19, 19, DATE '2023-08-25', DATE '2023-08-27'),
  (20, 20, DATE '2023-08-28', DATE '2023-08-30'),
  (1, 21, DATE '2023-09-01', DATE '2023-09-03'),
  (2, 22, DATE '2023-09-04', DATE '2023-09-06'),
  (4, 24, DATE '2023-09-10', DATE '2023-09-12'),
  (5, 25, DATE '2023-09-13', DATE '2023-09-15'),
  (6, 26, DATE '2023-09-16', DATE '2023-09-18'),
  (7, 27, DATE '2023-09-19', DATE '2023-09-21'),
  (8, 28, DATE '2023-09-22', DATE '2023-09-24'),
  (9, 29, DATE '2023-09-25', DATE '2023-09-27'),
  (10, 30, DATE '2023-09-28', DATE '2023-09-30'),
  (11, 31, DATE '2023-10-01', DATE '2023-10-03'),
  (12, 32, DATE '2023-10-04', DATE '2023-10-06'),
  (13, 33, DATE '2023-10-07', DATE '2023-10-09'),
  (14, 34, DATE '2023-10-10', DATE '2023-10-12'),
  (15, 35, DATE '2023-10-13', DATE '2023-10-15'),
  (16, 36, DATE '2023-10-16', DATE '2023-10-18'),
  (17, 37, DATE '2023-10-19', DATE '2023-10-21'),
  (18, 38, DATE '2023-10-22', DATE '2023-10-24'),
  (19, 39, DATE '2023-10-25', DATE '2023-10-27'),
  (20, 40, DATE '2023-10-28', DATE '2023-10-30'),
  (1, 1, DATE '2023-11-01', DATE '2023-11-03'),
  (2, 2, DATE '2023-11-04', DATE '2023-11-06'),
  (4, 4, DATE '2023-11-10', DATE '2023-11-12'),
  (5, 5, DATE '2023-11-13', DATE '2023-11-15'),
  (6, 6, DATE '2023-11-16', DATE '2023-11-18'),
  (7, 7, DATE '2023-11-19', DATE '2023-11-21'),
  (8, 8, DATE '2023-11-22', DATE '2023-11-24'),
  (9, 9, DATE '2023-11-25', DATE '2023-11-27'),
  (10, 5, DATE '2023-11-28', DATE '2023-11-30'),
  (11, 1, DATE '2023-12-01', DATE '2023-12-03'),
  (12, 2, DATE '2023-12-04', DATE '2023-12-06'),
  (13, 3, DATE '2023-12-07', DATE '2023-12-09'),
  (14, 4, DATE '2023-12-10', DATE '2023-12-12'),
  (15, 5, DATE '2023-12-13', DATE '2023-12-15'),
  (16, 6, DATE '2023-12-16', DATE '2023-12-18'),
  (17, 7, DATE '2023-12-19', DATE '2023-12-21'),
  (18, 8, DATE '2023-12-22', DATE '2023-12-24'),
  (19, 9, DATE '2023-12-25', DATE '2023-12-27'),
  (20, 10, DATE '2023-12-28', DATE '2023-12-30'),
  (1, 11, DATE '2024-01-01', DATE '2024-01-03'),
  (2, 12, DATE '2024-01-04', DATE '2024-01-06'),
  (4, 14, DATE '2024-01-10', DATE '2024-01-12'),
  (5, 15, DATE '2024-01-13', DATE '2024-01-15'),
  (6, 16, DATE '2024-01-16', DATE '2024-01-18'),
  (7, 17, DATE '2024-01-19', DATE '2024-01-21'),
  (8, 18, DATE '2024-01-22', DATE '2024-01-24'),
  (9, 19, DATE '2024-01-25', DATE '2024-01-27'),
  (10, 20, DATE '2024-01-28', DATE '2024-01-30'),
  (11, 21, DATE '2024-02-01', DATE '2024-02-03'),
  (12, 22, DATE '2024-02-04', DATE '2024-02-06'),
  (13, 23, DATE '2024-02-07', DATE '2024-02-09'),
  (14, 24, DATE '2024-02-10', DATE '2024-02-12'),
  (15, 25, DATE '2024-02-13', DATE '2024-02-15'),
  (16, 26, DATE '2024-02-16', DATE '2024-02-18'),
  (17, 27, DATE '2024-02-19', DATE '2024-02-21'),
  (18, 28, DATE '2024-02-22', DATE '2024-02-24'),
  (19, 29, DATE '2024-02-25', DATE '2024-02-27'),
  (20, 30, DATE '2024-02-28', DATE '2024-02-29');

INSERT INTO amenity (name)
VALUES
  ('Piscina'),
  ('Gimnasio'),
  ('Aparcamiento'),
  ('Cocina equipada'),
  ('Wifi'),
  ('Aire acondicionado'),
  ('Terraza'),
  ('Vistas al mar'),
  ('TV por cable'),
  ('Lavandería');

INSERT INTO apt_amenity (apartment_id, amenity_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10),
  (11, 1),
  (12, 2),
  (13, 3),
  (14, 4),
  (15, 5),
  (16, 6),
  (17, 7),
  (18, 8),
  (19, 9),
  (20, 10),
  (21, 1),
  (22, 2),
  (23, 3),
  (24, 4),
  (25, 5),
  (26, 6),
  (27, 7),
  (28, 8),
  (29, 9),
  (30, 10),
  (1, 9),
  (2, 8),
  (3, 7),
  (4, 6),
  (5, 4),
  (6, 5),
  (7, 3),
  (8, 2),
  (9, 1),
  (11, 2),
  (12, 3),
  (13, 4),
  (14, 5),
  (15, 6),
  (16, 7),
  (17, 8),
  (18, 9);
