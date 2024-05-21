AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
local itemcheck = true
--Check crafting recipes and their ingredients
if Config.StoreCraft.Crafting then
	for k, v in pairs(Crafting) do for i = 1, #v do for l, b in pairs(v[i]) do if l ~= "amount" and l ~= "job" then
			if not Items[l] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..l.."^7'") itemcheck = false end
			for j in pairs(b) do if not Items[j] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..j.."^7'") itemcheck = false end	end	end	end	end
		end
	end
	-- Check Stores for missing items
	if Config.StoreCraft.Stores then
		for _, v in pairs(Stores) do
			for i = 1, #v.items do if not Items[v.items[i].name] then print("^5Debug^7: ^3onResourceStart^7: ^1Missing ^2Item from ^4Shared^7.^4Items^7: '^6"..v.items[i].name.."^7'") itemcheck = false end end
		end
	end
	-- Check if theres a missing item/mistake in the repair materials
	if not Config.Repairs.FreeRepair then
		local repairTable = { "engine", "body", "oil", "axle", "spark", "battery", "fuel", }
		for _, v in pairs(repairTable) do
			if not Config.Repairs.Parts[v][1] then Config.Repairs.Parts[v] = { Config.Repairs.Parts[v] } end
			for i = 1, #Config.Repairs.Parts[v] do
				local item = Config.Repairs.Parts[v][i].part
				if not Items[item] then
					print("^5Debug^7: ^3onResourceStart^7: ^2"..(v:sub(1, 1):upper() .. v:sub(2)).." repair requested a item ^1missing ^2from the Shared^7: '"..item.."^7'")
					ittemcheck = false
				end
			end
		end
	end
	-- Check for "mechboard" item
	if not Items["mechboard"] then
		print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6mechboard^7'")
		itemcheck = false
	end
	for k, v in pairs(Config.Main.JobRoles) do
		if not Jobs[v] then print("^5Debug^7: ^3onResourceStart^7: ^4Config^7.^4Jobroles ^2tried to find the missing job^7: '^6"..v.."^7'") end
	end
	--Success message if all there.
	if Config.System.Debug and itemcheck then
		print("^5Debug^7: ^3onResourceStart^7: ^2All items found in the shared^7!")
	end

	if not GetResourceState(OXInv):find("start") then
		--Create Usable Items
		for k, v in pairs({
			["car_armor"] = 'jim-mechanic:client:applyArmour',
			["turbo"] = "jim-mechanic:client:applyTurbo",
			["headlights"] = "jim-mechanic:client:applyXenons",
			["underglow_controller"] = 'jim-mechanic:client:neonMenu',
			["mechanic_tools"] = 'jim-mechanic:client:Repair:Check',
			["rims"] = 'jim-mechanic:client:Rims:Check',
			["paintcan"] = 'jim-mechanic:client:Paints:Check',
			["tires"] = 'jim-mechanic:client:Tires:Check',
			["ducttape"] = "jim-mechanic:quickrepair",
			["bprooftires"] = "jim-mechanic:client:applyBulletProof",
			["drifttires"] = "jim-mechanic:client:applyDrift",
			["antilag"] = "jim-mechanic:client:applyAntiLag",
			["underglow"] = "jim-mechanic:client:applyUnderglow",
			["manual"] = "jim-mechanic:client:applyManual",
		}) do
			createUseableItem(k, function(source, item) TriggerClientEvent(v, source, { client = { remove = false } } ) end)
		end

		if not Config.Overrides.disableNos then
			createUseableItem("nos", function(source, item) TriggerClientEvent("jim-mechanic:client:applyNOS", source) end)
		end

		for _, v in pairs({ "exhaust", "hood", "rollcage", "bumper", "externals", "livery", "internals", "roof", "spoiler", "skirts", "customplate", "seat", "tint_supplies", "horn" }) do
			createUseableItem(v, function(source, item) TriggerClientEvent("jim-mechanic:client:Cosmetic:Check", source, { name = item.name } ) end)
		end

		createUseableItem("cleaningkit", function(source, item) TriggerClientEvent('jim-mechanic:client:cleanVehicle', source, true) end)

		createUseableItem("toolbox", function(source, item) TriggerClientEvent('jim-mechanic:client:Menu', source, true) end)

		for i = 1, 5 do
			createUseableItem("suspension"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applySuspension", source, { client = { level = i-1, remove = false, } }) end)
			createUseableItem("engine"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyEngine", source, { client = { level = i-1, remove = false, } }) end)
		end
		for i = 1, 4 do
			createUseableItem("transmission"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyTransmission", source, { client = { level = i-1, remove = false, } }) end)
		end
		for i = 1, 3 do
			createUseableItem("brakes"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyBrakes", source, { client = { level = i-1, remove = false, } }) end)
			if Config.Repairs.ExtraDamages then
				createUseableItem("oilp"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyExtraPart", source, { client = { level = i, mod = "oilp", remove = false } }) end)
				createUseableItem("drives"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyExtraPart", source, { client = { level = i, mod = "drives", remove = false } }) end)
				createUseableItem("cylind"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyExtraPart", source, { client = { level = i, mod = "cylind", remove = false } }) end)
				createUseableItem("cables"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyExtraPart", source, { client = { level = i, mod = "cables", remove = false } }) end)
				createUseableItem("fueltank"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyExtraPart", source, { client = { level = i, mod = "fueltank", remove = false } }) end)
			end
		end
	end
end)