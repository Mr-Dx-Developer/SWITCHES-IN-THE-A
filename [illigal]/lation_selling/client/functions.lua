-- Function used for police dispatch systems
-- Can get coords & street name with data.coords & data.street if needed
--- @param data table
PoliceDispatch = function(data)
    if Config.Dispatch == 'linden_outlawalert' then
        local d = {displayCode = '10-420', description = 'Potential Drug Sale', isImportant = 0, recipientList = Config.Police.jobs, length = '10000', infoM = 'fa-info-circle', info = 'A citizen has reported a potential drug sale in progress'}
        local dispatchData = {dispatchData = d, caller = 'Citizen', coords = data.coords}
        TriggerServerEvent('wf-alerts:svNotify', dispatchData)
    elseif Config.Dispatch == 'cd_dispatch' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = Config.Police.jobs,
            coords = data.coords,
            title = '10-420 - Potential Drug Sale',
            message = 'A citizen has reported a potential drug sale on ' ..data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 51,
                scale = 1.0,
                colour = 1,
                flashes = false,
                text = '10-420 | Drug Sale',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Dispatch == 'ps-dispatch' then
        exports['ps-dispatch']:DrugSale()
    elseif Config.Dispatch == 'qs-dispatch' then
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        TriggerServerEvent('qs-dispatch:server:CreateDiapatchCall', {
            job = Config.Police.jobs,
            callLocation = playerData.coords,
            callCode = { code = '10-420', snippet = 'Potential Drug Sale' },
            message = 'A citizen has reported a potential drug sale on ' ..playerData.street_1,
            flashes = false,
            image = image or nil,
            blip = {
                sprite = 488,
                scale = 1.5,
                colour = 1,
                flashes = true,
                text = 'Potential Drug Sale',
                time = (6 * 60 * 1000),
            }
        })
    elseif Config.Dispatch == 'custom' then
        -- Add your custom dispatch system here
    else
        -- No dispatch system was found
        print('No dispatch system was identified - please update your Config.Dispatch')
    end
end

-- Function used to apply target options
-- This export is compatible with ox_target, qb-target & qtarget
--- @param global boolean Is target global
--- @param entity any Entity number or nil
--- @param options any Target options table or string or nil
ApplyTarget = function(global, entity, options)
    if global then
        if Config.Target == 'ox_target' then
            exports.ox_target:addGlobalPed(options)
        elseif Config.Target == 'qb-target' then
            exports['qb-target']:AddGlobalPed({options = options})
        elseif Config.Target == 'qtarget' then
            exports.qtarget:Ped({options = options})
        else
            -- Add support for a custom target system here
            -- canInteraction & action/onSelect functions are required
        end
    else
        if Config.Target == 'ox_target' then
            exports.ox_target:addLocalEntity(entity, options)
        elseif Config.Target == 'qb-target' then
            exports['qb-target']:AddTargetEntity(entity, {options = options})
        elseif Config.Target == 'qtarget' then
            exports.qtarget:AddTargetEntity(entity, {options = options})
        else
            -- Add support for a custom target system here
            -- canInteraction & action/onSelect functions are required
        end
    end
end

-- Function used to remove target options
-- Like above, this is compatible with ox_target, qb-target & qtarget
--- @param global boolean Is target global
--- @param entity any Entity number or nil
--- @param options any Target options table or string or nil
RemoveTarget = function(global, entity, options)
    if global then
        if Config.Target == 'ox_target' then
            exports.ox_target:removeGlobalPed(options)
        elseif Config.Target == 'qb-target' then
            exports['qb-target']:RemoveGlobalPed(nil)
        elseif Config.Target == 'qtarget' then
            exports.qtarget:RemovePed(nil)
        else
            -- Add support for a custom target system here
        end
    else
        if Config.Target == 'ox_target' then
            exports.ox_target:removeLocalEntity(entity, options)
        elseif Config.Target == 'qb-target' then
            exports['qb-target']:RemoveTargetEntity(entity, nil)
        elseif Config.Target == 'qtarget' then
            exports.qtarget:RemoveTargetEntity(entity, options)
        else
            -- Add support for a custom target system here
        end
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

-- Function used to set specific events to entities when selling
--- @param entity number
SetEntityEvents = function(entity)
    ClearPedTasksImmediately(entity)
    TaskTurnPedToFaceEntity(cache.ped, entity, -1)
    TaskTurnPedToFaceEntity(entity, cache.ped, -1)
    SetBlockingOfNonTemporaryEvents(entity, true)
    SetEntityInvincible(entity, true)
end

-- Function used to clear specific events applied above after selling
--- @param entity number
ClearEntityEvents = function(entity)
    SetBlockingOfNonTemporaryEvents(entity, false)
    SetEntityInvincible(entity, false)
    ClearPedTasks(cache.ped)
    ClearPedTasks(entity)
end

-- Function used to check a players job upon entering a zone
BlacklistCheck = function()
    local playerJob
    if Framework == 'esx' then
        playerJob = ESX.GetPlayerData().job.name
    elseif Framework == 'qb' then
        playerJob = QBCore.Functions.GetPlayerData().job.name
    else
        -- Add support for a custom framework here
    end
    for _, job in pairs(Config.BlacklistJobs) do
        if playerJob == job then
            return true
        end
    end
    return false
end

-- Function used to display the textUI
--- @param label string The label to be displayed
ShowTextUI = function(label)
    if lib.isTextUIOpen() then
        return
    else
        lib.showTextUI(label, {
            position = Strings.TextUI.position,
            icon = Strings.TextUI.icon
        })
    end
end

-- Function used to hide the textUI
HideTextUI = function()
    if lib.isTextUIOpen() then
        lib.hideTextUI()
    end
end

-- Empty function that check if a drug sale can continue or not
-- Must return true to proceed, or return false to cancel
--- @param data table Contains all data related to the zone the player is trying to sell in
CanSell = function(data)
    if IsPedInAnyVehicle(cache.ped, true) then
        ShowNotification(Strings.Notify.noVehicle, 'error')
        return false
    end
    return true
end