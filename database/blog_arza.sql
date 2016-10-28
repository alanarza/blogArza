-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 28, 2016 at 07:15 PM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `blog_arza`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `datos_usuario`
--

CREATE TABLE IF NOT EXISTS `datos_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `usuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datos_usuario_users1_idx` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `logros`
--

CREATE TABLE IF NOT EXISTS `logros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_logro` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permiso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `permisos`
--

INSERT INTO `permisos` (`id`, `permiso`) VALUES
(1, 'edicion'),
(2, 'lectura'),
(3, 'acceso');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cuerpo` varchar(3000) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_ultima_modificacion` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `categoria` int(10) unsigned NOT NULL,
  `autor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_categorias1_idx` (`categoria`),
  KEY `fk_post_users1_idx` (`autor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `puntos`
--

CREATE TABLE IF NOT EXISTS `puntos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_post` int(10) unsigned NOT NULL,
  `punto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_puntos_users1_idx` (`id_usuario`),
  KEY `fk_puntos_post1_idx` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rangos`
--

CREATE TABLE IF NOT EXISTS `rangos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_rango` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rangos`
--

INSERT INTO `rangos` (`id`, `nombre_rango`, `descripcion`) VALUES
(1, 'Novato', 'Rango inicial');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nombre_rol`, `descripcion`) VALUES
(1, 'usuario', 'El comun de los usuarios'),
(2, 'administrador', 'El administrador de la pagina, administra los usuarios, datos y permisos de la web');

-- --------------------------------------------------------

--
-- Table structure for table `rol_permiso`
--

CREATE TABLE IF NOT EXISTS `rol_permiso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_rol` int(10) unsigned NOT NULL,
  `id_permiso` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rol_permiso_roles1_idx` (`id_rol`),
  KEY `fk_rol_permiso_permisos1_idx` (`id_permiso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `rol_permiso`
--

INSERT INTO `rol_permiso` (`id`, `id_rol`, `id_permiso`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 2, 2),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rango` int(10) unsigned NOT NULL DEFAULT '1',
  `rol` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `fk_users_rangos1_idx` (`rango`),
  KEY `fk_users_roles1_idx` (`rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `rango`, `rol`) VALUES
(2, 'Alan', 'arzapersonal@gmail.com', '$2y$10$Hmscok6hLbzwALQzgd4XzusHW1CGYs6QExFNQ6Lf51IvC9rcJ5Q2m', NULL, '2016-10-29 01:14:18', '2016-10-29 01:14:18', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario_logro`
--

CREATE TABLE IF NOT EXISTS `usuario_logro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_logro` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_logro_users1_idx` (`id_usuario`),
  KEY `fk_usuario_logro_logros1_idx` (`id_logro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datos_usuario`
--
ALTER TABLE `datos_usuario`
  ADD CONSTRAINT `fk_datos_usuario_users1` FOREIGN KEY (`usuario`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_categorias1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_post_users1` FOREIGN KEY (`autor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `puntos`
--
ALTER TABLE `puntos`
  ADD CONSTRAINT `fk_puntos_users1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_puntos_post1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `fk_rol_permiso_roles1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_permiso_permisos1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_rangos1` FOREIGN KEY (`rango`) REFERENCES `rangos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_roles1` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario_logro`
--
ALTER TABLE `usuario_logro`
  ADD CONSTRAINT `fk_usuario_logro_users1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_logro_logros1` FOREIGN KEY (`id_logro`) REFERENCES `logros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
