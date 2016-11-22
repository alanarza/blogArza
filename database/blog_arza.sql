-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-11-2016 a las 01:59:56
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
  `comentario` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentarios_users1_idx` (`id_usuario`),
  KEY `fk_comentarios_posts1_idx` (`id_post`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_usuario`, `id_post`, `comentario`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Hola troesma', '2016-11-16 18:32:57', '2016-11-16 18:32:57'),
(2, 8, 1, 'DENUNCIADO PAPU', '2016-11-16 18:33:27', '2016-11-16 18:33:27'),
(3, 2, 1, 'nooo la bardeaste', '2016-11-16 18:33:42', '2016-11-16 18:33:42'),
(4, 8, 1, 'ANDA A LA CANCHA BOBO\r\n', '2016-11-16 18:34:01', '2016-11-16 18:34:01'),
(5, 2, 1, 'hola\r\n', '2016-11-16 18:36:50', '2016-11-16 18:36:50'),
(6, 2, 8, 'hola', '2016-11-16 18:37:57', '2016-11-16 18:37:57'),
(7, 2, 6, 'hola', '2016-11-16 18:44:59', '2016-11-16 18:44:59'),
(8, 2, 8, 'ehh mesii', '2016-11-16 18:45:19', '2016-11-16 18:45:19'),
(9, 2, 8, 'en el medio de este post, yo te clavo una denuncia...', '2016-11-21 19:43:54', '2016-11-21 19:43:54');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `cuerpo`, `tags`, `fecha_creacion`, `fecha_ultima_modificacion`, `estado`, `id_categoria`, `id_autor`, `slug`) VALUES
(1, 'hola', 'hola', '<p>hola</p>', 'hola, hola, hola', '2016-11-04 19:19:32', '2016-11-04 19:19:32', 1, 2, 2, 'hola'),
(2, 'Este es mi primer post', 'Esta es la primera breve descripcion de mi post', '<p>Este es el cuerpo de mi primer post en la pagina</p>', 'mi tag 1, mi tag 2, mi tag 3', '2016-11-04 19:29:55', '2016-11-04 19:29:55', 1, 1, 2, 'este-es-mi-primer-post'),
(3, 'Este es mi primer post', 'hola', '<p>hola</p>', 'hola, hola, hola', '2016-11-04 19:32:41', '2016-11-04 19:32:41', 1, 2, 2, 'este-es-mi-primer-post'),
(4, 'moises hola hola ASDASDa sads', 'moises', '<p><strong>hola</strong></p>', 'aasd, asdas ,a sdasd', '2016-11-04 20:34:48', '2016-11-04 20:34:48', 1, 2, 2, 'moises-hola-hola-asdasda-sads'),
(5, 'golondrina', 'golondrina', '<p>golondrina</p>', 'golondrina', '2016-11-15 15:45:26', '2016-11-15 15:45:26', 1, 2, 4, 'golondrina'),
(6, 'post de yessi', 'post de yessi', '<p>post de yessi</p>', 'post de yessi', '2016-11-15 20:25:12', '2016-11-15 20:25:12', 1, 1, 7, 'post-de-yessi'),
(7, 'dasda', 'dasda', '<p>sadadsa</p>', 'sda sadas', '2016-11-16 15:11:29', '2016-11-16 15:11:29', 1, 1, 8, 'dasda'),
(8, 'TODOS PUTOS!', 'TODOS PUTOS!', '<p>TODOS PUTOS!&nbsp;</p>\r\n<p>LA CONCHA DE TU MADRE ALL BOYS!!!</p>', 'PUTOS', '2016-11-16 15:25:42', '2016-11-16 15:25:42', 1, 2, 8, 'todos-putos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
--

CREATE TABLE IF NOT EXISTS `puntos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_post` int(10) unsigned NOT NULL,
  `id_autor` int(10) unsigned NOT NULL,
  `punto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_puntos_users1_idx` (`id_usuario`),
  KEY `fk_puntos_post1_idx` (`id_post`),
  KEY `fk_puntos_users2_idx` (`id_autor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `puntos`
--

INSERT INTO `puntos` (`id`, `id_usuario`, `id_post`, `id_autor`, `punto`) VALUES
(19, 7, 1, 2, 1),
(20, 7, 4, 2, 1),
(21, 7, 2, 2, 1),
(22, 7, 3, 2, 1),
(23, 7, 8, 8, 1),
(24, 7, 7, 8, -1),
(25, 7, 5, 4, -1),
(26, 3, 4, 2, 1),
(27, 3, 3, 2, 1),
(28, 3, 2, 2, 1),
(29, 3, 1, 2, 1),
(30, 4, 4, 2, 1),
(32, 4, 1, 2, 1),
(33, 4, 8, 8, 1),
(34, 4, 7, 8, -1),
(35, 2, 5, 4, -1),
(36, 2, 7, 8, -1),
(37, 2, 8, 8, -1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rangos`
--

CREATE TABLE IF NOT EXISTS `rangos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_rango` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `rangos`
--

INSERT INTO `rangos` (`id`, `nombre_rango`, `descripcion`, `valor`) VALUES
(1, 'Troll', 'Usuario Troll', -10),
(2, 'Novato/a', 'Rango inicial', 0),
(3, 'Casual', 'Usuario casual en el sistema', 10),
(4, 'Frecuente', 'Usuario frecuente', 20),
(5, 'Activo/a', 'Usuario activo', 30),
(6, 'Experto/a', 'Usuario Experto', 40);

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
  `id_rol` int(10) unsigned NOT NULL DEFAULT '1',
  `nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Algo sobre mi..',
  `foto_perfil` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'no-avatar.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_users_roles1_idx` (`id_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `id_rol`, `nombre`, `apellido`, `fecha_nacimiento`, `descripcion`, `foto_perfil`) VALUES
(2, 'Alan', 'arzapersonal@gmail.com', '$2y$10$Yphik6PY5TCmGDYjh.CgteeMfCG120ZFKuzGtqoAYOuMLwUpQP.Pi', 'n8U2dEY0HedbVVv8DkVn8lNeBtreAZYHJzLtPCEEsfjyEiAiXFfkvRJ8ftYO', '2016-10-29 01:14:18', '2016-11-22 06:26:14', 1, 'Eliezer', 'Arza', '1992-04-20', 'Main teemo!!', 'Alan.jpg'),
(3, 'Superdoop', 'alguien@alguien.com', '$2y$10$eLkA8JJHevqJd3Up4wptAeE5Ev/Wrl.G4i5n1I..WTvVy.h2Upbgm', 'xQciBHouGBcgCudGJLIQTvT4gTUbF4RPQgur7LrbbZdEabABrOEE5OUjSFO4', '2016-11-08 04:38:43', '2016-11-22 07:19:06', 1, 'Alan', 'Leon', '1990-11-09', 'Una descripcion sobre mi', 'no-avatar.png'),
(4, 'golondrina01', 'golondrina@alguien.com', '$2y$10$ddQSxaZ5JOKD/JzTnsLfJOuryJafXGIrnY0v3USFa4ppRfOGxgBqm', 'IaCPtDEaTAoFpvuecSHH9h2LoPbIE9gACTWjKvtCyMgzMSXVEdJB4COMXTw3', '2016-11-08 20:05:00', '2016-11-22 07:28:44', 1, 'Ivo', 'Lares', '1994-11-16', 'Main yasuo!', 'golondrina.jpg'),
(5, 'Asdfasdfasdf', 'alguie12asdf3n@alguien.com', '$2y$10$ikke3UEK.NqsYWAs4HAXSOFZbAtW8lN6aS7e6bZDQi.b/WX2J8aoi', 'FhGaovjqMBBVSs8QOliOXTssYWWxohk48ScDNaTB25DT0z7RyQ5Io5XG8eoG', '2016-11-08 21:19:50', '2016-11-08 21:28:51', 1, NULL, NULL, NULL, 'Algo sobre mi..', 'no-avatar.png'),
(6, 'Osdema', 'alguien123123@alguien.com', '$2y$10$mFTwd0kJcBNhr.Rx.7EiXeP/7P9Qsswnj4PtJahf0zr3rCf80ZYNq', NULL, '2016-11-08 21:29:32', '2016-11-08 21:29:32', 1, 'oscar', 'demares', '2016-11-03', 'Algo sobre mi..', 'no-avatar.png'),
(7, 'Yessica', 'example@example.com', '$2y$10$4RdQZozNkGLL/uc2RjtiaOBXMhI.D27GnoXyjvepXkbSrBon8KYXS', 'kT5DiFVjZ8iCcCop9XDMgZFMvv4VcQRLjhrAj3jPYUrrSmaBrKsmOBrzZaYz', '2016-11-15 23:24:09', '2016-11-22 07:18:15', 1, 'Yessi', 'Arza', '1993-11-08', 'Hola como estas!', 'Yessic.jpg'),
(8, 'valdesoft', 'fmvaldebenito@udc.edu.ar', '$2y$10$8Z6b60RVcgegpVrv3qzi/OXn6zNsVJIHxr3/m/wFQhqgB289VtByu', NULL, '2016-11-16 18:10:58', '2016-11-16 18:23:06', 1, 'lio', 'fressi', '2000-12-31', 'Algo sdas', 'valdesoft.jpg');

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
  ADD CONSTRAINT `fk_comentarios_posts1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentarios_users1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_puntos_users2` FOREIGN KEY (`id_autor`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
