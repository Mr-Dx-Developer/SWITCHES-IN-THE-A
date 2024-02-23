Config.Shop['burgershot'] = { -- job name
	blip = {enable = true, name = 'Burgershot', sprite = 536, color = 1, size = 1.0, radius = 0.0, radius_color = 4},
	boss_action = vector3(-1196.71, -891.91, 14.0),
	management = vector3(-1194.04, -895.66, 14.0),
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
		menu =vector3(-1196.96, -900.15, 14.0),
		data = {
			bacon_double_cheeseburger = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					--{item = 'water', quantity = 1, willremove = false}, 
					--{item = 'bread', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bacon_ham_sausage = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bacon_king = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			big_fish = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_chicken_jr = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_hamburger = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			buttermilk_biscuit = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			deluxe_chicken_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			double_cheeseburger = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			double_sausage_biscuit = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			double_sausage_croissanwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			ham_egg_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			original_chicken_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			rodeo_burger = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sausage_croissanwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			spicy_deluxe_sandwich = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			texas_double_whopper = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			whopper_with_cheese = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},

			bs_mozzarella_sticks = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cheesy_tots = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chicken_nuggets = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			egg_normous_burrito = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			french_toast_sticks = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			jalapeno_cheddar_bites = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			small_classic_fries = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			small_hash_browns = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			small_onion_rings = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			soft_serve_cone = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			soft_serve_cup = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			sundae_pie = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			

			cheeseburger_king_jr = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'applesauce', quantity = 1, willremove = true}, 
					{item = 'sun_apple_juice', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			croissanwich_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'bs_cafe_decaf', quantity = 1, willremove = true}, 
					{item = 'chicken_nuggets', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			family_bundle_classic = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'small_classic_fries', quantity = 2, willremove = true}, 
					{item = 'sundae_pie', quantity = 2, willremove = true},
					{item = 'bs_coca_cola', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			hamburger_king_jr = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'applesauce', quantity = 1, willremove = true}, 
					{item = 'sun_apple_juice', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			loaded_croissanwich_meal = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'chicken_nuggets', quantity = 1, willremove = true}, 
					{item = 'bs_orange_juice', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			nuggets_king_jr = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'chicken_nuggets', quantity = 1, willremove = true}, 
					{item = 'sun_apple_juice', quantity = 1, willremove = true},
					{item = 'applesauce', quantity = 1, willremove = true},
				},	
				steps = {

				}
			},
			pancake_sausage_platter = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting

				},
				steps = {
					{pos = vector4(-1198.79, -901.74, 14.0, 124.92),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1200.49, -899.19, 14.0, 122.13),  delay = 30, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			


			barqs_diet_beer = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bottle_diet_coke = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_barqs_beer = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_cafe_decaf = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_coca_cola = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_diet_coke = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_dr_pepper = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_fanta_orange = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_fruit_punch = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_iced_tea = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_sprite = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_sprite_zero = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			bs_yello_mello = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chocolate_cookie_shake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chocolate_shake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			cookie_shake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			pink_lemonade = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			plain_iced_coffee = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			strawberry_shake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			vanilla_shake = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					
				},
				steps = {
					{pos = vector4(-1198.58, -895.46, 14.0, 123.95),  delay = 20, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
		}
	},
	storage = {
		pos = vector4(-1203.1, -895.42, 14.0, 0.0), 		-- x, y, z, heading
		prop = nil,
		items = {
            applesauce = {
                name = 'Applesauce',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            bs_orange_juice = {
                name = 'Orange Juice',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            sun_apple_juice = {
                name = 'Orange Juice',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(-1195.33, -890.82, 14.0),
		vector3(-1194.07, -892.84, 14.0),
		vector3(-1192.79, -894.75, 14.0)
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			bacon_double_cheeseburger = {				-- The item ID
				name = "Bacon Double Cheeseburger",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			bacon_ham_sausage = {				-- The item ID
				name = "Fully Loaded Bacon Ham Sausage",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			big_fish = {				-- The item ID
				name = "Big Fish",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			bs_chicken_jr = {				-- The item ID
				name = "Chicken Jr.",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			bs_hamburger = {				-- The item ID
				name = "Hamburger",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			buttermilk_biscuit = {				-- The item ID
				name = "Fully Loaded Buttermilk",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			deluxe_chicken_sandwich = {				-- The item ID
				name = "Ch King Deluxe Chicken Sandwich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			double_cheeseburger = {				-- The item ID
				name = "Double Cheeseburger",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			double_sausage_biscuit = {				-- The item ID
				name = "Double Sausage, Egg, & Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			double_sausage_croissanwich = {				-- The item ID
				name = "Double Sausage, Egg, & Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			ham_egg_cheese = {				-- The item ID
				name = "Ham, Egg, & Cheese CroissanWich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			original_chicken_sandwich = {				-- The item ID
				name = "Original Chicken Sandwich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			rodeo_burger = {				-- The item ID
				name = "Rodeo Burger",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			sausage_croissanwich = {				-- The item ID
				name = "Sausage, Egg, & Cheese CroissanWich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			spicy_deluxe_sandwich = {				-- The item ID
				name = "Spicy Ch King Deluxe Sandwich",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			texas_double_whopper = {				-- The item ID
				name = "Texas Double Whopper",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},
			whopper_with_cheese = {				-- The item ID
				name = "Triple Whopper with Cheese",	-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true
			},

			cheeseburger_king_jr = {				-- The item ID
				name = "Cheeseburger King Jr Meal",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			croissanwich_meal = {				-- The item ID
				name = "Sausage, Egg & Cheese Small",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			family_bundle_classic = {				-- The item ID
				name = "Family Bundle Classic",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			hamburger_king_jr = {				-- The item ID
				name = "Hamburger King Jr. Meal",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			loaded_croissanwich_meal = {				-- The item ID
				name = "Bacon, Sausage & Ham Meal Small",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			nuggets_king_jr = {				-- The item ID
				name = "Chicken Nuggets King Jr Meal",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},
			pancake_sausage_platter = {				-- The item ID
				name = "Pancake & Sausage Platter",	-- The item display name
				page = 1,					-- Set on which page this item will appear
				process = true
			},

			bs_mozzarella_sticks = {				-- The item ID
				name = "Mozzarella Sticks",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			cheesy_tots = {				-- The item ID
				name = "Cheesy Tots",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			chicken_fries = {				-- The item ID
				name = "9 PC Chicken Fries",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			chicken_nuggets = {				-- The item ID
				name = "Chicken Nuggets",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			egg_normous_burrito = {				-- The item ID
				name = "Egg Normous Burrito",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			french_toast_sticks = {				-- The item ID
				name = "3 French Toast Sticks",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			jalapeno_cheddar_bites = {				-- The item ID
				name = "Jalapeno Cheddar Bites",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			small_classic_fries = {				-- The item ID
				name = "Small Classic Fries",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			small_hash_browns = {				-- The item ID
				name = "Small Hash Browns",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			small_onion_rings = {				-- The item ID
				name = "Small Onion Rings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			soft_serve_cone = {				-- The item ID
				name = "Soft Serve Cone",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			soft_serve_cup = {				-- The item ID
				name = "Soft Serve Cup",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			sundae_pie = {				-- The item ID
				name = "HERSHEYS Sundae Pie",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true
			},
			sun_apple_juice = {				-- The item ID
				name = "Capri Sun Apple Juice",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = false
			},
			bs_orange_juice = {				-- The item ID
				name = "Capri Sun Apple Juice",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = false
			},
			

			barqs_diet_beer = {				-- The item ID
				name = "Medium Diet Barqs Root Beer",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bottle_diet_coke = {				-- The item ID
				name = "20oz Bottle Diet Coke",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_barqs_beer = {				-- The item ID
				name = "Medium Barqs Root Beer",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_cafe_decaf = {				-- The item ID
				name = "Medium BK Cafe Decaf",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_coca_cola = {				-- The item ID
				name = "Medium Coca-Cola",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_diet_coke = {				-- The item ID
				name = "Medium Diet Coke",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_dr_pepper = {				-- The item ID
				name = "Medium Dr. Pepper",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_fanta_orange = {				-- The item ID
				name = "Medium Fanta Orange",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_fruit_punch = {				-- The item ID
				name = "Medium Hi-C Fruit Punch",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_iced_tea = {				-- The item ID
				name = "Medium Sweetened Iced Tea",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_sprite = {				-- The item ID
				name = "Medium Sprite",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_sprite_zero = {				-- The item ID
				name = "Medium Sprite Zero",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			bs_yello_mello = {				-- The item ID
				name = "Medium Mello Yello",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			chocolate_cookie_shake = {				-- The item ID
				name = "Chocolate OREO Cookie Shake",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			chocolate_shake = {				-- The item ID
				name = "Chocolate Shake",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			cookie_shake = {				-- The item ID
				name = "OREO Cookie Shake",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			pink_lemonade = {				-- The item ID
				name = "Medium Hi-C Pink Lemonade",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			plain_iced_coffee = {				-- The item ID
				name = "Plain Iced Coffee Medium",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			strawberry_shake = {				-- The item ID
				name = "Strawberry Shake",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
			vanilla_shake = {				-- The item ID
				name = "Vanilla Shake",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true
			},
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Burger", icon = 'fa-link'},
			[1] = {name = "Combo", icon = 'fa-link'},
			[2] = {name = "Others", icon = 'fa-link'},
			[3] = {name = "Drinks", icon = 'fa-link'},
		}
	}
}