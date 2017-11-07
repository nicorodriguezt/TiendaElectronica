CREATE DATABASE  IF NOT EXISTS `tiendaelectronica` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tiendaelectronica`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tiendaelectronica
-- ------------------------------------------------------
-- Server version	5.5.56

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
-- Table structure for table `caracteristica`
--

DROP TABLE IF EXISTS `caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristica` (
  `idCaracteristica` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idCaracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristica`
--

LOCK TABLES `caracteristica` WRITE;
/*!40000 ALTER TABLE `caracteristica` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `RazonSocial` varchar(45) NOT NULL,
  `Cuit` varchar(45) NOT NULL,
  `Mail` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `Cuit_UNIQUE` (`Cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compatibilidad`
--

DROP TABLE IF EXISTS `compatibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compatibilidad` (
  `idComponente` int(11) NOT NULL,
  `idCaracteristica` int(11) NOT NULL,
  `Valor` varchar(45) NOT NULL,
  PRIMARY KEY (`idComponente`,`idCaracteristica`),
  KEY `fk_Compatibilidad_Caracteristica1_idx` (`idCaracteristica`),
  CONSTRAINT `fk_Compatibilidad_Caracteristica1` FOREIGN KEY (`idCaracteristica`) REFERENCES `caracteristica` (`idCaracteristica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compatibilidad_Componente1` FOREIGN KEY (`idComponente`) REFERENCES `componente` (`idComponente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compatibilidad`
--

LOCK TABLES `compatibilidad` WRITE;
/*!40000 ALTER TABLE `compatibilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `compatibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente`
--

DROP TABLE IF EXISTS `componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componente` (
  `idComponente` int(11) NOT NULL AUTO_INCREMENT,
  `idProductos` int(11) NOT NULL,
  `CantDisponible` int(11) NOT NULL DEFAULT '0',
  `idTipoComponente` int(11) NOT NULL,
  PRIMARY KEY (`idComponente`),
  UNIQUE KEY `idProductos_UNIQUE` (`idProductos`),
  KEY `fk_Componente_TipoComponente1_idx` (`idTipoComponente`),
  CONSTRAINT `fk_Componentes_Producto1` FOREIGN KEY (`idProductos`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Componente_TipoComponente1` FOREIGN KEY (`idTipoComponente`) REFERENCES `tipocomponente` (`idTipoComponente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente`
--

LOCK TABLES `componente` WRITE;
/*!40000 ALTER TABLE `componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentesxcomputadora`
--

DROP TABLE IF EXISTS `componentesxcomputadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentesxcomputadora` (
  `idComponentesXComputadora` int(11) NOT NULL AUTO_INCREMENT,
  `idComputadora` int(11) NOT NULL,
  `idComponente` int(11) NOT NULL,
  PRIMARY KEY (`idComponentesXComputadora`),
  UNIQUE KEY `Computadora` (`idComputadora`,`idComponentesXComputadora`),
  CONSTRAINT `fk_ComponentesXComputadora_Componentes1` FOREIGN KEY (`idComponente`) REFERENCES `componente` (`idComponente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ComponentesXComputadora_Computadora1` FOREIGN KEY (`idComputadora`) REFERENCES `computadora` (`idComputadora`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentesxcomputadora`
--

LOCK TABLES `componentesxcomputadora` WRITE;
/*!40000 ALTER TABLE `componentesxcomputadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `componentesxcomputadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computadora`
--

DROP TABLE IF EXISTS `computadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computadora` (
  `idComputadora` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idComputadora`),
  UNIQUE KEY `idProducto_UNIQUE` (`idProducto`),
  CONSTRAINT `fk_Computadora_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computadora`
--

LOCK TABLES `computadora` WRITE;
/*!40000 ALTER TABLE `computadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `computadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineapresupuesto`
--

DROP TABLE IF EXISTS `lineapresupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineapresupuesto` (
  `idLineaPresupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `idPresupuesto` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `PrecioUnit` double NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idLineaPresupuesto`),
  KEY `fk_LineaPresupuesto_Presupuesto1_idx` (`idPresupuesto`),
  KEY `fk_LineaPresupuesto_Producto1_idx` (`idProducto`),
  CONSTRAINT `fk_LineaPresupuesto_Presupuesto1` FOREIGN KEY (`idPresupuesto`) REFERENCES `presupuesto` (`idPresupuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_LineaPresupuesto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineapresupuesto`
--

LOCK TABLES `lineapresupuesto` WRITE;
/*!40000 ALTER TABLE `lineapresupuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineapresupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presupuesto` (
  `idPresupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `PresupuestoNro` int(11) NOT NULL,
  `FechaRealizado` date NOT NULL,
  `FechaFin` date NOT NULL,
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`idPresupuesto`),
  UNIQUE KEY `PresupuestoNro_UNIQUE` (`PresupuestoNro`),
  KEY `fk_Presupuesto_Cliente_idx` (`IdCliente`),
  CONSTRAINT `fk_Presupuesto_Cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuesto`
--

LOCK TABLES `presupuesto` WRITE;
/*!40000 ALTER TABLE `presupuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Precio` double NOT NULL,
  `TipoProducto` varchar(45) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocomponente`
--

DROP TABLE IF EXISTS `tipocomponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocomponente` (
  `idTipoComponente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoComponente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocomponente`
--

LOCK TABLES `tipocomponente` WRITE;
/*!40000 ALTER TABLE `tipocomponente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocomponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocomputadora`
--

DROP TABLE IF EXISTS `tipocomputadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocomputadora` (
  `idTipoComputadora` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoComputadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocomputadora`
--

LOCK TABLES `tipocomputadora` WRITE;
/*!40000 ALTER TABLE `tipocomputadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocomputadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodeusuario`
--

DROP TABLE IF EXISTS `tipodeusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodeusuario` (
  `idTipoDeUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoDeUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodeusuario`
--

LOCK TABLES `tipodeusuario` WRITE;
/*!40000 ALTER TABLE `tipodeusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodeusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoxproducto`
--

DROP TABLE IF EXISTS `tipoxproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoxproducto` (
  `idTipoXProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoComputadora` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idTipoXProducto`),
  KEY `fk_TipoXProducto_Producto1_idx` (`idProducto`),
  KEY `fk_TipoXProducto_TipoComputadora1_idx` (`idTipoComputadora`),
  CONSTRAINT `fk_TipoXProducto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoXProducto_TipoComputadora1` FOREIGN KEY (`idTipoComputadora`) REFERENCES `tipocomputadora` (`idTipoComputadora`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoxproducto`
--

LOCK TABLES `tipoxproducto` WRITE;
/*!40000 ALTER TABLE `tipoxproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoxproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoDeUsuario` int(11) NOT NULL,
  `Usuario` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_idUsuario_Cliente1_idx` (`idCliente`),
  KEY `fk_Usuario_TipoDeUsuario1_idx` (`idTipoDeUsuario`),
  CONSTRAINT `fk_idUsuario_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_TipoDeUsuario1` FOREIGN KEY (`idTipoDeUsuario`) REFERENCES `tipodeusuario` (`idTipoDeUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL,
  `FechaVenta` datetime NOT NULL,
  `IdPresupuesto` int(11) NOT NULL,
  `FacturaNro` int(11) NOT NULL,
  PRIMARY KEY (`idVenta`),
  UNIQUE KEY `IdPresupuesto_UNIQUE` (`IdPresupuesto`),
  KEY `fk_Venta_Presupuesto1_idx` (`IdPresupuesto`),
  CONSTRAINT `fk_Venta_Presupuesto1` FOREIGN KEY (`IdPresupuesto`) REFERENCES `presupuesto` (`idPresupuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-07 18:57:35
