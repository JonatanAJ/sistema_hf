-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Dez-2024 às 18:36
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `login`
--
CREATE DATABASE IF NOT EXISTS `login` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `login`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `servername` varbinary(255) DEFAULT NULL,
  `namedatabase` varbinary(255) DEFAULT NULL,
  `nameuser` varbinary(255) DEFAULT NULL,
  `senhabd` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `servername`, `namedatabase`, `nameuser`, `senhabd`) VALUES
(5, 'Jonatan', 'jonatan@gmail.com', '$2y$10$8CBrbf5XnOEWwOiHMU0xMu6li..Q8fd/mTrSGPCt60S3NK52.c6f6', 0x0155fecb3c5e40f35129990c0febef2a, 0xf619f3ee499808fe10dfaf5a95097b1f, 0xfeccde2b212d9113a871431ac7380d7c, 0xb2094f79d22b9451d77c81433c32e1b8),
(1123, 'Jonatan', 'jonata3n7@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0x0155fecb3c5e40f35129990c0febef2a, 0xf619f3ee499808fe10dfaf5a95097b1f, 0xfeccde2b212d9113a871431ac7380d7c, 0xb2094f79d22b9451d77c81433c32e1b8);

--
-- Acionadores `usuarios`
--
DROP TRIGGER IF EXISTS `trg_EncryptPassword`;
DELIMITER $$
CREATE TRIGGER `trg_EncryptPassword` BEFORE INSERT ON `usuarios` FOR EACH ROW BEGIN
    -- Criptografar a senha usando SHA2_256
    SET NEW.senha = SHA2(NEW.senha, 256);
END
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
