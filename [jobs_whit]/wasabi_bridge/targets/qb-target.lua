---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- If you use something other than ox_target or qb-target, use this file as template and create another lua file for it :)

local found = GetResourceState('qb-target')
local oxFound = GetResourceState('ox_target')
if found ~= 'started' and found ~= 'starting' then return end
if oxFound == 'started' or oxFound == 'starting' then return end

WSB.targetSystem = 'qb-target'

WSB.target = {}
ActiveTargets = {}

local function convertOptions(options, identifier, targetType)
    local newOptions = {}
    for _, option in ipairs(options) do
        newOptions[#newOptions + 1] = {
            name = targetType .. '_' .. identifier,
            job = option.groups or option.job or false,
            distance = option.distance,
        }
        for optionName, optionValue in pairs(option) do
            newOptions[#newOptions][optionName] = optionValue
        end
    end
    return newOptions
end

function WSB.target.addBoxZone(coords, heading, size, distance, options, compatibilityIdentifier)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end

    local identifier = compatibilityIdentifier or GenerateTargetIdentifier('boxZone', invokingResource)
    local currentOptions = convertOptions(options, identifier, 'boxZone')

    SaveTargetOptions('boxZone', invokingResource, identifier, currentOptions)

    if type(identifier) == 'number' then
        identifier = 'boxZone_' .. identifier
    end

    exports['qb-target']:AddBoxZone(identifier, coords, size.x, size.y, {
        name = identifier,
        heading = heading,
        debugPoly = false,
        minZ = coords.z - size.z,
        maxZ = coords.z + size.z,
        useZ = true,
    }, {
        options = currentOptions,
        distance = distance
    })
    return identifier
end

function WSB.target.player(data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    local identifier = GenerateTargetIdentifier('player', invokingResource)
    local currentOptions = convertOptions(data.options, identifier, 'player')
    SaveTargetOptions('player', invokingResource, identifier, currentOptions)
    exports['qb-target']:AddGlobalPlayer({ options = currentOptions, distance = data.distance })
    return 'player_' .. identifier
end

function WSB.target.vehicle(data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    local identifier = GenerateTargetIdentifier('vehicle', invokingResource)
    local currentOptions = convertOptions(data.options, identifier, 'vehicle')
    SaveTargetOptions('vehicle', invokingResource, identifier, currentOptions)
    exports['qb-target']:AddGlobalVehicle({ options = currentOptions, distance = data.distance })
    return 'vehicle_' .. identifier
end

function WSB.target.model(models, data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    local identifier = GenerateTargetIdentifier('model', invokingResource)
    local currentOptions = convertOptions(data.options, identifier, 'model')
    SaveTargetOptions('model', invokingResource, identifier, currentOptions, { models = models })
    exports['qb-target']:AddTargetModel(models, {
        distance = data.distance,
        job = data.groups or data.job or 'all',
        options = currentOptions
    })
    return 'model_' .. identifier
end

function WSB.target.bone(bones, data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    local identifier = GenerateTargetIdentifier('bone', invokingResource)
    local currentOptions = convertOptions(data.options, identifier, 'bone')
    SaveTargetOptions('bone', invokingResource, identifier, currentOptions, { bones = bones })
    exports['qb-target']:AddTargetBone(bones, {
        distance = data.distance,
        job = data.groups or data.job or 'all',
        options = currentOptions
    })
    return 'bone_' .. identifier
end

function WSB.target.removeZone(id)
    if not id then return end
    exports['qb-target']:RemoveZone(id)
end

local function resourceStopped(resource)
    for targetType, targets in pairs(ActiveTargets) do
        for resourceName, targetData in pairs(targets) do
            if resourceName == resource then
                local names = {}
                for _, target in ipairs(targetData) do
                    for _, option in ipairs(target.options) do
                        names[#names + 1] = option.label
                    end
                    if targetType == 'player' then
                        exports['qb-target']:RemoveGlobalPlayer(names)
                    elseif targetType == 'vehicle' then
                        exports['qb-target']:RemoveGlobalVehicle(names)
                    elseif targetType == 'model' then
                        exports['qb-target']:RemoveTargetModel(target.model, names)
                    elseif targetType == 'bone' then
                        exports['qb-target']:RemoveTargetBone(target.bones, names)
                    else
                        if type(target.identifier) == 'number' then
                            exports['qb-target']:RemoveZone('boxZone_' .. target.identifier)
                        else
                            exports['qb-target']:RemoveZone(target.identifier)
                        end
                    end
                end
            end
            ActiveTargets[targetType][resourceName] = nil
        end
    end
end

AddEventHandler('onResourceStop', function(resource) resourceStopped(resource) end)


-- Compatibility for older versions of Wasabi Scripts, will remove in future
function WSB.target.boxZone(identifier, coords, width, length, data)
    local options = data.options
    local z = coords.z - data.minZ + data.maxZ
    WSB.target.addBoxZone(coords, data.heading, vec3(width, length, z), nil, options, identifier)
end
