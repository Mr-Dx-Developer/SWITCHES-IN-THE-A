Config.Shop['popeyes'] = { -- job name
	blip = {enable = true, name = 'Popeyes', sprite = 384, color = 0, size = 0.7, radius = 0.0, radius_color = 4},
	boss_action = vector3(1305.2201, -748.1941, 65.8030),
	management = vector3(1305.0616, -752.1465, 65.8030),
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
		menu = vector3(1306.7278, -749.7940, 65.8030),
		data = {
			classic_chicken_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			homestyle_mac_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mashed_potatoes = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mild_tenders_box = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			red_beans_rice = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			regular_cajun_rice = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			regular_coleslaw = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			strawberry_cheesecake_pie = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			signature_chicken_box = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cajun_fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			carte_biscuit = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cinnamon_apple_pie = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bigger_family_feast = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_bundle = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_family_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mac_cheese_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mild_tenders_box = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			mild_tenders_bundle = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			nuggets_kids_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			nuggets_la_carte = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			nuggets_medium_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			popcorn_shrimp = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			surf_turf_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			tenders_family_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			tenders_medium_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1308.8262, -751.1982, 65.8030, 248.4864),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1309.1637, -749.1093, 65.8030, 66.7182),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			

			chilled_premium_lemonade = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			md_ginger_ale = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			md_seltzer_water = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			medium_coca_cola = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			medium_diet_coke = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			medium_fanta_orange = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			medium_fanta_strawberry = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			medium_hawaiian_punch = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			medium_sprite = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			medium_sweet_tea = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			medium_tropicana_lemonade = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			strawberry_lemonade = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1312.6794, -750.1871, 65.8031, 340.0194),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
		}
	},
	storage = {
		pos = vector4(1312.6096, -751.4229, 65.8030, 164.4639), 		-- x, y, z, heading
		prop = nil,
		items = {
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(1302.4680, -750.7112, 65.8030),
		vector3(1303.2443, -749.2151, 65.8030),
		vector3(1304.2212, -747.7680, 65.8030)
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			classic_chicken_sandwich = {				-- The item ID
				name = "Classic Chicken Sandwich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			homestyle_mac_cheese = {				-- The item ID
				name = "Homestyle Mac Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			mashed_potatoes = {				-- The item ID
				name = "Mashed Potatoes",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			mild_tenders_box = {				-- The item ID
				name = "Mild Tenders Box",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			red_beans_rice = {				-- The item ID
				name = "Red Beans Rice",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			regular_cajun_rice = {				-- The item ID
				name = "Regular Cajun Rice",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			regular_coleslaw = {				-- The item ID
				name = "Regular Coleslaw",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			strawberry_cheesecake_pie = {				-- The item ID
				name = "Strawberry Cheesecake Pie",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			signature_chicken_box = {				-- The item ID
				name = "Signature Chicken Box",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			cajun_fries = {				-- The item ID
				name = "Cajun Fries",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			carte_biscuit = {				-- The item ID
				name = "Carte Biscuit",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			cinnamon_apple_pie = {				-- The item ID
				name = "Cinnamon Apple Pie",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			
			bigger_family_feast = {				-- The item ID
				name = "Bigger Family Feast",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			chicken_bundle = {				-- The item ID
				name = "Chicken Bundle",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			chicken_family_meal = {				-- The item ID
				name = "Chicken Family Meal",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			mac_cheese_meal = {				-- The item ID
				name = "Mac Cheese Meal",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			mild_tenders_box = {				-- The item ID
				name = "Mild Tenders Box",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			mild_tenders_bundle = {				-- The item ID
				name = "Mild Tenders Bundle",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			nuggets_kids_meal = {				-- The item ID
				name = "Nuggets Kids Meal",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			nuggets_la_carte = {				-- The item ID
				name = "Nuggets LA Carte",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			nuggets_medium_combo = {				-- The item ID
				name = "Nuggets Medium Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			popcorn_shrimp = {				-- The item ID
				name = "Popcorn Shrimp",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			surf_turf_combo = {				-- The item ID
				name = "Surf Turf Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			tenders_family_meal = {				-- The item ID
				name = "Tenders Family Meal",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			tenders_medium_combo = {				-- The item ID
				name = "Tenders Medium Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},

			chilled_premium_lemonade = {				-- The item ID
				name = "Chilled Premium Lemonade",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			md_ginger_ale = {				-- The item ID
				name = "Md Ginger Ale",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			md_seltzer_water = {				-- The item ID
				name = "Md Seltzer Water",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			medium_coca_cola = {				-- The item ID
				name = "Coca Cola",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			medium_diet_coke = {				-- The item ID
				name = "Diet Coke",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			medium_fanta_orange = {				-- The item ID
				name = "Fanta Orange",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			medium_fanta_strawberry = {				-- The item ID
				name = "Fanta Strawberry",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			medium_hawaiian_punch = {				-- The item ID
				name = "Hawaiian Punch",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			medium_sprite = {				-- The item ID
				name = "Sprite",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			medium_sweet_tea = {				-- The item ID
				name = "Sweet Tea",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			medium_tropicana_lemonade = {				-- The item ID
				name = "Tropicana Lemonade",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			strawberry_lemonade = {				-- The item ID
				name = "Strawberry Lemonade",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Food", icon = 'fa-link'},
			[1] = {name = "Combo", icon = 'fa-link'},
			[2] = {name = "Drinks", icon = 'fa-link'},
		}
	}
}