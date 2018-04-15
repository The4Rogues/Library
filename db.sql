CREATE TABLE `Books` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `Title` varchar(255) DEFAULT NULL,
 `Author` varchar(255) DEFAULT NULL,
 `Year` int(4) DEFAULT NULL,
 `Publisher` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
CD	CREATE TABLE `CD` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `Title` varchar(255) DEFAULT NULL,
 `Author` varchar(255) DEFAULT NULL,
 `Year` int(4) DEFAULT NULL,
 `Publisher` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
DVD	CREATE TABLE `DVD` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `Title` varchar(255) DEFAULT NULL,
 `Author` varchar(255) DEFAULT NULL,
 `Year` int(4) DEFAULT NULL,
 `Publisher` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1