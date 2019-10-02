-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                           PostgreSQL
--                        (8/9/2012 9:17:05)
-- -----------------------------------------------------------------------------
--      Nom de la base : domainelespins
--      Projet : 
--      Date de dernière modification : 8/9/2019 9:14:39
-- -----------------------------------------------------------------------------

-- drop database dlp ;
-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

-- CREATE DATABASE domainelespins;

-- \c domainelespins;
\c dlp

-- -----------------------------------------------------------------------------
--       TABLE : client
-- -----------------------------------------------------------------------------

CREATE TABLE client
   (
    num_client int4 NOT NULL  ,
    nom_client varchar(50) NULL  ,
    prenom_client varchar(50) NULL  ,
    adresse_client varchar(200) NULL  ,
    code_postal_client char(5) NULL  ,
    ville_client varchar(50) NULL  ,
    nb_personnes int2 NULL  ,
    duree_location int2 NULL  ,
    date_courrier date NULL ,
    accompte_verse  decimal(10,0) default 0,
    num_emplacement int4 NOT NULL  ,
    num_semaine_arrivee int4 NOT NULL  ,	
   CONSTRAINT PK_client PRIMARY KEY (num_client)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE client
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_client_emplacement
     ON client (num_emplacement)
    ;


-- -----------------------------------------------------------------------------
--       TABLE : emplacement
-- -----------------------------------------------------------------------------

CREATE TABLE emplacement
   (
    num_emplacement int4 NOT NULL  ,
    nom_emplacement char(4) NULL  ,
    type_emplacement varchar(50) NULL  ,
    capacite_emplacement int2 NULL  ,
    prix_emplacement int4 NULL  
,   CONSTRAINT PK_emplacement PRIMARY KEY (num_emplacement)
   );


-- -----------------------------------------------------------------------------
--       TABLE : determine
-- -----------------------------------------------------------------------------

CREATE TABLE determine
   (
    num_semaine int4 NOT NULL  ,
    num_emplacement int4 NOT NULL  ,
    etat_emplacement char(1) NULL  
,   CONSTRAINT PK_determine PRIMARY KEY (num_semaine, num_emplacement)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE determine
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_determine_SEMAINE
     ON determine (num_semaine)
    ;

CREATE  INDEX I_FK_determine_emplacement
     ON determine (num_emplacement)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE client ADD 
     CONSTRAINT FK_client_emplacement
          FOREIGN KEY (num_emplacement)
               REFERENCES emplacement (num_emplacement);



ALTER TABLE determine ADD 
     CONSTRAINT FK_determine_emplacement
          FOREIGN KEY (num_emplacement)
               REFERENCES emplacement (num_emplacement);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
--               PEUPLEMENT DE LA BASE -
-- -----------------------------------------------------------------------------


INSERT INTO emplacement VALUES (1,'A01','Appartement',4,500),(2,'A02','Appartement',4,500),(3,'A03','Appartement',4,500),(4,'A04','Appartement',4,500),(5,'A05','Appartement',4,500),(6,'A06','Appartement',8,900),(7,'A07','Appartement',8,900),(8,'A08','Appartement',6,700),(9,'A09','Appartement',6,700),(10,'A010','Appartement',6,700),(11,'A011','Appartement',6,700),(12,'A012','Appartement',6,700),(13,'A013','Appartement',6,700),(14,'A014','Appartement',6,700),(15,'A015','Appartement',6,700),(16,'A11','Appartement',4,500),(17,'A12','Appartement',4,500),(18,'A13','Appartement',4,500),(19,'A14','Appartement',4,500),(20,'A15','Appartement',4,500),(21,'A16','Appartement',8,900),(22,'A17','Appartement',8,900),(23,'A18','Appartement',6,700),(24,'A19','Appartement',6,700),(25,'A110','Appartement',6,700),(26,'A111','Appartement',6,700),(27,'A112','Appartement',6,700),(28,'A113','Appartement',6,700),(29,'A114','Appartement',6,700),(30,'A115','Appartement',6,700),(31,'A21','Appartement',4,600),(32,'A22','Appartement',4,600),(33,'A23','Appartement',4,600),(34,'A24','Appartement',4,600),(35,'A25','Appartement',4,600),(36,'A26','Appartement',8,1000),(37,'A27','Appartement',6,800),(38,'A28','Appartement',6,800),(39,'A29','Appartement',6,800),(40,'A210','Appartement',6,800),(41,'M1','Mobil-home',6,500),(42,'M2','Mobil-home',6,500),(43,'M3','Mobil-home',6,500),(44,'M4','Mobil-home',6,500),(45,'M5','Mobil-home',6,500),(46,'M6','Mobil-home',6,500),(47,'M7','Mobil-home',6,500),(48,'M8','Mobil-home',6,500),(49,'M9','Mobil-home',6,500),(50,'M10','Mobil-home',6,500),(51,'M11','Mobil-home',6,500),(52,'M12','Mobil-home',6,500),(53,'M13','Mobil-home',6,500),(54,'M14','Mobil-home',6,500),(55,'M15','Mobil-home',6,500),(56,'M16','Mobil-home',6,500),(57,'M17','Mobil-home',6,500),(58,'M18','Mobil-home',6,500),(59,'M19','Mobil-home',6,500),(60,'M20','Mobil-home',6,500),(61,'M21','Mobil-home',6,500),(62,'M22','Mobil-home',6,500),(63,'M23','Mobil-home',6,500),(64,'M24','Mobil-home',6,500),(65,'M25','Mobil-home',6,500),(66,'M26','Mobil-home',6,500),(67,'M27','Mobil-home',6,500),(68,'M28','Mobil-home',6,500),(69,'M29','Mobil-home',6,500),(70,'M30','Mobil-home',6,500),(71,'M31','Mobil-home',6,500),(72,'M32','Mobil-home',6,500),(73,'M33','Mobil-home',6,500),(74,'M34','Mobil-home',6,500),(75,'M35','Mobil-home',6,500),(76,'M36','Mobil-home',6,500),(77,'M37','Mobil-home',6,500),(78,'M38','Mobil-home',6,500),(79,'M39','Mobil-home',6,500),(80,'M40','Mobil-home',6,500),(81,'M41','Mobil-home',6,500),(82,'M42','Mobil-home',6,500),(83,'M43','Mobil-home',6,500),(84,'M44','Mobil-home',6,500),(85,'M45','Mobil-home',6,500),(86,'M46','Mobil-home',6,500),(87,'M47','Mobil-home',6,500),(88,'M48','Mobil-home',6,500),(89,'M49','Mobil-home',6,500),(90,'M50','Mobil-home',6,500),(91,'M51','Mobil-home',6,500),(92,'M52','Mobil-home',6,500),(93,'M53','Mobil-home',6,500),(94,'M54','Mobil-home',6,500),(95,'M55','Mobil-home',6,500),(96,'M56','Mobil-home',6,500),(97,'M57','Mobil-home',6,500),(98,'M58','Mobil-home',6,500),(99,'M59','Mobil-home',6,500),(100,'M60','Mobil-home',6,500),(101,'M61','Mobil-home',8,700),(102,'M62','Mobil-home',8,700),(103,'M63','Mobil-home',8,700),(104,'M64','Mobil-home',8,700),(105,'M65','Mobil-home',8,700),(106,'M66','Mobil-home',8,700),(107,'M67','Mobil-home',8,700),(108,'M68','Mobil-home',8,700),(109,'M69','Mobil-home',8,700),(110,'M70','Mobil-home',8,700),(111,'M71','Mobil-home',8,700),(112,'M72','Mobil-home',8,700),(113,'M73','Mobil-home',8,700),(114,'M74','Mobil-home',8,700),(115,'M75','Mobil-home',8,700),(116,'M76','Mobil-home',8,700),(117,'M77','Mobil-home',8,700),(118,'M78','Mobil-home',8,700),(119,'M79','Mobil-home',8,700),(120,'M80','Mobil-home',8,700),(121,'M81','Mobil-home',8,700),(122,'M82','Mobil-home',8,700),(123,'M83','Mobil-home',8,700),(124,'M84','Mobil-home',8,700),(125,'M85','Mobil-home',8,700),(126,'M86','Mobil-home',8,700),(127,'M87','Mobil-home',8,700),(128,'M88','Mobil-home',8,700),(129,'M89','Mobil-home',8,700),(130,'M90','Mobil-home',8,700),(131,'C1','Caravane',4,350),(132,'C2','Caravane',4,350),(133,'C3','Caravane',4,350),(134,'C4','Caravane',4,350),(135,'C5','Caravane',4,350),(136,'C6','Caravane',4,350),(137,'C7','Caravane',4,350),(138,'C8','Caravane',4,350),(139,'C9','Caravane',4,350),(140,'C10','Caravane',4,350),(141,'C11','Caravane',6,450),(142,'C12','Caravane',6,450),(143,'C13','Caravane',6,450),(144,'C14','Caravane',6,450),(145,'C15','Caravane',6,450),(146,'C16','Caravane',6,450),(147,'C17','Caravane',8,550),(148,'C18','Caravane',8,550),(149,'C19','Caravane',8,550),(150,'C20','Caravane',8,550);
INSERT INTO client VALUES (1,'LAMBERT','Jean','13 avenue du General de Gaulle','81000','CASTRES',7,3,'2011-03-21','0',6,1),(2,'VENAT','Laure','1 bis rue des Peupliers','14000','CAEN',4,1,'2011-03-21','0',8,1),(3,'COUVANT','Laurent','4 avenue KLEBER','94130','NOGENT SUR MARNE',3,2,'2011-03-22','600',1,1),(4,'HUYS','Didier','20 rue de Niepce','59000','LILLE',1,1,'2011-03-22','250',41,1),(5,'MOREIRA','Pablo','5 rue Joffre','14000','CAEN',8,2,'2011-03-22','0',101,1),(6,'HANOT','Sebastien','31 impasse Miroton','27000','DREUX',6,2,'2011-03-23','0',102,1),(7,'FONTAINE','jean','43 allee guynemer','14110','CONDE SUR NOIREAU',6,2,'2011-03-23','0',2,1);

INSERT INTO determine VALUES (1,1,'R'),(1,2,'R'),(1,3,'L'),(2,1,'L'),(2,2,'L'),(2,3,'L'),(3,1,'L'),(3,2,'L'),(3,3,'L'),(4,1,'L'),(4,2,'L'),(4,3,'L'),(5,1,'L'),(5,2,'L'),(5,3,'L'),(6,1,'A'),(6,2,'A'),(6,3,'A'),(7,1,'L'),(7,2,'L'),(7,3,'L'),(8,1,'A'),(8,2,'L'),(8,3,'L'),(41,1,'R'),(41,2,'L'),(41,3,'L'),(101,1,'A'),(101,2,'A'),(101,3,'L'),(102,1,'A'),(102,2,'A'),(102,3,'L');
