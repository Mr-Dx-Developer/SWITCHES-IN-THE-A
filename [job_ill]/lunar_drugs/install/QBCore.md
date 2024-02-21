1. Only use this if you're using ox_inventory.

2. Install dependencies:
	ox_lib - https://github.com/overextended/ox_lib/releases,
	ox_target/qtarget/qb-target

3. Add ensure lunar_drugs into server.cfg and make sure it's started after dependencies.

4. Configure config.lua to you likings.

5. Copy and paste images into qb-inventory/html/images

6. Add these items in qb-core/shared/items.lua

['coke_bag'] 			 		 = {['name'] = 'coke_bag', 				    	['label'] = 'Bag of cocaine', 			['weight'] = 10, 		['type'] = 'item', 		['image'] = 'coke_bag.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = '10 grams of cocaine'},
    ['coke'] 			 		 	 = {['name'] = 'coke', 				    		['label'] = 'Cocaine', 			    	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'coke.png', 		    	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Pure cocaine'},
    ['coke_leaf'] 			 		 = {['name'] = 'coke_leaf', 				    ['label'] = 'Coca leaf', 			    ['weight'] = 1, 		['type'] = 'item', 		['image'] = 'coke_leaf.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Coca plant leaf'},
    ['empty_bag'] 			 		 = {['name'] = 'empty_bag', 				    ['label'] = 'Empty bag', 			    ['weight'] = 1, 		['type'] = 'item', 		['image'] = 'empty_bag.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Empty plastic bag'},
    ['fertilizer'] 			 		 = {['name'] = 'fertilizer', 				    ['label'] = 'Fertilizer', 			    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'fertilizer.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A good plant fertilizer'},
    ['ammonia'] 			 		 = {['name'] = 'ammonia', 				    	['label'] = 'Ammonia', 			    	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'ammonia.png', 		    	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Ammonia'},
    ['chemicals'] 			 		 = {['name'] = 'chemicals', 				    ['label'] = 'Chemicals', 			    ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'chemicals.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Chemicals'},
    ['meth_bag'] 			 		 = {['name'] = 'meth_bag', 				    	['label'] = 'Bag of meth', 			    ['weight'] = 10, 		['type'] = 'item', 		['image'] = 'meth_bag.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = '10 grams of meth'},
    ['meth'] 			 		 	 = {['name'] = 'meth', 				    		['label'] = 'Meth', 			    	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'meth.png', 		    	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Pure meth'},
    ['weed_bag'] 			 		 = {['name'] = 'weed_bag', 				    	['label'] = 'Bag of weed', 			    ['weight'] = 10, 		['type'] = 'item', 		['image'] = 'weed_bag.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = '10 grams of weed'},
    ['weed_seed'] 			 		 = {['name'] = 'weed_seed', 				    ['label'] = 'Weed seed', 			    ['weight'] = 5, 		['type'] = 'item', 		['image'] = 'weed_seed.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Marihuana plant seed'},
    ['weed'] 			 		 	 = {['name'] = 'weed', 				    		['label'] = 'Weed', 			    	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed.png', 		    	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Marihuana'},
    ['weed_joint'] 			 		 = {['name'] = 'weed_joint', 				    ['label'] = 'Weed joint', 			    ['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_joint.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'High quality weed joint'},
	['weed_papers'] 			 	 = {['name'] = 'weed_papers', 				    ['label'] = 'Weed papers', 			    ['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_papers.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Weed papers'},
    ['trowel'] 			 		 	 = {['name'] = 'trowel', 				    	['label'] = 'Trowel', 			    	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'trowel.png', 		    	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Good for harvesting things'},
    ['water_can'] 			 		 = {['name'] = 'water_can', 				    ['label'] = 'Watering can', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'water_can.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Good for watering plants'},
    ['plastic_bag'] 			 	 = {['name'] = 'plastic_bag', 				    ['label'] = 'Plastic bag', 			    ['weight'] = 1, 		['type'] = 'item', 		['image'] = 'plastic_bag.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Good for packing drugs?'},
    ['meth_table'] 			 		 = {['name'] = 'meth_table', 				    ['label'] = 'Meth table', 			    ['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'meth_table.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Cook methamphetamine anywhere'},
    ['poppy_plant'] 			 	 = {['name'] = 'poppy_plant', 				    ['label'] = 'Poppy plant', 			    ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'poppy_plant.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Heroin is made from it'},
    ['heroin_bag'] 			 		 = {['name'] = 'heroin_bag', 				    ['label'] = 'Bag of heroin', 			['weight'] = 100, 		['type'] = 'item', 		['image'] = 'heroin_bag.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = '10 grams of heroin'},

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