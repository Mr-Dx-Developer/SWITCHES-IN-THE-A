local Previewing, xenonColour, VehicleNitrous, nosColour, dutyList = {}, {}, {}, {}, {}

---==[[ SLASH COMMANDS ]]==---

	registerCommand("preview", {Loc[Config.Lan]["servfunction"].checkmods, {}, false, function(source) TriggerClientEvent("jim-mechanic:client:Preview:Menu", source) end})
	registerCommand("checkveh", {"Check Performance", {}, false, function(source) TriggerClientEvent("jim-mechanic:client:Menu", source, false) end})
	registerCommand("showodo", {"Odometer", {}, false, function(source) TriggerClientEvent("jim-mechanic:ShowOdo", source) end})
	registerCommand("checkdamage", {Loc[Config.Lan]["servfunction"].checkdamage, {}, false, function(source) TriggerClientEvent("jim-mechanic:client:Repair:Check", source, true) end})
	registerCommand("checkmods", {Loc[Config.Lan]["servfunction"].checkmods, {}, false, function(source) TriggerClientEvent("jim-mechanic:client:Menu:List", source) end})
	registerCommand("flipvehicle", {Loc[Config.Lan]["servfunction"].flipvehicle, {}, false, function(source)	TriggerClientEvent("jim-mechanic:flipvehicle", source) end})
	registerCommand("togglesound", {Loc[Config.Lan]["servfunction"].togglesound, {}, false, function(source)	TriggerClientEvent("jim-mechanic:togglesound", source) end})
	registerCommand("cleancar", {Loc[Config.Lan]["servfunction"].cleancar, {}, false, function(source) TriggerClientEvent("jim-mechanic:client:cleanVehicle", source, true) end})
	registerCommand("hood", {Loc[Config.Lan]["servfunction"].hood, {}, false, function(source) TriggerClientEvent("jim-mechanic:client:openDoor", source, 4) end})
	registerCommand("trunk", {Loc[Config.Lan]["servfunction"].trunk, {}, false, function(source) TriggerClientEvent("jim-mechanic:client:openDoor", source, 5) end})
	registerCommand("door", {Loc[Config.Lan]["servfunction"].door, {{name="0-3", help="Door ID"}}, false, function(source, args) TriggerClientEvent("jim-mechanic:client:openDoor", source, args[1]) end})
	registerCommand("seat", {Loc[Config.Lan]["servfunction"].seat, {{name="id", help="Seat ID"}}, false, function(source, args) TriggerClientEvent("jim-mechanic:seat", source, args[1]) end})


	function IsVehicleOwned(plate)
		if vehiclesOwned[plate] == true then
			return true
		else
			local result = MySQL.query.await('SELECT 1 from '..vehDatabase..' WHERE plate = ?', {plate})
			if json.encode(result) ~= "[]" then
				vehiclesOwned[plate] = true
				return true
			else
				return false
			end
		end
	end

	function GetVehicleStatus(plate)
		if VehicleStatus[plate] then return VehicleStatus[plate] else
			local status = MySQL.query.await('SELECT status FROM '..vehDatabase..' WHERE plate = ?', {plate})
			if status[1] and tostring(status[1].status) ~= "null" and tostring(status[1].status) ~= "0" and tostring(status[1].status) ~= "1" then
				status = status[1].status and json.decode(status[1].status) or nil end
			return status
		end
	end

	function getNosUpdate()
		local result = MySQL.Sync.fetchAll('SELECT * FROM '..vehDatabase..' WHERE hasnitro = ?', {1})
		if result and result[1] then
			for _, v in pairs(result) do
				if Config.System.Debug then print("^5Debug^7: ^3GetNosUpdate^7: ^2VehicleNitrous^7[^6"..tostring(v["plate"]).."^7] = { ^2level ^7= ^6"..tonumber(v["noslevel"]).."^7, ^2hasnitro ^7= ^6"..tostring(v["hasnitro"]).."^7 }") end
				VehicleNitrous[v["plate"]] = { hasnitro = v["hasnitro"], level = tonumber(v["noslevel"]), }
			end
			if Config.System.Debug then print("^5Debug^7: ^3GetNosUpdate^7: ^2VehicleNitrous Results Found^7: ^6"..#result.."^7") end
		else if Config.System.Debug then print("^5Debug^7: ^3GetNosUpdate^7: ^2Checked Database and found no vehicles with NOS^7") end end
	end

	RegisterNetEvent('jim-mechanic:database:UpdateNitrous', function(Plate, level, hasnitro)
		MySQL.Async.execute('UPDATE '..vehDatabase..' SET noslevel = ?, hasnitro = ? WHERE plate = ?',{ level or 0, hasnitro and true or false, Plate })
	end)

---==[[ UPDATE DATABASE MILAGE ]]==---
	RegisterNetEvent('jim-mechanic:server:UpdateDrivingDistance', function(plate, DistAdd)
		if IsVehicleOwned(plate) then
			local result = MySQL.scalar.await('SELECT traveldistance FROM '..vehDatabase..' WHERE plate = ?', {plate})
			if result then
				if Config.System.Debug then print("^5Debug^7: ^3UpdateDrivingDistance^7: ^2Travel distance ^7- [^6"..plate.."^7]: ^6"..((result or 0) + DistAdd).."^7") end
				MySQL.Async.execute('UPDATE '..vehDatabase..' SET traveldistance = ? WHERE plate = ?', {((result or 0) + DistAdd), plate})
			end
		end
	end)

---==[[ SAVE MODS ]]==---
	RegisterNetEvent("jim-mechanic:updateVehicle", function(props)
		if IsVehicleOwned(props.plate) then
			if Config.System.Debug then print("^5Debug^7: ^3updateVehicle^7: [^3"..props.model.."^7] - [^3"..props.plate.."^7]") end
			if GetResourceState(ESXExport):find("start") then
				MySQL.Async.execute('UPDATE '..vehDatabase..' SET vehicle = ? WHERE plate = ?', { json.encode(props), props.plate})
			elseif GetResourceState(OXCoreExport):find("start") then
				local result = MySQL.query.await('SELECT data FROM '..vehDatabase..' WHERE plate = ?', { props.plate })
				local data = {
					properties = props,
					lockStatus = json.decode(result[1]["data"]).lockStatus
				}
				MySQL.Async.execute('UPDATE '..vehDatabase..' SET data = ? WHERE plate = ?', { json.encode(data) , props.plate})
			elseif GetResourceState(QBExport):find("start") or GetResourceState(QBXExport):find("start") then
				MySQL.Async.execute('UPDATE '..vehDatabase..' SET mods = ? WHERE plate = ? AND hash = ?', { json.encode(props), props.plate, props.model})
			end
		end
	end)

---==[[ SAVE EXTRA DAMAGES ]]==---
	RegisterNetEvent('jim-mechanic:server:saveStatus', function(mechDamages, plate, engine, body)
		if Config.System.Debug then print("^5Debug^7: ^3saveStatus^7: ^2Save Extra Damages^7 - [^6"..plate.."^7]: "..json.encode(mechDamages)) end
		if GetResourceState(ESXExport):find("start") then
			MySQL.Async.execute('UPDATE '..vehDatabase..' SET status = ? WHERE plate = ?', { json.encode(mechDamages), plate})
		elseif GetResourceState(OXCoreExport):find("start") then
			MySQL.Async.execute('UPDATE '..vehDatabase..' SET status = ? WHERE plate = ?', { json.encode(mechDamages), plate})
		elseif GetResourceState(QBExport):find("start") or GetResourceState(QBXExport):find("start") then
			MySQL.Async.execute('UPDATE '..vehDatabase..' SET status = ?, engine = ?, body = ? WHERE plate = ?', {json.encode(mechDamages), engine, body, plate})
		end
	end)

	-- For qb-garages
	RegisterNetEvent('qb-vehicletuning:server:SaveVehicleProps', function(vehicleProps)
		if IsVehicleOwned(vehicleProps.plate) then
			MySQL.update('UPDATE '..vehDatabase..' SET mods = ? WHERE plate = ?', {json.encode(vehicleProps), vehicleProps.plate})
		end
	end)

	if Config.vehFailure.fixCommand then
		registerCommand("fix", {"Repair your vehicle (Admin Only)", {}, false, function(source)
			TriggerClientEvent('jim-mechanic:client:fixEverything', source)
		end, "admin"})
	end

	if Config.vehFailure.repairKits then
		createUseableItem("repairkit", function(source, item)
			TriggerClientEvent("jim-mechanic:vehFailure:RepairVehicle", source, { client = { item = item.name, full = false }})
		end)

		createUseableItem("advancedrepairkit", function(source, item)
			TriggerClientEvent("jim-mechanic:vehFailure:RepairVehicle", source, { client = { item = item.name, full = true }})
		end)
	end

---==[[ LOAD VALUES WHEN CAR IS SPAWNED ]] ==---
	RegisterNetEvent('jim-mechanic:server:loadStatus', function(props, vehicle)
		if props and type(props.headlightColor) == "table" then
			TriggerEvent("jim-mechanic:server:ChangeXenonColour", vehicle, { props.headlightColor[1], props.headlightColor[2], props.headlightColor[3] })
		end
		local result = MySQL.Sync.fetchAll('SELECT status FROM '..vehDatabase..' WHERE plate = ?', { props.plate })
		if result[1] and tostring(result[1].status) ~= "null" and tostring(result[1].status) ~= "0" and tostring(result[1].status) ~= "1" then
			local status = json.decode(result[1].status) or {}
			if Config.Repairs.ExtraDamages then
				for _, v in pairs({"oil", "axle", "spark", "battery", "fuel"}) do
					if Config.System.Debug then print("^5Debug^7: ^3loadStatus^7: [^6"..props.plate.."^7] ^2Setting damage of ^6"..v.."^2 to^7: ^4"..(status[v] or 100).."^7") end
					TriggerEvent("jim-mechanic:server:updateVehiclePart", vehicle, v, (status[v] or 100))
				end
			end
			for _, v in pairs({"harness", "antiLag", "carwax"}) do
				if Config.System.Debug then print("^5Debug^7: ^3loadStatus^7: [^6"..props.plate.."^7] ^2Setting ^6"..v.."^2 to^7: ^4"..(status[v] or 0).."^7") end
				TriggerEvent("jim-mechanic:server:updateVehiclePart", vehicle, v, (status[v] or 0))
			end
		end
	end)

---==[[ DUPE EXPLOIT KICK ]]==---
	RegisterNetEvent("jim-mechanic:server:DupeWarn", function(item, newsrc)
		local src = newsrc or source
		local P = getPlayer(src)
		print("^5DupeWarn: ^1"..P.name.."^7(^1"..tostring(src).."^7) ^2Tried to remove ^7('^3"..item.."^7')^2 but it wasn't there^7")
		if not Config.System.Debug then DropPlayer(src, "Attempting to duplicate items") end
		print("^5DupeWarn: ^1"..P.name.."^7(^1"..tostring(src).."^7) ^2Dropped from server for item duplicating^7")
	end)

---==[[ PREVIEW FUNCTIONS AND EXPLOIT FIX ]]==---
	RegisterNetEvent("jim-mechanic:server:preview", function(active, vehicle, plate)
		local src = source
		if active then
			if Config.System.Debug then print("^5Debug^7: ^3Preview: ^2Player^7(^4"..src.."^7)^2 Started previewing^7") end
			Previewing[src] = { active = active, vehicle = vehicle, plate = plate }
		else
			if Config.System.Debug then print("^5Debug^7: ^3Preview: ^2Player^7(^4"..src.."^7)^2 Stopped previewing^7") end
			Previewing[src] = nil
		end
	end)

	AddEventHandler('playerDropped', function()
		local src = source
		if Previewing[src] then
			if Config.System.Debug then print("^5Debug^7: ^3Preview: ^2Player dropped while previewing^7, ^2resetting vehicle properties^7") end
			local properties = {}
			local result = MySQL.query.await('SELECT mods FROM '..vehDatabase..' WHERE plate = ?', { Previewing[src].plate })
			if result[1] then TriggerClientEvent("jim-mechanic:preview:exploitfix", -1, Previewing[src].vehicle, json.decode(result[1].mods)) end
			print("Resetting Vehicles Properties")
		end
		Previewing[src] = nil
	end)

---==[[ PREVIEW BOARD ITEM ]]==---
	RegisterNetEvent("jim-mechanic:server:giveList", function(info)
		local src = source
		local metadata = { description = string.format('Model: %s\nPlate: %s\n\nChanges: %s', info.veh, info.vehplate, #info.vehlist), info = info }
		if GetResourceState(OXInv):find("start") then
			exports[OXInv]:AddItem(src, "mechboard", 1, metadata)
		else
			Core.Functions.GetPlayer(src).Functions.AddItem("mechboard", 1, nil, info)
			if Config.Crafting.showItemBox then TriggerClientEvent('inventory:client:ItemBox', src, Items["mechboard"], "add", 1) end
		end
	end)

	createUseableItem("mechboard", function(source, item)
		if GetResourceState(OXInv):find("start") then
			item.info = item.metadata["info"]
		end
		if item.info["vehlist"] == nil then
			triggerNotify("MechBoard", "The board is empty, don't spawn this item", "error", source)
		else
			TriggerClientEvent("jim-mechanic:client:giveList", source, item)
		end
	end)

---==[[ CHECK CASH FOR REPAIRS ]]==---
	RegisterNetEvent('jim-mechanic:chargeCash', function(cost, society)
		Core.Functions.GetPlayer(source).Functions.RemoveMoney("cash", cost)

		if Config.System.Debug then print("^5Debug^7: ^3chargeCash^7: ^2Adding ^7$^6"..(math.ceil(cost - (cost / 4))).." ^2to account ^7'^6"..society.."^7'") end

		if Config.System.RenewedBanking then
			exports['Renewed-Banking']:addAccountMoney(society, math.ceil(cost - (cost / 4)))
		else
			exports["qb-management"]:AddMoney(society, math.ceil(cost - (cost / 4)))
		end
	end)

---==[[ SEND TO DISCORD LOG STUFF ]]==---
	function sendToDiscord(color, name, message, footer, htmllist, info)
		local embed = { { ["color"] = color, ["thumbnail"] = { ["url"] = info.thumb }, ["title"] = "**".. name .."**", ["description"] = message, ["footer"] = { ["text"] = footer }, ["fields"] = htmllist, } }
		PerformHttpRequest(info.htmllink, function(err, text, headers) end, 'POST', json.encode({username = info.shopName:sub(4), embeds = embed}),	{ ['Content-Type'] = 'application/json' })
	end

	RegisterNetEvent("jim-mechanic:server:discordLog", function(info)
		local src = source
		local Player = getPlayer(src)
		local htmllist = {}
		local count = 0
		for i = 1, #info["modlist"] do
			htmllist[#htmllist+1] = {
				["name"] = info["modlist"][i]["item"],
				["value"]= info["modlist"][i]["type"],
				["inline"] = true
			}
			count = count +1
			if count == 25 then
				sendToDiscord(
					info.colour,
					"New Order".." - "..Player.name,
					info["veh"]:gsub('%<br>', '').." - "..info["vehplate"],
					"Preview Report"..info.shopName,
					htmllist,
					info
				)
				htmllist = {}
				count = 0
			elseif count == #info["modlist"] - 25 then
				sendToDiscord(
					info.colour,
					"Continued".." - "..Player.name,
					info["veh"]:gsub('%<br>', '').." - "..info["vehplate"],
					"Preview Report"..info.shopName,
					htmllist,
					info
				)
			end
		end
		if #info["modlist"] <= 25 then
			sendToDiscord(
				info.colour,
				"New Order".." - "..Player.name,
				info["veh"]:gsub('%<br>', '').." - "..info["vehplate"],
				"Preview Report"..info.shopName,
				htmllist,
				info
			)
		end
	end)

---==[[ XENON SERVER STUFF ]]==---
	RegisterNetEvent('jim-mechanic:server:ChangeXenonColour', function(vehicle, newColour)
		xenonColour[vehicle] = newColour
		TriggerClientEvent('jim-mechanic:client:ChangeXenonColour', -1, vehicle, newColour)
	end)

	RegisterNetEvent('jim-mechanic:server:ChangeXenonStock', function(vehicle) xenonColour[vehicle] = nil
		TriggerClientEvent('jim-mechanic:client:ChangeXenonStock', -1, vehicle)
	end)

---==[[ CRAFTING SERVER STUFF ]]==---
	AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
		if GetResourceState(OXInv):find("start") then
			for _, v in pairs(Config.Main.JobRoles) do
				registerStash(v.."Safe", "Stash")
			end
			exports[OXInv]:RegisterShop("nosShop", { name = Loc[Config.Lan]["stores"].nos, inventory = Stores.NosItems.items })
			exports[OXInv]:RegisterShop("toolShop", { name = Loc[Config.Lan]["stores"].tools, inventory = Stores.ToolItems.items })
			exports[OXInv]:RegisterShop("repairShop", { name = Loc[Config.Lan]["stores"].repairs, inventory = Stores.RepairItems.items })
			exports[OXInv]:RegisterShop("performShop", { name = Loc[Config.Lan]["stores"].perform, inventory = Stores.PerformItems.items })
			exports[OXInv]:RegisterShop("cosmeticShop", { name = Loc[Config.Lan]["stores"].cosmetic, inventory = Stores.CosmeticItems.items })
		end
	end)


---==[[ NOS SERVER STUFF ]]==---
if not Config.Overrides.disableNos then
	--These events sync the VehicleNitrous table with the server, making them able to be synced with the players
	RegisterNetEvent('jim-mechanic:server:LoadNitrous', function(Plate) VehicleNitrous[Plate] = { hasnitro = 1, level = 100 }
		TriggerClientEvent('jim-mechanic:client:LoadNitrous', -1, Plate)
		TriggerEvent("jim-mechanic:database:UpdateNitrous", Plate, VehicleNitrous[Plate].level, VehicleNitrous[Plate].hasnitro)
	end)

	RegisterNetEvent('jim-mechanic:server:UnloadNitrous', function(Plate)
		VehicleNitrous[Plate] = nil
		TriggerClientEvent('jim-mechanic:client:UnloadNitrous', -1, Plate)
		TriggerEvent("jim-mechanic:database:UpdateNitrous", Plate)
	end)

	RegisterNetEvent('jim-mechanic:server:UpdateNitroLevel', function(Plate, level)
		VehicleNitrous[Plate].level = level
		TriggerClientEvent('jim-mechanic:client:UpdateNitroLevel', -1, Plate, level)
		if IsVehicleOwned(Plate) then
			TriggerEvent("jim-mechanic:database:UpdateNitrous", Plate, VehicleNitrous[Plate].level, VehicleNitrous[Plate].hasnitro)
		end
	end)

	--Event called on script start to grab Database info about nos
	function getNosUpdate()
		local result = MySQL.Sync.fetchAll('SELECT * FROM '..vehDatabase..' WHERE hasnitro = ?', {1})
		if result and result[1] then
			for _, v in pairs(result) do
				if Config.System.Debug then print("^5Debug^7: ^3GetNosUpdate^7: ^2VehicleNitrous^7[^6"..tostring(v["plate"]).."^7] = { ^2level ^7= ^6"..tonumber(v["noslevel"]).."^7, ^2hasnitro ^7= ^6"..tostring(v["hasnitro"]).."^7 }") end
				VehicleNitrous[v["plate"]] = { hasnitro = v["hasnitro"], level = tonumber(v["noslevel"]), }
			end
			if Config.System.Debug then print("^5Debug^7: ^3GetNosUpdate^7: ^2VehicleNitrous Results Found^7: ^6"..#result.."^7") end
		else if Config.System.Debug then print("^5Debug^7: ^3GetNosUpdate^7: ^2Checked Database and found no vehicles with NOS^7") end end
	end

	--Syncing stuff
	RegisterNetEvent('jim-mechanic:server:SyncPurge', function(netId, enabled, size)
		local vehicle = NetworkGetEntityFromNetworkId(netId)
		if not DoesEntityExist(vehicle) then return end
		local value = { enabled, size }
		Entity(vehicle).state.jim_syncPurge = value
	end)

	RegisterNetEvent('jim-mechanic:server:SyncTrail', function(netId, enabled)
		local vehicle = NetworkGetEntityFromNetworkId(netId)
		if not DoesEntityExist(vehicle) then return end
		Entity(vehicle).state.jim_syncTrail = enabled
	end)

	RegisterNetEvent('jim-mechanic:server:SyncFlame', function(netId, enabled, level)
		local vehicle = NetworkGetEntityFromNetworkId(netId)
		if not DoesEntityExist(vehicle) then return end
		local value = { enabled, level }
		Entity(vehicle).state.jim_syncFlame = value
	end)

	RegisterNetEvent('jim-mechanic:server:AntiLag', function(netId, coords)
		local nearbyList = {}
		for _, v in ipairs(GetPlayers()) do
			if #(coords - GetEntityCoords(GetPlayerPed(v))) <= (Config.NOS.FlameDis or 30.0) then
				nearbyList[#nearbyList+1] = v
			end
		end
		for i = 1, #nearbyList do
			TriggerClientEvent('jim-mechanic:client:AntiLag', nearbyList[i], netId, coords)
		end
	end)

---==[[ PURGE COLOUR SERVER STUFF ]]==---

	createUseableItem("noscolour", function(source, item) TriggerClientEvent("jim-mechanic:client:NOS:rgbORhex", source) end)

	--Event called on script start to grab Database info about nos
	function getNosColourUpdate()
		local result = MySQL.Sync.fetchAll("SELECT `nosColour`, `plate` FROM `"..vehDatabase.."` WHERE 1")
		if result and result[1] then
			for _, v in pairs(result) do
				if v["nosColour"] then
					local newColour = json.decode(v["nosColour"])
					if Config.System.Debug then print("^5Debug^7: ^3nosColour^7[^6"..tostring(v["plate"]).."^7] = { ^2RBG^7: ^6"..newColour[1].."^7, ^6"..newColour[2].."^7, ^6"..newColour[3].." ^7}") end
					nosColour[v["plate"]] = newColour
				end
			end
		end
	end

	--Callback to send Database info to Client


	-- This event is to make it so every car's purge colour is synced
	-- If you change the colour of the purge on a car, everyone who gets in THAT car will spray this colour
	RegisterNetEvent('jim-mechanic:server:ChangeColour', function(Plate, newColour)
		nosColour[Plate] = newColour -- Update server side
		TriggerClientEvent('jim-mechanic:client:ChangeColour', -1, Plate, newColour) -- Sync the colour per car between players
		TriggerEvent('jim-mechanic:database:ChangeColour', Plate, newColour) -- Update Database with new colour
	end)

	RegisterNetEvent('jim-mechanic:database:ChangeColour', function(plate, newColour)
		--if Config.System.Debug then print("Update Purge Colour: "..plate) end
		MySQL.Async.execute('UPDATE '..vehDatabase..' SET nosColour = ? WHERE plate = ?', { json.encode(newColour), plate })
	end)
end
---==[[ VEHICLE DAMAGES SERVER STUFF ]]==---
	VehicleStatus = VehicleStatus or {}

	AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
		local result = MySQL.Sync.fetchAll("SELECT `status`, `plate` FROM `"..vehDatabase.."` WHERE 1")
		for _, v in pairs(result) do
			if type(json.decode(v.status)) == "table" then
				if Config.System.Debug then print("^5Debug^7: ^2Found vehicleStatus ^7- '^6"..v.plate.."^7'", "'^3"..type(json.decode(v.status)).."^7'") end
				VehicleStatus[v.plate] = json.decode(v.status)
				--Create a table and apply values at the same time, this will help if its retreived errornous info from database
				for _, name in pairs({"oillevel", "shaftlevel", "cylinderlevel", "cablelevel", "fuellevel", "harness", "antiLag", "carwax", "manual", "underglow" }) do
					VehicleStatus[v.plate][name] = VehicleStatus[v.plate][name] or 0
				end
				for _, name in pairs({"oil", "axle", "spark", "battery", "fuel"}) do
					VehicleStatus[v.plate][name] = VehicleStatus[v.plate][name] or 100
				end
				-- Convert old status to new status
				for _, name in pairs(VehicleStatus[v.plate]) do
					if name == "radiator" then VehicleStatus[v.plate]["oil"] = VehicleStatus[v.plate]["radiator"] VehicleStatus[v.plate]["radiator"] = nil end
					if name == "brakes" then VehicleStatus[v.plate]["spark"] = VehicleStatus[v.plate]["brakes"] VehicleStatus[v.plate]["brakes"] = nil end
					if name == "clutch" then VehicleStatus[v.plate]["battery"] = VehicleStatus[v.plate]["clutch"] VehicleStatus[v.plate]["clutch"] = nil end
				end
			end
		end
	end)

	function setupVehicleStatus(netId)
		local veh = NetworkGetEntityFromNetworkId(netId)
		local defaultStatus = {}
		if veh == 0 then return end
		local plate = trim(GetVehicleNumberPlateText(veh))
		if plate == nil or plate == 0 then return end
		defaultStatus["engine"] = (GetVehicleEngineHealth(veh) or 1000.0)
		defaultStatus["body"] = (GetVehicleBodyHealth(veh) or 1000.0)
		for _, name in pairs({"oil", "axle", "spark", "battery", "fuel"}) do
			defaultStatus[name] = 100.0
		end
		for _, name in pairs({
			"oillevel",
			"shaftlevel",
			"cylinderlevel",
			"cablelevel",
			"fuellevel",
			"harness",
			"antiLag",
			"carwax",
			"manual",
			"underglow"
		}) do
			defaultStatus[name] = 0
		end
		if IsVehicleOwned(plate) then
			VehicleStatus[plate] = 	GetVehicleStatus(plate) or defaultStatus
			for k in pairs(defaultStatus) do
				VehicleStatus[plate][k] = VehicleStatus[plate][k] or defaultStatus[k]
			end
		else
			VehicleStatus[plate] = defaultStatus
		end
	end

	RegisterNetEvent('jim-mechanic:server:updateVehiclePart', function(netId, part, level)
		local src = source
		local vehicle = NetworkGetEntityFromNetworkId(netId)
		if vehicle == 0 then return end
		local plate = trim(GetVehicleNumberPlateText(vehicle))
		if Config.System.Debug then print("^5Debug^7: ^2Updating ^4VehicleStatus ^7", plate) end
		if VehicleStatus[plate] then
			local partValue = level
			if partValue < 0 then partValue = 0
			elseif partValue > ((part == "engine" or part == "body") and 1000.0 or 100) then
				partValue = ((part == "engine" or part == "body") and 1000.0 or 100)
			end
			if part == "carwax" then if level ~= 0 then partValue = os.time() + level end end
			VehicleStatus[plate][part] = partValue

			local value = { plate = plate, part = part, level = partValue }
			Entity(vehicle).state.jim_updateVehiclePart = value
		end
	end)

	local LastToRefresh = nil
	RegisterNetEvent("jim-mechanic:EnsureServerFreshStatus", function(netId)
		local vehicle = NetworkGetEntityFromNetworkId(netId)
		local plate = trim(GetVehicleNumberPlateText(vehicle))
		Entity(vehicle).state.jim_updateAllVehiclePart = { plate = plate, status = VehicleStatus[plate] }
	end)

	RegisterNetEvent('jim-mechanic:server:fixAllPart', function(plate) local src = source
		if VehicleStatus[plate] then
			VehicleStatus[plate]["oil"] = 100
			VehicleStatus[plate]["axle"] = 100
			VehicleStatus[plate]["battery"] = 100
			VehicleStatus[plate]["fuel"] = 100
			VehicleStatus[plate]["spark"] = 100
		end
		TriggerClientEvent("jim-mechanic:client:setVehicleStatus", src, plate, VehicleStatus[plate])
	end)


	RegisterNetEvent("jim-mechanic:server:getStatusList", function(player, plate, vehilce) local src = source
		TriggerClientEvent("jim-mechanic:client:getStatusList", player and src or -1, VehicleStatus)
	end)

	--- HARNESS Stuff --
	if Config.Harness.HarnessControl == true then
		createUseableItem("harness", function(source, item) TriggerClientEvent('jim-mechanic:client:applyHarness', source, { client = { remove = false } }) end)
	end

---==[[ ON RESOURCE START ]]==---
	AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
		if not Config.Overrides.disableNos then
			getNosUpdate()
			getNosColourUpdate()
		end
	end)

	RegisterNetEvent('jim-mechanic:server:updateDefVehStats', function(plate, props)
		if not defVehStats[plate] then
			defVehStats[plate] = props
		else
			for k, v in pairs(props) do
				if defVehStats[plate][k] ~= v then defVehStats[plate][k] = v end
			end
		end
	end)

	RegisterNetEvent('jim-mechanic:server:updateCar', function(netId, props)
		TriggerClientEvent("jim-mechanic:forceProperties", -1, netId, props, source)
	end)

	RegisterNetEvent("jim-mechanic:server:changePlate", function(vehicle, plate)
		SetVehicleNumberPlateText(NetworkGetEntityFromNetworkId(vehicle), plate)
	end)

---==[[ CALLBACKS ]]==---
if GetResourceState(OXLibExport):find("start") then
	createCallback("jim-mechanic:checkVehicleOwner", function(source, plate)
		local result = IsVehicleOwned(plate)
		if result then return true else return false end
	end)

	createCallback("jim-mechanic:distGrab", function(source, plate)
		if IsVehicleOwned(plate) then
			local result = MySQL.scalar.await('SELECT traveldistance FROM '..vehDatabase..' WHERE plate = ?', {plate})
			if result then return result else return 0 end
		else return 0 end
	end)

	createCallback("jim-mechanic:checkWax", function(source, plate)
		if VehicleStatus and plate then
			if VehicleStatus[plate] then
				VehicleStatus[plate]["carwax"] = VehicleStatus[plate]["carwax"] or 0
					if VehicleStatus[plate]["carwax"] < os.time() then VehicleStatus[plate]["carwax"] = 0 -- if the the has ran out, set to 0 (off)
						TriggerClientEvent("jim-mechanic:client:setVehicleStatus", -1, plate, VehicleStatus[plate])
					end
				return VehicleStatus[plate]["carwax"]
			end
		else return 0 end
	end)

	createCallback("jim-mechanic:checkDefVehStats", function(source, plate)
		if defVehStats and plate then
			if defVehStats[plate] then return defVehStats[plate] else return 0 end
		else return 0 end
	end)

	createCallback("jim-mechanic:server:GetStatus", function(source, netId)
		local plate = trim(GetVehicleNumberPlateText(NetworkGetEntityFromNetworkId(netId)))
		if VehicleStatus[plate] and next(VehicleStatus[plate]) then
			return VehicleStatus[plate]
		else
			setupVehicleStatus(netId)
			while not VehicleStatus[plate] do Wait(10) end
			return VehicleStatus[plate]
		end
	end)

elseif GetResourceState(QBExport):find("start") or GetResourceState(ESXExport):find("start") then
	createCallback("jim-mechanic:checkVehicleOwner", function(source, cb, plate)
		local result = IsVehicleOwned(plate)
		if result then cb(true) else cb(false) end
	end)

	createCallback("jim-mechanic:distGrab", function(source, cb, plate)
		if IsVehicleOwned(plate) then
			local result = MySQL.scalar.await('SELECT traveldistance FROM '..vehDatabase..' WHERE plate = ?', {plate})
			if result then cb(result) else cb("") end
		else cb("") end
	end)

	createCallback("jim-mechanic:checkWax", function(source, cb, plate)
		if VehicleStatus and plate then
			if VehicleStatus[plate] then
				VehicleStatus[plate]["carwax"] = VehicleStatus[plate]["carwax"] or 0
					if VehicleStatus[plate]["carwax"] < os.time() then VehicleStatus[plate]["carwax"] = 0 -- if the the has ran out, set to 0 (off)
						TriggerClientEvent("jim-mechanic:client:setVehicleStatus", -1, plate, VehicleStatus[plate])
					end
				cb(VehicleStatus[plate]["carwax"])
			end
		else cb(0) end
	end)

	createCallback("jim-mechanic:checkDefVehStats", function(source, cb, plate)
		if defVehStats and plate then
			if defVehStats[plate] then cb(defVehStats[plate]) else cb(0) end
		else cb(0) end
	end)

	createCallback("jim-mechanic:server:GetStatus", function(source, cb, netId)
		local plate = trim(GetVehicleNumberPlateText(NetworkGetEntityFromNetworkId(netId)))
		if VehicleStatus[plate] and next(VehicleStatus[plate]) then
			cb(VehicleStatus[plate])
		else
			setupVehicleStatus(netId)
			while not VehicleStatus[plate] do Wait(10) end
			cb(VehicleStatus[plate])
		end
	end)
end

createCallback('jim-mechanic:mechCheck', function(source, cb)
	local result = false
	local dutyList = {}
	for _, v in pairs(Config.Main.JobRoles) do dutyList[tostring(v)] = false end

	for _, playerId in ipairs(GetPlayers()) do
		for _, v in pairs(Config.Main.JobRoles) do
			local hasJob, onDuty = hasJob(v, playerId)
			if hasJob and onDuty then
				dutyList[tostring(v)] = true
			end
		end
	end
	for _, v in pairs(dutyList) do if v then result = true end end
	if GetResourceState(OXLibExport):find("start") then return result
	else cb(result) end
end)

createCallback('jim-mechanic:GetXenonColour', function(source, cb)
	if GetResourceState(OXLibExport):find("start") then return xenonColour
	else cb(xenonColour) end
end)

createCallback('jim-mechanic:GetNosLoaded', function(source, cb)
	if GetResourceState(OXLibExport):find("start") then return VehicleNitrous
	else cb(VehicleNitrous) end
end)

createCallback('jim-mechanic:GetNosColour', function(source, cb)
	if GetResourceState(OXLibExport):find("start") then return nosColour
	else cb(nosColour) end
end)