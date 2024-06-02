local targetId = 5
local usedTargetModels = {}
local usedBoxZones = {}
local usedEntities = {}

local function GetUniqueTargetName()
    targetId = targetId + 1
    return "casinotarget_" .. targetId
end

TargetType = {
    NO_TARGET = 0,
    Q_TARGET = 1,
    BT_TARGET = 2,
    QB_TARGET = 3,
    OX_TARGET = 4
}

TargetTypeResourceName = {
    [TargetType.NO_TARGET] = "none",
    [TargetType.Q_TARGET] = "qtarget",
    [TargetType.BT_TARGET] = "bt-target",
    [TargetType.QB_TARGET] = "qb-target",
    [TargetType.OX_TARGET] = "ox_target"
}

function CreateTargetZone(coords, length, width, heading, options)
    if not Config.UseTarget then
        return
    end
    Config.ShowHowToPlayUI = 0
    local resourceName = TargetTypeResourceName[Config.TargetZoneType]
    local targetName = GetUniqueTargetName()
    local job = TargetType.BT_TARGET and {"all"} or nil
    local sameExports = {
        [TargetType.Q_TARGET] = true,
        [TargetType.BT_TARGET] = true,
        [TargetType.QB_TARGET] = true
    }

    if Config.TargetZoneType == TargetType.OX_TARGET then
        coords = vector3(coords.x, coords.y, coords.z - 0.5)
        local zoneId = exports.ox_target:addBoxZone({
            name = targetName,
            coords = coords,
            size = vector3(width, length, 2.0),
            rotation = heading,
            -- debug = true,
            minZ = coords.z - length,
            maxZ = coords.z + length,
            options = options,
            distance = 5.0
        })
        usedBoxZones[zoneId] = true
    elseif sameExports[Config.TargetZoneType] then
        local targetoptions = {
            options = options,
            distance = 5.0,
            heading = heading,
            job = job
        }
        exports[resourceName]:AddBoxZone(targetName, coords, length, width, {
            name = targetName,
            heading = heading,
            -- debugPoly = true,
            minZ = coords.z - length,
            maxZ = coords.z + length
        }, targetoptions)
    end
end

function CreateTargetModel(model, options)
    if not Config.UseTarget then
        return
    end
    if not tonumber(model) then
        model = GetHashKey(model)
    end
    usedTargetModels[model] = true
    Config.ShowHowToPlayUI = 0
    local resourceName = TargetTypeResourceName[Config.TargetZoneType]
    local targetName = GetUniqueTargetName()
    local job = TargetType.BT_TARGET and {"all"} or nil
    local sameExports = {
        [TargetType.Q_TARGET] = true,
        [TargetType.BT_TARGET] = true,
        [TargetType.QB_TARGET] = true
    }

    if Config.TargetZoneType == TargetType.OX_TARGET then
        exports.ox_target:addModel(model, options)
    elseif sameExports[Config.TargetZoneType] then
        local targetoptions = {
            options = options,
            distance = 5.0,
            job = job
        }
        if Config.TargetZoneType == TargetType.BT_TARGET then
            model = {model}
        end
        exports[resourceName]:AddTargetModel(model, targetoptions)
    end
end

function CreateTargetEntity(entity, options)
    if not Config.UseTarget then
        return
    end
    if usedEntities[entity] then
        return
    end
    usedEntities[entity] = true
    local resourceName = TargetTypeResourceName[Config.TargetZoneType]
    if Config.TargetZoneType == TargetType.OX_TARGET then
        exports[resourceName]:addLocalEntity(entity, options)
    elseif Config.TargetZoneType == TargetType.QB_TARGET then
        exports[resourceName]:AddTargetEntity(entity, {
            distance = 5.0,
            options = options
        })
    elseif Config.TargetZoneType == TargetType.Q_TARGET then
        exports[resourceName]:AddTargetEntity(entity, options)
    elseif Config.TargetZoneType == TargetType.BT_TARGET then
        local entityCoords = GetEntityCoords(entity)
        CreateTargetZone(entityCoords, 1.0, 1.0, GetEntityHeading(entity), options)
    end
end

function RemoveAllTargetEntities()
    local resourceName = TargetTypeResourceName[Config.TargetZoneType]
    for entityId, v in pairs(usedEntities) do
        if Config.TargetZoneType == TargetType.OX_TARGET then
            exports[resourceName]:removeLocalEntity(entityId)
        elseif Config.TargetZoneType == TargetType.QB_TARGET then
            exports[resourceName]:RemoveTargetEntity(entityId)
        elseif Config.TargetZoneType == TargetType.Q_TARGET then
            exports[resourceName]:RemoveTargetEntity(entityId)
        end
    end
    usedEntities = {}
end

function RemoveAllTargetZones()
    if not Config.UseTarget then
        return
    end
    local resourceName = TargetTypeResourceName[Config.TargetZoneType]
    local targetName = GetUniqueTargetName()

    local sameExports = {
        [TargetType.Q_TARGET] = true,
        [TargetType.BT_TARGET] = true,
        [TargetType.QB_TARGET] = true
    }

    if Config.TargetZoneType == TargetType.OX_TARGET then
        for k, v in pairs(usedTargetModels) do
            exports.ox_target:removeModel(k)
        end
        for k, v in pairs(usedBoxZones) do
            exports.ox_target:removeZone(k)
        end
    elseif sameExports[Config.TargetZoneType] then
        for i = 5, targetId, 1 do
            exports[resourceName]:RemoveZone("casinotarget_" .. i)
        end
        if Config.TargetZoneType ~= TargetType.BT_TARGET then -- bt target doesn't have RemoveTargetModel
            for k, v in pairs(usedTargetModels) do
                exports[resourceName]:RemoveTargetModel(k)
            end
        end
    end
    usedTargetModels = {}
    usedBoxZones = {}
    RemoveAllTargetEntities()
end

RegisterNetEvent("Casino:Target")
AddEventHandler("Casino:Target", function(data)
    if not CAN_INTERACT or LAST_STARTED_GAME_TYPE ~= nil then
        return
    end
    if not data or not data.eventAction then
        return
    end
    if data.eventAction == "wheel_enter" then
        LAST_INTERACTION_GAME = "luckywheel"
        LuckyWheel_OnInteraction(true)
    elseif data.eventAction == "wheel_info" then
        LuckyWheel_ShowWelcome()
    elseif data.eventAction == "slots_start" then
        LAST_INTERACTION_GAME = "slots"
        if not data.entity or not DoesEntityExist(data.entity) then
            return
        end
        local model = GetEntityModel(data.entity)
        local machineData = machineModels[model]
        if not machineData then
            return
        end
        Slots_OnInteraction(data.entity)
    elseif data.eventAction == "slots_info" then
        if not data.entity or not DoesEntityExist(data.entity) then
            return
        end
        local model = GetEntityModel(data.entity)
        Slots_ShowWelcome(model)
    elseif data.eventAction == "cashier_enter" then
        LAST_INTERACTION_GAME = "cashier"
        Cashier_OnInteraction(data.cashierCoords)
    elseif data.eventAction == "drinkingbar_ped" then
        LAST_INTERACTION_GAME = "drinkingbar"
        DrinkingBar_OnInteraction(data.bartenderCoords)
    elseif data.eventAction == "drinkingbar_chair" then
        LAST_INTERACTION_GAME = "drinkingbar"
        Drinkingbar_UseChair(data.chairCoords)
    elseif data.eventAction == "bj_enter" then
        if not data.entity or not DoesEntityExist(data.entity) then
            return
        end
        local tableCoords = GetEntityCoords(data.entity)
        LAST_INTERACTION_GAME = "blackjack"
        Blackjack_OnInteraction(tableCoords)
    elseif data.eventAction == "bj_info" then
        if not data.color or not BlackjackTableDatas[data.color] then
            return
        end
        Blackjack_ShowWelcome(data.color)
    elseif data.eventAction == "poker_enter" then
        if not data.entity or not DoesEntityExist(data.entity) then
            return
        end
        local tableCoords = GetEntityCoords(data.entity)
        LAST_INTERACTION_GAME = "poker"
        Poker_OnInteraction(tableCoords)
    elseif data.eventAction == "poker_info" then
        if not data.color or not PokerTableDatas[data.color] then
            return
        end
        Poker_ShowWelcome(data.color)
    elseif data.eventAction == "rl_enter" then
        if not data.entity or not DoesEntityExist(data.entity) then
            return
        end
        local tableCoords = GetEntityCoords(data.entity)
        LAST_INTERACTION_GAME = "roulette"
        Roulette_OnInteraction(tableCoords)
    elseif data.eventAction == "rl_info" then
        if not data.color or not RouletteTableDatas[data.color] then
            return
        end
        Roulette_ShowWelcome(data.color)
    elseif data.eventAction == "it_start" then
        if not data.chairId then
            return
        end
        LAST_INTERACTION_GAME = "insidetrack"
        InsideTrack_OnInteraction()
    elseif data.eventAction == "it_info" then
        InsideTrack_ShowWelcome()
    elseif data.eventAction == "podium_info" then
        Podium_ShowFullscreenInfo()
    elseif data.eventAction == "seat_enter" then
        LAST_INTERACTION_GAME = "seating"
        Seating_OnInteraction(data.chairIndex)
    elseif data.eventAction == "elevator_enter" then
        StartElevatorScene(data.elevator)
    elseif data.eventAction == "cameras_enter" then
        LAST_INTERACTION_GAME_TYPE = "cameras"
        LAST_INTERACTION_GAME = "cameras"
        Office.OnInteraction()
    end
end)
