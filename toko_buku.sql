-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2026 pada 09.09
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_buku`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_transaksi` (`p_id_pelanggan` INT, `p_id_buku` INT, `p_jumlah` INT)   BEGIN
    DECLARE harga_buku DECIMAL(10,2);
    DECLARE stok_tersedia INT;
    DECLARE total DECIMAL(10,2);

    -- Ambil harga dan stok buku
    SELECT harga, stok INTO harga_buku, stok_tersedia
    FROM buku WHERE id_buku = p_id_buku;

    -- Validasi stok
    IF stok_tersedia < p_jumlah THEN
        SELECT 'Error: Stok tidak mencukupi!' AS pesan;
    ELSE
        -- Hitung total harga
        SET total = harga_buku * p_jumlah;

        -- Kurangi stok buku
        UPDATE buku SET stok = stok - p_jumlah WHERE id_buku = p_id_buku;

        -- Simpan transaksi
        INSERT INTO transaksi (id_pelanggan, id_buku, jumlah, total_harga, tanggal_transaksi)
        VALUES (p_id_pelanggan, p_id_buku, p_jumlah, total, CURDATE());

        -- Update total belanja pelanggan
        UPDATE pelanggan SET total_belanja = total_belanja + total
        WHERE id_pelanggan = p_id_pelanggan;

        SELECT 'Transaksi berhasil' AS pesan;
    END IF;
END$$

--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hitung_diskon` (`total_belanja` DECIMAL(10,2)) RETURNS DECIMAL(5,2) DETERMINISTIC BEGIN
    DECLARE diskon DECIMAL(5,2);
    IF total_belanja >= 5000000 THEN
        SET diskon = 10.00;
    ELSEIF total_belanja >= 1000000 THEN
        SET diskon = 5.00;
    ELSE
        SET diskon = 0.00;
    END IF;
    RETURN diskon;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `harga`, `stok`) VALUES
(1, 'Bumi', 'Tere Liye', 85000.00, 0),
(2, 'Laskar Pelangi', 'Andrea Hirata', 75000.00, 6),
(3, 'Last Burger From You', 'GradienT', 120000.00, 1),
(4, 'Tokyo Ghoul', 'Sui Ishida', 130000.00, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `total_belanja` decimal(10,2) DEFAULT 0.00,
  `status_member` enum('REGULER','GOLD','PLATINUM') DEFAULT 'REGULER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `total_belanja`, `status_member`) VALUES
(1, 'Haris', 170000.00, 'REGULER'),
(2, 'Feiza', 1970000.00, 'GOLD'),
(3, 'Bambang', 2500000.00, 'GOLD');

--
-- Trigger `pelanggan`
--
DELIMITER $$
CREATE TRIGGER `update_status_member` BEFORE UPDATE ON `pelanggan` FOR EACH ROW BEGIN
    -- Kita langsung mengubah nilai NEW tanpa perintah UPDATE
    IF NEW.total_belanja >= 5000000 THEN
        SET NEW.status_member = 'PLATINUM';
    ELSEIF NEW.total_belanja >= 1000000 THEN
        SET NEW.status_member = 'GOLD';
    ELSE
        SET NEW.status_member = 'REGULER';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_buku`, `jumlah`, `total_harga`, `tanggal_transaksi`) VALUES
(1, 1, 1, 2, 170000.00, '2026-06-21'),
(5, 1, 1, 9, 765000.00, '2026-06-21'),
(6, 2, 4, 9, 1170000.00, '2026-06-21'),
(7, 2, 4, 9, 1170000.00, '2026-06-21');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
