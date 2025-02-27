-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 27, 2025 at 03:07 AM
-- Server version: 11.4.2-MariaDB-log
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apitienda`
--

-- --------------------------------------------------------

--
-- Table structure for table `autorizacion_tokens`
--

CREATE TABLE `autorizacion_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `usuario_id` int(11) UNSIGNED NOT NULL,
  `token` text NOT NULL,
  `expira_el` timestamp NOT NULL,
  `esta_activo` tinyint(1) NOT NULL DEFAULT 1,
  `tipo` enum('access','refresh') NOT NULL,
  `creado_el` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `autorizacion_tokens`
--

INSERT INTO `autorizacion_tokens` (`id`, `usuario_id`, `token`, `expira_el`, `esta_activo`, `tipo`, `creado_el`) VALUES
(1, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODQ5MjQsImV4cCI6MTczOTMxMzcyNH0.Cbc8civP6r8cAafnNiFmw9s4ikxVPYF8WQXmcNFRNj8', '0000-00-00 00:00:00', 1, 'access', '2025-02-11 10:42:04'),
(2, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODQ5MjQsImV4cCI6MTczOTMxMzcyNH0.Cbc8civP6r8cAafnNiFmw9s4ikxVPYF8WQXmcNFRNj8', '0000-00-00 00:00:00', 1, 'refresh', '2025-02-11 10:42:04'),
(3, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODU0NjYsImV4cCI6MTczOTMxNDI2Nn0.TAMyZjcC9yycviQWHnbcSqx1JDV7tXnkLT6aQu9B6Zo', '0000-00-00 00:00:00', 1, 'access', '2025-02-11 10:51:06'),
(4, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODU0NjYsImV4cCI6MTczOTg5MDI2Nn0.t_aXuF1oFvk3iwrOp_U5cHSr0oZ1asFkJy1UangOEv4', '0000-00-00 00:00:00', 1, 'refresh', '2025-02-11 10:51:06'),
(5, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODU2NjksImV4cCI6MTczOTMxNDQ2OX0.8qmp1xsPjTQCcOgPuUMDcS0F3fxbdR12JMa-Ing2lJg', '2025-02-11 22:54:29', 1, 'access', '2025-02-11 10:54:29'),
(6, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODU2NjksImV4cCI6MTczOTg5MDQ2OX0.Qy61fsiZIs6T3k8on69DSdEc_gwCtNVWiCeOo1cwSDQ', '2025-02-18 14:54:29', 0, 'refresh', '2025-02-11 10:54:29'),
(7, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODU4OTMsImV4cCI6MTczOTMxNDY5M30.VUPfTqeCryNI00eGtnOsOtOxJwUHsVxd0PEaDwYrwD4', '2025-02-11 22:58:13', 1, 'access', '2025-02-11 10:58:13'),
(8, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODYwMTAsImV4cCI6MTczOTMxNDgxMH0.Ypd5T4vuuaiXcowRi1zbXQJnQnBvc6nPyl8lzvYzVb0', '2025-02-11 23:00:10', 1, 'access', '2025-02-11 11:00:10'),
(9, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODczMDksImV4cCI6MTczOTMxNjEwOX0.hjQ69JUP65eRhfs7f8YiajvE7rru-bFPZvXG7EEv7Og', '2025-02-11 23:21:49', 1, 'access', '2025-02-11 11:21:49'),
(10, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODczMDksImV4cCI6MTczOTg5MjEwOX0.PAyc8uDN5jptNncgbM2vg0W3BQMqhXfDRKD-Du4loN8', '2025-02-18 15:21:49', 1, 'refresh', '2025-02-11 11:21:49'),
(11, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODczOTMsImV4cCI6MTczOTMxNjE5M30.kDDYLMqIFb00zfCHgRAvEjWpokbaN32NitSvCqZo__0', '2025-02-11 23:23:13', 1, 'access', '2025-02-11 11:23:13'),
(12, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkyODczOTMsImV4cCI6MTczOTg5MjE5M30.2vKG38_HC1iBdu_g92BlivlmaXDFqP6yZxvmWpug9io', '2025-02-18 15:23:13', 1, 'refresh', '2025-02-11 11:23:13'),
(13, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMjk2MjgsImV4cCI6MTczOTM1ODQyOH0.M_BRGgsGW602rQZhsfSxsFfEuncW0xPXuMQ_4G7jKZA', '2025-02-12 11:07:08', 1, 'access', '2025-02-11 23:07:08'),
(14, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMjk2MjgsImV4cCI6MTczOTkzNDQyOH0.FsXDmCxRgHREMBbNkUxn07iJflkZ-vgvEVqVCUYo-fY', '2025-02-19 03:07:08', 1, 'refresh', '2025-02-11 23:07:08'),
(15, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMjk2MzIsImV4cCI6MTczOTM1ODQzMn0.eJgfo3HSNdXo9i_lBr8FONzcxp7GzfCip9Mzd9LjDxI', '2025-02-12 11:07:12', 1, 'access', '2025-02-11 23:07:12'),
(16, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMjk2MzIsImV4cCI6MTczOTkzNDQzMn0.lVkcIVlMD-JPt68VxoaEkZToeBQt6cNAsQtmGzDnrLs', '2025-02-19 03:07:12', 1, 'refresh', '2025-02-11 23:07:12'),
(17, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMjk3OTMsImV4cCI6MTczOTM1ODU5M30.dviBDZlAxB4ii5P5ifpLNCCYl9tycqS2YMkiZHTRUuI', '2025-02-12 11:09:53', 1, 'access', '2025-02-11 23:09:53'),
(18, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMjk3OTMsImV4cCI6MTczOTkzNDU5M30.sAP5VGqZ6wRQEdOtkLFXLzI2JuchhO32LV5-9ZVONIs', '2025-02-19 03:09:53', 1, 'refresh', '2025-02-11 23:09:53'),
(19, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMjk5MjgsImV4cCI6MTczOTM1ODcyOH0.gc1wX_ADHYChT5F4HFuY3SzUiDYhuWIXylUFX3s6g6o', '2025-02-12 11:12:08', 1, 'access', '2025-02-11 23:12:08'),
(20, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMjk5MjgsImV4cCI6MTczOTkzNDcyOH0.9yLpVqwK7mWOzhremuVi5WKQhknFVGzilB1UXVvayrQ', '2025-02-19 03:12:08', 1, 'refresh', '2025-02-11 23:12:08'),
(21, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzAxOTEsImV4cCI6MTczOTM1ODk5MX0.94gvJS6NsjRlwvKcyaLSYrxudDM912OQRJNSt-YGwQ4', '2025-02-12 11:16:31', 1, 'access', '2025-02-11 23:16:31'),
(22, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzAxOTEsImV4cCI6MTczOTkzNDk5MX0.No6cL5IXa2Ru1lqZwulAyULdRtfURX8pgrelEYWQrxM', '2025-02-19 03:16:31', 1, 'refresh', '2025-02-11 23:16:31'),
(23, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzA4MTQsImV4cCI6MTczOTM1OTYxNH0.nkahsh3nN9Deh0AMZHZlJgdpbOvwI_BKiiZXkhaDLyI', '2025-02-12 11:26:54', 1, 'access', '2025-02-11 23:26:54'),
(24, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzA4MTQsImV4cCI6MTczOTkzNTYxNH0.MWvx-JU3670qZbF732ICKF1F75AoM-oZhpZa-T0uhBU', '2025-02-19 03:26:54', 1, 'refresh', '2025-02-11 23:26:54'),
(25, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzA4NzIsImV4cCI6MTczOTM1OTY3Mn0.aXVcv0ARy73l64DqHHbM3Pob7HHnNkRln5xCvmLRzoU', '2025-02-12 11:27:52', 1, 'access', '2025-02-11 23:27:52'),
(26, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzA4NzIsImV4cCI6MTczOTkzNTY3Mn0.woVfSrbwiPXgfIk4IV3RSsbq1m3YXRskYaQoDsItmHQ', '2025-02-19 03:27:52', 1, 'refresh', '2025-02-11 23:27:52'),
(27, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzA4OTMsImV4cCI6MTczOTM1OTY5M30.8dpiVnupYuIbHq2kRI8Y4hkgrCYHGjge6rx09tymRZQ', '2025-02-12 11:28:13', 1, 'access', '2025-02-11 23:28:13'),
(28, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzA4OTMsImV4cCI6MTczOTkzNTY5M30.HB-sNJzt9_CaviKGpxEsJqXk5U1XQbo2pIBRcDqed5Y', '2025-02-19 03:28:13', 1, 'refresh', '2025-02-11 23:28:13'),
(29, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzEwMDgsImV4cCI6MTczOTM1OTgwOH0.-Ppql3ag3UJJzRfDZvC1ISUU_WIG-1H-rMsMFvfx50g', '2025-02-12 11:30:08', 1, 'access', '2025-02-11 23:30:08'),
(30, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzEwMDgsImV4cCI6MTczOTkzNTgwOH0.xRyL73qkDmG4tOGr8mLVENGb9eCrqG2uduj7KdJNj08', '2025-02-19 03:30:08', 1, 'refresh', '2025-02-11 23:30:08'),
(31, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzEwODEsImV4cCI6MTczOTM1OTg4MX0.HK2LYKvXRSInnVGSUpKz72RvlJ7xVy9n_XLW6GExXc4', '2025-02-12 11:31:21', 1, 'access', '2025-02-11 23:31:21'),
(32, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzEwODEsImV4cCI6MTczOTkzNTg4MX0.zT5DUQ_pr-9gc3u0b1eChyVFYq2a1gxqv5y2pZi77AM', '2025-02-19 03:31:21', 1, 'refresh', '2025-02-11 23:31:21'),
(33, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzEyMzYsImV4cCI6MTczOTM2MDAzNn0.k0Wjl5sRwm-3aqq_VyF0uFVNRpFXRgXjx-wB1DN9ssc', '2025-02-12 11:33:56', 1, 'access', '2025-02-11 23:33:56'),
(34, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzEyMzYsImV4cCI6MTczOTkzNjAzNn0.KtcXYlEH8qr22TxsIn3RiUMDyuQQSIJyZ09ojSHg4tA', '2025-02-19 03:33:56', 1, 'refresh', '2025-02-11 23:33:56'),
(35, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzEzMTcsImV4cCI6MTczOTM2MDExN30.FpFgGwazS8Xf35_NW6hrHB3iIJXEC4i9IbVstKbgOCg', '2025-02-12 11:35:17', 1, 'access', '2025-02-11 23:35:17'),
(36, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzEzMTcsImV4cCI6MTczOTkzNjExN30.jKbq5S0d-lGGOez6gSwzihdHv-F4vp29bxixKmW_b3M', '2025-02-19 03:35:17', 1, 'refresh', '2025-02-11 23:35:17'),
(37, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzE1NDMsImV4cCI6MTczOTM2MDM0M30.-k2caT-k1BSwimo3xwAOAJK-sC-r50dGQIH85Im7P84', '2025-02-12 11:39:03', 1, 'access', '2025-02-11 23:39:03'),
(38, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzE1NDMsImV4cCI6MTczOTkzNjM0M30.lGrJ-LggiWFX1qifBHxl0t6oEq0omQMoccdrdPY2RdE', '2025-02-19 03:39:03', 1, 'refresh', '2025-02-11 23:39:03'),
(39, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzE1OTIsImV4cCI6MTczOTM2MDM5Mn0.WN5vNBSDYA8_CLCJ7l7kd-nDx5BELaszdJO9e-b3bEk', '2025-02-12 11:39:52', 1, 'access', '2025-02-11 23:39:52'),
(40, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzE1OTIsImV4cCI6MTczOTkzNjM5Mn0.NmFEppu6w3t8FR_xI7zHbDpH4V4bsXfaq3LQW-Lv4mU', '2025-02-19 03:39:52', 1, 'refresh', '2025-02-11 23:39:52'),
(41, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzE2NDMsImV4cCI6MTczOTM2MDQ0M30.gYBmTZbmFCohu3MLshER4Eye4QYmHTy84xJ0Vd-L_kY', '2025-02-12 11:40:43', 1, 'access', '2025-02-11 23:40:43'),
(42, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzMzE2NDMsImV4cCI6MTczOTkzNjQ0M30.p-2d7bgViX2LE-ZKtKMEoz59Wya0CaoZkzOZOr2F328', '2025-02-19 03:40:43', 1, 'refresh', '2025-02-11 23:40:43'),
(43, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzODYzOTYsImV4cCI6MTczOTQxNTE5Nn0.79jNyEvf-ATqWvrHarIC4Hy8eBFqfrAXe381n8RYRy0', '2025-02-13 02:53:16', 1, 'access', '2025-02-12 14:53:16'),
(44, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzODYzOTYsImV4cCI6MTczOTk5MTE5Nn0.kWhhQZXDS8pVukMavTMKlywUZFWTONvZXtQuO5sqxcM', '2025-02-19 18:53:16', 1, 'refresh', '2025-02-12 14:53:16'),
(45, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzOTE3NTMsImV4cCI6MTczOTQyMDU1M30.mOHwTisGH41fH_JF9zJ8zlf3MoxKuU2GO9GvaMjiBzY', '2025-02-13 04:22:33', 1, 'access', '2025-02-12 16:22:33'),
(46, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzOTE3NTMsImV4cCI6MTczOTk5NjU1M30.0jqjhZ21DI_TQT_Xyur4f4FhaeoPETAM-Y92e3SYlD4', '2025-02-19 20:22:33', 1, 'refresh', '2025-02-12 16:22:33'),
(47, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzOTE3OTUsImV4cCI6MTczOTQyMDU5NX0.xX1YOCWrfmxrkv_nsY293IMNwqbtRSPG2HNMDy3XuAk', '2025-02-13 04:23:15', 1, 'access', '2025-02-12 16:23:15'),
(48, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzOTE3OTUsImV4cCI6MTczOTk5NjU5NX0.-wZIAVoiS3cRMOikGtyshMI_CWvpsNQ8DECzRFwymic', '2025-02-19 20:23:15', 1, 'refresh', '2025-02-12 16:23:15'),
(49, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzOTU1NzEsImV4cCI6MTczOTQyNDM3MX0.878nIjEYpPd-TTeZkjwb8iO0EXelnCkj8Wbf8Y9y6CE', '2025-02-13 05:26:11', 1, 'access', '2025-02-12 17:26:11'),
(50, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzOTU1NzEsImV4cCI6MTc0MDAwMDM3MX0.yc8aIFk-GORASxW1MZ-zcCifiBD8SnmfhZrpohkolPk', '2025-02-19 21:26:11', 1, 'refresh', '2025-02-12 17:26:11'),
(51, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzOTg2NDQsImV4cCI6MTczOTQyNzQ0NH0.ndCIF5pk6rgrqb4BBK9Z3YBfVqTZ4sR1Vt_-7nJQhv4', '2025-02-13 06:17:24', 1, 'access', '2025-02-12 18:17:24'),
(52, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3MzkzOTg2NDQsImV4cCI6MTc0MDAwMzQ0NH0.Luk7IVVssM68jE9KpU4c0rpeNOinpC1kWi6LPNP1Vog', '2025-02-19 22:17:24', 1, 'refresh', '2025-02-12 18:17:24'),
(53, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3Mzk0MDQ2OTUsImV4cCI6MTczOTQzMzQ5NX0.xqIbqYYaEuOyNgRslGacNpkEfTAE2a9NOb_lchdnz_c', '2025-02-13 07:58:15', 1, 'access', '2025-02-12 19:58:15'),
(54, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3Mzk0MDQ2OTUsImV4cCI6MTc0MDAwOTQ5NX0.7hXqHqjyjxlUMjpWTHjFPswUx2YyjvEj4cERHtPNRoI', '2025-02-19 23:58:15', 1, 'refresh', '2025-02-12 19:58:15'),
(55, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3Mzk0MDQ3NTAsImV4cCI6MTczOTQzMzU1MH0.cod6umsMRm2DKxHRytHLo1DaKt8GsIJMsXEX2X2eioA', '2025-02-13 07:59:10', 1, 'access', '2025-02-12 19:59:10'),
(56, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3Mzk0MDQ3NTAsImV4cCI6MTc0MDAwOTU1MH0.BFhSubPjxLNKWVnsWOtzQIiix6DsC-PcIgYBzdfkSyM', '2025-02-19 23:59:10', 1, 'refresh', '2025-02-12 19:59:10'),
(57, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3Mzk4OTI0NDEsImV4cCI6MTczOTkyMTI0MX0.uxTHskIe7prLPhgOapqQsmTeDzjEbgZZo5EF5BQveCE', '2025-02-18 23:27:21', 1, 'access', '2025-02-18 11:27:21'),
(58, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJpYXQiOjE3Mzk4OTI0NDEsImV4cCI6MTc0MDQ5NzI0MX0.9Djk1xAKkQuL5Eel3OSB9zKm1Nx-0fWpT3hliqbiy7E', '2025-02-25 15:27:21', 1, 'refresh', '2025-02-18 11:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) UNSIGNED NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `creado_el` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `estado`, `creado_el`) VALUES
(1, 'Electrónica', 'activo', '2025-02-11 11:23:47'),
(2, 'Ropa', 'activo', NULL),
(3, 'Electrodomésticos', 'activo', NULL),
(4, 'Tecnología', 'activo', NULL),
(5, 'Herramientas', 'activo', NULL),
(6, 'Juguetes', 'activo', NULL),
(7, 'Televisoress', 'activo', '2025-02-12 16:51:44'),
(11, 'Electrónica 2', 'activo', '2025-02-18 11:28:11'),
(12, 'Electrónica 3', 'activo', '2025-02-18 11:28:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(4, '2025-02-07-040955', 'App\\Database\\Migrations\\CreateUsuariosTable', 'default', 'App', 1739284890, 1),
(5, '2025-02-07-041004', 'App\\Database\\Migrations\\CreateCategoriasTable', 'default', 'App', 1739284890, 1),
(6, '2025-02-07-041010', 'App\\Database\\Migrations\\CreateProductosTable', 'default', 'App', 1739284890, 1),
(7, '2025-02-11-142407', 'App\\Database\\Migrations\\CreateAutorizacionTokenTable', 'default', 'App', 1739284890, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`imagen`)),
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria_id` int(11) UNSIGNED NOT NULL,
  `creado_el` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `titulo`, `descripcion`, `imagen`, `precio`, `stock`, `categoria_id`, `creado_el`) VALUES
(1, 'Polera de Varon Juvenil', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.', '[\"https:\\/\\/i.imgur.com\\/QkIa5tT.jpeg\"]', '45.00', 10, 1, NULL),
(2, 'Zapato de Varon ', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.', '[\"https:\\/\\/batabolivia.vtexassets.com\\/arquivos\\/ids\\/188251-800-auto?v=638169225646400000&width=800&height=auto&aspect=true\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcReBIfp0sXmSsJpmD5sXMeltH9LuE-XP7o8YcABeP2jQxH5gPai1PP8Dmql3Z8YWV3xlnM&usqp=CAU\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcQ3mtDoRLyapWYXfepaVC5qdm5yXSnA3SeC2z9qWNv3x7ORdJ3XFiH2tUUiovuQGJRR6P8&usqp=CAU\"]', '245.00', 3, 1, NULL),
(3, 'Vestido de Dama ', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.', '[\"https:\\/\\/cdnx.jumpseller.com\\/kadrihel1\\/image\\/39075964\\/resize\\/635\\/635?1693415938\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcRh_U-mBlGNXylsj4G7Ryqd_m_l_P_OHIhUzb4UE5vF8JZ_X12lHvOpDNP88m7pTsqrzpw&usqp=CAU\"]', '370.00', 3, 1, NULL),
(4, 'Celular HONOR X8B 8G 256G Silver', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.', '[\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcSi863HW40r_Zwpme0Kb30B5mNn1hNPEA4-YrcfNgxaVJ8Ep7U9GnOdzflQ1nf_MjTwYV4&usqp=CAU\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcQL5sDd2fo26CMjtnFle74JoXidBozHwvvesHxqvUXr7a2a5rx4SS0GTwCUofpx7H1jQQQ&usqp=CAU\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcSUUPawsGykr5B2fZoLBlqnV2qWQBdV1AdOMfArGnhYCRf2m05BLGtPB8JOeETyc9r1q5Q&usqp=CAU\"]', '4450.00', 7, 3, NULL),
(5, 'CELULAR XIAOMI POCO M5S 6+128GB GRIS ', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellend', '[\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcTD0AWsDilrzHzfPAFv2aAiiA_CRztIlXsJGHeWhy_mqkBnGhn8pRXdpe8uWgQhI43Icc0&usqp=CAU\",\"https:\\/\\/www.tiendaamiga.com.bo\\/media\\/catalog\\/product\\/cache\\/deb88dadd509903c96aaa309d3e790dc\\/c\\/e\\/celular_xiaomi_poco_m5s_gris.jpg\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcQFti6igTPTpDq7cYhXq3zScK9X2hkTmDtXUhOE6bpyYGi_CsmRYS3P2QPw6qVXIlR01RU&usqp=CAU\"]', '2145.00', 4, 3, NULL),
(6, 'CELULAR IPHONE 13 128GB NEGRO ', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.', '[\"https:\\/\\/www.tiendaamiga.com.bo\\/media\\/catalog\\/product\\/cache\\/deb88dadd509903c96aaa309d3e790dc\\/e\\/0\\/e06898__celular_iphone_13_128gb_negro.jpg\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcTuJpKhrDdwFQKQm3Peo8J-maulVP9jJ3-SBSeOwu9L_8xyJIHRIcb5vAgU3J9GgFVpCaw&usqp=CAU\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcQ4GMFAUZw7oohQjo2ymdP6zRknNL0kP80wErzMQnA8utxqw7nin9CD7J1savvD7sNQywU&usqp=CAU\"]', '7980.00', 3, 3, NULL),
(7, 'TALADRO ELÉCTRICO – 400W TOLSEN ', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.', '[\"https:\\/\\/cablenortesrl.com\\/wp-content\\/uploads\\/2023\\/07\\/79500-e1584563286239.jpg\"]', '245.00', 10, 4, NULL),
(8, 'Juego de Herramientas Racing 150pzas ', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.', '[\"https:\\/\\/galba.com.bo\\/wp-content\\/uploads\\/2021\\/11\\/ST0145.jpg\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcTUq8ylia5Lk67LEpRWGZZy8EqpWrt2ICRFsQ9DgSDTQKT-hJtht5Ac3BA8kjtRxhnR0Ik&usqp=CAU\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcS2uPKaWhF5UAJLNvrjyY_l1a8q_TyNYESefCnuncP1i_cJ17K14lQa_sBY4ka0aGmEU-g&usqp=CAU\"]', '725.00', 3, 4, NULL),
(9, 'Coche De Juguete Rojo Con Mando, Modelo Audi Tt Rs Vidax', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.', '[\"https:\\/\\/storage.googleapis.com\\/catalog-pictures-carrefour-es\\/catalog\\/pictures\\/hd_510x_\\/8718475931409_1.jpg\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcQsUy2xxLa49gGsdL2PrPaCYHL42hVuDRn-BhmcBYQGv36c4icgi-tAw2ZCtlcnNtwma-s&usqp=CAU\"]', '1645.00', 1, 5, NULL),
(10, 'Pelota Adidas Unisex Ip1648', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellend', '[\"https:\\/\\/oechsle.vteximg.com.br\\/arquivos\\/ids\\/17473871-998-998\\/2560104.jpg?v=638505967940100000\"]', '75.00', 16, 5, NULL),
(11, 'audifonos Sony', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '[\"https://sony.scene7.com/is/image/sonyglobalsolutions/wh-ch520_Primary_image?$categorypdpnav$&fmt=png-alpha\"]', '23123.00', 2, 1, '2025-02-12 14:54:14'),
(12, 'Audifonos inalambricos huawei', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '[\"https://sony.scene7.com/is/image/sonyglobalsolutions/Primary_image_Pink-1?$mediaCarouselSmall$&fmt=png-alpha\",\"https://www.sony.com.bo/image/a900b53164683e1fc98b8eefb9b6c406?fmt=png-alpha&wid=660&hei=660\"]', '225.00', 10, 1, '2025-02-12 15:06:39'),
(22, 'Audifonos inalambricos sony', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '[\"https://aiwalatinoamerica.com/wp-content/uploads/2023/11/AWTWSD4W-01-1024x1024.webp\"]', '265.00', 0, 1, '2025-02-12 15:12:11'),
(23, 'Audifonos inalambricos sony', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '[\"https://assets.bose.com/content/dam/cloudassets/Bose_DAM/Web/consumer_electronics/global/products/headphones/qc35_ii/product_silo_images/qc35_ii_rose_gold_EC_hero.PNG/_jcr_content/renditions/cq5dam.web.1280.1280.png\",\"https://www.sony.com.bo/image/a900b53164683e1fc98b8eefb9b6c406?fmt=png-alpha&wid=660&hei=660\"]', '225.00', 5, 1, '2025-02-12 15:42:22'),
(24, 'Audifonos inalambricos sony', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '[\"https://www.sony.com.bo/image/a900b53164683e1fc98b8eefb9b6c406?fmt=png-alpha&wid=660&hei=660\"]', '225.00', 10, 1, '2025-02-12 15:44:38');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `avatar` varchar(255) DEFAULT NULL,
  `creado_el` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`, `estado`, `avatar`, `creado_el`) VALUES
(1, 'administrador@gmail.com', '$2y$10$fy6xfbQmGP2woMyy140asOetJGYWC1v0WvDn5g9LJQTHCWE.RV5JK', 'activo', NULL, '2025-02-11 10:41:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autorizacion_tokens`
--
ALTER TABLE `autorizacion_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autorizacion_tokens_usuario_id_foreign` (`usuario_id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_categoria_id_foreign` (`categoria_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autorizacion_tokens`
--
ALTER TABLE `autorizacion_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `autorizacion_tokens`
--
ALTER TABLE `autorizacion_tokens`
  ADD CONSTRAINT `autorizacion_tokens_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
