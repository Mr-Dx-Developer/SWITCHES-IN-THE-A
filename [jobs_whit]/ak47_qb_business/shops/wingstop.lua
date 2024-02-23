Config.Shop['wingstop'] = { -- job name
	blip = {enable = true, name = 'Wingstop', sprite = 365, color = 25, size = 1.2, radius = 0.0, radius_color = 4},
	boss_action = vector3(1244.08, -352.53, 69.18),
	management = vector3(1249.18, -358.74, 69.18),
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
		menu = vector3(1251.7, -355.38, 69.18),
		data = {
			boneless_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			buffalo_ranch_fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cajun_fried_corn = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cheese_fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			large_thigh_bites = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			louisiana_voodoo_fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			seasoned_fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},

			bites_group_pack = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 3, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			boneless_meal_deal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			classic_wings_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},
				}
			},
			crispy_tender_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},
				}
			},
			crispy_tenders = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},
				}
			},
			group_pack = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 3, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			hundred_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			meal_for_two = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},
				}
			},
			party_pack = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 4, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},
				}
			},
			tender_pack = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 4, willremove = true},
					{item = 'fresh_baked_rolls', quantity = 4, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},
				}
			},
			thigh_bites_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},
				}
			},
			thirty_crispy_tenders = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			triple_meal_deal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			wing_combo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'wingstop_dips', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},
				}
			},

			chicken_and_waffles = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
 					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_caesar_salad = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
 					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			garlic_parm_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
 					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			hot_chicken_wrap = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
 					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			korean_q_wings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
 					
				},
				steps = {
					{pos = vector4(1250.06, -356.31, 69.18, 74.56),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(1250.01, -352.8, 69.18, 344.6),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			

			w_diet_coke = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			w_diet_pepsi = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			w_dr_pepper = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			w_ice_cola = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			w_medium_fanta_orange = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			w_medium_fanta_strawberry = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			w_medium_sprite = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			w_tango_apple = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			w_tango_orange = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(1251.99, -359.07, 69.18, 255.12),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
		}
	},
	storage = {
		pos = vector4(1253.66, -354.05, 69.18, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            cheese_sauce = {
                name = 'Cheese Sauce',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            chocolate_chunk_brownie = {
                name = 'Chocolate Chunk Brownie',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            fresh_baked_rolls = {
                name = 'Fresh Baked Rolls',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            side_of_flavor = {
                name = 'Side of Flavor',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            veggie_sticks = {
                name = 'Veggie Sticks',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            wingstop_dips = {
                name = 'Wingstop Dips',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(1249.56, -360.6, 69.18),
		vector3(1247.93, -357.22, 69.18),
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			boneless_wings = {				-- The item ID
				name = "Boneless Wings",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			buffalo_ranch_fries = {				-- The item ID
				name = "Buffalo Ranch Fries",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			cajun_fried_corn = {				-- The item ID
				name = "Cajun Fried Corn",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			cheese_fries = {				-- The item ID
				name = "Cheese Fries",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			large_thigh_bites = {				-- The item ID
				name = "Large Thigh Bites",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			louisiana_voodoo_fries = {				-- The item ID
				name = "Louisiana Voodoo Fries",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			seasoned_fries = {				-- The item ID
				name = "Seasoned Fries",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},

			bites_group_pack = {				-- The item ID
				name = "Bites Group Pack",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			boneless_meal_deal = {				-- The item ID
				name = "Boneless Meal Deal",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			classic_wings_combo = {				-- The item ID
				name = "Classic Wings Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			crispy_tender_combo = {				-- The item ID
				name = "Crispy Tender Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			crispy_tenders = {				-- The item ID
				name = "Crispy Tenders",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			group_pack = {				-- The item ID
				name = "Group Pack",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			hundred_wings = {				-- The item ID
				name = "Hundred Wings",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			meal_for_two = {				-- The item ID
				name = "Meal For Two",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			party_pack = {				-- The item ID
				name = "Party Pack",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			tender_pack = {				-- The item ID
				name = "Tender Pack",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			thigh_bites_combo = {				-- The item ID
				name = "Thigh Bites Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			thirty_crispy_tenders = {				-- The item ID
				name = "Thirty Crispy Tenders",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			triple_meal_deal = {				-- The item ID
				name = "Triple Meal Deal",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			wing_combo = {				-- The item ID
				name = "Wing Combo",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},

			chicken_and_waffles = {				-- The item ID
				name = "Chicken & Waffles",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			chicken_caesar_salad = {				-- The item ID
				name = "Chicken Caesar Salad",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			garlic_parm_wings = {				-- The item ID
				name = "Garlic Parm Wings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			hot_chicken_wrap = {				-- The item ID
				name = "Hot Chicken Wrap",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			korean_q_wings = {				-- The item ID
				name = "Korean Q Wings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},

			cheese_sauce = {				-- The item ID
				name = "Cheese Sauce",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			chocolate_chunk_brownie = {				-- The item ID
				name = "Chocolate Chunk Brownie",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			fresh_baked_rolls = {				-- The item ID
				name = "Fresh Baked Rolls",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			side_of_flavor = {				-- The item ID
				name = "Side Of Flavor",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			veggie_sticks = {				-- The item ID
				name = "Veggie Sticks",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			wingstop_dips = {				-- The item ID
				name = "Wingstop Dips",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},

			w_diet_coke = {				-- The item ID
				name = "Diet Coke",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			w_diet_pepsi = {				-- The item ID
				name = "Diet Pepsi",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			w_dr_pepper = {				-- The item ID
				name = "Dr Pepper",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			w_ice_cola = {				-- The item ID
				name = "Ice Cola",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			w_medium_fanta_orange = {				-- The item ID
				name = "Fanta Orange",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			w_medium_fanta_strawberry = {				-- The item ID
				name = "Fanta Strawberry",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			w_medium_sprite = {				-- The item ID
				name = "Medium Sprite",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			w_tango_apple = {				-- The item ID
				name = "Tango Apple",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			w_tango_orange = {				-- The item ID
				name = "Tango Orange",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true
			},
			
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Pack", icon = 'fa-link'},
			[1] = {name = "Combo", icon = 'fa-link'},
			[2] = {name = "Fast Food", icon = 'fa-link'},
			[3] = {name = "Extra", icon = 'fa-link'},
			[4] = {name = "Drinks", icon = 'fa-link'},
		}
	}
}