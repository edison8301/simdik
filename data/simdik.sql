-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2017 at 04:03 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simdik`
--

-- --------------------------------------------------------

--
-- Table structure for table `diklat`
--

CREATE TABLE `diklat` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_jenis_diklat` int(11) NOT NULL,
  `tanggal_pendaftaran` date NOT NULL,
  `tanggal_pelaksanaan` date NOT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `id_penyelenggara` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pejabat_pembina_kepegawaian` varchar(255) NOT NULL,
  `nama_pic` varchar(255) NOT NULL,
  `telepon_pic` varchar(100) NOT NULL,
  `email_pic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_diklat`
--

CREATE TABLE `jenis_diklat` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_diklat`
--

INSERT INTO `jenis_diklat` (`id`, `nama`) VALUES
(1, 'Diklatpim I'),
(2, 'Diklatpim II');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_kelamin`
--

INSERT INTO `jenis_kelamin` (`id`, `nama`) VALUES
(1, 'Laki-laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `jenjang_widyaiswara`
--

CREATE TABLE `jenjang_widyaiswara` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenjang_widyaiswara`
--

INSERT INTO `jenjang_widyaiswara` (`id`, `nama`) VALUES
(1, 'Pertama'),
(2, 'Muda'),
(3, 'Madya'),
(4, 'Utama');

-- --------------------------------------------------------

--
-- Table structure for table `pangkat_golongan`
--

CREATE TABLE `pangkat_golongan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pangkat_golongan`
--

INSERT INTO `pangkat_golongan` (`id`, `nama`) VALUES
(1, 'Pembina Utama - IV/e'),
(2, 'Pembina Utama Madya - IV/d'),
(3, 'Pembina Utama Muda - IV/c'),
(4, 'Pembina Tingkat I - IV/b'),
(5, 'Pembina - IV/a'),
(6, 'Penata Tingkat I - III/d'),
(7, 'Penata - III/c'),
(8, 'Penata Muda Tingkat I - III/b'),
(9, 'Penata Muda - III/a'),
(10, 'Pengatur Tingkat I - II/d'),
(11, 'Pengatur - II/c'),
(12, 'Pengatur Muda Tingkat I - II/b'),
(13, 'Pengatur Muda - II/a'),
(14, 'Juru Tingkat I - I/d'),
(15, 'Juru - I/c'),
(16, 'Juru Muda Tingkat I - I/b'),
(17, 'Juru Muda - I/a');

-- --------------------------------------------------------

--
-- Table structure for table `penjadwalan`
--

CREATE TABLE `penjadwalan` (
  `id` int(11) NOT NULL,
  `id_diklat` int(11) NOT NULL,
  `id_widyaiswara` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `materi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penyelenggara`
--

CREATE TABLE `penyelenggara` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text,
  `email` varchar(100) DEFAULT NULL,
  `telepon` varchar(100) DEFAULT NULL,
  `nama_pic` varchar(100) DEFAULT NULL,
  `telepon_pic` varchar(100) DEFAULT NULL,
  `email_pic` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id` int(11) NOT NULL,
  `id_instansi` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(17) NOT NULL,
  `id_pangkat_golongan` int(11) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `id_jenis_diklat` int(11) NOT NULL,
  `id_diklat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `widyaiswara`
--

CREATE TABLE `widyaiswara` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(17) NOT NULL,
  `id_pangkat_golongan` int(11) NOT NULL,
  `id_jenjang_widyaiswara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diklat`
--
ALTER TABLE `diklat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penyelenggara` (`id_penyelenggara`),
  ADD KEY `id_jenis_diklat` (`id_jenis_diklat`);

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_diklat`
--
ALTER TABLE `jenis_diklat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenjang_widyaiswara`
--
ALTER TABLE `jenjang_widyaiswara`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pangkat_golongan`
--
ALTER TABLE `pangkat_golongan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjadwalan`
--
ALTER TABLE `penjadwalan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_diklat` (`id_diklat`),
  ADD KEY `id_widyaiswara` (`id_widyaiswara`);

--
-- Indexes for table `penyelenggara`
--
ALTER TABLE `penyelenggara`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_instansi` (`id_instansi`),
  ADD KEY `id_pangkat_golongan` (`id_pangkat_golongan`),
  ADD KEY `id_jenis_diklat` (`id_jenis_diklat`),
  ADD KEY `id_diklat` (`id_diklat`);

--
-- Indexes for table `widyaiswara`
--
ALTER TABLE `widyaiswara`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diklat`
--
ALTER TABLE `diklat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jenis_diklat`
--
ALTER TABLE `jenis_diklat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jenjang_widyaiswara`
--
ALTER TABLE `jenjang_widyaiswara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pangkat_golongan`
--
ALTER TABLE `pangkat_golongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `penjadwalan`
--
ALTER TABLE `penjadwalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penyelenggara`
--
ALTER TABLE `penyelenggara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `widyaiswara`
--
ALTER TABLE `widyaiswara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
