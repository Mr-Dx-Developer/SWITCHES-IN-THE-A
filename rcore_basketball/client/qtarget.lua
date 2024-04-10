TargetingData = {}

function GetTargetFunction()
    return Config.TargetResourceName;
end

function SetTargetingStatusFree(hoopData)
    local key = 'basketball_free_' .. hoopData.index
    
    if not TargetingData[key] then
        local oxZoneId = CreateTargetFreeZone(key, hoopData.groundPos, hoopData.hoopHeading, hoopData.index)
        TargetingData[key] = {
            removeAt = GetGameTimer() + 100,
            zoneId = oxZoneId or key,
        }
    else
        TargetingData[key].removeAt = GetGameTimer() + 100
    end
end

function SetTargetingStatusJoin(hoopData)
    local key = 'basketball_join_' .. hoopData.index
    
    if not TargetingData[key] then
        local oxZoneId = CreateTargetJoinZone(key, hoopData.groundPos, hoopData.hoopHeading, hoopData.index)
        TargetingData[key] = {
            removeAt = GetGameTimer() + 100,
            zoneId = oxZoneId or key,
        }
    else
        TargetingData[key].removeAt = GetGameTimer() + 100
    end
end


function SetTargetingTakeHoop(hoopData)
    local key = 'basketball_takehoop_' .. hoopData.index
    if not TargetingData[key] then
        CreateTakeHoop(key, hoopData.hoopEntity, hoopData.index)
        
        TargetingData[key] = {
            removeAt = GetGameTimer() + 100,
            zoneId = key,
            entity = hoopData.hoopEntity,
        }
    else
        TargetingData[key].removeAt = GetGameTimer() + 100
    end
end

function SetTargetingPickupBall(hoopData, pickupPos, idx)
    local coords = GetEntityCoords(hoopData.ballEntity)

    local xPos = tonumber(math.floor(coords.x*10))
    local yPos = tonumber(math.floor(coords.y*10))
    local zPos = tonumber(math.floor(coords.z*10))
    
    local key = 'basketball_pickup_' .. hoopData.index .. '_' .. '_' .. xPos .. '_' .. yPos .. '_' .. zPos .. '_' .. idx
    
    if not TargetingData[key] then
        local oxZoneId = CreateTargetPickupZone(key, coords, hoopData.index)

        TargetingData[key] = {
            removeAt = GetGameTimer() + 100,
            zoneId = oxZoneId or key,
        }
    else
        TargetingData[key].removeAt = GetGameTimer() + 100
    end
end

function SetTargetingFinishSetup(hoopData)
    local key = 'basketball_setup_' .. hoopData.index
    
    if not TargetingData[key] then
        local oxZoneId = CreateTargetSetupZone(key, hoopData.groundPos, hoopData.hoopHeading, hoopData.index)

        TargetingData[key] = {
            removeAt = GetGameTimer() + 100,
            zoneId = oxZoneId or key,
        }
    else
        TargetingData[key].removeAt = GetGameTimer() + 100
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(250)

        local time = GetGameTimer()

        for key, data in pairs(TargetingData) do
            if data.removeAt < time then
                RemoveTargetBoxZone(data.zoneId, data.entity)
                TargetingData[key] = nil
            end
        end
    end
end)

function CreateTargetFreeZone(name, pos, heading, hoopId)
    if Config.UseOxTarget then
        return exports.ox_target:addBoxZone({
            coords = pos,
            size = vec3(1, 1, 1),
            rotation = heading,
            options = {
                {
                    name = name,
                    event = 'rcore_basketball:freeOpenNui',
                    icon = 'fas fa-folder-open',
                    label = Config.Text.T_OPEN,
                    hoopId = hoopId,
                }
            }
        })
    else
        exports[GetTargetFunction()]:AddBoxZone(name, pos, 1.5, 1.5, {
            name=name,
            heading=heading,
            debugPoly=false,
            minZ=pos.z-0.5,
            maxZ=pos.z+0.5,
        }, {
            options = {
                {
                    event = "rcore_basketball:freeOpenNui",
                    icon = "fas fa-folder-open",
                    label = Config.Text.T_OPEN,
                    hoopId = hoopId,
                },
            },
            distance = 3.5
        })
    end
end

function CreateTargetJoinZone(name, pos, heading, hoopId)
    if Config.UseOxTarget then
        return exports.ox_target:addBoxZone({
            coords = pos,
            size = vec3(1, 1, 1),
            rotation = heading,
            options = {
                {
                    name = name,
                    event = "rcore_basketball:openNui",
                    icon = "fas fa-folder-open",
                    label = Config.Text.T_OPEN,
                    hoopId = hoopId,
                }
            }
        })
    else
        exports[GetTargetFunction()]:AddBoxZone(name, pos, 1.5, 1.5, {
            name=name,
            heading=heading,
            debugPoly=false,
            minZ=pos.z-0.5,
            maxZ=pos.z+0.5,
        }, {
            options = {
                {
                    event = "rcore_basketball:openNui",
                    icon = "fas fa-folder-open",
                    label = Config.Text.T_OPEN,
                    hoopId = hoopId,
                },
            },
            distance = 3.5
        })
    end
end

function CreateTakeHoop(name, entity, hoopId)
    if Config.UseOxTarget then
        exports.ox_target:addLocalEntity(
            {entity}, 
            {
                {
                    name = name,
                    event = "rcore_basketball:removeHoop",
                    icon = "fas fa-trash",
                    label = Config.Text.REMOVE_HOOP,
                    hoopId = hoopId,
                }
            }
        )
    else
        exports[GetTargetFunction()]:AddEntityZone(name, entity, {
            name=name,
            debugPoly=false,
            useZ = true,
        }, {
            options = {
                {
                    event = "rcore_basketball:removeHoop",
                    icon = "fas fa-trash",
                    label = Config.Text.REMOVE_HOOP,
                    hoopId = hoopId,
                },
            },
            distance = 8.0
        })
    end
end

function CreateTargetSetupZone(name, pos, heading, hoopId)
    if Config.UseOxTarget then
        return exports.ox_target:addBoxZone({
            coords = pos,
            size = vec3(1, 1, 1),
            rotation = heading,
            options = {
                {
                    name = name,
                    event = "rcore_basketball:finishHoopSetup",
                    icon = "fas fa-flag-checkered",
                    label = Config.Text.T_FINISH_SETUP,
                    hoopId = hoopId,
                }
            }
        })
    else
        exports[GetTargetFunction()]:AddBoxZone(name, pos, 1.5, 1.5, {
            name=name,
            heading=heading,
            debugPoly=false,
            minZ=pos.z-0.5,
            maxZ=pos.z+0.5,
        }, {
            options = {
                {
                    event = "rcore_basketball:finishHoopSetup",
                    icon = "fas fa-flag-checkered",
                    label = Config.Text.T_FINISH_SETUP,
                    hoopId = hoopId,
                },
            },
            distance = 3.5
        })
    end
end

function CreateTargetPickupZone(name, coords, hoopId)
    if Config.UseOxTarget then
        return exports.ox_target:addBoxZone({
            coords = coords,
            size = vec3(1, 1, 1),
            rotation = 0.0,
            options = {
                {
                    name = name,
                    event = "rcore_basketball:pickup",
                    icon = "fas fa-up-long",
                    label = Config.Text.T_PICKUP,
                    hoopId = hoopId,
                }
            }
        })
    else
        exports[GetTargetFunction()]:AddBoxZone(name, coords, 1.5, 1.5, {
            name=name,
            heading=0.0,
            debugPoly=false,
            minZ=coords.z-0.5,
            maxZ=coords.z+0.5,
        }, {
            options = {
                {
                    event = "rcore_basketball:pickup",
                    icon = "fas fa-up-long",
                    label = Config.Text.T_PICKUP,
                    hoopId = hoopId,
                },
            },
            distance = 3.5
        })
    end
end

function RemoveTargetBoxZone(name, entity)
    if Config.UseOxTarget then
        if entity then
            exports.ox_target:removeLocalEntity({entity}, {name})
        else
            exports.ox_target:removeZone(name)
        end
    else
        exports[GetTargetFunction()].RemoveZone(name, name)
    end
end

AddEventHandler('rcore_basketball:pickup', function(data)
    SetPedLookAtBall(PlayerPedId(), BasketballHoops[data.hoopId].ballEntity)
    PlayPickupAnim(PlayerPedId())
    TriggerServerEvent('rcore_basketball:pickupBall')
end)


AddEventHandler('rcore_basketball:freeOpenNui', function(data)
    if Config.RequireBasketball then
        TriggerServerEvent('rcore_basketball:requestOpenSetup', data.hoopId)
    else
        OpenNUI(data.hoopId)
    end
end)

RegisterNetEvent('rcore_basketball:openNui', function(data)
    OpenNUI(data.hoopId)
end)

AddEventHandler('rcore_basketball:finishHoopSetup', function(data)
    TriggerServerEvent('rcore_basketball:finishHoopSetup')
end)

AddEventHandler('onResourceStop', function(name)
    if GetCurrentResourceName() == name then
        for key, data in pairs(TargetingData) do
			RemoveTargetBoxZone(data.zoneId, data.entity)
		end
    end
end)

AddEventHandler('rcore_basketball:removeHoop', function(data)
    TriggerServerEvent('rcore_basketball:takeHoop', data.hoopId)
end)