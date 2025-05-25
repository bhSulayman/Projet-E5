-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 07 mai 2025 à 09:54
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sneakverse`
--

-- --------------------------------------------------------

--
-- Structure de la table `chaussures`
--

DROP TABLE IF EXISTS `chaussures`;
CREATE TABLE IF NOT EXISTS `chaussures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `marque` varchar(100) NOT NULL,
  `description` text,
  `prix` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `date_ajout` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `chaussures`
--

INSERT INTO `chaussures` (`id`, `nom`, `marque`, `description`, `prix`, `image_url`, `date_ajout`) VALUES
(1, 'Air Jordan 1', 'Nike', 'Une chaussure iconique pour les amateurs de baskets.', 199.99, 'https://www.endclothing.com/us/nike-air-jordan-1-retro-high-og-varsity-red-555088-101.html', '2025-02-03 08:31:26'),
(2, 'Yeezy Boost 350', 'Adidas', 'Confort et style réunis.', 249.99, 'https://sneakernews.com/2020/12/13/adidas-yeezy-boost-350-v2-ash-pearl-release-date/', '2025-02-03 08:31:26'),
(3, 'Converse Chuck Taylor', 'Converse', 'Le classique intemporel.', 79.99, 'https://www.zappos.com/p/converse-chuck-taylor-all-star-leather-hi-black/product/7188222/color/3', '2025-02-03 08:31:26'),
(4, 'Nike Dunk Low', 'Nike', 'Un design rétro et une excellente finition.', 129.99, 'https://sneakernews.com/2022/10/28/nike-dunk-low-active-fuchsia-release-info/', '2025-02-03 08:31:26'),
(5, 'Puma Suede Classic', 'Puma', 'Un modèle intemporel en daim.', 89.99, 'https://www.80scasualclassics.co.uk/trainers-c12/puma-suede-classic-premium-trainers-black-with-gum-sole-p9933', '2025-02-03 08:31:26'),
(6, 'New Balance 550', 'New Balance', 'Une sneaker vintage avec une touche moderne.', 159.99, 'https://www.newbalance.com/pd/550/BB550LA1-33778.html', '2025-02-03 08:31:26'),
(7, 'Vans Old Skool', 'Vans', 'Un style skateboard classique.', 74.99, 'https://www.vans.com/old-skool-shoes.html', '2025-02-03 08:31:26'),
(8, 'Reebok Club C 85', 'Reebok', 'Minimalisme et élégance pour un look rétro.', 99.99, 'https://www.reebok.com/us/club-c-85-shoes/AR0456.html', '2025-02-03 08:31:26'),
(9, 'Air Force 1', 'Nike', 'Une sneaker indémodable avec un confort optimal.', 109.99, 'https://www.nike.com/t/air-force-1-07-mens-shoes-5QFp5Z', '2025-02-03 08:31:26'),
(10, 'ASICS Gel-Lyte III', 'ASICS', 'Un confort ultime avec un look unique.', 139.99, 'https://www.asics.com/us/en-us/gel-lyte-iii-og/p/ANA_1201A482-020.html', '2025-02-03 08:31:26');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chaussure_id` int NOT NULL,
  `taille_id` int NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chaussure_id` (`chaussure_id`),
  KEY `taille_id` (`taille_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `chaussure_id`, `taille_id`, `stock`) VALUES
(1, 1, 5, 10),
(2, 1, 6, 5),
(3, 1, 7, 8),
(4, 2, 7, 8),
(5, 2, 8, 6),
(6, 2, 9, 12),
(7, 3, 4, 15),
(8, 3, 5, 9),
(9, 3, 6, 14),
(10, 4, 6, 7),
(11, 4, 7, 10),
(12, 4, 8, 5),
(13, 5, 5, 12),
(14, 5, 6, 7),
(15, 5, 7, 4),
(16, 6, 7, 6),
(17, 6, 8, 11),
(18, 6, 9, 9),
(19, 7, 4, 10),
(20, 7, 5, 6),
(21, 7, 6, 15),
(22, 8, 5, 7),
(23, 8, 6, 9),
(24, 8, 7, 10),
(25, 9, 6, 12),
(26, 9, 7, 14),
(27, 9, 8, 8),
(28, 10, 8, 5),
(29, 10, 9, 6),
(30, 10, 10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `tailles`
--

DROP TABLE IF EXISTS `tailles`;
CREATE TABLE IF NOT EXISTS `tailles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taille` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tailles`
--

INSERT INTO `tailles` (`id`, `taille`) VALUES
(1, '36'),
(2, '37'),
(3, '38'),
(4, '39'),
(5, '40'),
(6, '41'),
(7, '42'),
(8, '43'),
(9, '44'),
(10, '45');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(240) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `email`, `password`, `nom`, `prenom`, `date_inscription`) VALUES
(1, 'sousou@gmail.com', '$2a$10$Wlp4OcmO.fZzckALnMi2neKpbmp/gbsDBnxH.ey9iNW9f4By2zirG', 'sousou', 'xouxou', '2025-04-30 08:55:29'),
(2, 'kelian', '$2a$10$JhXBkZsFfTPqAzBt07xOUu/frYLLfSTqXczFHGxMIHfuzrNW79kd.', 'kelian', 'kelian', '2025-04-30 09:25:56'),
(5, 'sow', '$2a$10$ePbUNS9xFy5WlEbqyPm9z./9cc0hPC4O0I415CZu7pmDnLHa6GOV2', 'sow', 'sow', '2025-05-05 07:44:08'),
(4, 'soso@gmail.com', '$2a$10$AGIBsyk6or0MzVcejHoD3e7koriqV9y/qRfBUh5BajoKrKXrsNTxO', 'soso', 'soso', '2025-05-05 06:56:21'),
(6, 'sara', '$2a$10$j/lUtYkPhahvJMhoSURx2OPFp1Gg1zcb4OtbPfCReGBgQNRbEyrFq', 'sara', 'sara', '2025-05-07 08:57:12');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
