-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Apr 2024 pada 06.28
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sertifikat_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password`, `full_name`, `email`, `created_at`) VALUES
(4, 'Iky', '$2y$10$LHjLzqTy54AjkzM91fNA.u50IVdduL2evhYbrs8ZrU5HqT7kKoBTC', 'muhammadiky', 'ikyym11@gmail.com', '2024-02-12 20:16:48'),
(5, 'shu', '$2y$10$aU/XZEa9NNbABiwyC4SuCOm5sEkaj/p/Vw2jZnjIy.pKc2guJumSq', 'shu supardi', 'shu@gmail.com', '2024-03-07 01:38:42'),
(6, 'yan', '$2y$10$Ia9VIxhBUtecJiki2jKHA.9UO92bk/GvFMhw2wZ37eTpwOLLl8yue', 'yanto', 'yan@gmail.com', '2024-03-07 06:47:44'),
(7, 'tes', '$2y$10$828z1WwoNoJnwwiEP8zhIOqBeztondep2NiJjvwx3i.IPkGkgiVAS', 'tes hayu', 'tes123@gmail.com', '2024-03-07 07:31:55'),
(8, 'admin1', '$2y$10$iGChWp6nA1mk1x8GoTBxeeoM8UzgODb9sL/nQHkT8.fFC1iRiXK42', 'admin1', 'admin@gmail.com', '2024-04-17 00:55:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `certificates`
--

CREATE TABLE `certificates` (
  `certificate_id` int(11) NOT NULL,
  `participant_name` varchar(255) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `certificate_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `certificates`
--

INSERT INTO `certificates` (`certificate_id`, `participant_name`, `event_name`, `event_date`, `certificate_text`, `created_at`) VALUES
(33, 'juned sumarno', 'lomba lari', '2024-03-08', 'p', '2024-04-18 03:57:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `certificate_assignments`
--

CREATE TABLE `certificate_assignments` (
  `assignment_id` int(11) NOT NULL,
  `certificate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `certificate_assignments`
--

INSERT INTO `certificate_assignments` (`assignment_id`, `certificate_id`, `user_id`, `admin_id`, `event_id`, `assigned_at`, `role`) VALUES
(1, NULL, 9, NULL, 1, '2024-01-30 23:25:54', 'user'),
(2, NULL, 10, NULL, 1, '2024-01-30 23:29:00', 'user'),
(3, NULL, 10, NULL, 1, '2024-01-30 23:30:10', 'user'),
(4, NULL, 9, NULL, 1, '2024-01-30 23:31:14', 'user'),
(5, NULL, 10, NULL, 2, '2024-01-31 00:30:54', 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `organizer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `event_date`, `location`, `organizer`, `created_at`) VALUES
(6, 'cc3', '2024-03-08', 'rhodos island', 'sarkaz', '2024-03-07 02:27:21'),
(8, 'lomba mencari bintang', '2024-03-09', 'indonesia', 'adf', '2024-03-07 06:00:53'),
(9, 'lomba lari', '2024-03-08', 'depok', 'yanto', '2024-03-07 06:48:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `email`, `created_at`) VALUES
(12, 'juned', '$2y$10$/Px543ERlAQGWK5iGEW2WeqbDEOSJAfFwYEVZmhtIFpLMcC72Qpgm', 'juned sumarno', 'juned@gmail.com', '2024-03-07 03:13:35'),
(13, 'jun', '$2y$10$hoou/ZteTKsfWlZC4ahkteU9um8TblaxGMdwKzz43zghvCpJj/seW', 'yuna', 'yuna@gmail.com', '2024-03-07 06:52:14'),
(14, 'user1', '$2y$10$fUiCldzti9c/wSVQKBp.vOr0S1fXHhCaoaMBCPlLe3QpXTi56/.rK', 'user1', 'user@gmail.com', '2024-04-17 02:29:37'),
(15, 'user2', '$2y$10$gS7ttXaHquPJkoHJRaX/WeX8auRhsvCccjXxBN/OQoeuqXHkHz5Hq', 'user2', 'user2@gmail.com', '2024-04-17 03:26:51'),
(16, 'ammar', '$2y$10$xZ6tFC/kAxUcHm9sECbkb.SaQr5SSKh9N6yMXsmPfTNX7xpb1JAEu', 'ammar', 'am@gmail.com', '2024-04-18 03:45:37'),
(17, 'thawaf', '$2y$10$ASkRag.c92J5vXAnZ18MaeQN4BKn3tXo1CGnaq..mHXBwNTvka0X6', 'thawaf', 'th@gmail.com', '2024-04-18 03:46:19');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`certificate_id`);

--
-- Indeks untuk tabel `certificate_assignments`
--
ALTER TABLE `certificate_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `certificate_id` (`certificate_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `certificates`
--
ALTER TABLE `certificates`
  MODIFY `certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `certificate_assignments`
--
ALTER TABLE `certificate_assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
