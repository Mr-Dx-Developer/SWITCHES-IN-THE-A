1. Only use this if you're using ox_inventory.

2. Install dependencies:
	ox_lib - https://github.com/overextended/ox_lib/releases,
	ox_target/qtarget/qb-target

3. Add ensure lunar_drugs into server.cfg and make sure it's started after dependencies.

4. Configure config.lua to you likings.

5. Copy and paste images into ox_inventory/web/build/images

6. Add this to ox_inventory/data/items.lua:

	['coke_bag'] = {
		label = 'Bag of cocaine',
		description = "10 grams of cocaine",
		weight = 10,
		stack = true
	},

	['coke'] = {
		label = 'Cocaine',
		description = "Pure cocaine",
		weight = 1,
		stack = true
	},

	['coke_leaf'] = {
		label = 'Coca leaf',
		weight = 1,
		stack = true
	},

	['empty_bag'] = {
		label = 'Empty bag',
		description = "Might be good for packing things?",
		weight = 1,
		stack = true
	},

	['fertilizer'] = {
		label = 'Fertilizer',
		description = "A good plant fertilizer",
		weight = 500,
		stack = true
	},

	['ammonia'] = {
		label = 'Ammonia',
		weight = 100,
		stack = true
	},

	['chemicals'] = {
		label = 'Chemicals',
		weight = 100,
		stack = true
	},

	['meth_bag'] = {
		label = 'Bag of meth',
		description = "10 grams of meth",
		weight = 10,
		stack = true
	},

	['meth'] = {
		label = 'Meth',
		description = "Pure meth",
		weight = 1,
		stack = true
	},

	['weed_bag'] = {
		label = 'Bag of weed',
		description = "10 grams of weed",
		weight = 10,
		stack = true
	},

	['weed_seed'] = {
		label = 'Weed seed',
		description = "Marihuana plant seed",
		weight = 5,
		stack = true
	},

	['weed'] = {
		label = 'Weed',
		description = "Marihuana",
		weight = 1,
		stack = true
	},

	['weed_joint'] = {
		label = 'Weed joint',
		weight = 1,
		stack = true
	},

	['weed_papers'] = {
		label = 'Weed papers',
		weight = 1,
		stack = true
	},

	['trowel'] = {
		label = 'Trowel',
		weight = 200,
		stack = true
	},

	['water_can'] = {
		label = 'Watering can',
		weight = 1000,
		stack = true
	},

	['plastic_bag'] = {
		label = 'Plastic bag',
		weight = 1,
		stack = true
	},

	['meth_table'] = {
		label = 'Meth table',
		weight = 5000,
		stack = false
	},

	['poppy_plant'] = {
		label = 'Poppy plant',
		weight = 100,
		stack = true
	},

	['heroin_bag'] = {
		label = 'Bag of heroin',
		weight = 10,
		stack = true
	},

7. Run this in your sql database:

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


8. Use this in server.cfg to change the locale: setr ox:locale en