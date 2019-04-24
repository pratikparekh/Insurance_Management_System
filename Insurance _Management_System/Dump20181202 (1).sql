-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: fall2018databaseparekh.cbskcsxbgaol.us-east-2.rds.amazonaws.com    Database: Insurance_Management
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='';

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Account_type` varchar(30) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('abi','rangu','Customer'),('Akki','Akshay987','Customer'),('akshayayyanchira','password','Customer'),('Amy ','am987','Customer'),('anokha','anokha','Customer'),('Black','bl754','Customer'),('Brown','Password534','Customer'),('brucewayne','Test123','Agent'),('Charles','cl564','Agent'),('Dipesh','dp098','Manager'),('Dushant','pass@234','Agent'),('eleven','en367','Customer'),('Erika','Password534','Agent'),('Forum234','fox234','Customer'),('Ganesh567','nicely_done','Customer'),('Gaurav','gm.234','Customer'),('Gorden','gn345','Customer'),('Guptasir','yes_boss','Manager'),('Harini','PasswordEncrypted','Manager'),('harini45','PASSWORD','Customer'),('harini67','HARINI','Customer'),('Harish','hr345','Manager'),('harrypotter','Password','Agent'),('jajs','omsairam','Customer'),('Jerry','Password534','Customer'),('John','jn879','Agent'),('kalpna212','kap345','Customer'),('karansharma','karans56','Manager'),('Katy','Password','Customer'),('kavya','Password','Customer'),('kavya95','abcd','Customer'),('komal432','kp99','Customer'),('krishna','krish49','Manager'),('kspecial','test453','Customer'),('Kyati','kt345','Agent'),('megan','mn678','Manager'),('Micheal','mc567','Customer'),('monica','Password','Customer'),('Monika','hi_all_of_you','Agent'),('Ninernation','okman34','Agent'),('octopus','Marvel123','Agent'),('Parth77','parth_myself','Agent'),('Peter','pt568','Agent'),('piku','iampku','Customer'),('pinky','omsairam','Customer'),('Pranay55','pran23','Customer'),('pratikparekh360','s3h5f7g3k2l1','Manager'),('pratsxyz','tweeny678','Customer'),('Rahul','rl386','Agent'),('ramesh123','nknal.dnsknh','Customer'),('ramsay','rm345','Customer'),('Ranger5','xyzxyz','Agent'),('Renu','omsairam','Customer'),('Robert ','rm178','Customer'),('Rowes','rs976','Customer'),('Rupeesh','rup9999','Customer'),('Saksh','hytew','Customer'),('Shafat90','Saf_567','Customer'),('shagun456','friends','Agent'),('Shakfat','sak34567','Customer'),('sharan','678@HDB','Customer'),('shashi','Password123','Customer'),('Smith','bob','Customer'),('spiderman','Password','Customer'),('Sumedh345','Sjyes','Customer'),('supriya','tysm_0987','Customer'),('Taylorbrown','tb678','Customer'),('Tom','jerry','Customer'),('Tom89','tommy','Customer'),('tonystark','Password123','Manager'),('viranchi','Password','Customer'),('viranchi67','PASSWORD','Customer'),('yad','omsairam','Customer');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!50001 DROP VIEW IF EXISTS `Bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Bill` AS SELECT 
 1 AS `Customer_name`,
 1 AS `Policy_Number`,
 1 AS `Policy_name`,
 1 AS `Start_date`,
 1 AS `due_date`,
 1 AS `premium`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Claims`
--

DROP TABLE IF EXISTS `Claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Claims` (
  `Claim_id` int(2) NOT NULL AUTO_INCREMENT,
  `Policy_Number` int(11) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Amount` double NOT NULL,
  `Approved_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`Claim_id`),
  KEY `Claims_ibfk_1` (`Policy_Number`),
  KEY `Claims_ibfk_2` (`Approved_by`),
  KEY `idx_status` (`Status`),
  CONSTRAINT `Claims_ibfk_1` FOREIGN KEY (`Policy_Number`) REFERENCES `CustomerPolicy` (`Policy_Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Claims_ibfk_2` FOREIGN KEY (`Approved_by`) REFERENCES `Employee` (`Employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Claims`
--

LOCK TABLES `Claims` WRITE;
/*!40000 ALTER TABLE `Claims` DISABLE KEYS */;
INSERT INTO `Claims` VALUES (1,90019,'approved','medical reasons',3000,5021),(2,90005,'approved','Dental fixure',8000,5020),(6,90016,'pending','Cough Syrup',50,5022),(7,90016,'pending','Fever Tablets',20,5022),(8,90017,'pending','Kidney transplant',50000,5023),(9,90017,'pending','hospital bills',20000,5024),(10,90005,'approved','Asthama attack. Emergency treatment',8000,5024),(11,90005,'pending','Ambulance fee',300,5023);
/*!40000 ALTER TABLE `Claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commission`
--

DROP TABLE IF EXISTS `Commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commission` (
  `Policy_Number` int(11) NOT NULL,
  `Employee_id` int(11) NOT NULL,
  `Commission_amount` float DEFAULT '30',
  PRIMARY KEY (`Policy_Number`),
  KEY `Commission_ibfk_2` (`Employee_id`),
  CONSTRAINT `Commission_ibfk_1` FOREIGN KEY (`Policy_Number`) REFERENCES `CustomerPolicy` (`Policy_Number`) ON DELETE NO ACTION,
  CONSTRAINT `Commission_ibfk_2` FOREIGN KEY (`Employee_id`) REFERENCES `Employee` (`Employee_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commission`
--

LOCK TABLES `Commission` WRITE;
/*!40000 ALTER TABLE `Commission` DISABLE KEYS */;
INSERT INTO `Commission` VALUES (90001,5011,30),(90003,5003,30),(90004,5003,30),(90005,5004,30),(90006,5005,30),(90007,5006,30),(90008,5001,30),(90009,5002,30),(90010,5003,30),(90011,5004,30),(90012,5005,30),(90013,5003,30),(90014,5000,30),(90015,5000,30),(90016,5001,30),(90017,5001,30),(90018,5005,30),(90019,5002,30);
/*!40000 ALTER TABLE `Commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Commission_view`
--

DROP TABLE IF EXISTS `Commission_view`;
/*!50001 DROP VIEW IF EXISTS `Commission_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Commission_view` AS SELECT 
 1 AS `Customer_fullname`,
 1 AS `Policy_Number`,
 1 AS `Agent_username`,
 1 AS `Commission_amount`,
 1 AS `Commission_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `Username` varchar(50) NOT NULL,
  `Creditcard_Number` varchar(20) NOT NULL,
  `Expiry_date` date NOT NULL,
  `Name_on_card` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('abi','3566002020360505','2019-01-01','Abhishek khurana'),('Akki','5459584639621943','2020-08-08','Akshay Shah'),('Amy','4574310405099608','2020-10-09','Amy Jackson'),('anokha','5241933385992003','2021-04-07','Anokha Sarkar'),('Black','5172719785000056','2021-05-10','Black Brown'),('Brown','4929245520128845','2022-05-12','Brown hads'),('eleven','3733718437284483','2023-10-14','eleven Gerha'),('Forum234','3530111333300000','2023-05-13','Forum Herabh'),('Ganesh567','3566002020360505','2024-12-16','Ganesh Terpla'),('Gaurav','3566002020360505','2025-09-17','Gaurav Jha'),('Gorden','5105105105105100','2025-09-15','Gorden Yersa'),('harini45','4111111111111111','2020-10-12','Harini Ramaprasad'),('harini67','4012888888881881','2021-06-13','Harini devi'),('jajs','5019717010103742','2026-07-16','jacky chen'),('Jerry','6331101999990016','2025-08-18','Jerry Perry'),('kalpna212','4503231083520283','2021-06-20','kalpna sarkar'),('katy','4916275125516222','2026-07-21','katy perry'),('kavya','4929673407819253','2023-08-19','kavya Potluri'),('kavya95','4556227192241734','2026-07-10','kavya penmetsa'),('komal432','5522417070474220','2021-06-13','komal prakash'),('kspecial','5533831605014987','2020-10-15','kspeaci ajsjsks'),('Micheal','5412360648855707','2025-12-14','Micheal Jackson'),('monica','5442695763650209','2025-12-16','monica bedi'),('piku','6011114926930564','2019-07-17','piku perry'),('pinky','6011214817263289','2020-06-19','pinky panther'),('Pranay55','6011974492484951','2020-06-19','Pranay Jain'),('pratsxyz','6011854564588733','2021-04-17','prateek jain'),('ramesh123','341813801380290','2023-05-18','ramesh gerry'),('ramsay','370882035160459','2020-10-06','ram garry'),('Renu','377547500831099','2020-10-05','Renu Prakash'),('Robert','6011974492484951','2021-09-04','Robert kerry'),('Rowes','4539009616090018','2023-10-08','Rowes Fresno'),('Rupeesh','4887704455185832','2022-11-08','Rupeesh Deepa'),('Saksh','5238801032609491','2021-12-05','Sakshi talwar'),('Shafat90','6011133813264481','2024-10-04','Shafat hwiisie'),('Shakfat','3539124462178494','2023-12-05','Shakfat twueieb'),('sharan','379762088600299','2023-04-08','Sharan thota'),('shashi','4206894179870068','2022-10-19','shashi tewar'),('Smith','4601378057023058','2021-08-19','Smith proder'),('spiderman','4352095113062620','2020-09-09','Spiderman shuei'),('Sumedh345','4956204140654561','2019-10-10','Sumedh perdha'),('supriya','4060951900042121','2024-11-11','Supriya Gerys'),('TaylorBrown','4240180011896794','2023-09-08','Taylor Brown'),('Tom','4929304782357844','2020-07-06','Tom barbar'),('Tom89','4677623791230783','2019-10-07','Tom perry'),('viranchi','4556998823441734','2025-11-07','viranchi despande'),('viranchi67','5508061008549261','2022-12-09','viranchi desapande'),('yad','5352982736647746','2020-10-08','yadgiri gutta');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerAgent`
--

DROP TABLE IF EXISTS `CustomerAgent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerAgent` (
  `Customer_username` varchar(30) NOT NULL,
  `Agent_employee_id` int(11) NOT NULL,
  PRIMARY KEY (`Customer_username`,`Agent_employee_id`),
  KEY `agent_FK` (`Agent_employee_id`),
  CONSTRAINT `CustomerAgent_ibfk_1` FOREIGN KEY (`Customer_username`) REFERENCES `Customer` (`Username`),
  CONSTRAINT `agent_FK` FOREIGN KEY (`Agent_employee_id`) REFERENCES `Employee` (`Employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerAgent`
--

LOCK TABLES `CustomerAgent` WRITE;
/*!40000 ALTER TABLE `CustomerAgent` DISABLE KEYS */;
INSERT INTO `CustomerAgent` VALUES ('Akki',5000),('komal432',5000),('kspecial',5000),('Amy',5001),('Gaurav',5001),('Micheal',5001),('monica',5001),('Black',5002),('Gorden',5002),('Pranay55',5002),('Shafat90',5002),('anokha',5003),('Brown',5003),('Jerry',5003),('kavya',5003),('pratsxyz',5003),('eleven',5004),('kalpna212',5004),('ramesh123',5004),('Forum234',5005),('katy',5005),('ramsay',5005),('Robert',5005),('Ganesh567',5006),('Rowes',5006),('Rupeesh',5007),('Saksh',5008),('Shakfat',5009),('sharan',5010),('Tom',5010),('shashi',5011),('viranchi',5011),('Smith',5012),('supriya',5012),('TaylorBrown',5012),('spiderman',5013),('Sumedh345',5013);
/*!40000 ALTER TABLE `CustomerAgent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerPolicy`
--

DROP TABLE IF EXISTS `CustomerPolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerPolicy` (
  `Customer_username` varchar(30) NOT NULL,
  `Policy_id` int(11) NOT NULL,
  `Policy_Number` int(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Policy_Number`),
  KEY `customerPolicyKey_idx` (`Policy_id`),
  KEY `customerFK_idx` (`Customer_username`),
  CONSTRAINT `customerFK` FOREIGN KEY (`Customer_username`) REFERENCES `Customer` (`Username`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `policyFK` FOREIGN KEY (`Policy_id`) REFERENCES `Policy` (`Policy_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerPolicy`
--

LOCK TABLES `CustomerPolicy` WRITE;
/*!40000 ALTER TABLE `CustomerPolicy` DISABLE KEYS */;
INSERT INTO `CustomerPolicy` VALUES ('viranchi',16,90001),('Brown',14,90003),('Brown',15,90004),('eleven',1,90005),('Forum234',15,90006),('Ganesh567',1,90007),('Gaurav',6,90008),('Gorden',6,90009),('Jerry',15,90010),('kalpna212',1,90011),('katy',15,90012),('kavya',1,90013),('komal432',15,90014),('kspecial',1,90015),('Micheal',15,90016),('monica',1,90017),('Robert',3,90018),('Black',1,90019),('harini45',2,90107);
/*!40000 ALTER TABLE `CustomerPolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerPolicyDetails`
--

DROP TABLE IF EXISTS `CustomerPolicyDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerPolicyDetails` (
  `Policy_Number` int(11) NOT NULL,
  `Purchase_date` date NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `Current_bill_amount` float DEFAULT NULL,
  PRIMARY KEY (`Policy_Number`),
  CONSTRAINT `CustomerPolicyDetails_ibfk_1` FOREIGN KEY (`Policy_Number`) REFERENCES `CustomerPolicy` (`Policy_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerPolicyDetails`
--

LOCK TABLES `CustomerPolicyDetails` WRITE;
/*!40000 ALTER TABLE `CustomerPolicyDetails` DISABLE KEYS */;
INSERT INTO `CustomerPolicyDetails` VALUES (90001,'2017-01-09','2018-01-01','2028-01-01','2018-12-15',60),(90003,'2013-12-12','2014-02-13','2034-02-13','2018-12-14',135),(90004,'2010-08-13','2010-08-15','2015-08-15','2018-12-14',135),(90005,'2018-01-10','2018-04-13','2028-04-13','2018-12-14',135),(90006,'2016-09-17','2017-05-23','2027-05-23','2018-12-14',135),(90007,'2011-07-21','2011-10-10','2021-10-10','2018-12-14',135),(90008,'2018-02-02','2018-03-02','2033-03-02','2018-12-14',135),(90009,'2016-01-31','2016-01-31','2021-01-31','2018-12-14',135),(90010,'2014-06-01','2014-08-09','2024-08-09','2018-12-20',10),(90011,'2017-07-30','2017-08-10','2027-08-10','2018-12-14',135),(90012,'2015-06-25','2015-08-20','2025-08-20','2018-12-14',135),(90013,'2012-07-12','2013-01-16','2023-01-02','2018-12-14',135),(90014,'2014-12-15','2014-12-29','2019-12-29','2018-12-14',135),(90015,'2013-05-23','2013-05-30','2023-05-23','2018-12-14',135),(90016,'2018-09-09','2018-10-09','2038-10-09','2018-12-14',135),(90017,'2017-10-02','2017-12-01','2027-12-01','2018-12-14',135),(90018,'2017-09-23','2017-09-23','2030-09-23','2018-12-14',135),(90019,'2018-12-02','2018-12-02','2033-12-02','2019-01-01',30),(90107,'2018-12-02','2018-12-02','2023-12-02','2019-01-01',80);
/*!40000 ALTER TABLE `CustomerPolicyDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Customer_Claims_View`
--

DROP TABLE IF EXISTS `Customer_Claims_View`;
/*!50001 DROP VIEW IF EXISTS `Customer_Claims_View`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Customer_Claims_View` AS SELECT 
 1 AS `Customer_username`,
 1 AS `First_name`,
 1 AS `Last_name`,
 1 AS `Claim_id`,
 1 AS `Policy_Number`,
 1 AS `Policy_name`,
 1 AS `Status`,
 1 AS `Amount`,
 1 AS `Manager_username`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Customer_Transactions_View`
--

DROP TABLE IF EXISTS `Customer_Transactions_View`;
/*!50001 DROP VIEW IF EXISTS `Customer_Transactions_View`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Customer_Transactions_View` AS SELECT 
 1 AS `Customer_username`,
 1 AS `Policy_id`,
 1 AS `Policy_name`,
 1 AS `Policy_Number`,
 1 AS `Transaction_id`,
 1 AS `Amount`,
 1 AS `Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `Employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `Designation` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Employee_id`),
  KEY `Username` (`Username`),
  KEY `Manager_id` (`Manager_id`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`),
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`Manager_id`) REFERENCES `Employee` (`Employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5026 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (5000,'Agent','brucewayne',5025),(5001,'Agent','Charles',5025),(5002,'Agent','Dushant',5025),(5003,'Agent','Erika',5025),(5004,'Agent','harrypotter',5024),(5005,'Agent','John',5024),(5006,'Agent','Kyati ',5024),(5007,'Agent','Monika',5024),(5008,'Agent','Ninernation',5020),(5009,'Agent','octopus',5020),(5010,'Agent','Parth77',5020),(5011,'Agent','Peter',5020),(5012,'Agent','Rahul',5018),(5013,'Agent','Ranger5',5018),(5014,'Agent','shagun456',5018),(5018,'Manager','Dipesh',NULL),(5019,'Manager','Guptasir',NULL),(5020,'Manager','Harini',NULL),(5021,'Manager','Harish',NULL),(5022,'Manager','karansharma',NULL),(5023,'Manager','megan',NULL),(5024,'Manager','pratikparekh360',NULL),(5025,'Manager','tonystark',NULL);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policy`
--

DROP TABLE IF EXISTS `Policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Policy` (
  `Policy_id` int(11) NOT NULL AUTO_INCREMENT,
  `Policy_name` varchar(30) NOT NULL,
  `Description` text,
  `Premium` float NOT NULL,
  `Coverage` float NOT NULL,
  `Years` int(11) NOT NULL,
  `Policy_type` varchar(30) NOT NULL,
  PRIMARY KEY (`Policy_id`),
  KEY `idx_policy_name` (`Policy_name`),
  KEY `idx_policy_type` (`Policy_type`),
  KEY `idx_coverage` (`Coverage`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policy`
--

LOCK TABLES `Policy` WRITE;
/*!40000 ALTER TABLE `Policy` DISABLE KEYS */;
INSERT INTO `Policy` VALUES (1,'Jeevan anand','policy which covers lifetime endorsement',100,15000,15,'life_insurance'),(2,'money_back','policy which returns the sum in finite intervals',80,6000,5,'life_insurance'),(3,'jeevan raksha','returns the sum oaid after insured death',90,7000,10,'life_insurance'),(4,'honda raksha','returns amount paid when there is a damage to the vechile',100,5000,2,'vechile_insurance'),(5,'save ducati','pays the insured sum when bike is damaged',40,1500,2,'vechile_insurance'),(6,'live longer','pays the insured sum when health condition of the insured person worsens',70,2000,8,'heath_insurance'),(7,'save lives','pays for the hospitality need of the individual',50,5000,6,'health_insurance'),(8,'life saver','pays the insured sum for surgery',60,6000,9,'health_insurance'),(9,'children saver','pays for raising the children',40,6000,8,'life_insurance'),(10,'retirement_plan','pays for one\'s living after retirement',80,7000,10,'life_insurance'),(11,'pay_back','pays extra sum along with interest',60,8000,6,'money_back insurance'),(12,'whole life saver','pays the sum needed for whole life',30,4000,25,'life_insurance'),(13,'family_plan','pays the amount for the whole family',40,5000,20,'life_insurance'),(14,'annuity_pan','pays back annualy',200,1000,30,'life_insurance'),(15,'endowment paln',NULL,10,8000,10,'life_insurance'),(16,'life_insurance','pays for the living',60,6000,30,'life_insurance');
/*!40000 ALTER TABLE `Policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Policy_cus_agent`
--

DROP TABLE IF EXISTS `Policy_cus_agent`;
/*!50001 DROP VIEW IF EXISTS `Policy_cus_agent`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Policy_cus_agent` AS SELECT 
 1 AS `Customer_username`,
 1 AS `Policy_id`,
 1 AS `Policy_Number`,
 1 AS `Agent_employee_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transactions` (
  `Transaction_id` int(2) NOT NULL AUTO_INCREMENT,
  `Policy_Number` int(11) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Amount` double NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Transaction_id`),
  KEY `Transactions_ibfk_1_idx` (`Policy_Number`),
  KEY `idx_date` (`Date`),
  CONSTRAINT `Transactions_ibfk_1` FOREIGN KEY (`Policy_Number`) REFERENCES `CustomerPolicy` (`Policy_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (2,90008,'premium payment',300,'2018-09-12'),(3,90007,'deposit',2000,'2011-11-12'),(5,90010,'premium payment ',200,'2014-07-01'),(6,90019,'two months premium payment',200,'2018-08-08'),(8,90008,'premium payment',600,'2018-11-12'),(9,90019,'premium payment',100,'2018-07-01'),(10,90012,'deposit + premium payment',1100,'2015-08-21'),(11,90014,'late payment charges',100,'2015-02-12'),(12,90016,'premium payment',200,'2018-10-14'),(13,90008,'premium payment',300,'2018-11-12'),(14,90016,'premium payment',400,'2018-12-15'),(15,90019,'deposit',1000,'2016-07-07'),(16,90003,'deposit',3000,'2014-03-07'),(17,90004,'deposit+ three premium payment',2000,'2010-12-20'),(18,90005,'premium payment ',80,'2018-05-28'),(19,90011,'deposit',400,'2017-11-11'),(20,90007,'deposit+payment premium+late charge',900,'2011-12-10'),(21,90006,'premiumpayment',500,'2016-12-02'),(22,90009,'deposit+five month payment',5000,'2016-07-17'),(23,90013,'premium payment',300,'2014-04-30'),(24,90015,'deposit',600,'2013-12-12'),(25,90017,'deposit+premium paymnet',900,'2018-02-03'),(26,90018,'deposit',1000,'2017-09-30'),(27,90001,'deposit',1000,'2017-12-11'),(28,90015,'premium payment',100,'2018-12-01'),(29,90001,'Testing Premium',30,'2018-12-02'),(31,90001,'Test 2',93,'2018-12-02'),(32,90001,'Test3',123,'2018-12-02');
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pratikparekh217`@`%`*/ /*!50003 TRIGGER SetTotalToZero 
    AFTER insert ON Transactions
    FOR EACH ROW 
BEGIN
     update CustomerPolicyDetails c
	 SET Current_bill_amount = 0
     where c.Policy_Number = new.Policy_Number;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `Transactions_View`
--

DROP TABLE IF EXISTS `Transactions_View`;
/*!50001 DROP VIEW IF EXISTS `Transactions_View`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Transactions_View` AS SELECT 
 1 AS `Fullname`,
 1 AS `Policy_id`,
 1 AS `Transaction_id`,
 1 AS `Amount`,
 1 AS `Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `User_personal_details`
--

DROP TABLE IF EXISTS `User_personal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_personal_details` (
  `Username` varchar(50) NOT NULL,
  `First_name` varchar(30) NOT NULL,
  `Last_name` varchar(30) NOT NULL,
  `Email_id` varchar(50) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Phone_no1` varchar(20) NOT NULL,
  `Phone_no2` varchar(20) DEFAULT NULL,
  `Address_line1` varchar(100) NOT NULL,
  `Address_line2` varchar(100) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `Zip_code` varchar(30) NOT NULL,
  PRIMARY KEY (`Username`),
  KEY `idx_name` (`Last_name`,`First_name`),
  KEY `idx_zipcode` (`City`),
  CONSTRAINT `User_personal_details_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_personal_details`
--

LOCK TABLES `User_personal_details` WRITE;
/*!40000 ALTER TABLE `User_personal_details` DISABLE KEYS */;
INSERT INTO `User_personal_details` VALUES ('abi','abinanya','vaidhi','abi@gmail.com','1980-04-10','2345578907','2345678907','UT Drive','','charlotte','nc','23456'),('Akki','Akshay','Ayyinchira','aayyinchira@gmail.com','1987-05-10','3627289823','4568729291','23 tryon street','','charlotte','North Carolina','28672'),('Amy','Amy','Jackson','ajackson@gmail.com','1975-05-10','7627929903','9803732839','Tom Hunter',NULL,'Charlotte','North Carolina','28262'),('anokha','anokha','charles','anokha@gmail.com','1987-05-11','235346547567','346356547457','UT','','CHARLOTTE','NC','2454365'),('Black','David','Black','dablack@gmail.com','1789-08-17','3882919927','2829292923','barton creek dr','','frisco','Texas','209213'),('Brown','bobby','brown','bbrown@gmail.com','1970-08-14','7046579909','8493031223','tryon street','city center','charlotte','North Carolina','28456'),('brucewayne','Bruce','Wayne','bruce34@yahoo.com','1980-08-09','+13248765466','+18763459876','University Drive',NULL,'Charlotte','NC','28263'),('Charles','Charles','James','charlesj@yahoo.com','1989-06-12','+19872345674',NULL,'Times Square','50th Street','New York ','New York','14568'),('Dipesh','Dipesh','Rajkumar','Dipesh23@gmail.com','1968-10-06','+19872345432',NULL,'Barton Creek Drive ',NULL,'Charlotte','NC','28262'),('Dushant','Dushant','Singh','dsingh@gamil.com','1970-09-20','+19873456757',NULL,'Colonial Grand',NULL,'Charlotte','NC','28262'),('eleven','john','eleven','jeleven11@gmail.com','1997-05-30','4949403022','4949493030','kittansett dr','ashford green','charlotte','North Carolina','28262'),('Erika','Erika','Fernandes','erikafernan@gmail.com','1980-07-23','+17645398734','+18764563423','University North',NULL,'Charlotte','NC','28263'),('Forum234','suresh','raina','sraina@gmail.com','1945-08-15','7829292202','7829818282','east dr',NULL,'miami','Florida','34545'),('Ganesh567','ganesh','vigneshan','gv5747@gmail.com','1987-07-10','6789392373','6783939229','freeking place',NULL,'cleveland','ohio','28456'),('Gaurav','Jia','Gaurav','jiagau383@gmail.com','1967-08-14','3838392923','4828292349','john dr',NULL,'New York','New York','45678'),('Gorden','george','gordan','ggordan67@gmail.com','1983-08-15','4566383939','9393932238','Rocky mountains',NULL,'Charlotte','North Carolina','28283'),('Guptasir','Gupta','Raichura','gup456@gmail.com','1976-08-06','+19865764322',NULL,'Ashford Green ','512D','Charlotte','NC','28263'),('Harini','Harini','Ramaprasad','harini@uncc.edu','1956-07-20','+11237657899',NULL,'Concord',NULL,'Charlotte','NC','28254'),('harini45','harini','ramaprasad','HARINI@GMAIL.COM','1985-05-04','23456789','','UT DRIVE','','charlotte','NC','23456'),('harini67','harini','ramaprasad','HARINI@GMAIL.COM','1985-05-04','23456789','','UT DRIVE','','charlotte','NC','23456'),('Harish','Harish','Sharma','hary34@yahoo.com','1975-09-30','+917460987654',NULL,'Bayridge',NULL,'New York','New York','176543'),('harrypotter','Harry','Potter','harrypotter23@yahoo.com','1956-11-20','+18763452347',NULL,'Times Square','23rd Strret','New York ','New York','19876'),('jajs','jsjs','usie','kavya95p@gmail.com','1980-09-08','7047059902','','Barton Creek Dr','','Charlotte','North Carolina','28262'),('Jerry','Sam','jerry','sjerry@gmail.com','1995-10-14','2839393221','3738392298','UNCCharlotte','JW Clay','Hyderabad','Telangana','28262'),('John','John','Trump','john45@yahoo.com','1960-06-30','+18730987643',NULL,'Dixon Road','76th Street','Dallas','Texas','76534'),('kalpna212','kalpana','chawla','kchawla23@gmail.com','1980-07-10','6727292281','2828292929','Rocket center',NULL,'San Francisco','California','28929'),('karansharma','Karan','Sharma','karan234@gmail.com','1970-08-12','+14359867689',NULL,'Wilson street',NULL,'Boston','Massachusetts','765890'),('katy','katy','perry','kperry@gmail.com','1986-07-08','7889076655','7899988766','westin hotel',NULL,'salisbury','North Carolina','28938'),('kavya','kavya','potluri','kpotluri@gmail.com','1995-10-14','7039382828','3939393929','greek dr',NULL,'charlotte','North Carolina','28262'),('kavya95','kavya','p','kavya@gmail.com','1995-08-14','2345678906','2345678907','ashford','','cahrlotte','NC','282633'),('komal432','komal','patnaik','kpatnaik@gmail.com','1987-08-18','9383929283','2288338382','eastern street',NULL,'Charlotte','North Carolina','32727'),('kspecial','kesav','singh','kesingh@gmail.com','1978-09-13','7802029283','8282838292','United Street',NULL,'kansas City','Kansas','35389'),('Kyati ','Kyati','Patel','kyapatel34gmail.com','1980-06-14','+917642345643','+19867543453','Ashford Green ','Barton Creek Drive ','Charlotte','NC ','28262'),('megan','Megan','Johnson','megjonhson@yahoo.com','1986-07-28','+1278972987',NULL,'Atkins Road',NULL,'Boston','Massachusetts','789654'),('Micheal','Micheal','wegh','miwegh@gmail.com','1893-07-18','3833923939','3738828383','Belle gate',NULL,'Cary','North Carolina','26474'),('monica','monica','yewky','myewky@gmail.com','1980-05-10','7383839383','3939399030','Wenky Gate',NULL,'Raleigh','North Carolina','24569'),('Monika','Monika','Bedi','monbedi@gmail.com','1987-09-20','+16542342341','+19874532879','CG','321D','Charlotte','NC','28262'),('Ninernation','Nathan','Jones','nathon@yahoo.com','1980-10-06','+187654321',NULL,'UT','524A','New York','New York','75645'),('octopus','Angel','Cheng','angel@gmail.com','1967-06-04','+18769872345',NULL,'34th Street','winston Road','Boston','Massachusetts','12345'),('Parth77','Parth ','Patel','parth78@yahoo.com','1987-05-05','+19879879870',NULL,'Palace Road',NULL,'Dallas','Texas ','98709'),('Peter','Peter','Parker','parker34@yahoo.com','1990-06-07','+16543896732',NULL,'9th Strret ','NYU','New York','New York','12435'),('piku','piku','ponk','piku@gmail.com','1980-09-08','7097089906','','barton creek dr','','Miami','Florida','38398'),('pinky','pinky','ponky','pinky@gmail.com','1980-09-08','7097089906','','barton creek dr','','Miami','Florida','38398'),('Pranay55','Pranay','rocky','yejacky@gmail.com','1921-08-18','2929293939','2822992929','Ricky Dr',NULL,'Greensboro','North Carolina','38398'),('pratikparekh360','Pratik','Parekh','pratikparekh456@gmail,com','1980-08-10','+17049573530',NULL,'Brooklyn',NULL,'New York','New York','124356'),('pratsxyz','prateek','parekh','pparekh@gmail.com','1938-09-17','7382929283','9383929283','Bill Gate',NULL,'Albany','New York','28398'),('Rahul','Rahul ','Parekh','Rahul987@gmail.com','2000-06-15','+18768765432','+9187645323456','44th Stret','Concord','Charlotte','NC','28269'),('ramesh123','ramesh','rao','rarao@gmail.co','1983-06-09','8383839298','8282828282','Tweety Dr',NULL,'Houston','Texas','34567'),('ramsay','Ram','Polo','rampolo45@gmail.com','1984-09-06','39392292929','3982737228','Vicky Dr',NULL,'Salt Lake City','Utah','38383'),('Ranger5','Kamal','Khan','kamalk@yahoo.com','1990-12-21','+198723456734',NULL,'Davidson Road',NULL,'Boston ','Massachusetts','98734'),('Renu','Renu','Sharma','kavya95p@gmail.com','1997-10-18','7047059902','','Barton Creek Dr','','Charlotte','North Carolina','28262'),('Robert','Robert','Tinker','Rotinker@gmail.com','1990-08-18','76960050549','8292911029','Harry Dr',NULL,'East Bay','California','82898'),('Rowes','Rowes','Son','roson@gmail.com','1998-09-01','81819299290','2828292929','Sky Park',NULL,'Salisbury','North Carolina','28224'),('Rupeesh','Rupeesh','Tillu','Transj@gmail.com','1994-03-10','82829292929','9282929292','Green Gate',NULL,'balitmore','Maryland','28298'),('Saksh','Sakshi','Dhoni','sadhoni@gmail.com','1993-09-08','82929292928','9292929299','Freaky House',NULL,'Atlanta','Georgia','27272'),('Shafat90','shafat','singh','shasingh@gmail.com','1929-09-19','89292929199','9882829298','Troy Street',NULL,'Miami','Florida','28298'),('shagun456','Shagun','Sharma','shag@gmail.com','1970-06-24','+19872346574','+9187698765423','Concord',NULL,'Charlotte','NC','28261'),('Shakfat','Shakfat','Sharma','shsharma@gmail.com','1987-09-16','82829292929','9882929292','Tesa Dr',NULL,'Austin','Texas','33887'),('sharan','sharan','Deepali','shadeepali@gmail.com','1892-07-03','82828292986','7882929829','Yester Street',NULL,'Baltimore','Maryland','29392'),('shashi','shashi','feroz','shahej@gmail.com','1996-08-09','92828298289','2828282929','Ricky Gate',NULL,'Atlanta','Georgia','34525'),('Smith','Smith','Richie','smithrichie@gmail.com','1994-09-10','7728289992','7790282892','Tony Street',NULL,'Charlotte','South Carolina','35378'),('spiderman','garry','ras','garry3@gmail.com','1898-09-19','1828293489','3489789912','mccullogh','university city blvd','charlotte','North Carolina','28713'),('Sumedh345','Sumedh','Patil','supatil@gmail.com','1991-03-10','1929292920','2728282292','Johny Gate',NULL,'Greensboro','North Carolina','36378'),('supriya','supriya','sharma','susharma@gmail.com','1990-09-17','7383292992','2828292929','Barton Gate',NULL,'Richmond','Virgina','35464'),('TaylorBrown','Taylor','Brown','tbrown45@gmail.com','1928-08-10','2829292939','2929292983','yush dr',NULL,'Atlanta','Georgia','62654'),('Tom','Tommy','Jerry','tojerry@gmail.com','1978-09-19','3738382939','6373738388','Red Cross Street',NULL,'Baltimore','Maryland','36463'),('Tom89','Tommy','Jerry','tojerry@gmail.com','1978-09-19','3738382939','6373738388','Red Cross Street',NULL,'Kansas City','Kansas','46463'),('tonystark','Tony','Stark','tony22@gmail.com','1996-10-13','+18763452343',NULL,'Washington street',NULL,'Dallas','Texas','345345'),('viranchi','viranchi','despande','videspande@gmail.com','1990-05-03','6373738389','7373838838','TimTon Street',NULL,'Kansas City','Kansas','46463'),('viranchi67','Viranchi','deshpande','VIRANCHI@GMAIL.COM','1994-04-01','234567789','','UT ','','CHARLOTTE','NC','234567'),('yad','yadagiri','yesw','kavya95p@gmail.com','1980-09-08','7047059902','','Barton Creek Dr','','Charlotte','North Carolina','28262');
/*!40000 ALTER TABLE `User_personal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Insurance_Management'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `BILLUPDATER` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'UTC' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`pratikparekh217`@`%`*/ /*!50106 EVENT `BILLUPDATER` ON SCHEDULE EVERY 1 DAY STARTS '2018-12-03 00:27:08' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
		
            -- Get count of rows in customer policy details
			DECLARE numberOfPolicies INT;
            DECLARE counter INT;
            DECLARE total INT;
			DECLARE due_date DATETIME;
            DECLARE aaj DATETIME;
            DECLARE premium INT;
            DECLARE policy_number INT;
            
            DECLARE somethingToDelete INT;
            
            SET aaj = NOW();
            
            SET counter = 0;
            
          SELECT COUNT(*) INTO numberOfPolicies FROM CustomerPolicyDetails;
            WHILE counter < numberOfPolicies DO

					Select  cp.Policy_Number, cp.due_date, p.premium ,cp.Current_bill_amount INTO policy_number, due_date, premium, total
 					from Policy p inner join CustomerPolicy c using (Policy_id) inner join CustomerPolicyDetails cp
 					using (Policy_Number) order by Policy_Number
					LIMIT counter,1;
                    
                IF(aaj > due_date) THEN 
					IF total = 0 THEN 
						SET total = premium;
                        SET due_date = DATE_ADD(due_date, INTERVAL 30 DAY); 
					ELSE
						SET total = total + premium + (0.05 * premium);
                        SET due_date = DATE_ADD(due_date, INTERVAL 30 DAY); 
					END IF;
                    
                    CALL UpdateBill(total,due_date,policy_number);
                    
				END IF;
                
                SET counter = counter + 1;
                
            END WHILE;
            
            END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'Insurance_Management'
--
/*!50003 DROP FUNCTION IF EXISTS `GetPolicyMaturity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pratikparekh217`@`%` FUNCTION `GetPolicyMaturity`(policy_id INT) RETURNS int(11)
BEGIN
		
		DECLARE yearsToMature_out INT;
      -- Fetching the Policy details to calculate policy details
		SELECT Policy.Years INTO yearsToMature_out
        FROM Policy
        WHERE Policy.Policy_id = policy_id;
 
		RETURN (yearsToMature_out);
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetPolicyNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pratikparekh217`@`%` FUNCTION `GetPolicyNumber`(username VARCHAR(30), policy_id INT) RETURNS int(11)
BEGIN
	DECLARE policyNumber INT;
        -- Select policynumber that is newly generated
        SELECT CustomerPolicy.Policy_Number 
        INTO policyNumber
        FROM CustomerPolicy
        WHERE CustomerPolicy.Policy_id = policy_id AND CustomerPolicy.Customer_username = username;
 
 RETURN (policyNumber);
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetPolicyPremium` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pratikparekh217`@`%` FUNCTION `GetPolicyPremium`(policy_id INT) RETURNS float
BEGIN
		DECLARE premium_out FLOAT;
      -- Fetching the Policy details to calculate policy details
		SELECT Policy.Premium INTO premium_out
        FROM Policy
        WHERE Policy.Policy_id = policy_id;
        
        RETURN (premium_out);

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuyPolicy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pratikparekh217`@`%` PROCEDURE `BuyPolicy`(IN username VARCHAR(30), IN policy_id INT)
BEGIN
		-- Global variable declarations
		DECLARE premium FLOAT;
        DECLARE yearsToMature INT;
        DECLARE policy_number INT;
        
		-- Insert Values in customer policy
		INSERT INTO CustomerPolicy (`Customer_username`, `Policy_id`) VALUES (username, policy_id);
        
        -- Select policynumber that is newly generated
        SET policy_number =  GetPolicyNumber(username, policy_id);
		SET premium = GetPolicyPremium(policy_id);
        SET yearsToMature = GetPolicyMaturity(policy_id);

		
        
        -- Adding new entry in CustomerPolicyDetails
        INSERT INTO CustomerPolicyDetails Values(policy_number, NOW(),NOW(), DATE_ADD(NOW(), INTERVAL yearsToMature YEAR) ,DATE_ADD(NOW(), INTERVAL 30 DAY), premium);
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Commission_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pratikparekh217`@`%` PROCEDURE `Commission_details`(IN username varchar(50))
BEGIN
Select Customer_fullname, Policy_Number, Commission_amount, Commission_date 
 from Commission_view where Agent_username=username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMyTransactions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pratikparekh217`@`%` PROCEDURE `GetMyTransactions`(IN username varchar(50))
BEGIN
Select Policy_Number, Policy_id, Policy_name, Amount as Transaction_amount, date as
Transaction_date from Customer_Transactions_View C where C.Customer_username=username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ShowMyClaims` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pratikparekh217`@`%` PROCEDURE `ShowMyClaims`(IN Username varchar(11))
BEGIN
SELECT * FROM Customer_Claims_View where Customer_username = Username ;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pratikparekh217`@`%` PROCEDURE `UpdateBill`(IN total_param FLOAT, IN due_date_param DATE, IN policy_number_param INT)
BEGIN
		UPDATE CustomerPolicyDetails
		SET due_date = due_date_param,
				Current_bill_amount = total_param
		WHERE
							Policy_Number = policy_number_param;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `Bill`
--

/*!50001 DROP VIEW IF EXISTS `Bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pratikparekh217`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Bill` AS select `c`.`Customer_username` AS `Customer_name`,`cp`.`Policy_Number` AS `Policy_Number`,`p`.`Policy_name` AS `Policy_name`,`cp`.`Start_date` AS `Start_date`,`cp`.`due_date` AS `due_date`,`p`.`Premium` AS `premium`,`cp`.`Current_bill_amount` AS `total` from ((`Policy` `p` join `CustomerPolicy` `c` on((`p`.`Policy_id` = `c`.`Policy_id`))) join `CustomerPolicyDetails` `cp` on((`c`.`Policy_Number` = `cp`.`Policy_Number`))) order by `cp`.`Policy_Number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Commission_view`
--

/*!50001 DROP VIEW IF EXISTS `Commission_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pratikparekh217`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Commission_view` AS select concat(`u`.`First_name`,' ',`u`.`Last_name`) AS `Customer_fullname`,`cpd`.`Policy_Number` AS `Policy_Number`,`e`.`Username` AS `Agent_username`,`c`.`Commission_amount` AS `Commission_amount`,`cpd`.`Start_date` AS `Commission_date` from ((((`CustomerPolicyDetails` `cpd` join `Commission` `c` on((`c`.`Policy_Number` = `cpd`.`Policy_Number`))) join `CustomerPolicy` `cp` on((`cp`.`Policy_Number` = `cpd`.`Policy_Number`))) join `Employee` `e` on((`c`.`Employee_id` = `e`.`Employee_id`))) join `User_personal_details` `u` on((`u`.`Username` = `cp`.`Customer_username`))) order by concat(`u`.`First_name`,' ',`u`.`Last_name`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Customer_Claims_View`
--

/*!50001 DROP VIEW IF EXISTS `Customer_Claims_View`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pratikparekh217`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Customer_Claims_View` AS select `cp`.`Customer_username` AS `Customer_username`,`u`.`First_name` AS `First_name`,`u`.`Last_name` AS `Last_name`,`c`.`Claim_id` AS `Claim_id`,`c`.`Policy_Number` AS `Policy_Number`,`p`.`Policy_name` AS `Policy_name`,`c`.`Status` AS `Status`,`c`.`Amount` AS `Amount`,`e`.`Username` AS `Manager_username` from ((((`Claims` `c` join `Employee` `e`) join `CustomerPolicy` `cp`) join `User_personal_details` `u` on((`u`.`Username` = `cp`.`Customer_username`))) join `Policy` `p` on((`p`.`Policy_id` = `cp`.`Policy_id`))) where ((`c`.`Approved_by` = `e`.`Employee_id`) and (`c`.`Policy_Number` = `cp`.`Policy_Number`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Customer_Transactions_View`
--

/*!50001 DROP VIEW IF EXISTS `Customer_Transactions_View`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pratikparekh217`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Customer_Transactions_View` AS select `cp`.`Customer_username` AS `Customer_username`,`cp`.`Policy_id` AS `Policy_id`,`p`.`Policy_name` AS `Policy_name`,`cp`.`Policy_Number` AS `Policy_Number`,`t`.`Transaction_id` AS `Transaction_id`,`t`.`Amount` AS `Amount`,`t`.`Date` AS `Date` from ((`Transactions` `t` join `CustomerPolicy` `cp` on((`t`.`Policy_Number` = `cp`.`Policy_Number`))) join `Policy` `p` on((`p`.`Policy_id` = `cp`.`Policy_id`))) order by `cp`.`Customer_username` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Policy_cus_agent`
--

/*!50001 DROP VIEW IF EXISTS `Policy_cus_agent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pratikparekh217`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Policy_cus_agent` AS select `cp`.`Customer_username` AS `Customer_username`,`cp`.`Policy_id` AS `Policy_id`,`cp`.`Policy_Number` AS `Policy_Number`,`ca`.`Agent_employee_id` AS `Agent_employee_id` from (`CustomerPolicy` `cp` join `CustomerAgent` `ca` on((`cp`.`Customer_username` = `ca`.`Customer_username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Transactions_View`
--

/*!50001 DROP VIEW IF EXISTS `Transactions_View`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pratikparekh217`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Transactions_View` AS select concat(`u`.`First_name`,' ',`u`.`Last_name`) AS `Fullname`,`cp`.`Policy_id` AS `Policy_id`,`t`.`Transaction_id` AS `Transaction_id`,`t`.`Amount` AS `Amount`,`t`.`Date` AS `Date` from ((`Transactions` `t` join `CustomerPolicy` `cp` on((`t`.`Policy_Number` = `cp`.`Policy_Number`))) join `User_personal_details` `u` on((`u`.`Username` = `cp`.`Customer_username`))) order by concat(`u`.`First_name`,' ',`u`.`Last_name`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02 22:45:48
