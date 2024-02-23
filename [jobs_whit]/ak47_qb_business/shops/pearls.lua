Config.Shop['pearls'] = { -- job name
	blip = {enable = true, name = 'Pearls', sprite = 267, color = 0, size = 1.2, radius = 0.0, radius_color = 4},
	boss_action = vector3(-1837.34, -1178.89, 19.22),
	management = vector3(-1846.01, -1198.96, 14.33),
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
		menu = vector3(-1839.68, -1186.24, 14.32),
		data = {
			gourmet_double_burger = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			catfish = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			steak_and_lobster_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			crab_legs_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			shrimp_alfredo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			shrimp_alfredo = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_caesar_salad = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			glazed_salmon = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			tilapia_fish_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			shells_clam_chowder = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			lobster_bisque = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			shrimp_and_crab_dip = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			crab_cakes = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			upeel_shrimp = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			fried_mushrooms = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			oysters_half_shell = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			tropical_chicken_salad = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			side_caesar_salad = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			salmon_caesar_salad = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			shrimp_pasta = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			baby_lobster_pasta = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			fried_scallops = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1842.67, -1186.23, 14.33, 60.38),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1843.48, -1187.88, 14.33, 60.73),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1841.13, -1183.6, 14.33, 57.1),  delay = 60, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
			pearls_coffee = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1837.59, -1185.37, 14.32, 244.46),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			patron_margarita = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1837.59, -1185.37, 14.32, 244.46),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			hennessy_shot = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1837.59, -1185.37, 14.32, 244.46),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			dom_perignon = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1837.59, -1185.37, 14.32, 244.46),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			ps_sprite = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1837.59, -1185.37, 14.32, 244.46),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			ps_dr_pepper = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1837.59, -1185.37, 14.32, 244.46),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			ps_coca_cola = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1837.59, -1185.37, 14.32, 244.46),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
		}
	},
	storage = {
		pos = vector4(-1838.67, -1183.76, 14.33, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(-1845.04, -1198.15, 14.33),
		vector3(-1839.5, -1186.63, 19.19)
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			pearls_coffee = {				-- The item ID
				name = "Pearls Coffee",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			patron_margarita = {				-- The item ID
				name = "Patron Margarita",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			hennessy_shot = {				-- The item ID
				name = "Hennessy Shot",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			dom_perignon = {				-- The item ID
				name = "Dom Perignon",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			ps_sprite = {				-- The item ID
				name = "Sprite",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			ps_dr_pepper = {				-- The item ID
				name = "Dr Pepper",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			ps_coca_cola = {				-- The item ID
				name = "Ccoca Cola",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},

			salmon_caesar_salad = {				-- The item ID
				name = "Salmon Caesar Salad",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			side_caesar_salad = {				-- The item ID
				name = "Side Caesar Salad",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			tropical_chicken_salad = {				-- The item ID
				name = "Tropical Chicken Salad",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			chicken_caesar_salad = {				-- The item ID
				name = "Chicken Caesar Salad",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},

			gourmet_double_burger = {				-- The item ID
				name = "Gourmet Double Burger",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			catfish = {				-- The item ID
				name = "Catfish",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			steak_and_lobster_meal = {				-- The item ID
				name = "Steak & Lobster Meal",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			crab_legs_meal = {				-- The item ID
				name = "Crab Legs Meal",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			shrimp_alfredo = {				-- The item ID
				name = "Shrimp Alfredo",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			glazed_salmon = {				-- The item ID
				name = "Glazed Salmon",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			tilapia_fish_meal = {				-- The item ID
				name = "Tilapia Fish Meal",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			shells_clam_chowder = {				-- The item ID
				name = "Shells Clam Chowder",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			lobster_bisque = {				-- The item ID
				name = "Lobster Bisque",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			shrimp_and_crab_dip = {				-- The item ID
				name = "Shrimp & Crab Dip",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			crab_cakes = {				-- The item ID
				name = "Crab Cakes",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			upeel_shrimp = {				-- The item ID
				name = "U-Peel Shrimp",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			fried_mushrooms = {				-- The item ID
				name = "Fried Mushrooms",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			oysters_half_shell = {				-- The item ID
				name = "Oysters Half Shell",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			shrimp_pasta = {				-- The item ID
				name = "Shrimp Pasta",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			baby_lobster_pasta = {				-- The item ID
				name = "Baby Lobster Pasta",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			fried_scallops = {				-- The item ID
				name = "Fried Scallops",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Foolds", icon = 'fa-link'},
			[1] = {name = "Salad", icon = 'fa-link'},
			[2] = {name = "Drinks", icon = 'fa-link'},
		}
	}
}