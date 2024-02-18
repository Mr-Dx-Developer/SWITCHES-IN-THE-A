if GetResourceState('es_extended') == 'missing' then return end 

ESX = exports.es_extended:getSharedObject()

-- Framework label used by all scripts
framework.name = 'ESX'

--Show client console prints from mk scripts. Disable will only show nothing
framework.consoleLogging = true

-- Default garage used by [mk_usedvehicles] and [mk_garage] to store a vehicle if one wasn't found
framework.defaultGarage = GetResourceState('mk_garage') ~= 'missing' and 'legion' or 'SanAndreasAvenue'

-- Used by all scripts
---@param data { message: string, type: 'primary'|'success'|'error', duration: number } Notify data
function notify(data)
    TriggerEvent('esx:showNotification', data.message, data.type == 'primary' and 'info' or data.type, data.duration)
end

-- Used by [mk_vehiclekeys]
---@param data { message: string, coords: vector3, vehicle: number, plate: string, vehicleName: string, modelHash: number, modelString: string, blipText: string } Dispatch notify data
framework.policeDispatchNotify = function(self, data)
    TriggerServerEvent('mk_utils:server:esxDispatchNotify', data)
end

-- Triggered by [mk_utils] on players with 'police' job to display dispatch notification for base ESX
RegisterNetEvent('mk_utils:client:esxDispatchNotify', function(data)
    ESX.ShowNotification("[DISPATCH]: "..data.message, "error", 10000)
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    local transG = 250
    local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
    local blip2 = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
    local blipText = data.blipText
    SetBlipSprite(blip, 60)
    SetBlipSprite(blip2, 161)
    SetBlipColour(blip, 1)
    SetBlipColour(blip2, 1)
    SetBlipDisplay(blip, 4)
    SetBlipDisplay(blip2, 8)
    SetBlipAlpha(blip, transG)
    SetBlipAlpha(blip2, transG)
    SetBlipScale(blip, 0.8)
    SetBlipScale(blip2, 2.0)
    SetBlipAsShortRange(blip, false)
    SetBlipAsShortRange(blip2, false)
    PulseBlip(blip2)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipText)
    EndTextCommandSetBlipName(blip)
    while transG ~= 0 do
        Wait(180 * 4)
        transG = transG - 1
        SetBlipAlpha(blip, transG)
        SetBlipAlpha(blip2, transG)
        if transG == 0 then
            RemoveBlip(blip)
            return
        end
    end
end)

-- Used by [mk_vehiclekeys]
---@return boolean true player is restricted from performing tasks. ex: dead or cuffed. false if not
framework.isRestricted = function(self)
    --utils.logger:debug(GetInvokingResource(), 'is dead: '..tostring(playerState.mk_playerData?.dead)..' | is handcuffed: '..tostring(playerState.mk_playerData?.cuffed), {console = true})
    
    if playerState.mk_playerData?.dead or playerState.mk_playerData?.cuffed then 
        return true 
    else
        return false
    end
end

-- Used by [mk_usedvehicles] [mk_vehiclekeys]
---@param modelNumber number Vehicle model number
---@param modelString string Vehicle model name
---@return string Vehicle name text
framework.getVehicleName = function(self, modelNumber, modelString)
    return GetLabelText(GetDisplayNameFromVehicleModel(modelNumber))
end

-- Used by [mk_usedvehicles]
---@param modelNumber number Vehicle model number
---@param modelString string Vehicle model name
---@return number Vehicle sell price
framework.getVehiclePrice = function(self, modelNumber, modelString)
    local price = lib.callback.await('mk_utils:server:getEsxVehiclePrice', false, modelNumber, modelString)
    return price or 0
end

-- Player Loaded event - Sets client side player data and logged in state. Sets player identifier to the client and server.
RegisterNetEvent('esx:playerLoaded', function(xPlayer, isNew, playerSkin)
    Wait(3000) --Keep this for players not using multichar scripts. Without zones/blips wont load
    playerState.mk_playerData = xPlayer
    playerState:set('mk_identifier', xPlayer.identifier, true)
    Wait(100)
    playerState.mk_isLoggedIn = true
end)

-- Player Unloaded event - Clears client / server player data, logged in state and identifier
RegisterNetEvent('esx:onPlayerLogout', function()
    playerState.mk_isLoggedIn = false
    Wait(100)
    playerState.mk_playerData = nil
    playerState:set('mk_identifier', nil, true)
end)

--- Updates mk_jobUpdate statebag. Used by [mk_garage] to recheck garage authorization when the player job is updated
RegisterNetEvent('esx:setJob', function(job, lastJob)
    local pData = playerState.mk_playerData
    if pData and job then 
        pData.job = job
        playerState.mk_jobUpdate = pData
    end
end)

-- Used by [mk_garage] [mk_usedvehicles] [mk_vehiclekeys]
---@return string, string|number Player job name and job grade
framework.getJob = function(self)
    return playerState.mk_playerData?.job?.name, playerState.mk_playerData?.job?.grade
end

-- Used by [mk_garage]
---@return string, string|number Player gang name and gang grade
framework.getGang = function(self)
    return playerState.mk_playerData?.gang?.name, playerState.mk_playerData?.gang?.grade
end

-- Used by [mk_garage]
---@return table|boolean List of player jobs and grades or false
framework.getJobs = function(self)
    if not ESX.Jobs or next(ESX.Jobs) == nil then 
        ESX.Jobs = lib.callback.await('mk_utils:server:getEsxJobs')

        if ESX.Jobs and next(ESX.Jobs) ~= nil then 
            return ESX.Jobs
        else
            return false 
        end
    else
        return ESX.Jobs 
    end
end

-- Used by [mk_garage]
---@return table|boolen List of player gangs and grades or false
framework.getGangs = function(self)
    if not ESX.Gangs or next(ESX.Gangs) == nil then 
        ESX.Gangs = lib.callback.await('mk_utils:server:getEsxGangs')
        
        if ESX.Gangs and next(ESX.Gangs) ~= nil then 
            return ESX.Gangs
        else
            return false 
        end
    else
        return ESX.Gangs 
    end
end

-- Used by [mk_vehiclekeys] [mk_mining]
---@param itemName string Name of item to check
---@param metadata table|nil Metadata item should have when checking if the player has it
---@return boolean true if player has item. false if not
inventory.hasItem = function(self, itemName, metadata)
    local hasItem = false
    local next = next 

    if GetResourceState('ox_inventory') == 'started' then 
        local inv = exports['ox_inventory']:Search('count', itemName, metadata)
        if inv > 0 then 
            hasItem = true
        end
    elseif GetResourceState('qs-inventory') == 'started' then 
        local items = exports['qs-inventory']:getUserInventory()

        if items and next(items) ~= nil then 
            for key, value in pairs(items) do 
                if value?.name == itemName then 
                    if metadata and next(metadata) ~= nil then 
                        for index, val in pairs(metadata) do 
                            if value.info?[index] then 
                                if value.info?[index] == val then 
                                    hasItem = true 
                                    break
                                end
                            end
                        end
                    else
                        hasItem = true 
                    end
                end
            end
        end
    else
        if metadata and next(metadata) ~= nil then 
            utils.logger:error(GetInvokingResource(), '^1Inventory resource does not support item metadata. Install dependency or setup custom inventory in ^7[^5mk_utils^7]', {console = true})
        else
            local items = ESX.PlayerData.inventory
            local next = next
            if items and next(items) ~= nil then 
                for key, value in pairs(items) do 
                    if value.name == itemName then 
                        hasItem = true 
                    end
                end
            end
        end
    end

    return hasItem
end

-- Used by [mk_mining]
---@param itemName string Name of item to check 
---@return number Amount player has of specific item
inventory.getItemAmount = function(self, itemName)
    local itemAmount = 0

    if GetResourceState('ox_inventory') == 'started' then 
        local inv = exports['ox_inventory']:Search('count', itemName)
        if inv > 0 then 
            return inv
        else
            return 0
        end
    else
        local itemAmount = ESX.SearchInventory(itemName, 1)

        return itemAmount
    end
end