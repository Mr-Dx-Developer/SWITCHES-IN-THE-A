---------------------------------------------------------------------------------------------
-------------------PLEASE CHECK OUR VIDEO TO KNOW HOW OUR SCRIPT WORKS-----------------------
--- Here's all the function called for the targetting system (third eye) feel free to      --
--- modify this top fit your own targetting system (if you dont use ox_target or qb-target --
---            https://patamods.gitbook.io/patamods-documentation/scripts/baby-script      --
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

if string.lower(Targetting) == "ox_target" then
	function targetAddModel(model,option)
		local targetID = 0
		targetID = exports.ox_target:addModel(model,option)
		return targetID
	end
	
	function targetAddGlobalVehicle(option)
		local targetID = 0
		targetID = exports.ox_target:addGlobalVehicle(option)
		return targetID
	end
	
	function targetAddGlobalPlayer(option)
		local targetID = 0
		targetID = exports.ox_target:addGlobalPlayer(option)
		return targetID
	end
end


if string.lower(Targetting) == "qb_target" then
	function targetAddModel(model,option)
		-- print("option : "..tostring(option))
		local targetID = 0
		local options = {}
		for k,v in pairs(option) do
			-- print("k : "..tostring(k).." v: "..tostring(v.event))
			options[k] = v
			if v.serverEvent then
				options[k].type = "server"
				options[k].event = v.serverEvent 
			else
				options[k].type = "client"
				options[k].event = v.event 
			end
		end
		-- print("target model : "..tostring(model))
		targetID = exports['qb-target']:AddTargetModel({model},{ -- The specified entity number
			options = options,
			distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
		  })
		return targetID
	end
	
	function targetAddGlobalVehicle(option)
		print("qb target AddGlobalVehicle")
		local targetID = 0
		local options = {}
		local currentBones = 0
		for k,v in pairs(option) do
			currentBones = v.door.door
			-- print("currentBones : "..tostring(currentBones).." v: "..tostring(v.name).." - "..tostring(v.label))
			-- print("k : "..tostring(k).." v: "..tostring(v))
			options[k] = v
			if v.serverEvent then
				options[k].type = "server"
				options[k].event = v.serverEvent 
				options[k].targeticon = "fa-solid fa-baby"
				options[k].num = k
			else
				options[k].type = "client"
				options[k].event = v.event 
				options[k].targeticon = "fa-solid fa-baby"
				options[k].num = k
			end
		end
		
		targetID = exports['qb-target']:AddTargetBone(currentBones,{ -- The specified entity number
			options = options,
			distance = 4.0, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
		  })
		return targetID
	end
	
	function targetAddGlobalPlayer(option)
		local targetID = 0
		local options = {}
		for k,v in pairs(option) do
			options[k] = v
			if v.serverEvent then
				options[k].type = "server"
				options[k].event = v.serverEvent 
			else
				options[k].type = "client"
				options[k].event = v.event 
			end
		end
		targetID = exports['qb-target']:AddGlobalPlayer({ -- The specified entity number
			options = options,
			distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
		  })
		return targetID
	end
	
	
end