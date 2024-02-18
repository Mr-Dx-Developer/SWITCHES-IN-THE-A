if GetResourceState('myCustomCore') == 'missing' then return end 

--MyCore = Load Your Core

-- Framework label used by all scripts
framework.name = 'MyCustomCore'

--Show client console prints from mk scripts. Disable will only show nothing
framework.consoleLogging = true

-- Default garage used by [mk_usedvehicles] and [mk_garage] to store a vehicle if one wasn't found
framework.defaultGarage = GetResourceState('mk_garage') == 'started' and 'legion'  or 'default'

-- Used by all scripts
---@param data { message: string, type: 'primary'|'success'|'error', duration: number } Notify data
function notify(data)
    
end

-- Used by [mk_vehiclekeys]
---@param data { message: string, coords: vector3, vehicle: number, plate: string, vehicleName: string, modelHash: number, modelString: string, blipText: string } Dispatch notify data
framework.policeDispatchNotify = function(self, data)
    
end

-- Used by [mk_vehiclekeys]
---@return boolean true player is restricted from performing tasks. ex: dead or cuffed. false if not
framework.isRestricted = function(self)
    
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
    
end

-- Player Loaded event - Sets client side player data and logged in state. Sets player identifier to the client and server.
RegisterNetEvent('playerLoadedEvent', function()
    playerState.mk_playerData = --set player data
    playerState:set('mk_identifier', 'playerIdentifier', true) --set identifier
    Wait(100)
    playerState.mk_isLoggedIn = true
end)

-- Player Unloaded event - Clears client / server player data, logged in state and identifier
RegisterNetEvent('playerUnloadedEvent', function()
    playerState.mk_isLoggedIn = false
    Wait(100)
    playerState.mk_playerData = nil
    playerState:set('mk_identifier', nil, true)
end)

--- Updates client side player data
RegisterNetEvent('setPlayerDataEvent', function(pData)
    playerState.mk_playerData = pData
end)

--- Updates mk_jobUpdate statebag. Used by [mk_garage] to recheck garage authorization when the player job is updated
RegisterNetEvent('jobUpdateEvent', function(job)
    local pData = playerState.mk_playerData
    if pData and job then 
        pData.job = job
        playerState.mk_jobUpdate = pData
    end
end)

--- Updates mk_gangUpdate statebag. Used by [mk_garage] to recheck garage authorization when the player gang is updated
RegisterNetEvent('gangUpdateEvent', function(gang)
    local pData = playerState.mk_playerData
    if pData and gang then 
        pData.gang = gang
        playerState.mk_gangUpdate = pData
    end
end)

-- Used by [mk_garage] [mk_usedvehicles] [mk_vehiclekeys]
---@return string, string|number Player job name and job grade
framework.getJob = function(self)
    
end

-- Used by [mk_garage]
---@return string, string|number Player gang name and gang grade
framework.getGang = function(self)
   
end

-- Used by [mk_garage]
---@return table|boolean List of player jobs and grades or false
framework.getJobs = function(self)
    
end

-- Used by [mk_garage]
---@return table|boolen List of player gangs and grades or false
framework.getGangs = function(self)
    
end

-- Used by [mk_vehiclekeys] [mk_mining]
---@param itemName string Name of item to check
---@param metadata table|nil Metadata item should have when checking if the player has it
---@return boolean true if player has item. false if not
inventory.hasItem = function(self, itemName, metadata)
    local hasItem = false

    if GetResourceState('ox_inventory') == 'started' then 
        local inv = exports['ox_inventory']:Search('count', itemName, metadata)
        if inv > 0 then 
            hasItem = true
        end
    else
        --framework inventory checks
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
        --framework inventory checks    
    end

    return itemAmount
end