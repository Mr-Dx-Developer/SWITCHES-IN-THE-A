module 'shared/debug'
module 'shared/resource'

include(Bridge.ZoneName, 'init')

Version = resource.version(Bridge.ZoneName)
Bridge.Debug('Zone', Bridge.ZoneName, Version)

Zone.PolyZone = function(data)
    ---@cast data table
    local zone = lib.zones.poly({
        debug = data.debug,
        points = data.points,
        thickness = data.height
    })

    data.id = zone.id

    data.coords = function()
        return zone.coords
    end

    data.distance = function()
        return zone.distance
    end

    data.remove = function()
        zone:remove()
    end

    data.contains = function(coord)
        return zone:contains(coord)
    end

    if data.onEnter then
        zone.onEnter = function()
            data.onEnter(data)
        end
    end

    if data.onExit then
        zone.onExit = function()
            data.onExit(data)
        end
    end

    if data.inside then
        zone.inside = function()
            data.inside(data)
        end
    end
    
    return data
end

Zone.BoxZone = function(data)
    ---@cast data table
    local zone = lib.zones.box({
        debug = data.debug,
        coords = data.coords,
        size = data.size,
        rotation = data.rotation
    })

    data.id = zone.id

    data.coords = function()
        return zone.coords
    end

    data.distance = function()
        return zone.distance
    end

    data.remove = function()
        zone:remove()
    end

    data.contains = function(coord)
        return zone:contains(coord)
    end

    if data.onEnter then
        zone.onEnter = function()
            data.onEnter(data)
        end
    end

    if data.onExit then
        zone.onExit = function()
            data.onExit(data)
        end
    end

    if data.inside then
        zone.inside = function()
            data.inside(data)
        end
    end
    
    ---@cast data table
    return data
end

Zone.SphereZone = function(data)
    ---@cast data table
    local zone = lib.zones.sphere({
        debug = data.debug,
        coords = data.coords,
        radius = data.radius
    })

    data.id = zone.id

    data.coords = function()
        return zone.coords
    end

    data.distance = function()
        return zone.distance
    end

    data.remove = function()
        zone:remove()
    end

    data.contains = function(coord)
        return zone:contains(coord)
    end

    if data.onEnter then
        zone.onEnter = function()
            data.onEnter(data)
        end
    end

    if data.onExit then
        zone.onExit = function()
            data.onExit(data)
        end
    end

    if data.inside then
        zone.inside = function()
            data.inside(data)
        end
    end

    return data
end
