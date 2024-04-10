module 'shared/debug'
module 'shared/resource'

include(Bridge.ZoneName, 'client')
include(Bridge.ZoneName, 'BoxZone')
include(Bridge.ZoneName, 'CircleZone')

Version = resource.version(Bridge.ZoneName)
Bridge.Debug('Zone', Bridge.ZoneName, Version)

local Zones = 0

Zone.PolyZone = function(data)
    local id = Zones + 1
    data.id = id

    local points = {}
    local z = 0
    for pos, coords in ipairs(data.points) do
        points[pos] = vec2(coords.x, coords.y)
        z = z + coords.z
    end

    if not data.height then data.height = 4 end

    local zone = PolyZone:Create(points, {
        name = Bridge.Resource .. id,
        minZ = (z / #points) - (data.height / 2),
        maxZ = (z / #points) + (data.height / 2),
        debugPoly = data.debug,
    })

    data.coords = function()
        local center = zone:getBoundingBoxCenter()
        return vec3(center.x, center.y, (z / #points))
    end

    data.distance = function()
        return #(data.coords() - GetEntityCoords(PlayerPedId()))
    end

    data.remove = function()
        zone:destroy()
    end

    data.contains = function(coord)
        return zone:isPointInside(coord)
    end

    if data.onEnter or data.onExit or data.inside then
        local inside = false
        zone:onPlayerInOut(function(isPointInside, point)
            if isPointInside and data.onEnter then
                data.onEnter(data)
            end
            if not isPointInside and data.onExit then
                data.onExit(data)
            end

            if data.inside and not inside and isPointInside then
                inside = true
                CreateThread(function()
                    while inside do
                        data.inside(data)
                        Wait(100)
                    end
                end)
            elseif data.inside and inside and not isPointInside then
                inside = false
            end
        end)
    end
    return data
end

Zone.BoxZone = function(data)
    local id = Zones + 1
    data.id = id

    if not data.size then data.size = vector3(4, 4, 4) end
    if not data.rotation then data.rotation = 0 end

    local zone = BoxZone:Create(data.coords, data.size.y, data.size.x, {
        name = Bridge.Resource .. id,
        minZ = (data.coords.z - (data.size.z / 2)),
        maxZ = (data.coords.z + (data.size.z / 2)),
        heading = data.rotation,
        debugPoly = data.debug,
    })

    data.coords = function()
        return zone:getBoundingBoxCenter()
    end

    data.distance = function()
        return #(data.coords() - GetEntityCoords(PlayerPedId()))
    end

    data.remove = function()
        zone:destroy()
    end

    data.contains = function(coord)
        return zone:isPointInside(coord)
    end

    if data.onEnter or data.onExit or data.inside then
        local inside = false
        zone:onPlayerInOut(function(isPointInside, point)
            if isPointInside and data.onEnter then
                data.onEnter(data)
            end
            if not isPointInside and data.onExit then
                data.onExit(data)
            end

            if data.inside and not inside and isPointInside then
                inside = true
                CreateThread(function()
                    while inside do
                        data.inside(data)
                        Wait(100)
                    end
                end)
            elseif data.inside and inside and not isPointInside then
                inside = false
            end
        end)
    end
    return data
end

Zone.SphereZone = function(data)
    local id = Zones + 1
    data.id = id

    if not data.radius then data.radius = 2 end

    local zone = CircleZone:Create(data.coords, data.radius, {
        name = Bridge.Resource .. id,
        useZ = true,
        debugPoly = data.debug,
    })
    
    data.coords = function()
        return zone:getBoundingBoxCenter()
    end

    data.distance = function()
        return #(data.coords() - GetEntityCoords(PlayerPedId()))
    end

    data.remove = function()
        zone:destroy()
    end

    data.contains = function(coord)
        return zone:isPointInside(coord)
    end

    if data.onEnter or data.onExit or data.inside then
        local inside = false
        zone:onPlayerInOut(function(isPointInside, point)
            if isPointInside and data.onEnter then
                data.onEnter(data)
            end
            if not isPointInside and data.onExit then
                data.onExit(data)
            end

            if data.inside and not inside and isPointInside then
                inside = true
                CreateThread(function()
                    while inside do
                        data.inside(data)
                        Wait(100)
                    end
                end)
            elseif data.inside and inside and not isPointInside then
                inside = false
            end
        end)
    end
    return data
end