CREATE TABLE IF NOT EXISTS `sprays` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `x` float(8,4) NOT NULL,
    `y` float(8,4) NOT NULL,
    `z` float(8,4) NOT NULL,
    `origZ` float(8,4) NOT NULL,
    `origY` float(8,4) NOT NULL,
    `origX` float(8,4) NOT NULL,
    `rx` float(8,4) NOT NULL,
    `ry` float(8,4) NOT NULL,
    `rz` float(8,4) NOT NULL,
    `scale` float(8,4) NOT NULL,
    `text` varchar(32) DEFAULT NULL,
    `imageDict` varchar(64) DEFAULT NULL,
    `image` varchar(64) DEFAULT NULL,
    `font` varchar(32) DEFAULT NULL,
    `color` varchar(32) DEFAULT NULL,
    `interior` int(3) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
    ('spray',	'Spray',	1,	1,	1),
    ('spray_remover',	'Spray Remover',	1,	0,	1);