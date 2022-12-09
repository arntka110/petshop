-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2022 at 08:07 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(150) NOT NULL,
  `jenis_barang` varchar(150) NOT NULL,
  `tgl_kadaluarsa` varchar(30) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `stok_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `nama_barang`, `jenis_barang`, `tgl_kadaluarsa`, `harga_jual`, `stok_barang`) VALUES
('AKS1001', 'Kalung kucing/Anjing Custom', 'Aksesoris', '-', 25000, 100),
('AKS1002', 'Kacamata Kecil', 'Aksesoris', '-', 16000, 100),
('AKS1003', 'Baju Kucing/Anjing', 'Aksesoris', '-', 27000, 50),
('BR1001', 'Whiskas Dry Food 1kg', 'Makanan', '12 Desember 2023', 88000, 200),
('BR1002', 'Whiskas Wet Food 500gr', 'Makanan', '5 Desember 2023', 95000, 150),
('BR1003', 'Whiskas Milk 200ml', 'Minuman', '09 Juni 2023', 98000, 50),
('MN1001', 'Mainan Kucing Laser', 'Mainan', '-', 10000, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_hewan`
--

CREATE TABLE `tbl_data_hewan` (
  `id_hewan` varchar(11) NOT NULL,
  `nama_hewan` varchar(150) NOT NULL,
  `ras_hewan` varchar(150) NOT NULL,
  `jumlah_hewan` int(11) NOT NULL,
  `umur_hewan` varchar(25) NOT NULL,
  `warna_hewan` varchar(150) NOT NULL,
  `berat_hewan` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_data_hewan`
--

INSERT INTO `tbl_data_hewan` (`id_hewan`, `nama_hewan`, `ras_hewan`, `jumlah_hewan`, `umur_hewan`, `warna_hewan`, `berat_hewan`) VALUES
('HW10101', 'Bubu', 'British', 1, '9 bulan', 'Abu abu', 3.5),
('HW10102', 'Milo', 'Himalaya', 1, '1 tahun 2 bulan', 'Coklat putih', 6.35),
('HW10103', 'Ghea', 'Anggora', 1, '1 tahun 5 bulan', 'Putih Abu', 3.5),
('HW10104', 'Kay', 'Anggora', 1, '11 bulan', 'Abu Coklat', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_layanan`
--

CREATE TABLE `tbl_layanan` (
  `id_layanan` varchar(11) NOT NULL,
  `nama_layanan` varchar(250) NOT NULL,
  `harga_layanan` int(11) NOT NULL,
  `deskripsi` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_layanan`
--

INSERT INTO `tbl_layanan` (`id_layanan`, `nama_layanan`, `harga_layanan`, `deskripsi`) VALUES
('LY1001', 'Full Grooming', 80000, 'Pelayanan grooming meliputi memandikan, menggunting kuku, merapikan bulu, dan membersihkan telinga.'),
('LY1002', 'Treatment Kutu', 65000, 'Treatment kutu/ mandi kutu kucing/ anjing.'),
('LY1003', 'Treatment Jamur', 55000, 'Menggunakan shampoo khusus untuk menghilangkan jamur.'),
('LY1004', 'Penitipan Hewan', 40000, '20000/hari + 20000/hewan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_riwayat_transaksi`
--

CREATE TABLE `tbl_riwayat_transaksi` (
  `id_transaksi` varchar(11) NOT NULL,
  `total_pembayaran` int(11) NOT NULL,
  `id_hewan` varchar(11) DEFAULT NULL,
  `id_layanan` varchar(11) DEFAULT NULL,
  `id_barang` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_riwayat_transaksi`
--

INSERT INTO `tbl_riwayat_transaksi` (`id_transaksi`, `total_pembayaran`, `id_hewan`, `id_layanan`, `id_barang`) VALUES
('TR1101', 80000, 'HW10101', 'LY1001', NULL),
('TR1102', 65000, 'HW10102', 'LY1002', NULL),
('TR1103', 55000, 'HW10103', 'LY1003', NULL),
('TR1104', 65000, 'HW10104', 'LY1002', NULL),
('TR1105', 88000, NULL, NULL, 'BR1001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tbl_data_hewan`
--
ALTER TABLE `tbl_data_hewan`
  ADD PRIMARY KEY (`id_hewan`),
  ADD UNIQUE KEY `id_hewan` (`id_hewan`);

--
-- Indexes for table `tbl_layanan`
--
ALTER TABLE `tbl_layanan`
  ADD PRIMARY KEY (`id_layanan`),
  ADD UNIQUE KEY `id_layanan` (`id_layanan`);

--
-- Indexes for table `tbl_riwayat_transaksi`
--
ALTER TABLE `tbl_riwayat_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_layanan` (`id_layanan`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_data_hewan` (`id_hewan`),
  ADD KEY `id_hewan` (`id_hewan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_riwayat_transaksi`
--
ALTER TABLE `tbl_riwayat_transaksi`
  ADD CONSTRAINT `tbl_riwayat_transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_riwayat_transaksi_ibfk_2` FOREIGN KEY (`id_layanan`) REFERENCES `tbl_layanan` (`id_layanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_riwayat_transaksi_ibfk_3` FOREIGN KEY (`id_hewan`) REFERENCES `tbl_data_hewan` (`id_hewan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
