-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
playerLoaded, isDead, isBusy, disableKeys, cuffProp, isCuffed, inMenu, isRagdoll, cuffTimer, escorting, escorted, GSRData =
    nil, nil, nil, nil, nil, nil, nil, nil, {}, {}, {}, {}
QBCore = nil
if wsb.framework == 'qb' then QBCore = exports['qb-core']:GetCoreObject() end


RegisterNetEvent('wasabi_police:tackled', function(targetId)
    getTackled(targetId)
end)

RegisterNetEvent('wasabi_police:tackle', function()
    tacklePlayer()
end)

AddEventHandler('wasabi_bridge:onPlayerSpawn', function()
    isDead = false
end)

AddEventHandler('wasabi_bridge:onPlayerDeath', function()
    --    isDead = true
    if isCuffed then
        uncuffed()
    end
    if escorting?.active then
        escorting.active = nil
        escorting.target = nil
    end
    if escorted?.active then
        TriggerServerEvent('wasabi_police:escortPlayerStop', escorted.pdId, true)
        escorted.active = nil
        escorted.pdId = nil
    end
end)

AddEventHandler('wasabi_police:searchPlayer', function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    local coords = GetEntityCoords(cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    else
        searchPlayer(player)
    end
end)

AddEventHandler('wasabi_police:grantLicense', function()
    local job, grade = wsb.hasGroup(Config.policeJobs)
    if not job or not grade then return end
    if tonumber(grade) < Config.GrantWeaponLicenses.minGrade then
        TriggerEvent('wasabi_bridge:notify', Strings.grade_to_low, Strings.grade_to_low_desc, 'error')
        return
    end
    local coords = GetEntityCoords(cache.ped)
    local closestPlayers = wsb.getNearbyPlayers(vector3(coords.x, coords.y, coords.z), 10.0)
    if #closestPlayers < 1 then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        return
    end
    local playerList = {}
    for i = 1, #closestPlayers do
        playerList[#playerList + 1] = {
            id = GetPlayerServerId(closestPlayers[i])
        }
    end
    local nearbyPlayers = lib.callback.await('wasabi_police:getPlayerData', 100, playerList)
    local Options = {}
    for _, v in pairs(nearbyPlayers) do
        Options[#Options + 1] = {
            icon = 'user',
            label = v.name,
            description = Strings.player_id .. ' ' .. v.id,
            args = { id = v.id }
        }
    end
    lib.registerMenu({
        id = 'give_license_menu',
        title = Strings.select_player,
        position = Config.GrantWeaponLicenses.menuPosition,
        options = Options
    }, function(selected, scrollIndex, args)
        if selected then
            GiveWeaponLicense(args.id)
        end
    end)
    lib.showMenu('give_license_menu')
end)

AddEventHandler('wasabi_police:spawnVehicle', function(data)
    inMenu = false
    local model = data.model
    local category = Config.Locations[data.station].vehicles.options[data.grade][data.model].category
    local spawnLoc = Config.Locations[data.station].vehicles.spawn[category]
    if not IsModelInCdimage(GetHashKey(model)) then
        print('Vehicle model not found: ' .. model)
    else
        local nearbyVehicles = wsb.getNearbyVehicles(vec3(spawnLoc.coords.x, spawnLoc.coords.y, spawnLoc.coords.z), 6.0,
            true)
        if #nearbyVehicles > 0 then
            TriggerEvent('wasabi_bridge:notify', Strings.spawn_blocked, Strings.spawn_blocked_desc, 'error')
            return
        end
        DoScreenFadeOut(800)
        while not IsScreenFadedOut() do
            Wait(100)
        end
        lib.requestModel(model, 3000)
        local vehicle = CreateVehicle(GetHashKey(model), spawnLoc.coords.x, spawnLoc.coords.y, spawnLoc.coords.z,
            spawnLoc.heading, true, false)
        TaskWarpPedIntoVehicle(cache.ped, vehicle, -1)
        if Config.customCarlock then
            local plate = GetVehicleNumberPlateText(vehicle)
            wsb.giveCarKeys(plate, model, vehicle)
        end
        SetModelAsNoLongerNeeded(model)
        DoScreenFadeIn(800)
    end
end)

AddEventHandler('gameEventTriggered', function(event, data)
    if event ~= 'CEventNetworkEntityDamage' then return end
    local playerPed = cache.ped
    local victim, victimDied = data[1], data[4]
    if not IsPedAPlayer(victim) then return end
    local player = PlayerId()
    if victimDied then return end
    if not IsPedAPlayer(victim) or NetworkGetPlayerIndexFromPed(victim) ~= player then return end
    if escorting.active then
        TriggerServerEvent('wasabi_police:releasePlayer', escorting.target)
        escorting.active = nil
        escorting.target = nil
    end
end)

RegisterNetEvent('wasabi_police:arrested', function(pdId, type)
    isBusy = true
    local escaped
    local pdPed = GetPlayerPed(GetPlayerFromServerId(pdId))
    lib.requestAnimDict('mp_arrest_paired', 3000)
    AttachEntityToEntity(cache.ped, pdPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
    TaskPlayAnim(cache.ped, 'mp_arrest_paired', 'crook_p2_back_left', 8.0, -8.0, 5500, 33, 0, false, false, false)
    if Config.handcuff.skilledEscape.enabled then
        if lib.skillCheck(Config.handcuff.skilledEscape.difficulty) then
            escaped = true
        end
    end
    FreezeEntityPosition(pdPed, true)
    Wait(2000)
    DetachEntity(cache.ped, true, false)
    FreezeEntityPosition(pdPed, false)
    RemoveAnimDict('mp_arrest_paired')
    if not escaped then
        handcuffed(type)
    end
    isBusy = false
end)

RegisterNetEvent('wasabi_police:arrest', function()
    isBusy = true
    lib.requestAnimDict('mp_arrest_paired', 3000)
    TaskPlayAnim(cache.ped, 'mp_arrest_paired', 'cop_p2_back_left', 8.0, -8.0, 3400, 33, 0, false, false, false)
    Wait(3000)
    isBusy = false
end)

RegisterNetEvent('wasabi_police:handcuffPlayer', function(args)
    local approved = IsTriggerApproved(GetInvokingResource())
    if not approved then return end

    local type = (args?.type or args?.args?.type) or nil
    local hasItem
    if not type then type = Config.handcuff.defaultCuff or 'hard' end
    if Config.handcuff?.cuffItem?.enabled and Config.handcuff?.cuffItem?.required then
        hasItem = lib.callback.await('wasabi_police:itemCheck', 100, Config.handcuff.cuffItem.item)
    else
        hasItem = true
    end
    if not hasItem or hasItem == 0 then
        TriggerEvent('wasabi_bridge:notify', Strings.no_cuffs, Strings.no_cuffs_desc, 'error')
        return
    end
    local coords = GetEntityCoords(cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        return
    end
    handcuffPlayer(GetPlayerServerId(player), type)
end)

RegisterNetEvent('wasabi_police:uncuffAnim', function(target)
    local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
    local targetCoords = GetEntityCoords(targetPed)
    if escorting?.active then
        escorting.active = nil
        escorting.target = nil
    end
    TaskTurnPedToFaceCoord(cache.ped, targetCoords.x, targetCoords.y, targetCoords.z, 2000)
    Wait(2000)
    TaskStartScenarioInPlace(cache.ped, 'PROP_HUMAN_PARKING_METER', 0, true)
    Wait(2000)
    ClearPedTasks(cache.ped)
end)

RegisterNetEvent('wasabi_police:lockpickHandcuffs', function()
    if not Config.handcuff?.lockpicking?.enabled then return end
    local coords = GetEntityCoords(cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player then return end
    local sId = GetPlayerServerId(player)
    if not lib.callback.await('wasabi_police:isCuffed', 100, sId) then return end
    local playerPed = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(playerPed)
    TaskTurnPedToFaceCoord(cache.ped, playerCoords.x, playerCoords.y, playerCoords.z, 2000)
    Wait(2000)
    TaskStartScenarioInPlace(cache.ped, 'PROP_HUMAN_PARKING_METER', 0, true)
    if lib.skillCheck(Config.handcuff.lockpicking.difficulty) then
        TriggerServerEvent('wasabi_police:lockpickHandcuffs', sId)
        TriggerEvent('wasabi_bridge:notify', Strings.success, Strings.lockpick_handcuff_success, 'success')
    else
        TriggerEvent('wasabi_bridge:notify', Strings.failed, Strings.lockpick_handcuff_fail, 'error')
        local random = math.random(1, 100)
        if random <= Config.handcuff.lockpicking.breakChance then
            TriggerServerEvent('wasabi_police:breakLockpick')
            TriggerEvent('wasabi_bridge:notify', Strings.lockpick_broke, Strings.lockpick_broke_desc, 'error')
        end
    end
    ClearPedTasks(cache.ped)
end)

RegisterNetEvent('wasabi_police:uncuff', function()
    uncuffed()
end)

RegisterNetEvent('wasabi_police:stopEscorting', function(targetId)
    if not escorting.active or escorting.target ~= targetId then return end
    escorting.active = nil
    escorting.target = nil
end)

AddEventHandler('wasabi_police:escortPlayer', function()
    local approved = IsTriggerApproved(GetInvokingResource())
    if not approved then return end
    local coords = GetEntityCoords(cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    else
        escortPlayer(GetPlayerServerId(player))
    end
end)

AddEventHandler('wasabi_police:lockpickVehicle', function()
    local coords = GetEntityCoords(cache.ped)
    local vehicle = wsb.getClosestVehicle(vec3(coords.x, coords.y, coords.z), 5.0, false)
    if not vehicle or not DoesEntityExist(vehicle) then
        TriggerEvent('wasabi_bridge:notify', Strings.vehicle_not_found, Strings.vehicle_not_found_desc, 'error')
    else
        local vehCoords = GetEntityCoords(vehicle)
        local dist = #(vec3(coords.x, coords.y, coords.z) - vec3(vehCoords.x, vehCoords.y, vehCoords.z))
        if dist < 2.5 then
            lockpickVehicle(vehicle)
        else
            TriggerEvent('wasabi_bridge:notify', Strings.too_far, Strings.too_far_desc, 'error')
        end
    end
end)

AddEventHandler('wasabi_police:impoundVehicle', function()
    local coords = GetEntityCoords(cache.ped)
    local vehicle = wsb.getClosestVehicle(vec3(coords.x, coords.y, coords.z), 5.0, false)
    if not vehicle or not DoesEntityExist(vehicle) then
        TriggerEvent('wasabi_bridge:notify', Strings.vehicle_not_found, Strings.vehicle_not_found_desc, 'error')
    else
        local vehCoords = GetEntityCoords(vehicle)
        local dist = #(vec3(coords.x, coords.y, coords.z) - vec3(vehCoords.x, vehCoords.y, vehCoords.z))
        if dist < 2.5 then
            impoundVehicle(vehicle)
        else
            TriggerEvent('wasabi_bridge:notify', Strings.too_far, Strings.too_far_desc, 'error')
        end
    end
end)

AddEventHandler('wasabi_police:vehicleInfo', function()
    local coords = GetEntityCoords(cache.ped)
    local vehicle = wsb.getClosestVehicle(vec3(coords.x, coords.y, coords.z), 5.0, false)
    if not vehicle or not DoesEntityExist(vehicle) then
        TriggerEvent('wasabi_bridge:notify', Strings.vehicle_not_found, Strings.vehicle_not_found_desc, 'error')
    else
        local vehCoords = GetEntityCoords(vehicle)
        local dist = #(vec3(coords.x, coords.y, coords.z) - vec3(vehCoords.x, vehCoords.y, vehCoords.z))
        if dist < 3.5 then
            vehicleInfoMenu(vehicle)
        else
            TriggerEvent('wasabi_bridge:notify', Strings.too_far, Strings.too_far_desc, 'error')
        end
    end
end)

AddEventHandler('wasabi_police:openBossMenu', function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    wsb.openBossMenu()
end)

RegisterNetEvent('wasabi_police:escortedPlayer', function(pdId)
    if isCuffed or deathCheck(GetPlayerServerId(PlayerId())) then
        escorted.active = not escorted.active
        escorted.pdId = pdId
    end
end)

RegisterNetEvent('wasabi_police:setEscort', function(targetId)
    escorting.active = not escorting.active
    escorting.target = targetId
end)

RegisterNetEvent('wasabi_police:putInVehicle', function()
    if isCuffed or deathCheck(GetPlayerServerId(PlayerId())) then
        if escorted.active then
            escorted.active = nil
            escorted.pdId = nil
            Wait(1000)
        end
        local coords = GetEntityCoords(cache.ped)
        local vehicle = wsb.getClosestVehicle(vec3(coords.x, coords.y, coords.z), 5.0, false)
        if not vehicle or not DoesEntityExist(vehicle) then return end
        local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)
        for i = maxSeats - 1, 0, -1 do
            if IsVehicleSeatFree(vehicle, i) then
                freeSeat = i
                break
            end
        end
        if freeSeat then
            --    FreezeEntityPosition(cache.ped, false)
            TaskWarpPedIntoVehicle(cache.ped, vehicle, freeSeat)
            FreezeEntityPosition(cache.ped, true)
        end
    end
end)

RegisterNetEvent('wasabi_police:takeFromVehicle', function(policeID)
    if IsPedSittingInAnyVehicle(cache.ped) then
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        if deathCheck(GetPlayerServerId(PlayerId())) then
            local pdPed = GetPlayerPed(GetPlayerFromServerId(policeID))
            if not pdPed then goto continue end
            local offsetCoords = GetOffsetFromEntityInWorldCoords(pdPed, 0.1, 0.0, 0.0)
            FreezeEntityPosition(cache.ped, false)
            SetEntityCoords(cache.ped, offsetCoords.x, offsetCoords.y, offsetCoords.z, false, false, false, false)
            return
        end
        :: continue ::
        TaskLeaveVehicle(cache.ped, vehicle, 64)
        FreezeEntityPosition(cache.ped, false)
    end
end)

AddEventHandler('wasabi_police:inVehiclePlayer', function()
    local approved = IsTriggerApproved(GetInvokingResource())
    if not approved then return end
    local coords = GetEntityCoords(cache.ped)
    local player = wsb.getClosestPlayer(coords, 4.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    else
        TriggerServerEvent('wasabi_police:inVehiclePlayer', GetPlayerServerId(player))
    end
end)

AddEventHandler('wasabi_police:outVehiclePlayer', function()
    local approved = IsTriggerApproved(GetInvokingResource())
    if not approved then return end
    local coords = GetEntityCoords(cache.ped)
    local player = wsb.getClosestPlayer(coords, 4.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    else
        TriggerServerEvent('wasabi_police:outVehiclePlayer', GetPlayerServerId(player))
    end
end)

AddEventHandler('wasabi_police:vehicleInteractions', function()
    vehicleInteractionMenu()
end)

AddEventHandler('wasabi_police:placeObjects', function()
    placeObjectsMenu()
end)

AddEventHandler('wasabi_police:spawnProp', function(index)
    local prop = Config.Props[index]
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 2.0, 0.55))
    local obj = CreateObjectNoOffset(prop.model, x, y, z, true, false, false)
    SetEntityHeading(obj, GetEntityHeading(cache.ped))
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
end)

AddEventHandler('wasabi_police:licenseMenu', function(data)
    if not wsb.hasGroup(Config.policeJobs) then return end
    openLicenseMenu(data)
end)

AddEventHandler('wasabi_police:purchaseArmoury', function(data)
    if not wsb.hasGroup(Config.policeJobs) then return end
    local data = data
    data.quantity = 1
    if data.multiple then
        local input = lib.inputDialog(Strings.armoury_quantity_dialog, { Strings.quantity })
        if not input then return end
        local input1 = tonumber(input[1])
        if type(input1) ~= 'number' then return end
        local quantity = math.floor(input1)
        if quantity < 1 then
            TriggerEvent('wasabi_bridge:notify', Strings.invalid_amount, Strings.invalid_amount_desc, 'error')
        else
            data.quantity = quantity
        end
    end
    local canPurchase = lib.callback.await('wasabi_police:canPurchase', 100, data)
    if canPurchase then
        TriggerEvent('wasabi_bridge:notify', Strings.success, Strings.successful_purchase_desc, 'success')
    else
        TriggerEvent('wasabi_bridge:notify', Strings.lacking_funds, Strings.lacking_funds_desc, 'error')
    end
end)

AddEventHandler('wasabi_police:checkId', function(targetId)
    if not wsb.hasGroup(Config.policeJobs) then return end
    if targetId and type(targetId) == 'table' then targetId = nil end
    if not targetId then
        local coords = GetEntityCoords(cache.ped)
        local player = wsb.getClosestPlayer(coords, 4.0, false)
        if not player then
            TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        else
            checkPlayerId(GetPlayerServerId(player))
        end
    else
        checkPlayerId(targetId)
    end
end)

AddEventHandler('wasabi_police:revokeLicense', function(data)
    RevokeWeaponLicense(data.targetId, data.license)
    TriggerEvent('wasabi_bridge:notify', Strings.license_revoked, Strings.license_revoked_desc, 'success')
    Wait(420) -- lul
    checkPlayerId(data.targetId)
end)

AddEventHandler('wasabi_police:manageId', function(data)
    manageId(data)
end)

AddEventHandler('wasabi_police:gsrTest', function()
    GSRTestNearbyPlayer()
end)

AddEventHandler('wasabi_police:toggleDuty', function()
    local job, grade = wsb.hasGroup(Config.policeJobs)
    if not job or not grade then return end
    TriggerServerEvent('wasabi_police:svToggleDuty', job, grade)
end)

CreateThread(function()
    while true do
        if isCuffed then
            Wait(0)
            DisablePlayerFiring(cache.playerId, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
            DisableControlAction(0, 75, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            if isCuffed == 'hard' then
                for i = 30, 35 do
                    DisableControlAction(0, i, true)
                end
            end
        else
            Wait(1500)
        end
    end
end)

-- Arrested Loop
CreateThread(function()
    while true do
        local sleep = 1500
        if isCuffed then
            sleep = 0
            if not IsEntityPlayingAnim(cache.ped, 'mp_arresting', 'idle', 3) then
                TaskPlayAnim(cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
                if not IsEntityPlayingAnim(cache.ped, 'mp_arresting', 'idle', 3) then
                    Wait(3000)
                    TaskPlayAnim(cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
                    if not IsEntityPlayingAnim(cache.ped, 'mp_arresting', 'idle', 3) then
                        Wait(2000)
                        TaskPlayAnim(cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
                    end
                end
            end
            if not cuffProp or not DoesEntityExist(cuffProp) then
                lib.requestModel('p_cs_cuffs_02_s', 3000)
                local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 3.0, 0.5))
                cuffProp = CreateObjectNoOffset(`p_cs_cuffs_02_s`, x, y, z, true, false, false)
                SetModelAsNoLongerNeeded(`p_cs_cuffs_02_s`)
                AttachEntityToEntity(cuffProp, cache.ped, GetPedBoneIndex(cache.ped, 57005), 0.04, 0.06, 0.0, -85.24, 4.2,
                    -106.6, true, true, false, true, 1, true)
            end
        elseif cuffProp then
            if DoesEntityExist(cuffProp) then
                SetEntityAsMissionEntity(cuffProp, true, true)
                DetachEntity(cuffProp, false, false)
                DeleteObject(cuffProp)
                ClearPedTasks(cache.ped)
            end
            cuffProp = nil
        end
        if isRagdoll then
            sleep = 0
            SetPedToRagdoll(cache.ped, 1000, 1000, 0, false, false, false)
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('wasabi_police:releasePlayerFromEscort', function(pdID)
    if pdID ~= escorted.pdId then return end
    alrEscorted = false
    escorted.active = nil
    isBusy = nil
    ClearPedTasks(cache.ped)
    DetachEntity(cache.ped, true, false)
end)

-- Escorting loop
CreateThread(function()
    local alrEscorting, textUI
    while true do
        local sleep = 1500
        if escorting?.active then
            sleep = 0
            local targetPed = GetPlayerPed(GetPlayerFromServerId(escorting.target))
            if not textUI then
                wsb.showTextUI(Strings.stop_escorting_interact)
                textUI = true
            end
            if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not deathCheck(escorting.target) then
                if not alrEscorting then
                    lib.requestAnimDict('amb@code_human_wander_drinking_fat@beer@male@base', 3000)
                    TaskPlayAnim(cache.ped, 'amb@code_human_wander_drinking_fat@beer@male@base', 'static', 8.0, 1.0, -1,
                        49, 0, false, false, false)
                    alrEscorting = true
                    RemoveAnimDict('amb@code_human_wander_drinking_fat@beer@male@base')
                elseif alrEscorting and not IsEntityPlayingAnim(cache.ped, 'amb@code_human_wander_drinking_fat@beer@male@base', 'static', 3) then
                    lib.requestAnimDict('amb@code_human_wander_drinking_fat@beer@male@base', 3000)
                    TaskPlayAnim(cache.ped, 'amb@code_human_wander_drinking_fat@beer@male@base', 'static', 8.0, 1.0, -1,
                        49, 0, false, false, false)
                    RemoveAnimDict('amb@code_human_wander_drinking_fat@beer@male@base')
                else
                    sleep = 1500
                end
            elseif DoesEntityExist(targetPed) and deathCheck(escorting.target) then
                if not alrEscorting then
                    lib.requestAnimDict('missfinale_c2mcs_1', 3000)
                    TaskPlayAnim(cache.ped, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 8.0, -8.0, -1, 49, 0, false,
                        false, false)
                    RemoveAnimDict('missfinale_c2mcs_1')
                    alrEscorting = true
                elseif alrEscorting and not IsEntityPlayingAnim(cache.ped, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 3) then
                    lib.requestAnimDict('missfinale_c2mcs_1', 3000)
                    TaskPlayAnim(cache.ped, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 8.0, -8.0, -1, 49, 0, false,
                        false, false)
                    RemoveAnimDict('missfinale_c2mcs_1')
                end
            else
                alrEscorting = nil
                escorting.active = nil
                ClearPedTasks(cache.ped)
            end
            if IsPedArmed(cache.ped, 1) or IsPedArmed(cache.ped, 2) or IsPedArmed(cache.ped, 4) then
                TriggerEvent('wasabi_bridge:notify', Strings.cant_wield, Strings.cant_wield_desc, 'error')
                SetCurrentPedWeapon(cache.ped, `WEAPON_UNARMED`, false)
            end
            if IsControlJustReleased(0, 38) or IsDisabledControlJustReleased(0, 38) or IsPedRagdoll(cache.ped) then
                alrEscorting = nil
                escorting.active = nil
                ClearPedTasks(cache.ped)
                TriggerServerEvent('wasabi_police:releasePlayer', escorting.target)
            end
            sleep = 0
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisablePlayerFiring(PlayerId(), true)
        elseif textUI then
            wsb.hideTextUI()
            textUI = false
        elseif alrEscorting then
            alrEscorting = nil
            escorting.active = nil
            ClearPedTasks(cache.ped)
        else
            sleep = 1500
        end
        Wait(sleep)
    end
end)

-- Being escorted loop
CreateThread(function()
    local alrEscorted
    while true do
        local sleep = 1500
        if escorted?.active and isCuffed then
            sleep = 0
            local pdPed = GetPlayerPed(GetPlayerFromServerId(escorted.pdId))
            if DoesEntityExist(pdPed) and IsPedOnFoot(pdPed) and not IsPedDeadOrDying(pdPed, true) then
                if not alrEscorted then
                    AttachEntityToEntity(cache.ped, pdPed, 11816, 0.26, 0.48, 0.0, 0.0, 0.0, 0.0, false, false, false,
                        false, 2, true)
                    alrEscorted = true
                    isBusy = true
                else
                    sleep = 500
                end
                if IsPedWalking(pdPed) then
                    if not IsEntityPlayingAnim(cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', 3) then
                        lib.requestAnimDict('anim@move_m@prisoner_cuffed', 3000)
                        TaskPlayAnim(cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', 8.0, -8, -1, 1, 0.0, false, false,
                            false)
                    end
                elseif IsPedRunning(pdPed) or IsPedSprinting(pdPed) then
                    if not IsEntityPlayingAnim(cache.ped, 'anim@move_m@trash', 'run', 3) then
                        lib.requestAnimDict('anim@move_m@trash', 3000)
                        TaskPlayAnim(cache.ped, 'anim@move_m@trash', 'run', 8.0, -8, -1, 1, 0.0, false, false, false)
                    end
                elseif IsEntityPlayingAnim(cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', 3) or IsEntityPlayingAnim(cache.ped, 'anim@move_m@trash', 'run', 3) then
                    StopAnimTask(cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', -8.0)
                    StopAnimTask(cache.ped, 'anim@move_m@trash', 'run', -8.0)
                end
            else
                alrEscorted = false
                escorted.active = nil
                isBusy = nil
                DetachEntity(cache.ped, true, false)
            end
        elseif escorted?.active and deathCheck(GetPlayerServerId(PlayerId())) then
            local pdPed = GetPlayerPed(GetPlayerFromServerId(escorted.pdId))
            if not alrEscorted then
                lib.requestAnimDict('nm', 3000)
                ClearPedTasks(cache.ped)
                AttachEntityToEntity(cache.ped, pdPed, 0, 0.33, 0.0, 0.70, -0.20, 0.0, 200.0, false, false, false, false,
                    2, false)
                TaskPlayAnim(cache.ped, 'nm', 'firemans_carry', 8.0, -8.0, -1, 33, 0, false, false, false)
                RemoveAnimDict('nm')
                alrEscorted = true
            elseif alrEscorted and not IsEntityPlayingAnim(cache.ped, 'nm', 'firemans_carry', 3) then
                lib.requestAnimDict('nm', 3000)
                TaskPlayAnim(cache.ped, 'nm', 'firemans_carry', 8.0, -8.0, -1, 33, 0, false, false, false)
                RemoveAnimDict('nm')
            end
        elseif alrEscorted then
            alrEscorted = nil
            isBusy = nil
            DetachEntity(cache.ped, true, false)
            if IsEntityPlayingAnim(cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', 3) or
                IsEntityPlayingAnim(cache.ped, 'anim@move_m@trash', 'run', 3) or
                IsEntityPlayingAnim(cache.ped, 'nm', 'firemans_carry', 3) then
                ClearPedTasks(cache.ped)
            end
        else
            sleep = 1500
        end
        Wait(sleep)
    end
end)

-- GSR thread
if Config.GSR.enabled then
    local GSRLoopBreak, GSRLoopRunning, GSRTextUI = false, false, false
    CreateThread(function()
        while true do
            local sleep = 1500
            if IsPedArmed(cache.ped, 4) then
                sleep = 0
                if IsPedShooting(cache.ped) then
                    GSRData.positive = true
                    TriggerServerEvent('wasabi_police:setGSR', true)
                    if Config.GSR.autoClean then
                        GSRData.timer = Config.GSR.autoClean
                        if GSRLoopRunning then GSRLoopBreak = true end
                        CreateThread(function()
                            while GSRData?.positive do
                                if GSRLoopBreak then
                                    GSRLoopRunning = false
                                    GSRLoopBreak = false
                                    break
                                end
                                GSRLoopRunning = true
                                Wait(1000)
                                if GSRData.timer == 0 then
                                    GSRData.positive = nil
                                    TriggerServerEvent('wasabi_police:setGSR', false)
                                else
                                    GSRData.timer = GSRData.timer - 1
                                end
                            end
                        end)
                    end
                end
            elseif Config.GSR.cleanInWater and GSRData?.positive and IsEntityInWater(cache.ped) then
                sleep = 0
                if not GSRTextUI then
                    wsb.showTextUI(Strings.gsr_wash_ui)
                    GSRTextUI = true
                end
                if IsControlJustReleased(0, 38) then
                    wsb.hideTextUI()
                    if lib.progressCircle({
                            duration = Config.GSR.timeToClean,
                            position = 'bottom',
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                                move = true,
                            },
                            anim = {
                                dict = 'missheist_agency3aig_23',
                                clip = 'urinal_sink_loop'
                            },
                        }) then
                        if GSRData?.positive then GSRData.positive = nil end
                        GSRLoopBreak = false
                        GSRLoopRunning = false
                        GSRTextUI = false
                        TriggerServerEvent('wasabi_police:setGSR', false)
                        TriggerEvent('wasabi_bridge:notify', Strings.hands_clean, Strings.hands_clean_desc, 'success')
                    else
                        TriggerEvent('wasabi_bridge:notify', Strings.cancelled, Strings.cancelled_desc, 'error')
                        GSRTextUI = false
                    end
                end
            elseif GSRTextUI then
                wsb.hideTextUI()
                GSRTextUI = false
            end
            Wait(sleep)
        end
    end)
end

if wsb.framework == 'qb' then
    AddStateBagChangeHandler('isLoggedIn', '', function(_bagName, _key, value, _reserved, _replicated)
        if value then
            wsb.playerData = QBCore.Functions.GetPlayerData()
        end
        wsb.playerLoaded = value
    end)
end

-- Main thread
CreateThread(function()
    while not wsb.playerLoaded do Wait(500) end
    if Config.UseRadialMenu then
        AddRadialItems()
    end
    if Config.useTarget then
        local pdJobs = JobArrayToTarget(Config.policeJobs)
        local options = {}
        if Config.searchPlayers then
            local id = #options + 1
            options[id] = {
                num = id,
                event = 'wasabi_police:searchPlayer',
                label = Strings.search_player,
                job = pdJobs,
                groups = pdJobs,
            }
        end
        options[#options + 1] = {
            num = #options + 1,
            event = 'wasabi_police:checkId',
            icon = 'fas fa-id-card',
            label = Strings.check_id,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            args = { type = 'hard' },
            event = 'wasabi_police:handcuffPlayer',
            icon = 'fas fa-bandage',
            label = Strings.handcuff_hard_player,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            args = { type = 'soft' },
            event = 'wasabi_police:handcuffPlayer',
            icon = 'fas fa-bandage',
            label = Strings.handcuff_soft_player,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            event = 'wasabi_police:escortPlayer',
            icon = 'fas fa-hand-holding-hand',
            label = Strings.escort_player,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            event = 'wasabi_police:inVehiclePlayer',
            icon = 'fas fa-arrow-right-to-bracket',
            label = Strings.put_in_vehicle,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            event = 'wasabi_police:outVehiclePlayer',
            icon = 'fas fa-arrow-right-from-bracket',
            label = Strings.take_out_vehicle,
            job = pdJobs,
            groups = pdJobs,
        }
        wsb.target.player({
            distance = 2.0,
            options = options
        })
        wsb.target.vehicle({
            distance = 2.0,
            options = {
                {
                    num = 1,
                    event = 'wasabi_police:inVehiclePlayer',
                    icon = 'fas fa-arrow-right-to-bracket',
                    label = Strings.put_in_vehicle,
                    job = pdJobs,
                    groups = pdJobs,
                    canInteract = function()
                        return escorting and escorting.active and escorting.target and true or false
                    end
                },
                {
                    num = 2,
                    event = 'wasabi_police:outVehiclePlayer',
                    icon = 'fas fa-arrow-right-from-bracket',
                    label = Strings.take_out_vehicle,
                    job = pdJobs,
                    groups = pdJobs,
                    canInteract = function()
                        local coords = GetEntityCoords(cache.ped)
                        local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
                        return player and IsPedInAnyVehicle(GetPlayerPed(player), false) and true or false
                    end
                },
            }
        })
    end
    for k, v in pairs(Config.Locations) do
        if v.blip.enabled then
            createBlip(v.blip.coords, v.blip.sprite, v.blip.color, v.blip.string, v.blip.scale, false, 'coords', true)
        end
        if v?.clockInAndOut?.enabled then
            if v.clockInAndOut.target.enabled then
                if wsb.framework == 'esx' then
                    for i = 1, #Config.policeJobs do
                        Config.policeJobs[#Config.policeJobs + 1] = 'off' .. Config.policeJobs[i]
                    end
                end
                wsb.target.boxZone(k .. '_toggleduty', v.clockInAndOut.target.coords, v.clockInAndOut.target.width,
                    v.clockInAndOut.target.length, {
                        heading = v.clockInAndOut.target.heading,
                        minZ = v.clockInAndOut.target.minZ,
                        maxZ = v.clockInAndOut.target.maxZ,
                        job = JobArrayToTarget(Config.policeJobs),
                        distance = 2.0,
                        options = {
                            {
                                event = 'wasabi_police:toggleDuty',
                                icon = 'fa-solid fa-business-time',
                                label = v.clockInAndOut.target.label,
                                job = JobArrayToTarget(Config.policeJobs),
                                groups = JobArrayToTarget(Config.policeJobs)
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    local point = lib.points.new({
                        coords = v.clockInAndOut.coords,
                        distance = v.clockInAndOut.distance,
                        job = v.clockInAndOut.jobLock or Config.policeJobs,
                    })

                    function point:nearby()
                        if not self.isClosest or (self.currentDistance > v.clockInAndOut.distance) then return end
                        local jobName, jobGrade = wsb.hasGroup(self.job)
                        if jobName then
                            hasJob = jobName
                        elseif wsb.framework == 'esx' then
                            if type(self.job) == 'table' then
                                for i = 1, #self.job do
                                    self.job[#self.job + 1] = 'off' .. self.job[i]
                                end
                            else
                                self.job = {
                                    self.job,
                                    'off' .. self.job
                                }
                            end
                            jobName, jobGrade = wsb.hasGroup(self.job)
                            if jobName then hasJob = jobName end
                        end
                        if hasJob then
                            if not textUI then
                                wsb.showTextUI(v.clockInAndOut.label)
                                textUI = true
                            end
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent('wasabi_police:svToggleDuty', jobName, jobGrade)
                            end
                        end
                    end

                    function point:onExit()
                        if textUI then
                            wsb.hideTextUI()
                            textUI = nil
                        end
                    end
                end)
            end
        end
        if v.bossMenu.enabled then
            if v.bossMenu?.target?.enabled then
                local pJob, _pGrade = wsb.hasGroup(Config.policeJobs)
                if v.bossMenu.jobLock and pJob then
                    if pJob ~= v.bossMenu.jobLock then pJob = nil end
                end
                if pJob then
                    wsb.target.boxZone(k .. '_pdboss', v.bossMenu.target.coords, v.bossMenu.target.width,
                        v.bossMenu.target.length, {
                            heading = v.bossMenu.target.heading,
                            minZ = v.bossMenu.target.minZ,
                            maxZ = v.bossMenu.target.maxZ,
                            job = pJob,
                            distance = 2.0,
                            options = {
                                {
                                    event = 'wasabi_police:openBossMenu',
                                    icon = 'fa-solid fa-briefcase',
                                    label = v.bossMenu.target.label,
                                    job = pJob,
                                    groups = pJob
                                }
                            }
                        })
                end
            else
                CreateThread(function()
                    local textUI
                    local point = lib.points.new({
                        coords = v.bossMenu.coords,
                        distance = v.bossMenu.distance
                    })
                    function point:nearby()
                        if not self.isClosest or (self.currentDistance > v.clockInAndOut.distance) then return end
                        local hasJob
                        local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                        if jobName then hasJob = jobName end
                        if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                            if not wsb.playerData.job.onduty then hasJob = nil end
                        end
                        if hasJob then
                            if v.bossMenu.jobLock then
                                if hasJob == v.bossMenu.jobLock then
                                    if not textUI then
                                        wsb.showTextUI(v.bossMenu.label)
                                        textUI = true
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        wsb.openBossMenu(hasJob)
                                    end
                                end
                            else
                                if not textUI then
                                    wsb.showTextUI(v.bossMenu.label)
                                    textUI = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    wsb.openBossMenu(hasJob)
                                end
                            end
                        end
                    end

                    function point:onExit()
                        if textUI then
                            wsb.hideTextUI()
                            textUI = nil
                        end
                    end
                end)
            end
        end
        if v.cloakroom.enabled then
            CreateThread(function()
                local textUI
                local point = lib.points.new({
                    coords = v.cloakroom.coords,
                    distance = v.cloakroom.range
                })
                function point:nearby()
                    if not self.isClosest or (self.currentDistance > v.clockInAndOut.distance) then return end
                    local hasJob
                    local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                    if jobName then hasJob = jobName end
                    if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                        if not wsb.playerData.job.onduty then hasJob = nil end
                    end
                    if hasJob and v.cloakroom.jobLock then
                        if hasJob == v.cloakroom.jobLock then
                            if not textUI then
                                wsb.showTextUI(v.cloakroom.label)
                                textUI = true
                            end
                            if IsControlJustReleased(0, 38) then
                                openOutfits(k)
                            end
                        end
                    elseif hasJob and not v.cloakroom.jobLock then
                        if not textUI then
                            wsb.showTextUI(v.cloakroom.label)
                            textUI = true
                        end
                        if IsControlJustReleased(0, 38) then
                            openOutfits(k)
                        end
                    end
                end

                function point:onExit()
                    if textUI then
                        wsb.hideTextUI()
                        textUI = nil
                    end
                end
            end)
        end
        if v.armoury.enabled then
            CreateThread(function()
                local ped
                local textUI
                local point = lib.points.new({
                    coords = v.armoury.coords,
                    distance = 30
                })

                function point:onEnter()
                    if not ped then
                        lib.requestAnimDict('mini@strip_club@idles@bouncer@base', 3000)
                        lib.requestModel(v.armoury.ped, 3000)
                        ped = CreatePed(28, v.armoury.ped, v.armoury.coords.x, v.armoury.coords.y, v.armoury.coords.z,
                            v.armoury.heading, false, false)
                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskPlayAnim(ped, 'mini@strip_club@idles@bouncer@base', 'base', 8.0, 0.0, -1, 1, 0, false, false,
                            false)
                    end
                end

                function point:nearby()
                    local hasJob
                    local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                    if jobName then hasJob = jobName end
                    if hasJob and self.currentDistance <= 2 then
                        if not textUI then
                            wsb.showTextUI(v.armoury.label)
                            textUI = true
                        end
                        if IsControlJustReleased(0, 38) then
                            textUI = nil
                            wsb.hideTextUI()
                            armouryMenu(k)
                        end
                    elseif self.currentDistance >= 2.2 and textUI then
                        wsb.hideTextUI()
                        textUI = nil
                    end
                end

                function point:onExit()
                    if ped then
                        local model = GetEntityModel(ped)
                        SetModelAsNoLongerNeeded(model)
                        DeletePed(ped)
                        SetPedAsNoLongerNeeded(ped)
                        RemoveAnimDict('mini@strip_club@idles@bouncer@base')
                        ped = nil
                    end
                end
            end)
        end
        if v.vehicles.enabled then
            CreateThread(function()
                local zone = v.vehicles.zone
                local textUI
                landPoint = lib.points.new({
                    coords = zone.coords,
                    distance = zone.range
                })

                airPoint = lib.points.new({
                    coords = v.vehicles.spawn.air.coords,
                    distance = 10
                })


                function landPoint:nearby()
                    if not self.isClosest or (self.currentDistance > v.clockInAndOut.distance) then return end
                    local hasJob
                    local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                    if jobName then hasJob = jobName end
                    if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                        if not wsb.playerData.job.onduty then hasJob = nil end
                    end
                    if hasJob then
                        if v.jobLock and hasJob ~= v.jobLock then return end
                        if not inMenu and not IsPedInAnyVehicle(cache.ped, false) then
                            if not textUI then
                                wsb.showTextUI(zone.label)
                                textUI = true
                            end
                            if IsControlJustReleased(0, 38) then
                                textUI = nil
                                wsb.hideTextUI()
                                openVehicleMenu(k)
                            end
                        elseif not inMenu and IsPedInAnyVehicle(cache.ped, false) then
                            if not textUI then
                                textUI = true
                                wsb.showTextUI(zone.return_label)
                            end
                            if IsControlJustReleased(0, 38) then
                                textUI = nil
                                wsb.hideTextUI()
                                if DoesEntityExist(cache.vehicle) then
                                    DoScreenFadeOut(800)
                                    while not IsScreenFadedOut() do Wait(100) end
                                    SetEntityAsMissionEntity(cache.vehicle, false, false)
                                    if Config.customCarlock then
                                        local plate = GetVehicleNumberPlateText(cache.vehicle)
                                        local model = GetEntityModel(cache.vehicle)
                                        wsb.removeCarKeys(plate, model, cache.vehicle)
                                    end
                                    if Config.AdvancedParking then
                                        exports['AdvancedParking']:DeleteVehicle(cache.vehicle, false)
                                    else
                                        DeleteVehicle(cache.vehicle)
                                    end
                                    DoScreenFadeIn(800)
                                end
                            end
                        end
                    end
                end

                function landPoint:onExit()
                    if textUI then
                        wsb.hideTextUI()
                        textUI = nil
                    end
                end

                function airPoint:nearby()
                    if not self.isClosest or (self.currentDistance > v.clockInAndOut.distance) then return end
                    local hasJob
                    local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                    if jobName then hasJob = jobName end
                    if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                        if not wsb.playerData.job.onduty then hasJob = nil end
                    end
                    if hasJob and IsPedInAnyVehicle(cache.ped, false) then
                        if not textUI then
                            textUI = true
                            wsb.showTextUI(zone.return_label)
                        end
                        if IsControlJustReleased(0, 38) then
                            textUI = nil
                            wsb.hideTextUI()
                            if DoesEntityExist(cache.vehicle) then
                                DoScreenFadeOut(800)
                                while not IsScreenFadedOut() do Wait(100) end
                                SetEntityAsMissionEntity(cache.vehicle, false, false)
                                if Config.customCarlock then
                                    local plate = GetVehicleNumberPlateText(cache.vehicle)
                                    local model = GetEntityModel(cache.vehicle)
                                    wsb.removeCarKeys(plate, model, cache.vehicle)
                                end
                                if Config.AdvancedParking then
                                    exports['AdvancedParking']:DeleteVehicle(cache.vehicle, false)
                                else
                                    DeleteVehicle(cache.vehicle)
                                end
                                DoScreenFadeIn(800)
                            end
                        end
                    end
                end

                function airPoint:onExit()
                    if textUI then
                        wsb.hideTextUI()
                        textUI = nil
                    end
                end
            end)
        end
    end
end)

-- Prop placement loop
CreateThread(function()
    while wsb.playerData?.job == nil do Wait(500) end
    local movingProp = false
    function isEntityProp(ent)
        local model = GetEntityModel(ent)
        for id, data in ipairs(Config.Props) do
            if model == data.model then return true, id end
        end
    end

    function RequestNetworkControl(entity)
        NetworkRequestControlOfEntity(entity)
        local timeout = 2000
        while timeout > 0 and not NetworkHasControlOfEntity(entity) do
            Wait(100)
            timeout = timeout - 100
        end
        SetEntityAsMissionEntity(entity, true, true)
        timeout = 2000
        while timeout > 0 and not IsEntityAMissionEntity(entity) do
            Wait(100)
            timeout = timeout - 100
        end
        return NetworkHasControlOfEntity(entity)
    end

    while true do
        local wait = 2500
        local hasJob
        local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
        if jobName then hasJob = jobName end
        if wsb.framework == 'qb' then
            if not wsb.playerData.job.onduty then hasJob = nil end
        end
        local ped = cache.ped
        local pcoords = GetEntityCoords(ped)
        if hasJob and not IsPedInAnyVehicle(ped, false) then
            if (not movingProp) then
                local objPool = GetGamePool('CObject')
                for i = 1, #objPool do
                    local ent = objPool[i]
                    local prop, index = isEntityProp(ent)
                    if (prop) then
                        local dist = #(GetEntityCoords(ent) - pcoords)
                        if dist < 1.75 then
                            wait = 0
                            ShowHelpNotification(Strings.prop_help_text)
                            if IsControlJustPressed(1, 51) then
                                RequestNetworkControl(ent)
                                movingProp = ent
                                local c, r = vec3(0.0, 1.0, -1.0), vec3(0.0, 0.0, 0.0)
                                AttachEntityToEntity(movingProp, ped, ped, c.x, c.y, c.z, r.x, r.y, r.z, false, false,
                                    false, false, 2, true)
                                break
                            elseif IsControlJustPressed(1, 47) then
                                RequestNetworkControl(ent)
                                DeleteObject(ent)
                                break
                            end
                        end
                    end
                end
            else
                wait = 0
                ShowHelpNotification(Strings.prop_help_text2)
                if IsControlJustPressed(1, 51) then
                    RequestNetworkControl(movingProp)
                    DetachEntity(movingProp, false, false)
                    PlaceObjectOnGroundProperly(movingProp)
                    FreezeEntityPosition(movingProp, true)
                    movingProp = false
                end
            end
        end
        Wait(wait)
    end
end)

-- Spike strip functionality
if Config.spikeStripsEnabled then
    CreateThread(function()
        local spikes = `p_ld_stinger_s`
        while true do
            local sleep = 1500
            local coords = GetEntityCoords(cache.ped)
            if not IsPedInAnyVehicle(cache.ped, false) then
                sleep = 1500
            else
                local obj = GetClosestObjectOfType(coords.x, coords.y, coords.z, 100.0, spikes, false, false, false)
                if DoesEntityExist(obj) then
                    sleep = 0
                    local vehicle = GetVehiclePedIsIn(cache.ped, false)
                    local objCoords = GetEntityCoords(obj)
                    local dist = #(vec3(coords.x, coords.y, coords.z) - vec3(objCoords.x, objCoords.y, objCoords.z))
                    if dist < 3.0 then
                        for i = 0, 7 do
                            if not IsVehicleTyreBurst(vehicle, i, false) then
                                SetVehicleTyreBurst(vehicle, i, true, 1000)
                            end
                        end
                        sleep = 1500
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

local GetActivePlayers = GetActivePlayers
local NAMES, serverBlips, activeBlips, showPlayers = {}, {}, {}, {}
CreateThread(function()
    if not Config.GPSBlips.enabled then return end
    while not wsb.playerLoaded do
        Wait(1000)
    end

    while Config.GPSBlips.enabled do
        NAMES = lib.callback.await('wasabi_police:getPlayerNames', 100)

        Wait(60000)
    end
end)

RegisterNetEvent('wasabi_police:useGPS', function(player, bool)
    showPlayers[player] = bool
end)

CreateThread(function()
    if not Config.GPSBlips.enabled then return end
    local cooldown = 0
    local server = {}
    local active, activeTable, activeCreated, activePed, activePlayer = {}, {}, {}, 0, 0

    while not wsb.playerLoaded do
        Wait(1000)
    end
    Wait(1000)

    while Config.GPSBlips.enabled do
        active = GetActivePlayers()

        for k, data in pairs(active) do
            activePlayer = GetPlayerServerId(data)
            if not showPlayers[activePlayer] then goto continue end
            if data == cache.playerId then goto continue end
            activePed = GetPlayerPed(data)
            if not DoesEntityExist(activePed) then goto continue end

            activeTable[activePlayer] = {
                coords = GetEntityCoords(activePed),
                player = activePlayer,
                ped = activePed,
                name = NAMES[activePlayer]
            }

            ::continue::
        end

        for _, data in pairs(activeTable) do
            if not DoesBlipExist(activeBlips[data.player]) and not activeCreated[data.player] then
                activeCreated[data.player] = true
                activeBlips[data.player] = createBlip(activePed, Config.GPSBlips.blip.sprite, Config.GPSBlips.blip.color,
                    data.name, Config.GPSBlips.blip.scale, false, 'entity', Config.GPSBlips.blip.short)
                SetBlipCategory(activeBlips[data.player], 7)
            elseif not DoesBlipExist(activeBlips[data.player]) and activeCreated[data.player] then
                activeCreated[data.player] = false
                activeBlips[data.player] = nil
            end
        end

        for k, data in pairs(activeBlips) do
            if not DoesBlipExist(data) then
                activeBlips[k] = nil
            elseif DoesBlipExist(data) and not showPlayers[k] then
                RemoveBlip(data)
                activeBlips[k] = nil
            end
        end

        if cooldown <= 0 then
            cooldown = Config.GPSBlips.refreshrate
            server = lib.callback.await('wasabi_police:getPlayerCoords', 100)
            if server == {} or not server then goto skip end

            for k, data in pairs(serverBlips) do
                if DoesBlipExist(data) then
                    RemoveBlip(data)
                    serverBlips[k] = nil
                end
            end

            for k, data in pairs(server) do
                if activeBlips[data.player] then goto continue end
                serverBlips[data.player] = createBlip(vector(data.coords.x, data.coords.y, data.coords.z),
                    Config.GPSBlips.blip.sprite, Config.GPSBlips.blip.color, data.name, Config.GPSBlips.blip.scale, false,
                    'coords', Config.GPSBlips.blip.short)
                SetBlipCategory(serverBlips[data.player], 7)

                ::continue::
            end
        else
            cooldown -= 1
        end

        ::skip::
        Wait(1000)
    end
end)

if Config.tackle.enabled then
    RegisterCommand('tacklePlayer', function()
        attemptTackle()
    end)
    TriggerEvent('chat:removeSuggestion', '/tacklePlayer')
    RegisterKeyMapping('tacklePlayer', Strings.key_map_tackle, 'keyboard', Config.tackle.hotkey)
end

if Config.handcuff.hotkey then
    RegisterCommand('cuffPlayer', function()
        if not wsb.hasGroup(Config.policeJobs) then return end
        TriggerEvent('wasabi_police:handcuffPlayer')
    end)
    TriggerEvent('chat:removeSuggestion', '/cuffPlayer')
    RegisterKeyMapping('cuffPlayer', Strings.key_map_cuff, 'keyboard', Config.handcuff.hotkey)
end

if Config.GSR.enabled and Config.GSR.command then
    RegisterCommand(Config.GSR.command, function()
        GSRTestNearbyPlayer()
    end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if not Config.UseRadialMenu or GetCurrentResourceName() ~= resourceName or not wsb?.playerLoaded then return end
    AddRadialItems()
end)

RegisterCommand('pdJobMenu', function()
    openJobMenu()
end)

AddEventHandler('wasabi_police:pdJobMenu', function()
    openJobMenu()
end)

TriggerEvent('chat:removeSuggestion', '/pdJobMenu')

RegisterKeyMapping('pdJobMenu', Strings.key_map_job, 'keyboard', Config.jobMenu)

if Config.Jail.enabled and Config.Jail.jail == 'qb' then
    RegisterNetEvent('wasabi_police:qbPrisonJail', function(time)
        if isCuffed then uncuffed() end
        if escorted and escorted.active then
            local ped = PlayerPedId()
            TriggerServerEvent('wasabi_police:escortPlayerStop', escorted.pdId, true)
            escorted.active = nil
            escorted.pdId = nil
            DetachEntity(ped, true, false)
        end
        TriggerEvent('prison:client:Enter', time)
    end)
end

if wsb.framework == 'qb' then -- QBCore Compatibility
    local checkIfDead = function(id)
        local isDead = lib.callback.await('wasabi_police:isPlayerDead', 100, id)
        return isDead
    end
    RegisterNetEvent('police:client:RobPlayer', function()
        local ped = cache.ped
        local coords = GetEntityCoords(ped)
        local closestPlayer = wsb.getClosestPlayer(coords, 2.5, false)
        if closestPlayer then
            local targetPed = GetPlayerPed(closestPlayer)
            local targetId = GetPlayerServerId(closestPlayer)
            if IsEntityPlayingAnim(targetPed, 'missminuteman_1ig_2', 'handsup_base', 3) or IsEntityPlayingAnim(targetPed, 'mp_arresting', 'idle', 3) or checkIfDead(targetId) then
                if lib.progressCircle({
                        duration = math.random(5000, 7000),
                        label = Strings.robbing_player,
                        position = 'bottom',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                            combat = true,
                        },
                        anim = {
                            dict = 'random@shop_robbery',
                            clip = 'robbery_action_b'
                        },
                    }) then
                    TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', targetId)
                    TriggerEvent('inventory:server:RobPlayer', targetId)
                else
                    TriggerEvent('wasabi_bridge:notify', Strings.cancelled_action, Strings.cancelled_action_desc, 'error')
                end
            end
        else
            TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        end
    end)

    RegisterNetEvent('police:client:CuffPlayerSoft', function()
        TriggerEvent('wasabi_police:handcuffPlayer')
    end)

    RegisterNetEvent('police:client:PutPlayerInVehicle', function()
        TriggerEvent('wasabi_police:inVehiclePlayer')
    end)

    RegisterNetEvent('police:client:SetPlayerOutVehicle', function()
        TriggerEvent('wasabi_police:outVehiclePlayer')
    end)

    RegisterNetEvent('police:client:EscortPlayer', function()
        TriggerEvent('wasabi_police:escortPlayer')
    end)

    RegisterNetEvent('police:client:SearchPlayer', function()
        TriggerEvent('wasabi_police:searchPlayer')
    end)
end
