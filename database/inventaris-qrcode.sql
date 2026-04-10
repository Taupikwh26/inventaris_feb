-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2026 at 07:40 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris-qrcode`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangs`
--

CREATE TABLE `barangs` (
  `id` bigint UNSIGNED NOT NULL,
  `kd_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nm_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL DEFAULT '0',
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_penambahan` date NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `merk_id` bigint UNSIGNED NOT NULL,
  `lokasi_id` bigint UNSIGNED NOT NULL,
  `keterangan_lokasi` text COLLATE utf8mb4_unicode_ci,
  `qr_code_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangs`
--

INSERT INTO `barangs` (`id`, `kd_barang`, `gambar`, `nm_barang`, `jumlah`, `deskripsi`, `tgl_penambahan`, `kategori_id`, `merk_id`, `lokasi_id`, `keterangan_lokasi`, `qr_code_path`, `created_at`, `updated_at`) VALUES
(1, 'BRG-606650', 'gambar//69d230d2ad5b8.jpg', 'Toyota Inova', 1, 'D 1440 PAS', '2026-04-05', 2, 2, 4, NULL, NULL, '2026-04-05 00:49:48', '2026-04-05 02:54:08'),
(2, 'BRG-071357', 'gambar//69d2310ad52ea.png', 'Toyota Rush', 1, 'D 1556 AIX', '2026-04-05', 2, 2, 6, NULL, NULL, '2026-04-05 00:50:38', '2026-04-05 02:54:14'),
(3, 'D 1718 AGP', 'gambar//69d2314f228a4.jpg', 'Toyota Avanza', 1, 'D 1718 AGP', '2026-04-05', 2, 2, 3, NULL, NULL, '2026-04-05 00:54:36', '2026-04-05 02:54:23'),
(5, 'D 3723 JQ', 'gambar//69d231b02193c.jpg', 'Honda Revo', 3, 'D 3723 JQ,  D 4098 MA, D 3845 IE', '2026-04-05', 4, 4, 3, NULL, NULL, '2026-04-05 01:15:49', '2026-04-05 02:56:00'),
(8, 'D 6657 AEL', 'gambar//69d232476978d.png', 'Honda Beat', 2, 'D 6657 AEL', '2026-04-05', 4, 4, 3, NULL, NULL, '2026-04-05 02:58:31', '2026-04-05 02:58:39'),
(10, 'C603', 'gambar//69d234bbaf1ea.png', 'AC Central DAIKIN', 1, 'Baru', '2026-04-05', 3, 5, 4, NULL, 'qrcode/C603_1775384292.png', '2026-04-05 03:08:59', '2026-04-05 03:18:12'),
(11, 'C603', 'gambar//69d234efa7150.png', 'AC Central DAIKIN', 1, 'Baru', '2026-04-05', 3, 5, 6, NULL, 'qrcode/C603_1775384277.png', '2026-04-05 03:09:51', '2026-04-05 03:17:57'),
(12, 'C603', 'gambar//69d235102d789.png', 'AC Central DAIKIN', 1, 'Baru', '2026-04-05', 3, 5, 5, NULL, 'qrcode/C603_1775384270.png', '2026-04-05 03:10:24', '2026-04-05 03:17:50'),
(13, 'C603', 'gambar//69d2352d087d5.png', 'AC Central DAIKIN', 1, 'Baru', '2026-04-05', 3, 5, 7, NULL, 'qrcode/C603_1775384256.png', '2026-04-05 03:10:53', '2026-04-05 03:17:36'),
(14, 'C603', 'gambar//69d2357116060.png', 'AC Central DAIKIN', 1, 'Baru', '2026-04-05', 3, 5, 8, NULL, NULL, '2026-04-05 03:12:01', '2026-04-05 03:12:01'),
(17, 'C603', 'gambar//69d236b66e641.png', 'AC Central DAIKIN', 1, 'Baru', '2026-04-05', 3, 5, 9, NULL, 'qrcode/C603_1775384246.png', '2026-04-05 03:17:26', '2026-04-05 03:17:26'),
(19, 'C603', 'gambar//69d23b1b272a8.png', 'AC Central DAIKIN', 1, 'Baru', '2026-04-05', 3, 5, 12, NULL, 'qrcode/C603_1775385371.png', '2026-04-05 03:36:11', '2026-04-05 03:36:11'),
(20, 'C603', 'gambar//69d23b35678e4.png', 'AC Central DAIKIN', 1, '-', '2026-04-05', 5, 5, 13, NULL, 'qrcode/C603_1775385397.png', '2026-04-05 03:36:37', '2026-04-05 03:41:00'),
(21, 'C603', 'gambar//69d23b66c8e0e.png', 'AC Central DAIKIN', 1, '-', '2026-04-05', 3, 5, 14, NULL, 'qrcode/C603_1775385446.png', '2026-04-05 03:37:26', '2026-04-05 03:37:26'),
(22, 'C603', 'gambar//69d23b7f45276.png', 'AC Central DAIKIN', 3, '-', '2026-04-05', 3, 5, 15, NULL, 'qrcode/C603_1775385471.png', '2026-04-05 03:37:51', '2026-04-05 03:38:29'),
(23, 'C603', 'gambar//69d23b9c76fe4.png', 'AC Central DAIKIN', 4, '-', '2026-04-05', 3, 5, 17, NULL, 'qrcode/C603_1775385500.png', '2026-04-05 03:38:20', '2026-04-05 03:38:20'),
(24, 'C603', 'gambar//69d23bc78b2db.png', 'AC Central DAIKIN', 3, '-', '2026-04-05', 3, 5, 18, NULL, 'qrcode/C603_1775385543.png', '2026-04-05 03:39:03', '2026-04-05 03:39:03'),
(25, 'C603', 'gambar//69d23bded71f3.png', 'AC Central DAIKIN', 1, '-', '2026-04-05', 3, 5, 19, NULL, 'qrcode/C603_1775385566.png', '2026-04-05 03:39:26', '2026-04-05 03:39:26'),
(26, 'C603', 'gambar//69d23bdf47dea.png', 'AC Central DAIKIN', 1, '-', '2026-04-05', 3, 5, 19, NULL, 'qrcode/C603_1775385567.png', '2026-04-05 03:39:27', '2026-04-05 03:39:27'),
(27, 'C603', 'gambar//69d23ca8a8d51.jfif', 'AC Changhong', 2, '1 PK', '2026-04-05', 3, 18, 31, NULL, 'qrcode/C603_1775385768.png', '2026-04-05 03:42:48', '2026-04-05 03:44:30'),
(28, 'C603', 'gambar//69d23d080fd90.jfif', 'AC Changhong', 1, '1.5 PK', '2026-04-05', 3, 18, 31, NULL, 'qrcode/C603_1775385864.png', '2026-04-05 03:44:24', '2026-04-05 03:44:24'),
(29, 'C603', 'gambar//69d23d89dcbe4.jpg', 'AC Nasional', 1, '2 PK', '2026-04-05', 3, 17, 29, NULL, 'qrcode/C603_1775385993.png', '2026-04-05 03:46:33', '2026-04-05 03:46:33'),
(30, 'C603', 'gambar//69d23dfd0042d.jpg', 'AC Panasonic', 1, '2 PK', '2026-04-05', 3, 14, 20, NULL, 'qrcode/C603_1775386109.png', '2026-04-05 03:48:29', '2026-04-05 03:49:28'),
(31, 'C603', 'gambar//69d23e2f6f769.jpg', 'AC Panasonic', 2, '2 PK', '2026-04-05', 3, 14, 32, NULL, 'qrcode/C603_1775386159.png', '2026-04-05 03:49:19', '2026-04-05 03:49:19'),
(32, 'C603', 'gambar//69d23e6c8b506.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-05', 3, 14, 21, NULL, 'qrcode/C603_1775386220.png', '2026-04-05 03:50:20', '2026-04-05 03:50:20'),
(33, 'C603', 'gambar//69d23e8c46caf.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-05', 3, 14, 22, NULL, 'qrcode/C603_1775386252.png', '2026-04-05 03:50:52', '2026-04-05 03:50:52'),
(34, 'C603', 'gambar//69d23eb502cce.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-05', 3, 14, 23, NULL, 'qrcode/C603_1775386293.png', '2026-04-05 03:51:33', '2026-04-05 03:51:33'),
(35, 'C603', 'gambar//69d23ed928b53.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-05', 3, 14, 25, NULL, 'qrcode/C603_1775386329.png', '2026-04-05 03:52:09', '2026-04-05 03:52:09'),
(36, 'C603', 'gambar//69d23ef5cb37a.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-05', 3, 14, 24, NULL, 'qrcode/C603_1775386357.png', '2026-04-05 03:52:37', '2026-04-05 03:52:37'),
(37, 'C603', 'gambar//69d23f43eeeeb.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-05', 3, 14, 26, NULL, 'qrcode/C603_1775386435.png', '2026-04-05 03:53:56', '2026-04-05 03:53:56'),
(38, 'C603', 'gambar//69d23f5d79b75.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-05', 3, 14, 27, NULL, 'qrcode/C603_1775386461.png', '2026-04-05 03:54:21', '2026-04-05 03:54:21'),
(39, 'C603', 'gambar//69d23f763a512.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-05', 3, 14, 28, NULL, 'qrcode/C603_1775386486.png', '2026-04-05 03:54:46', '2026-04-05 03:54:46'),
(40, 'C603', 'gambar//69d23fe668f40.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-05', 3, 14, 30, NULL, 'qrcode/C603_1775386598.png', '2026-04-05 03:56:38', '2026-04-05 03:56:38'),
(41, 'A304', 'gambar//69d24073f198d.png', 'Alat Penghancur Kertas', 1, '-', '2026-04-05', 3, 36, 26, NULL, 'qrcode/A304_1775386739.png', '2026-04-05 03:59:00', '2026-04-05 03:59:00'),
(42, 'A304', 'gambar//69d2408fee5e8.png', 'Alat Penghancur Kertas', 1, '-', '2026-04-05', 3, 36, 27, NULL, 'qrcode/A304_1775386767.png', '2026-04-05 03:59:28', '2026-04-05 03:59:45'),
(43, 'C603', 'gambar//69d339ad11fae.png', 'AC Central DAIKIN', 1, 'Baru', '2026-04-06', 3, 5, 4, NULL, 'qrcode/C603_1775450541.png', '2026-04-05 21:42:22', '2026-04-05 21:42:22'),
(44, 'C603', 'gambar//69d339e9bafca.jpg', 'AC Nasional', 1, '2 PK', '2026-04-06', 3, 17, 33, NULL, 'qrcode/C603_1775450601.png', '2026-04-05 21:43:21', '2026-04-05 21:43:21'),
(45, 'C603', 'gambar//69d33a42ed01e.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 36, NULL, 'qrcode/C603_1775450690.png', '2026-04-05 21:44:51', '2026-04-05 21:44:51'),
(46, 'C603', 'gambar//69d33a7b0c36f.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 37, NULL, 'qrcode/C603_1775450747.png', '2026-04-05 21:45:47', '2026-04-05 21:45:47'),
(47, 'C603', 'gambar//69d33b675e896.jpg', 'AC Panasonic', 1, '1,2 PK', '2026-04-06', 3, 14, 38, NULL, 'qrcode/C603_1775450983.png', '2026-04-05 21:49:43', '2026-04-05 21:49:43'),
(48, 'C603', 'gambar//69d33b95546e7.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 39, NULL, 'qrcode/C603_1775451029.png', '2026-04-05 21:50:29', '2026-04-05 21:50:29'),
(49, 'C603', 'gambar//69d33bb6978dd.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 40, NULL, 'qrcode/C603_1775451062.png', '2026-04-05 21:51:02', '2026-04-05 21:51:02'),
(50, 'C603', 'gambar//69d33bed28503.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 42, NULL, 'qrcode/C603_1775451117.png', '2026-04-05 21:51:57', '2026-04-05 21:51:57'),
(51, 'C603', 'gambar//69d33c31bbbb8.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 43, NULL, 'qrcode/C603_1775451185.png', '2026-04-05 21:53:05', '2026-04-05 21:53:05'),
(52, 'C603', 'gambar//69d33c79f0a0f.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 53, NULL, 'qrcode/C603_1775451257.png', '2026-04-05 21:54:18', '2026-04-05 21:54:18'),
(53, 'C603', 'gambar//69d33ca71f90e.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 45, NULL, 'qrcode/C603_1775451303.png', '2026-04-05 21:55:03', '2026-04-05 21:55:03'),
(54, 'C603', 'gambar//69d33ca787001.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 45, NULL, 'qrcode/C603_1775451303.png', '2026-04-05 21:55:03', '2026-04-05 21:55:03'),
(55, 'C603', 'gambar//69d33ce1ec007.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 30, NULL, 'qrcode/C603_1775451361.png', '2026-04-05 21:56:01', '2026-04-05 21:56:01'),
(56, 'C603', 'gambar//69d33cffae193.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 47, NULL, 'qrcode/C603_1775451391.png', '2026-04-05 21:56:31', '2026-04-05 21:56:31'),
(57, 'C603', 'gambar//69d33d1b84a80.jpg', 'AC Panasonic', 1, '1,5 PK', '2026-04-06', 3, 14, 50, NULL, 'qrcode/C603_1775451419.png', '2026-04-05 21:56:59', '2026-04-05 21:56:59'),
(58, 'C603', 'gambar//69d344bc1c15c.jpg', 'AC Panasonic', 1, '2 PK', '2026-04-06', 3, 14, 35, NULL, 'qrcode/C603_1775453372.png', '2026-04-05 22:29:32', '2026-04-05 22:29:32'),
(59, 'C603', 'gambar//69d345683d846.jpg', 'AC Panasonic', 1, '2 PK', '2026-04-06', 3, 14, 41, NULL, 'qrcode/C603_1775453544.png', '2026-04-05 22:32:24', '2026-04-05 22:32:24'),
(60, 'C603', 'gambar//69d35a2379b4d.jpg', 'AC Panasonic', 1, '2 PK', '2026-04-06', 3, 14, 44, NULL, 'qrcode/C603_1775458851.png', '2026-04-06 00:00:51', '2026-04-06 00:00:51'),
(61, 'C603', 'gambar//69d35a4951a1b.jpg', 'AC Panasonic', 1, '2 PK', '2026-04-06', 3, 14, 48, NULL, 'qrcode/C603_1775458889.png', '2026-04-06 00:01:29', '2026-04-06 00:01:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint UNSIGNED NOT NULL,
  `analisis_perbaikan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelaporan_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_replies`
--

CREATE TABLE `feedback_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `feedback_replies` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedback_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint UNSIGNED NOT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

INSERT INTO `kategoris` (`id`, `kategori`, `created_at`, `updated_at`) VALUES
(2, 'Kendaraan Roda 4', '2026-04-05 00:26:54', '2026-04-05 00:26:54'),
(3, 'Bukan Bangunan Kelompok 1', '2026-04-05 00:27:05', '2026-04-05 00:27:05'),
(4, 'Kendaraan Roda 2', '2026-04-05 00:27:18', '2026-04-05 00:27:18'),
(5, 'Bukan Bangunan Kelompok 2', '2026-04-05 00:27:33', '2026-04-05 00:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `lokasis`
--

CREATE TABLE `lokasis` (
  `id` bigint UNSIGNED NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lokasis`
--

INSERT INTO `lokasis` (`id`, `lokasi`, `created_at`, `updated_at`) VALUES
(3, 'Perlengkapan RT | Lantai 1', '2026-04-05 00:28:22', '2026-04-05 00:28:22'),
(4, 'Dekan | Gedung Rektorat Lantai 4', '2026-04-05 00:28:32', '2026-04-05 00:28:32'),
(5, 'Wadek II | Gedung Rektorat Lantai 4', '2026-04-05 00:28:44', '2026-04-05 00:28:44'),
(6, 'Wadek I | Gedung Rektorat Lantai 4', '2026-04-05 00:28:57', '2026-04-05 00:28:57'),
(7, 'Wadek III | Gedung Rektorat Lantai 4', '2026-04-05 00:29:02', '2026-04-05 00:29:02'),
(8, 'Prodi Ilmu Ekonomi I Gedung Rektorat Lantai 4', '2026-04-05 00:29:11', '2026-04-05 00:29:11'),
(9, 'Prodi Akuntansi I Gedung Rektorat Lantai 4', '2026-04-05 00:29:22', '2026-04-05 00:29:22'),
(10, 'Prodi Manajemen I Gedung Rektorat Lantai 4', '2026-04-05 00:29:37', '2026-04-05 00:29:37'),
(11, 'Program Kelas Reguler Sore dan RPL. Gedung Rektorat Lt. 4', '2026-04-05 00:30:05', '2026-04-05 00:30:05'),
(12, 'Ruang Pertemuan I Gedung Rektorat Lt. 4', '2026-04-05 00:30:14', '2026-04-05 00:30:14'),
(13, 'Ruang Pertemuan II Gedung Rektorat Lt. 4', '2026-04-05 00:30:26', '2026-04-05 00:30:26'),
(14, 'Ruang Sekretaris Dekanat dan Staf Prodi, Gedung Rektorat Lt. 4', '2026-04-05 00:30:34', '2026-04-05 00:30:34'),
(15, 'Ruang Tunggu Tamu, Gedung Rektorat Lt. 4', '2026-04-05 00:30:43', '2026-04-05 00:30:43'),
(16, 'Ruang Makan dan Dapur, Gedung Rektorat Lt. 4', '2026-04-05 00:31:45', '2026-04-05 00:31:45'),
(17, 'Ruang DHMD Gedung Rektorat Lt. III', '2026-04-05 00:31:58', '2026-04-05 00:31:58'),
(18, 'Ruang Koridor  Lantai lt. III Gedung Rektorat', '2026-04-05 00:32:07', '2026-04-05 00:32:07'),
(19, 'Ruang Koridor  Lantai IV Gedung Rektorat', '2026-04-05 00:32:15', '2026-04-05 00:32:15'),
(20, 'Ruang Tata Usaha Lantai I Gedung Lama', '2026-04-05 00:32:30', '2026-04-05 00:32:30'),
(21, 'Ruang UPT Gugus Kendali Mutu dan Pengawasan Intrenal. UPT Syiar Islam dan Budaya Sunda', '2026-04-05 00:33:05', '2026-04-05 00:33:05'),
(22, 'Ruang  Kepegawaian Lantai I Gedung Lama', '2026-04-05 00:33:22', '2026-04-05 00:33:22'),
(23, 'Ruang  Pertemuan I gedung lama Lantai I Gedung Lama', '2026-04-05 00:33:36', '2026-04-05 00:33:36'),
(24, 'Ruang  SBA Akademik 2 Lantai I Gedung Lama', '2026-04-05 00:33:45', '2026-04-05 00:33:45'),
(25, 'Ruang SBA Akademik 1 Lantai I Gedung Lama', '2026-04-05 00:34:00', '2026-04-05 00:34:00'),
(26, 'Ruang SBA Anggaran dan Akuntansi Lantai I Gedung Lama', '2026-04-05 00:34:11', '2026-04-05 00:34:11'),
(27, 'Ruang  SBA Keuangan Lantai I Gedung Lama', '2026-04-05 00:34:20', '2026-04-05 00:34:20'),
(28, 'Ruang SBA Rumah Tangga Lantai I Gedung Lama', '2026-04-05 00:34:31', '2026-04-05 00:34:31'),
(29, 'Ruang  Dosen Wanita Lantai I Gedung Lama', '2026-04-05 00:34:40', '2026-04-05 00:34:40'),
(30, 'Ruang  UPT Pelatihan, Sertifikasi Profesi, dan Praktikum Lantai I Gedung Lama', '2026-04-05 00:34:53', '2026-04-05 00:34:53'),
(31, 'Ruang Mini Banking Lantai I Gedung Lama', '2026-04-05 00:35:05', '2026-04-05 00:35:05'),
(32, 'Ruang  Perpustakaan Lantai I Gedung Lama', '2026-04-05 00:35:14', '2026-04-05 00:35:14'),
(33, 'Ruang  GURU BESAR Lantai I Gedung Lama', '2026-04-05 00:35:22', '2026-04-05 00:35:22'),
(34, 'Ruang  Koridor Lt.I gedung Lama', '2026-04-05 00:35:28', '2026-04-05 00:35:28'),
(35, 'Ruang DHMD dan Ruang Tunggu Dosen Lt. II Gedung Lama', '2026-04-05 00:35:34', '2026-04-05 00:35:34'),
(36, 'Ruang Photpo Copy Lt. II Gedung Lama', '2026-04-05 00:35:41', '2026-04-05 00:35:41'),
(37, 'Ruang UPT Program Kelas International Lt. II Gedung Lama', '2026-04-05 00:35:47', '2026-04-05 00:35:47'),
(38, 'Ruang UPT Kerjasama Internasiona. Nasional Promosi dan Media Informasi', '2026-04-05 00:35:54', '2026-04-05 00:35:54'),
(39, 'Ruang Dosen Lt. II Gedung Lama', '2026-04-05 00:36:01', '2026-04-05 00:36:01'),
(40, 'Ruang UPT Kemahasiswaan dan Alumni (TRACER STUDY). UPT Kewirausahaan dan STUDENT CAREER CENTER', '2026-04-05 00:36:08', '2026-04-05 00:36:08'),
(41, 'Ruang Koperasi Karyawan Lt. II Gedung Lama', '2026-04-05 00:36:14', '2026-04-05 00:36:14'),
(42, 'Ruang UPT Akreditasi dan Penjamin Mutu Lt. II Gedung Lama', '2026-04-05 00:36:24', '2026-04-05 00:36:24'),
(43, 'Ruang Serbaguna I Lt. II Gedung Lama', '2026-04-05 00:36:30', '2026-04-05 00:36:30'),
(44, 'Ruang Pertemuan Tb. Hasanuddin Lt. II Gedung Lama', '2026-04-05 00:36:37', '2026-04-05 00:36:37'),
(45, 'Ruang UPT  Pusat Pengelolaan Jurnal dan Penerbitan Lt.II Gedung Lama', '2026-04-05 00:36:44', '2026-04-05 00:36:44'),
(46, 'Ruang UPT Pelatihan Sertivikasi Profesi dan Praktikum. Ruang Adm. Labatorium Lt.II G. Lama', '2026-04-05 00:36:50', '2026-04-05 00:36:50'),
(47, 'Ruang UPT Penelitian dan Pengabdian Kepada Masyarakat dan UPT Praktikum dan Pelatihan Bahasa Lt. II G. Lama', '2026-04-05 00:36:56', '2026-04-05 00:36:56'),
(48, 'Ruang FEB Channel Lt. II G. Lama', '2026-04-05 00:37:01', '2026-04-05 00:37:01'),
(49, 'Ruang  Koridor Lt.II gedung Lama', '2026-04-05 00:37:08', '2026-04-05 00:37:08'),
(50, 'Ruang UPT Ka Lab. Prodi Manajemen, Ekonomi Pembanguna dan Akuntansi Lt. III G. Lama', '2026-04-05 00:37:14', '2026-04-05 00:37:14'),
(51, 'Ruang Sekretariatan UPT Pusat Pegelolaan Praktikum Lt. III G. Lama', '2026-04-05 00:37:20', '2026-04-05 00:37:20'),
(52, 'Ruang  Koridor Lt.III gedung Lama', '2026-04-05 00:37:26', '2026-04-05 00:37:26'),
(53, 'Ruang Serbaguna II Lt. II Gedung Lama', '2026-04-05 21:53:42', '2026-04-05 21:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `merks`
--

CREATE TABLE `merks` (
  `id` bigint UNSIGNED NOT NULL,
  `merk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merks`
--

INSERT INTO `merks` (`id`, `merk`, `created_at`, `updated_at`) VALUES
(2, 'Toyota', '2026-04-05 00:37:56', '2026-04-05 00:37:56'),
(3, 'Mitsubishi', '2026-04-05 00:38:06', '2026-04-05 00:38:06'),
(4, 'Honda', '2026-04-05 00:38:12', '2026-04-05 00:38:12'),
(5, 'Daikin', '2026-04-05 00:38:25', '2026-04-05 00:38:25'),
(6, 'Sharp', '2026-04-05 00:38:41', '2026-04-05 00:38:41'),
(7, 'Polytron', '2026-04-05 00:38:48', '2026-04-05 00:38:48'),
(8, 'TCL', '2026-04-05 00:39:02', '2026-04-05 00:39:02'),
(9, 'Epson', '2026-04-05 00:39:24', '2026-04-05 00:39:24'),
(10, 'Brother', '2026-04-05 00:39:38', '2026-04-05 00:39:38'),
(11, 'Midea', '2026-04-05 00:40:11', '2026-04-05 00:40:11'),
(12, 'Soundbest', '2026-04-05 00:40:24', '2026-04-05 00:40:24'),
(13, 'Samsung', '2026-04-05 00:40:33', '2026-04-05 00:40:33'),
(14, 'Panasonic', '2026-04-05 00:41:04', '2026-04-05 00:41:04'),
(15, 'Canon', '2026-04-05 00:41:23', '2026-04-05 00:41:23'),
(16, 'HP Laser Jet', '2026-04-05 00:41:52', '2026-04-05 00:41:52'),
(17, 'Nasional', '2026-04-05 00:42:22', '2026-04-05 00:42:22'),
(18, 'Changhong', '2026-04-05 00:43:07', '2026-04-05 00:43:07'),
(19, 'Chitose', '2026-04-05 00:43:32', '2026-04-05 00:43:32'),
(20, 'Vare Tone', '2026-04-05 00:43:58', '2026-04-05 00:43:58'),
(21, 'Sony Alpha 5000', '2026-04-05 00:44:44', '2026-04-05 00:44:44'),
(22, 'Atem Mini', '2026-04-05 00:44:52', '2026-04-05 00:44:52'),
(23, 'Sandisk 128GB', '2026-04-05 00:45:00', '2026-04-05 00:45:00'),
(24, 'JK Coustic', '2026-04-05 00:45:07', '2026-04-05 00:45:07'),
(25, 'Samson SR 850', '2026-04-05 00:45:17', '2026-04-05 00:45:17'),
(26, 'Canon XA11', '2026-04-05 00:45:32', '2026-04-05 00:45:32'),
(27, 'Sony Alpha 500', '2026-04-05 00:45:39', '2026-04-05 00:45:39'),
(28, 'Sony Exmor R', '2026-04-05 00:45:47', '2026-04-05 00:45:47'),
(29, 'Sony FDR-AX53', '2026-04-05 00:45:54', '2026-04-05 00:45:54'),
(30, 'Indachi', '2026-04-05 00:46:05', '2026-04-05 00:46:05'),
(31, 'Aveda', '2026-04-05 00:46:20', '2026-04-05 00:46:20'),
(32, 'Sony ECM-GZ1M', '2026-04-05 00:46:30', '2026-04-05 00:46:30'),
(33, 'Zoom Live trak L-8', '2026-04-05 00:46:37', '2026-04-05 00:46:37'),
(34, 'DELL', '2026-04-05 00:46:46', '2026-04-05 00:46:46'),
(35, 'CR 3X LTD', '2026-04-05 00:46:57', '2026-04-05 00:46:57'),
(36, 'No Merk', '2026-04-05 03:58:26', '2026-04-05 03:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_22_141743_create_roles_table', 1),
(7, '2023_11_22_143332_create_barangs_table', 1),
(8, '2023_11_22_230624_create_kategoris_table', 1),
(9, '2023_11_22_235943_create_merks_table', 1),
(10, '2023_11_23_001505_create_lokasis_table', 1),
(11, '2023_11_23_005148_create_pelaporans_table', 1),
(12, '2023_11_27_233338_create_feedback_table', 1),
(13, '2023_11_28_010616_create_feedback_replies_table', 1),
(14, '2025_05_03_000000_add_jumlah_to_barangs_table', 2),
(15, '2025_05_03_000001_add_qr_code_path_to_barangs_table', 3),
(16, '2025_05_03_000002_drop_unique_kd_barang_from_barangs_table', 4),
(17, '2025_05_03_000003_add_keterangan_lokasi_to_barangs_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelaporans`
--

CREATE TABLE `pelaporans` (
  `id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('menunggu','sedang diperbaiki','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `barang_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2025-05-02 23:46:48', '2025-05-02 23:46:48'),
(2, 'user', '2025-05-02 23:46:48', '2025-05-02 23:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$5wC7yk44Iv9Cg9/esS54/Ovy4o9OaJbMwNTTidxRaNHeNJjpDtJou', 1, NULL, '2025-05-02 23:46:48', '2025-05-02 23:46:48'),
(2, 'user', 'user@gmail.com', NULL, '$2y$12$t81jJLat4a7DfXLHvOa5Feo5RVR2kVlTMYFSGEWfnU8DOafetoig6', 2, NULL, '2025-05-02 23:46:48', '2025-05-02 23:46:48'),
(3, 'Aep', 'Aeppamanukan@gmail.com', NULL, '$2y$12$m.SSjlnMtRdtjVt8ERPLw.VCwEXMzVT4ZYAhTT.BYkM.zyxbfptNm', 1, NULL, '2026-04-05 21:32:33', '2026-04-05 21:37:02'),
(4, 'Taupik wahyu', 'Admopik@gmail.com', NULL, '$2y$12$x8hmBUP/Cu/5Syaog5eu3OMzTipp6HhDVI/OfpcS1ceeNJVBBcM4m', 1, NULL, '2026-04-05 21:34:16', '2026-04-05 21:34:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback_replies`
--
ALTER TABLE `feedback_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasis`
--
ALTER TABLE `lokasis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merks`
--
ALTER TABLE `merks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelaporans`
--
ALTER TABLE `pelaporans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback_replies`
--
ALTER TABLE `feedback_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lokasis`
--
ALTER TABLE `lokasis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `merks`
--
ALTER TABLE `merks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pelaporans`
--
ALTER TABLE `pelaporans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
