function HandleSaveSecondInventories(src, type, id)
	local IsVehicleOwned = IsVehicleOwned(id)
	if type == 'trunk' then
		if not Trunks[id] then return end
		if IsVehicleOwned then
			SaveOwnedVehicleItems(id, Trunks[id].items)
		else
			Trunks[id].isOpen = false
		end
	elseif type == 'glovebox' then
		if not Gloveboxes[id] then return end
		if IsVehicleOwned then
			SaveOwnedGloveboxItems(id, Gloveboxes[id].items)
		else
			Gloveboxes[id].isOpen = false
		end
	elseif type == 'stash' then
		SaveStashItems(id, Stashes[id].items)
	elseif type == 'drop' then
		if Drops[id] then
			Drops[id].isOpen = false
			if Drops[id].items == nil or next(Drops[id].items) == nil then
				Drops[id] = nil
				TriggerClientEvent(Config.InventoryPrefix .. ':client:RemoveDropItem', -1, id)
			end
		end
	elseif type == 'clothing' then
		local identifier = GetPlayerIdentifier(src)
		if not ClotheItems[identifier] then return end
		SaveClotheItems(identifier, ClotheItems[identifier].items)
	end
end

RegisterNetEvent(Config.InventoryPrefix .. ':server:SaveInventory', function(type, id)
	local src = source
	Wait(500)
	HandleSaveSecondInventories(src, type, id)
end)
