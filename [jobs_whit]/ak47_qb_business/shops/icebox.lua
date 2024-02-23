Config.Shop['icebox'] = { -- job name
	blip = {enable = true, name = 'IceBox', sprite = 617, color = 3, size = 1.0, radius = 0.0, radius_color = 4},
	boss_action = vector3(-1258.61, -805.02, 17.09),
	management = vector3(-1256.39, -811.44, 17.84),
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
		menu = vector3(-1257.13, -823.51, 17.1),
		data = {
			--chains
			chain_is = { 										-- reward item name
				reward = 1,										-- reward item amount
				required = {									-- required items for crafting
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'white_stone', quantity = 25, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chain_medal = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chain_ls = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'white_stone', quantity = 25, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chain_triangle = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chain_dogtag = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			chain_richman = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'diamond', quantity = 1, willremove = true},
					{item = 'platinum_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			--earings
			casino_earrings = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			diagold_earrings = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'diamond', quantity = 1, willremove = true},
					{item = 'white_stone', quantity = 15, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			diaplatinum_earrings = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
					{item = 'diamond', quantity = 1, willremove = true},
					{item = 'white_stone', quantity = 15, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			earrings_sgold = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			goldak_earrings = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'platinum_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			goldhex_earrings = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			goldstone_earrings = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'blue_stone', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			hex4you_earrings = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			hexdia_earrings = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'diamond', quantity = 1, willremove = true},
					{item = 'white_stone', quantity = 10, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			karaoke_earrings = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			platbox_earrings = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			rectdia_earrings = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'white_stone', quantity = 25, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			skull_earrings = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},

			--bracelet
			skull_bracelet = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 2, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},

			--necklace
			necklace_family = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			necklace_dogtag = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
					{item = 'pearl', quantity = 35, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.33, -823.11, 17.05, 305.72), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1252.3, -823.1, 17.05, 304.33),   delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},

			--watches
			crowex_black = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
					{item = 'watch_material', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			covgari_gold = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'watch_material', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			crowex_brown = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
					{item = 'watch_material', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			hex_gold = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'watch_material', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			kronos_black = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'watch_material', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			kronos_gold = {
				reward = 1,
				required = {
					{item = 'gold_bar', quantity = 1, willremove = true},
					{item = 'watch_material', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			pendulus_platinum = {
				reward = 1,
				required = {
					{item = 'platinum_bar', quantity = 1, willremove = true},
					{item = 'watch_material', quantity = 1, willremove = true},
				},
				steps = {
					{pos = vector4(-1254.69, -821.04, 17.1, 308.82),  delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1255.74, -825.58, 17.05, 217.16), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1254.26, -824.56, 17.05, 215.92), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
					{pos = vector4(-1260.52, -824.06, 17.1, 94.23), delay = 10, msg = 'Working...'},	-- x, y, z, heading, second, message
				}
			},
			
		}
	},
	storage = {
		pos = vector4(-1258.35, -828.68, 16.05, 217.10), 		-- x, y, z, heading
		prop = `h4_prop_h4_safe_01a`,
		items = {
			diamond = {
                name = 'Diamond',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            gold_bar = {
                name = 'Gold Bar',                        		-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            platinum_bar = {
                name = 'platinum Bar',                        	-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            watch_material = {
                name = 'Watch Material',                        -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            blue_stone = {
                name = 'Blue Stone',                        	-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            green_stone = {
                name = 'Green Stone',                        	-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            red_stone = {
                name = 'Red Stone',                        	-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            white_stone = {
                name = 'White Stone',                        	-- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
		}
	},
	sell_coords = {											-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
		vector3(-1254.03, -811.67, 17.84),
		vector3(-1255.06, -810.3, 17.84),
		vector3(-1256.11, -808.92, 17.84),
	},
	data = {
		market_items = {					-- Here you configure the items definitions
			chain_is = {					-- The item ID
				name = "Chain IS",			-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true,
			},
			chain_medal = {					-- The item ID
				name = "Chain Medal",		-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true,
			},
			chain_ls = {					-- The item ID
				name = "Chain LS",			-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true,
			},
			chain_richman = {				-- The item ID
				name = "Chain Richman",			-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true,
			},
			chain_dogtag = {				-- The item ID
				name = "Chain Dogtag",			-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true,
			},
			chain_triangle = {				-- The item ID
				name = "Chain Triangle",			-- The item display name
				page = 0,					-- Set on which page this item will appear
				process = true,
			},

			necklace_family = {				-- The item ID
				name = "Necklace Family",	-- The item display name
				page = 1,					-- Set on which page this item will appear,
				process = true,
			},
			necklace_dogtag = {				-- The item ID
				name = "Necklace Dogtag",	-- The item display name
				page = 1,					-- Set on which page this item will appear,
				process = true,
			},

			casino_earrings = {				-- The item ID
				name = "Casino Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			diagold_earrings = {			-- The item ID
				name = "Diagold Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			diaplatinum_earrings = {			-- The item ID
				name = "Diaplatinum Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			earrings_sgold = {				-- The item ID
				name = "Earrings SGold",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			goldak_earrings = {				-- The item ID
				name = "GoldAK Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			goldhex_earrings = {			-- The item ID
				name = "GoldHex Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			goldstone_earrings = {			-- The item ID
				name = "Goldstone Earrings",-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			hex4you_earrings = {			-- The item ID
				name = "Hex4You Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			hexdia_earrings = {				-- The item ID
				name = "HexDia Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			karaoke_earrings = {			-- The item ID
				name = "Karaoke Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			platbox_earrings = {			-- The item ID
				name = "Platbox Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			rectdia_earrings = {				-- The item ID
				name = "RectDia Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},
			skull_earrings = {				-- The item ID
				name = "Skull Earrings",	-- The item display name
				page = 2,					-- Set on which page this item will appear
				process = true,
			},

			covgari_gold = {				-- The item ID
				name = "Covgari Gold",		-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true,
			},
			crowex_black = {				-- The item ID
				name = "Crowex Black",		-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true,
			},
			crowex_brown = {				-- The item ID
				name = "Crowex Brown",		-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true,
			},
			hex_gold = {					-- The item ID
				name = "Hex Gold",			-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true,
			},
			kronos_black = {				-- The item ID
				name = "Kronos Black",		-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true,
			},
			kronos_gold = {					-- The item ID
				name = "Kronos Gold",		-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true,
			},
			pendulus_platinum = {			-- The item ID
				name = "Pendulus Platinum",	-- The item display name
				page = 3,					-- Set on which page this item will appear
				process = true,
			},

			skull_bracelet = {				-- The item ID
				name = "Skull Bracelet",	-- The item display name
				page = 4,					-- Set on which page this item will appear
				process = true,
			},
		},
		pagination = {						-- Create pages to your market items (max 10 pages)
			[0] = {name = "Chains", icon = 'fa-link'},
			[1] = {name = "Necklace", icon = 'fa-gem'},
			[2] = {name = "Earrings", icon = 'fa-assistive-listening-systems'},
			[3] = {name = "Watches", icon = 'fa-clock'},
			[4] = {name = "Breshlet", icon = 'fa-hand-sparkles'},
		},
	}
}