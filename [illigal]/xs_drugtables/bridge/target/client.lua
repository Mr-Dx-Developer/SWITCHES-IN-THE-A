local targets, found = { 'qtarget', 'qb-target', 'ox_target' }, nil

for i = 1, #targets do
    if GetResourceState(targets[i]) == 'started' then
        found = true
        break
    end
end

if not found then
    print('bridge/target/client.lua: No target script found, please install the latest one of the following: ' ..
        table.concat(targets, ', '))
    return
end

function AddTargetBox(identifier, coords, width, length, data)
    exports.qtarget:AddBoxZone(identifier, coords, width, length, {
        name = identifier,
        heading = data.heading,
        debugPoly = data.debug,
        minZ = data.minZ,
        maxZ = data.maxZ,
        useZ = true,
    }, {
        options = data.options,
        job = (data.job or false),
        distance = data.distance,
    })
end

function RemoveTargetZone(id)
    exports.qtarget:RemoveZone(id)
end
