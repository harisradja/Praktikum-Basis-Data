-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: prodi_teknik
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jurusan`
--

DROP TABLE IF EXISTS `jurusan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jurusan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_jurusan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurusan`
--

LOCK TABLES `jurusan` WRITE;
/*!40000 ALTER TABLE `jurusan` DISABLE KEYS */;
INSERT INTO `jurusan` VALUES (1,'teknologi_informasi'),(2,'teknik_sipil');
/*!40000 ALTER TABLE `jurusan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `nim` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_jurusan` int(11) DEFAULT NULL,
  PRIMARY KEY (`nim`),
  KEY `id_jurusan` (`id_jurusan`),
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES ('2505030001','Raisya Rahmi Faiza',2),('2505030002','Dede Saputra',2),('2505030003','Surya Oktavian Putra Pratama',2),('2505030004','Muhamad Nafan Adi Prayoga',2),('2505030005','Muhammad Syariful Adyan Juniansyah',2),('2505030006','Agus Wahyudi',2),('2505030007','Galang Ghofar Alfarizi',2),('2505030008','Aderiani Noviyanti',2),('2505030009','Muhammad Raditya Ardi Nawawi',2),('2505030010','Anjanis Kaifha Ayu Pasya',2),('2505060041','zuyina m. irkham',1),('2505060042','Sahrul Indra Safani',1),('2505060043','Gilang Fastya Wijaya',1),('2505060044','Kristian Agung Nugroho',1),('2505060045','Muhammad Syafiq Azizi',1),('2505060046','Hilmi Mufid',1),('2505060047','Imelda Safira Putri',1),('2505060048','Fahmi Ridho Wiratama',1),('2505060049','Euaggelion Purnomo',1),('2505060050','Rindani Ayu Larasati',1);
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mata_kuliah`
--

DROP TABLE IF EXISTS `mata_kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mata_kuliah` (
  `id_mk` int(11) NOT NULL AUTO_INCREMENT,
  `nama_mk` varchar(20) NOT NULL,
  `sks` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mata_kuliah`
--

LOCK TABLES `mata_kuliah` WRITE;
/*!40000 ALTER TABLE `mata_kuliah` DISABLE KEYS */;
INSERT INTO `mata_kuliah` VALUES (1,'Basis Data',3),(2,'Paradigma Sistem',2),(3,'Kalkulus Lanjut',3),(4,'Fisika Lanjut',3);
/*!40000 ALTER TABLE `mata_kuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nilai`
--

DROP TABLE IF EXISTS `nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `nilai` int(11) DEFAULT NULL,
  `id_mk` int(11) DEFAULT NULL,
  `nim` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `id_mk` (`id_mk`),
  KEY `nim` (`nim`),
  CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_mk`) REFERENCES `mata_kuliah` (`id_mk`),
  CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilai`
--

LOCK TABLES `nilai` WRITE;
/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
INSERT INTO `nilai` VALUES (1,85,1,'2505060041'),(2,80,2,'2505060041'),(3,92,1,'2505060042'),(4,88,2,'2505060042'),(5,95,1,'2505060043'),(6,87,2,'2505060043'),(7,70,1,'2505060044'),(8,75,2,'2505060044'),(9,88,1,'2505060045'),(10,82,2,'2505060045'),(11,78,1,'2505060046'),(12,80,2,'2505060046'),(13,90,1,'2505060047'),(14,85,2,'2505060047'),(15,84,1,'2505060048'),(16,86,2,'2505060048'),(17,75,1,'2505060049'),(18,80,2,'2505060049'),(19,93,1,'2505060050'),(20,89,2,'2505060050'),(21,88,3,'2505030001'),(22,82,4,'2505030001'),(23,75,3,'2505030002'),(24,90,4,'2505030002'),(25,82,3,'2505030003'),(26,85,4,'2505030003'),(27,91,3,'2505030004'),(28,78,4,'2505030004'),(29,85,3,'2505030005'),(30,88,4,'2505030005'),(31,79,3,'2505030006'),(32,84,4,'2505030006'),(33,94,3,'2505030007'),(34,92,4,'2505030007'),(35,87,3,'2505030008'),(36,80,4,'2505030008'),(37,80,3,'2505030009'),(38,89,4,'2505030009'),(39,86,3,'2505030010'),(40,95,4,'2505030010');
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-17 13:44:19
