PlaceableIdx = #BasketballHoops

RegisterNetEvent('rcore_basketball:placeHoop', function(hoopPos, hoopQuat, groundPos)
    local Source = source

    if PlayerHasItem(Source, Config.HoopItemName) then
        PlayerTakeItem(Source, Config.HoopItemName)

        PlaceableIdx = PlaceableIdx + 1
        BasketballHoops[PlaceableIdx] = {
            pos = hoopPos, 
            rot = hoopQuat,
            customGroundPos = groundPos,
            ownerServerId = Source
        }

        TriggerClientEvent('rcore_basketball:setPlacedHoop', -1, PlaceableIdx, BasketballHoops[PlaceableIdx])
    end
end)

RegisterNetEvent('rcore_basketball:takeHoop', function(idx)
    local Source = source    
    if BasketballHoops[idx] then
        local hoopState, stateIdx = GetStateById(idx)

        if hoopState and hoopState.Status ~= STATUS_FREE then
            SendNotification(Source, Config.Text.GAME_IN_PROGRESS)
            return
        end

        if not CanTakeHoop(Source, BasketballHoops[idx]) then
            SendNotification(Source, Config.Text.CANT_TAKE)
            return
        end

        if stateIdx then
            State[stateIdx] = nil
        end

        BasketballHoops[idx] = nil
        
        TriggerClientEvent('rcore_basketball:removePlacedHoop', -1, idx)
        PlayerGiveItem(Source, Config.HoopItemName)
    end
end)

function CanTakeHoop(serverId, hoopData)
	if not hoopData.ownerServerId then
		return
	end

	if hoopData.ownerServerId == serverId then
		return true
	end

    local targetPed = GetPlayerPed(hoopData.ownerServerId)

    if targetPed <= 0 then
        return true
    end

	local targetCoords = GetEntityCoords(targetPed)
	
	local distToOwner = #(targetCoords - hoopData.pos)

	if distToOwner > 30.0 then
		return true
	end
end

RegisterNetEvent('rcore_basketball:loadPlacedHoops', function()
    local Source = source
    local send = {}

    for idx, data in pairs(BasketballHoops) do
        if BasketballHoops[idx] and data.ownerServerId then
            TriggerClientEvent('rcore_basketball:setPlacedHoop', Source, idx, data)
            Wait(250)
        end
    end
end)