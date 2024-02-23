Config.Shop['craftbar'] = { -- job name
	blip = {enable = true, name = 'Craft Bar', sprite = 93, color = 21, size = 1.0, radius = 0.0, radius_color = 4},
	boss_action = vector3(119.04, -1045.56, 29.31),
	management = vector3(119.89, -1043.09, 29.31),
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
		menu = vector3(120.76, -1041.25, 29.31),
		data = {
			bacon_egg_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					--{item = 'water', quantity = 1, willremove = false}, 
					--{item = 'bread', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(120.76, -1041.25, 29.31, 341.2),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			biscuits_gravy = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.76, -1041.25, 29.31, 341.2),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			breakfast_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.76, -1041.25, 29.31, 341.2),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_and_waffles = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.76, -1041.25, 29.31, 341.2),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			hot_chicken_wrap = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.76, -1041.25, 29.31, 341.2),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			omlet = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.76, -1041.25, 29.31, 341.2),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			shrimp_and_grits = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.76, -1041.25, 29.31, 341.2),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			strawberry_banana_crepes = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.76, -1041.25, 29.31, 341.2),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			strawberry_nutella_waffles = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.76, -1041.25, 29.31, 341.2),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			latte = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.58, -1041.35, 29.31, 116.89),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mimosa = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.58, -1041.35, 29.31, 116.89),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			pomegranate_mimosa = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.58, -1041.35, 29.31, 116.89),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			red_wine_sangria = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.58, -1041.35, 29.31, 116.89),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			roseymary_gin_fizz = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.58, -1041.35, 29.31, 116.89),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sangria_lemonade = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.58, -1041.35, 29.31, 116.89),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sweat_tea_sangria = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.58, -1041.35, 29.31, 116.89),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			vodka_tonic = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.58, -1041.35, 29.31, 116.89),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			water = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(120.58, -1041.35, 29.31, 116.89),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			
		}
	},
	storage = {
		pos = vector4(119.04, -1045.56, -29.31, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(118.72, -1041.08, 29.31),
		vector3(117.96, -1043.15, 29.31)
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			bacon_egg_cheese = {				-- The item ID
				name = "Bacon Egg Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			biscuits_gravy = {				-- The item ID
				name = "Biscuits Gravy",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			breakfast_meal = {				-- The item ID
				name = "Breakfast Meal",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			chicken_and_waffles = {				-- The item ID
				name = "Chicken & Waffles",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			hot_chicken_wrap = {				-- The item ID
				name = "Hot Chicken Wrap",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			omlet = {				-- The item ID
				name = "Omlet",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			shrimp_and_grits = {				-- The item ID
				name = "Shrimp & Grits",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			strawberry_banana_crepes = {				-- The item ID
				name = "Strawberry Banana Crepes",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			strawberry_nutella_waffles = {				-- The item ID
				name = "Strawberry Nutella Waffles",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			sweat_tea_sangria = {				-- The item ID
				name = "Sweat Tea Sangria",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},

			latte = {				-- The item ID
				name = "Latte",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			mimosa = {				-- The item ID
				name = "Mimosa",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			pomegranate_mimosa = {				-- The item ID
				name = "Pomegranate Mimosa",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			red_wine_sangria = {				-- The item ID
				name = "Redwine Sangria",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			roseymary_gin_fizz = {				-- The item ID
				name = "Roseymary Gin Fizz",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			sangria_lemonade = {				-- The item ID
				name = "Sangria Lemonade",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			vodka_tonic = {				-- The item ID
				name = "Vodka Tonic",	-- The item display name
				page = 1,					-- Set on which page this item will appear
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