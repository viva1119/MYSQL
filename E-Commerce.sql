CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `AccountNo` int(11) NOT NULL,
  `Account_type` enum('Regular','Prime') NOT NULL,
  `Customer_customer_id` int(10) unsigned NOT NULL,
  `Cart_CartID` int(10) unsigned NOT NULL,
  `WishList_WishListID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`AccountNo`,`Customer_customer_id`,`Cart_CartID`,`WishList_WishListID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Prime',1,1,1),(2,'Prime',2,2,2),(3,'Regular',3,3,3),(4,'Regular',4,4,4),(5,'Prime',5,5,5);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `active product`
--

DROP TABLE IF EXISTS `active product`;
/*!50001 DROP VIEW IF EXISTS `active product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `active product` AS SELECT 
 1 AS `productID`,
 1 AS `ProductName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `addressID` int(11) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `AptNo` varchar(75) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'40 Parker Hill Avenue','Apt 15','Boston','MA',2120,'USA'),(2,'75 st. Alphonsus st.','Apt 305','Boston','MA',2120,'USA'),(3,'231 Park Drive','Apt 25','Boston','MA',2118,'USA'),(4,'706 Huntington Ave','Apt 412','Boston','MA',2120,'USA'),(5,'120 Parker Hill Avenue','Apt 305','Boston','MA',2120,'USA'),(6,'175 Broadway Street','Apt 3008','New York','NY',3824,'USA'),(7,'Random Rd','Apt 1124','El Cajon','CA',92020,'USA'),(8,'Mt Berryman Road','Apt 69','Flagstone Creek','Queensland',4344,'Australia'),(9,'Kailash Co Op Housing Soc., S. V. Road, Opp. Khar Police Station','Ground Flr, Plot No. 131,','Khar (w)','Mumbai',400052,'India'),(10,'114 Ralph Drive','Apt 75','Chagrin Falls','OH',44022,'USA');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billinginfo`
--

DROP TABLE IF EXISTS `billinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billinginfo` (
  `BillingID` int(11) NOT NULL,
  `CardType` enum('Debit Card','Credit Card') NOT NULL,
  `CardNo` bigint(20) DEFAULT NULL,
  `BillDate` datetime DEFAULT NULL,
  `CardExpDate` date DEFAULT NULL,
  `Customer_customer_id` int(10) unsigned NOT NULL,
  `billing_addressId` int(11) NOT NULL,
  `Balance` double DEFAULT NULL,
  `orderID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BillingID`,`Customer_customer_id`),
  KEY `fk_billing_addressId` (`billing_addressId`),
  CONSTRAINT `fk_billing_addressId` FOREIGN KEY (`billing_addressId`) REFERENCES `address` (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billinginfo`
--

LOCK TABLES `billinginfo` WRITE;
/*!40000 ALTER TABLE `billinginfo` DISABLE KEYS */;
INSERT INTO `billinginfo` VALUES (1,'Debit Card',87421594803,'2017-12-01 00:00:00','2021-08-11',1,1,10000,1),(2,'Credit Card',7028523527,'2016-10-04 00:00:00','2020-05-24',2,2,4500,2),(3,'Debit Card',7605523527,'2017-05-20 00:00:00','2022-07-21',2,2,3560,3),(4,'Debit Card',7605523527,'2016-01-01 00:00:00','2022-07-21',2,2,2800,4),(5,'Credit Card',7028523527,'2017-06-20 00:00:00','2020-05-24',2,2,1853,5),(6,'Debit Card',87421594803,'2017-12-11 00:00:00','2021-08-11',1,1,8500,6),(7,'Credit Card',7028523527,'2017-12-12 23:54:05','2020-05-24',2,2,1830.1,7);
/*!40000 ALTER TABLE `billinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `CartID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` varchar(45) NOT NULL,
  `totalItems` int(11) DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  PRIMARY KEY (`CartID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'1',NULL,NULL),(2,'2',2,75.85),(3,'3',NULL,NULL),(4,'4',1,49.99),(5,'5',3,125);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_has_product`
--

DROP TABLE IF EXISTS `cart_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_has_product` (
  `Cart_CartID` int(10) unsigned NOT NULL,
  `Product_productID` int(10) unsigned NOT NULL,
  `Product_Category_CategoryID` int(10) unsigned NOT NULL,
  `Product_Manufacturer_ManufacturerID` int(10) unsigned NOT NULL,
  `Product_WishList_WishListID` int(10) unsigned NOT NULL,
  `Product_OrderItem_OrderID` int(10) unsigned NOT NULL,
  `Product_OrderItem_Product_productID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Cart_CartID`,`Product_productID`,`Product_Category_CategoryID`,`Product_Manufacturer_ManufacturerID`,`Product_WishList_WishListID`,`Product_OrderItem_OrderID`,`Product_OrderItem_Product_productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_has_product`
--

LOCK TABLES `cart_has_product` WRITE;
/*!40000 ALTER TABLE `cart_has_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Clothing',''),(2,'Food','Food stuffs from A to Z'),(3,'Electronics','Electronic gadgets of all types'),(4,'Beauty and personal care','Everything you need for grooming'),(5,'Books','For all the readers');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) NOT NULL,
  `EmailID` varchar(45) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `phoneNo1` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ann','Sara','Sajee','annsara95@gmail.com','1995-12-26','6172835501'),(2,'Teby','','Thomas','tebythomas@gmail.com','1990-01-15','5203697160'),(3,'Gauri','','Yadav','gyadav@gmail.com','1995-05-05','8571933928'),(4,'Anamika','','Iyer','anamika95@gmail.com','1995-02-05','9429075983'),(5,'Yusuf','','Ozbek','yozbek@gmail.com','1966-12-01','6179482984');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_has_address`
--

DROP TABLE IF EXISTS `customer_has_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_has_address` (
  `Customer_customer_id` int(10) unsigned NOT NULL,
  `address_addressID` int(11) NOT NULL,
  PRIMARY KEY (`Customer_customer_id`,`address_addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_has_address`
--

LOCK TABLES `customer_has_address` WRITE;
/*!40000 ALTER TABLE `customer_has_address` DISABLE KEYS */;
INSERT INTO `customer_has_address` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `customer_has_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbadmin`
--

DROP TABLE IF EXISTS `dbadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbadmin` (
  `DBAdminID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) NOT NULL,
  PRIMARY KEY (`DBAdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbadmin`
--

LOCK TABLES `dbadmin` WRITE;
/*!40000 ALTER TABLE `dbadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `ManufacturerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ManufacturerName` varchar(45) NOT NULL,
  `additionalInfo` varchar(50) DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ManufacturerID`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `manufacturer_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Michael Kors','www.michaelkors.com',1),(2,'Forever 21','www.forever21.com',1),(3,'H & M','www.hm.com',1),(4,'Zara','www.zara.com',1),(5,'LOreal','Beauty care',4),(6,'OLAY','Beauty care',4),(7,'Maybelline New York','Beauty care',4),(8,'Garnier Frutis','Beauty care',4),(9,'Dove','Beauty care',4),(10,'Apple','Mobile phones',3),(11,'Samsung','Mobile phones',3),(12,'HP','Laptop',3),(13,'Acer','Laptop',3),(14,'Dell','Laptop',3),(15,'Natures Promise','Home stuff',2),(16,'Veggies','Home stuff',2),(17,'Kellogs Cereals','Home stuff',2),(18,'Daniel Chidiac','Books',5),(19,'John Mason','Books',5),(20,'Bose','Headphones',3);
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `OrderID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `ShippedDate` datetime DEFAULT NULL,
  `NoOfOrderItems` varchar(45) DEFAULT NULL,
  `ShippingType` enum('Standard Shipping','Speedy delivery') NOT NULL DEFAULT 'Standard Shipping',
  `orderAmount` double DEFAULT NULL,
  `customer_customer_id1` int(10) unsigned NOT NULL,
  `Shipper_ShipperID` int(11) NOT NULL,
  `Cart_CartID` int(10) unsigned NOT NULL,
  `addressID` int(11) DEFAULT NULL,
  `ShippingCharges` double DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `addressID` (`addressID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2017-12-01 16:45:54','2017-12-06 16:45:00','1','Standard Shipping',25.55,1,1,1,1,0),(2,'2016-10-04 23:59:40','2016-10-06 14:00:00','2','Speedy delivery',75.85,2,1,2,2,0.86),(3,'2017-05-20 08:15:03','2017-05-23 18:30:00','1','Standard Shipping',225,2,2,2,3,0),(4,'2016-01-01 00:25:15','2016-01-06 19:45:00','4','Standard Shipping',15.18,2,2,2,4,0),(5,'2017-06-20 10:10:30','2017-06-21 11:45:00','3','Speedy delivery',86.66,2,1,2,5,1.68),(6,'2017-12-11 22:50:00','2017-12-13 00:00:00','2','Standard Shipping',74.99,1,1,1,1,0),(7,'2017-12-12 23:43:37','2017-12-14 23:43:37','1','Speedy delivery',49.99,2,2,2,2,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order details`
--

DROP TABLE IF EXISTS `order details`;
/*!50001 DROP VIEW IF EXISTS `order details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `order details` AS SELECT 
 1 AS `orderID`,
 1 AS `productID`,
 1 AS `ProductName`,
 1 AS `unitPrice`,
 1 AS `Quantity`,
 1 AS `discount`,
 1 AS `ExtendedPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order invoice`
--

DROP TABLE IF EXISTS `order invoice`;
/*!50001 DROP VIEW IF EXISTS `order invoice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `order invoice` AS SELECT 
 1 AS `OrderID`,
 1 AS `CustomerID`,
 1 AS `CustomerName`,
 1 AS `AddressID`,
 1 AS `CustomerAddress`,
 1 AS `OrderDate`,
 1 AS `ShippedDate`,
 1 AS `ShipperName`,
 1 AS `productID`,
 1 AS `ProductName`,
 1 AS `Quantity`,
 1 AS `unitPrice`,
 1 AS `discount`,
 1 AS `ProductPrice`,
 1 AS `Total Order Amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_has_orderitem`
--

DROP TABLE IF EXISTS `order_has_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_has_orderitem` (
  `Order_OrderID` int(10) unsigned NOT NULL,
  `OrderItem_OrderID` int(10) unsigned NOT NULL,
  `OrderItem_Product_productID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Order_OrderID`,`OrderItem_OrderID`,`OrderItem_Product_productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_has_orderitem`
--

LOCK TABLES `order_has_orderitem` WRITE;
/*!40000 ALTER TABLE `order_has_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_has_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `orderID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `unitPrice` double NOT NULL,
  `Quantity` int(11) NOT NULL,
  `discount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,29.99,1,4.44),(2,2,49.99,1,0),(2,3,25,1,0),(3,12,225,1,0),(4,13,1.75,1,0),(4,14,1.99,1,0),(4,5,5.45,1,0),(4,11,5.99,1,0),(5,3,25,1,0),(5,2,49.99,1,0),(5,4,9.99,1,0),(6,2,49.99,1,0),(6,3,25,1,0),(6,2,49.99,1,0),(6,3,25,1,0),(6,2,49.99,1,0),(6,3,25,1,0),(6,2,49.99,1,0),(6,3,25,1,0),(6,2,49.99,1,0),(6,3,25,1,0),(6,2,49.99,1,0),(6,3,25,1,0),(7,2,49.99,1,0);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Check_product_qty_availability` 
before insert ON `orderitem` 
FOR EACH ROW 
BEGIN
   IF (orderitem.Quantity <= product.unitsInStock)
   THEN
		insert into orderitem(orderID,productID,unitPrice,Quantity,discount)
        values(new.orderID,new.productID,new.unitPrice,new.Quantity,new.discount);
   END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ProductQty update`
AFTER INSERT ON mydb.orderitem
FOR EACH ROW begin
declare x Int;
set x = 1; /*(select quantity from mydb.orderitem where )*/
  UPDATE product 
     SET product.unitsInStock = product.unitsInStock - x
   WHERE productID = NEW.productID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `PaymentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `DateTime` datetime NOT NULL,
  `PaymentAmount` double NOT NULL,
  `PaymentMethod` enum('Debit Card','Credit Card','Cash') NOT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,6,'2017-12-11 22:50:00',25.55,'Debit Card'),(2,2,7,'2017-12-12 15:09:19',49.99,'Credit Card');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER updateBalanceAfterPayment
before insert ON `payment` 
FOR EACH ROW 
BEGIN
update billinginfo join customer
on customer.customer_id = billinginfo.Customer_customer_id
join mydb.order on customer.customer_id = mydb.order.customer_customer_id1
set Balance = Balance - mydb.order.OrderAmount;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER updateBalancebeforePayment
before insert ON `payment` 
FOR EACH ROW 
BEGIN
	if(mydb.order.OrderAmount <= billinginfo.Balance)
    then
		update billinginfo join customer
		on customer.customer_id = billinginfo.Customer_customer_id
		join mydb.order on customer.customer_id = mydb.order.customer_customer_id1
		set Balance = Balance - mydb.order.OrderAmount;
		insert into billinginfo(BillingID,CardType,CardNo,BillDate,CardExpDate,Customer_customer_id,billing_addressId, Balance,orderID)
        values(7,'Credit Card','7028523527',now(),'2020-05-24',2,2,Balance - mydb.order.OrderAmount,7);
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger `Update Product Quantity`
AFTER Insert 
ON payment 
FOR EACH ROW 
update product  JOIN  orderitem 
ON orderitem.productID = product.productID
JOIN payment ON payment.orderID = orderitem.orderID
set unitsInStock = unitsInStock - orderitem.Quantity */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `unitPrice` double DEFAULT NULL,
  `unitsInStock` int(11) DEFAULT NULL,
  `unitsOnOrder` int(11) DEFAULT NULL,
  `Category_CategoryID` int(10) unsigned NOT NULL,
  `Manufacturer_ManufacturerID` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`productID`),
  KEY `Category_CategoryID` (`Category_CategoryID`),
  KEY `Manufacturer_ManufacturerID` (`Manufacturer_ManufacturerID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Manufacturer_ManufacturerID`) REFERENCES `manufacturer` (`ManufacturerID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Knit Sweater Top',29.99,40,3,1,2,1),(2,'Mens Jeans',49.99,50,2,1,3,1),(3,'Kids Dress',25,45,6,1,3,1),(4,'Coconut Oil',9.99,25,4,2,15,1),(5,'Veggie Rolls',5.45,55,1,2,15,1),(6,'Dell Inspiron',875.99,15,5,3,14,1),(7,'McBookPro',1600,15,7,3,10,1),(8,'HP Spectre ',820,10,4,3,12,0),(9,'iPhone 10',999,30,21,3,10,1),(10,'Who says you cant? YOU DO',14.99,15,10,5,18,1),(11,'Believe You Can',5.99,25,18,5,19,1),(12,'Bose Headphones',225,55,8,3,20,1),(13,'Garlic Bread',1.75,30,10,2,15,1),(14,'Mini Donuts',1.99,30,15,2,15,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `products above average price`
--

DROP TABLE IF EXISTS `products above average price`;
/*!50001 DROP VIEW IF EXISTS `products above average price`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `products above average price` AS SELECT 
 1 AS `ProductName`,
 1 AS `unitPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `products by category`
--

DROP TABLE IF EXISTS `products by category`;
/*!50001 DROP VIEW IF EXISTS `products by category`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `products by category` AS SELECT 
 1 AS `CategoryName`,
 1 AS `ProductName`,
 1 AS `unitPrice`,
 1 AS `unitsInStock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `recommendation`
--

DROP TABLE IF EXISTS `recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendation` (
  `CustomerID` int(10) unsigned NOT NULL,
  `Description` varchar(50) NOT NULL,
  `ProductID` int(10) unsigned NOT NULL,
  `categoryID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation`
--

LOCK TABLES `recommendation` WRITE;
/*!40000 ALTER TABLE `recommendation` DISABLE KEYS */;
INSERT INTO `recommendation` VALUES (1,'Similar to what you purchased',1,'1'),(2,'Similar laptop',6,'3');
/*!40000 ALTER TABLE `recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Ratings` enum('1','2','3','4,','5') NOT NULL,
  `Product_productID` int(10) unsigned NOT NULL,
  `Product_Category_CategoryID` int(10) unsigned NOT NULL,
  `Product_Manufacturer_ManufacturerID` int(10) unsigned NOT NULL,
  `Product_WishList_WishListID` int(10) unsigned NOT NULL,
  `Product_OrderItem_OrderID` int(10) unsigned NOT NULL,
  `Product_OrderItem_Product_productID` int(10) unsigned NOT NULL,
  `Customer_customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Very good product','5',1,1,2,1,1,1,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sales by category`
--

DROP TABLE IF EXISTS `sales by category`;
/*!50001 DROP VIEW IF EXISTS `sales by category`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sales by category` AS SELECT 
 1 AS `CategoryID`,
 1 AS `CategoryName`,
 1 AS `ProductName`,
 1 AS `ProductSales`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shipper`
--

DROP TABLE IF EXISTS `shipper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipper` (
  `ShipperID` int(11) NOT NULL,
  `ShipperName` varchar(45) NOT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipper`
--

LOCK TABLES `shipper` WRITE;
/*!40000 ALTER TABLE `shipper` DISABLE KEYS */;
INSERT INTO `shipper` VALUES (1,'UPS'),(2,'FedEx');
/*!40000 ALTER TABLE `shipper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `WishListID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` varchar(45) NOT NULL,
  PRIMARY KEY (`WishListID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_has_product`
--

DROP TABLE IF EXISTS `wishlist_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_has_product` (
  `WishList_WishListID` int(10) unsigned NOT NULL,
  `Product_productID` int(10) unsigned NOT NULL,
  `Product_Category_CategoryID` int(10) unsigned NOT NULL,
  `Product_Manufacturer_ManufacturerID` int(10) unsigned NOT NULL,
  `Product_WishList_WishListID` int(10) unsigned NOT NULL,
  `Product_OrderItem_OrderID` int(10) unsigned NOT NULL,
  `Product_OrderItem_Product_productID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`WishList_WishListID`,`Product_productID`,`Product_Category_CategoryID`,`Product_Manufacturer_ManufacturerID`,`Product_WishList_WishListID`,`Product_OrderItem_OrderID`,`Product_OrderItem_Product_productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_has_product`
--

LOCK TABLES `wishlist_has_product` WRITE;
/*!40000 ALTER TABLE `wishlist_has_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `Customer Orders history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Customer Orders history`(in customerID int)
begin
select mydb.order.OrderID,
mydb.order.NoOfOrderItems,
mydb.order.OrderDate,
mydb.order.ShippedDate,
mydb.order.OrderAmount
from mydb.order
where mydb.order.customer_customer_id1 = customerID
order by OrderID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Order details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Order details`(in orderID int)
begin
select product.ProductName,
product.unitPrice,
orderitem.Quantity,
orderitem.discount,
round(orderitem.unitPrice * orderitem.Quantity - orderitem.discount) as ProductPrice
from product inner join orderitem 
on orderitem.productID = product.productID
where orderitem.orderID = orderID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sales by category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sales by category`(in atCategoryName varchar(50))
begin
select product.ProductName,
round(sum(orderitem.unitPrice * orderitem.Quantity - orderitem.discount)) as TotalPrice
from orderitem
inner join mydb.order using (orderID)
inner join product using (productID)
inner join category using (categoryID)
where CategoryName = atCategoryName
group by ProductName
order by ProductName;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sales by year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sales by year`(in beginningDate date, in endDate date)
begin
select mydb.order.ShippedDate,
mydb.order.OrderID,
mydb.order.OrderAmount
from mydb.order
where mydb.order.ShippedDate between beginningDate and endDate;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SalesByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SalesByCategory`(IN AtCategoryName VARCHAR(15), IN AtOrdYear VARCHAR(4))
BEGIN
   SELECT
      ProductName,
	     ROUND(SUM(orderitem.Quantity * orderitem.unitPrice * orderitem.discount)) AS TotalPurchase
   FROM orderitem 
      INNER JOIN mydb.order USING (OrderID)
      INNER JOIN product USING (productID)
      INNER JOIN category USING (CategoryID)
   WHERE category.CategoryName = AtCategoryName
      AND YEAR(mydb.order.OrderDate) = AtOrdYear
   GROUP BY ProductName
   ORDER BY ProductName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Top 10 most expensive products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Top 10 most expensive products`()
begin
select product.ProductName as Top10MostExpensiveProducts,
product.unitPrice
from product
order by product.unitPrice desc
limit 10;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `active product`
--

/*!50001 DROP VIEW IF EXISTS `active product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `active product` AS select `product`.`productID` AS `productID`,`product`.`ProductName` AS `ProductName` from `product` where (`product`.`active` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order details`
--

/*!50001 DROP VIEW IF EXISTS `order details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order details` AS select `orderitem`.`orderID` AS `orderID`,`orderitem`.`productID` AS `productID`,`product`.`ProductName` AS `ProductName`,`orderitem`.`unitPrice` AS `unitPrice`,`orderitem`.`Quantity` AS `Quantity`,`orderitem`.`discount` AS `discount`,round(((`orderitem`.`unitPrice` * `orderitem`.`Quantity`) - `orderitem`.`discount`),0) AS `ExtendedPrice` from (`product` join `orderitem` on((`product`.`productID` = `orderitem`.`productID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order invoice`
--

/*!50001 DROP VIEW IF EXISTS `order invoice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order invoice` AS select `order`.`OrderID` AS `OrderID`,`order`.`customer_customer_id1` AS `CustomerID`,concat(`customer`.`firstName`,' ',`customer`.`lastName`) AS `CustomerName`,`customer_has_address`.`address_addressID` AS `AddressID`,concat_ws(' ',`address`.`street`,`address`.`AptNo`,`address`.`city`,`address`.`state`,`address`.`zipCode`) AS `CustomerAddress`,`order`.`OrderDate` AS `OrderDate`,`order`.`ShippedDate` AS `ShippedDate`,`shipper`.`ShipperName` AS `ShipperName`,`product`.`productID` AS `productID`,`product`.`ProductName` AS `ProductName`,`orderitem`.`Quantity` AS `Quantity`,`orderitem`.`unitPrice` AS `unitPrice`,`orderitem`.`discount` AS `discount`,round(((`orderitem`.`unitPrice` * `orderitem`.`Quantity`) - `orderitem`.`discount`),0) AS `ProductPrice`,`order`.`orderAmount` AS `Total Order Amount` from ((((((`customer` join `order` on((`customer`.`customer_id` = `order`.`customer_customer_id1`))) join `customer_has_address` on((`customer_has_address`.`Customer_customer_id` = `customer`.`customer_id`))) join `address` on((`address`.`addressID` = `customer_has_address`.`address_addressID`))) join `orderitem` on((`order`.`OrderID` = `orderitem`.`orderID`))) join `product` on((`product`.`productID` = `orderitem`.`orderID`))) join `shipper` on((`shipper`.`ShipperID` = `order`.`Shipper_ShipperID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `products above average price`
--

/*!50001 DROP VIEW IF EXISTS `products above average price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products above average price` AS select `product`.`ProductName` AS `ProductName`,`product`.`unitPrice` AS `unitPrice` from `product` where (`product`.`unitsInStock` > (select avg(`product`.`unitsInStock`) from `product`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `products by category`
--

/*!50001 DROP VIEW IF EXISTS `products by category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products by category` AS select `category`.`CategoryName` AS `CategoryName`,`product`.`ProductName` AS `ProductName`,`product`.`unitPrice` AS `unitPrice`,`product`.`unitsInStock` AS `unitsInStock` from (`category` join `product` on((`category`.`CategoryID` = `product`.`Category_CategoryID`))) where (`product`.`active` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales by category`
--

/*!50001 DROP VIEW IF EXISTS `sales by category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales by category` AS select `category`.`CategoryID` AS `CategoryID`,`category`.`CategoryName` AS `CategoryName`,`product`.`ProductName` AS `ProductName`,sum(round(((`orderitem`.`unitPrice` * `orderitem`.`Quantity`) - `orderitem`.`discount`),0)) AS `ProductSales` from ((((`category` join `product` on((`category`.`CategoryID` = `product`.`Category_CategoryID`))) join `order details` on((`product`.`productID` = `order details`.`productID`))) join `order` on((`order`.`OrderID` = `order details`.`orderID`))) join `orderitem` on((`order`.`OrderID` = `orderitem`.`orderID`))) where (`order`.`OrderID` between '2015-01-01' and '2017-12-10') group by `category`.`CategoryID`,`category`.`CategoryName` */;
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

-- Dump completed on 2017-12-13  0:54:04
