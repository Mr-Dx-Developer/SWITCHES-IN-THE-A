ALTER TABLE players
ADD (credits int(11) NOT NULL DEFAULT '0',
tasks longtext COLLATE utf8mb4_bin NOT NULL DEFAULT '',
tasks_completed longtext COLLATE utf8mb4_bin NOT NULL DEFAULT '',
winnings longtext COLLATE utf8mb4_bin NOT NULL DEFAULT '');