-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2024 at 01:02 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwl_pos`
--

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_11_041528_create_m_level_table', 1),
(6, '2024_09_11_042854_create_m_kategoris_table', 2),
(7, '2024_09_11_042926_create_m_suppliers_table', 2),
(8, '2024_09_11_043843_create_m_user_table', 3),
(9, '2024_09_11_045457_create_m_user_table', 4),
(10, '2024_09_11_050135_create_m_barang_table', 5),
(14, '2024_09_11_052156_create_t_penjualan_table', 6),
(15, '2024_09_11_065000_create_t_penjualan_table', 7),
(16, '2024_09_11_065143_create_t_stok_table', 8),
(17, '2024_09_11_065320_create_t_penjualan_detail_table', 9),
(18, '2024_09_11_065706_create_m_kategori_table', 10),
(19, '2024_09_11_071620_create_m_supplier_table', 11),
(20, '2024_09_11_074330_create_t_stok_table', 12),
(21, '2024_09_12_095035_create_m_user_table', 13),
(22, '2024_09_11_042854_create_m_kategori_table', 14),
(23, '2024_09_09_041834_m_kategori_table', 15),
(24, '2024_09_09_041851_m_supplier_table', 15),
(25, '2024_09_09_044054_m_barang_table', 15),
(26, '2024_09_09_051849_t_stok_table', 15),
(27, '2024_10_20_152149_add_foto_to_m_user_table', 16),
(28, '2024_10_20_153333_create_t_penjualan_table', 17),
(29, '2024_10_20_153550_create_t_penjualan_detail_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `m_barang`
--

CREATE TABLE `m_barang` (
  `barang_id` bigint UNSIGNED NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `barang_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_barang`
--

INSERT INTO `m_barang` (`barang_id`, `kategori_id`, `barang_kode`, `barang_nama`, `harga_beli`, `harga_jual`, `created_at`, `updated_at`) VALUES
(1, 1, 'SBK-001', 'Beras Cap Jago (5kg)', 65000, 68000, NULL, NULL),
(2, 1, 'SBK-002', 'Beras Bramo Cap Lele', 80000, 83000, NULL, NULL),
(3, 2, 'SNK-001', 'Happy Toss', 10500, 11000, NULL, NULL),
(4, 2, 'SNK-002', 'Oreo', 7200, 7800, NULL, NULL),
(5, 3, 'MND-001', 'Sabun Lifebuoy', 4250, 5000, NULL, NULL),
(6, 3, 'MND-002', 'Pasta Gigi Pepsoden', 6750, 7500, NULL, NULL),
(7, 4, 'BAY-001', 'Susu SGM Coklat 900gr', 92500, 95000, NULL, NULL),
(8, 4, 'BAY-002', 'Popok Mamy Poko', 56000, 58000, NULL, NULL),
(9, 5, 'MNM-001', 'Aqua 600ml', 3700, 4500, NULL, NULL),
(10, 5, 'MNM-002', 'Le Mineral', 3500, 4000, NULL, NULL),
(11, 1, 'SBK-003', 'Telur Omega (10 butir)', 22000, 25000, '2024-10-14 08:13:45', NULL),
(12, 2, 'SNK-003', 'Sari Roti', 11500, 12500, '2024-10-14 08:13:45', NULL),
(13, 3, 'MND-003', 'Shampoo Pantene', 17500, 18500, '2024-10-14 08:13:45', NULL),
(14, 4, 'BAY-003', 'Baju Bayi 2th', 89000, 92500, '2024-10-14 08:13:45', NULL),
(15, 5, 'MNM-003', 'Cle 600mL', 3750, 4300, '2024-10-14 08:13:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori`
--

CREATE TABLE `m_kategori` (
  `kategori_id` bigint UNSIGNED NOT NULL,
  `kategori_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_kategori`
--

INSERT INTO `m_kategori` (`kategori_id`, `kategori_kode`, `kategori_nama`, `created_at`, `updated_at`) VALUES
(1, 'SBK', 'Sembako', NULL, NULL),
(2, 'SNK', 'Makanan ringan', NULL, NULL),
(3, 'MND', 'Peralatan Mandi', NULL, NULL),
(4, 'BAY', 'Keperluan Bayi', NULL, NULL),
(5, 'MNM', 'Minuman', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_level`
--

CREATE TABLE `m_level` (
  `level_id` bigint UNSIGNED NOT NULL,
  `level_kode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_level`
--

INSERT INTO `m_level` (`level_id`, `level_kode`, `level_nama`, `created_at`, `updated_at`) VALUES
(1, 'ADM', 'Administrator', NULL, NULL),
(2, 'MNG', 'Manager', NULL, NULL),
(3, 'STF', 'Staff', NULL, '2024-10-07 18:21:58'),
(4, 'KSR', 'kasir', '2024-09-12 10:08:02', '2024-10-07 18:20:47'),
(9, 'BRH', 'buruh', '2024-09-29 06:50:48', '2024-09-29 06:50:48'),
(14, 'HRD', 'Manager HRD', '2024-10-23 02:50:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_supplier`
--

CREATE TABLE `m_supplier` (
  `supplier_id` bigint UNSIGNED NOT NULL,
  `supplier_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_supplier`
--

INSERT INTO `m_supplier` (`supplier_id`, `supplier_kode`, `supplier_nama`, `supplier_alamat`, `created_at`, `updated_at`) VALUES
(1, 'SP001', 'CV Berkah Sembako', 'Jakarta, Indonesia', NULL, NULL),
(2, 'SP002', 'PT Sumber Pangan Nusantara', 'Bandung, Indonesia', NULL, NULL),
(3, 'SP003', 'Toko Snack Maju Sejahtera', 'Surabaya, Indonesia', NULL, NULL),
(4, 'SP004', 'PT Peralatan Mandi Bersih', 'Semarang, Indonesia', NULL, NULL),
(5, 'SP005', 'CV Segar Jaya', 'Medan, Indonesia', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `level_id` bigint UNSIGNED NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`user_id`, `level_id`, `username`, `nama`, `foto`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin1', 'adminlte/dist/img/1729678353.jpeg', '$2y$12$Ra38Fy1/EsFM6/jQRa/22uENmylTi25V5SZhip4PtxL9fOXHqEek6', NULL, '2024-10-23 03:12:33'),
(2, 2, 'manager', 'Manager', 'adminlte/dist/img/1729523416.png', '$2y$12$w88py8oYA9a4o5mGNbrJ6.A5M03xJzA8IIQ0E9zb0fuDwgbVhLdh6', NULL, '2024-10-21 08:10:16'),
(3, 3, 'staff', 'Staff/Kasir', 'adminlte/dist/img/1729503449.png', '$2y$12$ZftWHSnLjuK5V5yBe.UF8ejq7Ounz9dHao47YtzmopMVjjtLbW5CG', NULL, '2024-10-21 02:37:30'),
(9, 4, 'Customer-1', 'Pelanggan Pertama', 'adminlte/dist/img/default-foto.jpg', '$2y$12$cAGQ1L6pxwvxbSu.d2Yfh.GExCF.VIaczpS2RUneIlCPQHor94ag6', NULL, '2024-09-12 03:21:50'),
(19, 2, 'manager_dua', 'Manager 2', 'adminlte/dist/img/default-foto.jpg', '$2y$12$c7dGA.aGfAPshbxVOSWSn.0FV1XORhST8RTb8fOzdXfax5XKxvRfa', '2024-09-17 06:48:30', '2024-09-17 06:48:30'),
(21, 2, 'manager22', 'Manager Dua Dua', 'adminlte/dist/img/default-foto.jpg', '$2y$12$ntkmb9xvW9m8cO9QHpmA4uDgQmcRCHcR9zjrpIB94NUeAq8p1Z6zC', '2024-09-17 07:52:44', '2024-09-17 07:52:44'),
(22, 2, 'manager33', 'Manager Tiga Tiga', 'adminlte/dist/img/default-foto.jpg', '$2y$12$EHEripNttWJbEuKhUvYL4.5r8C.klQJ28A88qiFXywvap4Wi.PFSW', '2024-09-17 07:57:56', '2024-09-17 07:57:56'),
(23, 2, 'manager56', 'Manager55', 'adminlte/dist/img/default-foto.jpg', '$2y$12$O56KOvyWdswfiErsRrssZOm1/b92XSgbv4J7MJHwTI.iy/Vg..ekW', '2024-09-17 08:02:44', '2024-09-17 08:02:44'),
(24, 2, 'manager12', 'Manager111', 'adminlte/dist/img/default-foto.jpg', '$2y$12$bjpOKUv3F5bnimubUlUuEuz56NWZ01uciFmYjmXddCn6m7BGZBLk6', '2024-09-17 08:04:25', '2024-10-03 08:13:54'),
(43, 2, 'manager100', 'anas', 'adminlte/dist/img/default-foto.jpg', '$2y$12$ct7tMpRv1r9TvuxcssUR..Q0GaTx6gVoVJd6Bw/Eh/a06rEE6tKWC', '2024-10-07 18:53:45', '2024-10-07 18:53:45'),
(44, 2, 'manager1111', 'manju', 'adminlte/dist/img/default-foto.jpg', '$2y$12$qUNcZ3vvkvmZX/vcMUAyvuix6.Pj3aEghRINdX0XiNVkhyBtFgxgG', '2024-10-20 01:29:13', '2024-10-23 03:15:11'),
(66, 1, 'admin01', 'anas', 'adminlte/dist/img/1729521414.jpeg', '$2y$12$iAZv/cgMD4XyqwFyGbzo9uq/JnYhjFiBtx.NYKi3lxdQ4g3F1ltrq', '2024-10-21 05:34:27', '2024-10-21 07:36:54'),
(67, 3, 'staff11', 'keren12', 'adminlte/dist/img/1729515067.png', '$2y$12$JdhepXiciMp89XeUJBUBM.2Fg8RMLdWKzAnQSY.wEyTjGc8az0p1G', '2024-10-21 05:50:41', '2024-10-21 05:51:07'),
(68, 1, 'admin12', 'admin11', 'adminlte/dist/img/1729676360.jpg', '$2y$12$RCQKAH7YUuE1XbpnV/ChT.iFp0QWli9YhYjWU./mHsUI73eWQ/q1a', '2024-10-21 07:37:50', '2024-10-23 02:39:20'),
(69, 2, 'manager01', 'manju11', NULL, '$2y$12$3s/hDxAeKX007kX2Xec8CenT1fGwrf.eutyIM6k8ClpiCd/G1BgjW', '2024-10-21 19:47:47', '2024-10-21 19:47:47'),
(70, 4, 'kasir1', 'vanda', 'adminlte/dist/img/1729589521.png', '$2y$12$hydejiSIrhD/gq/OQ50IHuFzXwOCsV4qKeDdwx6HDThuBQMSrzLae', '2024-10-21 20:02:34', '2024-10-22 02:32:01'),
(71, 1, 'admin13', 'anasnh', NULL, '$2y$12$vDps/zwGfQOdnyx7CYw8T.lzdfE1psOQl2isTWiFj6SnHRdlJ0TQq', '2024-10-22 06:07:10', '2024-10-22 06:07:10'),
(72, 2, 'admin14', 'anasnh1', NULL, '$2y$12$NL9FB9EAAiD6Iq0Cb3cKvuDu/u5S7jk3V/.eUfRi8dGb18RNEoh6q', '2024-10-22 06:07:32', '2024-10-22 06:07:32'),
(73, 2, 'managerrrr', 'anjas', NULL, '$2y$12$rtf9vyYrDgCrxwipmi89oehZ.MMIlpL0T/cqYL9MVOA4UN03xVS2O', '2024-10-22 06:27:03', '2024-10-22 06:27:03'),
(74, 1, 'admin1000', 'kerennn', NULL, '$2y$12$Vnca0KiYnMNFlIKPjpOX.OqlNz1bY68O3o0bk8LRzm2I5nyrQ2u6y', '2024-10-22 06:29:11', '2024-10-22 06:29:11'),
(75, 1, 'admin02', 'anas', NULL, '$2y$12$.F8LJw0tK0zT0I.BnOHMy.XXfJ2jIoQbqjYs2KaNqbFeSURS0r0J6', '2024-10-22 20:16:02', '2024-10-22 20:16:02'),
(76, 1, 'admin03', 'admin03', NULL, '$2y$12$Uykv8Mn91Gz9oaS/jqUdiOWo0f0VCHzbVgKkrqxv/clogvoBbXNXm', '2024-10-23 02:34:52', '2024-10-23 02:34:52'),
(77, 3, 'staff01', 'anas', NULL, '$2y$12$swgBSCW9g7VruSSLvoTwj.vEVIY9trmvWWR0K61Df9R4Qvf7MvX8m', '2024-10-23 03:11:14', '2024-10-23 03:11:14');

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
-- Table structure for table `t_penjualan`
--

CREATE TABLE `t_penjualan` (
  `penjualan_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `pembeli` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penjualan_kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penjualan_tanggal` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_penjualan`
--

INSERT INTO `t_penjualan` (`penjualan_id`, `user_id`, `pembeli`, `penjualan_kode`, `penjualan_tanggal`, `created_at`, `updated_at`) VALUES
(1, 1, 'Anas Nh', 'PJ001', '2024-09-11 07:30:00', NULL, NULL),
(2, 2, 'Andreas', 'PJ002', '2024-09-11 08:00:00', NULL, NULL),
(3, 3, 'Dimas R', 'PJ003', '2024-09-11 08:30:00', NULL, NULL),
(4, 1, 'Qodri', 'PJ004', '2024-09-11 09:00:00', NULL, NULL),
(5, 2, 'Afifah', 'PJ005', '2024-09-11 09:30:00', NULL, NULL),
(6, 3, 'Fifi', 'PJ006', '2024-09-11 10:00:00', NULL, NULL),
(7, 1, 'Kevin', 'PJ007', '2024-09-11 10:30:00', NULL, NULL),
(8, 2, 'Nala', 'PJ008', '2024-09-11 11:00:00', NULL, NULL),
(9, 3, 'Dicky', 'PJ009', '2024-09-11 11:30:00', NULL, NULL),
(12, 68, 'ANASMANJU', 'PJ011', '2024-10-22 00:00:00', '2024-10-22 09:53:18', '2024-10-22 09:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `t_penjualan_detail`
--

CREATE TABLE `t_penjualan_detail` (
  `detail_id` bigint UNSIGNED NOT NULL,
  `penjualan_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `harga` int NOT NULL,
  `jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_penjualan_detail`
--

INSERT INTO `t_penjualan_detail` (`detail_id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 68000, 1, NULL, NULL),
(2, 1, 2, 83000, 2, NULL, NULL),
(3, 1, 3, 11000, 3, NULL, NULL),
(4, 2, 4, 7800, 1, NULL, NULL),
(5, 2, 5, 5000, 2, NULL, NULL),
(6, 2, 6, 7500, 1, NULL, NULL),
(7, 3, 7, 95000, 1, NULL, NULL),
(8, 3, 8, 58000, 2, NULL, NULL),
(9, 3, 9, 4500, 1, NULL, NULL),
(10, 4, 10, 4000, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_stok`
--

CREATE TABLE `t_stok` (
  `stok_id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `stok_tanggal` datetime NOT NULL,
  `stok_jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_stok`
--

INSERT INTO `t_stok` (`stok_id`, `supplier_id`, `barang_id`, `user_id`, `stok_tanggal`, `stok_jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-09-11 07:00:00', 50, NULL, NULL),
(2, 1, 2, 1, '2024-09-11 07:00:00', 40, NULL, NULL),
(3, 1, 3, 1, '2024-09-11 07:00:00', 60, NULL, NULL),
(4, 2, 4, 2, '2024-09-11 07:00:00', 30, NULL, NULL),
(5, 2, 5, 2, '2024-09-11 07:00:00', 20, NULL, NULL),
(6, 2, 6, 2, '2024-09-11 07:00:00', 25, NULL, NULL),
(7, 3, 7, 3, '2024-09-11 07:00:00', 15, NULL, NULL),
(8, 3, 8, 3, '2024-09-11 07:00:00', 35, NULL, NULL),
(9, 3, 9, 3, '2024-09-11 07:00:00', 45, NULL, NULL),
(10, 1, 10, 1, '2024-09-11 07:00:00', 60, NULL, NULL);

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD PRIMARY KEY (`barang_id`),
  ADD UNIQUE KEY `m_barang_barang_kode_unique` (`barang_kode`),
  ADD KEY `m_barang_kategori_id_index` (`kategori_id`);

--
-- Indexes for table `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD PRIMARY KEY (`kategori_id`),
  ADD UNIQUE KEY `m_kategori_kategori_kode_unique` (`kategori_kode`);

--
-- Indexes for table `m_level`
--
ALTER TABLE `m_level`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `m_level_level_kode_unique` (`level_kode`);

--
-- Indexes for table `m_supplier`
--
ALTER TABLE `m_supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `m_supplier_supplier_kode_unique` (`supplier_kode`);

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `m_user_username_unique` (`username`),
  ADD KEY `m_user_level_id_index` (`level_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  ADD PRIMARY KEY (`penjualan_id`),
  ADD KEY `t_penjualan_user_id_foreign` (`user_id`);

--
-- Indexes for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `t_penjualan_detail_barang_id_foreign` (`barang_id`),
  ADD KEY `t_penjualan_detail_penjualan_id_foreign` (`penjualan_id`);

--
-- Indexes for table `t_stok`
--
ALTER TABLE `t_stok`
  ADD PRIMARY KEY (`stok_id`),
  ADD KEY `t_stok_supplier_id_index` (`supplier_id`),
  ADD KEY `t_stok_barang_id_index` (`barang_id`),
  ADD KEY `t_stok_user_id_index` (`user_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `m_barang`
--
ALTER TABLE `m_barang`
  MODIFY `barang_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `m_kategori`
--
ALTER TABLE `m_kategori`
  MODIFY `kategori_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_level`
--
ALTER TABLE `m_level`
  MODIFY `level_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `m_supplier`
--
ALTER TABLE `m_supplier`
  MODIFY `supplier_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  MODIFY `penjualan_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  MODIFY `detail_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_stok`
--
ALTER TABLE `t_stok`
  MODIFY `stok_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD CONSTRAINT `m_barang_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `m_kategori` (`kategori_id`);

--
-- Constraints for table `m_user`
--
ALTER TABLE `m_user`
  ADD CONSTRAINT `m_user_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `m_level` (`level_id`);

--
-- Constraints for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  ADD CONSTRAINT `t_penjualan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  ADD CONSTRAINT `t_penjualan_detail_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barang` (`barang_id`),
  ADD CONSTRAINT `t_penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `t_penjualan` (`penjualan_id`);

--
-- Constraints for table `t_stok`
--
ALTER TABLE `t_stok`
  ADD CONSTRAINT `t_stok_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barang` (`barang_id`),
  ADD CONSTRAINT `t_stok_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `m_supplier` (`supplier_id`),
  ADD CONSTRAINT `t_stok_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
