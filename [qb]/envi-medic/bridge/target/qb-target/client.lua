module 'shared/debug'
module 'shared/resource'
module 'shared/table'

Version = resource.version(Bridge.TargetName)
Bridge.Debug('Target', Bridge.TargetName, Version)

local function convert(options)
    local distance = 7
    options = options.options

    for _, v in pairs(options) do

        distance = v.distance

        if v.items then v.item = v.items end

        if v.onSelect then
            v.action = function(entity)
                v.onSelect({ entity = entity })
            end
        end

        if not v.onSelect and v.export then
            v.action = function(entity)
                local resource, exportName = string.strsplit('.', v.export)
                exports[resource][exportName](nil, table.merge(v, { entity = entity }))
            end
        end

        if v.event then
            v.type = 'client'
        end

        if v.serverEvent then
            v.type = 'server'
            v.event = v.serverEvent
        end

        if v.command then
            v.type = 'command'
            v.event = v.command
        end
    end

    return distance, options
end

Target.DisableTarget = function(state)
    exports[Bridge.TargetName]:AllowTargeting(state)
end

Target.AddGlobalObject = function(options)
    local distance, options = convert({ options = options })
    exports[Bridge.TargetName]:AddGlobalObject({
        options = options,
        distance = distance
    })
end

Target.RemoveGlobalObject = function(labels)
    exports[Bridge.TargetName]:RemoveGlobalObject(labels)
end

Target.AddGlobalPed = function(options)
    local distance, options = convert({ options = options })
    exports[Bridge.TargetName]:AddGlobalPed({
        options = options,
        distance = distance
    })
end

Target.RemoveGlobalPed = function(labels)
    exports[Bridge.TargetName]:RemoveGlobalPed(labels)
end

Target.AddGlobalPlayer = function(options)
    local distance, options = convert({ options = options })
    exports[Bridge.TargetName]:AddGlobalPlayer({
        options = options,
        distance = distance
    })
end

Target.RemoveGlobalPlayer = function(labels)
    exports[Bridge.TargetName]:RemoveGlobalPlayer(labels)
end

Target.AddGlobalVehicle = function(options)
    local distance, options = convert({ options = options })
    exports[Bridge.TargetName]:AddGlobalVehicle({
        options = options,
        distance = distance
    })
end

Target.RemoveGlobalVehicle = function(labels)
    exports[Bridge.TargetName]:RemoveGlobalVehicle(labels)
end

Target.AddModel = function(models, options)
    local distance, options = convert({ options = options })
    exports[Bridge.TargetName]:AddTargetModel(models, {
        options = options,
        distance = distance
    })
end

Target.RemoveModel = function(models, labels)
    exports[Bridge.TargetName]:RemoveTargetModel(models, labels)
end

Target.AddEntity = function(entities, options)
    local distance, options = convert({ options = options })
    exports[Bridge.TargetName]:AddTargetEntity(entities, {
        options = options,
        distance = distance
    })
end

Target.RemoveEntity = function(entities, labels)
    exports[Bridge.TargetName]:RemoveTargetEntity(entities, labels)
end

Target.AddBone = function(bones, options)
    local distance, options = convert({ options = options })
    exports[Bridge.TargetName]:AddTargetBone(bones, {
        options = options,
        distance = distance
    })
end

Target.RemoveBone = function(bones, labels)
    exports[Bridge.TargetName]:RemoveTargetBone(bones, labels)
end

Target.AddSphereZone = function(data)
    local distance, options = convert(data)

    if not data.radius then data.radius = 2 end

    exports[Bridge.TargetName]:AddCircleZone(data.name, data.coords, data.radius,
        {
            name = data.name,
            debugPoly = data.debug,
            useZ = true,
        }, {
            options = options,
            distance = distance
        })
    return data.name
end

Target.AddBoxZone = function(data)
    local distance, options = convert(data)

    if not data.size then data.size = vector3(4, 4, 4) end
    if not data.rotation then data.rotation = 0 end

    exports[Bridge.TargetName]:AddBoxZone(data.name, data.coords, data.size.y, data.size.x,
        {
            name = data.name,
            heading = data.rotation,
            debugPoly = data.debug,
            minZ = (data.coords.z - (data.size.z / 2)),
            maxZ = (data.coords.z + (data.size.z / 2)),
        }, {
            options = options,
            distance = distance
        })
    return data.name
end

Target.AddPolyZone = function(data)
    local distance, options = convert(data)

    local points = {}
    local z = 0
    for pos, coords in ipairs(data.points) do
        points[pos] = vec2(coords.x, coords.y)
        z = z + coords.z
    end

    exports[Bridge.TargetName]:AddPolyZone(data.name, points,
        {
            name = data.name,
            debugPoly = data.debug,
            minZ = (z / #points) - (data.height / 2),
            maxZ = (z / #points) + (data.height / 2),
        }, {
            options = options,
            distance = distance
        })
    return data.name
end

Target.RemoveZone = function(id)
    exports[Bridge.TargetName]:RemoveZone(id)
end