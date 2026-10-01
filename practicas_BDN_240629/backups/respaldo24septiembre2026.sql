CREATE DATABASE  IF NOT EXISTS `db_test_7b` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_test_7b`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_test_7b
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
-- Table structure for table `tb_logs`
--

DROP TABLE IF EXISTS `tb_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_logs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(80) NOT NULL,
  `table_operation` enum('Create','Read','Update','Delete') DEFAULT NULL,
  `db_user` varchar(80) NOT NULL,
  `operation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `table_descripcion` text NOT NULL,
  `operation_status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_logs`
--

LOCK TABLES `tb_logs` WRITE;
/*!40000 ALTER TABLE `tb_logs` DISABLE KEYS */;
INSERT INTO `tb_logs` VALUES (1,'tb_users','Create','root@localhost','2026-09-10 11:20:31','Usuario de prueba creado',_binary ''),(2,'tb_users','Create','root@localhost','2026-09-10 12:26:09','Usuario Pedro creado',_binary ''),(3,'tb_users','Create','marco.ramirez@%','2026-09-10 12:26:24','Usuario creado con nick: Osmar email: 240036@utxicotepec.edu.mx',_binary ''),(4,'tb_users','Create','yane.garrido@%','2026-09-17 10:04:08','Usuario creado con nick: Gael email: 242036@utxicotepec.edu.mx',_binary ''),(5,'tb_users','Create','marco.ramirez@%','2026-09-17 10:04:08','Usuario creado con nick: Lopez email: 242236@utxicotepec.edu.mx',_binary ''),(6,'tb_users','Create','yane.garrido@%','2026-09-17 10:04:08','Usuario creado con nick: ING-Yanet email: yanet@utxicotepec.edu.mx',_binary ''),(7,'tb_users','Create','dorian.barrios@%','2026-09-17 10:04:08','Usuario creado con nick: ING-Luis email: luis@utxicotepec.edu.mx',_binary ''),(8,'tb_users','Create','obed.vargas@%','2026-09-17 10:04:08','Usuario creado con nick: lisy email: lisbeth@example.com',_binary ''),(9,'tb_users','Create','osmar.ortega@%','2026-09-17 10:04:08','Usuario creado con nick: Yhon email: yonathan@example.com',_binary ''),(10,'tb_users','Create','marco.ramirez@%','2026-09-17 10:04:08','Usuario creado con nick: jessy email: jessy@example.com',_binary ''),(11,'tb_products','Create','obed.vargas@DESKTOP-978SUTP','2026-09-17 13:06:37','Producto creado. ID=5, SKU=PROD-003, Nombre=Teclado Mecánico RGB, Precio=1250.00, Stock=15',_binary ''),(12,'tb_products','Create','obed.vargas@DESKTOP-978SUTP','2026-09-17 13:06:37','Producto creado. ID=6, SKU=PROD-004, Nombre=Monitor Gamer 27\", Precio=4500.00, Stock=8',_binary ''),(13,'tb_products','Create','obed.vargas@DESKTOP-978SUTP','2026-09-17 13:06:37','Producto creado. ID=7, SKU=PROD-005, Nombre=Audífonos Bluetooth, Precio=850.50, Stock=20',_binary ''),(14,'tb_products','Create','obed.vargas@DESKTOP-978SUTP','2026-09-17 13:06:37','Producto creado. ID=8, SKU=PROD-006, Nombre=Silla Ergonómica Gamer, Precio=3200.00, Stock=5',_binary ''),(15,'tb_products','Create','obed.vargas@DESKTOP-978SUTP','2026-09-17 13:06:37','Producto creado. ID=9, SKU=PROD-007, Nombre=Disco Duro SSD 1TB, Precio=1450.00, Stock=12',_binary ''),(16,'tb_products','Update','root@localhost','2026-09-17 13:32:28','Producto modificado. ID=3, SKU=PROD-001, Status previo=, Status nuevo=\0',_binary ''),(17,'tb_products','Update','root@localhost','2026-09-17 13:37:18','Producto modificado. ID=6, SKU=PROD-004, Status previo=, Status nuevo=\0',_binary ''),(18,'tb_products','Update','root@localhost','2026-09-17 13:38:29','Producto modificado. ID=6, SKU=PROD-004, Status previo=\0, Status nuevo=',_binary ''),(19,'tb_products','Create','root@localhost','2026-09-18 20:16:44','Producto creado. ID=26,SKU=PROD-008,name=Memoria RAM 16GB DDR4,price=1100.00,stock=30,status=',_binary ''),(20,'tb_products','Create','root@localhost','2026-09-18 20:16:44','Producto creado. ID=27,SKU=PROD-009,name=Tarjeta de Video RTX 3060,price=7800.00,stock=4,status=',_binary ''),(21,'tb_products','Create','root@localhost','2026-09-18 20:16:44','Producto creado. ID=28,SKU=PROD-010,name=Fuente de Poder 750W,price=2300.00,stock=10,status=',_binary ''),(22,'tb_products','Delete','root@localhost','2026-09-18 20:25:32','Producto eliminado. ID=26,SKU=PROD-008,name=Memoria RAM 16GB DDR4',_binary ''),(23,'tb_products','Create','root@localhost','2026-09-18 20:28:14','Producto creado. ID=29,SKU=PROD-008,name=Memoria RAM 16GB DDR4,price=1100.00,stock=30,status=',_binary ''),(24,'tb_users','Create','admin_user@localhost','2026-09-24 10:35:20','Usuario creado con nick: juanperez y email: juan@example.com',_binary ''),(25,'tb_users','Create','root@localhost','2026-09-24 10:35:20','Usuario creado con nick: mariasoto y email: maria@example.com',_binary ''),(26,'tb_users','Create','admin_user@localhost','2026-09-24 10:36:03','Usuario creado con nick: juanperez y email: juan@example.com',_binary ''),(27,'tb_users','Create','root@localhost','2026-09-24 10:36:03','Usuario creado con nick: mariasoto y email: maria@example.com',_binary '');
/*!40000 ALTER TABLE `tb_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_products`
--

DROP TABLE IF EXISTS `tb_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_products` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SKU` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `current_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `current_stock` int unsigned NOT NULL DEFAULT '0',
  `status` bit(1) DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SKU` (`SKU`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_products`
--

LOCK TABLES `tb_products` WRITE;
/*!40000 ALTER TABLE `tb_products` DISABLE KEYS */;
INSERT INTO `tb_products` VALUES (3,'PROD-001','Laptop Gamer Pro 15','Laptop con procesador Intel i7 y 16GB RAM',18500.00,10,_binary '\0','2026-09-17 11:36:20','2026-09-17 13:32:28'),(4,'PROD-002','Mouse Inalámbrico RGB','Mouse ergonómico recargable de alta precisión',450.50,25,_binary '','2026-09-17 11:36:20','2026-09-17 11:36:20'),(5,'PROD-003','Teclado Mecánico RGB','Teclado gamer switches azules retroiluminado',1250.00,15,_binary '','2026-09-17 13:06:37','2026-09-17 13:06:37'),(6,'PROD-004','Monitor Gamer 27\"','Monitor LED 144Hz 1ms IPS Full HD',4500.00,8,_binary '','2026-09-17 13:06:37','2026-09-17 13:38:29'),(7,'PROD-005','Audífonos Bluetooth','Cancelación de ruido e iluminación LED',850.50,20,_binary '','2026-09-17 13:06:37','2026-09-17 13:06:37'),(8,'PROD-006','Silla Ergonómica Gamer','Silla de escritorio reclinable con soporte lumbar',3200.00,5,_binary '','2026-09-17 13:06:37','2026-09-17 13:06:37'),(9,'PROD-007','Disco Duro SSD 1TB','SSD M.2 NVMe lectura 3500MB/s',1450.00,12,_binary '','2026-09-17 13:06:37','2026-09-17 13:06:37'),(27,'PROD-009','Tarjeta de Video RTX 3060','Tarjeta gráfica de 12GB GDDR6',7800.00,4,_binary '','2026-09-18 20:16:44','2026-09-18 20:16:44'),(28,'PROD-010','Fuente de Poder 750W','Fuente certificada 80 Plus Gold modular',2300.00,10,_binary '','2026-09-18 20:16:44','2026-09-18 20:16:44'),(29,'PROD-008','Memoria RAM 16GB DDR4','Módulo de memoria RAM a 3200MHz',1100.00,30,_binary '','2026-09-18 20:28:14','2026-09-18 20:28:14');
/*!40000 ALTER TABLE `tb_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_products_after_insert` AFTER INSERT ON `tb_products` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        table_descripcion,
        operation_date,
        operation_status
    )
    VALUES (
        'tb_products',
        'Create',
        USER(),
        CONCAT(
            'Producto creado. ID=', NEW.ID,
            ',SKU=', NEW.SKU,
            ',name=', NEW.name,
            ',price=', NEW.current_price,
            ',stock=', NEW.current_stock,
            ',status=', NEW.status
        ),
        CURRENT_TIMESTAMP,
        b'1'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_products_after_update` AFTER UPDATE ON `tb_products` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_users,
        table_description,
        operation_date,
        operation_status
    )
    VALUES (
        'tb_products',
        'Update',
        USER(),
        CONCAT(
            'Producto modificado. ID=', NEW.ID,
            ' | Nombre: ', OLD.name, ' -> ', NEW.name,
            ' | Precio: ', OLD.current_price, ' -> ', NEW.current_price,
            ' | Stock: ', OLD.current_stock, ' -> ', NEW.current_stock
        ),
        CURRENT_TIMESTAMP,
        b'1'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_products_after_delete` AFTER DELETE ON `tb_products` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        table_descripcion,
        operation_date,
        operation_status
    )
    VALUES (
        'tb_products',
        'Delete',
        USER(),
        CONCAT(
            'Producto eliminado. ID=', OLD.ID,
            ',SKU=', OLD.SKU,
            ',name=', OLD.name
        ),
        CURRENT_TIMESTAMP,
        b'1'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `nick` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_users`
--

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` VALUES (8,'240036@utxicotepec.edu.mx','Osmar','680cdf3f4fbe1106a6b5a135d8a7c9fb','2026-09-10 11:05:33',NULL,NULL,_binary ''),(9,'242036@utxicotepec.edu.mx','Gael','b6a1fd7d4f3712749bec7db3cee224f4','2026-09-10 11:06:32',NULL,NULL,_binary ''),(10,'242236@utxicotepec.edu.mx','Lopez','1258d3f13e937d470d4e3310d6113d94','2026-09-10 11:07:03',NULL,NULL,_binary ''),(11,'yanet@utxicotepec.edu.mx','ING-Yanet','bf2e6e8f1192a1225d648d18a8fc5026','2026-09-10 11:29:28',NULL,NULL,_binary ''),(12,'luis@utxicotepec.edu.mx','ING-Luis','6400d6e5df9a15b35f760cded1177c31','2026-09-10 11:29:39',NULL,NULL,_binary ''),(13,'lisbeth@example.com','lisy','12345678','2026-09-17 11:57:00',NULL,NULL,_binary ''),(14,'yonathan@example.com','Yhon','12345678','2026-09-17 11:57:00',NULL,NULL,_binary ''),(15,'jessy@example.com','jessy','12345678','2026-09-17 11:57:00',NULL,NULL,_binary ''),(16,'teo@example.com','teo','12345678','2026-09-17 12:38:04',NULL,NULL,_binary ''),(17,'rick@example.com','morty','12345678','2026-09-17 12:38:04',NULL,NULL,_binary '');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_trazabilidad_productos`
--

DROP TABLE IF EXISTS `vw_trazabilidad_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_productos` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `inserted_by`,
 1 AS `roles`,
 1 AS `operation_description`,
 1 AS `operation_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_usuarios`
--

DROP TABLE IF EXISTS `vw_trazabilidad_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_usuarios` AS SELECT 
 1 AS `id`,
 1 AS `nick`,
 1 AS `email`,
 1 AS `inserted_by`,
 1 AS `roles`,
 1 AS `operation_description`,
 1 AS `operation_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_test_7b'
--

--
-- Dumping routines for database 'db_test_7b'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_products_by_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_products_by_price`(
    IN min_p DECIMAL(10,2),
    IN max_p DECIMAL(10,2)
)
BEGIN
    SELECT ID, SKU, name, current_price, current_stock
    FROM tb_products
    WHERE current_price BETWEEN min_p AND max_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_trazabilidad_productos`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_productos` AS select `p`.`ID` AS `id`,`p`.`name` AS `name`,`p`.`description` AS `description`,`b`.`db_user` AS `inserted_by`,coalesce(group_concat(distinct `re`.`FROM_USER` separator ', '),'Sin rol') AS `roles`,`b`.`table_descripcion` AS `operation_description`,`b`.`operation_date` AS `operation_date` from ((`tb_products` `p` join `tb_logs` `b` on((`b`.`table_descripcion` like concat('%ID=',`p`.`ID`,'%')))) left join `mysql`.`role_edges` `re` on((`re`.`TO_USER` = substring_index(`b`.`db_user`,'@',1)))) where ((`b`.`table_operation` = 'Create') and (`b`.`table_name` = 'tb_products')) group by `p`.`ID`,`p`.`name`,`p`.`description`,`b`.`db_user`,`b`.`table_descripcion`,`b`.`operation_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_usuarios` AS select `u`.`ID` AS `id`,`u`.`nick` AS `nick`,`u`.`email` AS `email`,`b`.`db_user` AS `inserted_by`,coalesce(group_concat(distinct `re`.`FROM_USER` separator ', '),'Sin rol') AS `roles`,`b`.`table_descripcion` AS `operation_description`,`b`.`operation_date` AS `operation_date` from ((`tb_users` `u` join `tb_logs` `b` on((`b`.`table_descripcion` like concat('%',`u`.`nick`,'%')))) left join `mysql`.`role_edges` `re` on((`re`.`TO_USER` = substring_index(`b`.`db_user`,'@',1)))) where ((`b`.`table_operation` = 'Create') and (`b`.`table_name` = 'tb_users')) group by `u`.`ID`,`u`.`nick`,`u`.`email`,`b`.`db_user`,`b`.`table_descripcion`,`b`.`operation_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-24 13:02:13
