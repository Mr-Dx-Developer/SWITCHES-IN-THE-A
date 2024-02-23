Config.Shop['cluckinbell'] = { -- job name
	blip = {enable = false, name = 'Cluckin Bell', sprite = 93, color = 21, size = 1.0, radius = 0.0, radius_color = 4},
	boss_action = vector3(-586.04, -597.81, 34.68),
	management = vector3(-586.01, -595.06, 34.68),
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
		menu = vector3(-587.54, -591.14, 34.68),
		data = {
			asain_zest_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					--{item = 'water', quantity = 1, willremove = false}, 
					--{item = 'bread', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			atomic_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bbq_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			garlic_parm_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			garlic_parmesan_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			korean_q_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			lemon_pepper_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			original_hot_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			rotisserie_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.54, -591.14, 34.68, 89.68),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			water = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(-587.64, -592.27, 34.68, 91.4),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
		}
	},
	storage = {
		pos = vector4(-586.1, -590.13, -34.68, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(-584.38, -594.92, 34.68),
		vector3(-584.43, -591.42, 34.68)
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			asain_zest_wings = {				-- The item ID
				name = "Asain Zest Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			atomic_wings = {				-- The item ID
				name = "Atomic Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			bbq_wings = {				-- The item ID
				name = "BBQ Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			fries = {				-- The item ID
				name = "Fries",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			garlic_parm_wings = {				-- The item ID
				name = "Garlic Parm Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			garlic_parmesan_wings = {				-- The item ID
				name = "Garlic Parmesan Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			korean_q_wings = {				-- The item ID
				name = "Korean Q Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			lemon_pepper_wings = {				-- The item ID
				name = "Lemon Pepper Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			original_hot_wings = {				-- The item ID
				name = "Original Hot Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			rotisserie_wings = {				-- The item ID
				name = "Rotisserie Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			
			water = {				-- The item ID
				name = "Water",	-- The item display name
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