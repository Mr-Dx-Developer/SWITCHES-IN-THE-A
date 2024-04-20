---------------------------------------------------------------------------------------------
-------------------PLEASE CHECK OUR VIDEO TO KNOW HOW OUR SCRIPT WORKS-----------------------
---               Here's all the data related to baby model available and positionning     --
---  you can edit this if you want to add your own baby props model, just follow the same  --
---           pattern as below, further explanation will be available on discord           --
---            https://patamods.gitbook.io/patamods-documentation/scripts/baby-script      --
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------


doorList = {
	{door = "door_pside_r"	, seat = "seat_pside_r", doorIndex = 3},
	{door = "door_dside_r"	, seat = "seat_dside_r", doorIndex = 2},
	{door = "door_pside_f"	, seat = "seat_pside_f", doorIndex = 1},
	{door = "boot"	, seat = "boot", doorIndex = 5},
}




babyList = {
	{	model = "pata_bear",
		uiname= "Bear",
		hash = `pata_bear`, 
		pickUp = {
			offset = {x=-0.08, y=0.11, z=-0.07},
		    rotOffset = {x=25.0, y=-44.0, z=-115.0}
		},
		pata_couffin = {
			[1] = { 
				offset = {x=-0.0,y=0.05,z=0.05}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_couffin2 = {
			[1] = { 
				offset = {x=0.0,y=0.0,z=0.1}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller = {
			[1] = { 
				offset = {x=0.0,y=-0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller2 = {
			[1] = { 
				offset = {x=0,y=0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller4 = {
			[1] = { 
				offset = {x=-0.05,y=0.0,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller5 = {
			[1] = { 
				offset = {x=0.0,y=-0.17,z=0.75}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller6 = {
			[1] = { 
				offset = {x=0.27,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			},
			[2] = { 
				offset = {x=-0.34,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
	},
	{	model = "pata_bear2",
		uiname= "Bear 2",
		hash = `pata_bear2`, 
		pickUp = {
			offset = {x=-0.08, y=0.11, z=-0.07},
		    rotOffset = {x=25.0, y=-44.0, z=-115.0}
		},
		pata_couffin = {
			[1] = { 
				offset = {x=-0.0,y=0.05,z=0.05}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_couffin2 = {
			[1] = { 
				offset = {x=0.0,y=0.0,z=0.1}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller = {
			[1] = { 
				offset = {x=0.0,y=-0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller2 = {
			[1] = { 
				offset = {x=0,y=0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller4 = {
			[1] = { 
				offset = {x=-0.05,y=0.0,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller5 = {
			[1] = { 
				offset = {x=0.0,y=-0.17,z=0.75}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller6 = {
			[1] = { 
				offset = {x=0.27,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			},
			[2] = { 
				offset = {x=-0.34,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
	},
	{	model = "pata_bear3",
		uiname= "Bear 3",
		hash = `pata_bear3`, 
		pickUp = {
			offset = {x=-0.08, y=0.11, z=-0.07},
		    rotOffset = {x=25.0, y=-44.0, z=-115.0}
		},
		pata_couffin = {
			[1] = { 
				offset = {x=-0.0,y=0.05,z=0.05}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_couffin2 = {
			[1] = { 
				offset = {x=0.0,y=0.0,z=0.1}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller = {
			[1] = { 
				offset = {x=0.0,y=-0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller2 = {
			[1] = { 
				offset = {x=0,y=0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller4 = {
			[1] = { 
				offset = {x=-0.05,y=0.0,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller5 = {
			[1] = { 
				offset = {x=0.0,y=-0.17,z=0.75}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller6 = {
			[1] = { 
				offset = {x=0.27,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			},
			[2] = { 
				offset = {x=-0.34,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
	},
	{	model = "pata_bear4",
		uiname= "Bear 4",
		hash = `pata_bear4`, 
		pickUp = {
			offset = {x=-0.08, y=0.11, z=-0.07},
		    rotOffset = {x=25.0, y=-44.0, z=-115.0}
		},
		pata_couffin = {
			[1] = { 
				offset = {x=-0.0,y=0.05,z=0.05}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_couffin2 = {
			[1] = { 
				offset = {x=0.0,y=0.0,z=0.1}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller = {
			[1] = { 
				offset = {x=0.0,y=-0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller2 = {
			[1] = { 
				offset = {x=0,y=0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller4 = {
			[1] = { 
				offset = {x=-0.05,y=0.0,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller5 = {
			[1] = { 
				offset = {x=0.0,y=-0.17,z=0.75}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller6 = {
			[1] = { 
				offset = {x=0.27,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			},
			[2] = { 
				offset = {x=-0.34,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
	},
	
		{	model = "pata_bear5",
		uiname= "Bear 5", 
		hash = `pata_bear5`, 
		pickUp = {
			offset = {x=-0.08, y=0.11, z=-0.07},
		    rotOffset = {x=25.0, y=-44.0, z=-115.0}
		},
		pata_couffin = {
			[1] = { 
				offset = {x=-0.0,y=0.05,z=0.05}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_couffin2 = {
			[1] = { 
				offset = {x=0.0,y=0.0,z=0.1}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller = {
			[1] = { 
				offset = {x=0.0,y=-0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller2 = {
			[1] = { 
				offset = {x=0,y=0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller4 = {
			[1] = { 
				offset = {x=-0.05,y=0.0,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller5 = {
			[1] = { 
				offset = {x=0.0,y=-0.17,z=0.75}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller6 = {
			[1] = { 
				offset = {x=0.27,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			},
			[2] = { 
				offset = {x=-0.34,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
	},
	{	model = "pata_bear6",
		uiname= "Bear 6", 
		hash = `pata_bear6`, 
		pickUp = {
			offset = {x=-0.08, y=0.11, z=-0.07},
		    rotOffset = {x=25.0, y=-44.0, z=-115.0}
		},
		pata_couffin = {
			[1] = { 
				offset = {x=-0.0,y=0.05,z=0.05}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_couffin2 = {
			[1] = { 
				offset = {x=0.0,y=0.0,z=0.1}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller = {
			[1] = { 
				offset = {x=0.0,y=-0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller2 = {
			[1] = { 
				offset = {x=0,y=0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller4 = {
			[1] = { 
				offset = {x=-0.05,y=0.0,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller5 = {
			[1] = { 
				offset = {x=0.0,y=-0.17,z=0.75}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller6 = {
			[1] = { 
				offset = {x=0.27,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			},
			[2] = { 
				offset = {x=-0.34,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
	},
	{	model = "pata_bear7", 
		uiname= "Bear 7",
		hash = `pata_bear7`, 
		pickUp = {
			offset = {x=-0.08, y=0.11, z=-0.07},
		    rotOffset = {x=25.0, y=-44.0, z=-115.0}
		},
		pata_couffin = {
			[1] = { 
				offset = {x=-0.0,y=0.05,z=0.05}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_couffin2 = {
			[1] = { 
				offset = {x=0.0,y=0.0,z=0.1}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller = {
			[1] = { 
				offset = {x=0.0,y=-0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller2 = {
			[1] = { 
				offset = {x=0,y=0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller4 = {
			[1] = { 
				offset = {x=-0.05,y=0.0,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller5 = {
			[1] = { 
				offset = {x=0.0,y=-0.17,z=0.75}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller6 = {
			[1] = { 
				offset = {x=0.27,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			},
			[2] = { 
				offset = {x=-0.34,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
	},
	{	model = "pata_bear8", 
		uiname= "Bear 8",
		hash = `pata_bear8`, 
		pickUp = {
			offset = {x=-0.08, y=0.11, z=-0.07},
		    rotOffset = {x=25.0, y=-44.0, z=-115.0}
		},
		pata_couffin = {
			[1] = { 
				offset = {x=-0.0,y=0.05,z=0.05}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_couffin2 = {
			[1] = { 
				offset = {x=0.0,y=0.0,z=0.1}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller = {
			[1] = { 
				offset = {x=0.0,y=-0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller2 = {
			[1] = { 
				offset = {x=0,y=0.1,z=0.7}, 
				rotOffset = {x=0,y=0,z=0}
			}
		},
		pata_stroller4 = {
			[1] = { 
				offset = {x=-0.05,y=0.0,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller5 = {
			[1] = { 
				offset = {x=0.0,y=-0.17,z=0.75}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
		pata_stroller6 = {
			[1] = { 
				offset = {x=0.27,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			},
			[2] = { 
				offset = {x=-0.34,y=-0.10,z=0.8}, 
				rotOffset = {x=-10.0,y=15.0,z=5.0}
			}
		},
	},
}


----------------------------------------------------------------------------------

--						COUFFIN

----------------------------------------------------------------------------------

couffinList = {
	{	model = "pata_couffin", 
		uiname= "Car Seat",
		hash = `pata_couffin`,  
		pickUp = {
			offset = {x=-0.07, y=0.34, z=-0.35},
		    rotOffset = {x=-41.0,  y=15.0, z=222.0}
		},
		seatOffset = {
			offset 		= {x=0.0, y=0.0, z=0.20},
			rotOffset 	= {x=0.0,  y=0.0, z=0.0}
		},
	},
	{	model = "pata_couffin2", 
		uiname= "Car Seat 2",
		hash = `pata_couffin2`,  
		pickUp = {
			offset = {x=-0.07, y=0.34, z=-0.35},
		    rotOffset = {x=-41.0,  y=15.0, z=222.0}
		},
		seatOffset = {
			offset 		= {x=0.0, y=0.0, z=0.1},
			rotOffset 	= {x=0.0,  y=0.0, z=0.0}
		},
	},
}


strollerList = {
	{	model = "pata_stroller", 
		uiname= "Stroller",
		hash = `pata_stroller`,  
		pickUp = {
			offset = {x=0.85, y=0.23, z=-0.92},
		    rotOffset = {x=-8.0,  y=-14.0, z=79.0}
		}
	},
	{	model = "pata_stroller2", 
		uiname= "Stroller 2",
		hash = `pata_stroller2`,  
		pickUp = {
			offset = {x=0.83, y=0.25, z=-0.84},
		    rotOffset = {x=-8.0,  y=-14.0, z=79.0}
		}
	},
	{	model = "pata_stroller4", 
		uiname= "Stroller 4",
		hash = `pata_stroller4`,  
		pickUp = {
			offset = {x=0.81, y=0.25, z=-0.91},
		    rotOffset = {x=-8.0,  y=-14.0, z=79.0}
		}
	},
	{	model = "pata_stroller5", 
		uiname= "Stroller 5",
		hash = `pata_stroller5`,  
		pickUp = {
			offset = {x=0.84, y=0.22, z=-0.91},
		    rotOffset = {x=-8.0,  y=-14.0, z=79.0}
		}
	},
	{	model = "pata_stroller6", 
		uiname= "Stroller 6",
		hash = `pata_stroller6`,  
		pickUp = {
			offset = {x=0.83, y=0.28, z=-0.92},
		    rotOffset = {x=-8.0,  y=-14.0, z=79.0}
		}
	 }
}

interactiveProps = {
	{	model = "pata_nursery", 
		hash = `pata_nursery`,  
		pata_bear = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		
		pata_bear_s2 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		
		pata_bear_s3 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		
		pata_bear_s4 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		
		pata_bear_s5 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		
		pata_bear_s6 = {
			offset = {x=0.0, y=0.0, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		
	},
	{	model = "pata_nursery2", 
		hash = `pata_nursery2`,  
		pata_bear = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.20, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	
	
	
	{	model = "pata_nursery17", 
		hash = `pata_nursery17`,  
		pata_bear = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.0, z=0.70},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
	},
	{	model = "pata_nursery18", 
		hash = `pata_nursery18`,  
		pata_bear = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.0, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
	},
	{	model = "pata_nursery19", 
		hash = `pata_nursery19`,  
		pata_bear = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear2 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear3 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear4 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear5 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear6 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear7 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear8 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear9 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear10 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear11 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear12 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear13 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear14 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear15 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear16 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear_s2 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear_s3 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear_s4 = {
			offset = {x=0.13, y=0.0, z=0.33},
		    rotOffset = {x=-45.0, y=0.0, z=90.0},
		},
		pata_bear_s5 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
		pata_bear_s6 = {
			offset = {x=0.05, y=0.0, z=0.27},
		    rotOffset = {x=-30.0, y=0.0, z=90.0},
		},
	},
	{	model = "pata_nursery20", 
		hash = `pata_nursery20`,  
		pata_bear = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear2 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear3 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear4 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear5 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear6 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear7 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear8 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear9 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear10 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear11 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear12 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear13 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear14 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear15 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear16 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear_s2 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear_s3 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear_s4 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear_s5 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
		pata_bear_s6 = {
			offset = {x=0.05, y=-0.025, z=0.35},
		    rotOffset = {x=-10.0, y=0.0, z=90.0},
		},
	},
	{	model = "pata_nursery29", 
		hash = `pata_nursery29`,  
		pata_bear = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=-0.4, z=-0.25},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	{	model = "pata_nursery37", 
		hash = `pata_nursery37`,  
		pata_bear = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.0, z=1.17},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
	},
	{	model = "pata_nursery38", 
		hash = `pata_nursery38`,  
		pata_bear = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=0.0},
		},
	},
	{	model = "pata_nursery53", 
		hash = `pata_nursery53`,  
		pata_bear = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.05, z=0.0},
		    rotOffset = {x=-25.0, y=0.0, z=180.0},
		},
	},
	{	model = "pata_nursery58", 
		hash = `pata_nursery58`,  
		pata_bear = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear2 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear3 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear4 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear5 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear6 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear7 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear8 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear9 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear10 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear11 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear12 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear13 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear14 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear15 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear16 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s2 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s3 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s4 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s5 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
		pata_bear_s6 = {
			offset = {x=-0.10, y=-0.10, z=0.5},
		    rotOffset = {x=0.0, y=0.0, z=90.0},
		},
	},
	{	model = "pata_nursery59", 
		hash = `pata_nursery59`,  
		pata_bear = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear2 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear3 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear4 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear5 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear6 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear7 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear8 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear9 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear10 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear11 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear12 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear13 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear14 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear15 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear16 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear_s2 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear_s3 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear_s4 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear_s5 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
		pata_bear_s6 = {
			offset = {x=-0.10, y=-0.10, z=0.65},
		    rotOffset = {x=0.0, y=0.0, z=270.0},
		},
	},
	{	model = "pata_toddler7", 
		hash = `pata_toddler7`,  
		pata_bear = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	{	model = "pata_toddler8", 
		hash = `pata_toddler8`,  
		pata_bear = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	{	model = "pata_toddler10", 
		hash = `pata_toddler10`,  
		pata_bear = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	{	model = "pata_toddler12", 
		hash = `pata_toddler12`,  
		pata_bear = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.20, z=0.35},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	-- correction bug "en cours du 26
	{	model = "pata_toddler26", 
		hash = `pata_toddler26`,  
		pata_bear = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.20, z=0.58},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	
	{	model = "pata_toddler42", 
		hash = `pata_toddler42`,  
		pata_bear = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3= {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.0, z=0.40},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	
	{	model = "pata_toddler45", 
		hash = `pata_toddler45`,  
		pata_bear = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.40, z=0.17},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	
	{	model = "pata_toddler46", 
		hash = `pata_toddler46`,  
		pata_bear = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear2 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear3 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear4 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear5 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear6 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear7 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear8 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear9 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear10 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear11 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear12 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear13 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear14 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear15 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear16 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear_s2 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear_s3 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear_s4 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear_s5 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
		pata_bear_s6 = {
			offset = {x=-0.50, y=0.90, z=0.93},
		    rotOffset = {x=0.0, y=0.0, z=-90.0},
		},
	},

	{	model = "pata_hospital4", 
		hash = `pata_hospital4`,  
		pata_bear = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=-0.30, z=1.15},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
	
	
	{	model = "pata_hospital54", 
		hash = `pata_hospital54`,  
		pata_bear = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=-14.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=-14.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=-14.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=-14.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=45.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=45.0, z=180.0},
		},
	},
	
	{	model = "pata_hospital56", 
		hash = `pata_hospital56`,  
		pata_bear = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear2 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear3 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear4 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear5 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=-14.0, y=0.0, z=180.0},
		},
		pata_bear6 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=-14.0, y=0.0, z=180.0},
		},
		pata_bear7 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=-14.0, y=0.0, z=180.0},
		},
		pata_bear8 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=-14.0, y=0.0, z=180.0},
		},
		pata_bear9 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear10 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear11 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear12 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear13 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear14 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear15 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear16 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		
		
		
		pata_bear_s1 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s2 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s3 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s4 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s5 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
		pata_bear_s6 = {
			offset = {x=0.0, y=0.10, z=1.0},
		    rotOffset = {x=0.0, y=0.0, z=180.0},
		},
	},
}