drop database if exists practica_intermodular;
Create database practica_intermodular;
use practica_intermodular;
-- Crear la tabla Estrellas
CREATE TABLE Estrellas (
    Nombre VARCHAR(50) PRIMARY KEY,
    Tipo_de_Estrella VARCHAR(50),
    Radio_km DECIMAL(10, 1),
    Temperatura_Superficial_C DECIMAL(5, 1),
    Distancia_Media_a_la_Tierra_millones_km DECIMAL(5, 1),
    Composicion VARCHAR(255),
    Fecha_creacion DATE
);

-- Crear la tabla Planetas
CREATE TABLE Planetas (
    Nombre VARCHAR(50) PRIMARY KEY,
    Radio_km DECIMAL(10, 1),
    Distancia_Media_al_Sol_millones_km DECIMAL(5, 1),
    Periodo_Orbital_dias DECIMAL(8, 2),  -- Ajustamos el tamaño para valores grandes
    Temperatura_Media_C DECIMAL(5, 1),
    Tipo_de_Planeta VARCHAR(50),
    Numero_de_Satelites INT,
    Fecha_creacion DATE
);

-- Crear la tabla Satélites
CREATE TABLE Satelites (
    Nombre VARCHAR(50) PRIMARY KEY,
    Planeta VARCHAR(50),
    Radio_km DECIMAL(10, 1),
    Distancia_Media_a_su_Planeta_km DECIMAL(10, 1),
    Periodo_Orbital_dias DECIMAL(8, 2),  -- Ajustamos el tamaño para valores grandes
    Temperatura_Media_C DECIMAL(5, 1),
    Tipo_de_Cuerpo VARCHAR(50),
    Fecha_creacion DATE,
    FOREIGN KEY (Planeta) REFERENCES Planetas(Nombre)
);

-- Insertar datos en la tabla Estrellas
INSERT INTO Estrellas (Nombre, Tipo_de_Estrella, Radio_km, Temperatura_Superficial_C, Distancia_Media_a_la_Tierra_millones_km, Composicion, Fecha_creacion) VALUES
('Sol', 'G2V', 696340, 5500, 149.6, '74% Hidrógeno, 24% Helio, 2% Otros', NULL);

-- Insertar datos en la tabla Planetas
INSERT INTO Planetas (Nombre, Radio_km, Distancia_Media_al_Sol_millones_km, Periodo_Orbital_dias, Temperatura_Media_C, Tipo_de_Planeta, Numero_de_Satelites, Fecha_creacion) VALUES
('Mercurio', 2439.7, 57.9, 88.00, 167, 'Rocoso', NULL, NULL),
('Venus', 6051.8, 108.2, 225.00, 464, 'Rocoso', NULL, NULL),
('Tierra', 6371.0, 149.6, 365.25, 15, 'Rocoso', NULL, NULL),
('Marte', 3389.5, 227.9, 687.00, -65, 'Rocoso', NULL, NULL),
('Júpiter', 69911.0, 778.5, 4333.00, -110, 'Gaseoso', NULL, NULL),
('Saturno', 58232.0, 1427.0, 10759.00, -140, 'Gaseoso', NULL, NULL),
('Urano', 25362.0, 2871.0, 30687.00, -195, 'Gaseoso', NULL, NULL),
('Neptuno', 24622.0, 4495.1, 60190.00, -200, 'Gaseoso', NULL, NULL);


-- Insertar datos en la tabla Satelites
-- Insertar datos en la tabla Satelites
INSERT INTO Satelites (Nombre, Planeta, Radio_km, Distancia_Media_a_su_Planeta_km, Periodo_Orbital_dias, Temperatura_Media_C, Tipo_de_Cuerpo, Fecha_creacion) VALUES
('Luna', 'Tierra', 1737.4, 384400, 27.3, -53, 'Sólido/Rocoso', NULL),
('Fobos', 'Marte', 11.1, 9378, 0.3, -40, 'Sólido/Rocoso', NULL),
('Deimos', 'Marte', 6.2, 23460, 1.3, -40, 'Sólido/Rocoso', NULL),
('Ío', 'Júpiter', 1821.6, 421700, 1.8, -143, 'Sólido/Rocoso', NULL),
('Europa', 'Júpiter', 1560.8, 670900, 3.5, -160, 'Sólido/Hielo', NULL),
('Ganimedes', 'Júpiter', 2634.1, 1070400, 7.2, -160, 'Sólido/Hielo', NULL),
('Calisto', 'Júpiter', 2410.3, 1882700, 16.7, -140, 'Sólido/Hielo', NULL),
('Titán', 'Saturno', 2574.7, 1221870, 15.9, -179, 'Sólido/Hielo', NULL),
('Rhea', 'Saturno', 764.3, 527040, 4.5, -174, 'Sólido/Hielo', NULL),
('Japeto', 'Saturno', 734.5, 3560820, 79.3, -143, 'Sólido/Hielo', NULL),
('Ariel', 'Urano', 578.9, 190900, 2.5, -213, 'Sólido/Hielo', NULL),
('Umbriel', 'Urano', 584.7, 266000, 4.1, -214, 'Sólido/Hielo', NULL),
('Titania', 'Urano', 788.4, 436300, 8.7, -209, 'Sólido/Hielo', NULL),
('Oberón', 'Urano', 761.4, 583500, 13.5, -210, 'Sólido/Hielo', NULL),
('Tritón', 'Neptuno', 1353.4, 354760, 5.9, -235, 'Sólido/Hielo', NULL),
('Proteo', 'Neptuno', 210.0, 117647, 1.1, -223, 'Sólido/Hielo', NULL);

-- Procedimiento para insertar en la tabla Estrellas
DELIMITER //
CREATE PROCEDURE InsertarEstrella(
    IN p_Nombre VARCHAR(50),
    IN p_Tipo_de_Estrella VARCHAR(50),
    IN p_Radio_km DECIMAL(10, 1),
    IN p_Temperatura_Superficial_C DECIMAL(5, 1),
    IN p_Distancia_Media_a_la_Tierra_millones_km DECIMAL(5, 1),
    IN p_Composicion VARCHAR(255),
    IN p_Fecha_creacion DATE
)
BEGIN
    INSERT INTO Estrellas (Nombre, Tipo_de_Estrella, Radio_km, Temperatura_Superficial_C, Distancia_Media_a_la_Tierra_millones_km, Composicion, Fecha_creacion)
    VALUES (p_Nombre, p_Tipo_de_Estrella, p_Radio_km, p_Temperatura_Superficial_C, p_Distancia_Media_a_la_Tierra_millones_km, p_Composicion, p_Fecha_creacion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Planetas
DELIMITER //
CREATE PROCEDURE InsertarPlaneta(
    IN p_Nombre VARCHAR(50),
    IN p_Radio_km DECIMAL(10, 1),
    IN p_Distancia_Media_al_Sol_millones_km DECIMAL(5, 1),
    IN p_Periodo_Orbital_dias DECIMAL(8, 2),
    IN p_Temperatura_Media_C DECIMAL(5, 1),
    IN p_Tipo_de_Planeta VARCHAR(50),
    IN p_Numero_de_Satelites INT,
    IN p_Fecha_creacion DATE
)
BEGIN
    INSERT INTO Planetas (Nombre, Radio_km, Distancia_Media_al_Sol_millones_km, Periodo_Orbital_dias, Temperatura_Media_C, Tipo_de_Planeta, Numero_de_Satelites, Fecha_creacion)
    VALUES (p_Nombre, p_Radio_km, p_Distancia_Media_al_Sol_millones_km, p_Periodo_Orbital_dias, p_Temperatura_Media_C, p_Tipo_de_Planeta, p_Numero_de_Satelites, p_Fecha_creacion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Satelites
DELIMITER //
CREATE PROCEDURE InsertarSatelite(
    IN p_Nombre VARCHAR(50),
    IN p_Planeta VARCHAR(50),
    IN p_Radio_km DECIMAL(10, 1),
    IN p_Distancia_Media_a_su_Planeta_km DECIMAL(10, 1),
    IN p_Periodo_Orbital_dias DECIMAL(8, 2),
    IN p_Temperatura_Media_C DECIMAL(5, 1),
    IN p_Tipo_de_Cuerpo VARCHAR(50),
    IN p_Fecha_creacion DATE
)
BEGIN
    INSERT INTO Satelites (Nombre, Planeta, Radio_km, Distancia_Media_a_su_Planeta_km, Periodo_Orbital_dias, Temperatura_Media_C, Tipo_de_Cuerpo, Fecha_creacion)
    VALUES (p_Nombre, p_Planeta, p_Radio_km, p_Distancia_Media_a_su_Planeta_km, p_Periodo_Orbital_dias, p_Temperatura_Media_C, p_Tipo_de_Cuerpo, p_Fecha_creacion);
END //
DELIMITER ;


