module 'shared/debug'
module 'shared/resource'

Version = resource.version(Bridge.TargetName)
Bridge.Debug('Target', Bridge.TargetName, Version)
 
local function convert(options)
    for id, v in pairs(options) do
        v.name = v.label

        if v.job then v.groups = v.job end
        
        if v.canInteract or v.gang then
            local canInteract = v.canInteract
            v.canInteract = function(entity, distance)
                if v.gang and not Framework.HasGang(v.gang, Framework.Player) then return false end
                if type(canInteract) == "function" then return canInteract(entity, distance) end
                return true
            end
        end
    end
    return options
end

Target.DisableTarget = function(state)
    exports[Bridge.TargetName]:disableTargeting(state)
end

Target.AddGlobalObject = function(options)
    exports[Bridge.TargetName]:addGlobalObject(convert(options))
end

Target.RemoveGlobalObject = function(labels)
    exports[Bridge.TargetName]:removeGlobalObject(labels)
end

Target.AddGlobalPed = function(options)
    exports[Bridge.TargetName]:addGlobalPed(convert(options))
end

Target.RemoveGlobalPed = function(labels)
    exports[Bridge.TargetName]:removeGlobalPed(labels)
end

Target.AddGlobalPlayer = function(options)
    exports[Bridge.TargetName]:addGlobalPlayer(convert(options))
end

Target.RemoveGlobalPlayer = function(labels)
    exports[Bridge.TargetName]:removeGlobalPlayer(labels)
end

Target.AddGlobalVehicle = function(options)
    exports[Bridge.TargetName]:addGlobalVehicle(convert(options))
end

Target.RemoveGlobalVehicle = function(labels)
    exports[Bridge.TargetName]:removeGlobalVehicle(labels)
end

Target.AddModel = function(models, options)
    exports[Bridge.TargetName]:addModel(models, convert(options))
end

Target.RemoveModel = function(models, labels)
    exports[Bridge.TargetName]:removeModel(models, labels)
end

Target.AddEntity = function(entities, options)
    if type(entities) ~= "table" then entities = { entities } end
    for i = 1, #entities do
        local entity = entities[i]
        if NetworkGetEntityIsNetworked(entity) then
            exports[Bridge.TargetName]:addEntity(NetworkGetNetworkIdFromEntity(entity), convert(options))
        else
            exports[Bridge.TargetName]:addLocalEntity(entity, convert(options))
        end
    end
end

Target.RemoveEntity = function(entities, labels)
    if type(entities) ~= 'table' then entities = { entities } end
    for i = 1, #entities do
        local entity = entities[i]
        if NetworkGetEntityIsNetworked(entity) then
            exports[Bridge.TargetName]:removeEntity(NetworkGetNetworkIdFromEntity(entity), labels)
        else
            exports[Bridge.TargetName]:removeLocalEntity(entity, labels)
        end
    end
end

Target.AddBone = function(bones, options)
    if type(bones) ~= 'table' then bones = { bones } end
    
    local boneName = ''
    for _, bone in pairs(bones) do
        boneName = boneName .. bone
    end

    options = convert(options)
    for _, v in pairs(options) do
        v.bones = bones
    end

    for k, v in pairs(options) do
        options[k].name = v.label .. boneName
    end
    exports[Bridge.TargetName]:addGlobalVehicle(options)
end

Target.RemoveBone = function(bones, labels)
    if type(bones) ~= 'table' then bones = { bones } end

    local boneName = ''
    for _, bone in pairs(bones) do
        boneName = boneName .. bone
    end

    if type(labels) == "string" then
        labels = labels .. boneName
    else
        for k, v in pairs(labels) do
            labels[k] = v .. boneName
        end
    end
    exports[Bridge.TargetName]:removeGlobalVehicle(labels)
end

Target.AddSphereZone = function(data)
    return exports[Bridge.TargetName]:addSphereZone({
        debug = data.debug,
        name = data.name,
        coords = data.coords,
        radius = data.radius,
        options = convert(data.options)
    })
end

Target.AddBoxZone = function(data)
    return exports[Bridge.TargetName]:addBoxZone({
        debug = data.debug,
        name = data.name,
        coords = data.coords,
        size = data.size,
        rotation = data.rotation,
        options = convert(data.options)
    })
end

Target.AddPolyZone = function(data)
    return exports[Bridge.TargetName]:addPolyZone({
        debug = data.debug,
        name = data.name,
        points = data.points,
        thickness = data.height, 
        options = convert(data.options)
    })
end

Target.RemoveZone = function(id)
    exports[Bridge.TargetName]:removeZone(id)
end