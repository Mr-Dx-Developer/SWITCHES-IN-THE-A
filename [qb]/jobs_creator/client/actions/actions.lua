local canDoAnyAction = false

JobsCreator.activeActions = {} -- This saves Utils.eventsPrefix .. ':checkAllowedActions' data

local canCheckDrivingLicense = false
local canCheckWeaponLicense = false
local canPlaceAnyObject = false
local placeableObjects = {}
local actionsMenuEnabled = false

-- If the ONLY allowed "actions" are these one, the actions menu wont't open
local ACTIONS_BLACKLIST = {
    ["whitelisted"] = true,
    ["actionsMenuEnabled"] = true,
    ["placeableObjects"] = true,
}

local menuElements = {}

local function checkAllowedActions()
    while not config do Citizen.Wait(100) end
    
    canDoAnyAction = false
    canPlaceAnyObject = false

    JobsCreator.activeActions = TriggerServerPromise(Utils.eventsPrefix .. ':checkAllowedActions')
    
    for action, enabled in pairs(JobsCreator.activeActions) do
        if(enabled and not ACTIONS_BLACKLIST[action]) then canDoAnyAction = true break end
    end

    actionsMenuEnabled = JobsCreator.activeActions.actionsMenuEnabled
    placeableObjects = JobsCreator.activeActions.placeableObjects

    if(placeableObjects) then
        for objectModel, _ in pairs(placeableObjects) do
            canPlaceAnyObject = true
            canDoAnyAction = true
            break
        end
    end

    local actions = {
        {condition = JobsCreator.activeActions.enableBilling, label = getLocalizedText('actions_billing'), value = 'createBilling', type = 'player'},
        {condition = JobsCreator.activeActions.canRob, label = getLocalizedText('actions_search'), value = 'search', type = 'player'},
        {condition = JobsCreator.activeActions.canHandcuff, label = getLocalizedText('actions_put_soft_handcuffs'), value = 'softHandcuff', type = 'player'},
        {condition = JobsCreator.activeActions.canHandcuff, label = getLocalizedText('actions_put__hard_handcuffs'), value = 'hardHandcuff', type = 'player'},
        {condition = JobsCreator.activeActions.canHandcuff, label = getLocalizedText('actions_start_dragging'), value = 'drag', type = 'player'},
        {condition = JobsCreator.activeActions.canHandcuff, label = getLocalizedText('actions_put_in_car'), value = 'putInCar', type = 'player'},
        {condition = JobsCreator.activeActions.canHandcuff, label = getLocalizedText('actions_take_from_car'), value = 'takeFromCar', type = 'vehicle'},
        {condition = JobsCreator.activeActions.canLockpickCars, label = getLocalizedText('actions_lockpick_car'), value = 'lockpickCar', type = 'vehicle'},
        {condition = JobsCreator.activeActions.canWashVehicles, label = getLocalizedText('actions:wash_vehicle'), value = 'washVehicle', type = 'vehicle'},
        {condition = JobsCreator.activeActions.canRepairVehicles, label = getLocalizedText('actions:repair_vehicle'), value = 'repairVehicle', type = 'vehicle'},
        {condition = JobsCreator.activeActions.canImpoundVehicles, label = getLocalizedText('actions:impound_vehicle'), value = 'impoundVehicle', type = 'vehicle'},
        {condition = JobsCreator.activeActions.canCheckIdentity, label = getLocalizedText('actions:check_identity'), value = 'checkIdentity', type = 'player'},
        {condition = JobsCreator.activeActions.canCheckVehicleOwner, label = getLocalizedText('actions:check_vehicle_owner'), value = 'checkVehicleOwner', type = 'vehicle'},
        {condition = JobsCreator.activeActions.canCheckDrivingLicense or JobsCreator.activeActions.canCheckWeaponLicense, label = getLocalizedText('actions:check_licenses'), value = 'checkLicenses', type = 'player'},
        {condition = JobsCreator.activeActions.canHeal, label = getLocalizedText('actions:heal_small'), value = 'healSmall', type = 'player'},
        {condition = JobsCreator.activeActions.canHeal, label = getLocalizedText('actions:heal_big'), value = 'healBig', type = 'player'},
        {condition = JobsCreator.activeActions.canRevive, label = getLocalizedText('actions:revive'), value = 'revive', type = 'player'},
        {condition = canPlaceAnyObject, label = getLocalizedText('actions:place_object'), value = 'placeObject', type = nil, extraData = placeableObjects},
    }

    menuElements = {}

    for i=1, #actions do
        local action = actions[i]

        if action.condition then
            table.insert(menuElements, action)

            if(action.type == "player") then
                Target.addGlobalPlayerToTargeting(action.value, action.label, {onSelect = function(data) local entity = type(data) == "table" and data.entity or data; TriggerEvent(Utils.eventsPrefix .. ':actions:' .. action.value, entity) end })
            elseif(action.type == "vehicle") then
                Target.addGlobalVehicleToTargeting(action.value, action.label, {onSelect = function(data) local entity = type(data) == "table" and data.entity or data; TriggerEvent(Utils.eventsPrefix .. ':actions:' .. action.value, entity) end })
            end
        else
            if(action.type == "player") then
                Target.removeGlobalPlayerFromTargeting(action.value)
            elseif(action.type == "vehicle") then
                Target.removeGlobalVehicleFromTargeting(action.value)
            end
        end

        JobsCreator.activeActions[action.value] = action.condition
    end

    return JobsCreator.activeActions
end

function getClosestPlayerId(maxDistance)
    maxDistance = maxDistance or 2.0

    local plyPed = PlayerPedId()
    local plyCoords = GetEntityCoords(plyPed)

    local closestPlayerId, closestDistance = ESX.Game.GetClosestPlayer(plyCoords)

    if(closestPlayerId == PlayerId()) then
        closestPlayerId, closestDistance = ESX.Game.GetClosestPlayer()
    end
    
    if(closestPlayerId ~= -1 and closestDistance and closestDistance < maxDistance) then
        return closestPlayerId
    else
        return false
    end
end

function getClosestPed(maxDistance)
    maxDistance = maxDistance or 2.0

    local closestPlayer, closestDistance = ESX.Game.GetClosestPed()

    if(closestPlayer ~= -1 and closestDistance and closestDistance < maxDistance) then
        return closestPlayer
    else
        return false
    end
end

RegisterNetEvent(Utils.eventsPrefix .. ':actions:checkLicenses', function() 
    local elements = {}

    if(JobsCreator.activeActions.canCheckDrivingLicense) then
        table.insert(elements, {label = getLocalizedText('actions:driving_license'), value = "driver"})
    end

    if(JobsCreator.activeActions.canCheckWeaponLicense) then
        table.insert(elements, {label = getLocalizedText('actions:weapon_license'), value = "weapon"})
    end    

    Framework.menu().Open('default', GetCurrentResourceName(), 'check_licenses', {
        title = getLocalizedText('actions_menu'),
        align = config.menuPosition,
        elements = elements
    }, 
    function(data, menu) 
        local licenseCategory = data.current.value

        openLicenseMenu(licenseCategory)
    end,
    function(data, menu)
        menu.close()
    end)
end)

local function openActionsMenu()
    if not canDoAnyAction or not actionsMenuEnabled or IsPedDeadOrDying(PlayerPedId()) then return end
    if(canDoAnyAction and (not config.canUseActionsMenuWhileOffDuty and not isOnDuty)) then
        notifyClient(getLocalizedText("you_are_not_on_duty"))
        return
    end

    if(exports[ GetCurrentResourceName() ]:isPlayerHandcuffed()) then
        notifyClient(getLocalizedText("you_cant_while_handcuffed"))
        return
    end

    Framework.menu().CloseAll()

    Framework.menu().Open('default', GetCurrentResourceName(), 'actions_menu', {
        title = getLocalizedText('actions_menu'),
        align = config.menuPosition,
        elements = menuElements
    }, 
    function(data, menu) 
        local action = data.current.value
        local extraData = data.current.extraData

        TriggerEvent(Utils.eventsPrefix .. ':actions:' .. action, extraData)
    end,
    function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent(Utils.eventsPrefix .. ':openActionsMenu', openActionsMenu)

AddEventHandler(Utils.eventsPrefix .. ":clientConfigLoaded", function()
    local message = getLocalizedText('open_actions_menu') or "Open actions menu"
    
    registerAdvancedKeymap("_jobcreator_openactionsmenu", config.actionsMenuKey, "action_key", message, openActionsMenu)
end)

-- Reload allowed actions
RegisterNetEvent('esx:setJob', checkAllowedActions)
RegisterNetEvent('QBCore:Client:OnJobUpdate', checkAllowedActions)

RegisterNetEvent(Utils.eventsPrefix .. ':framework:ready', checkAllowedActions)

-- To refresh manually the allowed actions
RegisterNetEvent(Utils.eventsPrefix .. ':checkAllowedActions', checkAllowedActions)

-- Retrieve player allowed actions from anywhere
exports('getAllowedActions', checkAllowedActions)