-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jul 2024 pada 09.58
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
-- Database: `db_sisarpras`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bangunan`
--

CREATE TABLE `tb_bangunan` (
  `id_bangunan` int(11) NOT NULL,
  `kode_bangunan` varchar(255) NOT NULL,
  `nama_bangunan` varchar(255) NOT NULL,
  `jml_lantai_bangunan` varchar(255) NOT NULL,
  `luas_bangunan` varchar(255) NOT NULL,
  `status_bangunan` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `id_merek` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `id_kondisi` int(11) NOT NULL,
  `jumlah_awal` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `keterangan_barang` varchar(255) NOT NULL,
  `tanggal_barang` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `id_merek`, `id_kategori`, `id_ruangan`, `id_kondisi`, `jumlah_awal`, `nama_barang`, `keterangan_barang`, `tanggal_barang`) VALUES
(96, 22, 14, 20, 1, '2', 'Monitor', 'mantabb\r\n', '2024-07-24'),
(97, 27, 19, 20, 1, '10', 'Toner', 'siap pakai', '2024-07-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`, `keterangan`) VALUES
(14, 'Komputer', 'perangkat komputer'),
(15, 'Multimedia', 'ala-alat multimedia'),
(16, 'Jaringan', 'barang perangkat jaringan'),
(17, 'Percetakan', 'perangkat percetakan'),
(19, 'Refill', 'Toner atau Tiinta Printer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kondisi`
--

CREATE TABLE `tb_kondisi` (
  `id_kondisi` int(11) NOT NULL,
  `nama_kondisi` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kondisi`
--

INSERT INTO `tb_kondisi` (`id_kondisi`, `nama_kondisi`, `keterangan`) VALUES
(1, 'Baik', 'Barang bagus'),
(2, 'Rusak Ringan', 'barang barang rusak namun masih bisa dipake'),
(3, 'Rusak Berat', 'barang tidak dapat dipakai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_lahan`
--

CREATE TABLE `tb_lahan` (
  `id_lahan` int(11) NOT NULL,
  `nama_lahan` varchar(255) NOT NULL,
  `no_sert_lahan` varchar(255) NOT NULL,
  `luas_lahan` varchar(255) NOT NULL,
  `status_lahan` enum('Wakaf','Milik Sendiri') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_merek`
--

CREATE TABLE `tb_merek` (
  `id_merek` int(11) NOT NULL,
  `nama_merek` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_merek`
--

INSERT INTO `tb_merek` (`id_merek`, `nama_merek`, `keterangan`) VALUES
(18, 'SHURE', 'mic'),
(19, 'LENOVO', 'merek'),
(20, 'LG', 'merek LG'),
(21, 'CANON', 'merek CANON'),
(22, 'ACER', 'merek ACER'),
(23, 'BROTHER', 'merek BROTHER'),
(24, 'Tonner 2356', 'Toner printer'),
(25, 'Toner 12A', 'Toner printer'),
(26, 'Toner printer 35A', 'Toner printer'),
(27, 'Toner 85A', 'Toner printer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_refill`
--

CREATE TABLE `tb_refill` (
  `id_refill` int(11) NOT NULL,
  `id_merek` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `nama_pemesan` varchar(225) NOT NULL,
  `nama_staf` varchar(225) NOT NULL,
  `tgl_terpakai` date NOT NULL,
  `kondisi` enum('selesai','bermasalah') NOT NULL,
  `keterangan` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ruangan`
--

CREATE TABLE `tb_ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `nama_ruangan` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ruangan`
--

INSERT INTO `tb_ruangan` (`id_ruangan`, `nama_ruangan`, `keterangan`) VALUES
(20, 'TIK', 'Ruangan TIK'),
(21, 'Dosen RMIK', 'Ruang Dosen RMIK'),
(22, 'WEBINAR', 'Ruang WBINAR'),
(23, 'CBT', 'Ruang CBT'),
(24, 'ME', 'Ruang ME'),
(25, 'Lab Statistik', 'Lab Statistik RMIK'),
(26, 'Dosen Bidan (D3)', 'aa'),
(27, 'Dosen Bidan (S1) ', 'aa'),
(28, 'Dosen Bidan (Profesi) ', 'aaa'),
(29, 'Dosen Perawat (S1)', 'aa'),
(30, 'Dosen Perawat (Profesi Ners)', 'aaa'),
(31, 'Lab Komputer', 'aaa'),
(32, 'Dosen Farmasi', 'aa'),
(33, 'Dosen TBD', 'aa'),
(35, 'Lab GADAR', 'aaa'),
(36, 'Lab Terpadu', 'Lab terpadu LT 3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `jenis_transaksi` enum('masuk','keluar','pinjam') NOT NULL,
  `status` enum('belum','selesai') NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan_transaksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `no_hp_user` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_user` enum('admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `no_hp_user`, `username`, `password`, `role_user`) VALUES
(1, 'admin TIK', '08123232', 'admin', 'admin', 'admin'),
(2, 'admin', '123456789', 'admin', 'nimda', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bangunan`
--
ALTER TABLE `tb_bangunan`
  ADD PRIMARY KEY (`id_bangunan`);

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_kondisi`
--
ALTER TABLE `tb_kondisi`
  ADD PRIMARY KEY (`id_kondisi`);

--
-- Indeks untuk tabel `tb_lahan`
--
ALTER TABLE `tb_lahan`
  ADD PRIMARY KEY (`id_lahan`);

--
-- Indeks untuk tabel `tb_merek`
--
ALTER TABLE `tb_merek`
  ADD PRIMARY KEY (`id_merek`);

--
-- Indeks untuk tabel `tb_refill`
--
ALTER TABLE `tb_refill`
  ADD PRIMARY KEY (`id_refill`);

--
-- Indeks untuk tabel `tb_ruangan`
--
ALTER TABLE `tb_ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_bangunan`
--
ALTER TABLE `tb_bangunan`
  MODIFY `id_bangunan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tb_kondisi`
--
ALTER TABLE `tb_kondisi`
  MODIFY `id_kondisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_lahan`
--
ALTER TABLE `tb_lahan`
  MODIFY `id_lahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_merek`
--
ALTER TABLE `tb_merek`
  MODIFY `id_merek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tb_refill`
--
ALTER TABLE `tb_refill`
  MODIFY `id_refill` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_ruangan`
--
ALTER TABLE `tb_ruangan`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
