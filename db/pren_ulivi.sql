-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 19, 2024 alle 17:43
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pren_ulivi`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `tband`
--

CREATE TABLE `tband` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tband`
--

INSERT INTO `tband` (`id`, `nome`) VALUES
(1, 'AC/DC'),
(2, 'Metallica'),
(3, 'The Beatles');

-- --------------------------------------------------------

--
-- Struttura della tabella `tdata`
--

CREATE TABLE `tdata` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `luogo` varchar(30) NOT NULL,
  `band` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tdata`
--

INSERT INTO `tdata` (`id`, `data`, `luogo`, `band`) VALUES
(1, '2024-05-17', 'San Siro', 2),
(3, '2024-05-31', 'Firenze', 2),
(5, '2024-06-20', 'Torino', 1),
(6, '2024-07-16', 'Circo Massimo', 3),
(7, '2024-07-25', 'Arena di Verona', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `tprenotazione`
--

CREATE TABLE `tprenotazione` (
  `id` int(11) NOT NULL,
  `prenotato` tinyint(1) NOT NULL,
  `nPosto` int(11) NOT NULL,
  `data` int(11) NOT NULL,
  `idUtente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tprenotazione`
--

INSERT INTO `tprenotazione` (`id`, `prenotato`, `nPosto`, `data`, `idUtente`) VALUES
(11, 0, 1, 1, NULL),
(12, 0, 2, 1, NULL),
(13, 0, 3, 1, NULL),
(14, 0, 4, 1, NULL),
(15, 0, 5, 1, NULL),
(16, 0, 6, 1, NULL),
(17, 0, 7, 1, NULL),
(18, 0, 8, 1, NULL),
(19, 0, 9, 1, NULL),
(20, 0, 10, 1, NULL),
(21, 0, 1, 7, NULL),
(22, 0, 2, 7, NULL),
(23, 0, 3, 7, NULL),
(24, 0, 4, 7, NULL),
(25, 0, 5, 7, NULL),
(26, 0, 1, 6, NULL),
(27, 0, 2, 6, NULL),
(28, 0, 3, 6, NULL),
(29, 0, 4, 6, NULL),
(30, 0, 5, 6, NULL),
(31, 0, 1, 3, NULL),
(32, 0, 2, 3, NULL),
(33, 0, 3, 3, NULL),
(34, 0, 4, 3, NULL),
(35, 0, 5, 3, NULL),
(36, 0, 1, 5, NULL),
(37, 0, 2, 5, NULL),
(38, 0, 3, 5, NULL),
(39, 0, 4, 5, NULL),
(40, 0, 5, 5, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `tutente`
--

CREATE TABLE `tutente` (
  `idUtente` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `passWord` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tutente`
--

INSERT INTO `tutente` (`idUtente`, `userName`, `passWord`) VALUES
(1, 'user1', 'password1'),
(2, 'user2', 'password2'),
(3, 'user3', 'password3'),
(4, 'user4', 'password4'),
(5, 'user5', 'password5'),
(6, 'user6', 'password6'),
(7, 'user7', 'password7'),
(8, 'user8', 'password8'),
(9, 'user9', 'password9'),
(10, 'user10', 'password10');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `tband`
--
ALTER TABLE `tband`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tdata`
--
ALTER TABLE `tdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `band` (`band`);

--
-- Indici per le tabelle `tprenotazione`
--
ALTER TABLE `tprenotazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data` (`data`);

--
-- Indici per le tabelle `tutente`
--
ALTER TABLE `tutente`
  ADD PRIMARY KEY (`idUtente`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `tband`
--
ALTER TABLE `tband`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `tdata`
--
ALTER TABLE `tdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `tprenotazione`
--
ALTER TABLE `tprenotazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT per la tabella `tutente`
--
ALTER TABLE `tutente`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `tdata`
--
ALTER TABLE `tdata`
  ADD CONSTRAINT `tData_ibfk_1` FOREIGN KEY (`band`) REFERENCES `tband` (`id`);

--
-- Limiti per la tabella `tprenotazione`
--
ALTER TABLE `tprenotazione`
  ADD CONSTRAINT `tprenotazione_ibfk_1` FOREIGN KEY (`data`) REFERENCES `tdata` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
