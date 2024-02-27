function setVehicleFuel(vehicle, properties)
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(vehicle, tonumber(properties.fuelLevel) + 0.0)
    else
        --custom fuel code here
    end
end

function givekey(vehicle, plate)
    -- give vehicle key here
    if GetResourceState('wasabi_carlock') == 'started' then
        exports['wasabi_carlock']:GiveKey(plate)
    elseif GetResourceState('qs-vehiclekeys') == 'started' then
        exports['qs-vehiclekeys']:GiveKeys(plate, GetEntityModel(vehicle))
    elseif GetResourceState('cd_garage') == 'started' then
        TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
    else
        --custom code here
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
    end
end

AddEventHandler('ak47_qb_housing:garage:addvehicle', function(vehicle, plate, properties)
    -- when vehicle add in garage
end)

AddEventHandler('ak47_qb_housing:garage:removevehicle', function(vehicle, plate, properties)
    -- when vehicle remove from garage
    setVehicleFuel(vehicle, properties)
    givekey(vehicle, plate)
end)