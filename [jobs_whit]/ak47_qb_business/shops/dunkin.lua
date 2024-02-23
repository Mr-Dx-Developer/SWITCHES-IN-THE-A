Config.Shop['dunkin'] = { -- job name
	blip = {enable = true, name = 'Dunkin Donuts', sprite = 538, color = 1, size = 1.2, radius = 0.0, radius_color = 4},
	boss_action = vector3(-584.77, -883.61, 25.95),
	management = vector3(-580.51, -883.58, 25.95),
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
		menu = vector3(-582.38, -885.59, 25.95),
		data = {
			bagel_cream_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_bacon_egg_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_croissant = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_donuts = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_hash_browns = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_muffins = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			munchkins_donut_hole = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			snackin_bacon = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sourdough_breakfast_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			stuffed_bagel_minis = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			wake_up_wrap = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-587.49, -888.68, 25.95, 181.61),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-580.76, -886.6, 25.95, 268.31),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			cold_brew = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_americano = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_coffee = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_latte = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_macchiato = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_refresher = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dunkin_tea = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			iced_cappuccino = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			iced_macchiatto = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			iced_matcha_latte = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			iced_signaturea_latte = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			signature_latte = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-584.64, -888.58, 25.95, 185.3),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
		}
	},
	storage = {
		pos = vector4(-583.22, -888.52, 25.95, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            packaged_coffee = {
                name = 'Packaged Coffee',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            packaged_tea = {
                name = 'Packaged Tea',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(-585.72, -881.96, 25.95),
		vector3(-581.66, -882.04, 25.95),
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			cold_brew = {				-- The item ID
				name = "Cold Brew",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			dunkin_americano = {				-- The item ID
				name = "Dunkin Americano",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			dunkin_coffee = {				-- The item ID
				name = "Dunkin Coffee",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			dunkin_latte = {				-- The item ID
				name = "Dunkin Latte",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			dunkin_macchiato = {				-- The item ID
				name = "Dunkin Macchiato",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			dunkin_refresher = {				-- The item ID
				name = "Dunkin Refresher",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			dunkin_tea = {				-- The item ID
				name = "Dunkin Tea",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			iced_cappuccino = {				-- The item ID
				name = "Iced Cappuccino",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			iced_macchiatto = {				-- The item ID
				name = "Iced Macchiatto",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			iced_matcha_latte = {				-- The item ID
				name = "Iced Matcha Latte",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			iced_signaturea_latte = {				-- The item ID
				name = "Iced Signaturea Latte",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			packaged_coffee = {				-- The item ID
				name = "Packaged Coffee",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			packaged_tea = {				-- The item ID
				name = "Packaged Tea",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			signature_latte = {				-- The item ID
				name = "Signature Latte",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			
			bagel_cream_cheese = {				-- The item ID
				name = "Bagel Cream Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			dunkin_bacon_egg_cheese = {				-- The item ID
				name = "Bacon Egg Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			dunkin_croissant = {				-- The item ID
				name = "Dunkin Croissant",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			dunkin_donuts = {				-- The item ID
				name = "Dunkin Donuts",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			dunkin_hash_browns = {				-- The item ID
				name = "Hash Browns",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			dunkin_muffins = {				-- The item ID
				name = "Dunkin Muffins",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			munchkins_donut_hole = {				-- The item ID
				name = "Munchkins Donut",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			snackin_bacon = {				-- The item ID
				name = "Snackin Bacon",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			sourdough_breakfast_sandwich = {				-- The item ID
				name = "Sourdough Sandwich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			stuffed_bagel_minis = {				-- The item ID
				name = "Stuffed Bagel Minis",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			wake_up_wrap = {				-- The item ID
				name = "Wake Up Wrap",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Foods", icon = 'fa-link'},
			[1] = {name = "Drinks", icon = 'fa-link'},
		}
	}
}