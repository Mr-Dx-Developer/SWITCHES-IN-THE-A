-- Check if ox_inventory and/or ox_lib is running
local ox_inv = GetResourceState('ox_inventory') == 'started'
local ox_lib = GetResourceState('ox_lib') == 'started'

-- Function to show a notification
--- @param message string
--- @param type string
ShowNotification = function(message, type)
    if ox_lib then
        lib.notify({
            title = 'Metal Detecting',
            description = message,
            type = type or 'inform',
            position = 'top',
            icon = 'magnifying-glass'
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

-- Event handler for sending notifications from server
--- @param message string
--- @param type string
RegisterNetEvent('lation_detecting:Notify', function(message, type)
    ShowNotification(message, type)
end)

-- Function used to display the TextUI
--- @param detect boolean
--- @param text string
--- @param icon string
--- @param bgColor string | nil
--- @param color string | nil
ShowTextUI = function(detect, text, icon, bgColor, color)
    if detect then
        -- Customized TextUI displayed when detecting
        lib.showTextUI(text, {
            position = 'left-center',
            icon = icon,
            style = {
                borderRadius = 2,
                backgroundColor = bgColor,
                color = color
            }
        })
    else
        -- Normal TextUI used for other purposes
        if lib.isTextUIOpen() then
            return
        else
            lib.showTextUI(text, {
                position = 'left-center',
                icon = icon
            })
        end
    end
end

-- Function used to hide/remove TextUI
--- @param label string
HideTextUI = function(label)
    local isOpen, text = lib.isTextUIOpen()
    if isOpen and text == label then
        lib.hideTextUI()
    end
end

-- Empty function that's triggered when a player begins detecting
-- Can be used for things like disabling inventory, etc
StartedDetecting = function()
    -- Below are some examples:
    -- qs-inventory: exports['qs-inventory']:setInventoryDisabled(true)
    -- ox_inventory: LocalPlayer.state.invBusy = true
    -- qb-inventory: LocalPlayer.state.inv_busy = true
end

-- Empty function that's triggered when a player stops detecting
-- Can be used for things like re-enabling inventory, etc
StoppedDetecting = function()
    -- Below are some examples:
    -- qs-inventory: exports['qs-inventory']:setInventoryDisabled(false)
    -- ox_inventory: LocalPlayer.state.invBusy = false
    -- qb-inventory: LocalPlayer.state.inv_busy = false
end

-- Empty function that's triggered when a player begins digging
-- Can be used for things like disabling inventory, etc
StartedDigging = function()
    -- Below are some examples:
    -- qs-inventory: exports['qs-inventory']:setInventoryDisabled(true)
    -- ox_inventory: LocalPlayer.state.invBusy = true
    -- qb-inventory: LocalPlayer.state.inv_busy = true
end

-- Empty function that's triggered when a player stops digging
-- Can be used for things like re-enabling inventory, etc
StoppedDigging = function()
    -- Below are some examples:
    -- qs-inventory: exports['qs-inventory']:setInventoryDisabled(false)
    -- ox_inventory: LocalPlayer.state.invBusy = false
    -- qb-inventory: LocalPlayer.state.inv_busy = false
end

-- Add target to entity
-- Default export works for ox_target, qb-target & qtarget
-- Recommended to only change if required & know what your doing
-- Target system must support "canInteract" and "action/onSelect"
--- @param entity number
--- @param options table
AddTargetEntity = function(entity, options)
    exports.qtarget:AddTargetEntity(entity, {options = options})
end

-- Remove target from entity
-- Default export works for ox_target, qb-target & qtarget
-- Recommended to only change if required & know what your doing
--- @param entity number
RemoveTargetEntity = function(entity)
    exports.qtarget:RemoveTargetEntity(entity, nil)
end

-- Function used to determine soil types player is detecting on
CheckSoil = function()
    local offset = vec3(0.0, 2.0, -3.0)
    local pCoords = GetEntityCoords(cache.ped) -- Player coords
    local tCoords = GetOffsetFromEntityInWorldCoords(cache.ped, offset.x, offset.y, offset.z) -- Target coords
    local ray = StartShapeTestRay(pCoords.x, pCoords.y, pCoords.z, tCoords.x, tCoords.y, tCoords.z, 17, cache.ped, 7)
    local _, hit, _, _, soilType, _ = GetShapeTestResultEx(ray)
    if hit == 1 then
        -- print('Currently detecting on soil type: ' ..tostring(soilType))
        if not Config.SoilTypes[soilType] then
            return false
        end
        return true
    end
    return false
end

-- Function used to spawn NPCs
--- @param model string
--- @param coords vector3 | vector4
SpawnNPC = function(model, coords)
    lib.requestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local ped = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    return ped
end

-- Function used to get how often metal detector beeps based on distance
--- @param distance number
GetBeepTime = function(distance)
    if distance < 1 then
        return 100 -- In milliseconds
    elseif distance < 2 then
        return 200
    elseif distance < 3 then
        return 300
    elseif distance < 4 then
        return 400
    elseif distance < 5 then
        return 500
    elseif distance < 6 then
        return 600
    elseif distance < 7 then
        return 700
    elseif distance < 8 then
        return 800
    elseif distance < 9 then
        return 900
    elseif distance < 10 then
        return 1000
    elseif distance < 11 then
        return 1100
    elseif distance < 12 then
        return 1200
    elseif distance < 13 then
        return 1300
    elseif distance < 14 then
        return 1400
    elseif distance < 15 then
        return 1500
    elseif distance < 20 then
        return 2000
    elseif distance < 25 then
        return 2500
    elseif distance < 30 then
        return 3000
    else
        return 3500
    end
end

-- This function searches players inventory for items
SearchInventory = function()
    if Framework == 'esx' then
        return ESX.GetPlayerData().inventory
    elseif Framework == 'qb' then
        return QBCore.Functions.GetPlayerData().items
    else
        -- Add support for custom or edited framework
        return exports.ox_inventory:GetPlayerItems()
    end
end

-- Function that returns true or false if player has item
--- @param item string
--- @param amount number
HasItem = function(item, amount)
    if not item then return end
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