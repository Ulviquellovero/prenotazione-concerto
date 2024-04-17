-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Apr 17, 2024 alle 09:54
-- Versione del server: 10.11.4-MariaDB-1~deb12u1
-- Versione PHP: 8.2.7

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
-- Struttura della tabella `tBand`
--

CREATE TABLE `tBand` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tBand`
--

INSERT INTO `tBand` (`id`, `nome`) VALUES
(1, 'AC/DC'),
(2, 'Metallica'),
(3, 'The Beatles');

-- --------------------------------------------------------

--
-- Struttura della tabella `tData`
--

CREATE TABLE `tData` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `band` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tprenotazione`
--

CREATE TABLE `tprenotazione` (
  `id` int(11) NOT NULL,
  `prenotato` tinyint(1) NOT NULL,
  `idSessioneUtente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tprenotazione`
--

INSERT INTO `tprenotazione` (`id`, `prenotato`, `idSessioneUtente`) VALUES
(1, 1, '9b209d2b2fa91784c2e64a7481ce9406'),
(2, 1, 'b1d3bf5439bcf705e12e5497d880a4fc'),
(3, 1, '24381ff508c823a5fa5774ea67e145fa'),
(4, 1, 'cb45c22dc8544ebe1298e96c3eb1c9a8'),
(5, 1, '86edd93de17544fb6fd3d66aefa9e939'),
(6, 1, 'fe055c06027164b509dc3a5d2c680c13'),
(7, 1, '449fabd311f3f6c02fc18d6e3cca405e'),
(8, 1, '4c2319a321ba2712b3589ddb1cde5d06'),
(9, 1, '447bc4825591f897a5744ce60dedda65'),
(10, 1, '00af50b61706a147eea4d7c5d8176ded');

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
-- Indici per le tabelle `tBand`
--
ALTER TABLE `tBand`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tData`
--
ALTER TABLE `tData`
  ADD PRIMARY KEY (`id`),
  ADD KEY `band` (`band`);

--
-- Indici per le tabelle `tprenotazione`
--
ALTER TABLE `tprenotazione`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT per la tabella `tBand`
--
ALTER TABLE `tBand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `tData`
--
ALTER TABLE `tData`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tprenotazione`
--
ALTER TABLE `tprenotazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `tutente`
--
ALTER TABLE `tutente`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `tData`
--
ALTER TABLE `tData`
  ADD CONSTRAINT `tData_ibfk_1` FOREIGN KEY (`band`) REFERENCES `tBand` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
