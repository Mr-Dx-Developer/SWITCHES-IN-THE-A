Config.Shop['dominos'] = { -- job name
	blip = {enable = true, name = 'Dominos', sprite = 538, color = 1, size = 1.2, radius = 0.0, radius_color = 4},
	boss_action = vector3(541.36, 114.08, 96.57),
	management = vector3(545.28, 112.49, 96.57),
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
		menu = vector3(545.02, 116.36, 96.8),
		data = {
			extra_vagan_zza = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			meat_zza = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			philly_cheese_steak = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			pacific_veggie = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			honolulu_hawaiian = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			pizza_deluxe = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cali_chicken_bacon = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			buffalo_chicken = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			ultimate_pepperoni = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			memphis_bbq_chicken = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			wisconsin_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			spinach_feta = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_habanero = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mediterranean_veggie = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			philly_cheese_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_bacon_ranch = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			italian_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			p_chicken_alfredo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			italian_sausage_marinara = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_carbonara = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			pasta_primavera = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(547.02, 120.51, 96.57, 336.25),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(544.24, 121.27, 96.57, 341.38),  delay = 15, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			d_coca_cola = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(541.98, 114.91, 96.57, 74.92),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			d_dr_pepper = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(541.98, 114.91, 96.57, 74.92),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			d_fanta_orange = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(541.98, 114.91, 96.57, 74.92),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			d_fruit_punch = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(541.98, 114.91, 96.57, 74.92),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			d_sprite = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(541.98, 114.91, 96.57, 74.92),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
		}
	},
	storage = {
		pos = vector4(548.82, 115.12, 96.57, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(543.91, 111.44, 96.57),
		vector3(541.92, 112.17, 96.57)
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			extra_vagan_zza = {				-- The item ID
				name = "Extra Vagan ZZa",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			meat_zza = {				-- The item ID
				name = "Meat ZZa",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			philly_cheese_steak = {				-- The item ID
				name = "Philly Cheese Steak",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			pacific_veggie = {				-- The item ID
				name = "Pacific Veggie",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			honolulu_hawaiian = {				-- The item ID
				name = "Honolulu Hawaiian",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			pizza_deluxe = {				-- The item ID
				name = "Pizza Deluxe",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			cali_chicken_bacon = {				-- The item ID
				name = "Cali Chicken Bacon",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			buffalo_chicken = {				-- The item ID
				name = "Buffalo Chicken",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			ultimate_pepperoni = {				-- The item ID
				name = "Ultimate Pepperoni",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			memphis_bbq_chicken = {				-- The item ID
				name = "Memphis BBQ Chicken",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			wisconsin_cheese = {				-- The item ID
				name = "Wisconsin 6 Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			spinach_feta = {				-- The item ID
				name = "Spinach & Feta",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},

			chicken_habanero = {				-- The item ID
				name = "Chicken Habanero",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			mediterranean_veggie = {				-- The item ID
				name = "Mediterranean Veggie",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			philly_cheese_sandwich = {				-- The item ID
				name = "Philly Cheese Sandwich",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			chicken_bacon_ranch = {				-- The item ID
				name = "Chicken Bacon Ranch",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			italian_sandwich = {				-- The item ID
				name = "Italian Sandwich",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},

			p_chicken_alfredo = {				-- The item ID
				name = "Chicken Alfredo",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			italian_sausage_marinara = {				-- The item ID
				name = "Italian Sausage Marinara",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			chicken_carbonara = {				-- The item ID
				name = "Chicken Carbonara",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			pasta_primavera = {				-- The item ID
				name = "Pasta Primavera",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},

			d_coca_cola = {				-- The item ID
				name = "Coca Cola",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			d_dr_pepper = {				-- The item ID
				name = "Dr Pepper",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			d_fanta_orange = {				-- The item ID
				name = "Fanta Orange",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			d_fruit_punch = {				-- The item ID
				name = "Fruit Punch",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			d_sprite = {				-- The item ID
				name = "Sprite",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Pizza", icon = 'fa-link'},
			[1] = {name = "Sandwich", icon = 'fa-link'},
			[2] = {name = "Pasta", icon = 'fa-link'},
			[3] = {name = "Drinks", icon = 'fa-link'},
		}
	}
}