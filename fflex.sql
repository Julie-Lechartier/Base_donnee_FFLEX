-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 déc. 2023 à 10:48
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fflex`
--

-- --------------------------------------------------------

--
-- Structure de la table `historique_abonnement`
--

DROP TABLE IF EXISTS `historique_abonnement`;
CREATE TABLE IF NOT EXISTS `historique_abonnement` (
  `ID_user` int NOT NULL,
  `ID_abo` int NOT NULL,
  `date_achat` date DEFAULT NULL,
  `tarif` int DEFAULT NULL,
  KEY `ID_user` (`ID_user`),
  KEY `ID_abo` (`ID_abo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `historique_abonnement`
--

INSERT INTO `historique_abonnement` (`ID_user`, `ID_abo`, `date_achat`, `tarif`) VALUES
(1, 2, '2023-01-12', 13);

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `ID_user` int NOT NULL,
  `ID_media` int NOT NULL,
  `état_loc` tinyint(1) NOT NULL,
  KEY `ID_user` (`ID_user`),
  KEY `ID_film` (`ID_media`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`ID_user`, `ID_media`, `état_loc`) VALUES
(1, 1, 1),
(1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `ID_media` int NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Acteur` varchar(255) DEFAULT NULL,
  `Pays` varchar(255) DEFAULT NULL,
  `AnneeSortie` date DEFAULT NULL,
  `dispo` tinyint(1) DEFAULT NULL,
  `Auteur` varchar(255) DEFAULT NULL,
  `Réalisateur` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID_media`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`ID_media`, `type`, `Nom`, `Acteur`, `Pays`, `AnneeSortie`, `dispo`, `Auteur`, `Réalisateur`) VALUES
(1, 0, 'Aladin', 'Kev Adams', 'FRANCE', '2015-10-14', 1, 'Daive Cohen', 'Arthur Benzaquen'),
(2, 0, 'Alad 2', 'Kev Adams', 'FRANCE', '2018-10-03', 1, 'Daive Cohen', 'Lionel Steketee'),
(3, 1, 'THE 100', 'Eliza Taylor, Bob Morley', 'Etat-Unis', '2023-03-19', 1, 'Jason Rothenberg', 'Tim Scanlan, Jason Rothenberg'),
(4, 1, 'Lucifer', 'Tom Ellis, Lauren German', 'Etat-Unis', '2016-01-25', 1, 'Tom Kapinos', 'Jerry Bruckheimer, Len Wiseman'),
(5, 0, 'Le fabuleux destin d\'Amélie Poulain', 'Audrey Tautou, Mathieu Kassovitz', 'FRANCE, ALLEMAGNE', '2001-01-01', 0, 'Jean-Pierre Jeunet', 'Jean-Pierre Jeunet, Guillaume Laurant'),
(6, 0, 'DUNE', 'Timothée Chalamet, Rebecca Ferguson', 'Etat-Unis', '2021-11-01', 0, 'Denis Villeneuve', 'Eric Roth, Jon Spaihts, Denis Villeneuve');

-- --------------------------------------------------------

--
-- Structure de la table `type_abo`
--

DROP TABLE IF EXISTS `type_abo`;
CREATE TABLE IF NOT EXISTS `type_abo` (
  `ID_abo` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `Tarif` int DEFAULT NULL,
  PRIMARY KEY (`ID_abo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type_abo`
--

INSERT INTO `type_abo` (`ID_abo`, `description`, `Tarif`) VALUES
(1, 'Prenium', 20),
(2, 'classic', 13),
(3, 'Rat', 8);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID_User` int NOT NULL AUTO_INCREMENT,
  `Prénom` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ID_abo` int NOT NULL,
  `etat_connect` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_User`),
  KEY `ID_abo` (`ID_abo`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`ID_User`, `Prénom`, `Nom`, `email`, `ID_abo`, `etat_connect`) VALUES
(1, 'Jean', 'Petit', 'jean.petit@email.com', 1, 1),
(2, 'Grégoire', 'Morel', 'greg.mo@email.com', 3, 1),
(4, 'Joséphine', 'Gardien', 'jojo.ange@email.com', 3, 0),
(6, 'Mireille', 'labeille', 'mimi.mati@email.com', 2, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
