-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-11-2016 a las 22:44:28
-- Versión del servidor: 5.5.53-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `blog_arza`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre_categoria`, `descripcion`) VALUES
(1, 'php', 'Lenguaje de programacion php'),
(2, 'java', 'Lenguaje de programacion java');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_post` int(10) unsigned NOT NULL,
  `comentario` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentarios_users1_idx` (`id_usuario`),
  KEY `fk_comentarios_posts1_idx` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logros`
--

CREATE TABLE IF NOT EXISTS `logros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_logro` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
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
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permiso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `permiso`) VALUES
(1, 'edicion'),
(2, 'lectura'),
(3, 'acceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cuerpo` varchar(3000) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_ultima_modificacion` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  `id_autor` int(10) unsigned NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_categorias1_idx` (`id_categoria`),
  KEY `fk_post_users1_idx` (`id_autor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `cuerpo`, `tags`, `fecha_creacion`, `fecha_ultima_modificacion`, `estado`, `id_categoria`, `id_autor`, `slug`) VALUES
(1, 'hola', 'hola', '<p>hola</p>', 'hola, hola, hola', '2016-11-04 19:19:32', '2016-11-04 19:19:32', 1, 2, 2, 'hola'),
(2, 'Este es mi primer post', 'Esta es la primera breve descripcion de mi post', '<p>Este es el cuerpo de mi primer post en la pagina</p>', 'mi tag 1, mi tag 2, mi tag 3', '2016-11-04 19:29:55', '2016-11-04 19:29:55', 1, 1, 2, 'este-es-mi-primer-post'),
(3, 'Este es mi primer post', 'hola', '<p>hola</p>', 'hola, hola, hola', '2016-11-04 19:32:41', '2016-11-04 19:32:41', 1, 2, 2, 'este-es-mi-primer-post'),
(4, 'moises hola hola ASDASDa sads', 'moises', '<p><strong>hola</strong></p>', 'aasd, asdas ,a sdasd', '2016-11-04 20:34:48', '2016-11-04 20:34:48', 1, 2, 2, 'moises-hola-hola-asdasda-sads');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
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
-- Estructura de tabla para la tabla `rangos`
--

CREATE TABLE IF NOT EXISTS `rangos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_rango` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `rangos`
--

INSERT INTO `rangos` (`id`, `nombre_rango`, `descripcion`) VALUES
(1, 'Novato', 'Rango inicial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre_rol`, `descripcion`) VALUES
(1, 'usuario', 'El comun de los usuarios'),
(2, 'administrador', 'El administrador de la pagina, administra los usuarios, datos y permisos de la web');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permiso`
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
-- Volcado de datos para la tabla `rol_permiso`
--

INSERT INTO `rol_permiso` (`id`, `id_rol`, `id_permiso`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 2, 2),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_rango` int(10) unsigned NOT NULL DEFAULT '1',
  `id_rol` int(10) unsigned NOT NULL DEFAULT '1',
  `nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_perfil` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'no-avatar.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_users_rangos1_idx` (`id_rango`),
  KEY `fk_users_roles1_idx` (`id_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `id_rango`, `id_rol`, `nombre`, `apellido`, `fecha_nacimiento`, `descripcion`, `foto_perfil`) VALUES
(2, 'Alan', 'arzapersonal@gmail.com', '$2y$10$Hmscok6hLbzwALQzgd4XzusHW1CGYs6QExFNQ6Lf51IvC9rcJ5Q2m', 'Ny4arQ9FeSaeNPhTGpvedwvU6YxMB4EiUPVqrcd1MMdzJsHDgez3v5QsiFOt', '2016-10-29 01:14:18', '2016-11-08 04:38:19', 1, 1, 'Eliezer', 'Arza', '1992-04-20', 'Programador musico, creador del sitio', 'no-avatar.png'),
(3, 'Superdoop', 'alguien@alguien.com', '$2y$10$eLkA8JJHevqJd3Up4wptAeE5Ev/Wrl.G4i5n1I..WTvVy.h2Upbgm', 'fCm5TcMfwokGfMhgzbzX1AAB8zAJ8at5P6epOA5mu5VsDTrugj3UF8iF8SUL', '2016-11-08 04:38:43', '2016-11-08 04:40:52', 1, 1, 'Alan', 'Leon', '1990-11-09', 'Una descripcion sobre mi', 'no-avatar.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_logro`
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
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentarios_users1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentarios_posts1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_post_categorias1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_post_users1` FOREIGN KEY (`id_autor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `puntos`
--
ALTER TABLE `puntos`
  ADD CONSTRAINT `fk_puntos_post1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_puntos_users1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `fk_rol_permiso_permisos1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_permiso_roles1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_rangos1` FOREIGN KEY (`id_rango`) REFERENCES `rangos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_roles1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_logro`
--
ALTER TABLE `usuario_logro`
  ADD CONSTRAINT `fk_usuario_logro_logros1` FOREIGN KEY (`id_logro`) REFERENCES `logros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_logro_users1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
