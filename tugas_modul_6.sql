-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2026 at 03:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas modul 6`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_ambilmk`
--

CREATE TABLE `tabel_ambilmk` (
  `NIM` int(11) NOT NULL,
  `kode_mk` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_ambilmk`
--

INSERT INTO `tabel_ambilmk` (`NIM`, `kode_mk`) VALUES
(25050, 'TIF113'),
(25051, 'TE113'),
(25052, 'TE111'),
(25053, 'TE111'),
(25054, 'TIF111'),
(25050, 'TE111'),
(25051, 'TE112'),
(25052, 'TIF111'),
(25053, 'TIF112'),
(25050, 'TE111'),
(25054, 'TE113');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_dosen`
--

CREATE TABLE `tabel_dosen` (
  `kode_dosen` int(11) NOT NULL,
  `Nama_Dosen` varchar(30) NOT NULL,
  `alamat_dosen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_dosen`
--

INSERT INTO `tabel_dosen` (`kode_dosen`, `Nama_Dosen`, `alamat_dosen`) VALUES
(14040, 'Bagus Xavier Andala', 'Wonosobo'),
(14041, 'Julian Sandiaga', 'Wonosari'),
(14042, 'Nanda Divaga', 'Bandung'),
(14043, 'Aan Budi Kusuma', 'Surabaya'),
(14044, 'Nava Rinda', 'Yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_jurusan`
--

CREATE TABLE `tabel_jurusan` (
  `kode_jurusan` varchar(6) NOT NULL,
  `nama_jurusan` varchar(20) NOT NULL,
  `kode_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_jurusan`
--

INSERT INTO `tabel_jurusan` (`kode_jurusan`, `nama_jurusan`, `kode_dosen`) VALUES
('TE', 'Teknik Elektro', 14040),
('TIF', 'Teknologi Informasi', 14043);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_mahasiswa`
--

CREATE TABLE `tabel_mahasiswa` (
  `NIM` int(11) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jenis Kelamin` enum('L','P') NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_mahasiswa`
--

INSERT INTO `tabel_mahasiswa` (`NIM`, `Nama`, `Jenis Kelamin`, `Alamat`) VALUES
(25050, 'Radja HM', 'L', 'Wonosari'),
(25051, 'Ahmad Zandra', 'L', 'Wonosobo'),
(25052, 'Maina', 'P', 'Magelang'),
(25053, 'Maria', 'P', 'Temanggung'),
(25054, 'Helmi', 'L', 'Purworejo');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_matakuliah`
--

CREATE TABLE `tabel_matakuliah` (
  `kode_mk` varchar(11) NOT NULL,
  `Nama_Mata_Kuliah` varchar(20) NOT NULL,
  `SKS` int(11) NOT NULL,
  `Semester` int(11) NOT NULL,
  `kode_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_matakuliah`
--

INSERT INTO `tabel_matakuliah` (`kode_mk`, `Nama_Mata_Kuliah`, `SKS`, `Semester`, `kode_dosen`) VALUES
('TE111', 'Arus Listrik', 2, 3, 14040),
('TE112', 'Robotik', 3, 1, 14040),
('TE113', 'Medan Listrik', 2, 4, 14043),
('TIF111', 'Software Develpoment', 3, 1, 14042),
('TIF112', 'Cyber', 2, 2, 14042),
('TIF113', 'Paradigma Sistem', 3, 4, 14044);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_dosen`
--
ALTER TABLE `tabel_dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indexes for table `tabel_jurusan`
--
ALTER TABLE `tabel_jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `tabel_mahasiswa`
--
ALTER TABLE `tabel_mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `tabel_matakuliah`
--
ALTER TABLE `tabel_matakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_dosen`
--
ALTER TABLE `tabel_dosen`
  MODIFY `kode_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14045;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
