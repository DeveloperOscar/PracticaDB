-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-09-2022 a las 00:33:27
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `PracticaDB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Autor`
--

CREATE TABLE `Autor` (
  `nombre` varchar(40) NOT NULL,
  `id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Autor`
--

INSERT INTO `Autor` (`nombre`, `id`) VALUES
('Cervantes', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categoria`
--

CREATE TABLE `Categoria` (
  `codigo` varchar(20) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Categoria`
--

INSERT INTO `Categoria` (`codigo`, `estado`, `nombre`) VALUES
('cat123', '1', 'Categoria1'),
('cat124', '1', 'Categoria1'),
('cat125', '0', 'Categoria2'),
('cat126', '0', 'Categoria3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ejemplar`
--

CREATE TABLE `Ejemplar` (
  `codigo` varchar(20) NOT NULL,
  `idLibro` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Ejemplar`
--

INSERT INTO `Ejemplar` (`codigo`, `idLibro`) VALUES
('ejem1', 'lib1'),
('ejem2', 'lib2'),
('ejem3', 'lib3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Libro`
--

CREATE TABLE `Libro` (
  `nombre` varchar(20) NOT NULL,
  `id` varchar(20) NOT NULL,
  `idCategoria` varchar(20) DEFAULT NULL,
  `idAutor` varchar(20) DEFAULT NULL,
  `tipo_libro` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Libro`
--

INSERT INTO `Libro` (`nombre`, `id`, `idCategoria`, `idAutor`, `tipo_libro`) VALUES
('como al noche', 'lib1', 'cat123', '123', 'Fisico'),
('Al despertar', 'lib2', 'cat124', '123', 'Virtual'),
('Codigo Limpio', 'lib3', 'cat125', '123', 'Fisico Virtual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LIBRO_TIPO_CHOICES`
--

CREATE TABLE `LIBRO_TIPO_CHOICES` (
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `LIBRO_TIPO_CHOICES`
--

INSERT INTO `LIBRO_TIPO_CHOICES` (`tipo`) VALUES
('Fisico'),
('Fisico Virtual'),
('Virtual');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Autor`
--
ALTER TABLE `Autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Categoria`
--
ALTER TABLE `Categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `Ejemplar`
--
ALTER TABLE `Ejemplar`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idLibro` (`idLibro`);

--
-- Indices de la tabla `Libro`
--
ALTER TABLE `Libro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `idAutor` (`idAutor`),
  ADD KEY `tipo_libro` (`tipo_libro`);

--
-- Indices de la tabla `LIBRO_TIPO_CHOICES`
--
ALTER TABLE `LIBRO_TIPO_CHOICES`
  ADD PRIMARY KEY (`tipo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Ejemplar`
--
ALTER TABLE `Ejemplar`
  ADD CONSTRAINT `Ejemplar_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `Libro` (`id`);

--
-- Filtros para la tabla `Libro`
--
ALTER TABLE `Libro`
  ADD CONSTRAINT `Libro_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`codigo`),
  ADD CONSTRAINT `Libro_ibfk_2` FOREIGN KEY (`idAutor`) REFERENCES `Autor` (`id`),
  ADD CONSTRAINT `Libro_ibfk_3` FOREIGN KEY (`tipo_libro`) REFERENCES `LIBRO_TIPO_CHOICES` (`tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
