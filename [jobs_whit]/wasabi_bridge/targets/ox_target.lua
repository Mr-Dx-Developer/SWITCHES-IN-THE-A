---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local found = GetResourceState('ox_target')
if found ~= 'started' and found ~= 'starting' then return end

WSB.targetSystem = 'ox_target'

WSB.target = {}
ActiveTargets = {}

local function convertOptions(options, identifier, targetType)
    local newOptions = {}
    for _, option in ipairs(options) do
        newOptions[#newOptions + 1] = {
            name = targetType .. '_' .. identifier,
            groups = option.groups or option.job or false,
            distance = option.distance,
        }
        for optionName, optionValue in pairs(option) do
            newOptions[#newOptions][optionName] = optionValue
        end
    end
    return newOptions
end

function WSB.target.addBoxZone(coords, heading, size, _distance, options, compatibilityIdentifier)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end

    local identifier
    if compatibilityIdentifier then
        exports.ox_target:addBoxZone({
            name = compatibilityIdentifier,
            coords = coords,
            size = size,
            rotation = heading,
            options = options
        })
        identifier = compatibilityIdentifier
    else
        identifier = exports.ox_target:addBoxZone({
            coords = coords,
            size = size,
            rotation = heading,
            options = options
        })
    end
    SaveTargetOptions('boxZone', invokingResource, identifier, options)

    return identifier
end

function WSB.target.player(data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    local identifier = GenerateTargetIdentifier('player', invokingResource)
    local currentOptions = convertOptions(data.options, identifier, 'player')
    SaveTargetOptions('player', invokingResource, identifier, currentOptions)
    exports.ox_target:addGlobalPlayer(currentOptions)
    return 'player_' .. identifier
end

function WSB.target.vehicle(data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    local identifier = GenerateTargetIdentifier('vehicle', invokingResource)
    local currentOptions = convertOptions(data.options, identifier, 'vehicle')
    SaveTargetOptions('vehicle', invokingResource, identifier, currentOptions)
    exports.ox_target:addGlobalVehicle(currentOptions)
    return 'vehicle_' .. identifier
end

function WSB.target.model(models, data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    local identifier = GenerateTargetIdentifier('model', invokingResource)
    local currentOptions = convertOptions(data.options, identifier, 'model')
    SaveTargetOptions('model', invokingResource, identifier, currentOptions, { models = models })
    exports.ox_target:addModel(models, currentOptions)
    return 'model_' .. identifier
end

function WSB.target.bone(bones, data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    local identifier = GenerateTargetIdentifier('bone', invokingResource)
    local currentOptions = convertOptions(data.options, identifier, 'bone')
    for _, option in ipairs(currentOptions) do
        option.bones = bones
    end
    SaveTargetOptions('bone', invokingResource, identifier, currentOptions)
    exports.ox_target:addGlobalVehicle(currentOptions)
    return 'bone_' .. identifier
end

function WSB.target.removeTarget(id)
    local targetType
    if not id then return end
    if string.sub(id, 1, 7) == 'player_' then
        targetType = 'player'
        exports.ox_target:removeGlobalPlayer(id)
        goto continue
    end
    if string.sub(id, 1, 8) == 'vehicle_' then
        targetType = 'vehicle'
        exports.ox_target:removeGlobalVehicle(id)
        goto continue
    end
    if string.sub(id, 1, 6) == 'model_' then
        targetType = 'model'
        exports.ox_target:removeModel(id)
        goto continue
    end
    if string.sub(id, 1, 5) == 'bone_' then
        targetType = 'bone'
        exports.ox_target:removeGlobalVehicle(id)
        goto continue
    end
    exports.ox_target:removeZone(id)
    :: continue ::
    if not targetType then targetType = 'boxZone' end
    RemoveActiveTarget(targetType, GetInvokingResource(), id)
end

local function resourceStopped(resource)
    for targetType, targets in pairs(ActiveTargets) do
        for resourceName, targetData in pairs(targets) do
            if resourceName == resource then
                local names = {}
                for _, target in ipairs(targetData) do
                    for _, option in ipairs(target.options) do
                        names[#names + 1] = option.name
                    end
                    if targetType == 'player' then
                        exports.ox_target:removeGlobalPlayer(names)
                    elseif targetType == 'vehicle' or targetType == 'bone' then
                        exports.ox_target:removeGlobalVehicle(names)
                    elseif targetType == 'model' then
                        exports.ox_target:removeModel(target.model, names)
                    else
                        if type(target.identifier) == 'number' then
                            exports.ox_target:removeZone('boxZone_' .. target.identifier)
                        else
                            exports.ox_target:removeZone(target.identifier)
                        end
                    end
                end
            end
            ActiveTargets[targetType][resourceName] = nil
        end
    end
end

AddEventHandler('onResourceStop', function(resource) resourceStopped(resource) end)

-- START: Compatibility for older versions of Wasabi Scripts, will remove in future --
function WSB.target.boxZone(identifier, coords, width, length, data)
    local options = data.options
    local z = coords.z - data.minZ + data.maxZ
    WSB.target.addBoxZone(coords, data.heading, vec3(width, length, z), nil, options, identifier)
end

function WSB.target.removeZone(id)
    if not id then return end
    WSB.target.removeTarget(id)
end

-- END: Compatibility for older versions of Wasabi Scripts, will remove in future --
