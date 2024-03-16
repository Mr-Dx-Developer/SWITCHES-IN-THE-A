--[[
    Here you have the dispatch configuration, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

RegisterNetEvent('housing:client:notifyCops')
AddEventHandler('housing:client:notifyCops', function(coords)
    if PlayerData and PlayerData.job and PlayerData.job.name and Config.PoliceJob[PlayerData.job.name] then
        local transG = 300 * 2
        local blip = AddBlipForCoord(coords)
        local street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local street2 = GetStreetNameFromHashKey(street)

        if Config.Smartphone then
            TriggerServerEvent('housing:server:phoneDispatch', coords, street2)
        else
            SendTextMessage('The door of a house is being forced in:' .. ' ' .. street2, 'inform')
        end

        SetBlipSprite(blip, 161)
        SetBlipColour(blip, 3)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.5)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('House robbery')
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(500)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('housing:server:phoneDispatch', function(coords, street2)
    local alertData = {
        title = 'House robbery',
        coords = { x = coords.x, y = coords.y, z = coords.z },
        description = 'The door of a house was forced' .. ' ' .. street2
    }
    TriggerClientEvent('qs-smartphone:client:addPoliceAlert', -1, alertData)
end)
