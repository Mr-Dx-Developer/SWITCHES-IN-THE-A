-- Check if ox_inventory & ox_lib are running
local ox_inv, ox_lib = GetResourceState('ox_inventory') == 'started', GetResourceState('ox_lib') == 'started'

-- Initialize ox_lib progress bar type (global)
progressType = Config.ProgressType == 'bar' and 'progressBar' or 'progressCircle'

-- Function to show a notification
--- @param message string
--- @param type string
ShowNotification = function(message, type)
    if ox_lib then
        lib.notify({
            title = 'Weed',
            description = message,
            type = type or 'inform',
            position = 'top',
            icon = 'cannabis'
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

-- Event handler to display server notifications
--- @param message string
--- @param type string
RegisterNetEvent('lation_weed:Notify', function(message, type)
    ShowNotification(message, type)
end)

-- Used to determine if a player can (true) or cannot (false) smoke a joint
-- Can be used to make custom edits, requirements, etc
CanSmokeJoint = function()
    -- Check if player is in a vehicle (for example purposes)
    local inVehicle = IsPedInAnyVehicle(cache.ped, false)
    if inVehicle then return false end
    return true
end

-- Used to determine if a player can (true) or cannot(false) search a plant for seeds
--- @param coords vector3 | vector4 Plant being searched coordinates
--- @param id number Current seed farm ID, can be accessed via Config.SeedFarms[id]
CanSearchPlant = function(coords, id)
    -- Check if player is alive (for example purposes)
    local dead = IsPedDeadOrDying(cache.ped, true)
    if dead then return false end
    return true
end

-- Function that runs to verify conditions before allowing lab entry
CanEnterLab = function()
    -- Initialize variables
    local result, isPolice = true, false
    if Config.Police.labAccess then
        local player = GetPlayerData()
        for _, job in pairs(Config.Police.jobs) do
            if player.job.name == job then
                isPolice = true
            end
        end
    end
    if Config.Rolling.lab.requireItem then
        local hasItem = HasItem(Config.Rolling.lab.item, 1)
        if not hasItem and not isPolice then
            result = false
        end
    end
    if Config.Rolling.lab.requirePolice then
        local count = lib.callback.await('lation_weed:PoliceCount', false)
        if count < Config.Rolling.lab.count and not isPolice then
            result = false
        end
    end
    if not result then
        ShowNotification('You are not authorized to enter', 'error')
    end
    -- If you want to add custom requirements for entering the lab
    -- This is where you would make that happen
    return result
end

-- Function used to display TextUI
--- @param text string 
--- @param icon string
ShowTextUI = function(text, icon)
    local displaying, _ = lib.isTextUIOpen()
    if displaying then return end
    lib.showTextUI(text, {
        position = 'left-center',
        icon = icon
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

-- Function to handle progress bar
--- @param data table Config.Animations.X
ProgressBar = function(data)
    if lib[progressType](data) then
        return true
    end
    return false
end

-- Function to apply target options to model
--- @param model string
--- @param data table
AddTargetModel = function(model, data)
    if Config.Target == 'ox_target' then
        exports.ox_target:addModel(model, data)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddTargetModel(model, {options = data})
    elseif Config.Target == 'qtarget' then
        exports.qtarget:AddTargetModel(model, {options = data})
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    elseif Config.Target == 'none' then
        -- TextUI is being used
    else
        print('No target system defined in the config file.')
    end
end

-- Function to apply target options to entity
--- @param entity number
--- @param data table
AddTargetEntity = function(entity, data)
    if Config.Target == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, data)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddTargetEntity(entity, {options = data, distance = Strings.Target.plantDistance})
    elseif Config.Target == 'qtarget' then
        exports.qtarget:AddTargetEntity(entity, {options = data, distance = Strings.Target.plantDistance})
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    elseif Config.Target == 'none' then
        -- TextUI is being used
    else
        print('No target system defined in the config file.')
    end
end

-- Function to add circle target zones
--- @param data table
AddCircleZone = function(data)
    if Config.Target == 'ox_target' then
        exports.ox_target:addSphereZone(data)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddCircleZone(data.name, data.coords, data.radius, {
            name = data.name,
            debugPoly = Config.Debug}, {
            options = data.options,
            distance = 2,
        })
    elseif Config.Target == 'qtarget' then
        exports.qtarget:AddCircleZone(data.name, data.coords, data.radius, {
            name = data.name,
            debugPoly = Config.Debug}, {
            options = data.options,
            distance = 2,
        })
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    elseif Config.Target == 'none' then
        -- TextUI is being used
    else
        print('No target system defined in the config file.')
    end
end

-- Function to remove circle target zones
--- @param id number | string
RemoveCircleZone = function(id)
    if Config.Target == 'ox_target' then
        exports.ox_target:removeZone(id)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:RemoveZone(id)
    elseif Config.Target == 'qtarget' then
        exports.qtarget:RemoveZone(id)
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    elseif Config.Target == 'none' then
        -- TextUI is being used
    else
        print('No target system defined in the config file.')
    end
end

-- Function to remove target options
--- @param model string
RemoveTargetModel = function(model)
    if Config.Target == 'ox_target' then
        exports.ox_target:removeModel(model, nil)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:RemoveTargetModel(model, nil)
    elseif Config.Target == 'qtarget' then
        exports.qtarget:RemoveTargetModel(model, nil)
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    elseif Config.Target == 'none' then
        -- TextUI is being used
    else
        print('No target system defined in the config file.')
    end
end

-- Function that returns all items from a players inventory
SearchInventory = function()
    if ox_inv then
        return exports.ox_inventory:GetPlayerItems()
    end
    if Framework == 'esx' then
        return ESX.GetPlayerData().inventory
    elseif Framework == 'qb' then
        return QBCore.Functions.GetPlayerData().items
    else
        -- Add support for custom or edited framework
    end
end

-- Function used to spawn NPCs
--- @param model string
--- @param coords vector3 | vector4
SpawnNPC = function(model, coords)
    if not model or not coords then return end
    local pedModel = model
    lib.requestModel(pedModel, 500)
    while not HasModelLoaded(pedModel) do Wait(0) end
    local ped = CreatePed(0, pedModel, coords.x, coords.y, coords.z, coords.w, false, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    return ped
end

-- Function that returns count of item in inventory
--- @param item string
ItemCount = function(item)
    if not item then return end
    if ox_inv then
        local count = exports.ox_inventory:Search('count', item)
        return count or 0
    end
    if Framework == 'esx' then
        if not ESX.GetPlayerData() or not ESX.GetPlayerData().inventory then
            return 0
        end
        local inventory = ESX.GetPlayerData().inventory
        for _, itemData in pairs(inventory) do
            if itemData.name == item then
                local count = itemData.count or itemData.amount
                return count or 0
            end
        end
        return 0
    elseif Framework == 'qb' then
        local PlayerData = QBCore.Functions.GetPlayerData()
        if not PlayerData or not PlayerData.items then
            return 0
        end
        for _, itemData in pairs(PlayerData.items) do
            if itemData and itemData.name == item then
                local count = itemData.amount or itemData.count
                return count or 0
            end
        end
        return 0
    else
        -- Add support for a custom framework here
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

-- Callback that checks all conditions before allowing a seed to be planted
--- @param _ any placeholder
--- @param data table seed label stages
lib.callback.register('lation_weed:CheckConditions', function(_, data)
    if not data then return end
    -- Check if inside a vehicle
    local inVehicle = IsPedInAnyVehicle(cache.ped, true)
    if inVehicle then
        ShowNotification(Strings.Notify.vehicle, 'error')
        return {status = false}
    end
    -- Check if police are required
    if Config.Police.require then
        local police = lib.callback.await('lation_weed:PoliceCount', false)
        if police < Config.Police.count then
            ShowNotification(Strings.Notify.police, 'error')
            return {status = false}
        end
    end
    -- Check if restricting planting
    if Config.Planting.RestrictToDesignatedAreas then
        local approvedLocation = lib.callback.await('lation_weed:DesignatedAreas', false)
        if not approvedLocation then
            ShowNotification(Strings.Notify.cant, 'error')
            return {status = false}
        end
    end
    -- Check if planting in disabled location
    local disabledLocation = lib.callback.await('lation_weed:DisabledLocation', false)
    if disabledLocation then
        ShowNotification(Strings.Notify.cant, 'error')
        return {status = false}
    end
    -- Check if a plant pot is required
    if Config.Items.PlantPot.require then
        local hasPot = HasItem(Config.Items.PlantPot.item, Config.Items.PlantPot.consume)
        if not hasPot then
            ShowNotification(Strings.Notify.pot, 'error')
            return {status = false}
        end
    end
    -- Check if a shovel is required
    if Config.Items.Shovel.require then
        local hasShovel = HasItem(Config.Items.Shovel.item, Config.Items.Shovel.consume)
        if not hasShovel then
            ShowNotification(Strings.Notify.shovel, 'error')
            return {status = false}
        end
    end
    -- Passed all our checks, can now start the placement process
    -- You can add custom requirements here if desired & know how-to
    local complete = StartPlacement(data)
    return complete
end)