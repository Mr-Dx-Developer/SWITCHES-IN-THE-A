
CREATE TABLE IF NOT EXISTS `boss_menus` (
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `settings` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_designer', 'Designer', 1)
;

INSERT INTO `addon_account_data` (account_name, money, owner) VALUES
	('society_designer', 10000, '')
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_designer', 'Designer', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('society_designer', 'Designer', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
	('designer', 'Designer', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('designer', 0, 'bagmaker', 'Bag Maker', 300, '{}', '{}'),
	('designer', 1, 'boss', 'Boss', 600, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('fmdblleather', 'French Black Leather', 1, 0, 1),
('fmdpleather', 'French Pink Leather', 1, 0, 1),
('fmdwleather', 'French White Leather', 1, 0, 1),
('fmdspleather', 'French Snake Print Leather', 1, 0, 1),
('fmdlvleather', 'Louis Vuitton Leather', 1, 0, 1),
('fmdapleather', 'French Animal Print Leather', 1, 0, 1),
('fmdthread', 'Thread', 1, 0, 1),
('fmdclasp', 'Clasp', 1, 0, 1),
('fmdbalbox', 'Balenciaga Box', 1, 0, 1),
('fmdchbox', 'Chanel Box', 1, 0, 1),
('fmdbirbox', 'Birkin Box', 1, 0, 1),
('fmdlvbox', 'Louis Vuitton Box', 1, 0, 1),
('fmddiorbox', 'Dior Box', 1, 0, 1),
('fmdbalsheet', 'Balenciaga Blueprint', 1, 0, 1),
('fmdchsheet', 'Chanel Blueprint', 1, 0, 1),
('fmdbirsheet', 'Birkin Blueprint', 1, 0, 1),
('fmdlvsheet', 'Louis Vuitton Blueprint', 1, 0, 1),
('fmddiorsheet', 'Dior Blueprint', 1, 0, 1),
('fmdbaltote', 'Balenciaga Tote', 1, 0, 1),
('fmdbalwwallet', 'Balenciaga Wallet', 1, 0, 1),
('fmdbalpsbag', 'Balenciaga Pink Snake', 1, 0, 1),
('fmdbalpbag', 'Balenciaga Pink', 1, 0, 1),
('fmdchp', 'Pink Chanel Backpack', 1, 0, 1),
('fmdchw', 'White Chanel Backpack', 1, 0, 1),
('fmdchb', 'Black Chanel Backpack', 1, 0, 1),
('fmdbirps', 'Pink Snake Birkin', 1, 0, 1),
('fmdbirb', 'Black Birkin', 1, 0, 1),
('fmdbirap', 'Animal Print Birkin', 1, 0, 1),
('fmdbirpink', 'Pink Birkin', 1, 0, 1),
('fmdlvcb', 'Crossbody LV Bag', 1, 0, 1),
('fmdlvtote', 'LV Tote', 1, 0, 1),
('fmdlvwallet', 'LV Wallet', 1, 0, 1),
('fmdlvjungle', 'LV Jungle Tote', 1, 0, 1),
('fmddiorap', 'Animal Print Dior Lady', 1, 0, 1),
('fmddiorb', 'Black Dior Lady', 1, 0, 1),
('fmddiorpl', 'Pink Dior Lady', 1, 0, 1),
('fmddiortote', 'Dior Tote', 1, 0, 1),
('fmddiorptote', 'Dior Pink Snake Tote', 1, 0, 1),
('fmdbaltotebox', 'Boxed Balenciaga Tote', 1, 0, 1),
('fmdbalwwalletbox', 'Boxed Balenciaga Wallet', 1, 0, 1),
('fmdbalpsbagbox', 'Boxed Balenciaga Pink Snake', 1, 0, 1),
('fmdbalpbagbox', 'Boxed Balenciaga Pink', 1, 0, 1),
('fmdchpbox', 'Boxed Pink Chanel Backpack', 1, 0, 1),
('fmdchwbox', 'Boxed White Chanel Backpack', 1, 0, 1),
('fmdchbbox', 'Boxed Black Chanel Backpack', 1, 0, 1),
('fmdbirpsbox', 'Boxed Pink Snake Birkin', 1, 0, 1),
('fmdbirbbox', 'Boxed Black Birkin', 1, 0, 1),
('fmdbirapbox', 'Boxed Animal Print Birkin', 1, 0, 1),
('fmdbirpinkbox', 'Boxed Pink Birkin Tote', 1, 0, 1),
('fmdlvcbbox', 'Boxed LV Crossbody', 1, 0, 1),
('fmdlvtotebox', 'Boxed LV Tote', 1, 0, 1),
('fmdlvwalletbox', 'Boxed LV Wallet', 1, 0, 1),
('fmdlvjunglebox', 'Boxed LV Jungle Tote', 1, 0, 1),
('fmddiorapbox', 'Boxed Animal Print Dior Lady', 1, 0, 1),
('fmddiorbbox', 'Boxed Black Dior Lady', 1, 0, 1),
('fmddiorplbox', 'Boxed Pink Dior Lady', 1, 0, 1),
('fmddiortotebox', 'Boxed Dior Tote', 1, 0, 1),
('fmddiorptotebox', 'Boxed Dior Pink Snake Tote', 1, 0, 1)
;