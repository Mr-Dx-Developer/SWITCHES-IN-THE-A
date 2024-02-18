target.debug = false --If enabled shows debug into F8 when an entity is added (framework.consoleLogging must be enabled)

-- Used by [mk_garbage] [mk_mining] [mk_vehiclekeys] [mk_mining]
target.addEntity = function(self, entity, options, distance)
    if GetResourceState('qb-target') == 'started' then 
        exports['qb-target']:AddTargetEntity(entity, {
            options = options,
            distance = distance
        })

        if target.debug then utils.logger:debug(GetInvokingResource(), 'Target option added to '..(IsEntityAVehicle(entity) and 'vehicle '..GetVehicleNumberPlateText(entity) or 'entity '..entity), {console = true}) end
    elseif GetResourceState('ox_target') == 'started' then 
        local Opt = options
        Opt.Distance = distance and distance or 3.0

        if Opt.event and Opt.type then 
            if Opt.type == 'client' then 
                Opt.type = nil
            elseif Opt.type == 'server' then 
                Opt.serverEvent = Opt.event
                Opt.type = nil
                Opt.event = nil
            end
        end

        Opt.name = Opt.name and Opt.name or Opt.label

        exports['ox_target']:addLocalEntity(entity, Opt)

        if target.debug then utils.logger:debug(GetInvokingResource(), 'Target option added to '..(IsEntityAVehicle(entity) and 'vehicle '..GetVehicleNumberPlateText(entity) or 'entity '..entity), {console = true}) end    
    else
        utils.logger:error(GetInvokingResource(), locale('no_target_resource'), {console = true})
    end
end

-- Used by [mk_garbage] [mk_mining] [mk_vehiclekeys] [mk_mining]
target.removeEntity = function(self, entity, label)
    if GetResourceState('qb-target') == 'started' then 
        exports['qb-target']:RemoveTargetEntity(entity, label)
    elseif GetResourceState('ox_target') == 'started' then 
        exports['ox_target']:removeLocalEntity(entity, label)
    else
        utils.logger:error(GetInvokingResource(), locale('no_target_resource'), {console = true})
    end
end

-- Used by [mk_garbage] [mk_mining] (disables target usage while running tasks to prevent duplicate uses)
target.disable = function(self, bool)
    if GetResourceState('ox_target') == 'started' then 
        exports['ox_target']:disableTargeting(bool)
    elseif GetResourceState('qb-target') == 'started' then 
        if bool then 
            exports['qb-target']:AllowTargeting(false)
        else
            exports['qb-target']:AllowTargeting(true)
        end
    end
end

-- Used by [mk_garbage] [mk_mining] (closes target menu when a task is ran to prevent duplicate triggers. Not all targets have this option so its not required)
target.forceClose = function(self)
    if GetResourceState('qb-target') == 'started' and GetResourceState('ox_target') ~= 'started' then 
        exports['qb-target']:DisableTarget(true)
    end
end

-- Used by [mk_garbage] [mk_mining] 
target.removeZone = function(self, zoneName)
    if GetResourceState('ox_target') == 'started' or GetResourceState('qb-target') == 'started' then 
        exports['qb-target']:RemoveZone(zoneName)
    end
end

-- Used by [mk_mining] to setup polyzones for Stone Washing
target.addPolyZone = function(self, zoneName, coords, minZ, maxZ, debugZone, options, distance)
    if GetResourceState('ox_target') == 'started' or GetResourceState('qb-target') == 'started' then 
        exports['qb-target']:AddPolyZone(zoneName, coords, {
            name = zoneName,
            minZ = minZ,
            maxZ = maxZ,
            debugPoly = debugZone,
        }, {
            options = options,
            distance = distance
        })
    end
end

-- Used by [mk_garbage] to setup Job Start zone
target.addBoxZone = function(self, zoneName, center, length, width, options, targetOptions) --garbage job
    if GetResourceState('ox_target') == 'started' or GetResourceState('qb-target') == 'started' then 
        exports['qb-target']:AddBoxZone(zoneName, center, length, width, options, targetOptions)  
    end
end

