-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Okt 2022 pada 22.52
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bamboo_art`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id_cart` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `banyak` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `carts`
--

INSERT INTO `carts` (`id_cart`, `user_id`, `product_id`, `banyak`, `total`) VALUES
(4, 14, 13, 2, 600000),
(5, 14, 14, 1, 200000),
(6, 14, 15, 1, 400000),
(7, 14, 16, 1, 1500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`) VALUES
(0, 'Kursi', 'kursi'),
(1, 'Meja', 'meja'),
(2, 'Lemari', 'lemari'),
(3, 'Ranjang', 'ranjang'),
(4, 'Gazebo', 'gazebo'),
(5, 'Lain-lain', 'lain-lain');

-- --------------------------------------------------------

--
-- Struktur dari tabel `drivers`
--

CREATE TABLE `drivers` (
  `id_driver` int(11) NOT NULL,
  `name_driver` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `jurusan` varchar(255) NOT NULL,
  `no_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `drivers`
--

INSERT INTO `drivers` (`id_driver`, `name_driver`, `email`, `password`, `phone_number`, `jurusan`, `no_pegawai`) VALUES
(1, 'Sulton Rosadi', 'sulton@gmail.com', '$2y$10$GzyjiDN5Yh/ccf8Fpw20LeYMI7QFOJN6aEUd/2dl6hY9YkEvG73OW', '098887665455', 'JAKARTA', 11221133),
(2, 'Ahmad Faridh', 'farid@gmail.com', '$2y$10$jYa12Iccc3U5r.LOcVSi.etfKxweMBlRKJBfrwq.qf1/xu8q9UArG', '999999888767', 'BOGOR', 223355);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `unit` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `descriptions` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `stock` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id_product`, `product_name`, `unit`, `price`, `descriptions`, `category_id`, `stock`) VALUES
(13, 'Kursi Sofa', 1000, '300000', '<p>ini kursi sofa bisa diedit jadi 100 stok</p>\r\n', 0, '1000'),
(14, 'Kursi Santai', 1000, '200000', '<p>ini kursi santai sudah bisa diedit</p>\r\n', 0, '2500'),
(15, 'Meja', 1000, '400000', '<p>ini meja</p>\r\n', 1, '4000'),
(16, 'Ranjang', 1000, '1500000', '<p>ini ranjang yang baru</p>\r\n', 3, '4000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products_galleries`
--

CREATE TABLE `products_galleries` (
  `id_gallery` int(11) NOT NULL,
  `photos` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products_galleries`
--

INSERT INTO `products_galleries` (`id_gallery`, `photos`, `product_id`) VALUES
(1, '635c334871e49.jpg', 16),
(2, '635c3368cf22f.png', 15),
(3, '635c339152314.jpg', 14),
(4, '635c33b54e3f2.jpg', 13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening_numbers`
--

CREATE TABLE `rekening_numbers` (
  `id_rekening` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `rekening_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rekening_numbers`
--

INSERT INTO `rekening_numbers` (`id_rekening`, `bank_name`, `number`, `rekening_name`) VALUES
(1, 'BCA', '0989878998787', 'Sayudi Cenah'),
(2, 'Mandiri', '076543212123', 'Mimin'),
(3, 'Syariah', '09999977656', 'Subardjoe');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id_transaction` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `rekening_id` int(11) NOT NULL,
  `transaction_status` varchar(255) NOT NULL,
  `weight_total` int(11) NOT NULL,
  `delivered` int(11) NOT NULL,
  `photo_transaction` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `time_arrived` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id_transaction`, `user_id`, `total_price`, `city`, `rekening_id`, `transaction_status`, `weight_total`, `delivered`, `photo_transaction`, `code`, `receiver`, `time_arrived`, `created_at`) VALUES
(1, 3, 260000, 'JAKARTA', 3, 'TERKIRIM', 4000, 0, '600d9b95c0711.jpg', 'EZM-57924', '', NULL, '2021-01-24 16:08:32'),
(2, 6, 200000, 'JAKARTA', 1, 'TERKIRIM', 4000, 0, '600d9c6b4e0d8.jpg', 'EZM-9366', '', NULL, '2021-01-24 16:12:13'),
(3, 9, 560000, 'JAKARTA', 1, 'KONFIRMASI', 3000, 0, '600e62cb73e61.png', 'EZM-86335', '', NULL, '2021-01-25 06:17:49'),
(4, 6, 100000, 'JAKARTA', 2, 'KONFIRMASI', 1000, 0, '600eba552a23c.png', 'EZM-81471', '', NULL, '2021-01-25 12:31:43'),
(5, 3, 218000, 'JAKARTA', 2, 'BELUM KONFIRMASI', 6000, 0, '6010cc60e12da.png', 'EZM-51571', '', NULL, '2021-01-25 13:06:50'),
(6, 9, 370000, 'JAKARTA', 1, 'TERKIRIM', 10000, 1, '6010ce5c5fc7f.png', 'EZM-98816', 'Mumun', '2021-01-27 05:26:45', '2021-01-27 02:21:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions_details`
--

CREATE TABLE `transactions_details` (
  `id_transaction_detail` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `banyak` int(11) NOT NULL,
  `code_product` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactions_details`
--

INSERT INTO `transactions_details` (`id_transaction_detail`, `transaction_id`, `product_id`, `price`, `banyak`, `code_product`) VALUES
(1, 1, 1, 50000, 2, 'PRD-12943'),
(2, 1, 2, 80000, 2, 'PRD-12943'),
(3, 2, 1, 50000, 2, 'PRD-13113'),
(4, 2, 1, 50000, 2, 'PRD-13113'),
(5, 3, 2, 80000, 2, 'PRD-40981'),
(6, 3, 6, 400000, 1, 'PRD-40981'),
(7, 4, 3, 100000, 1, 'PRD-60879'),
(8, 5, 5, 20000, 2, 'PRD-71011'),
(9, 5, 10, 75000, 2, 'PRD-71011'),
(10, 5, 12, 14000, 2, 'PRD-71011'),
(11, 6, 4, 36000, 5, 'PRD-94186'),
(12, 6, 1, 30000, 1, 'PRD-94186'),
(13, 6, 2, 40000, 4, 'PRD-94186');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `postal_code` varchar(191) NOT NULL,
  `roles` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `password`, `address`, `phone_number`, `postal_code`, `roles`) VALUES
(1, 'nasrul', 'tes@gmail.com', '$2y$10$jkQhAmpusZCb6Q2BNr8rn.d25yuhMa1NCuSGJEDyPyaTUFbqSC4B6', NULL, '09090909', '', 'USER'),
(2, 'Admin', 'admin@gmail.com', '$2y$10$nKjgtRATO9Q3hf1f8ds4jOsyyD1OYesV0N9PyLPZR0ob6cXfN47ZG', '<p>Jln Gang Hamzah No 22</p>\r\n', '098987898765', '11111111', 'ADMIN'),
(3, 'AMANDA PUTRI', 'manda@gmail.com', '$2y$10$2jrwSDZqHQgKlTUxPGnRau8ZD8Jgj9lNE4tBvRDsuNKNzVnEsbtxG', '<p>Jln Kampung Gunung No 22</p>\r\n', '099998887776', '224455', 'USER'),
(6, 'Vita Mahandari', 'vita@gmail.com', '$2y$10$2s/dgjADHLW1D5Ha.1qdz.as3ShDVYB/2V8fHh/P81dqtlKK2V8nG', '<p>Jln Rawa Belong No 54</p>\r\n', '098765432111', '445566', 'USER'),
(9, 'riski', 'riski@gmail.com', '$2y$10$xrt0u8OUv5S7n7L94MMSfuKtykPNnpvnrRLp0LQuV1dD5lsgpeuLW', '<p>Jln Athar Muhammad No 24</p>\r\n', '12345678', '10101010', 'USER'),
(10, 'Syatya Athary', 'athar@gmail.com', '$2y$10$LGiCeFBz8fFfOTkL8hMJxO1P6e6qq2aW3Vcc2jcc0SbdGHrVPnXX.', '<p>Jln H sanusi Gang Hamzah No 28</p>\r\n', '098777776668', '12345', 'OWNER'),
(14, 'kepobgt', 'kepo@gmail.com', '$2y$10$8f7Zl1Sf20RjUNp2tWPc3OZ0s2m2ApqmaXFUf0ub.b8ZR7CH5q.q2', NULL, '08979000', '', 'USER'),
(15, 'satu', 'satu@gmail.com', '$2y$10$PJSGtHXuXxvY.LDoz8wU8ONTfnYTB/Zpy6qInv9v7CB6Bd39Rfyz.', NULL, '08212323333', '', 'USER'),
(16, '123', '123@gmail.com', '$2y$10$NFSHA2mDZKwSOYoz9F4r9uX0KAyaWc1dRF7GHPODQNss4GqmUiguW', NULL, '123', '', 'USER');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indeks untuk tabel `products_galleries`
--
ALTER TABLE `products_galleries`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `products_galleries`
--
ALTER TABLE `products_galleries`
  MODIFY `id_gallery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
