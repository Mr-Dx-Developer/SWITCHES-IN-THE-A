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
			for i = 1, #v.items do if not Items[v.items[i].name] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..v.items[i].name.."^7'") itemcheck = false end end
		end
	end
	-- Check if theres a missing item/mistake in the repair materials
	--[[if not FreeRepair then
		--if not Items[Config.Repairs.Parts["engine"].part] then print("^5Debug^7: ^3onResourceStart^7: ^2Engine repair requested a item missing from the Shared^7: '"..Config.Repairs.Parts["engine"].part.."^7'") itemcheck = false end
		if not Items[Config.Repairs.Parts["body"].part] then print("^5Debug^7: ^3onResourceStart^7: ^2Body repair requested a item missing from the Shared^7: '"..Config.Repairs.Parts["body"].part.."^7'") itemcheck = false end
		if Config.Repairs.ExtraDamages then
			if not Items[Config.Repairs.Parts["oil"].part] then print("^5Debug^7: ^3onResourceStart^7: ^2Radiator repair requested a item missing from the Shared^7: '^6"..Config.Repairs.Parts["oil"].part.."^7'") itemcheck = false end
			if not Items[Config.Repairs.Parts["axle"].part] then print("^5Debug^7: ^3onResourceStart^7: ^2Axle repair requested a item missing from the Shared^7: '^6"..Config.Repairs.Parts["axle"].part.."^7'") itemcheck = false end
			if not Items[Config.Repairs.Parts["spark"].part] then print("^5Debug^7: ^3onResourceStart^7: ^2Brakes repair requested a item missing from the Shared^7: '^6"..Config.Repairs.Parts["spark"].part.."^7'") itemcheck = false end
			if not Items[Config.Repairs.Parts["battery"].part] then print("^5Debug^7: ^3onResourceStart^7: ^2Clutch repair requested a item missing from the Shared^7: '^6"..Config.Repairs.Parts["battery"].part.."^7'") itemcheck = false end
			if not Items[Config.Repairs.Parts["fuel"].part] then print("^5Debug^7: ^3onResourceStart^7: ^2FuelTank repair requested a item missing from the Shared^7: '^6"..Config.Repairs.Parts["fuel"].part.."^7'") itemcheck = false end
		end
	end]]
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
		}) do
			createUseableItem(k, function(source, item) TriggerClientEvent(v, source, { client = { remove = false } } ) end) end

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