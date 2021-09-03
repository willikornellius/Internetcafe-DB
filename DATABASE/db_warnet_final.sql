-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2019 at 03:34 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_warnet`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PEMBELIAN_ALL` (IN `start_date` DATE, IN `end_date` DATE)  BEGIN
    SELECT * FROM pembelian WHERE DATE(TANGGAL_PEMBELIAN) >= start_date AND DATE(TANGGAL_PEMBELIAN) <= end_date;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PEMBELIAN_PER_KODE` (IN `id_barang` VARCHAR(255))  BEGIN
    SELECT * FROM pembelian WHERE ID_BARANG = id_barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PENJUALAN_ALL` (IN `start_date` DATE, IN `end_date` DATE)  BEGIN
    SELECT * FROM penjualan WHERE DATE(TANGGAL_PENJUALAN) >= start_date AND DATE(TANGGAL_PENJUALAN) <= end_date;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PENJUALAN_PER_KODE` (IN `id_barang` VARCHAR(255))  BEGIN
    SELECT * FROM penjualan WHERE ID_BARANG = id_barang;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_BARANG` int(11) NOT NULL,
  `ID_JENIS_BARANG` int(11) DEFAULT NULL,
  `NAMA_BARANG` varchar(50) DEFAULT NULL,
  `JENIS_BARANG` varchar(50) DEFAULT NULL,
  `HARGA_BARANG` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID_BARANG`, `ID_JENIS_BARANG`, `NAMA_BARANG`, `JENIS_BARANG`, `HARGA_BARANG`) VALUES
(1, 2, 'Chiki', 'Makanan', 2000),
(2, 1, 'Billing 3 Jam', 'Billing', 10000),
(3, 3, 'Teh Pucuk', 'Minuman', 4000),
(4, 1, 'Paket Pagi', 'Billing', 15000),
(5, 1, 'Paket Malam', 'Billing', 20000),
(6, 2, 'Indomie Goreng', 'Makanan', 5000),
(7, 1, 'Billing 1 jam', 'Billing', 5000),
(8, 4, 'Printing A4 Hitam Putih', 'Others', 500),
(9, 4, 'Printing A4 Berwarna', 'Others', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `ID_BILLING` int(11) NOT NULL,
  `ID_MEMBER` int(11) NOT NULL,
  `BARANG` int(11) NOT NULL,
  `START_BILLING` int(11) NOT NULL,
  `END_BILLING` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `ID_JENIS_BARANG` int(11) NOT NULL,
  `NAMA_JENIS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`ID_JENIS_BARANG`, `NAMA_JENIS`) VALUES
(1, 'Billing'),
(2, 'Makanan'),
(3, 'Minuman'),
(4, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `ID_MEMBER` int(11) NOT NULL,
  `ID_TRANSAKSI` int(11) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `GENDER` char(50) DEFAULT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `NO_HP` varchar(15) DEFAULT NULL,
  `LAMA_BILING` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`ID_MEMBER`, `ID_TRANSAKSI`, `USERNAME`, `GENDER`, `NAMA`, `EMAIL`, `NO_HP`, `LAMA_BILING`) VALUES
(1, 2, 'ringgit', 'Pria', 'Tedy', 'tedyandreanz@gmail.com', '085655312345', '00:00:03'),
(2, 7, 'rupiah', 'Pria', 'Eko', 'novantoeko@gmail.com', '085655312346', '00:00:01');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `ID_PEMBELIAN` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `JUMLAH_BARANG` int(11) NOT NULL,
  `HARGA_BARANG` float NOT NULL,
  `HARGA_TOTAL` float NOT NULL,
  `TANGGAL_PEMBELIAN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`ID_PEMBELIAN`, `ID_BARANG`, `JUMLAH_BARANG`, `HARGA_BARANG`, `HARGA_TOTAL`, `TANGGAL_PEMBELIAN`) VALUES
(1, 3, 10, 3500, 35000, '2019-10-25 05:06:22'),
(2, 6, 20, 3000, 60000, '2019-10-04 12:49:05'),
(3, 6, 10, 3000, 30000, '2019-10-04 07:46:17'),
(4, 6, 1, 3000, 3000, '2019-10-07 07:24:10'),
(5, 2, 10, 2000, 20000, '2019-10-22 20:42:00'),
(6, 2, 20, 2000, 40000, '2019-10-04 16:17:31'),
(7, 2, 5, 2000, 10000, '2019-10-12 02:21:34'),
(8, 2, 3, 2000, 6000, '2019-10-16 17:55:20'),
(9, 2, 2, 2000, 4000, '2019-10-17 17:31:57'),
(10, 2, 20, 2000, 40000, '2019-10-08 16:53:44'),
(11, 6, 10, 3000, 30000, '2019-10-18 14:52:52'),
(12, 2, 10, 2000, 20000, '2019-10-08 06:43:07'),
(13, 6, 20, 3000, 60000, '2019-10-13 19:56:58'),
(14, 2, 5, 2000, 10000, '2019-10-14 14:35:32'),
(15, 3, 10, 3500, 35000, '2019-10-01 20:06:46'),
(16, 2, 10, 2000, 20000, '2019-10-22 15:47:13'),
(17, 2, 20, 2000, 40000, '2019-10-20 01:35:48'),
(18, 2, 20, 2000, 40000, '2019-10-02 15:37:21'),
(19, 2, 5, 2000, 10000, '2019-10-10 08:19:21'),
(20, 2, 5, 2000, 10000, '2019-10-14 01:44:43'),
(21, 3, 10, 3500, 35000, '2019-11-25 14:26:20'),
(22, 6, 20, 3000, 60000, '2019-11-21 06:40:26'),
(23, 6, 10, 3000, 30000, '2019-11-28 21:03:09'),
(24, 6, 1, 3000, 3000, '2019-11-21 20:14:30'),
(25, 2, 10, 2000, 20000, '2019-11-21 21:03:02'),
(26, 2, 20, 2000, 40000, '2019-11-14 03:31:41'),
(27, 2, 5, 2000, 10000, '2019-11-04 09:29:19'),
(28, 2, 3, 2000, 6000, '2019-11-07 19:51:32'),
(29, 2, 2, 2000, 4000, '2019-11-25 05:49:46'),
(30, 2, 20, 2000, 40000, '2019-11-15 00:34:14'),
(31, 6, 10, 3000, 30000, '2019-11-27 16:21:51'),
(32, 2, 10, 2000, 20000, '2019-11-05 15:06:35'),
(33, 6, 20, 3000, 60000, '2019-11-02 09:27:21'),
(34, 2, 5, 2000, 10000, '2019-11-23 08:57:00'),
(35, 3, 10, 3500, 35000, '2019-11-21 23:23:00'),
(36, 2, 10, 2000, 20000, '2019-11-10 01:03:59'),
(37, 2, 20, 2000, 40000, '2019-11-12 14:10:56'),
(38, 2, 20, 2000, 40000, '2019-11-03 02:42:42'),
(39, 2, 5, 2000, 10000, '2019-11-06 02:00:45'),
(40, 2, 5, 2000, 10000, '2019-11-20 08:55:39'),
(41, 3, 10, 3500, 35000, '2019-12-05 19:27:58'),
(42, 6, 20, 3000, 60000, '2019-12-10 09:58:08'),
(43, 6, 10, 3000, 30000, '2019-12-09 22:26:47'),
(44, 6, 1, 3000, 3000, '2019-12-17 17:19:31'),
(45, 2, 10, 2000, 20000, '2019-12-10 02:17:14'),
(46, 2, 20, 2000, 40000, '2019-12-20 14:27:39'),
(47, 2, 5, 2000, 10000, '2019-12-24 00:26:34'),
(48, 2, 3, 2000, 6000, '2019-12-09 13:49:54'),
(49, 2, 2, 2000, 4000, '2019-12-23 02:49:47'),
(50, 2, 20, 2000, 40000, '2019-12-14 03:39:13'),
(51, 6, 10, 3000, 30000, '2019-12-24 16:46:44'),
(52, 2, 10, 2000, 20000, '2019-12-08 07:56:02'),
(53, 6, 20, 3000, 60000, '2019-12-14 20:19:58'),
(54, 2, 5, 2000, 10000, '2019-12-24 12:51:44'),
(55, 3, 10, 3500, 35000, '2019-12-05 10:18:49'),
(56, 2, 10, 2000, 20000, '2019-11-30 19:58:53'),
(57, 2, 20, 2000, 40000, '2019-12-11 03:57:59'),
(58, 2, 20, 2000, 40000, '2019-12-04 14:53:15'),
(59, 2, 5, 2000, 10000, '2019-12-12 21:32:20'),
(60, 2, 5, 2000, 10000, '2019-12-01 22:01:54');

--
-- Triggers `pembelian`
--
DELIMITER $$
CREATE TRIGGER `beli_barang` AFTER INSERT ON `pembelian` FOR EACH ROW BEGIN
 INSERT INTO stok SET
 ID_BARANG = NEW.ID_BARANG, STOK=NEW.JUMLAH_BARANG
 ON DUPLICATE KEY UPDATE STOK=STOK+NEW.JUMLAH_BARANG;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `ID_PENJUALAN` int(11) NOT NULL,
  `ID_MEMBER` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `JUMLAH_BARANG` int(11) NOT NULL,
  `HARGA_BARANG` float NOT NULL,
  `HARGA_TOTAL` float NOT NULL,
  `TANGGAL_PENJUALAN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`ID_PENJUALAN`, `ID_MEMBER`, `ID_BARANG`, `JUMLAH_BARANG`, `HARGA_BARANG`, `HARGA_TOTAL`, `TANGGAL_PENJUALAN`) VALUES
(1, 1, 6, 1, 5000, 5000, '2019-10-28 16:50:53'),
(2, 1, 3, 1, 3000, 3000, '2019-10-12 08:03:00'),
(3, 1, 3, 1, 3000, 3000, '2019-10-03 20:42:22'),
(4, 1, 6, 1, 5000, 5000, '2019-10-10 14:22:51'),
(5, 1, 3, 1, 3000, 3000, '2019-10-11 16:47:08'),
(6, 1, 3, 1, 3000, 3000, '2019-10-25 23:47:07'),
(7, 1, 6, 1, 5000, 5000, '2019-10-07 03:34:11'),
(8, 1, 3, 1, 3000, 3000, '2019-10-15 01:29:34'),
(9, 1, 3, 1, 3000, 3000, '2019-10-24 03:45:20'),
(10, 1, 6, 1, 5000, 5000, '2019-10-16 21:17:56'),
(11, 1, 3, 1, 3000, 3000, '2019-10-11 06:13:43'),
(12, 1, 3, 1, 3000, 3000, '2019-10-04 22:14:47'),
(13, 1, 6, 1, 5000, 5000, '2019-10-19 03:32:45'),
(14, 1, 3, 1, 3000, 3000, '2019-10-22 05:59:25'),
(15, 1, 3, 1, 3000, 3000, '2019-10-24 02:18:49'),
(16, 1, 6, 1, 5000, 5000, '2019-10-24 00:35:54'),
(17, 1, 3, 1, 3000, 3000, '2019-10-18 03:03:01'),
(18, 1, 3, 1, 3000, 3000, '2019-10-17 20:27:25'),
(19, 1, 6, 1, 5000, 5000, '2019-10-05 04:08:04'),
(20, 1, 3, 1, 3000, 3000, '2019-10-29 14:18:05'),
(21, 1, 6, 1, 5000, 5000, '2019-11-24 05:59:10'),
(22, 1, 3, 1, 3000, 3000, '2019-11-28 01:34:46'),
(23, 1, 3, 1, 3000, 3000, '2019-11-08 20:56:20'),
(24, 1, 6, 1, 5000, 5000, '2019-11-17 10:57:25'),
(25, 1, 3, 1, 3000, 3000, '2019-11-01 22:58:05'),
(26, 1, 3, 1, 3000, 3000, '2019-11-14 16:58:08'),
(27, 1, 6, 1, 5000, 5000, '2019-11-08 22:56:28'),
(28, 1, 3, 1, 3000, 3000, '2019-11-28 22:47:56'),
(29, 1, 3, 1, 3000, 3000, '2019-11-01 04:10:16'),
(30, 1, 6, 1, 5000, 5000, '2019-11-05 07:27:35'),
(31, 1, 3, 1, 3000, 3000, '2019-11-22 07:47:04'),
(32, 1, 3, 1, 3000, 3000, '2019-11-07 23:32:38'),
(33, 1, 6, 1, 5000, 5000, '2019-11-01 05:21:59'),
(34, 1, 3, 1, 3000, 3000, '2019-11-10 11:11:59'),
(35, 1, 3, 1, 3000, 3000, '2019-11-18 22:54:00'),
(36, 1, 6, 1, 5000, 5000, '2019-11-04 15:54:04'),
(37, 1, 3, 1, 3000, 3000, '2019-11-23 17:48:20'),
(38, 1, 3, 1, 3000, 3000, '2019-11-17 00:19:31'),
(39, 1, 6, 1, 5000, 5000, '2019-11-13 03:12:33'),
(40, 1, 3, 1, 3000, 3000, '2019-11-13 22:04:13'),
(41, 1, 6, 1, 5000, 5000, '2019-12-11 10:47:13'),
(42, 1, 3, 1, 3000, 3000, '2019-12-13 05:18:08'),
(43, 1, 3, 1, 3000, 3000, '2019-12-06 01:08:59'),
(44, 1, 6, 1, 5000, 5000, '2019-12-14 20:50:31'),
(45, 1, 3, 1, 3000, 3000, '2019-12-05 11:45:41'),
(46, 1, 3, 1, 3000, 3000, '2019-12-07 03:16:50'),
(47, 1, 6, 1, 5000, 5000, '2019-12-18 12:07:07'),
(48, 1, 3, 1, 3000, 3000, '2019-12-20 09:45:06'),
(49, 1, 3, 1, 3000, 3000, '2019-12-20 19:24:10'),
(50, 1, 6, 1, 5000, 5000, '2019-12-17 02:45:34'),
(51, 1, 3, 1, 3000, 3000, '2019-12-22 10:35:18'),
(52, 1, 3, 1, 3000, 3000, '2019-12-10 03:39:51'),
(53, 1, 6, 1, 5000, 5000, '2019-12-07 17:33:20'),
(54, 1, 3, 1, 3000, 3000, '2019-12-07 11:47:07'),
(55, 1, 3, 1, 3000, 3000, '2019-12-13 13:15:38'),
(56, 1, 6, 1, 5000, 5000, '2019-12-19 13:56:49'),
(57, 1, 3, 1, 3000, 3000, '2019-12-06 12:57:13'),
(58, 1, 3, 1, 3000, 3000, '2019-12-23 05:55:36'),
(59, 1, 6, 1, 5000, 5000, '2019-12-20 21:46:23'),
(60, 1, 3, 1, 3000, 3000, '2019-12-09 02:05:05');

--
-- Triggers `penjualan`
--
DELIMITER $$
CREATE TRIGGER `jual_barang` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN
 UPDATE stok
 SET STOK = STOK - NEW.JUMLAH_BARANG
 WHERE
 ID_BARANG = NEW.ID_BARANG;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `personal_computer`
--

CREATE TABLE `personal_computer` (
  `ID_PC` int(11) NOT NULL,
  `STATUS_PC` tinyint(1) DEFAULT NULL,
  `NAMA_PC` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal_computer`
--

INSERT INTO `personal_computer` (`ID_PC`, `STATUS_PC`, `NAMA_PC`) VALUES
(1, 0, 'PC 01'),
(2, 0, 'PC 02'),
(3, 0, 'PC 03');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `ID_STOK` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `STOK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`ID_STOK`, `ID_BARANG`, `STOK`) VALUES
(1, 3, 21),
(2, 6, 162),
(3, 2, 405);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL,
  `NAMA_USER` char(50) DEFAULT NULL,
  `PASS` varchar(100) DEFAULT NULL,
  `ALAMAT` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USER_ID`, `NAMA_USER`, `PASS`, `ALAMAT`) VALUES
(1, 'Willi', 'willi010', 'Jl. Kenari 7'),
(2, 'Sabam', 'sabam017', 'Jl. Krebas 10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_BARANG`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`ID_BILLING`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`ID_JENIS_BARANG`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID_MEMBER`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`ID_PEMBELIAN`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`ID_PENJUALAN`);

--
-- Indexes for table `personal_computer`
--
ALTER TABLE `personal_computer`
  ADD PRIMARY KEY (`ID_PC`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`ID_STOK`),
  ADD UNIQUE KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `ID_BARANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `ID_BILLING` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `ID_JENIS_BARANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `ID_MEMBER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `ID_PEMBELIAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `ID_PENJUALAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `personal_computer`
--
ALTER TABLE `personal_computer`
  MODIFY `ID_PC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `ID_STOK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
