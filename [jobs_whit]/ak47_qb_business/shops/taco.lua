Config.Shop['taco'] = { -- job name
	blip = {enable = true, name = 'Taco', sprite = 79, color = 5, size = 1.1, radius = 0.0, radius_color = 4},
	boss_action = vector3(20.22, -1602.11, 29.38),
	management = vector3(8.38, -1604.56, 29.37),
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
		menu = vector3(14.51, -1599.29, 29.38),
		data = {
			beefy_nacho = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			soft_taco = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			crunchy_taco_supreme = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			soft_taco_supreme = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			crispy_chicken_staco = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			volcano_burrito = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			spicy_chicken_burrito = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chalupa_supreme = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			taco_regular = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			crunchytaco = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			tacomeet = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			fishtaco = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cheese_quesadilla = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cheesy_black_bean = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cheesy_gordita_crunch = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_burrito = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			churros_dip = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cinnamon_twists = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			crunchwrap_supreme = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			crunchwrap_supreme_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(13.94, -1596.63, 29.38, 19.02),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			quesadilla_cravings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(13.94, -1596.63, 29.38, 19.02),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			volcano_burrito_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(13.94, -1596.63, 29.38, 19.02),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			two_taco_supreme = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(13.94, -1596.63, 29.38, 19.02),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			fries_grande = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			quesadilla = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(15.19, -1598.28, 29.38, 320.23),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(11.56, -1599.53, 29.38, 54.76),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			t_diet_pepsi = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(13.94, -1596.63, 29.38, 19.02),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			t_pepsi_max = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(13.94, -1596.63, 29.38, 19.02),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			t_seven_up = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(13.94, -1596.63, 29.38, 19.02),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			t_tango_apple = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(13.94, -1596.63, 29.38, 19.02),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			t_tango_orange = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
				},
				steps = {
					{pos = vector4(13.94, -1596.63, 29.38, 19.02),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
		}
	},
	storage = {
		pos = vector4(16.98, -1599.59, 29.38, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(11.26, -1605.54, 29.39),
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			t_diet_pepsi = {				-- The item ID
				name = "Diet Pepsi",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			t_pepsi_max = {				-- The item ID
				name = "Pepsi Max",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			t_seven_up = {				-- The item ID
				name = "7up",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			t_tango_apple = {				-- The item ID
				name = "Tango Apple",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},
			t_tango_orange = {				-- The item ID
				name = "Tango Orange",	-- The item display name
				page = 5,					-- Set on which page this item will appear
				process = true
			},

			churros_dip = {				-- The item ID
				name = "Churros Dip",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			cinnamon_twists = {				-- The item ID
				name = "Cinnamon Twists",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			fries_grande = {				-- The item ID
				name = "Fries Grande",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			
			quesadilla = {				-- The item ID
				name = "Quesadilla",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			cheese_quesadilla = {				-- The item ID
				name = "Cheese Quesadilla",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			crunchwrap_supreme = {				-- The item ID
				name = "Crunchwrap Supreme",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},

			crunchwrap_supreme_meal = {				-- The item ID
				name = "Crunchwrap Supreme Meal",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			quesadilla_cravings = {				-- The item ID
				name = "Quesadilla Cravings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			two_taco_supreme = {				-- The item ID
				name = "Two Taco Supreme",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			volcano_burrito_meal = {				-- The item ID
				name = "Volcano Burrito Meal",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			
			beefy_nacho = {				-- The item ID
				name = "Beefy Nacho",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			cheesy_black_bean = {				-- The item ID
				name = "Cheesy Black Bean",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			chicken_burrito = {				-- The item ID
				name = "Chicken Burrito",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			spicy_chicken_burrito = {				-- The item ID
				name = "Spicy Chicken Burrito",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			volcano_burrito = {				-- The item ID
				name = "Volcano Burrito",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			
			taco_regular = {				-- The item ID
				name = "Taco Regular",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			fishtaco = {				-- The item ID
				name = "Fish Taco",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			crunchytaco = {				-- The item ID
				name = "Crunchy Taco",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			tacomeet = {				-- The item ID
				name = "Taco Meet",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			chalupa_supreme = {				-- The item ID
				name = "Chalupa Supreme",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			cheesy_gordita_crunch = {				-- The item ID
				name = "Cheesy Gordita Crunch",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			soft_taco = {				-- The item ID
				name = "Soft Taco",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			crunchy_taco_supreme = {				-- The item ID
				name = "Crunchy Taco Supreme",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			soft_taco_supreme = {				-- The item ID
				name = "Soft Taco Supreme",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			crispy_chicken_staco = {				-- The item ID
				name = "Crispy Chicken Soft Taco",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Taco", icon = 'fa-link'},
			[1] = {name = "Burritos", icon = 'fa-link'},
			[2] = {name = "Combo", icon = 'fa-link'},
			[3] = {name = "Quesadilla", icon = 'fa-link'},
			[4] = {name = "Desserts", icon = 'fa-link'},
			[5] = {name = "Drinks", icon = 'fa-link'},
		}
	}
}