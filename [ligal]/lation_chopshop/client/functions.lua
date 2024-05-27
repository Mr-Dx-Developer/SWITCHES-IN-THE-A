-- Check if ox_inventory & ox_lib are running
local ox_inv, ox_lib = GetResourceState('ox_inventory') == 'started', GetResourceState('ox_lib') == 'started'

-- Initialize ox_lib progress bar type (global)
local progressType = Config.ProgressType == 'bar' and 'progressBar' or 'progressCircle'

-- Function to show a notification
--- @param message string
--- @param type string
ShowNotification = function(message, type)
    if ox_lib then
        lib.notify({
            title = 'Chop Shop',
            description = message,
            type = type or 'inform',
            position = 'top',
            icon = 'car-burst'
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
RegisterNetEvent('lation_chopshop:Notify', function(message, type)
    ShowNotification(message, type)
end)

-- Empty function that is ran before executing "Request a Job" option
-- Allows you to write in your own customize requirements, etc
-- Simply return true if your conditions are met, or return false to reject
CanRequestJob = function()
    return true
end

-- Empty function that is triggered at the start of "Request a Job"
-- Before a job is actually assigned
WaitingForJob = function()

end

-- Empty function that's triggered when a vehicle has been assigned
-- Via the "Request a Job" menu option
--- @param vehicle table .spawnName & .label
--- @param coords vector3 | vector4 Position car will be spawned
JobAssigned = function(vehicle, coords)

end

-- Function that's triggered when Request a Job vehicle is spawned
-- This is where the vehicle doors should be set to locked
--- @param vehicle number entity
RequestJobVehicleSpawned = function(vehicle)
    SetVehicleDoorsLocked(vehicle, 2)
end

-- Empty function that's triggered once a vehicle/job has been completed
-- This will be triggered when the vehicle's frame is chopped
--- @param model string Vehicle model
JobCompleted = function(model)

end

-- Empty function that's triggered when player has started chopping process
-- Can be used for things like disabling inventory, etc
StartChopping = function()
    -- Below are some examples:
    -- qs-inventory: exports['qs-inventory']:setInventoryDisabled(true)
    -- ox_inventory: LocalPlayer.state.invBusy = true
    -- qb-inventory: LocalPlayer.state.inv_busy = true
end

-- Empty function that's triggered when player has finished chopping process
-- Can be used for things like disabling inventory, etc
FinishChopping = function()
    -- Below are some examples:
    -- qs-inventory: exports['qs-inventory']:setInventoryDisabled(false)
    -- ox_inventory: LocalPlayer.state.invBusy = false
    -- qb-inventory: LocalPlayer.state.inv_busy = false
end

-- Empty function that's triggered when a contract has started
--- @param coords vector4 Position at which the vehicle is spawned
--- @param driver number The driver's entity ID
--- @param vehicle number The vehicle's entity ID
--- @param model string The vehicle spawn name, data can be accessed via Config.Vehicles[model]
--- @param isSale boolean True if it's a selling contract, false if chopping
ContractStarted = function(coords, driver, vehicle, model, isSale)

end

-- Empty function that's triggered when a player succesfully obtained contract vehicle
--- @param vehicle number Entity ID
--- @param model string Vehicle spawn name, data can be accessed via Config.Vehicles[model]
--- @param isSale boolean True if it's a selling contract, false if chopping
VehicleHijacked = function(vehicle, model, isSale)

end

-- Function that's triggered when a vehicle is succesfully lockpicked
-- Used to improve car lock system compatibility
--- @param vehicle number
--- @param plate string
--- @param netId number | nil
CarlockCompatibility = function(vehicle, plate, netId)
    if not vehicle or not plate then return end
    if Framework == 'qb' and GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)
    end
end

-- Function to process vehicle hacking
--- @param data table .difficulty, .inputs
Lockpick = function(data)
    if lib.skillCheck(data.difficulty, data.inputs) then
        return true
    end
    return false
end

-- Function to process part chopping
--- @param data table .difficulty, .inputs
ChopPart = function(data)
    if lib.skillCheck(data.difficulty, data.inputs) then
        return true
    end
    return false
end

-- Function to handle progress bar
--- @param data table Config.Animations.X
ProgressBar = function(data)
    if lib[progressType](data) then
        return true
    end
    return false
end

-- Function to handle sending a message to specific phone
--- @param data table title, subject, sender, name, content
SendPhoneMessage = function(data)
    if Config.Phone == 'qb-phone' then
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data)
    elseif Config.Phone == 'npwd' then
        local number = exports.npwd:getPhoneNumber()
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data, number)
    elseif Config.Phone == 'qs-smartphone' then
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data)
    elseif Config.Phone == 'qs-smartphonepro' then
        local message = { sender = '', subject = '', message = '' }
        TriggerServerEvent('phone:sendNewMail', message)
    elseif Config.Phone == 'lb-phone' then
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data)
    elseif Config.Phone == 'gksphone' then
        local number = exports["gksphone"]:PhoneNumber()
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data, number)
    elseif Config.Phone == 'yseries' then
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data)
    elseif Config.Phone == 'custom' then
        -- Configure 'custom' phone system here
    end
end

-- Function used for police dispatch systems
--- @param dispatch table coords, model, color, street
PoliceDispatch = function(dispatch)
    if Config.Police.dispatch == 'linden_outlawalert' then
        local d = {
            displayCode = '10-37',
            description = 'Reported Stolen Vehicle',
            isImportant = 0,
            recipientList = Config.Police.jobs,
            length = '10000',
            infoM = 'fa-info-circle',
            info = 'An anonymous caller has reported a possible stolen ' ..dispatch.color.. ' ' ..dispatch.model.. ' near ' ..dispatch.street
        }
        local dispatchData = {dispatchData = d, caller = 'Citizen', coords = dispatch.coords}
        TriggerServerEvent('wf-alerts:svNotify', dispatchData)
    elseif Config.Police.dispatch == 'cd_dispatch' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = Config.Police.jobs,
            coords = data.coords,
            title = '10-87 - Reported Stolen Vehicle',
            message = 'An anonymous caller has reported a possible stolen ' ..dispatch.color.. ' ' ..dispatch.model.. ' near ' ..dispatch.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 51,
                scale = 1.0,
                colour = 1,
                flashes = false,
                text = '10-37 | Reported Stolen Vehicle',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Police.dispatch == 'ps-dispatch' then
        exports["ps-dispatch"]:CustomAlert({
            coords = dispatch.coords,
            message = 'An anonymous caller has reported a possible stolen ' ..dispatch.color.. ' ' ..dispatch.model.. ' near ' ..dispatch.street,
            dispatchCode = "10-37 | Reported Stolen Vehicle",
            description = "Reported Stolen Vehicle",
            radius = 0,
            sprite = 64,
            color = 2,
            scale = 1.0,
            length = 3,
        })
    elseif Config.Police.dispatch == 'qs-dispatch' then
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = Config.Police.jobs,
            callLocation = playerData.coords,
            callCode = { code = '10-37', snippet = 'Reported Stolen Vehicle' },
            message = 'An anonymous caller has reported a possible stolen ' ..dispatch.color.. ' ' ..dispatch.model.. ' near ' ..dispatch.street,
            flashes = false,
            image = nil,
            blip = {
                sprite = 488,
                scale = 1.5,
                colour = 1,
                flashes = true,
                text = 'Reported Stolen Vehicle',
                time = (6 * 60 * 1000),
            }
        })
    elseif Config.Police.dispatch == 'custom' then
        -- Add your custom dispatch system here
    else
        -- No dispatch system was found
        print('No dispatch system was identified - please update your Config.Police.dispatch')
    end
end

-- Function used to apply target to bone(s)
--- @param entity number
--- @param bone string
--- @param option table
AddTargetBone = function(entity, bone, option)
    if Config.Target == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, option)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddTargetBone(bone, {options = option, distance = 2.0})
    elseif Config.Target == 'qtarget' then
        exports.qtarget:AddTargetBone(bone, {options = option, distance = 2.0})
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    else
        print('No target system defined in the config file.')
    end
end

-- Function used to remove target from bone(s)
--- @param entity number
--- @param bone string
--- @param option table
RemoveTargetBone = function(entity, bone, option)
    if Config.Target == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, option)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:RemoveTargetBone(bone, option)
    elseif Config.Target == 'qtarget' then
        exports.qtarget:RemoveTargetBone(bone, option)
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    else
        print('No target system defined in the config file.')
    end
end

-- Add target to entity
--- @param entity number Entity number
--- @param data table Options table
AddTargetEntity = function(entity, data)
    if Config.Target == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, data)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddTargetEntity(entity, {options = data, distance = 2.0})
    elseif Config.Target == 'qtarget' then
        exports.qtarget:AddTargetEntity(entity, {options = data, distance = 2.0})
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    else
        print('No target system defined in the config file.')
    end
end

-- Remove target from entity
--- @param entity number
--- @param data table|string|nil
RemoveTargetEntity = function(entity, data)
    if Config.Target == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, data)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:RemoveTargetEntity(entity, nil)
    elseif Config.Target == 'qtarget' then
        exports.qtarget:RemoveTargetEntity(entity, data)
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    else
        print('No target system defined in the config file.')
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

-- Function to spawn NPCs
--- @param model string
--- @param position vector4
SpawnNPC = function(model, position)
    lib.requestModel(model, 1500)
    while not HasModelLoaded(model) do Wait(0) end
    local ped = CreatePed(0, model, position.x, position.y, position.z - 1.0, position.w, false, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    return ped
end

-- Function to print events to console if debug enabled
--- @param string string
EventLog = function(string)
    if not Config.Debug or not string then return end
    print(string)
end