-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: alerta
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `alerta`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `alerta` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `alerta`;

--
-- Table structure for table `Evento`
--

DROP TABLE IF EXISTS `Evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Evento` (
  `id` varchar(36) NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` varchar(16) NOT NULL,
  `folio` varchar(32) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evento`
--

LOCK TABLES `Evento` WRITE;
/*!40000 ALTER TABLE `Evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IncidenteCategorias`
--

DROP TABLE IF EXISTS `IncidenteCategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IncidenteCategorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(36) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `orden` tinyint(4) NOT NULL,
  `theme` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IncidenteCategorias`
--

LOCK TABLES `IncidenteCategorias` WRITE;
/*!40000 ALTER TABLE `IncidenteCategorias` DISABLE KEYS */;
INSERT INTO `IncidenteCategorias` VALUES (1,'Policía','Todo lo relacionado con seguridad pública',1,'a'),(2,'Vialidad','Asuntos con tránsito',2,'b'),(3,'Bomberos y Protección Civil','',3,'c'),(4,'Atención médica','',4,'a'),(5,'Servicio municipales','',5,'e');
/*!40000 ALTER TABLE `IncidenteCategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IncidenteTipos`
--

DROP TABLE IF EXISTS `IncidenteTipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IncidenteTipos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_categoria` int(10) unsigned NOT NULL,
  `codigo` varchar(16) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `prioridad` tinyint(4) NOT NULL,
  `menu` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IncidenteTipos`
--

LOCK TABLES `IncidenteTipos` WRITE;
/*!40000 ALTER TABLE `IncidenteTipos` DISABLE KEYS */;
INSERT INTO `IncidenteTipos` VALUES (1,5,'807','RESCATE','',1,0),(2,5,'603','FUGA DE AGUA','',4,0),(3,5,'509','ALCANTARILLA TAPADA','',5,0),(4,5,'510','CABLES AL PISO','',2,0),(5,5,'507','CAIDA DE ARBOL','',4,0),(6,5,'506','CAIDA DE POSTE DE LUZ','',4,0),(7,5,'123','FALLA EN SUMINISTRO DE AGUA','',2,0),(8,5,'124','RESCATE ACUATICO','',2,0),(9,5,'820','ALCANTARILLA ABIERTA','',3,0),(10,4,'152','ASESORIA MEDICA','',2,0),(11,3,'202','ACCIDENTE DE AVIÓN','',1,0),(12,3,'210','DESCARRILAMIENTO DE TREN','',1,0),(13,3,'602','FUGA DE GAS','',1,0),(14,3,'604','FUGA DE GASOLINA','',1,0),(15,3,'608','FUGA DE LIQUIDOS INFLAMABLES','',2,0),(16,3,'606','FUGA DE SOLVENTES','',2,0),(17,3,'1006','EXPLOSION','',3,0),(18,3,'1015','EXPLOSION DE TRANSFORMADORES','',2,0),(19,3,'1012','INCENDIO DE VEHICULO','',1,0),(20,3,'1013','INCENDIO EDIFICIO','',1,0),(21,3,'1004','INCENDIO EN COMERCIO','',1,0),(22,3,'1014','INCENDIO EN GASOLINERIA','',1,0),(23,3,'1011','INCENDIO EN LOTE BALDIO','',2,0),(24,3,'1005','INCENDIO FORESTAL','',1,0),(25,3,'1002','INCENDIO RESIDENCIAL','',1,0),(26,3,'138','ENJAMBRE DE ABEJAS','',1,0),(27,1,'218','MUERTE NATURAL','',1,0),(28,1,'219','MUERTE OTRA CAUSA','',1,0),(29,1,'217','MUERTE POR ARMA BLANCA','',1,0),(30,1,'220','MUERTE POR ARMA DE FUEGO','',1,0),(31,1,'403','ASALTO A COMERCIO','',1,0),(32,1,'405','ASALTO A VEHICULO','',2,0),(33,1,'406','ASALTO CASA-HABITACIÓN','',1,0),(34,1,'401','ASALTO/ROBO A BANCO','',1,0),(35,1,'4001','SIEMBRA DE DROGA','',4,0),(36,1,'601','FUGA DE REOS','',1,0),(37,1,'102','AHOGADO','',1,0),(38,1,'127','PERSONA ARMADA','',1,0),(39,1,'805','TRATA DE PERSONAS','',1,0),(40,1,'5041','ABUSO DE AUTORIDAD','',3,0),(41,1,'5027','ALLANAMIENTO/INSTRUSO PROP. PRIV.','',4,0),(42,1,'5009','CADÁVER','',5,0),(43,1,'5042','DANOS EN PROPIEDAD AJENA','',2,0),(44,1,'5017','DISPAROS CON ARMA DE FUEGO','',1,0),(45,1,'5001','ENFRENTAMIENTO ARMADO','',1,0),(46,1,'802','EXTORSION TELEFONICA','',3,0),(47,1,'5023','INVASIÓN DE TIERRAS','',2,0),(48,1,'5039','PRESENTA DOCUMENTOS FALSOS','',4,0),(49,1,'5011','SUICIDIO','',1,0),(50,1,'5036','TENTATIVA DE HOMICIDIO','',2,0),(51,1,'5002','TENTATIVA Y/O SECUESTRO','',3,0),(52,1,'2015','ABUSO DE CONFIANZA','',5,0),(53,1,'2011','ASALTO A TRANSPORTE PUBLICO','',2,0),(54,1,'2006','ASALTO A TRANSPORTISTAS','',2,0),(55,1,'2007','ASALTO EN CARRETERA','',2,0),(56,1,'2016','ESTAFA','',3,0),(57,1,'2017','EXTORSION','',3,0),(58,1,'2005','ROBO A COMERCIO','',1,0),(59,1,'2001','ROBO CASA-HABITACIÓN','',1,1),(60,1,'2008','ROBO DE ANIMAL','',3,0),(61,1,'2002','ROBO EN ESCUELA','',1,0),(62,1,'2010','ROBO OTROS','',3,0),(63,1,'2004','ROBO VEHÍCULO ACCESORIOS','',4,0),(64,1,'2003','ROBO VEHÍCULO TOTALIDAD','',4,0),(65,1,'2013','TENTATIVA DE ROBO','',4,0),(66,1,'2014','TENTATIVA Y/O PRIV. DE LIBERTAD','',2,0),(67,1,'2020','USURPACION DE FUNCIONES','',3,0),(68,1,'5029','VEHICULO RECUPERADO','',3,0),(69,1,'3007','ABUSO SEXUAL','',2,0),(70,1,'3001','TENTATIVA DE VIOLACIÓN','',1,0),(71,1,'3008','VIOLACION SEXUAL','',2,0),(72,4,'201','CAIDA EN LUGAR PROFUNDO','',2,0),(73,4,'214','LESIONADO','',2,0),(74,4,'209','LESIONADO POR CAÍDA','',3,0),(75,4,'213','LESIONADO RINA','',2,0),(76,4,'801','MORDIDA DE COCODRILO','',1,0),(77,4,'224','PERSONA INCONCIENTE','',1,0),(78,4,'222','PERSONA QUEMADA','',1,0),(79,4,'221','VOLCADURA','',1,0),(80,4,'101','ABORTO','',1,0),(81,4,'137','ALCOHOLIZADO','',2,0),(82,4,'100','AMENAZA DE ABORTO','',1,0),(83,4,'147','APOYO PSICOLOGICO','',3,0),(84,4,'135','ASFIXIA','',3,0),(85,4,'104','ATROPELLADO','',1,1),(86,4,'118','CRISIS NERVIOSA','',2,0),(87,4,'121','DESMAYO','',2,0),(88,4,'134','ELECTROCUTADO','',5,0),(89,4,'110','ENFERMO MENTAL','',1,0),(90,4,'125','INFARTO','',1,0),(91,4,'112','MORDIDA DE PERRO','',3,0),(92,4,'113','MORDIDA DE VÍBORA','',1,0),(93,4,'153','MORDIDA HUMANA','',2,0),(94,4,'107','PARTO EN PROCESO','',1,0),(95,4,'132','PERSONA CONVULSIONADA','',1,0),(96,4,'119','PERSONA ENFERMA','',2,0),(97,4,'109','PERSONA ENVENENADA','',3,0),(98,4,'142','PIQUETE DE ABEJA','',1,0),(99,4,'114','PIQUETE DE ALACRÁN','',1,0),(100,4,'129','PIQUETE DE INSECTO','',2,0),(101,4,'143','SOBREDOSIS','',1,0),(102,3,'503','DERRUMBES A NAT','',0,0),(103,3,'505','TEMBLOR A NAT','',0,0),(104,1,'5006','SUSTRACCION DE MENORES INCAPACES','',3,0),(105,1,'302','AMENAZA DE BOMBA','',1,0),(106,1,'301','AMENAZAS','',3,0),(107,1,'305','ANIMAL PELIGROSO','',1,0),(108,1,'306','PERRO RABIOSO','',3,0),(109,1,'404','ASALTO/ROBO A TRANSEUNTE','',1,0),(110,1,'803','TENTATIVA DE ASALTO','',1,0),(111,1,'4003','POSESION DE DROGAS','',4,0),(112,1,'4002','VENTA DE DROGAS','',1,0),(113,1,'814','QUEMA DE BASURA','',3,0),(114,1,'508','CORTE DE CAMINO O CARRETERA','',2,0),(115,1,'504','FALLA DE ENERGIA ELECTRICA','',4,0),(116,1,'115','AGRESION','',2,0),(117,1,'151','ASESORIA JURIDICA','',5,0),(118,1,'105','BORRACHO EN VÍA PÚBLICA','',2,0),(119,1,'149','DROGADICTO EN VIA PUBLICA','',2,0),(120,1,'146','FALTAS A LA MORAL','',4,0),(121,1,'131','PERSONA AGRESIVA','',2,0),(122,1,'140','PERSONA ATRAPADA','',1,0),(123,1,'117','PERSONA DROGADA','',2,0),(124,1,'111','PERSONA EXTRAVIADA','',4,0),(125,1,'164','PERSONA TIRADA EN VIA PUBLICA','',2,0),(126,1,'106','PROSTITUCIÓN','',2,0),(127,1,'144','VEHICULO DESCOMPUESTO/OBSTRUYEND','',3,0),(128,1,'108','VIOLENCIA INTRAFAMILIAR','',1,0),(129,1,'5038','ACOPIO / TRAFICO DE ARMAS','',3,0),(130,1,'5014','ALARMA ACTIVADA','',2,0),(131,1,'5015','ALARMA MATRA ACTIVADA','',3,0),(132,1,'5034','ANIMAL MUERTO','',5,0),(133,1,'5018','APUESTAS','',2,0),(134,1,'5033','AUDIO ALTO VOLUMEN','',3,0),(135,1,'804','CONFRONTACION DE PLACAS','',3,0),(136,1,'5019','DISTURBIO EN VÍA PÚBLICA','',1,0),(137,1,'5021','ESCANDALO EN PROPIEDAD PRIVADA','',2,0),(138,1,'5022','INDIVIDUO SOSPECHOSO','',2,0),(139,1,'5037','INDOCUMENTADOS','',3,0),(140,1,'5045','INTENTO DE SUICIDIO EN PROCESO','',1,0),(141,1,'5013','LESIONADO ARMA BLANCA','',1,0),(142,1,'5012','LESIONADO ARMA DE FUEGO','',1,0),(143,1,'55032','MALTRATO A PASAJE PUBLICO','',3,0),(144,1,'5024','MANIFESTACIONES','',2,0),(145,1,'5004','MOTÍN','',1,0),(146,1,'5028','PANDILLERISMO','',3,0),(147,1,'182','PERSONA NEGANDOSE A PAGAR','',2,0),(148,1,'5020','RIÑA','',1,0),(149,1,'5008','TOMA EDIFICIO PÚBLICO','',1,0),(150,1,'5043','TRAFICO DE ANIMALES','',3,0),(151,1,'5031','VEHICULO SOSPECHOSO','',2,0),(152,1,'3005','VIOLACIÓN ÁREA RESTRINGIDA','',4,0),(153,1,'810','NOVEDADES OFICIAL','',3,0),(154,3,'502','DESBORDAMIENTO DE RÍO A NAT','',4,0),(155,3,'501','INUNDACIONES A NAT','',4,0),(156,3,'806','FUMAROLAS / ERUPCION A NAT','',3,0),(157,2,'207','ACCIDENTE DE TRANSITO CON MUERTOS','',2,0),(158,2,'203','ACCIDENTE DE TRÁNSITO','',1,0),(159,2,'206','ACCIDENTE DE TRÁNSITO CON HERIDOS','',2,0),(160,2,'511','FALLA DE ALUMBRADO PUBLICO','',4,0),(161,2,'5007','ASISTENCIA VIAL','',2,0),(162,2,'5025','SEMÁFORO DESCOMPUESTO','',4,0),(163,2,'130','ANIMALES SUELTOS','',2,0),(164,2,'5026','VEHICULO ABANDONADO','',5,0);
/*!40000 ALTER TABLE `IncidenteTipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Media`
--

DROP TABLE IF EXISTS `Media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Media` (
  `id` varchar(36) NOT NULL,
  `id_reporte` varchar(36) NOT NULL,
  `tipo` varchar(32) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_reporte` (`id_reporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Media`
--

LOCK TABLES `Media` WRITE;
/*!40000 ALTER TABLE `Media` DISABLE KEYS */;
/*!40000 ALTER TABLE `Media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permisos`
--

DROP TABLE IF EXISTS `Permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permisos` (
  `id_permiso` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permKey` varchar(50) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `submenu` varchar(100) NOT NULL,
  `class` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `menu` tinyint(1) NOT NULL DEFAULT '1',
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `permKey` (`permKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permisos`
--

LOCK TABLES `Permisos` WRITE;
/*!40000 ALTER TABLE `Permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PermisosRol`
--

DROP TABLE IF EXISTS `PermisosRol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PermisosRol` (
  `id_permisorol` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_rol` bigint(20) NOT NULL,
  `id_permiso` bigint(20) NOT NULL,
  `valor` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_permisorol`),
  UNIQUE KEY `roleID_2` (`id_rol`,`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PermisosRol`
--

LOCK TABLES `PermisosRol` WRITE;
/*!40000 ALTER TABLE `PermisosRol` DISABLE KEYS */;
/*!40000 ALTER TABLE `PermisosRol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PermisosUsuario`
--

DROP TABLE IF EXISTS `PermisosUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PermisosUsuario` (
  `id_permisousuario` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) NOT NULL,
  `id_permiso` bigint(20) NOT NULL,
  `valor` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_permisousuario`),
  UNIQUE KEY `userID` (`id_usuario`,`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PermisosUsuario`
--

LOCK TABLES `PermisosUsuario` WRITE;
/*!40000 ALTER TABLE `PermisosUsuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `PermisosUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persona`
--

DROP TABLE IF EXISTS `Persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Persona` (
  `id` varchar(36) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `apellido_paterno` varchar(32) NOT NULL,
  `apellido_materno` varchar(32) NOT NULL,
  `calle` varchar(64) NOT NULL,
  `numero` varchar(16) NOT NULL,
  `colonia` varchar(32) NOT NULL,
  `poblacion` varchar(32) NOT NULL,
  `municipio` varchar(32) NOT NULL,
  `estado` varchar(16) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persona`
--

LOCK TABLES `Persona` WRITE;
/*!40000 ALTER TABLE `Persona` DISABLE KEYS */;
INSERT INTO `Persona` VALUES ('c6c5a4c4-1b36-11e3-a55b-50465d2fdc00','Jorge','González','Becerra','León Feilpe','37','Lomas Verdes','Colima','Colima','Colima','28017','3121361900','3123013565','jorge@matica.mx','a');
/*!40000 ALTER TABLE `Persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reporte`
--

DROP TABLE IF EXISTS `Reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reporte` (
  `id` varchar(36) NOT NULL,
  `id_persona` varchar(36) NOT NULL,
  `id_tipo` int(10) unsigned NOT NULL,
  `id_evento` varchar(36) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latitud` varchar(32) NOT NULL,
  `longitud` varchar(32) NOT NULL,
  `mensaje` varchar(256) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_persona`),
  KEY `id_evento` (`id_evento`),
  KEY `id_tipo` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reporte`
--

LOCK TABLES `Reporte` WRITE;
/*!40000 ALTER TABLE `Reporte` DISABLE KEYS */;
INSERT INTO `Reporte` VALUES ('0156e4c7-9944-46a6-91e6-43ea9b874276','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:34:53','','','Prueba de mensaje desde App',1),('072983a4-8336-4818-867d-b68147a8f281','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:41:13','','','Prueba de mensaje desde App',1),('0d900bba-a61a-4d11-95ee-a42a6015597c','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:36:34','','','Prueba de mensaje desde App',1),('16de9983-856d-411f-8979-08b82c38f7ff','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:38:01','','','Prueba de mensaje desde App',1),('27de09c7-6525-45b1-bec4-987257955017','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-11 23:48:28','','','Prueba de mensaje desde App',1),('40859c29-e756-4776-a733-211d9461a5b5','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',59,'','2013-09-12 19:15:58','','','Prueba de mensaje desde App',1),('40fa8cd8-a845-4288-9b93-56c58663192e','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 19:15:34','','','Prueba de mensaje desde App',1),('4f161a59-36a9-4b43-a067-6ae251984de2','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:39:38','','','Prueba de mensaje desde App',1),('57897e84-97a2-4fd5-bf04-b1986d1e7e23','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-11 23:26:17','','','\"Prueba\"',1),('5ebd8cfb-6649-41b5-b17a-148ab3a7ff55','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-11 23:26:48','','','\"Prueba 2\"',1),('601f3353-e436-44b3-b58f-ed24508ef331','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 19:09:45','','','Prueba de mensaje desde App',1),('613461ec-08f1-42d7-b0c9-b7b1ce8386f5','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 16:27:02','','','Prueba de mensaje desde App',1),('6bcee5a1-df4b-439f-90b9-8046a6cf0d07','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:36:05','','','Prueba de mensaje desde App',1),('71e7cebe-e39f-4760-ada9-75f55b0302fa','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:38:22','','','Prueba de mensaje desde App',1),('88233e79-11ad-47b1-b694-33cd3c1d4fe8','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:35:48','','','Prueba de mensaje desde App',1),('9789fde9-c20d-43f6-b76e-d6d8478a4316','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:19:24','','','Prueba de mensaje desde App',1),('9e3c550e-742a-4eef-aa08-1a45d18237bf','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 17:07:11','','','Prueba de mensaje desde App',1),('b65eccc0-6e27-4bed-b259-4e8019c1a555','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 19:13:03','','','Prueba de mensaje desde App',1),('c4f2a30f-e6e7-4bc5-a25e-53ee66393d50','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 15:40:36','','','Prueba de mensaje desde App',1),('ec3f0c0b-5563-4984-be5d-8c2e6a4a168d','c6c5a4c4-1b36-11e3-a55b-50465d2fdc00',0,'','2013-09-12 19:14:41','','','Prueba de mensaje desde App',1);
/*!40000 ALTER TABLE `Reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `id_rol` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `roleName` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Superusuario','');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RolesUsuario`
--

DROP TABLE IF EXISTS `RolesUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RolesUsuario` (
  `id_rolusuario` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) NOT NULL,
  `id_rol` bigint(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rolusuario`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RolesUsuario`
--

LOCK TABLES `RolesUsuario` WRITE;
/*!40000 ALTER TABLE `RolesUsuario` DISABLE KEYS */;
INSERT INTO `RolesUsuario` VALUES (1,1,1,'2013-08-22 02:48:35');
/*!40000 ALTER TABLE `RolesUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `id_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `activo` enum('s','n') NOT NULL DEFAULT 's',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Jorge','jorge','33f927344e079e00d3fa45d8833b04e735223eec','s');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-12 14:18:51
