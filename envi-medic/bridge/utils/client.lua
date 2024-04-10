Framework.LoadModel = function(model)
    if not tonumber(model) then model = joaat(model) end

    if HasModelLoaded(model) then return end

    if not IsModelValid(model) then
        return error(("Model '%s' does not exist or is invalid"):format(model))
    end

    RequestModel(model)

    if coroutine.isyieldable() then
        while not HasModelLoaded(model) do
            Wait(0)
        end
    end
end

Framework.LoadAnimDict = function(animDict)
    if HasAnimDictLoaded(animDict) then return end

    if type(animDict) ~= "string" then
        return error(("Animation Dictionary needs to be of type 'string' but is type of %s"):format(type(animDict)))
    end

    if not DoesAnimDictExist(animDict) then
        return error(("Animation Dictionary '%s' does not exist or is invalid"):format(animDict))
    end

    RequestAnimDict(animDict)

    if coroutine.isyieldable() then
        while not HasAnimDictLoaded(animDict) do
            Wait(0)
        end
    end
end

Framework.LoadAnimSet = function(animSet)
    if HasAnimSetLoaded(animSet) then return end

    if type(animSet) ~= "string" then
        return error(("Animation Clipset needs to be of type 'string' but is type of %s"):format(type(animSet)))
    end

    RequestAnimSet(animSet)

    if coroutine.isyieldable() then
        while not HasAnimSetLoaded(animSet) do
            Wait(0)
        end
    end
end

Framework.LoadAmbientAudioBank = function(bank)
    if RequestAmbientAudioBank(bank, false) then return end

    if type(bank) ~= "string" then
        return error(("Ambient Audio Bank needs to be of type 'string' but is type of %s"):format(type(bank)))
    end

    RequestAmbientAudioBank(bank, false)

    if coroutine.isyieldable() then
        while not RequestAmbientAudioBank(bank, false) do
            Wait(0)
        end
    end
end

Framework.LoadMissionAudioBank = function(bank)
    if RequestMissionAudioBank(bank, false) then return end

    if type(bank) ~= "string" then
        return error(("Mission Audio Bank needs to be of type 'string' but is type of %s"):format(type(bank)))
    end

    RequestMissionAudioBank(bank, false)

    if coroutine.isyieldable() then
        while not RequestMissionAudioBank(bank, false) do
            Wait(0)
        end
    end
end

Framework.LoadScriptAudioBank = function(bank)
    if RequestScriptAudioBank(bank, false) then return end

    if type(bank) ~= "string" then
        return error(("Script Audio Bank needs to be of type 'string' but is type of %s"):format(type(bank)))
    end

    RequestScriptAudioBank(bank, false)

    if coroutine.isyieldable() then
        while not RequestScriptAudioBank(bank, false) do
            Wait(0)
        end
    end
end

Framework.GetPeds = function()
    return GetGamePool('CPed')
end

Framework.GetObjects = function()
    return GetGamePool('CObject')
end

Framework.GetVehicles = function()
    return GetGamePool('CVehicle')
end

Framework.GetPickups = function()
    return GetGamePool('CPickup')
end

Framework.GetClosestPed = function(coords, distance)
    local peds = Framework.GetPeds()
    local closestPed, closestCoords
    distance = distance or 2.0

    for i = 1, #peds do
        local ped = peds[i]

        if not IsPedAPlayer(ped) then
            local pedCoords = GetEntityCoords(ped)
            local pedDistance = #(coords - pedCoords)

            if pedDistance < distance then
                distance = pedDistance
                closestPed = ped
                closestCoords = pedCoords
            end
        end
    end

    return closestPed, closestCoords
end

Framework.GetClosestPlayer = function(coords, distance, includeLocal)
    local players = GetActivePlayers()
    local closestPlayer, closestPed, closestCoords
    distance = distance or 2.0

    for i = 1, #players do
        local player = players[i]

        if player ~= PlayerId() or includeLocal then
            local playerPed = GetPlayerPed(player)
            local playerCoords = GetEntityCoords(playerPed)
            local playerDistance = #(coords - playerCoords)

            if playerDistance < distance then
                distance = playerDistance
                closestPlayer = player
                closestPed = playerPed
                closestCoords = playerCoords
            end
        end
    end

    return closestPlayer, closestPed, closestCoords
end

Framework.GetClosestObject = function(coords, distance)
    local objects = Framework.GetObjects()
    local closestObject, closestCoords
    distance = distance or 2.0

    for i = 1, #objects do
        local object = objects[i]

        local objectCoords = GetEntityCoords(object)
        local objectDistance = #(coords - objectCoords)

        if objectDistance < distance then
            distance = objectDistance
            closestObject = object
            closestCoords = objectCoords
        end
    end

    return closestObject, closestCoords
end

Framework.GetClosestVehicle = function(coords, distance, includeLocal)
    local vehicles = Framework.GetVehicles()
    local closestVehicle, closestCoords
    distance = distance or 2.0
    local ped = PlayerPedId()
    local inVehicle = IsPedInAnyVehicle(ped, true)
    local localVehicle = GetVehiclePedIsIn(ped, false)

    for i = 1, #vehicles do
        local vehicle = vehicles[i]
        
        if not inVehicle or vehicle ~= localVehicle or includeLocal then
            local vehicleCoords = GetEntityCoords(vehicle)
            local vehicleDistance = #(coords - vehicleCoords)

            if vehicleDistance < distance then
                distance = vehicleDistance
                closestVehicle = vehicle
                closestCoords = vehicleCoords
            end
        end
    end

    return closestVehicle, closestCoords
end

Framework.GetClosestPickup = function(coords, distance)
    local pickups = Framework.GetPickups()
    local closestPickup, closestCoords
    distance = distance or 2.0

    for i = 1, #pickups do
        local pickup = pickups[i]

        local pickupCoords = GetEntityCoords(pickup)
        local pickupDistance = #(coords - pickupCoords)

        if pickupDistance < distance then
            distance = pickupDistance
            closestPickup = pickup
            closestCoords = pickupCoords
        end
    end

    return closestPickup, closestCoords
end

Framework.GetNearbyPeds = function(coords, distance)
    local peds = Framework.GetPeds()
    local nearby = {}
    distance = distance or 2.0

    for i = 1, #peds do
        local ped = peds[i]

        if not IsPedAPlayer(ped) then
            local pedCoords = GetEntityCoords(ped)
            local pedDistance = #(coords - pedCoords)

            if pedDistance < distance then
                nearby[#nearby+1] = {
                    ped = ped,
                    coords = pedCoords
                }
            end
        end
    end

    return nearby
end

Framework.GetNearbyPlayers = function(coords, distance, includeLocal)
    local players = GetActivePlayers()
    local nearby = {}
    distance = distance or 2.0

    for i = 1, #players do
        local player = players[i]

        if player ~= PlayerId() or includeLocal then
            local playerPed = GetPlayerPed(player)
            local playerCoords = GetEntityCoords(playerPed)
            local playerDistance = #(coords - playerCoords)

            if playerDistance < distance then
                nearby[#nearby+1] = {
                    id = player,
                    ped = playerPed,
                    coords = playerCoords
                }
            end
        end
    end

    return nearby
end

Framework.GetNearbyObjects = function(coords, distance)
    local objects = Framework.GetObjects()
    local nearby = {}
    distance = distance or 2.0

    for i = 1, #objects do
        local object = objects[i]

        local objectCoords = GetEntityCoords(object)
        local objectDistance = #(coords - objectCoords)

        if objectDistance < distance then
            nearby[#nearby+1] = {
                object = object,
                coords = objectCoords
            }
        end
    end

    return nearby
end

Framework.GetNearbyVehicles = function(coords, distance, includeLocal)
    local vehicles = Framework.GetVehicles()
    local nearby = {}
    distance = distance or 2.0
    local ped = PlayerPedId()
    local inVehicle = IsPedInAnyVehicle(ped, true)
    local localVehicle = GetVehiclePedIsIn(ped, false)

    for i = 1, #vehicles do
        local vehicle = vehicles[i]

        if not inVehicle or vehicle ~= localVehicle or includeLocal then
            local vehicleCoords = GetEntityCoords(vehicle)
            local vehicleDistance = #(coords - vehicleCoords)

            if vehicleDistance < distance then
                nearby[#nearby+1] = {
                    vehicle = vehicle,
                    coords = vehicleCoords
                }
            end
        end
    end

    return nearby
end

Framework.GetNearbyPickups = function(coords, distance)
    local pickups = Framework.GetPickups()
    local nearby = {}
    distance = distance or 2.0

    for i = 1, #pickups do
        local pickup = pickups[i]

        local pickupCoords = GetEntityCoords(pickup)
        local pickupDistance = #(coords - pickupCoords)

        if pickupDistance < distance then
            nearby[#nearby+1] = {
                pickup = pickup,
                coords = pickupCoords
            }
        end
    end

    return nearby
end

Framework.ProgressBar = function(data)
    if GetResourceState('progressbar'):find('start') then
        local props = {}
        if data.props then
            if data.props.model then
                props[1] = {
                    model = data.props.model,
                    bone = data.props.bone,
                    pos = data.props.pos,
                    rot = data.props.rot
                }
            else
                for index, value in ipairs(data.props) do
                    props[index] = {
                        model = value.model,
                        bone = value.bone,
                        pos = value.pos,
                        rot = value.rot
                    }
                end
            end
        end

        exports['progressbar']:Progress({
            name = data.label,
            duration = data.duration,
            label = data.label,
            useWhileDead = data.useWhileDead,
            canCancel = data.canCancel,
            controlDisables = (not data.disable and nil or {
                disableMovement = data.disable.move or false,
                disableMouse = data.disable.mouse or false,
                disableCarMovement = data.disable.vehicle or false,
                disableCombat = data.disable.combat or false
            }),
            animation = (data.anim and {
                animDict = data.anim.dict,
                anim = data.anim.clip,
                flag = data.anim.flag or 49,
                task = data.anim.scenario
            }),
            prop = (props[1] and {
                model = props[1].model,
                bone = props[1].bone,
                coords = props[1].pos,
                rotation = props[1].rot,
            }),
            propTwo = (props[2] and {
                model = props[2].model,
                bone = props[2].bone,
                coords = props[2].pos,
                rotation = props[2].rot,
            }),
        }, function(cancelled)
            if data.anim then
                StopAnimTask(PlayerPedId(), data.anim.dict, data.anim.clip, 1.0)
                Wait(0)
            else
                ClearPedTasks(PlayerPedId())
            end
            if not cancelled and data.onFinish then data.onFinish() end
            if cancelled and data.onCancel then data.onCancel() end
        end)
        return
    end

    if GetResourceState('ox_lib'):find('start') then
        if lib.progressBar({
            duration = data.duration,
            label = data.label,
            useWhileDead = data.useWhileDead,
            canCancel = data.canCancel,
            disable = (data.disable and {
                move = data.disable.move or false,
                mouse = data.disable.mouse or false,
                car = data.disable.vehicle or false,
                combat = data.disable.combat or false
            }),
            anim = (data.anim and {
                dict = data.anim.dict,
                clip = data.anim.clip,
                flag = data.anim.flag or 49,
                scenario = data.anim.scenario
            }),
            prop = data.props
        }) then
            if data.onFinish then data.onFinish() end
        else
            if data.onCancel then data.onCancel() end
        end
        return
    end
end

Framework.NetworkRequestControlOfNetworkId = function(netid)
    if not NetworkDoesNetworkIdExist(netid) then
        return
    end

    NetworkRequestControlOfNetworkId(netid)

    if coroutine.isyieldable() then
        while not NetworkHasControlOfNetworkId(netid) do
            Wait(0)
        end
    end
end

Framework.NetworkRequestControlOfEntity = function(entity)
    if not DoesEntityExist(entity) or not NetworkGetEntityIsNetworked(entity) then
        return
    end

    NetworkRequestControlOfEntity(entity)

    if coroutine.isyieldable() then
        while not NetworkHasControlOfEntity(entity) do
            Wait(0)
        end
    end
end

Framework.NetworkRequestControlOfDoor = function(door)
    if not NetworkIsDoorNetworked(door) then
        return
    end

    NetworkRequestControlOfDoor(door)

    if coroutine.isyieldable() then
        while not NetworkHasControlOfDoor(door) do
            Wait(0)
        end
    end
end
