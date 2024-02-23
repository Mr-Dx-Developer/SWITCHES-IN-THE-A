Shop = Shop or {}

--- Added since some were having issues with adding the ingredient items to their qb-shops. This spawns a ped at the coords of your choice.
--- Be sure to adjust the price of the items and the "PedCoords" of where the ped will spawn.
Shop = {

    GroceryBags = true, -- true if using the 3 Grocery Bags in the shop that gives players random items. If not, then false. (Check README.md)
    GroceryAmt = math.random(1, 5), -- Set the amount as randoms or single number for each item.

    enableShop = true, -- works for "qb", "qs", and "ox_inventory". If using other Inventories then you must implement your own.
    PedModel = `mp_m_shopkeep_01`,
    Scenario = 'WORLD_HUMAN_STAND_MOBILE', 

    PedCoords = { --- Now supports multiple locations.
        { coords = vector3(161.39, 6635.92, 31.58), heading = 136.64, },
        { coords = vector3(53.09, -1478.96, 29.28), heading = 182.76, },     -- add multiple shop locations.
    },

    enableBlip = true, -- Must enable shop above first.
    blips = {
        {
            label = "Let's Cook! Shop",
            coords = vector3(161.39, 6635.92, 31.58),
            sprite = 59,
            display = 6,
            scale = 0.7,
            color = 47,
        },
        {
            label = "Let's Cook! Shop",
            coords = vector3(53.09, -1478.96, 29.28),
            sprite = 59,
            display = 6,
            scale = 0.7,
            color = 47,
        } 
    }, 

	Stock = {
		label = "Let\'s Cook! Grocery Shop",
		slots = 82, -- If you remove the grocery bags at the bottom, adjust this number!
		items = {
			{ name = 'lclobstertails',      price = 5, amount = 200, info = {}, type = 'item', slot = 1, },
			{ name = 'lcbutter',            price = 5, amount = 200, info = {}, type = 'item', slot = 2, },
			{ name = 'lcpbutter',           price = 5, amount = 200, info = {}, type = 'item', slot = 3, },
            { name = 'lcjelly',             price = 5, amount = 200, info = {}, type = 'item', slot = 4, },
			{ name = 'lclemon',             price = 5, amount = 200, info = {}, type = 'item', slot = 5, },
            { name = 'lcbeefpatty',         price = 5, amount = 200, info = {}, type = 'item', slot = 6, },
			{ name = 'lcburgerbun',         price = 5, amount = 200, info = {}, type = 'item', slot = 7, },
            { name = 'lcegg',               price = 5, amount = 200, info = {}, type = 'item', slot = 8, },
            { name = 'lccheese',            price = 5, amount = 200, info = {}, type = 'item', slot = 9, },
            { name = 'lcsausage',           price = 5, amount = 200, info = {}, type = 'item', slot = 10, },
            { name = 'lcbread',             price = 5, amount = 200, info = {}, type = 'item', slot = 11, },
            { name = 'lcveggiepack',        price = 5, amount = 200, info = {}, type = 'item', slot = 12, },
            { name = 'lcdryrice',           price = 5, amount = 200, info = {}, type = 'item', slot = 13, },
            { name = 'lcmaccheese',         price = 5, amount = 200, info = {}, type = 'item', slot = 14, },
            { name = 'lcpancakes',          price = 5, amount = 200, info = {}, type = 'item', slot = 15, },
            { name = 'lcsyrup',             price = 5, amount = 200, info = {}, type = 'item', slot = 16, },
            { name = 'lcramenpack',         price = 5, amount = 200, info = {}, type = 'item', slot = 17, },
            { name = 'lcfrozenpizza',       price = 5, amount = 200, info = {}, type = 'item', slot = 18, },
            { name = 'lcgrapes',            price = 5, amount = 200, info = {}, type = 'item', slot = 19, },
            { name = 'lcsugar',             price = 5, amount = 200, info = {}, type = 'item', slot = 20, },
            { name = 'lcapple',             price = 5, amount = 200, info = {}, type = 'item', slot = 21, },
            { name = 'lcorange',            price = 5, amount = 200, info = {}, type = 'item', slot = 22, },
            { name = 'lcbanana',            price = 5, amount = 200, info = {}, type = 'item', slot = 23, },
            { name = 'lcicecubes',          price = 5, amount = 200, info = {}, type = 'item', slot = 24, },
            { name = 'lcmilk',              price = 5, amount = 200, info = {}, type = 'item', slot = 25, },
            { name = 'lcstrawberry',        price = 5, amount = 200, info = {}, type = 'item', slot = 26, },
            { name = 'lcteabag',            price = 5, amount = 200, info = {}, type = 'item', slot = 27, },
            { name = 'lcgteapod',           price = 5, amount = 200, info = {}, type = 'item', slot = 28, },
            { name = 'lccoffeepod',         price = 5, amount = 200, info = {}, type = 'item', slot = 29, },
            { name = 'lcrawribs',           price = 5, amount = 200, info = {}, type = 'item', slot = 30, },
			{ name = 'lcbbqsauce',          price = 5, amount = 200, info = {}, type = 'item', slot = 31, },
            { name = 'lcrawchicken',        price = 5, amount = 200, info = {}, type = 'item', slot = 32, },
			{ name = 'lcrawbeef',           price = 5, amount = 200, info = {}, type = 'item', slot = 33, },
			{ name = 'lccorncob',           price = 5, amount = 200, info = {}, type = 'item', slot = 34, },
			{ name = 'lcptartpk',           price = 5, amount = 200, info = {}, type = 'item', slot = 35, },
			{ name = 'lcicing',             price = 5, amount = 200, info = {}, type = 'item', slot = 36, },
			{ name = 'lcfrozewaff',         price = 5, amount = 200, info = {}, type = 'item', slot = 37, },
			{ name = 'lchamslice',          price = 5, amount = 200, info = {}, type = 'item', slot = 38, },
            { name = 'lcflour',             price = 5, amount = 200, info = {}, type = 'item', slot = 39, },
            { name = 'lcvegoil',            price = 5, amount = 200, info = {}, type = 'item', slot = 40, },
            { name = 'lccheestkpk',         price = 5, amount = 200, info = {}, type = 'item', slot = 41, },
            { name = 'lcmarinara',          price = 5, amount = 200, info = {}, type = 'item', slot = 42, },
            { name = 'lcrawchops',          price = 5, amount = 200, info = {}, type = 'item', slot = 43, },
            { name = 'lcrawfish',           price = 5, amount = 200, info = {}, type = 'item', slot = 44, },
            { name = 'lcrawsalmon',         price = 5, amount = 200, info = {}, type = 'item', slot = 45, },
            { name = 'lcbeefstrips',        price = 5, amount = 200, info = {}, type = 'item', slot = 46, },
            { name = 'lcrawbreast',         price = 5, amount = 200, info = {}, type = 'item', slot = 47, },
            { name = 'lccocoapod',          price = 5, amount = 200, info = {}, type = 'item', slot = 48, },
            { name = 'lcvaniwafers',        price = 5, amount = 200, info = {}, type = 'item', slot = 49, },
            { name = 'lcpudding',           price = 5, amount = 200, info = {}, type = 'item', slot = 50, },
            { name = 'lcseasoning',         price = 5, amount = 200, info = {}, type = 'item', slot = 51, },
            { name = 'lcrawoxtail',         price = 5, amount = 200, info = {}, type = 'item', slot = 52, },
            { name = 'lccreamer',           price = 5, amount = 200, info = {}, type = 'item', slot = 53, },
            { name = 'water_jug',           price = 5, amount = 200, info = {}, type = 'item', slot = 54, },
            { name = 'lccansoup',           price = 5, amount = 200, info = {}, type = 'item', slot = 55, },
            { name = 'lccanbeans',          price = 5, amount = 200, info = {}, type = 'item', slot = 56, },
            { name = 'lcmshine_melon',      price = 5, amount = 200, info = {}, type = 'item', slot = 57, },
            { name = 'lcmshine_coffebean',  price = 5, amount = 200, info = {}, type = 'item', slot = 58, },
            { name = 'lcmshine_strawberry', price = 5, amount = 200, info = {}, type = 'item', slot = 59, },
            { name = 'lcmshine_sugar',      price = 5, amount = 200, info = {}, type = 'item', slot = 60, },
            { name = 'lcmshine_corn',       price = 5, amount = 200, info = {}, type = 'item', slot = 61, },
            { name = 'lcmshine_yeast',      price = 5, amount = 200, info = {}, type = 'item', slot = 62, },
            { name = 'lcmshine_blkberry',   price = 5, amount = 200, info = {}, type = 'item', slot = 63, },
            { name = 'lcmshine_mash',       price = 5, amount = 200, info = {}, type = 'item', slot = 64, },-- remove, it's crafted
            
            -- Props/Appliances
            { name = 'lc_hobo',             price = 50, amount = 200, info = {}, type = 'item', slot = 65, },
            { name = 'lc_grill',            price = 50, amount = 200, info = {}, type = 'item', slot = 66, },
            { name = 'lc_microwave',        price = 50, amount = 200, info = {}, type = 'item', slot = 67, },
            { name = 'lc_juicer',           price = 50, amount = 200, info = {}, type = 'item', slot = 68, },
            { name = 'lc_coffee',           price = 50, amount = 200, info = {}, type = 'item', slot = 69, },
            { name = 'lc_griddle',          price = 50, amount = 200, info = {}, type = 'item', slot = 70, },
            { name = 'lc_processor',        price = 50, amount = 200, info = {}, type = 'item', slot = 71, },
            { name = 'lc_toaster',          price = 50, amount = 200, info = {}, type = 'item', slot = 72, },
            { name = 'lc_fryer',            price = 50, amount = 200, info = {}, type = 'item', slot = 73, },
            { name = 'lc_table',            price = 50, amount = 200, info = {}, type = 'item', slot = 74, },
            { name = 'lc_chair',            price = 50, amount = 200, info = {}, type = 'item', slot = 75, },
            { name = 'lc_gazebo',           price = 50, amount = 200, info = {}, type = 'item', slot = 76, },
            { name = 'lc_still',            price = 50, amount = 200, info = {}, type = 'item', slot = 77, },   
            { name = 'lc_printer',          price = 50, amount = 200, info = {}, type = 'item', slot = 78, }, -- currently only supports qs or qb-inventory!
            { name = 'lc_partybox',         price = 50, amount = 200, info = {}, type = 'item', slot = 79, },         

            -- Comment these out if GroceryBags set to false above.
            { name = 'grocerya',            price = 50, amount = 200, info = {}, type = 'item', slot = 80, },
            { name = 'groceryb',            price = 50, amount = 200, info = {}, type = 'item', slot = 81, },
            { name = 'groceryc',            price = 50, amount = 200, info = {}, type = 'item', slot = 82, },

		},
	},
}