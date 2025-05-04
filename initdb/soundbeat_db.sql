-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: soundbeat_db
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkfsp0s1tflm1cwlj8idhqsad0` (`email`),
  UNIQUE KEY `UKm2dvbwfge291euvmk6vkkocao` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `samples`
--

DROP TABLE IF EXISTS `samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samples` (
  `id` bigint NOT NULL,
  `duracion` float NOT NULL,
  `fecha_subida` datetime DEFAULT CURRENT_TIMESTAMP,
  `formato` varchar(255) DEFAULT NULL,
  `license` varchar(100) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `popularidad` int DEFAULT '0',
  `tags` text,
  `tempo` int DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` bigint NOT NULL,
  `calificacion` tinyint DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `texto` tinytext,
  `sample_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKon2xm1xiwe841hlgj7y4tswe8` (`sample_id`),
  KEY `FKdts62yj83qe3k748cgcjvm48r` (`usuario_id`),
  CONSTRAINT `FKdts62yj83qe3k748cgcjvm48r` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKon2xm1xiwe841hlgj7y4tswe8` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `paquetes`
--

DROP TABLE IF EXISTS `paquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquetes` (
  `id` bigint NOT NULL,
  `descripcion` tinytext,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(255) NOT NULL,
  `publico` bit(1) DEFAULT b'0',
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc4s32ydpagiypbhyo9ghpf3mw` (`usuario_id`),
  CONSTRAINT `FKc4s32ydpagiypbhyo9ghpf3mw` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instrumento`
--

DROP TABLE IF EXISTS `instrumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrumento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paquete_compartidos`
--

DROP TABLE IF EXISTS `paquete_compartidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete_compartidos` (
  `usuario_id` bigint NOT NULL,
  `paquete_id` bigint NOT NULL,
  PRIMARY KEY (`paquete_id`,`usuario_id`),
  KEY `FKfx4lkrkfiulookvjjh077kx8j` (`usuario_id`),
  CONSTRAINT `FK6qf3keh1dqq6jcqjrxrc2bah4` FOREIGN KEY (`paquete_id`) REFERENCES `paquetes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKfx4lkrkfiulookvjjh077kx8j` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paquete_samples`
--

DROP TABLE IF EXISTS `paquete_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete_samples` (
  `paquete_id` bigint NOT NULL,
  `sample_id` bigint NOT NULL,
  PRIMARY KEY (`paquete_id`,`sample_id`),
  KEY `FKqiu15k9nelhtw1kt29fmxvoni` (`sample_id`),
  CONSTRAINT `FKqiu15k9nelhtw1kt29fmxvoni` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKtpx8vi0q6mqlu1rj5ji8rhbjk` FOREIGN KEY (`paquete_id`) REFERENCES `paquetes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `sample_genero`
--

DROP TABLE IF EXISTS `sample_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_genero` (
  `sample_id` bigint NOT NULL,
  `genero_id` bigint NOT NULL,
  KEY `FKcu3f1u6uh2cwn29ka7xi5x96x` (`genero_id`),
  KEY `FK9m1we2q8gbjgoexu09lx9vn4a` (`sample_id`),
  CONSTRAINT `FK9m1we2q8gbjgoexu09lx9vn4a` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`),
  CONSTRAINT `FKcu3f1u6uh2cwn29ka7xi5x96x` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_instrumento`
--

DROP TABLE IF EXISTS `sample_instrumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_instrumento` (
  `sample_id` bigint NOT NULL,
  `instrumento_id` bigint NOT NULL,
  KEY `FKyt9cp7348owhdnxclltkt8mo` (`instrumento_id`),
  KEY `FK54onpqa0nk3i0jw2sixjt3vtl` (`sample_id`),
  CONSTRAINT `FK54onpqa0nk3i0jw2sixjt3vtl` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`),
  CONSTRAINT `FKyt9cp7348owhdnxclltkt8mo` FOREIGN KEY (`instrumento_id`) REFERENCES `instrumento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_tipo`
--

DROP TABLE IF EXISTS `sample_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_tipo` (
  `sample_id` bigint NOT NULL,
  `tipo_id` bigint NOT NULL,
  PRIMARY KEY (`sample_id`,`tipo_id`),
  KEY `FKrq0ksbjsec6d6cue9s1mx886n` (`tipo_id`),
  CONSTRAINT `FK7l8xt5lbairr3vu50cfns62to` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`),
  CONSTRAINT `FKrq0ksbjsec6d6cue9s1mx886n` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `usuarios_samples`
--

DROP TABLE IF EXISTS `usuarios_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_samples` (
  `favorito` bit(1) DEFAULT b'0',
  `fecha_descarga` datetime(6) DEFAULT NULL,
  `sample_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`sample_id`,`usuario_id`),
  KEY `FKsbmcwry9t49ahha7kvhnnem55` (`usuario_id`),
  CONSTRAINT `FKpk6ptj7me8h45gn2pvecjnfbl` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKsbmcwry9t49ahha7kvhnnem55` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-04 20:17:55
use soundbeat_db;
-- Insertando los géneros más populares
INSERT INTO generos (nombre) VALUES
('Hip-Hop'),
('Trap'),
('House'),
('EDM'),
('Dubstep'),
('Techno'),
('Drum and Bass'),
('Lo-Fi'),
('Funk'),
('Soul'),
('Jazz'),
('R&B'),
('Reggae'),
('Pop'),
('Rock'),
('Blues'),
('Punk'),
('Experimental'),
('Latin'),
('Afrobeat');

-- Insertando instrumentos
INSERT INTO instrumento (categoria, nombre) VALUES
('Percusión', 'DRUMS'),
('Percusión', 'CAJA'),
('Percusión', 'HI-HATS'),
('Percusión', 'TOMS'),
('Percusión', 'CYMBALS'),
('Sintetizadores', 'SYNTH'),
('Bajo', 'BASS'),
('Sintetizadores', 'PADS'),
('Guitarras', 'GUITAR'),
('Percusión', 'PERCUSSION'),
('Vocales', 'VOCALS'),
('Samples', 'SAMPLES'),
('Efectos', 'FX');

-- Insertando tipos
INSERT INTO tipo (nombre) VALUES 
('Loop'),
('One-Shot'),
('Stem'),
('Sample-Pack'),
('Vocal'),
('Acapella'),
('Drum-Kit');