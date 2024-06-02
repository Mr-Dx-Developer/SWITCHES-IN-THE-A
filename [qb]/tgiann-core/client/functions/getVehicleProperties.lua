if config.framework == "esx" then
    tgiCore.GetVehicleProperties = myFramework.Game.GetVehicleProperties
else
    tgiCore.GetVehicleProperties = myFramework.Functions.GetVehicleProperties
end
