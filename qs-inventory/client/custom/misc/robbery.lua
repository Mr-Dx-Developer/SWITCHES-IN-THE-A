if not Config.Handsup then
    return
end

local lib, anim = 'missminuteman_1ig_2', 'handsup_base'
local canHandsUp = true
local deadPlayer = false

local function LoadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

RegisterKeyMapping('handsup', Lang('INVENTORY_KEYMAPPING_HANDSUP_LABEL'), 'keyboard', Config.KeyBinds.handsup)

RegisterCommand('handsup', function()
    if not IsPedInAnyVehicle(PlayerPedId(), false) and GetEntityHealth(PlayerPedId()) > 1 then
        RequestAnimDict(lib)
        while not HasAnimDictLoaded(lib) do
            Wait(100)
        end
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
        if IsEntityPlayingAnim(PlayerPedId(), lib, anim, 3) then
            ClearPedSecondaryTask(PlayerPedId())
        else
            if canHandsUp then
                TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.5, -1, 49, 0, 0, 0, 0)
            end
        end
    end
end)

RegisterNetEvent(Config.InventoryPrefix .. ':client:RobPlayer')
AddEventHandler(Config.InventoryPrefix .. ':client:RobPlayer', function(TargetId)
    local ped = PlayerPedId()
    if IsPedArmed(ped, 1) or IsPedArmed(ped, 2) or IsPedArmed(ped, 4) or deadPlayer or Config.StealWithoutWeapons then
        SendNUIMessage({
            action = 'RobPlayer',
            TargetId = TargetId,
        })
        if Config.Framework == 'qb' then
            Debug('The steal money button was enabled because you use qb, target id:', TargetId)
            SendNUIMessage({
                action = 'RobCash',
                TargetId = TargetId,
            })
        end
    end
    deadPlayer = false
end)

RegisterNetEvent(Config.InventoryPrefix .. ':client:search', function()
    local player, distance = GetClosestPlayer(GetEntityCoords(PlayerPedId()))
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        local searchPlayerPed = GetPlayerPed(player)
        if IsEntityPlayingAnim(searchPlayerPed, 'missminuteman_1ig_2', 'handsup_base', 3) or Config.StealDeadPlayer and checkEntityDead(playerId, searchPlayerPed) or GetEntityHealth(searchPlayerPed) <= 0 then
            TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'otherplayer', playerId)
        else
            SendTextMessage(Lang('INVENTORY_NOTIFICATION_NO_HANDSUP'), 'error')
        end
    else
        SendTextMessage(Lang('INVENTORY_NOTIFICATION_NO_PLAYERS'), 'error')
    end
end)

local function checkPlayerIsNear(targetPlayer)
    CreateThread(function()
        while true do
            Wait(100)
            local targetPed = GetPlayerPed(targetPlayer)

            if not DoesEntityExist(targetPed) or NetworkIsPlayerActive(targetPlayer) == false then
                TriggerEvent(Config.InventoryPrefix .. ':client:closeinv')
                SendTextMessage(Lang('INVENTORY_NOTIFICATION_ROBBERY_AWAY'), 'inform')
                break
            end

            local playerCoords = GetEntityCoords(PlayerPedId())
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)

            if distance > 5 then
                Wait(500)
                TriggerEvent(Config.InventoryPrefix .. ':client:closeinv')
                SendTextMessage(Lang('INVENTORY_NOTIFICATION_ROBBERY_AWAY'), 'inform')
                break
            end
        end
    end)
end

RegisterNetEvent(Config.InventoryPrefix .. ':client:playerRobbery')
AddEventHandler(Config.InventoryPrefix .. ':client:playerRobbery', function()
    local player, distance = GetClosestPlayer(GetEntityCoords(PlayerPedId()))
    if player ~= -1 and distance < 3.0 then
        local searchPlayerPed = GetPlayerPed(player)
        local playerId = GetPlayerServerId(player)
        TriggerEvent(Config.InventoryPrefix .. ':client:forceCloseInventory')
        Wait(500)

        if checkEntityDead(playerId, searchPlayerPed) then
            RequestAnimDict('amb@world_human_gardener_plant@male@base')
            while not HasAnimDictLoaded('amb@world_human_gardener_plant@male@base') do
                Wait(100)
            end
            TaskPlayAnim(PlayerPedId(), 'amb@world_human_gardener_plant@male@base', 'base', 8.0, -8, -1, 1, 0, 0, 0, 0)
            ProgressBar('steal_playerdead', Lang('INVENTORY_PROGRESS_STEAL'), 5500, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                TaskPlayAnim(PlayerPedId(), 'amb@world_human_gardener_plant@male@base', 'base', 8.0, -8, -1, 1, 0, 0, 0, 0)
                TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'otherplayer', playerId)
                checkPlayerIsNear(player)
                inRobbery = true
            end, function() -- Cancel
                ClearPedTasks(PlayerPedId())
            end)
            return
        end

        if DoesEntityExist(searchPlayerPed) and IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) and not checkEntityDead(playerId, searchPlayerPed) then
            LoadAnimDict('combat@aim_variations@arrest')
            TaskPlayAnim(PlayerPedId(), 'combat@aim_variations@arrest', 'cop_med_arrest_01', 8.0, -8, -1, 1, 0, 0, 0, 0)
            ProgressBar('steal_player', Lang('INVENTORY_PROGRESS_STEAL'), 5500, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                TaskPlayAnim(PlayerPedId(), 'combat@aim_variations@arrest', 'cop_med_arrest_01', 8.0, -8, -1, 1, 0, 0, 0, 0)
                TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'otherplayer', playerId)
                SetPedConfigFlag(PlayerPedId(), 36, true)
                checkPlayerIsNear(player)
                inRobbery = true
            end, function() -- Cancel
                ClearPedTasks(PlayerPedId())
            end)
        else
            SendTextMessage(Lang('INVENTORY_NOTIFICATION_NO_HANDSUP'), 'error')
        end
    end
end)

function checkPlayerRobbery(other)
    if other and other.id then
        local target = tonumber(other.id)
        local playerTarget = GetPlayerFromServerId(target)
        local pedTarget = GetPlayerPed(playerTarget)
        if other ~= nil then
            currentOtherInventory = other.name
        end
        if target and DoesEntityExist(pedTarget) then
            local pos = GetEntityCoords(playerPed)
            local targetPos = GetEntityCoords(pedTarget)
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z, true)
            if distance < 3.0 then
                inInventory = true
                deadPlayer = true
                StealingPed = pedTarget
                TriggerEvent(Config.InventoryPrefix .. ':client:RobPlayer', target)
            end
        end
    else
        local closestPlayer, closestDistance = GetClosestPlayer(GetEntityCoords(PlayerPedId()))
        if closestPlayer and closestPlayer ~= -1 and closestDistance < 3.0 then
            local playerId = GetPlayerServerId(closestPlayer)
            local searchPlayerPed = GetPlayerPed(closestPlayer)
            if searchPlayerPed and searchPlayerPed ~= 0 then
                if Config.StealDeadPlayer and checkEntityDead(playerId, searchPlayerPed) then
                    inInventory = true
                    deadPlayer = true
                    StealingPed = searchPlayerPed
                    TriggerEvent(Config.InventoryPrefix .. ':client:RobPlayer', playerId)
                end
                if IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) then
                    inInventory = true
                    deadPlayer = false
                    StealingPed = searchPlayerPed
                    TriggerEvent(Config.InventoryPrefix .. ':client:RobPlayer', playerId)
                end
            end
        end
    end
end
