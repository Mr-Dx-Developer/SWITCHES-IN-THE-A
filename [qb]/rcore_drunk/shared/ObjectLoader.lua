local loadedObject = false
OnObjectLoadedVariable = {}

function OnObjectLoaded(cb)
    if loadedObject then
        cb()
    end
    table.insert(OnObjectLoadedVariable, cb)
end

function GetFrameworkName()
    local type = Config.FrameworkType.Active
    if type == FrameworkType.ESX then
        return Config.FrameworkType.ES_EXTENDED_NAME
    end
    if type == FrameworkType.QBCORE then
        return Config.FrameworkType.QB_CORE_NAME
    end
end

local function IsResourceOnServer(resourceName)
    if GetResourceState(resourceName) == "started" or GetResourceState(resourceName) == "starting" then
        return true
    end
    return false
end

if Config.FrameworkType.enableDetection then
    local fw = FrameworkType.CUSTOM
    if IsResourceOnServer(Config.FrameworkType.ES_EXTENDED_NAME) then
        fw = FrameworkType.ESX
    end

    if IsResourceOnServer(Config.FrameworkType.QB_CORE_NAME) then
        fw = FrameworkType.QBCORE
    end

    Config.FrameworkType.Active = fw
end

function GetSharedObject()
    local promise_ = promise:new()
    local framework_ = Config.FrameworkType.Active
    local resourceName = GetFrameworkName()

    -- Your custom
    if framework_ == FrameworkType.CUSTOM then
        loadedObject = true
        promise_:resolve({ })

        for _, fun in pairs(OnObjectLoadedVariable) do
            fun()
        end
    end

    -- ES_EXTENDED
    if framework_ == FrameworkType.ESX then
        xpcall(function()
            if ESX == nil then
                error("ESX variable is nil")
            end
            promise_:resolve(ESX)
        end, function(error)
            xpcall(function()
                promise_:resolve(exports[resourceName or 'es_extended']['getSharedObject']())
            end, function(error)
                local ESX = nil
                local tries = 10
                LoadEsx = function()
                    if tries == 0 then
                        print("Could not load any Es_extended object you need to correct the event name or change export name!")
                        return
                    end

                    tries = tries - 1

                    if ESX == nil then
                        SetTimeout(100, LoadEsx)
                    end

                    TriggerEvent(Config.FrameworkType.ESX_SHARED_OBJECT, function(obj)
                        ESX = obj
                    end)
                end

                LoadEsx()
                promise_:resolve(ESX)
            end)
        end)
    end

    -- QBCORE
    if framework_ == FrameworkType.QBCORE then
        xpcall(function()
            promise_:resolve(exports[resourceName or 'qb-core']['GetCoreObject']())
        end, function(error)
            xpcall(function()
                promise_:resolve(exports[resourceName or 'qb-core']['GetSharedObject']())
            end, function(error)

                local QBCore = nil
                local tries = 10
                LoadQBCore = function()
                    if tries == 0 then
                        print("Could not load any QB-Core object you need to correct the event name or change export name!")
                        return
                    end

                    tries = tries - 1

                    if QBCore == nil then
                        SetTimeout(100, LoadQBCore)
                    end

                    TriggerEvent(Config.FrameworkType.QBCORE_SHARED_OBJECT, function(obj)
                        QBCore = obj
                    end)
                end

                LoadQBCore()
                promise_:resolve(QBCore)
            end)
        end)
    end

    loadedObject = true
    for _, fun in pairs(OnObjectLoadedVariable) do
        fun()
    end
    return Citizen.Await(promise_)
end