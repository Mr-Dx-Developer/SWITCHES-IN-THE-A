-------------------------------------------------
-- Variables
-------------------------------------------------
local lastDrunkLevel = -1
AreEventsBlocked = false
-------------------------------------------------
-- Functions
-------------------------------------------------
function SetBlockingStatusForDrunk(status)
    AreEventsBlocked = status
end

exports("SetBlockingStatusForDrunk", SetBlockingStatusForDrunk)

function IsDrunkBlocked()
    return AreEventsBlocked
end

exports("IsDrunkBlocked", IsDrunkBlocked)

-------------------------------------------------
-- Command test
-------------------------------------------------
if Config.Debug then
    local block = false
    RegisterCommand("blockdrunk", function(source, args)
        block = not block
        SetBlockingStatusForDrunk(block)

        print("Blocking status: ", block)
    end)

    RegisterCommand("drunk", function(source, args)
        SetPlayerDrunkPercentage(tonumber(args[1]))
    end)

    RegisterCommand("headache", function(source, args)
        SetPlayerHeadachePercentage(tonumber(args[1]))
    end)

    RegisterCommand("vomit", function(source, args)
        Wait(3500)
        PlayVomitAnimation()
    end)
end
-------------------------------------------------
-- NUI event list
-------------------------------------------------
RegisterNUICallback("init", function(data, cb)
    SendNUIMessage({
        type = "UI",
        status = Config.EnableHud,
    })

    SendNUIMessage({
        type = "max_alcohol",
        maxAlcohol = Config.MaximumMilligramsInBlood,
    })

    if cb then
        cb('ok')
    end
end)
-------------------------------------------------
-- Thread list
-------------------------------------------------
--- Will just make keys in the array to make it more simple in code to check the job.
CreateThread(function()
    for k, v in pairs(Config.WhitelistedJobsToTestBreath) do
        Config.WhitelistedJobsToTestBreath[v] = true
    end
end)

--- preload animations
CreateThread(function()
    for _, dict in pairs(DrunkWalkList) do
        RequestAnimSet(dict)
    end
end)

if Config.FrameworkType.Active == FrameworkType.CUSTOM then
    --- Will call on server to fetch drunk level
    CreateThread(function()
        TriggerServerEvent(TriggerName("FetchPlayerDrunkLevel"))
    end)

    --- Reset all effect on start
    CreateThread(function()
        while true do
            Wait(60000)
            if lastDrunkLevel ~= DrunkPercentage then
                TriggerServerEvent(TriggerName("SavePlayerData"), GetPlayerDrunkPercentage(), GetPlayerHeadachePercentage())
                lastDrunkLevel = DrunkPercentage
            end
        end
    end)
end

-- ESX
if Config.FrameworkType.Active == FrameworkType.ESX then
    local loaded = false

    CreateThread(function()
        local obj = GetSharedObject()
        if obj.IsPlayerLoaded() then
            TriggerServerEvent(TriggerName("FetchPlayerDrunkLevel"))
            loaded = true
        end
    end)

    RegisterNetEvent(Config.ExtendedEvents.PlayerLoaded, function()
        --- Will call on server to fetch drunk level
        TriggerServerEvent(TriggerName("FetchPlayerDrunkLevel"))
        loaded = true
    end)

    --- will save player data if loaded
    CreateThread(function()
        while true do
            Wait(60000)
            if loaded then
                if lastDrunkLevel ~= DrunkPercentage then
                    TriggerServerEvent(TriggerName("SavePlayerData"), GetPlayerDrunkPercentage(), GetPlayerHeadachePercentage())
                    lastDrunkLevel = DrunkPercentage
                end
            end
        end
    end)
end

-- QBCore
if Config.FrameworkType.Active == FrameworkType.QBCORE then
    local loaded = false
    CreateThread(function()
        local obj = GetSharedObject()
        if obj.Functions.GetPlayerData().citizenid then
            TriggerServerEvent(TriggerName("FetchPlayerDrunkLevel"))
            loaded = true
        end
    end)

    --- Will call on server to fetch drunk level
    RegisterNetEvent(Config.QBCoreEvents.OnPlayerLoaded, function()
        TriggerServerEvent(TriggerName("FetchPlayerDrunkLevel"))
        loaded = true
    end)

    --- will save player data if loaded
    CreateThread(function()
        while true do
            Wait(60000)
            if loaded then
                if lastDrunkLevel ~= DrunkPercentage then
                    TriggerServerEvent(TriggerName("SavePlayerData"), GetPlayerDrunkPercentage(), GetPlayerHeadachePercentage())
                    lastDrunkLevel = DrunkPercentage
                end
            end
        end
    end)
end

--- Reset all effect on start
AddEventHandler("onResourceStop", function(res)
    if GetCurrentResourceName() ~= res then
        return
    end
    local ped = PlayerPedId()

    SetPedIsDrunk(ped, false)
    SetPedMotionBlur(ped, false)
    ResetPedMovementClipset(ped, 0)
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)

    ResetPedMovementClipset(ped, 0.0)
    SetTimecycleModifier("spectator5")
    SetTimecycleModifierStrength(0.0)
end)

--- player do not wish to pay so we will set nui focus on false
RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)

    if cb then
        cb('ok')
    end
end)

RegisterNetEvent(TriggerName("SetPlayerData"), function(data)
    SetPlayerDrunkPercentage((data.drunk_level))
    SetPlayerHeadachePercentage((data.headache_level))
    SetDrunkerType(data.toughness)

    SendNUIMessage({
        type = "headache",
        value = GetPlayerHeadachePercentage(),
    })

    SendNUIMessage({
        type = "drunk",
        value = GetPlayerDrunkPercentage(),
    })
end)

AddEventHandler("onResourceStop", function(res)
    if (GetCurrentResourceName() ~= res) then
        return
    end

    RemoveNetworkedScenes()
    DeleteEntity(RealBottle)
    DeleteEntity(RealGlass)
    DeleteEntity(BottleObject)

    TriggerServerEvent(TriggerName("SavePlayerData"), GetPlayerDrunkPercentage(), GetPlayerHeadachePercentage())

    for k, v in pairs(Config.DrinkTable) do
        if v.bottle then
            DeleteEntity(v.bottle)
        end

        if v.glass then
            DeleteEntity(v.glass)
        end
    end

    Animation.ResetAll()
end)

function dump(node, printing)
    local cache, stack, output = {}, {}, {}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k, v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k, v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str, "}", output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str, "\n", output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output, output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "[" .. tostring(k) .. "]"
                else
                    key = "['" .. tostring(k) .. "']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = " .. tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = {\n"
                    table.insert(stack, node)
                    table.insert(stack, v)
                    cache[node] = cur_index + 1
                    break
                else
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = '" .. tostring(v) .. "'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output, output_str)
    output_str = table.concat(output)
    if not printing then
        print(output_str)
    end
    return output_str
end

Dump = dump