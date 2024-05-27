-- Check if ox_inventory & ox_lib are running
local ox_inv, ox_lib = GetResourceState('ox_inventory') == 'started', GetResourceState('ox_lib') == 'started'

-- Initialize ox_lib progress bar type
local progressType = Config.ProgressType == 'bar' and 'progressBar' or 'progressCircle'

-- Function to show a notification
--- @param message string
--- @param type string
ShowNotification = function(message, type)
    if ox_lib then
        lib.notify({
            title = 'Scuba Diving',
            description = message,
            type = type or 'inform',
            position = 'top',
            icon = 'anchor'
        })
    else
        if Framework == 'esx' then
            ESX.ShowNotification(message)
        elseif Framework == 'qb' then
            QBCore.Functions.Notify(message, type)
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function to show a notification from the server
--- @param message string
--- @param type string
RegisterNetEvent('lation_diving:Notify', function(message, type)
    ShowNotification(message, type)
end)

-- If you use a custom fuel system, set your export here
--- @param boat number Entity
SetFuel = function(boat)
    -- Check if LegacyFuel is running
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(boat, Config.Boat.Fuel)
    end
    -- Check if cdn-fuel is running
    if GetResourceState('cdn-fuel') == 'started' then
        exports['cdn-fuel']:SetFuel(boat, Config.Boat.Fuel)
    end
    -- Check if ps-fuel is running
    if GetResourceState('ps-fuel') == 'started' then
        exports['ps-fuel']:SetFuel(boat, Config.Boat.Fuel)
    end
    -- Check if lj-fuel is running
    if GetResourceState('lj-fuel') == 'started' then
        exports['lj-fuel']:SetFuel(boat, Config.Boat.Fuel)
    end
    -- Check if okokGasStation is running
    if GetResourceState('okokGasStation') == 'started' then
        exports['okokGasStation']:SetFuel(boat, Config.Boat.Fuel)
    end
    -- Check if nd_fuel is running
    if GetResourceState('nd_fuel') == 'started' then
        exports['nd_fuel']:SetFuel(boat, Config.Boat.Fuel)
    end
    Entity(boat).state.fuel = Config.Boat.Fuel
end

-- If Config.Boat.Keys is enabled this is used to give keys to vehicle
--- @param boat number Entity
GiveKeys = function(boat)
    -- Get vehicle plate & model
    local plate = GetVehicleNumberPlateText(boat)
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(boat))
    -- Check if wasabi_carlock is running
    if GetResourceState('wasabi_carlock') == 'started' then
        exports.wasabi_carlock:GiveKey(plate)
    end
    -- Check if okokGarage is running
    if GetResourceState('okokGarage') == 'started' then
        TriggerServerEvent("okokGarage:GiveKeys", plate)
    end
    -- Check if qb-vehiclekeys is running
    if GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)
    end
    -- Check if qs-vehiclekeys is running
    if GetResourceState('qs-vehiclekeys') == 'started' then
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    end
    -- Check if cd_garage is running
    if GetResourceState('cd_garage') == 'started' then
        TriggerEvent('cd_garage:AddKeys', plate)
    end
    -- Check if jaksam's vehicles_keys is running
    if GetResourceState('vehicles_keys') == 'started' then
        TriggerServerEvent('vehicles_keys:selfGiveVehicleKeys', plate)
    end
    -- Check if t1ger_keys is running
    if GetResourceState('t1ger_keys') == 'started' then
        TriggerServerEvent('t1ger_keys:updateOwnedKeys', plate, true)
    end
    -- Check if Renewed-Vehiclekeys is running
    if GetResourceState('Renewed-Vehiclekeys') == 'started' then
        exports['Renewed-Vehiclekeys']:addKey(plate)
    end
end

-- Function that allows or rejects a player from opening main menu
CanOpenMenu = function()
    -- Example implementation to show how this works
    -- First, we're checking if the player is dead
    local dead = IsPedDeadOrDying(cache.ped, false)
    -- If the variable "dead" is true, it'll return false below
    -- Which will not allow the menu to open
    if dead then
        -- Here is where you would display a notification providing
        -- Some information to the player about why the menu won't open
        return false
    end
    -- If "dead" is false, then the code proceeds to here
    -- Which now returns "true", allowing the menu to open
    return true
end

-- Function used to display TextUI
--- @param text string 
--- @param data table position, icon, backgroundColor, textColor
ShowTextUI = function(text, data)
    local displaying, label = lib.isTextUIOpen()
    if displaying and text == label then return end
    lib.showTextUI(text, {
        position = data.position or 'left-center',
        icon = data.icon,
        style = {
            borderRadius = 4,
            backgroundColor = data.backgroundColor,
            color = data.textColor
        }
    })
end

-- Function used to hide/remove TextUI
--- @param label string
HideTextUI = function(label)
    local isOpen, text = lib.isTextUIOpen()
    if isOpen and text == label then
        lib.hideTextUI()
    end
end

-- Function to handle sending a message to specific phone
--- @param data table title, subject, sender, name, content
SendPhoneMessage = function(data)
    local number
    if Config.Phone == 'npwd' then
        number = exports.npwd:getPhoneNumber()
        TriggerServerEvent('lation_diving:phoneMessage', cache.serverId, number, data)
    elseif Config.Phone == 'gks' then
        number = exports["gksphone"]:PhoneNumber()
        TriggerServerEvent('lation_diving:phoneMessage', cache.serverId, number, data)
    elseif Config.Phone == 'lb' then
        TriggerServerEvent('lation_diving:phoneMessage', cache.serverId, nil, data)
    elseif Config.Phone == 'qb-phone' then
        TriggerServerEvent('lation_diving:phoneMessage', cache.serverId, nil, data)
    elseif Config.Phone == 'quasar' then
        TriggerServerEvent('lation_diving:phoneMessage', cache.serverId, nil, data)
    elseif Config.Phone == 'yphone' then
        TriggerServerEvent('lation_diving:phoneMessage', cache.serverId, nil, data)
    else
        -- Configure 'custom' phone option here
    end
end

-- Function to apply target options to entity
--- @param entity number
--- @param data table
AddTargetEntity = function(entity, data)
    if Config.Target == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, data)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddTargetEntity(entity, {options = data, distance = 2})
    elseif Config.Target == 'qtarget' then
        exports.qtarget:AddTargetEntity(entity, {options = data, distance = 2})
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    elseif Config.Target == 'none' then
        -- TextUI is being used
    else
        print('No target system defined in the config file.')
    end
end

-- Function to remove target options from entity
--- @param entity number
--- @param data string
RemoveTargetEntity = function(entity, data)
    if Config.Target == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, data)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:RemoveTargetEntity(entity, nil)
    elseif Config.Target == 'qtarget' then
        exports.qtarget:RemoveTargetEntity(entity, data)
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    elseif Config.Target == 'none' then
        -- TextUI is being used
    else
        print('No target system defined in the config file.')
    end
end

-- Function to handle progress bar
--- @param data table Config.Animations.X
ProgressBar = function(data)
    if lib[progressType](data) then
        return true
    end
    return false
end

-- Function used to spawn NPC
SpawnNPC = function()
    lib.requestModel(Config.Start.Model)
    while not HasModelLoaded(Config.Start.Model) do Wait(0) end
    local pos = Config.Start.Location
    local ped = CreatePed(0, Config.Start.Model, pos.x, pos.y, pos.z, pos.w, false, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    return ped
end

-- Function that returns true or false if player has item
--- @param item string
--- @param amount number
HasItem = function(item, amount)
    if not item then return end
    if not amount then amount = 1 end
    if ox_inv then
        local count = exports.ox_inventory:Search('count', item)
        if count >= amount then
            return true
        end
        return false
    end
    if Framework == 'esx' then
        if not ESX.GetPlayerData() or not ESX.GetPlayerData().inventory then
            return false
        end
        local inventory = ESX.GetPlayerData().inventory
        for _, itemData in pairs(inventory) do
            if itemData.name == item then
                local count = itemData.count or itemData.amount
                if count >= amount then
                    return true
                end
            end
        end
        return false
    elseif Framework == 'qb' then
        local PlayerData = QBCore.Functions.GetPlayerData()
        if not PlayerData or not PlayerData.items then
            return false
        end
        for _, itemData in pairs(PlayerData.items) do
            if itemData and itemData.name == item then
                local count = itemData.amount or itemData.count
                if count >= amount then
                    return true
                end
            end
        end
        return false
    else
        -- Add support for a custom framework here
    end
end