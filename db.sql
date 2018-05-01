# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.30-MariaDB)
# Database: test3
# Generation Time: 2018-05-01 20:53:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table accessibility_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accessibility_options`;

CREATE TABLE `accessibility_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `accessibility_options` WRITE;
/*!40000 ALTER TABLE `accessibility_options` DISABLE KEYS */;

INSERT INTO `accessibility_options` (`id`, `name`)
VALUES
	(1,'Large Print'),
	(2,'Braille'),
	(3,'Audio Book');

/*!40000 ALTER TABLE `accessibility_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;

INSERT INTO `authors` (`id`, `name`)
VALUES
	(1,'J. K. Rowling'),
	(2,'Enid Blyton'),
	(3,'Jaqueline Wilson'),
	(4,'J. R. R. Tolkien ');

/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(15) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `age_restriction` tinyint(4) NOT NULL,
  `is_lost` tinyint(4) NOT NULL,
  `is_reference` tinyint(4) NOT NULL,
  `edition` varchar(30) NOT NULL,
  `is_out_for_repair` tinyint(4) NOT NULL,
  `original_price` decimal(8,2) NOT NULL,
  `accessibility_options_id` int(11) DEFAULT NULL,
  `genre_id` int(11) NOT NULL,
  `reader_level_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accessibility_options_id` (`accessibility_options_id`),
  KEY `genre_id` (`genre_id`),
  KEY `reader_level_id` (`reader_level_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`accessibility_options_id`) REFERENCES `accessibility_options` (`id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`reader_level_id`) REFERENCES `reader_levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;

INSERT INTO `books` (`id`, `isbn`, `title`, `publisher`, `year`, `age_restriction`, `is_lost`, `is_reference`, `edition`, `is_out_for_repair`, `original_price`, `accessibility_options_id`, `genre_id`, `reader_level_id`)
VALUES
	(1,'9781408855652 ','\nHarry Potter and the Philosopher\'s Stone','Bloomsbury Publishing PLC',2014,0,0,1,'Illustrated',0,9.35,1,4,3),
	(2,'9780340681060','Famous Five: Five On A Treasure Island',' Hachette Children\'s Group ',1997,0,0,0,'2nd edition',0,5.49,1,3,2),
	(3,'9780552554435','My Sister Jodie','Random House Children\'s Publishers UK ',2009,0,0,0,'2nd edition',0,5.49,1,3,3),
	(4,'9780261103207 ','The Fellowship of The Ring: The Lord of The Rings','HarperCollins Publishers',1994,1,0,1,'4th edition',0,35.00,2,1,4),
	(29,'9780261103580','The Two Towers - The Lord of the Rings 2 ','HarperCollins Publishers ',2011,0,0,0,'6th edition',0,0.00,2,1,4);

/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table books_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books_authors`;

CREATE TABLE `books_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `books_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_id` (`books_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`),
  CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `books_authors` WRITE;
/*!40000 ALTER TABLE `books_authors` DISABLE KEYS */;

INSERT INTO `books_authors` (`id`, `books_id`, `author_id`)
VALUES
	(1,1,1),
	(2,2,2),
	(3,3,3),
	(4,4,4);

/*!40000 ALTER TABLE `books_authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table borrowed_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `borrowed_items`;

CREATE TABLE `borrowed_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_out` date NOT NULL,
  `date_due` date NOT NULL,
  `date_in` date NOT NULL,
  `books_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_id` (`books_id`),
  KEY `borrower_id` (`borrower_id`),
  CONSTRAINT `borrowed_items_ibfk_1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`),
  CONSTRAINT `borrowed_items_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table borrowed_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `borrowed_transactions`;

CREATE TABLE `borrowed_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `borrowed_items_id` int(11) NOT NULL,
  `costs_id` int(11) NOT NULL,
  `librarian_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `borrowed_items_id` (`borrowed_items_id`),
  KEY `costs_id` (`costs_id`),
  KEY `librarian_id` (`librarian_id`),
  CONSTRAINT `borrowed_transactions_ibfk_1` FOREIGN KEY (`borrowed_items_id`) REFERENCES `borrowed_items` (`id`),
  CONSTRAINT `borrowed_transactions_ibfk_2` FOREIGN KEY (`costs_id`) REFERENCES `costs` (`id`),
  CONSTRAINT `borrowed_transactions_ibfk_3` FOREIGN KEY (`librarian_id`) REFERENCES `librarians` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table borrowers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `borrowers`;

CREATE TABLE `borrowers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tel` decimal(20,0) NOT NULL,
  `acc_last_active` date NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `date_of_birth` date NOT NULL,
  `NewAttribute` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table costs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `costs`;

CREATE TABLE `costs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL DEFAULT '',
  `amount` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `costs` WRITE;
/*!40000 ALTER TABLE `costs` DISABLE KEYS */;

INSERT INTO `costs` (`id`, `description`, `amount`)
VALUES
	(1,'book_fine',0.20);

/*!40000 ALTER TABLE `costs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table genres
# ------------------------------------------------------------

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;

INSERT INTO `genres` (`id`, `genre_name`)
VALUES
	(1,'Horror'),
	(2,'Family'),
	(3,'Romance'),
	(4,'Adventure');

/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table librarians
# ------------------------------------------------------------

DROP TABLE IF EXISTS `librarians`;

CREATE TABLE `librarians` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_no` decimal(10,0) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `librarians` WRITE;
/*!40000 ALTER TABLE `librarians` DISABLE KEYS */;

INSERT INTO `librarians` (`id`, `employee_no`, `username`, `password`, `first_name`, `last_name`, `email`)
VALUES
	(1,23145,'krahman','5103a','Khadija','Rahman','kabdu025@gold.ac.uk'),
	(2,23146,'ichiS','5103b','Ichi','S','ichisichimura@gmail.com\n'),
	(3,23147,'VivHughes','5103c','Vivienne','H','vivienne.c.hughes@gmail.com');

/*!40000 ALTER TABLE `librarians` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reader_levels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reader_levels`;

CREATE TABLE `reader_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `reader_levels` WRITE;
/*!40000 ALTER TABLE `reader_levels` DISABLE KEYS */;

INSERT INTO `reader_levels` (`id`, `name`)
VALUES
	(1,'Early_learner'),
	(2,'Beginner_reader'),
	(3,'Young_adult'),
	(4,'Adult');

/*!40000 ALTER TABLE `reader_levels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service_charges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_charges`;

CREATE TABLE `service_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(30) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `service_charges` WRITE;
/*!40000 ALTER TABLE `service_charges` DISABLE KEYS */;

INSERT INTO `service_charges` (`id`, `service_name`, `price`)
VALUES
	(1,'b&w printing',0.20),
	(2,'b&wcopying ',0.20),
	(3,'colour printing',1.00),
	(4,'colour copying',1.00);

/*!40000 ALTER TABLE `service_charges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_transactions`;

CREATE TABLE `service_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `service_charges_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `borrower_id` (`borrower_id`),
  KEY `service_charges_id` (`service_charges_id`),
  CONSTRAINT `service_transactions_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`),
  CONSTRAINT `service_transactions_ibfk_2` FOREIGN KEY (`service_charges_id`) REFERENCES `service_charges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
