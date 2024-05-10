local QBCore = exports[Config.Core]:GetCoreObject()

function Notify(msg, type, time)
    QBCore.Functions.Notify(msg, type, time)
end

function GetVehicleName(hash)
    name = GetDisplayNameFromVehicleModel(hash)
    return name
end