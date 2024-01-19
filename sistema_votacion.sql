-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2024 a las 10:19:06
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_votacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id`, `nombre`) VALUES
(1, 'Candidato 1 - Juan Pérez'),
(2, 'Candidato 2 - María Rodríguez'),
(3, 'Candidato 3 - Pedro González'),
(4, 'Candidato 4 - Laura Fernández'),
(5, 'Candidato 5 - Luis Martínez'),
(6, 'Candidato 6 - Ana Díaz'),
(7, 'Candidato 7 - Carlos Herrera'),
(8, 'Candidato 8 - Isabel López'),
(9, 'Candidato 9 - Javier Ramírez'),
(10, 'Candidato 10 - Gabriela Sánchez'),
(11, 'Candidato 11 - Miguel Castro'),
(12, 'Candidato 12 - Carmen Medina'),
(13, 'Candidato 13 - Diego Jiménez'),
(14, 'Candidato 14 - Patricia Torres'),
(15, 'Candidato 15 - Ricardo Morales'),
(16, 'Candidato 16 - Elena Flores'),
(17, 'Candidato 17 - Fernando Silva'),
(18, 'Candidato 18 - Claudia Ortega'),
(19, 'Candidato 19 - Alejandro Núñez'),
(20, 'Candidato 20 - Sofía Bravo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `como_se_entero`
--

CREATE TABLE `como_se_entero` (
  `id` int(11) NOT NULL,
  `id_voto` int(11) DEFAULT NULL,
  `opcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_region` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id`, `nombre`, `id_region`) VALUES
(1, 'Arica', 1),
(2, 'Camarones', 2),
(3, 'Putre', 3),
(4, 'General Lagos', 4),
(5, 'Iquique', 5),
(6, 'Alto Hospicio', 6),
(7, 'Pozo Almonte', 7),
(8, 'Camiña', 8),
(9, 'Colchane', 9),
(10, 'Huara', 10),
(11, 'Huechuraba', 13),
(12, 'Independencia', 13),
(13, 'La Cisterna', 13),
(14, 'La Florida', 13),
(15, 'La Granja', 13),
(16, 'La Pintana', 13),
(17, 'La Reina', 13),
(18, 'Las Condes', 13),
(19, 'Lo Barnechea', 13),
(20, 'Lo Espejo', 13),
(21, 'Lo Prado', 13),
(22, 'Macul', 13),
(23, 'Maipú', 13),
(24, 'Ñuñoa', 13),
(25, 'Pedro Aguirre Cerda', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestados`
--

CREATE TABLE `encuestados` (
  `id` int(11) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `nombre_apellido` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_comuna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Región de Arica y Parinacota\r\n\r\n'),
(2, 'Región de Tarapacá'),
(3, 'Región de Antofagasta'),
(4, 'Región de Atacama'),
(5, 'Región de Coquimbo'),
(6, 'Región de Valparaíso'),
(7, 'Región Metropolitana de Santiago'),
(8, 'Región del Libertador General Bernardo O\\\'Higgins'),
(9, 'Región de Maule'),
(10, 'Región de Ñuble'),
(11, 'Región de la Araucanía'),
(12, 'Región de Los Ríos'),
(13, 'Región de Los Lagos'),
(14, 'Región Aysén del General Carlos Ibáñez del Campo'),
(15, 'Región de Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
--

CREATE TABLE `votos` (
  `id` int(11) NOT NULL,
  `id_encuestado` int(11) DEFAULT NULL,
  `id_candidato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `como_se_entero`
--
ALTER TABLE `como_se_entero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_voto` (`id_voto`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_region` (`id_region`);

--
-- Indices de la tabla `encuestados`
--
ALTER TABLE `encuestados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD KEY `id_comuna` (`id_comuna`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_encuestado` (`id_encuestado`),
  ADD KEY `id_candidato` (`id_candidato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `como_se_entero`
--
ALTER TABLE `como_se_entero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `encuestados`
--
ALTER TABLE `encuestados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `votos`
--
ALTER TABLE `votos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `como_se_entero`
--
ALTER TABLE `como_se_entero`
  ADD CONSTRAINT `como_se_entero_ibfk_1` FOREIGN KEY (`id_voto`) REFERENCES `votos` (`id`);

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`id`);

--
-- Filtros para la tabla `encuestados`
--
ALTER TABLE `encuestados`
  ADD CONSTRAINT `encuestados_ibfk_1` FOREIGN KEY (`id_comuna`) REFERENCES `comunas` (`id`);

--
-- Filtros para la tabla `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`id_encuestado`) REFERENCES `encuestados` (`id`),
  ADD CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
