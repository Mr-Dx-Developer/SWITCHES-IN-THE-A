Config.Shop['chickfila'] = { -- job name
	blip = {enable = true, name = 'Chick-Fil-A', sprite = 537, color = 1, size = 1.2, radius = 0.0, radius_color = 4},
	boss_action = vector3(-1035.65, -1371.11, 5.52),
	management = vector3(-1036.91, -1375.43, 5.52),
	managementRankFor = {
		price = 2,
		stock = 2,
	},
	autoStock = {         		 -- auto refill shop items
	    enable = true,
	    slots = 500,             -- container size
	    regeneration = 10,       -- regenerate item every 10 minutes
	    add = 10,                -- add 1 item to the stock
	},
	crafting = {
		menu = vector3(-1029.31, -1374.71, 5.52),
		data = {
			brown_scramble_bowl = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			brown_scramble_burrito = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			buttered_biscuit = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chick_n_minis = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_biscuit = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_egg_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			egg_cheese_muffin = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			egg_white_grill = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			english_muffin = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			fruit_cup = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			greek_yogurt_parfait = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			hash_browns = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sausage_egg_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chick_fil_a_nuggets = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chick_n_strips = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_club_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cool_wrap = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			deluxe_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			grilled_nuggets = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_noodle_soup = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mac_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			waffle_potato_fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1027.15, -1373.7, 5.52, 255.78),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			cobb_salad = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			market_salad = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			spicy_southwest_salad = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			kale_crunch_side = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			side_salad = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chocolate_chunk_cookie = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chocolate_fudge_brownie = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1030.63, -1374.15, 5.52, 74.77),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			

			brewed_iced_tea = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chick_fil_a_lemonade = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			coffee = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sweet_tea = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chocolate_milkshake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cookies_cream_milkshake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			frosted_coffee = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			frosted_lemonade = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			icedream_cone = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			icedream_cup = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			peach_milkshake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			strawberry_milkshake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			vanilla_milkshake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1035.07, -1379.97, 5.52, 165.5),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
		}
	},
	storage = {
		pos = vector4(-1028.57, -1380.21, 5.52, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            apple_juice = {
                name = 'Apple Juice',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            chocolate_milk = {
                name = 'Chocolate Milk',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            simply_orange = {
                name = 'Simply Orange',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            apple_sauce = {
                name = 'Apple Sauce',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            waffle_potato_chips = {
                name = 'Waffle Potato Chips',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(-1038.85, -1375.09, 5.52),
		vector3(-1037.59, -1370.66, 5.52),
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			brown_scramble_bowl = {				-- The item ID
				name = "Brown Scramble Bowl",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			brown_scramble_burrito = {				-- The item ID
				name = "Brown Scramble Burrito",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			buttered_biscuit = {				-- The item ID
				name = "Buttered Biscuit",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			chick_n_minis = {				-- The item ID
				name = "Chick N Minis",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			chicken_biscuit = {				-- The item ID
				name = "Chicken Biscuit",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			chicken_egg_cheese = {				-- The item ID
				name = "Chicken Egg Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			egg_cheese_muffin = {				-- The item ID
				name = "Egg Cheese Muffin",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			egg_white_grill = {				-- The item ID
				name = "Egg White Grill",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			english_muffin = {				-- The item ID
				name = "English Muffin",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			fruit_cup = {				-- The item ID
				name = "Fruit Cup",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			greek_yogurt_parfait = {				-- The item ID
				name = "Greek Yogurt Parfait",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			hash_browns = {				-- The item ID
				name = "Hash Browns",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			sausage_egg_cheese = {				-- The item ID
				name = "Sausage Egg Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},

			apple_juice = {				-- The item ID
				name = "Apple Juice",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = false
			},
			brewed_iced_tea = {				-- The item ID
				name = "Brewed Iced Tea",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			chick_fil_a_lemonade = {				-- The item ID
				name = "Chick-fil-A Lemonade",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			chocolate_milk = {				-- The item ID
				name = "Chocolate Milk",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = false
			},
			coffee = {				-- The item ID
				name = "Coffee",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			simply_orange = {				-- The item ID
				name = "Simply Orange",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = false
			},
			sweet_tea = {				-- The item ID
				name = "Sweet Tea",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},

			chick_fil_a_nuggets = {				-- The item ID
				name = "Chick-Fil-A Nuggets",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			chick_n_strips = {				-- The item ID
				name = "Chick N Strips",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			chicken_club_sandwich = {				-- The item ID
				name = "Chicken Club Sandwich",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			chicken_sandwich = {				-- The item ID
				name = "Chicken Sandwich",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			cool_wrap = {				-- The item ID
				name = "Cool Wrap",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			deluxe_sandwich = {				-- The item ID
				name = "Deluxe Sandwich",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			grilled_nuggets = {				-- The item ID
				name = "Grilled Nuggets",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},

			cobb_salad = {				-- The item ID
				name = "Cobb Salad",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			market_salad = {				-- The item ID
				name = "Market Salad",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			spicy_southwest_salad = {				-- The item ID
				name = "Spicy Southwest Salad",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},

			apple_sauce = {				-- The item ID
				name = "Apple Sauce",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = false
			},
			chicken_noodle_soup = {				-- The item ID
				name = "Chicken Noodle Soup",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			kale_crunch_side = {				-- The item ID
				name = "Kale Crunch Side",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			mac_cheese = {				-- The item ID
				name = "Mac Cheese",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			side_salad = {				-- The item ID
				name = "Side Salad",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			waffle_potato_chips = {				-- The item ID
				name = "Waffle Potato Chips",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = false
			},
			waffle_potato_fries = {				-- The item ID
				name = "Waffle Potato Fries",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},

			chocolate_chunk_cookie = {				-- The item ID
				name = "Chocolate Chunk Cookie",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			chocolate_fudge_brownie = {				-- The item ID
				name = "Chocolate Fudge Brownie",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			chocolate_milkshake = {				-- The item ID
				name = "Chocolate Milkshake",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			cookies_cream_milkshake = {				-- The item ID
				name = "Cookies Cream Milkshake",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			frosted_coffee = {				-- The item ID
				name = "Frosted Coffee",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			frosted_lemonade = {				-- The item ID
				name = "Drosted Lemonade",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			icedream_cone = {				-- The item ID
				name = "Icedream Cone",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			icedream_cup = {				-- The item ID
				name = "Icedream Cup",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			peach_milkshake = {				-- The item ID
				name = "Peach Milkshake",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			strawberry_milkshake = {				-- The item ID
				name = "Strawberry Milkshake",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			vanilla_milkshake = {				-- The item ID
				name = "Vanilla Milkshake",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Breakfast", icon = 'fa-link'},
			[1] = {name = "Drinks", icon = 'fa-link'},
			[2] = {name = "Entrees", icon = 'fa-link'},
			[3] = {name = "Salad", icon = 'fa-link'},
			[4] = {name = "Sides", icon = 'fa-link'},
			[5] = {name = "Treats", icon = 'fa-link'},
		}
	}
}