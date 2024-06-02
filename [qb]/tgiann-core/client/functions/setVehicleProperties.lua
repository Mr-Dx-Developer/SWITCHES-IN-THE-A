if config.framework == "esx" then
    tgiCore.SetVehicleProperties = myFramework.Game.SetVehicleProperties
else
    tgiCore.SetVehicleProperties = myFramework.Functions.SetVehicleProperties
end
