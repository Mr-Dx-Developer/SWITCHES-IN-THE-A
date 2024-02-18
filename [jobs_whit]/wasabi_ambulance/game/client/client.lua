-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
isDead, disableKeys, inMenu, medbagCoords, isBusy, Authorized, OnPainKillers, GameShake, InjuryRunning, IsCheckedIn =
    nil, nil, nil, nil, nil, nil, false, false, false, false
local deathInjury, previousHealth, previousArmour
plyRequests = {}
currentDrugEffect, nodOutRunning = false, false

CreateThread(function()
    while not wsb.playerLoaded do Wait(1000) end
    CreateThread(function()
        Wait(2500)
        SendReactMessage('initialize', json.encode({
            language = Config.Language,
            color = Config.UIColor,
            deathEffectsEnabled = Config.DeathScreenEffects
        }))
    end)

    if Config.policeCanTreat and Config.policeCanTreat.enabled and wsb.hasGroup(Config.policeCanTreat.jobs) then
        Authorized = true
    end
    if Config.UseRadialMenu then
        AddRadialItems()
    end
    if Config.targetSystem then
        wsb.target.model({ Config.BagProp }, {
            options = {
                {
                    event = 'wasabi_ambulance:pickupBag',
                    icon = 'fas fa-hand-paper',
                    label = Strings.pickup_bag_target,
                    canInteract = function(entity)
                        local canInteract = false
                        if Entity(entity).state.useable then canInteract = true end
                        if isPlayerDead() then canInteract = false end
                        return canInteract
                    end
                },
                {
                    event = 'wasabi_ambulance:interactBag',
                    icon = 'fas fa-briefcase',
                    label = Strings.interact_bag_target,
                    canInteract = function(entity)
                        local canInteract = false
                        if Entity(entity).state.useable then canInteract = true end
                        if isPlayerDead() then canInteract = false end
                        return canInteract
                    end
                },
            },
            job = 'all',
            distance = 1.5
        })
        wsb.target.player({
            options = {
                {
                    event = 'wasabi_ambulance:diagnosePatient',
                    icon = 'fas fa-stethoscope',
                    label = Strings.diagnose_patient,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:reviveTarget',
                    icon = 'fas fa-medkit',
                    label = Strings.revive_patient,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:healTarget',
                    icon = 'fas fa-bandage',
                    label = Strings.heal_patient,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:useSedative',
                    icon = 'fas fa-syringe',
                    label = Strings.sedate_patient,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                }
            },
            distance = 1.5
        })

        wsb.target.vehicle({
            options = {
                --[[                {
                    event = 'wasabi_ambulance:enterBackVehicle',
                    icon = 'fas fa-car',
                    label = Strings.enter_vehicle_back,
                    canInteract = function(entity)
                        if not IsVehicleAmbulance(entity) or not IsNearTrunk(entity) or MovingStretcher then return false end
                        return true
                    end,
                    job = Config.ambulanceJob,
                    groups = Config.ambulanceJob
                },]] -- Lame
                {
                    event = 'wasabi_ambulance:toggleStretcher',
                    icon = 'fas fa-car',
                    label = Strings.toggle_stretcher,
                    canInteract = function(entity)
                        if not IsVehicleAmbulance(entity) or not IsNearTrunk(entity) or MovingStretcher then return false end
                        local alreadyDeployed = HasAmbulanceSpawnedStretcher(VehToNet(entity))
                        local stretcherInside = GetStretcherInVehicle(entity)
                        return not alreadyDeployed or stretcherInside
                    end,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:stretcherInVehicle',
                    icon = 'fas fa-car',
                    label = Strings.stretcher_in_vehicle,
                    canInteract = function(entity)
                        if not IsVehicleAmbulance(entity) or not IsNearTrunk(entity) then return false end
                        local stretcherInside = GetStretcherInVehicle(entity)
                        if stretcherInside then return false end
                        if MovingStretcher then return true end
                        if not GetClosestStretcher(3.0) then return false end
                        return true
                    end,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },
                {
                    event = 'wasabi_ambulance:removeDeadFromVehicle',
                    icon = 'fas fa-car',
                    label = Strings.remove_dead_target,
                    canInteract = function(entity)
                        local model = GetEntityModel(entity)
                        local found = false
                        for k, _ in pairs(Config.AmbulanceOffsets) do
                            if model == GetHashKey(k) then
                                found = true
                                break
                            end
                        end
                        if found then return false end
                        local deadPlayerID = GetDeadPlayerInsideVehicle(entity)
                        return deadPlayerID
                    end
                },
--[[                {
                    event = 'wasabi_ambulance:placeInVehicle',
                    icon = 'fas fa-car',
                    label = Strings.place_patient,
                    canInteract = function(entity)
                        local model = GetEntityModel(entity)
                        local found = false
                        for k, _ in pairs(Config.AmbulanceOffsets) do
                            if model == GetHashKey(k) then
                                found = true
                                break
                            end
                        end
                        return found
                    end,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    groups = Config.ambulanceJob or JobArrayToTarget()
                },]]
            },
            distance = 1.5
        })
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not wsb or not wsb.playerLoaded or not Config.UseRadialMenu then return end
    AddRadialItems()
end)

AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:spawnPlayer()
    Wait(5000)
    exports.spawnmanager:setAutoSpawn(false)
end)

lib.onCache('ped', function(ped)
    if not DoesEntityExist(ped) then return end
    if ped == cache.ped then return end
    SetHealthDefaults()
end)

RegisterNetEvent('wasabi_bridge:playerLoaded', function()
    while not wsb?.playerLoaded and not wsb?.playerData?.job do Wait(1000) end
    TriggerServerEvent('wasabi_ambulance:setPlayerIdentifier')
    if Config.AntiCombatLog.enabled then
        CreateThread(function()
            while not DoesEntityExist(PlayerPedId()) do Wait(500) end
            local dead
            if wsb.framework == 'qb' then
                dead = wsb.playerData.metadata["isdead"] or false
                if not dead and Config.LastStand then
                    dead = wsb.playerData.metadata["inlaststand"] or false
                end
            elseif wsb.framework == 'esx' then
                dead = lib.callback.await('wasabi_ambulance:checkDeath', 300)
            end
            if dead then
                Wait(3000)
                SetEntityHealth(PlayerPedId(), 0)
                if Config.AntiCombatLog.notification.enabled then
                    TriggerEvent('wasabi_bridge:notify', Config.AntiCombatLog.notification.title,
                        Config.AntiCombatLog.notification.desc, 'error', 'skull-crossbones')
                end
            else
                local previousVitals = lib.callback.await('wasabi_ambulance:checkPreviousVitals', 1000)
                if previousVitals then
                    Wait(3000)
                    if previousVitals.health then
                        SetEntityHealth(PlayerPedId(), previousVitals.health)
                    end
                    if previousVitals.injuries and next(previousVitals.injuries) then
                        PlayerInjury = previousVitals.injuries
                        TriggerServerEvent('wasabi_ambulance:injurySync', PlayerInjury)
                    end
                end
            end
        end)
    elseif wsb.framework == 'qb' then
        if wsb.playerData.metadata["isdead"] or wsb.playerData.metadata["inlaststand"] then
            TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, false)
            wsb.playerData.metadata["isdead"] = false
            wsb.playerData.metadata["inlaststand"] = false
        end
    end
    if wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob) then
        TriggerServerEvent('wasabi_ambulance:requestSync')
    end
end)

RegisterNetEvent('wasabi_ambulance:setJob', function(job)
    Authorized = false
    if Config?.policeCanTreat?.enabled then
        if wsb.hasGroup(Config.policeCanTreat.jobs) then
            Authorized = true
        end
    end
    if wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob) then
        TriggerServerEvent('wasabi_ambulance:requestSync')
    end
    if Config.UseRadialMenu then
        AddRadialItems()
    end
end)

if Config.lowHealthAlert.enabled then
    CreateThread(function()
        local notified
        while true do
            Wait(1500)
            local health = GetEntityHealth(cache.ped)
            if health ~= 0 and health < Config.lowHealthAlert.health and not notified then
                TriggerEvent('wasabi_bridge:notify', Config.lowHealthAlert.notification.title,
                    Config.lowHealthAlert.notification.description, 'error')
                notified = true
            elseif notified and health >= Config.lowHealthAlert.health then
                notified = nil
            end
        end
    end)
end

CreateThread(function()
    local setDeadFace = false
    while true do
        local sleep = 1500
        if isDead == 'dead' or disableKeys or (isDead == 'laststand' and Config.DisableLastStandCrawl) then
            sleep = 0
            DisableAllControlActions(0)
            for k, data in pairs(Config.EnabledKeys.dead) do
                EnableControlAction(0, data, true)
            end
        end
        if isDead == 'dead' and not setDeadFace then
            setDeadFace = true
            SetFacialIdleAnimOverride(PlayerPedId(), 'dead_2', 0)
        end
        if not isDead and setDeadFace then
            setDeadFace = false
            ClearFacialIdleAnimOverride(PlayerPedId())
        end
        Wait(sleep)
    end
end)

local GetActivePlayers = GetActivePlayers
local NAMES, serverBlips, activeBlips, showPlayers = {}, {}, {}, {}
CreateThread(function()
    if not Config.GPSBlips.enabled then return end
    while not wsb.playerLoaded do
        Wait(1000)
    end

    while Config.GPSBlips.enabled do
        NAMES = lib.callback.await('wasabi_ambulance:getPlayerNames', 500)

        Wait(60000)
    end
end)

RegisterNetEvent('wasabi_ambulance:useGPS', function(player, bool)
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
                activeBlips[data.player] = CreateBlip(activePed, Config.GPSBlips.blip.sprite, Config.GPSBlips.blip.color,
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
            server = lib.callback.await('wasabi_ambulance:getPlayerCoords', 500)
            if server == {} or not server then goto skip end

            for k, data in pairs(serverBlips) do
                if DoesBlipExist(data) then
                    RemoveBlip(data)
                    serverBlips[k] = nil
                end
            end

            for k, data in pairs(server) do
                if activeBlips[data.player] then goto continue end
                serverBlips[data.player] = CreateBlip(vector(data.coords.x, data.coords.y, data.coords.z),
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

-- Spawn event
local firstSpawn = true
AddEventHandler('wasabi_bridge:onPlayerSpawn', function(noAnim)
    if firstSpawn then
        firstSpawn = false
        return
    end
    isDead = false
    if Config.DeathScreenEffects then AnimpostfxStopAll() end
    if not noAnim then
        lib.requestAnimDict('get_up@directional@movement@from_knees@action', 3000)
        TaskPlayAnim(cache.ped, 'get_up@directional@movement@from_knees@action', 'getup_r_0', 8.0, -8.0, -1, 0, 0, false,
            false, false)
        RemoveAnimDict('get_up@directional@movement@from_knees@action')
    end
    HideDeathNui()
    TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, true)
end)

-- Death Event
local originalDeath
AddEventHandler('wasabi_bridge:onPlayerDeath', function(data)
    if OccupyingStretcher then
        local occupyingStretcher = OccupyingStretcher
        OccupyingStretcher = nil


        CreateThread(function()
            local stretcherID = GetActiveStretcherIDFromEntity(occupyingStretcher)
            local serverID = GetPlayerServerId(PlayerId())
            if stretcherID and serverID then
                Wait(100)
                TriggerServerEvent('wasabi_ambulance:placePlayerOnStretcher', stretcherID, serverID)
            end
        end)
    end
    if not isDead then originalDeath = data.deathCause end
    if isDead == 'laststand' and originalDeath then
        data.deathCause = originalDeath
        originalDeath = nil
    end
    if data.deathCause == 0 then
        local deathSource = wsb.getClosestPlayer(vec3(data.victimCoords.x, data.victimCoords.y, data.victimCoords.z), 3.0)
        if deathSource then
            local deathSourcePed = GetPlayerPed(deathSource)
            local weapon = GetSelectedPedWeapon(deathSourcePed)
            for k, v in pairs(InjuryReasons) do
                for i = 1, #v do
                    if v[i] == weapon then
                        deathInjury = tostring(k)
                        break
                    end
                end
            end
            if deathInjury == 'shot' then deathInjury = 'beat' end
        end
    elseif data.deathCause == -842959696 then
        deathInjury = 'bleedout'
    else
        for k, v in pairs(InjuryReasons) do
            for i = 1, #v do
                if v[i] == data.deathCause then
                    deathInjury = tostring(k)
                    break
                end
            end
        end
    end
    PlayerInjury = {}
    if Config.DeathLogs then
        local killer = GetPedSourceOfDeath(cache.ped)
        local dCause = GetPedCauseOfDeath(cache.ped)
        local deathCause
        if IsEntityAPed(killer) and IsPedAPlayer(killer) then
            killer = NetworkGetPlayerIndexFromPed(killer)
        elseif IsEntityAVehicle(killer) and IsEntityAPed(GetPedInVehicleSeat(killer, -1)) and IsPedAPlayer(GetPedInVehicleSeat(killer, -1)) then
            killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(dCause, -1))
        end
        if (killer == PlayerId()) then
            deathCause = 'suicide'
        elseif (killer == nil or killer == 0) then
            deathCause = 'unknown'
        end
        if deathCause == 'suicide' or deathCause == 'unknown' then
            TriggerServerEvent('wasabi_ambulance:logDeath', dCause, nil)
        elseif killer then
            TriggerServerEvent('wasabi_ambulance:logDeath', dCause, GetPlayerServerId(killer))
        end
    end
    if Config.MythicHospital then
        TriggerEvent('mythic_hospital:client:RemoveBleed')
        TriggerEvent('mythic_hospital:client:ResetLimbs')
    end
    TriggerServerEvent('wasabi_ambulance:injurySync', deathInjury)
    if not Config.LastStand or IsPedInAnyVehicle(cache.ped, false) then
        OnPlayerDeath(false)
        return
    end
    OnLastStand()
end)

-- Live injury
RegisterNetEvent('wasabi_ambulance:syncInjury', function(data, notify)
    PlayerInjury = data
    if not notify then return end
    if #PlayerInjury < 1 then
        TriggerEvent('wasabi_bridge:notify', Strings.player_treated, Strings.treated_fully_desc, 'success')
    else
        TriggerEvent('wasabi_bridge:notify', Strings.player_treated, Strings.treated_not_fully_desc, 'inform')
    end
end)

if Config.EnableLiveInjury then
    local previousHealth = 200
    AddEventHandler('gameEventTriggered', function(event, data)
        if event == "CEventNetworkEntityDamage" then
            local victim = data[1]
            local playerId = NetworkGetPlayerIndexFromPed(victim)
            if playerId ~= PlayerId() then return end
            if (IsPedDeadOrDying(victim, true) or IsPedFatallyInjured(victim)) then return end
            local health = GetEntityHealth(cache.ped)
            local armour = GetPedArmour(cache.ped)
            if not previousHealth then previousHealth = health end
            if not previousArmour then previousArmour = armour end
            local healthDamage = (previousHealth - health)
            local armourDamage = (previousArmour - armour)
            if healthDamage > (Config?.DamageDetectThreshold?.health or 10) then
                ChanceInjury()
            elseif armourDamage > (Config?.DamageDetectThreshold?.armour or 5) then
                ChanceInjury()
            end
        end
    end)

    -- Loop for debugging
    --[[    CreateThread(function()
        while true do
            Wait(2000)
            if next(PlayerInjury) then
                for k,v in pairs(PlayerInjury) do
                    print('Injury : '..k..' / Level : '..v.data.level..' / Bleed : '..v.data.bleed)
                end
            end
        end
    end) ]]

    function GetIdentifier()
        local identifier = lib.callback.await('wasabi_ambulance:getIdentifier', 1000)
        return identifier or false
    end

    -- Main loop
    CreateThread(function()
        local lastNotificationSent = 0
        local staggering = false
        local limping = false
        local notificationCooldown = Config.InjuryNotificationFrequency
        local lastBleedCheck = 0
        local loggedInjury = {}
        local loggedHealth = {}
        local playerIsLoaded = true
        local health = 200

        while true do
            local sleep = 100
            local moveRate = 1.0
            local shouldLimp = false
            local sentBlackoutNotification = false
            local ped = PlayerPedId()
            local playerId = PlayerId()
            if cache.ped and DoesEntityExist(cache.ped) then
                health = GetEntityHealth(cache.ped)
            end
            if not wsb.playerLoaded and playerIsLoaded then
                local identifier = GetIdentifier()
                if identifier then
                    loggedInjury[identifier] = PlayerInjury
                    loggedHealth[identifier] = health
                end
                playerIsLoaded = false
                DrugIntake = {}
                nodOutRunning = false
                currentDrugEffect = false
                isDead = false
                PlayerInjury = {}
                TriggerServerEvent('wasabi_ambulance:injurySync', false)
                TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, false, true)
            elseif wsb.playerLoaded and not playerIsLoaded then
                playerIsLoaded = true
                local identifier = GetIdentifier()
                if identifier then
                    if loggedHealth[identifier] then
                        SetEntityHealth(cache.ped, loggedHealth[identifier])
                    end
                    if loggedInjury[identifier] and next(loggedInjury[identifier]) then
                        PlayerInjury = loggedInjury[identifier]
                        TriggerServerEvent('wasabi_ambulance:injurySync', PlayerInjury)
                    end
                end
            end
            if next(PlayerInjury) then
                InjuryRunning = true
                -- Bleed handling
                if GetGameTimer() - lastBleedCheck > 10000 then
                    local totalBleed = 0
                    for _, v in pairs(PlayerInjury) do
                        totalBleed = totalBleed + v.data.bleed
                    end
                    if totalBleed > 0 then
                        local currentHealth = GetEntityHealth(ped)
                        SetEntityHealth(ped, currentHealth - totalBleed)
                    end
                    lastBleedCheck = GetGameTimer()
                end

                if not OnPainKillers then
                    for k, v in pairs(PlayerInjury) do
                        -- Adjust the severity to 4 levels
                        if v.data.level > 4 then v.data.level = 4 end
                        if v.data.bleed > 4 then v.data.bleed = 4 end

                        if not OnPainKillers then
                            -- Handle head injuries
                            if k == 'head' then
                                if not sentBlackoutNotification then
                                    --if v.data.level == 2 and not staggering and 50 <= math.random(1,100) then
                                    --    staggering = true
                                    --    local success = SimulatePedStagger(ped, 3000)
                                    --    if success then Wait(3000) end
                                    --    staggering = false
                                    if v.data.level == 3 then
                                        BlackoutEffect(700, 3000)
                                        SetPedToRagdoll(ped, 7000, 5000, 0, true, true, false)
                                        SendBlackoutNotify(k)
                                        sentBlackoutNotification = true
                                    elseif v.data.level == 4 then
                                        BlackoutEffect(700, 4000)
                                        SetPedToRagdoll(ped, 7000, 5000, 0, true, true, false)
                                        SendBlackoutNotify(k)
                                        sentBlackoutNotification = true
                                    end
                                end
                            end

                            -- Handle chest injuries
                            if (k == 'upper_body') and v.type == 'shot' then
                                shouldLimp = true
                            end

                            -- Handle spine injuries
                            if k == 'spine' then
                                if v.data.level == 1 and moveRate > 0.9 then
                                    shouldLimp = true
                                    sleep = 0
                                    moveRate = 0.9
                                elseif v.data.level == 2 and moveRate > 0.75 then
                                    if moveRate > 0.75 then
                                        sleep = 0
                                        moveRate = 0.75
                                    end
                                    -- if 60 <= math.random(1,100) and not staggering then
                                    --     staggering = true
                                    --     local success = SimulatePedStagger(ped, 2000)
                                    --     if success then Wait(2000) end
                                    --     staggering = false
                                    -- end
                                elseif v.data.level == 3 then
                                    if moveRate > 0.6 then moveRate = 0.6 end
                                    if not sentBlackoutNotification then
                                        if 60 <= math.random(1, 100) then
                                            local success = BlackoutEffect(700, 3000)
                                            if success then
                                                SetPedToRagdoll(ped, 7000, 5000, 0, true, true, false)
                                                Wait(3000)
                                                SendBlackoutNotify(k)
                                                sentBlackoutNotification = true
                                            end
                                            --elseif not staggering and 50 <= math.random(1,100) then
                                            --    staggering = true
                                            --    local success = SimulatePedStagger(ped, 3000)
                                            --    if success then Wait(3000) end
                                            --    staggering = false
                                        end
                                    end
                                    sleep = 0
                                    DisableJumpingOnFrame()
                                elseif v.data.level == 4 then
                                    if moveRate > 0.4 then moveRate = 0.4 end
                                    if not sentBlackoutNotification then
                                        if 50 <= math.random(1, 100) then
                                            local success = BlackoutEffect(700, 4000)
                                            if success then
                                                SetPedToRagdoll(ped, 7000, 5000, 0, true, true, false)
                                                Wait(4000)
                                                SendBlackoutNotify(k)
                                                sentBlackoutNotification = true
                                            end
                                            --elseif not staggering and 60 <= math.random(1,100) then
                                            --    staggering = true
                                            --    local success = SimulatePedStagger(ped, 4000)
                                            --    if success then Wait(4000) end
                                            --    staggering = false
                                        end
                                    end
                                    sleep = 0
                                    DisableJumpingOnFrame()
                                end
                            end

                            -- Handle arm injuries
                            if k == 'right_arm' or k == 'left_arm' then
                                sleep = 5
                                if v.data.level >= 1 and (IsPlayerFreeAiming(playerId) or IsPedShooting(ped)) then
                                    SimulateAimPain(ped)
                                elseif v.data.level >= 1 and GameShake then
                                    StopGameplayCamShaking(false)
                                    GameShake = false
                                end
                            end

                            -- Handle leg injuries
                            if k == 'left_leg' or k == 'right_leg' then
                                if v.data.level == 1 and moveRate > 0.9 then
                                    moveRate = 0.9
                                    sleep = 0
                                elseif v.data.level == 2 then
                                    if moveRate > 0.65 then moveRate = 0.75 end
                                    sleep = 0
                                    DisableJumpingOnFrame()
                                elseif v.data.level == 3 then
                                    if moveRate > 0.6 then moveRate = 0.6 end
                                    sleep = 0
                                    DisableJumpingOnFrame()
                                elseif v.data.level == 4 then
                                    if moveRate > 0.4 then moveRate = 0.4 end
                                    sleep = 0
                                    DisableJumpingOnFrame()
                                end
                            end
                            if v.data.limp then
                                shouldLimp = true
                                limping = true
                            end
                        end

                        -- Limb handling
                        if shouldLimp and GetPedMovementClipset(ped) ~= `move_m@injured` then
                            SetPedMovementClipset(ped, 'move_m@injured', 0)
                            limping = true
                        elseif not shouldLimp and GetPedMovementClipset(ped) == `move_m@injured` then
                            ResetPedMovementClipset(ped, 0)
                            limping = false
                        end
                    end

                    if Config.InjuryNotification and GetGameTimer() - lastNotificationSent > notificationCooldown and not sentBlackoutNotification then
                        SendInjuredNotification()
                        lastNotificationSent = GetGameTimer()
                    end
                    if moveRate < 0.75 then
                        sleep = 0
                        DisableControlAction(0, 21, true)
                        if IsDisabledControlJustPressed(0, 21) then
                            TriggerEvent('wasabi_bridge:notify', Strings.cant_run, Strings.cant_run_desc, 'error')
                        end
                    end
                    if moveRate < 1.0 then
                        SetPedMoveRateOverride(ped, moveRate)
                    end
                end
                Wait(sleep)
            elseif not PlayerInjury or #PlayerInjury < 1 then
                if GameShake then
                    StopGameplayCamShaking(false)
                    GameShake = nil
                    Wait(2000)
                elseif InjuryRunning then
                    TriggerServerEvent('wasabi_ambulance:injurySync', false)
                    InjuryRunning = false
                    Wait(2000)
                elseif limping then
                    ResetPedMovementClipset(cache.ped, 0)
                    limping = false
                    Wait(2000)
                else
                    Wait(2000)
                end
            else
                Wait(2000)
            end
        end
    end)
end

-- Pain Killers
if Config.EnablePainPills then
    RegisterNetEvent('wasabi_ambulance:intakePills', function(item, data)
        if lib.callback.await('wasabi_ambulance:removeItem', 500, item) then
            PlayTakePillAnimation()
            DrugIntake[#DrugIntake + 1] = {
                item = item,
                label = data.label,
                duration = data.duration,
                level = data.level
            }
        end
    end)

    -- Pain Killer Effect Loop
    local drugEffectsStarted = false

    CreateThread(function()
        while true do
            Wait(1000)
            local totalDuration = 0
            local totalLevel = 0
            local toRemove = {}

            if #DrugIntake > 0 then
                drugEffectsStarted = true
                for index, drugInfo in ipairs(DrugIntake) do
                    drugInfo.duration = drugInfo.duration - 1

                    totalDuration = totalDuration + drugInfo.duration
                    totalLevel = totalLevel + drugInfo.level

                    if drugInfo.duration < 1 then
                        table.insert(toRemove, index)
                    end
                end

                for i = #toRemove, 1, -1 do
                    table.remove(DrugIntake, toRemove[i])
                end

                SetDrugEffect(cache.ped, totalLevel)
                OnPainKillers = true
            elseif drugEffectsStarted then
                ClearDrugEffects(PlayerPedId())
                drugEffectsStarted = false
                Wait(4000)
            else
                OnPainKillers = false
                Wait(4000)
            end
        end
    end)
end


AddEventHandler('wasabi_ambulance:toggleDuty', function()
    local job, grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
    if not job then
        if wsb.framework == 'esx' then
            local foundJob = false
            local jobs = Config.ambulanceJobs or Config.ambulanceJob
            if type(jobs) == 'table' then
                for i = 1, #jobs do
                    job, grade = wsb.hasGroup('off' .. jobs[i])
                    if job then break end
                end
            else
                job, grade = wsb.hasGroup('off' .. jobs)
            end
        end
    end
    if not job then return end
    if wsb.framework == 'qb' then
        wsb.playerData.job.onduty = not wsb.playerData.job.onduty
    end
    TriggerServerEvent('wasabi_ambulance:svToggleDuty', job, grade)
end)

AddEventHandler('wasabi_ambulance:accessStash', function()
    if not wsb.framework == 'qb' then return end
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'ambulance_' .. wsb.playerData.citizenid)
    TriggerEvent('inventory:client:SetCurrentStash', 'ambulance_' .. wsb.playerData.citizenid)
end)

AddEventHandler('wasabi_ambulance:enterBackVehicle', function()
    local coords = GetEntityCoords(cache.ped)
    local vehicle = wsb.getClosestVehicle(vector3(coords.x, coords.y, coords.z), 7.0, false)
    if not vehicle or not DoesEntityExist(vehicle) then return end
    local freeSeat
    for i = 1, 2 do
        if IsVehicleSeatFree(vehicle, i) then
            freeSeat = i
            break
        end
    end
    if not freeSeat then
        TriggerEvent('wasabi_bridge:notify', Strings.no_back_seat, Strings.no_back_seat_desc, 'error')
        return
    end
    TaskEnterVehicle(cache.ped, vehicle, -1, freeSeat, 2.0, 1, 0)
end)


-- I am monster thread
CreateThread(function()
    while not wsb?.playerData?.job do Wait(500) end
    for k, v in pairs(Config.Locations) do
        if v.Blip.Enabled then
            CreateBlip(v.Blip.Coords, v.Blip.Sprite, v.Blip.Color, v.Blip.String, v.Blip.Scale, false, 'coords', true)
        end
        if v?.clockInAndOut?.enabled then
            if v.clockInAndOut.target.enabled then
                local jobArray = nil
                if Config.ambulanceJob and type(Config.ambulanceJob) == 'string' then
                    jobArray = { Config.ambulanceJob, 'off' .. Config.ambulanceJob }
                end
                wsb.target.boxZone(k .. '_toggleduty', v.clockInAndOut.target.coords, v.clockInAndOut.target.width,
                    v.clockInAndOut.target.length, {
                        heading = v.clockInAndOut.target.heading,
                        minZ = v.clockInAndOut.target.minZ,
                        maxZ = v.clockInAndOut.target.maxZ,
                        job = Config.ambulanceJob or JobArrayToTarget(true),
                        distance = 2.0,
                        options = {
                            {
                                event = 'wasabi_ambulance:toggleDuty',
                                icon = 'fa-solid fa-business-time',
                                label = v.clockInAndOut.target.label,
                                groups = jobArray or JobArrayToTarget()
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    while true do
                        local sleep = 1500
                        local hasJob
                        local jobName, jobGrade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                        if jobName then
                            hasJob = jobName
                        elseif wsb.framework == 'esx' then
                            local jobs = Config.ambulanceJobs or Config.ambulanceJob
                            if type(jobs) == 'table' then
                                for i = 1, #jobs do
                                    jobName, jobGrade = wsb.hasGroup('off' .. jobs[i])
                                    if jobName then
                                        hasJob = jobName
                                        break
                                    end
                                end
                            else
                                jobName, jobGrade = wsb.hasGroup('off' .. jobs)
                                if jobName then hasJob = jobName end
                            end
                        end
                        if hasJob then
                            local coords = GetEntityCoords(cache.ped)
                            local dist = #(coords - v.clockInAndOut.coords)
                            if dist <= v.clockInAndOut.distance then
                                if not textUI then
                                    wsb.showTextUI(v.clockInAndOut.label)
                                    textUI = true
                                end
                                sleep = 0
                                if IsControlJustReleased(0, 38) then
                                    TriggerServerEvent('wasabi_ambulance:svToggleDuty', jobName, jobGrade)
                                end
                            elseif textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                        Wait(sleep)
                    end
                end)
            end
        end
        if v?.PersonalLocker?.enabled and (wsb.framework == 'qb' or Config.Inventory == 'qs') then
            if v.PersonalLocker.target.enabled then
                local jobs = Config.ambulanceJobs or Config.ambulanceJob
                local jobArray = nil
                if type(jobs) == 'string' then
                    jobArray = { jobs, 'off' .. jobs }
                end
                wsb.target.boxZone(k .. '_openStash', v.PersonalLocker.target.coords, v.PersonalLocker.target.width,
                    v.PersonalLocker.target.length, {
                        heading = v.PersonalLocker.target.heading,
                        minZ = v.PersonalLocker.target.minZ,
                        maxZ = v.PersonalLocker.target.maxZ,
                        job = jobArray or JobArrayToTarget(true),
                        distance = 2.0,
                        options = {
                            {
                                event = 'wasabi_ambulance:accessStash',
                                icon = 'fa-solid fa-box-open',
                                label = v.PersonalLocker.target.label,
                                groups = jobArray or JobArrayToTarget(true)
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    while true do
                        local sleep = 1500
                        local hasJob
                        if wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob) then
                            local coords = GetEntityCoords(cache.ped)
                            local dist = #(coords - v.PersonalLocker.coords)
                            if dist <= v.PersonalLocker.distance then
                                if not textUI then
                                    wsb.showTextUI(v.PersonalLocker.label)
                                    textUI = true
                                end
                                sleep = 0
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent('wasabi_ambulance:accessStash')
                                end
                            elseif textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                        Wait(sleep)
                    end
                end)
            end
        end
        if v.BossMenu.Enabled then
            if v.BossMenu?.Target?.enabled then
                wsb.target.boxZone(k .. '_emsboss', v.BossMenu.Target.coords, v.BossMenu.Target.width,
                    v.BossMenu.Target.length, {
                        heading = v.BossMenu.Target.heading,
                        minZ = v.BossMenu.Target.minZ,
                        maxZ = v.BossMenu.Target.maxZ,
                        job = Config.ambulanceJob or JobArrayToTarget(),
                        distance = 2.0,
                        options = {
                            {
                                name = k .. 'ems_boss',
                                event = 'wasabi_ambulance:openBossMenu',
                                icon = 'fa-solid fa-suitcase-medical',
                                distance = 2.0,
                                label = v.BossMenu.Target.label,
                                job = Config.ambulanceJob or JobArrayToTarget(),
                                groups = Config.ambulanceJob or JobArrayToTarget()
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    while true do
                        local sleep = 1500
                        local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                        if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                            if not wsb.playerData.job.onduty then hasJob = nil end
                        end
                        if hasJob then
                            local coords = GetEntityCoords(cache.ped)
                            local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(v.BossMenu.Coords.x, v.BossMenu.Coords.y, v.BossMenu.Coords.z))
                            if dist <= v.BossMenu.Distance then
                                if not textUI then
                                    wsb.showTextUI(v.BossMenu.Label)
                                    textUI = true
                                end
                                sleep = 0
                                if IsControlJustReleased(0, 38) then
                                    wsb.openBossMenu(hasJob)
                                end
                            else
                                if textUI then
                                    wsb.hideTextUI()
                                    textUI = nil
                                end
                            end
                        end
                        Wait(sleep)
                    end
                end)
            end
        end
        if v.CheckIn.Enabled then
            if v.CheckIn?.Target?.enabled then
                wsb.target.boxZone(k .. '_emscheckin', v.CheckIn.Target.coords, v.CheckIn.Target.width,
                    v.CheckIn.Target.length, {
                        heading = v.CheckIn.Target.heading,
                        minZ = v.CheckIn.Target.minZ,
                        maxZ = v.CheckIn.Target.maxZ,
                        distance = v.CheckIn.Target.distance,
                        options = {
                            {
                                name = k .. 'ems_checkin',
                                event = 'wasabi_ambulance:attemptCheckin',
                                icon = 'fa-solid fa-suitcase-medical',
                                distance = v.CheckIn.Target.distance,
                                label = v.CheckIn.Target.label,
                                hospital = k
                            }
                        }
                    })
            end
            local checkInTimer = GetGameTimer()
            CreateThread(function()
                local ped, pedSpawned
                local textUI
                while true do
                    local sleep = 1500
                    local playerPed = cache.ped
                    local coords = GetEntityCoords(playerPed)
                    local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(v.CheckIn.Coords.x, v.CheckIn.Coords.y, v.CheckIn.Coords.z))
                    if dist <= 30 and not pedSpawned then
                        lib.requestAnimDict('mini@strip_club@idles@bouncer@base', 3000)
                        lib.requestModel(v.CheckIn.Ped, 3000)
                        ped = CreatePed(28, v.CheckIn.Ped, v.CheckIn.Coords.x, v.CheckIn.Coords.y, v.CheckIn.Coords.z,
                            v.CheckIn.Heading, false, false)
                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskPlayAnim(ped, 'mini@strip_club@idles@bouncer@base', 'base', 8.0, 0.0, -1, 1, 0, false, false,
                            false)
                        pedSpawned = true
                    elseif not v.CheckIn?.Target?.enabled and dist <= v.CheckIn.Distance then
                        if not textUI then
                            wsb.showTextUI(v.CheckIn.Label)
                            textUI = true
                        end
                        sleep = 0
                        if IsControlJustReleased(0, v.CheckIn.HotKey) then
                            local cooldown = 3000
                            if v.CheckIn.DisableHospitalBeds then cooldown = v.CheckIn.Duration end
                            if GetGameTimer() - checkInTimer > cooldown then
                                checkInTimer = GetGameTimer()
                                textUI = nil
                                wsb.hideTextUI()
                                TriggerServerEvent('wasabi_ambulance:tryRevive', k)
                            else
                                TriggerEvent('wasabi_bridge:notify', Strings.checkin_cooldown,
                                    Strings.checkin_cooldown_desc, 'error')
                            end
                        end
                    elseif dist >= (v.CheckIn.Distance + 1) and textUI then
                        wsb.hideTextUI()
                        textUI = nil
                    elseif dist >= 31 and pedSpawned then
                        local model = GetEntityModel(ped)
                        SetModelAsNoLongerNeeded(model)
                        DeletePed(ped)
                        SetPedAsNoLongerNeeded(ped)
                        RemoveAnimDict('mini@strip_club@idles@bouncer@base')
                        pedSpawned = nil
                    end
                    Wait(sleep)
                end
            end)
        end
        if v.Cloakroom.Enabled then
            CreateThread(function()
                local textUI
                while true do
                    local sleep = 1500
                    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                    if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                        if not wsb.playerData.job.onduty then hasJob = nil end
                    end
                    if hasJob then
                        local ped = cache.ped
                        local coords = GetEntityCoords(ped)
                        local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(v.Cloakroom.Coords.x, v.Cloakroom.Coords.y, v.Cloakroom.Coords.z))
                        if dist <= v.Cloakroom.Range then
                            if not textUI then
                                wsb.showTextUI(v.Cloakroom.Label)
                                textUI = true
                            end
                            sleep = 0
                            if IsControlJustReleased(0, v.Cloakroom.HotKey) then
                                openOutfits(k)
                            end
                        else
                            if textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                    end
                    Wait(sleep)
                end
            end)
        end
        if v.MedicalSupplies.Enabled then
            if Config.targetSystem then
                wsb.target.boxZone(k .. '_medsup', v.MedicalSupplies.Coords, 1.0, 1.0, {
                    heading = v.MedicalSupplies.Heading,
                    minZ = v.MedicalSupplies.Coords.z - 1.5,
                    maxZ = v.MedicalSupplies.Coords.z + 1.5,
                    job = Config.ambulanceJob or JobArrayToTarget(),
                    distance = 1.5,
                    options = {
                        {
                            name = k .. '_medsup',
                            type = 'client',
                            job = Config.ambulanceJob or JobArrayToTarget(),
                            groups = Config.ambulanceJob or JobArrayToTarget(),
                            distance = 1.5,
                            event = 'wasabi_ambulance:medicalSuppliesMenu',
                            icon = 'fa-solid fa-suitcase-medical',
                            label = Strings.request_supplies_target,
                            hospital = k
                        }
                    }
                })
            end
            CreateThread(function()
                local ped, pedSpawned, textUI
                while true do
                    local sleep = 1500
                    local playerPed = cache.ped
                    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                    if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                        if not wsb.playerData.job.onduty then hasJob = nil end
                    end
                    local coords = GetEntityCoords(playerPed)
                    local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(v.MedicalSupplies.Coords.x, v.MedicalSupplies.Coords.y, v.MedicalSupplies.Coords.z))
                    if dist <= 30 and not pedSpawned then
                        lib.requestAnimDict('mini@strip_club@idles@bouncer@base', 3000)
                        lib.requestModel(v.MedicalSupplies.Ped, 3000)
                        ped = CreatePed(28, v.MedicalSupplies.Ped, v.MedicalSupplies.Coords.x, v.MedicalSupplies.Coords
                            .y, v.MedicalSupplies.Coords.z, v.MedicalSupplies.Heading, false, false)
                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskPlayAnim(ped, 'mini@strip_club@idles@bouncer@base', 'base', 8.0, 0.0, -1, 1, 0, false, false,
                            false)
                        pedSpawned = true
                    elseif dist <= 2.5 and not Config.targetSystem then
                        if not textUI and hasJob then
                            wsb.showTextUI(Strings.open_shop_ui)
                            textUI = true
                        end
                        sleep = 0
                        if IsControlJustReleased(0, 38) and hasJob then
                            medicalSuppliesMenu(k)
                            sleep = 1500
                        end
                    elseif dist >= 2.6 and not Config.targetSystem and textUI then
                        wsb.hideTextUI()
                        textUI = false
                    elseif dist >= 31 and pedSpawned then
                        local model = GetEntityModel(ped)
                        SetModelAsNoLongerNeeded(model)
                        DeletePed(ped)
                        SetPedAsNoLongerNeeded(ped)
                        RemoveAnimDict('mini@strip_club@idles@bouncer@base')
                        pedSpawned = false
                    end
                    Wait(sleep)
                end
            end)
        end
        if v.Vehicles.Enabled then
            CreateThread(function()
                local zone = v.Vehicles.Zone
                local textUI
                while true do
                    local sleep = 1500
                    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                    if hasJob and wsb.framework == 'qb' then
                        if not wsb.playerData.job.onduty then hasJob = nil end
                    end
                    if hasJob then
                        local playerPed = cache.ped
                        local coords = GetEntityCoords(playerPed)
                        local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(zone.coords.x, zone.coords.y, zone.coords.z))
                        local dist2 = #(vector3(coords.x, coords.y, coords.z) - vector3(v.Vehicles.Spawn.air.coords.x, v.Vehicles.Spawn.air.coords.y, v.Vehicles.Spawn.air.coords.z))
                        if dist < zone.range + 1 and not inMenu and not IsPedInAnyVehicle(playerPed, false) then
                            sleep = 0
                            if not textUI then
                                wsb.showTextUI(zone.label)
                                textUI = true
                            end
                            if IsControlJustReleased(0, 38) then
                                textUI = nil
                                wsb.hideTextUI()
                                openVehicleMenu(k)
                                sleep = 1500
                            end
                        elseif dist < zone.range + 1 and not inMenu and IsPedInAnyVehicle(playerPed, false) then
                            sleep = 0
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
                                    SetEntityAsMissionEntity(cache.vehicle, true, true)

                                    local plate = GetVehicleNumberPlateText(cache.vehicle)
                                    local model = GetEntityModel(cache.vehicle)
                                    wsb.removeCarKeys(plate, model, cache.vehicle)
                                    if Config.EnableStretcher then DeleteStretcherFromVehicle(cache.vehicle) end
                                    if Config.AdvancedParking then
                                        exports["AdvancedParking"]:DeleteVehicle(cache.vehicle, false)
                                    else
                                        DeleteVehicle(cache.vehicle)
                                    end
                                    DoScreenFadeIn(800)
                                end
                            end
                        elseif dist2 < 10 and IsPedInAnyVehicle(playerPed, false) then
                            sleep = 0
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
                                    SetEntityAsMissionEntity(cache.vehicle, true, true)

                                    local plate = GetVehicleNumberPlateText(cache.vehicle)
                                    local model = GetEntityModel(cache.vehicle)
                                    wsb.removeCarKeys(plate, model, cache.vehicle)
                                    if Config.EnableStretcher then DeleteStretcherFromVehicle(cache.vehicle) end
                                    if Config.AdvancedParking then
                                        exports["AdvancedParking"]:DeleteVehicle(cache.vehicle, false)
                                    else
                                        DeleteVehicle(cache.vehicle)
                                    end
                                    SetEntityCoordsNoOffset(playerPed, zone.coords.x, zone.coords.y, zone.coords.z, false,
                                        false, false)
                                    DoScreenFadeIn(800)
                                end
                            end
                        else
                            if textUI then
                                textUI = nil
                                wsb.hideTextUI()
                            end
                        end
                    end
                    Wait(sleep)
                end
            end)
        end
    end
end)

if Config.EnableStandaloneCheckIns then
    CreateThread(function()
        for id, checkInSpots in pairs(Config.StandaloneCheckIns) do
            if checkInSpots.Target.enabled then
                wsb.target.boxZone('standalone_checkin_' .. id, checkInSpots.Target.coords, checkInSpots.Target.width,
                    checkInSpots.Target.length, {
                        heading = checkInSpots.Target.heading,
                        minZ = checkInSpots.Target.minZ,
                        maxZ = checkInSpots.Target.maxZ,
                        distance = checkInSpots.Target.distance,
                        options = {
                            {
                                name = 'standalone_checkin_' .. id,
                                event = 'wasabi_ambulance:attemptCheckin',
                                icon = 'fa-solid fa-suitcase-medical',
                                distance = checkInSpots.Target.distance,
                                label = checkInSpots.Target.label,
                                hospital = 'standalone',
                                standaloneID = id
                            }
                        }
                    })
            end
            local standaloneCheckInTimer = GetGameTimer()
            CreateThread(function()
                local ped, pedSpawned
                local textUI
                while true do
                    local sleep = 1500
                    local playerPed = cache.ped
                    local coords = GetEntityCoords(playerPed)
                    local dist = #(vector3(coords.x, coords.y, coords.z) - vector3(checkInSpots.Coords.x, checkInSpots.Coords.y, checkInSpots.Coords.z))
                    if dist <= 30 and not pedSpawned then
                        lib.requestAnimDict('mini@strip_club@idles@bouncer@base', 3000)
                        lib.requestModel(checkInSpots.Ped, 3000)
                        ped = CreatePed(28, checkInSpots.Ped, checkInSpots.Coords.x, checkInSpots.Coords.y,
                            checkInSpots.Coords.z, checkInSpots.Heading, false, false)
                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskPlayAnim(ped, 'mini@strip_club@idles@bouncer@base', 'base', 8.0, 0.0, -1, 1, 0, false, false,
                            false)
                        pedSpawned = true
                    elseif not checkInSpots?.Target?.enabled and dist <= checkInSpots?.Distance then
                        if not textUI then
                            wsb.showTextUI(checkInSpots.Label)
                            textUI = true
                        end
                        sleep = 0
                        if IsControlJustReleased(0, checkInSpots.HotKey) then
                            local cooldownTime = 3000
                            if checkInSpots.DisableHospitalBeds then cooldownTime = checkInSpots.Duration + 500 end
                            if GetGameTimer() - standaloneCheckInTimer > cooldownTime then
                                standaloneCheckInTimer = GetGameTimer()
                                textUI = nil
                                wsb.hideTextUI()
                                TriggerServerEvent('wasabi_ambulance:tryStandaloneRevive', id)
                            else
                                TriggerEvent('wasabi_bridge:notify', Strings.checkin_cooldown,
                                    Strings.checkin_cooldown_desc, 'error')
                            end
                        end
                    elseif dist >= (checkInSpots.Distance + 1) and textUI then
                        wsb.hideTextUI()
                        textUI = nil
                    elseif dist >= 31 and pedSpawned then
                        local model = GetEntityModel(ped)
                        SetModelAsNoLongerNeeded(model)
                        DeletePed(ped)
                        SetPedAsNoLongerNeeded(ped)
                        RemoveAnimDict('mini@strip_club@idles@bouncer@base')
                        pedSpawned = nil
                    end
                    Wait(sleep)
                end
            end)
        end
    end)
end

RegisterNetEvent('wasabi_ambulance:useBandage', function()
    local HasItem = lib.callback.await('wasabi_ambulance:itemCheck', 500, Config.Bandages.item)
    if not HasItem or HasItem < 1 then return end
    TriggerServerEvent('wasabi_ambulance:useBandage', cache.serverId)
    local progressUI
    if Config.ProgressCircle then progressUI = 'progressCircle' else progressUI = 'progressBar' end
    if lib[progressUI]({
            duration = Config.Bandages.duration,
            label = Strings.healing_self_prog,
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = 'missheistdockssetup1clipboard@idle_a',
                clip = 'idle_a'
            },
        }) then
        local health = GetEntityHealth(cache.ped)
        health = (Config.Bandages.hpRegen * 2) + health
        if health > 200 then health = 200 end
        SetEntityHealth(PlayerPedId(), health + 0.0)
        if Config.Bandages.healBleed and next(PlayerInjury) then
            for _, injury in pairs(PlayerInjury) do
                if injury.data.bleed > 0 then
                    injury.data.bleed = 0
                end
            end
            TriggerServerEvent('wasabi_ambulance:injurySync', PlayerInjury)
        end
        if Config.MythicHospital then
            TriggerEvent('mythic_hospital:client:RemoveBleed')
            TriggerEvent('mythic_hospital:client:ResetLimbs')
        end
    else
        TriggerEvent('wasabi_bridge:notify', Strings.action_cancelled, Strings.action_cancelled_desc, 'error')
    end
end)

RegisterNetEvent('wasabi_ambulance:syncRequests', function(_plyRequests, quiet)
    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
    if wsb.framework == 'qb' then
        if not wsb.playerData.job.onduty then hasJob = nil end
    end
    if hasJob then
        plyRequests = _plyRequests
        if not quiet then
            TriggerEvent('wasabi_bridge:notify', Strings.assistance_title, Strings.assistance_desc, 'error',
                'suitcase-medical')
        end
    end
end)

RegisterNetEvent('wasabi_ambulance:weaponRemove', function()
    RemoveAllPedWeapons(cache.ped, true)
end)

if wsb.framework == 'esx' then
    RegisterNetEvent('esx_ambulancejob:revive', function()
        TriggerEvent('wasabi_ambulance:revive') -- ESX Compatibility
    end)
end

RegisterNetEvent('wasabi_ambulance:revivePlayer', function(serverdata)
    if isDead then
        local injury = serverdata
        HideDeathNui()
        TriggerEvent('wasabi_ambulance:customInjuryClear')
        SetEntityInvincible(cache.ped, false)
        TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, true)
        DrugIntake = {}
        ClearDrugEffects(PlayerPedId())
        isDead = false
        while not DoesEntityExist(cache.ped) do Wait(500) end
        if IsPedDeadOrDying(PlayerPedId(), false) then
            local coords = GetEntityCoords(cache.ped)
            local heading = GetEntityHeading(cache.ped)
            NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
        else
            ClearPedTasks(cache.ped)
        end
        if GetEntityHealth(cache.ped) < 200 then SetEntityHealth(cache.ped, 200) end
        lib.requestAnimDict('get_up@directional@movement@from_knees@action', 3000)
        TaskPlayAnim(cache.ped, 'get_up@directional@movement@from_knees@action', 'getup_r_0', 8.0, -8.0, -1, 0, 0, false,
            false, false)
        RemoveAnimDict('get_up@directional@movement@from_knees@action')
        ClearPedBloodDamage(cache.ped)
        if Config.MythicHospital then
            TriggerEvent('mythic_hospital:client:RemoveBleed')
            TriggerEvent('mythic_hospital:client:ResetLimbs')
        end
        FreezeEntityPosition(cache.ped, false)
        DoScreenFadeIn(800)
        if Config.DeathScreenEffects then AnimpostfxStopAll() end
        if wsb.framework == 'esx' then
            TriggerServerEvent('esx:onPlayerSpawn')
            TriggerEvent('esx:onPlayerSpawn')
        elseif wsb.framework == 'qb' then
            TriggerServerEvent('hospital:server:resetHungerThirst') -- qb-ambulancejob compatibility
            TriggerServerEvent('hud:server:RelieveStress', 100)
            TriggerEvent('wasabi_bridge:onPlayerSpawn')
        end
        ClearPedTasks(cache.ped)
        Wait(1000)
        if not injury then return end
        ApplyDamageToPed(cache.ped, Config.ReviveHealth[injury], false)
    end
end)


RegisterNetEvent('wasabi_ambulance:revive', function(noAnim)
    TriggerEvent('wasabi_ambulance:customInjuryClear')
    SetEntityInvincible(cache.ped, false)
    TriggerServerEvent('wasabi_ambulance:injurySync', false)
    HideDeathNui()
    TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, true)
    DrugIntake = {}
    nodOutRunning = false
    currentDrugEffect = false
    --[[ DoScreenFadeOut(800)
    while not IsScreenFadedOut() do
        Wait(50)
    end]]
    while not DoesEntityExist(cache.ped) do Wait(500) end

    if IsPedDeadOrDying(cache.ped) then
        local coords = GetEntityCoords(cache.ped)
        local heading = GetEntityHeading(cache.ped)
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
    else
        ClearPedTasks(cache.ped)
    end
    if GetEntityHealth(cache.ped) < 200 then SetEntityHealth(cache.ped, 200) end
    if not noAnim then
        lib.requestAnimDict('get_up@directional@movement@from_knees@action', 3000)
        TaskPlayAnim(cache.ped, 'get_up@directional@movement@from_knees@action', 'getup_r_0', 8.0, -8.0, -1, 0, 0, false,
            false, false)
        RemoveAnimDict('get_up@directional@movement@from_knees@action')
    end
    ClearPedBloodDamage(cache.ped)
    isDead = false
    PlayerInjury = {}
    if Config.MythicHospital then
        TriggerEvent('mythic_hospital:client:RemoveBleed')
        TriggerEvent('mythic_hospital:client:ResetLimbs')
    end
    if Config.DeathScreenEffects then AnimpostfxStopAll() end
    if wsb.framework == 'esx' then
        TriggerServerEvent('esx:onPlayerSpawn')
        TriggerEvent('esx:onPlayerSpawn', (noAnim or false))
    elseif wsb.framework == 'qb' then
        TriggerServerEvent('hospital:server:resetHungerThirst') -- qb-ambulancejob compatibility
        TriggerServerEvent('hud:server:RelieveStress', 100)
        TriggerEvent('wasabi_bridge:onPlayerSpawn', (noAnim or false))
    end
    Wait(1000)
    ClearPedTasks(cache.ped)
end)

RegisterNetEvent('wasabi_ambulance:heal', function(full, quiet)
    local ped = cache.ped
    local maxHealth = 200
    if not full then
        local health = GetEntityHealth(ped)
        local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
        SetEntityHealth(ped, newHealth + 0.0)
    else
        SetEntityHealth(ped, maxHealth + 0.0)
        if wsb.framework == 'qb' then
            TriggerServerEvent('hospital:server:resetHungerThirst')
            TriggerServerEvent('hud:server:RelieveStress', 100)
        end
    end
    if Config.MythicHospital then
        TriggerEvent('mythic_hospital:client:RemoveBleed')
        TriggerEvent('mythic_hospital:client:ResetLimbs')
    end
    if Config.EnableLiveInjury and full then ClearPatientSymptoms() end
    if not quiet then
        TriggerEvent('wasabi_bridge:notify', Strings.player_successful_heal, Strings.player_healed_desc, 'success')
    end
    if Config.EMSItems.heal.healBleed and next(PlayerInjury) and not full then
        for _, injury in pairs(PlayerInjury) do
            if injury.data.bleed > 0 then
                injury.data.bleed = 0
            end
        end
        TriggerServerEvent('wasabi_ambulance:injurySync', PlayerInjury)
    end
end)

RegisterNetEvent('wasabi_ambulance:sedate', function()
    local ped = cache.ped
    TriggerEvent('wasabi_bridge:notify', Strings.assistance_title, Strings.assistance_desc, 'success', 'syringe')
    ClearPedTasks(ped)
    lib.requestAnimDict(Config.DeathAnimation.anim, 3000)
    disableKeys = true
    TaskPlayAnim(ped, Config.DeathAnimation.anim, Config.DeathAnimation.lib, 8.0, 8.0, -1, 33, 0, false, false, false)
    FreezeEntityPosition(ped, true)
    Wait(Config.EMSItems.sedate.duration)
    FreezeEntityPosition(ped, false)
    disableKeys = false
    ClearPedTasks(ped)
    RemoveAnimDict(Config.DeathAnimation.anim)
end)

RegisterNetEvent('wasabi_ambulance:intoVehicle', function()
    local ped = cache.ped
    local coords = GetEntityCoords(ped)
    if IsPedInAnyVehicle(ped, false) and not OccupyingStretcher then
        coords = GetOffsetFromEntityInWorldCoords(ped, -2.0, 1.0, 0.0)
        SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false)
    else
        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 6.0) then
            local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 6.0, 0, 71)
            if DoesEntityExist(vehicle) and not OccupyingStretcher then
                local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)
                for i = maxSeats - 1, 0, -1 do
                    if IsVehicleSeatFree(vehicle, i) then
                        freeSeat = i
                        break
                    end
                end
                if freeSeat then
                    TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
                end
            end
        end
    end
end)

RegisterNetEvent('wasabi_ambulance:syncObj', function(netObj)
    local obj = NetToObj(netObj)
    deleteObj(obj)
end)

RegisterNetEvent('wasabi_ambulance:useSedative', function()
    useSedative()
end)

RegisterNetEvent('wasabi_ambulance:useMedbag', function()
    useMedbag()
end)

RegisterNetEvent('wasabi_ambulance:treatPatient', function(injury)
    treatPatient(injury)
end)

AddEventHandler('wasabi_ambulance:buyItem', function(data)
    TriggerServerEvent('wasabi_ambulance:restock', data)
end)

AddEventHandler('wasabi_ambulance:openBossMenu', function()
    wsb.openBossMenu()
end)

local checkInTimer = GetGameTimer()
AddEventHandler('wasabi_ambulance:attemptCheckin', function(data)
    if not data.hospital then return end
    local cooldown = 3000
    if data.hospital == 'standalone' then
        if Config.StandaloneCheckIns[data.standaloneID].DisableHospitalBeds then
            cooldown = Config.StandaloneCheckIns
                [data.standaloneID].Duration + 500
        end
        if GetGameTimer() - checkInTimer > cooldown then
            checkInTimer = GetGameTimer()
            TriggerServerEvent('wasabi_ambulance:tryStandaloneRevive', data.standaloneID)
        else
            TriggerEvent('wasabi_bridge:notify', Strings.checkin_cooldown, Strings.checkin_cooldown_desc, 'error')
        end
        return
    end
    local hospital = Config.Locations[data.hospital]
    if not hospital then return end
    if not hospital.CheckIn.Target.enabled then return end
    if hospital.CheckIn.DisableHospitalBeds then cooldown = hospital.CheckIn.Duration + 500 end
    if GetGameTimer() - checkInTimer > cooldown then
        checkInTimer = GetGameTimer()
        TriggerServerEvent('wasabi_ambulance:tryRevive', data.hospital)
    else
        TriggerEvent('wasabi_bridge:notify', Strings.checkin_cooldown, Strings.checkin_cooldown_desc, 'error')
    end
end)

AddEventHandler('wasabi_ambulance:spawnVehicle', function(data)
    inMenu = false
    local model = data.model
    local category = Config.Locations[data.hospital].Vehicles.Options[data.grade][data.model].category
    local spawnLoc = Config.Locations[data.hospital].Vehicles.Spawn[category]
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
        if Config.customCarlock then
            local plate = GetVehicleNumberPlateText(vehicle)
            wsb.giveCarKeys(plate, model, vehicle)
        end
        if Config.FuelSystem then
            SetCarFuel(vehicle, 100)
        end
        TaskWarpPedIntoVehicle(cache.ped, vehicle, -1)
        SetModelAsNoLongerNeeded(model)
        DoScreenFadeIn(800)
    end
end)

AddEventHandler('wasabi_ambulance:crutchMenu', function()
    exports.wasabi_crutch:OpenCrutchMenu()
end)

AddEventHandler('wasabi_ambulance:crutchRemoveMenu', function()
    exports.wasabi_crutch:OpenCrutchRemoveMenu()
end)

AddEventHandler('wasabi_ambulance:chairMenu', function()
    exports.wasabi_crutch:OpenChairMenu()
end)

AddEventHandler('wasabi_ambulance:chairRemoveMenu', function()
    exports.wasabi_crutch:OpenChairRemoveMenu()
end)

AddEventHandler('wasabi_ambulance:billPatient', function()
    if wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob) then
        local coords = GetEntityCoords(cache.ped)
        local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0)
        if not player then
            TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        else
            local targetId = GetPlayerServerId(player)
            if Config.billingSystem == 'okok' then
                TriggerEvent('okokBilling:ToggleCreateInvoice')
            else
                local input = lib.inputDialog(Strings.bill_patient, { Strings.amount })
                if not input then return end
                local input1 = tonumber(input[1])
                if type(input1) ~= 'number' then return end
                local amount = math.floor(input1)
                if amount < 1 then
                    TriggerEvent('wasabi_bridge:notify', Strings.invalid_entry, Strings.invalid_entry_desc, 'error')
                elseif Config.billingSystem == 'pefcl' then
                    TriggerServerEvent('wasabi_ambulance:billPlayer', targetId, amount)
                elseif Config.billingSystem == 'qb' then
                    local hasJob, _grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
                    TriggerServerEvent('wasabi_ambulance:qbBill', targetId, amount, hasJob)
                    local gender = Strings.mr
                    if wsb.playerData.charinfo.gender == 1 then
                        gender = Strings.mrs
                    end
                    local charinfo = wsb.playerData.charinfo
                    TriggerServerEvent('qb-phone:server:sendNewMail', {
                        sender = wsb.playerData.job.label,
                        subject = Strings.debt_collection,
                        message = (Strings.db_email):format(gender, charinfo.lastname, amount),
                        button = {}
                    })
                elseif Config.billingSystem == 'esx' then
                    TriggerServerEvent('esx_billing:sendBill', targetId, 'society_ambulance', 'EMS', amount)
                else
                    print('No proper billing system selected in configuration!') -- Replace this with your own billing
                end
            end
        end
    end
end)

AddEventHandler('wasabi_ambulance:medicalSuppliesMenu', function(data)
    medicalSuppliesMenu(data.hospital)
end)

AddEventHandler('wasabi_ambulance:gItem', function(data)
    gItem(data)
end)

AddEventHandler('wasabi_ambulance:interactBag', function()
    interactBag()
end)

AddEventHandler('wasabi_ambulance:pickupBag', function()
    pickupBag()
end)

AddEventHandler('wasabi_ambulance:removeDeadFromVehicle', function(data)
    local entity = data.entity
    local serverID = GetDeadPlayerInsideVehicle(entity)
    if not serverID then return end
    TriggerServerEvent('wasabi_ambulance:putInVehicle', serverID, true)
end)

AddEventHandler('wasabi_ambulance:dispatchMenu', function()
    openDispatchMenu()
end)

AddEventHandler('wasabi_ambulance:setRoute', function(data)
    setRoute(data)
end)

AddEventHandler('wasabi_ambulance:diagnosePatient', function()
    diagnosePatient()
end)
RegisterNetEvent('wasabi_ambulance:reviveTarget')
AddEventHandler('wasabi_ambulance:reviveTarget', function()
    reviveTarget()
end)

RegisterNetEvent('wasabi_ambulance:healTarget')
AddEventHandler('wasabi_ambulance:healTarget', function()
    healTarget()
end)

RegisterNetEvent('wasabi_ambulance:hospitalCheckIn', function(hospital)
    if not Config.Locations[hospital] then return end
    AttemptCheckIn(hospital)
end)

RegisterNetEvent('wasabi_ambulance:standaloneCheckIn', function(id)
    if not Config.StandaloneCheckIns[id] then return end
    AttemptCheckIn('standalone', id)
end)


--QBCORE COMPATIBILITY START
RegisterNetEvent('wasabi_ambulance:killPlayer', function()
    SetEntityHealth(cache.ped, 0.0)
end)

RegisterNetEvent('hospital:client:adminHeal', function()
    TriggerEvent('wasabi_ambulance:heal', true, true)
end)

RegisterNetEvent('hospital:client:KillPlayer', function()
    TriggerEvent('wasabi_ambulance:killPlayer')
end)

RegisterNetEvent('hospital:client:CheckStatus', function()
    TriggerEvent('wasabi_ambulance:diagnosePatient')
end)

RegisterNetEvent('hospital:client:RevivePlayer', function()
    TriggerEvent('wasabi_ambulance:reviveTarget')
end)

RegisterNetEvent('hospital:client:TreatWounds', function()
    TriggerEvent('wasabi_ambulance:healTarget')
end)

RegisterNetEvent('hospital:client:Revive', function()
    TriggerEvent('wasabi_ambulance:revive')
end)

RegisterNetEvent('qb-radialmenu:client:TakeStretcher', function()
    ToggleStretcher()
end)

RegisterNetEvent('qb-radialmenu:client:RemoveStretcher', function()
    local closestStretcher = GetClosestStretcher(3.0)
    if not closestStretcher then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        return
    end
    PlaceStretcherInVehicle(closestStretcher.id)
end)
--QBCORE COMPATIBILITY END

RegisterCommand('emsJobMenu', function()
    OpenJobMenu()
end)

AddEventHandler('wasabi_ambulance:emsJobMenu', function()
    OpenJobMenu()
end)

TriggerEvent('chat:removeSuggestion', '/emsJobMenu')

RegisterKeyMapping('emsJobMenu', Strings.key_map_text, 'keyboard', Config.jobMenu)
