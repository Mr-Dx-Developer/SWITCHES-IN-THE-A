
ALTER TABLE `players` ADD `ownedskills` LONGTEXT NOT NULL;

ALTER TABLE `players` ADD `skillsinfo` LONGTEXT NOT NULL;

UPDATE players SET `ownedskills` = '{}' WHERE 1 = 1;
UPDATE players SET `skillsinfo` = '{"skillpoints":0, "skillxp":0, "nextlevel":100, "currentlevel":0}' WHERE 1 = 1;

CREATE TABLE `core_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `value1` varchar(50) NOT NULL,
  `value2` varchar(50) NOT NULL,
  `value3` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

ALTER TABLE `core_skills` Modify column citizenid varchar(50); 

ALTER TABLE `players` ALTER `ownedskills` SET DEFAULT '{}';
ALTER TABLE `players` ALTER `skillsinfo` SET DEFAULT '{"skillpoints":0, "skillxp":0, "nextlevel":100, "currentlevel":0}';
