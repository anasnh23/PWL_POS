-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2024 at 06:38 AM
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
(21, '2024_09_12_095035_create_m_user_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `m_barangs`
--

CREATE TABLE `m_barangs` (
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
-- Dumping data for table `m_barangs`
--

INSERT INTO `m_barangs` (`barang_id`, `kategori_id`, `barang_kode`, `barang_nama`, `harga_beli`, `harga_jual`, `created_at`, `updated_at`) VALUES
(1, 1, 'BK001', 'TV LED 40 Inch', 3000000, 3500000, NULL, NULL),
(2, 1, 'BK002', 'Mesin Cuci Front Load', 4500000, 5000000, NULL, NULL),
(3, 1, 'BK003', 'Kulkas Dua Pintu', 5500000, 6000000, NULL, NULL),
(4, 2, 'BK004', 'Printer LaserJet', 2000000, 2500000, NULL, NULL),
(5, 2, 'BK005', 'Mesin Fotokopi Digital', 10000000, 12000000, NULL, NULL),
(6, 2, 'BK006', 'Kursi Ergonomis Kantor', 750000, 900000, NULL, NULL),
(7, 3, 'BK007', 'Mobil Remote Control', 500000, 600000, NULL, NULL),
(8, 3, 'BK008', 'Lego Classic Set', 300000, 350000, NULL, NULL),
(9, 3, 'BK009', 'Boneka Barbie', 250000, 300000, NULL, NULL),
(10, 4, 'BK010', 'Blouse Sutra Wanita', 400000, 500000, NULL, NULL),
(11, 4, 'BK011', 'Tas Kulit Branded', 1500000, 1800000, NULL, NULL),
(12, 4, 'BK012', 'Sepatu High Heels', 600000, 750000, NULL, NULL),
(13, 5, 'BK013', 'Suplemen Vitamin C', 100000, 150000, NULL, NULL),
(14, 5, 'BK014', 'Termometer Digital', 80000, 120000, NULL, NULL),
(15, 5, 'BK015', 'Alat Tes Gula Darah', 300000, 350000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_kategoris`
--

CREATE TABLE `m_kategoris` (
  `kategori_id` bigint UNSIGNED NOT NULL,
  `kategori_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_kategoris`
--

INSERT INTO `m_kategoris` (`kategori_id`, `kategori_kode`, `kategori_nama`, `created_at`, `updated_at`) VALUES
(1, 'KT001', 'Elektronik Rumah', NULL, NULL),
(2, 'KT002', 'Peralatan Melukis', NULL, NULL),
(3, 'KT003', 'Mainan Anak', NULL, NULL),
(4, 'KT004', 'Fashion Wanita', NULL, NULL),
(5, 'KT005', 'Produk Kecantikan', NULL, NULL);

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
(3, 'STF', 'Satff/Kasir', NULL, NULL),
(4, 'kode_lv4', 'Nama Level 4', '2024-09-12 10:08:02', '2024-09-12 10:08:02');

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
(1, 'SP001', 'PT Elektronik Rumah Sejahtera', 'Jakarta, Indonesia', NULL, NULL),
(2, 'SP002', 'CV Peralatan Kantor Maju', 'Bandung, Indonesia', NULL, NULL),
(3, 'SP003', 'PT Mainan Anak Ceria', 'Surabaya, Indonesia', NULL, NULL),
(4, 'SP004', 'PT Fashion Wanita Modern', 'Semarang, Indonesia', NULL, NULL),
(5, 'SP005', 'CV Produk Kesehatan Prima', 'Medan, Indonesia', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `level_id` bigint UNSIGNED NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`user_id`, `level_id`, `username`, `nama`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Administrator', '$2y$12$VCW2ORmzHCRx0BW0B.S4Vu0seP652QJ4pF6FGqbbQ1y1Ap2ul8pbC', NULL, NULL),
(2, 2, 'manager', 'Manager', '$2y$12$w88py8oYA9a4o5mGNbrJ6.A5M03xJzA8IIQ0E9zb0fuDwgbVhLdh6', NULL, NULL),
(3, 3, 'staff', 'Staff/Kasir', '$2y$12$GAkNYMnY2U332.FZSS3KHOuxGi/Wb4XkC7EPjIx1k1Iorncl82Alq', NULL, NULL),
(9, 4, 'Customer-1', 'Pelanggan Pertama', '$2y$12$cAGQ1L6pxwvxbSu.d2Yfh.GExCF.VIaczpS2RUneIlCPQHor94ag6', NULL, '2024-09-12 03:21:50'),
(19, 2, 'manager_dua', 'Manager 2', '$2y$12$c7dGA.aGfAPshbxVOSWSn.0FV1XORhST8RTb8fOzdXfax5XKxvRfa', '2024-09-17 06:48:30', '2024-09-17 06:48:30'),
(21, 2, 'manager22', 'Manager Dua Dua', '$2y$12$ntkmb9xvW9m8cO9QHpmA4uDgQmcRCHcR9zjrpIB94NUeAq8p1Z6zC', '2024-09-17 07:52:44', '2024-09-17 07:52:44'),
(22, 2, 'manager33', 'Manager Tiga Tiga', '$2y$12$EHEripNttWJbEuKhUvYL4.5r8C.klQJ28A88qiFXywvap4Wi.PFSW', '2024-09-17 07:57:56', '2024-09-17 07:57:56'),
(23, 2, 'manager56', 'Manager55', '$2y$12$O56KOvyWdswfiErsRrssZOm1/b92XSgbv4J7MJHwTI.iy/Vg..ekW', '2024-09-17 08:02:44', '2024-09-17 08:02:44'),
(24, 2, 'manager12', 'Manager11', '$2y$12$bjpOKUv3F5bnimubUlUuEuz56NWZ01uciFmYjmXddCn6m7BGZBLk6', '2024-09-17 08:04:25', '2024-09-17 08:04:25');

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
(10, 1, 'Firstya', 'PJ010', '2024-09-11 12:00:00', NULL, NULL);

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
(1, 1, 1, 5500000, 1, NULL, NULL),
(2, 1, 2, 1200000, 2, NULL, NULL),
(3, 1, 3, 850000, 3, NULL, NULL),
(4, 2, 4, 3500000, 1, NULL, NULL),
(5, 2, 5, 2700000, 2, NULL, NULL),
(6, 2, 6, 4500000, 1, NULL, NULL),
(7, 3, 7, 1750000, 1, NULL, NULL),
(8, 3, 8, 1100000, 2, NULL, NULL),
(9, 3, 9, 1400000, 1, NULL, NULL),
(10, 4, 10, 2200000, 2, NULL, NULL),
(11, 4, 11, 6500000, 1, NULL, NULL),
(12, 4, 12, 900000, 2, NULL, NULL),
(13, 5, 13, 500000, 3, NULL, NULL),
(14, 5, 14, 4500000, 1, NULL, NULL),
(15, 5, 15, 3200000, 2, NULL, NULL),
(16, 6, 1, 5500000, 1, NULL, NULL),
(17, 6, 2, 1200000, 2, NULL, NULL),
(18, 6, 3, 850000, 3, NULL, NULL),
(19, 7, 4, 3500000, 1, NULL, NULL),
(20, 7, 5, 2700000, 2, NULL, NULL),
(21, 7, 6, 4500000, 1, NULL, NULL),
(22, 8, 7, 1750000, 1, NULL, NULL),
(23, 8, 8, 1100000, 2, NULL, NULL),
(24, 8, 9, 1400000, 1, NULL, NULL),
(25, 9, 10, 2200000, 2, NULL, NULL),
(26, 9, 11, 6500000, 1, NULL, NULL),
(27, 9, 12, 900000, 2, NULL, NULL),
(28, 10, 13, 500000, 3, NULL, NULL),
(29, 10, 14, 4500000, 1, NULL, NULL),
(30, 10, 15, 3200000, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_stok`
--

CREATE TABLE `t_stok` (
  `stok_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `stok_tanggal` datetime NOT NULL,
  `stok_jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_stok`
--

INSERT INTO `t_stok` (`stok_id`, `barang_id`, `user_id`, `supplier_id`, `stok_tanggal`, `stok_jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-09-11 07:00:00', 50, NULL, NULL),
(2, 2, 1, 1, '2024-09-11 07:00:00', 40, NULL, NULL),
(3, 3, 1, 1, '2024-09-11 07:00:00', 60, NULL, NULL),
(4, 4, 2, 2, '2024-09-11 07:00:00', 30, NULL, NULL),
(5, 5, 2, 2, '2024-09-11 07:00:00', 20, NULL, NULL),
(6, 6, 2, 2, '2024-09-11 07:00:00', 25, NULL, NULL),
(7, 7, 3, 3, '2024-09-11 07:00:00', 15, NULL, NULL),
(8, 8, 3, 3, '2024-09-11 07:00:00', 35, NULL, NULL),
(9, 9, 3, 3, '2024-09-11 07:00:00', 45, NULL, NULL),
(10, 10, 1, 1, '2024-09-11 07:00:00', 60, NULL, NULL),
(11, 11, 1, 1, '2024-09-11 07:00:00', 55, NULL, NULL),
(12, 12, 2, 2, '2024-09-11 07:00:00', 70, NULL, NULL),
(13, 13, 3, 3, '2024-09-11 07:00:00', 80, NULL, NULL),
(14, 14, 3, 3, '2024-09-11 07:00:00', 45, NULL, NULL),
(15, 15, 1, 1, '2024-09-11 07:00:00', 50, NULL, NULL);

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
-- Indexes for table `m_barangs`
--
ALTER TABLE `m_barangs`
  ADD PRIMARY KEY (`barang_id`),
  ADD KEY `m_barangs_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `m_kategoris`
--
ALTER TABLE `m_kategoris`
  ADD PRIMARY KEY (`kategori_id`);

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
  ADD PRIMARY KEY (`supplier_id`);

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
  ADD KEY `t_stok_user_id_foreign` (`user_id`),
  ADD KEY `t_stok_barang_id_foreign` (`barang_id`),
  ADD KEY `t_stok_supplier_id_foreign` (`supplier_id`);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `m_barangs`
--
ALTER TABLE `m_barangs`
  MODIFY `barang_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `m_kategoris`
--
ALTER TABLE `m_kategoris`
  MODIFY `kategori_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `m_level`
--
ALTER TABLE `m_level`
  MODIFY `level_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_supplier`
--
ALTER TABLE `m_supplier`
  MODIFY `supplier_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  MODIFY `penjualan_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  MODIFY `detail_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
-- Constraints for table `m_barangs`
--
ALTER TABLE `m_barangs`
  ADD CONSTRAINT `m_barangs_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `m_kategoris` (`kategori_id`);

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
  ADD CONSTRAINT `t_penjualan_detail_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barangs` (`barang_id`),
  ADD CONSTRAINT `t_penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `t_penjualan` (`penjualan_id`);

--
-- Constraints for table `t_stok`
--
ALTER TABLE `t_stok`
  ADD CONSTRAINT `t_stok_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barangs` (`barang_id`),
  ADD CONSTRAINT `t_stok_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `m_supplier` (`supplier_id`),
  ADD CONSTRAINT `t_stok_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
