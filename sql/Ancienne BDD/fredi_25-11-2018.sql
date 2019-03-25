-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 25 nov. 2018 à 23:25
-- Version du serveur :  10.1.30-MariaDB
-- Version de PHP :  7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `fredi`
--
CREATE DATABASE IF NOT EXISTS `fredi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fredi`;

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `licence_adh` varchar(25) NOT NULL,
  `nom_adh` varchar(25) DEFAULT NULL,
  `prenom_adh` varchar(25) DEFAULT NULL,
  `sexe_adh` varchar(1) DEFAULT NULL,
  `date_naissance_adh` date DEFAULT NULL,
  `adresse_adh` varchar(30) DEFAULT NULL,
  `cp_adh` varchar(10) DEFAULT NULL,
  `ville_adh` varchar(25) DEFAULT NULL,
  `mail_inscrit` varchar(100) DEFAULT NULL,
  `mdp_inscrit` varchar(255) DEFAULT NULL,
  `id_club` int(11) NOT NULL,
  `id_resp_leg` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`licence_adh`, `nom_adh`, `prenom_adh`, `sexe_adh`, `date_naissance_adh`, `adresse_adh`, `cp_adh`, `ville_adh`, `mail_inscrit`, `mdp_inscrit`, `id_club`, `id_resp_leg`) VALUES
('170540010555', 'BORTHE', 'CLAFOUTI', 'M', '1998-07-26', '30, rue Widric 2eme', '54600', 'Villers lès Nancy', 'clafouti@outloook.fr', '0000', 1, NULL),
('170540010556', 'Barbé', 'Paco', 'H', '1997-05-03', '6 RUE GEORGES PICOT', '31400', 'Toulouse', 'paco.barbe@outlook.fr', '$2y$10$QYZOSx/5ITAy3IwRIMLXcOIHMqCYqzQYUvhDzCEe.1w728Fz8BKLu', 50, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `adherent_csv`
--

CREATE TABLE `adherent_csv` (
  `licence_adh_csv` varchar(25) NOT NULL,
  `sexe_adh_csv` varchar(1) DEFAULT NULL,
  `nom_adh_csv` varchar(25) DEFAULT NULL,
  `prenom_adh_csv` varchar(25) DEFAULT NULL,
  `date_adh_csv` date DEFAULT NULL,
  `adresse_adh_csv` varchar(30) DEFAULT NULL,
  `cp_adh_csv` char(5) DEFAULT NULL,
  `ville_adh_csv` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

CREATE TABLE `club` (
  `id_club` int(11) NOT NULL,
  `libelle_club` varchar(255) NOT NULL,
  `id_ligue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `club`
--

INSERT INTO `club` (`id_club`, `libelle_club`, `id_ligue`) VALUES
(1, 'Stade Toulousain Rugby', 1),
(2, 'RC Toulonnais', 1),
(3, 'AS Montferrandaise', 1),
(4, 'Stade Francais Paris', 1),
(5, 'Stade Rochelais', 1),
(6, 'Union Bordeaux Belges', 1),
(7, 'Lyon OI U', 1),
(8, 'Racing Club De France Rugby', 1),
(9, 'USA Perpignan', 1),
(10, 'Aviron Bayonnais', 1),
(11, 'FC Grenoble', 1),
(12, 'Rouen Normandie Rugby', 1),
(13, 'Roval Drôme Xv', 1),
(14, 'US Tyrosse', 1),
(15, 'Montpellier RC', 1),
(16, 'Amiens', 2),
(17, 'Angers', 2),
(18, 'Bordeaux', 2),
(19, 'Caen', 2),
(20, 'Dijon', 2),
(21, 'Guingamp', 2),
(22, 'Lille', 2),
(23, 'Lyon', 2),
(24, 'Marseille', 2),
(25, 'Monaco', 2),
(26, 'Montpellier', 2),
(27, 'Nantes', 2),
(28, 'Nice', 2),
(29, 'Nîmes', 2),
(30, 'Paris-SG', 2),
(31, 'Reims', 2),
(32, 'Rennes', 2),
(33, 'Saint-Etienne', 2),
(34, 'Strasbourg', 2),
(35, 'Toulouse', 2),
(36, 'Poissy Triathlon', 3),
(37, 'SJDMV Triathlon', 3),
(38, 'Montpellier Triathlon', 3),
(39, 'E.C. Sartrouville', 3),
(40, 'Triathlon Club de Lievin', 3),
(41, 'Les Sables Vendee Triathlon', 3),
(42, 'Valence Triathlon', 3),
(43, 'Montlucon Triathlon', 3),
(44, 'Sainte Genevieve Triathlon', 3),
(45, 'Rouen Triathlon', 3),
(46, 'Metz Triathlon', 3),
(47, 'Versailles Triathlon', 3),
(48, 'Issy Triathlon', 3),
(49, 'Tricastin Triathlon Club', 3),
(50, 'Triathlon Toulouse Métropole', 3),
(51, 'Besancon Triathlon', 3);

-- --------------------------------------------------------

--
-- Structure de la table `indemnite`
--

CREATE TABLE `indemnite` (
  `annee` year(4) NOT NULL,
  `tarif_kilometrique` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ligne_frais`
--

CREATE TABLE `ligne_frais` (
  `id_ligne_frais` int(11) NOT NULL,
  `date_frais` date DEFAULT NULL,
  `trajet_frais` varchar(25) DEFAULT NULL,
  `km_parcourus` float DEFAULT NULL,
  `cout_peage` decimal(10,0) DEFAULT NULL,
  `cout_repas` decimal(10,0) DEFAULT NULL,
  `cout_hebergement` decimal(10,0) DEFAULT NULL,
  `annee` year(4) NOT NULL,
  `id_motif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ligue`
--

CREATE TABLE `ligue` (
  `id_ligue` int(11) NOT NULL,
  `libelle_ligue` varchar(255) NOT NULL,
  `nom_ligue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ligue`
--

INSERT INTO `ligue` (`id_ligue`, `libelle_ligue`, `nom_ligue`) VALUES
(1, 'FFR', 'Federation Francaise de Rugby'),
(2, 'FFF', 'Federation Francaise de Football'),
(3, 'FFT', 'Federation Francaise de Triathlon');

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE `motif` (
  `id_motif` int(11) NOT NULL,
  `libelle_motif` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `note_frais`
--

CREATE TABLE `note_frais` (
  `id_note_frais` int(11) NOT NULL,
  `licence_adh` varchar(25) NOT NULL,
  `id_ligne_frais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `responsable_crib`
--

CREATE TABLE `responsable_crib` (
  `id_resp_crib` int(11) NOT NULL,
  `nom_resp_crib` varchar(25) DEFAULT NULL,
  `prenom_resp_crib` varchar(25) DEFAULT NULL,
  `mail_resp_crib` varchar(50) DEFAULT NULL,
  `mdp_resp_crib` varchar(50) DEFAULT NULL,
  `id_ligue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `responsable_legal`
--

CREATE TABLE `responsable_legal` (
  `id_resp_leg` int(11) NOT NULL,
  `nom_resp_leg` varchar(25) NOT NULL,
  `prenom_resp_leg` varchar(25) NOT NULL,
  `rue_resp_leg` varchar(25) NOT NULL,
  `cp_resp_leg` char(5) NOT NULL,
  `ville_resp_leg` varchar(25) NOT NULL,
  `mail_inscrit` varchar(50) DEFAULT NULL,
  `mdp_inscrit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tresorier`
--

CREATE TABLE `tresorier` (
  `id_tresorier` int(11) NOT NULL,
  `nom_tresorier` varchar(25) DEFAULT NULL,
  `prenom_tresorier` varchar(25) DEFAULT NULL,
  `mail_tresorier` varchar(50) DEFAULT NULL,
  `mdp_tresorier` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `id_club` int(11) NOT NULL,
  `id_note_frais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`licence_adh`),
  ADD KEY `Adherent_Club_FK` (`id_club`),
  ADD KEY `Adherent_Responsable_Legal_FK` (`id_resp_leg`);

--
-- Index pour la table `adherent_csv`
--
ALTER TABLE `adherent_csv`
  ADD PRIMARY KEY (`licence_adh_csv`);

--
-- Index pour la table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id_club`),
  ADD KEY `Club_Ligue_FK` (`id_ligue`);

--
-- Index pour la table `ligne_frais`
--
ALTER TABLE `ligne_frais`
  ADD PRIMARY KEY (`id_ligne_frais`),
  ADD KEY `Ligne_Frais_Motif_FK` (`id_motif`);

--
-- Index pour la table `ligue`
--
ALTER TABLE `ligue`
  ADD PRIMARY KEY (`id_ligue`);

--
-- Index pour la table `motif`
--
ALTER TABLE `motif`
  ADD PRIMARY KEY (`id_motif`);

--
-- Index pour la table `note_frais`
--
ALTER TABLE `note_frais`
  ADD PRIMARY KEY (`id_note_frais`),
  ADD KEY `Note_Frais_Adherent_FK` (`licence_adh`),
  ADD KEY `Note_Frais_Ligne_Frais_FK` (`id_ligne_frais`);

--
-- Index pour la table `responsable_crib`
--
ALTER TABLE `responsable_crib`
  ADD PRIMARY KEY (`id_resp_crib`),
  ADD KEY `Responsable_Crib_Ligue_FK` (`id_ligue`);

--
-- Index pour la table `responsable_legal`
--
ALTER TABLE `responsable_legal`
  ADD PRIMARY KEY (`id_resp_leg`);

--
-- Index pour la table `tresorier`
--
ALTER TABLE `tresorier`
  ADD PRIMARY KEY (`id_tresorier`),
  ADD KEY `Tresorier_Club_FK` (`id_club`),
  ADD KEY `Tresorier_note_frais_FK` (`id_note_frais`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `club`
--
ALTER TABLE `club`
  MODIFY `id_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `ligne_frais`
--
ALTER TABLE `ligne_frais`
  MODIFY `id_ligne_frais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ligue`
--
ALTER TABLE `ligue`
  MODIFY `id_ligue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `id_motif` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `note_frais`
--
ALTER TABLE `note_frais`
  MODIFY `id_note_frais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `responsable_crib`
--
ALTER TABLE `responsable_crib`
  MODIFY `id_resp_crib` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `responsable_legal`
--
ALTER TABLE `responsable_legal`
  MODIFY `id_resp_leg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tresorier`
--
ALTER TABLE `tresorier`
  MODIFY `id_tresorier` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD CONSTRAINT `Adherent_Club_FK` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `Adherent_Resp_Leg_FK` FOREIGN KEY (`id_resp_leg`) REFERENCES `responsable_legal` (`id_resp_leg`);

--
-- Contraintes pour la table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `Club_Ligue_FK` FOREIGN KEY (`id_ligue`) REFERENCES `ligue` (`id_ligue`);

--
-- Contraintes pour la table `ligne_frais`
--
ALTER TABLE `ligne_frais`
  ADD CONSTRAINT `Ligne_Frais_Motif_FK` FOREIGN KEY (`id_motif`) REFERENCES `motif` (`id_motif`);

--
-- Contraintes pour la table `note_frais`
--
ALTER TABLE `note_frais`
  ADD CONSTRAINT `note_frais_Adherent_FK` FOREIGN KEY (`licence_adh`) REFERENCES `adherent` (`licence_adh`),
  ADD CONSTRAINT `note_frais_Ligne_Frais_FK` FOREIGN KEY (`id_ligne_frais`) REFERENCES `ligne_frais` (`id_ligne_frais`);

--
-- Contraintes pour la table `responsable_crib`
--
ALTER TABLE `responsable_crib`
  ADD CONSTRAINT `responsable_crib_Ligue_FK` FOREIGN KEY (`id_ligue`) REFERENCES `ligue` (`id_ligue`);

--
-- Contraintes pour la table `tresorier`
--
ALTER TABLE `tresorier`
  ADD CONSTRAINT `tresorier_Club_FK` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `tresorier_Note_Frais_FK` FOREIGN KEY (`id_note_frais`) REFERENCES `note_frais` (`id_note_frais`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
