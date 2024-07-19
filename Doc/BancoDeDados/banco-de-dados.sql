-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_estoque
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estoque_mov`
--

DROP TABLE IF EXISTS `estoque_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque_mov` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `tipo` tinyint NOT NULL,
  `fechado` tinyint DEFAULT '1',
  `observacao` varchar(100) DEFAULT NULL,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_mov`
--

LOCK TABLES `estoque_mov` WRITE;
/*!40000 ALTER TABLE `estoque_mov` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque_mov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_mov_prod`
--

DROP TABLE IF EXISTS `estoque_mov_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque_mov_prod` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `codigo_usuario` int NOT NULL,
  `codigo_variacao` int NOT NULL,
  `codigo_tamanho` int NOT NULL,
  `quantidade` int NOT NULL,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`),
  KEY `codigo_usuario` (`codigo_usuario`),
  KEY `codigo_variacao` (`codigo_variacao`),
  KEY `codigo_tamanho` (`codigo_tamanho`),
  CONSTRAINT `estoque_mov_prod_ibfk_1` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`),
  CONSTRAINT `estoque_mov_prod_ibfk_2` FOREIGN KEY (`codigo_variacao`) REFERENCES `variacao` (`codigo`),
  CONSTRAINT `estoque_mov_prod_ibfk_3` FOREIGN KEY (`codigo_tamanho`) REFERENCES `tamanho` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_mov_prod`
--

LOCK TABLES `estoque_mov_prod` WRITE;
/*!40000 ALTER TABLE `estoque_mov_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque_mov_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `codigo_variacao` int NOT NULL,
  `codigo_tamanho` int NOT NULL,
  `descricao` varchar(20) DEFAULT NULL,
  `peso` int DEFAULT '0',
  `saldo` int DEFAULT '0',
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `descricao` (`descricao`),
  KEY `codigo_variacao` (`codigo_variacao`),
  KEY `codigo_tamanho` (`codigo_tamanho`),
  CONSTRAINT `produto_saldo_ibfk_1` FOREIGN KEY (`codigo_variacao`) REFERENCES `variacao` (`codigo`),
  CONSTRAINT `produto_saldo_ibfk_2` FOREIGN KEY (`codigo_tamanho`) REFERENCES `tamanho` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho`
--

DROP TABLE IF EXISTS `tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tamanho` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  `abreviatura` varchar(20) DEFAULT '',
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `descricao` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanho`
--

LOCK TABLES `tamanho` WRITE;
/*!40000 ALTER TABLE `tamanho` DISABLE KEYS */;
INSERT INTO `tamanho` VALUES (1,'300 MILITROS','300 ML','2024-07-14 16:26:05','2024-07-14 16:26:05'),(2,'500 MILITROS','500 ML','2024-07-14 16:26:38','2024-07-14 16:26:38');
/*!40000 ALTER TABLE `tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nivel` tinyint DEFAULT '0',
  `nome` varchar(20) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'FABIO','123','2024-07-10 21:33:24','2024-07-10 21:33:24'),(2,0,'ANA','123','2024-07-12 21:57:00','2024-07-12 21:57:00');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variacao`
--

DROP TABLE IF EXISTS `variacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variacao` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  `abreviatura` varchar(20) DEFAULT '',
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `descricao` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variacao`
--

LOCK TABLES `variacao` WRITE;
/*!40000 ALTER TABLE `variacao` DISABLE KEYS */;
INSERT INTO `variacao` VALUES (1,'MORANGO','MOR','2024-07-14 15:53:55','2024-07-14 15:53:55'),(2,'UVA','UVA','2024-07-14 15:54:24','2024-07-14 15:54:24'),(3,'MANGA','MAN','2024-07-14 15:54:47','2024-07-14 15:54:47'),(4,'ABACAXI','ABX','2024-07-14 15:55:18','2024-07-14 15:55:18');
/*!40000 ALTER TABLE `variacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-16 20:32:07
