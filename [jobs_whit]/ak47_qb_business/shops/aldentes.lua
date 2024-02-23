Config.Shop['aldentes'] = { -- job name
	blip = {enable = false, name = 'Al Dentes', sprite = 93, color = 21, size = 1.0, radius = 0.0, radius_color = 4},
	boss_action = vector3(-586.05, -607.51, 34.68),
	management = vector3(-586.01, -604.63, 34.68),
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
		menu = vector3(-587.61, -600.62, 34.68),
		data = {
			buffalo_chicken_strips = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					--{item = 'water', quantity = 1, willremove = false}, 
					--{item = 'bread', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(-587.61, -600.62, 34.68, 89.98),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			fried_calamari = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.61, -600.62, 34.68, 89.98),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.61, -600.62, 34.68, 89.98),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			meatball = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.61, -600.62, 34.68, 89.98),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mozzarella_sticks = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.61, -600.62, 34.68, 89.98),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			vodka = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.64, -602.24, 34.68, 88.67),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			
			
		}
	},
	storage = {
		pos = vector4(-586.08, -599.27, -34.68, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(-584.28, -604.37, 34.68),
		vector3(-584.47, -601.08, 34.68)
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			buffalo_chicken_strips = {				-- The item ID
				name = "Buffalo Chicken Strips",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			fried_calamari = {				-- The item ID
				name = "Fried Calamari",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			fries = {				-- The item ID
				name = "Fries",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			meatball = {				-- The item ID
				name = "Meatball",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			mozzarella_sticks = {				-- The item ID
				name = "Mozzarella Sticks",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},

			vodka = {				-- The item ID
				name = "Vodka",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
						
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Foods", icon = 'fa-link'},
			[1] = {name = "Drinks", icon = 'fa-link'},
		}
	}
}