-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generaciÃ³n: 06-08-2020 a las 22:41:14
-- VersiÃ³n del servidor: 10.4.11-MariaDB
-- VersiÃ³n de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--
CREATE DATABASE IF NOT EXISTS `inventario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inventario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `onStock` text NOT NULL,
  `code` text NOT NULL,
  `warehouse` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`id`, `name`, `onStock`, `code`, `warehouse`, `description`, `status`) VALUES
(1, 'Lorem Ipsum dolor sit amet, consetetur', '5', '0000000', 1, 'Lorem Ipsum dolor sit amet, consetetur', 'active'),
(2, 'qwe', '123', '123', 2, 'qwe', 'active'),
(3, 'Prueba', '123', '123', 2, 'qwe', 'inactive'),
(4, '1', '1', '1', 1, '1', 'active'),
(5, '2', '2', '2', 2, '2', 'active'),
(6, '3', '3', '3', 2, '3', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `warehouse`
--

INSERT INTO `warehouse` (`id`, `name`) VALUES
(1, 'Centro'),
(2, 'Norte');

--
-- Ãndices para tablas volcadas
--

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hmm` (`warehouse`);

--
-- Indices de la tabla `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `to_sub` FOREIGN KEY (`warehouse`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE;
--
-- Base de datos: `phpmyadmin`
--
