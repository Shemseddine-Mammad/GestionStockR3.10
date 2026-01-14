/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: GestionStock
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_facture` datetime DEFAULT current_timestamp(),
  `client_nom` varchar(100) NOT NULL,
  `montant_total` decimal(10,2) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facture_user` (`id_user`),
  CONSTRAINT `fk_facture_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
INSERT INTO `facture` VALUES
(1,'2026-01-10 13:42:15','Entreprise ABC',1250.00,1),
(2,'2026-01-10 13:42:15','Mairie de Lyon',340.50,2),
(3,'2026-01-10 13:42:15','Client Particulier',25.50,1),
(4,'2026-01-10 13:42:15','Start-up Tech',5000.00,5);
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `prix` decimal(10,2) NOT NULL,
  `id_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produit_type` (`id_type`),
  CONSTRAINT `fk_produit_type` FOREIGN KEY (`id_type`) REFERENCES `typeproduit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES
(1,'Ordinateur Portable Dell',10,850.00,NULL),
(2,'Souris Sans Fil',50,25.50,NULL),
(3,'Ecran 24 pouces',15,180.00,NULL),
(4,'Câble secteur PC',100,5.00,1),
(5,'Chargeur Universel 65W',20,49.90,1),
(6,'Onduleur 600VA',5,120.00,1),
(7,'Multiprise Parafoudre',30,15.00,1),
(8,'Clavier Mécanique',15,89.00,2),
(9,'Webcam 1080p',12,65.00,2),
(10,'Casque Audio Pro',20,110.00,2),
(11,'Hub USB-C',25,35.00,2),
(12,'Tablette 10 pouces',8,350.00,3),
(13,'Ultrabook Pro',3,1200.00,3),
(14,'Sacoche ordinateur',50,29.90,3),
(15,'Switch 5 ports',20,19.90,4),
(16,'Switch 24 ports Rackable',4,180.00,4),
(17,'Switch PoE Industriel',2,250.00,4),
(18,'Module SFP+',10,45.00,4),
(19,'Câble RJ45 Cat6 1m',200,2.50,5),
(20,'Câble RJ45 Cat6 5m',100,7.00,5),
(21,'Bobine 100m Ethernet',5,60.00,5),
(22,'Câble HDMI 4K',40,12.00,5);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeproduit`
--

DROP TABLE IF EXISTS `typeproduit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeproduit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeproduit`
--

LOCK TABLES `typeproduit` WRITE;
/*!40000 ALTER TABLE `typeproduit` DISABLE KEYS */;
INSERT INTO `typeproduit` VALUES
(1,'Alimentation'),
(2,'Périphérique'),
(3,'Matériel portable'),
(4,'Switch'),
(5,'Câblage');
/*!40000 ALTER TABLE `typeproduit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'admin_sys','password123','admin'),
(2,'jean.compta','compta2024','compta'),
(3,'marie.stock','stock!78','gestionnaire'),
(4,'stagiaire_it','azerty','observateur'),
(5,'directeur','TopSecret','superadmin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-01-10 14:24:24
