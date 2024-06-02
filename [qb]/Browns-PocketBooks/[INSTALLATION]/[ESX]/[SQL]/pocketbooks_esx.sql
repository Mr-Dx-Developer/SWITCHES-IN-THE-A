CREATE TABLE IF NOT EXISTS `pocketbooks` (
  `pocketbook_serial` tinytext DEFAULT NULL,
  `pocketbook_type` tinytext DEFAULT NULL,
  `pocketbook_crafter_identifier` varchar(46) DEFAULT NULL,
  `pocketbook_owner_identifier` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

