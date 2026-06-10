-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 10, 2026 at 09:12 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `islandia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontynenty`
--

CREATE TABLE `kontynenty` (
  `idKontynent` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kontynenty`
--

INSERT INTO `kontynenty` (`idKontynent`, `nazwa`) VALUES
(1, 'Europa'),
(2, 'Azja'),
(3, 'Ameryka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `obiekty`
--

CREATE TABLE `obiekty` (
  `idObiekt` int(10) UNSIGNED NOT NULL,
  `idKontynent` int(10) UNSIGNED DEFAULT NULL,
  `idRodzaj` int(10) UNSIGNED DEFAULT NULL,
  `nazwa` varchar(20) DEFAULT NULL,
  `opis` text DEFAULT NULL,
  `plik` varchar(100) DEFAULT NULL,
  `nazwaCechy` varchar(30) DEFAULT NULL,
  `wartoscCechy` int(10) UNSIGNED DEFAULT NULL,
  `panstwo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `obiekty`
--

INSERT INTO `obiekty` (`idObiekt`, `idKontynent`, `idRodzaj`, `nazwa`, `opis`, `plik`, `nazwaCechy`, `wartoscCechy`, `panstwo`) VALUES
(1, 1, 1, 'Rysy', 'Najwyższy szczyt w Polsce', 'skoga.jpg', 'Wysokosc', 2499, 'Polska'),
(2, 1, 2, 'Morskie Oko', 'Piękne jezioro tatrzańskie', 'skoga.jpg', 'Glebokosc', 50, 'Polska'),
(6, 1, 10, 'Skogafoss', 'Wspaniały wodospad', 'skoga.jpg', 'Wysokość', 60, 'Islandia'),
(7, 1, 10, 'Seljalandsfoss', 'Wodospad z przejściem', 'skoga.jpg', 'Wysokość', 65, 'Islandia'),
(8, 1, 14, 'Latrabjarg', 'Siedlisko maskonurów', 'skoga.jpg', 'Liczba gatunków', 5, 'Islandia'),
(9, 1, 14, 'Ingolfshofdi', 'Rezerwat przyrody', 'skoga.jpg', 'Powierzchnia', 10, 'Islandia'),
(10, 1, 10, 'Gullfoss', 'Złoty wodospad', 'skoga.jpg', 'Wysokość', 32, 'Islandia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osiagniecia`
--

CREATE TABLE `osiagniecia` (
  `idOsiagniecie` int(10) UNSIGNED NOT NULL,
  `idObiekt` int(10) UNSIGNED DEFAULT NULL,
  `idTurysta` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `osiagniecia`
--

INSERT INTO `osiagniecia` (`idOsiagniecie`, `idObiekt`, `idTurysta`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaje`
--

CREATE TABLE `rodzaje` (
  `idRodzaj` int(10) UNSIGNED NOT NULL,
  `rodzaj` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rodzaje`
--

INSERT INTO `rodzaje` (`idRodzaj`, `rodzaj`) VALUES
(1, 'Góra'),
(2, 'Jezioro'),
(3, 'Zabytek'),
(10, 'Wodospad'),
(14, 'Siedlisko');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `turysci`
--

CREATE TABLE `turysci` (
  `idTurysta` int(10) UNSIGNED NOT NULL,
  `nick` varchar(20) DEFAULT NULL,
  `punkty` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `turysci`
--

INSERT INTO `turysci` (`idTurysta`, `nick`, `punkty`) VALUES
(1, 'Podroznik99', 150),
(2, 'GorskiWeteran', 300);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kontynenty`
--
ALTER TABLE `kontynenty`
  ADD PRIMARY KEY (`idKontynent`);

--
-- Indeksy dla tabeli `obiekty`
--
ALTER TABLE `obiekty`
  ADD PRIMARY KEY (`idObiekt`),
  ADD KEY `idKontynent` (`idKontynent`),
  ADD KEY `idRodzaj` (`idRodzaj`);

--
-- Indeksy dla tabeli `osiagniecia`
--
ALTER TABLE `osiagniecia`
  ADD PRIMARY KEY (`idOsiagniecie`),
  ADD KEY `idObiekt` (`idObiekt`),
  ADD KEY `idTurysta` (`idTurysta`);

--
-- Indeksy dla tabeli `rodzaje`
--
ALTER TABLE `rodzaje`
  ADD PRIMARY KEY (`idRodzaj`);

--
-- Indeksy dla tabeli `turysci`
--
ALTER TABLE `turysci`
  ADD PRIMARY KEY (`idTurysta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kontynenty`
--
ALTER TABLE `kontynenty`
  MODIFY `idKontynent` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `obiekty`
--
ALTER TABLE `obiekty`
  MODIFY `idObiekt` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `osiagniecia`
--
ALTER TABLE `osiagniecia`
  MODIFY `idOsiagniecie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rodzaje`
--
ALTER TABLE `rodzaje`
  MODIFY `idRodzaj` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `turysci`
--
ALTER TABLE `turysci`
  MODIFY `idTurysta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `obiekty`
--
ALTER TABLE `obiekty`
  ADD CONSTRAINT `obiekty_ibfk_1` FOREIGN KEY (`idKontynent`) REFERENCES `kontynenty` (`idKontynent`),
  ADD CONSTRAINT `obiekty_ibfk_2` FOREIGN KEY (`idRodzaj`) REFERENCES `rodzaje` (`idRodzaj`);

--
-- Constraints for table `osiagniecia`
--
ALTER TABLE `osiagniecia`
  ADD CONSTRAINT `osiagniecia_ibfk_1` FOREIGN KEY (`idObiekt`) REFERENCES `obiekty` (`idObiekt`),
  ADD CONSTRAINT `osiagniecia_ibfk_2` FOREIGN KEY (`idTurysta`) REFERENCES `turysci` (`idTurysta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
