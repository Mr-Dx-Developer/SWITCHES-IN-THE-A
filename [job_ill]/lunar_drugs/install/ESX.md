1. Use OX.md if you're using ox_inventory, otherwise follow this tutorial.

2. Install dependencies:
	ox_lib - https://github.com/overextended/ox_lib/releases,
	ox_target/qtarget/qb-target

3. Add ensure lunar_drugs into server.cfg and make sure it's started after dependencies.

4. Configure config.lua to you likings.

5. Run this in your sql database:

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('coke_bag', 'Bag of cocaine', 10),
	('coke', 'Cocaine', 1),
	('coke_leaf', 'Coca leaf', 1),
	('empty_bag', 'Empty bag', 1),
	('fertilizer', 'Fertilizer', 500),
	('ammonia', 'Ammonia', 100),
	('chemicals', 'Chemicals', 100),
	('meth_bag', 'Bag of meth', 10),
	('meth', 'Meth', 1),
	('weed_bag', 'Bag of weed', 10),
	('weed_seed', 'Weed seed', 5),
	('weed', 'Weed', 1),
	('weed_joint', 'Weed joint', 1),
	('weed_papers', 'Weed papers', 1),
	('trowel', 'Trowel', 200),
	('water_can', 'Watering can', 1000),
	('plastic_bag', 'Plastic bag', 1),
	('meth_table', 'Meth table', 5000),
	('poppy_plant', 'Poppy plant', 100),
	('heroin_bag', 'Bag of heroin', 1)
;

CREATE TABLE `lunar_drugs_weed` (
  `id` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `lunar_drugs_weed`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `lunar_drugs_weed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

6. Use this in server.cfg to change the locale: setr ox:locale en