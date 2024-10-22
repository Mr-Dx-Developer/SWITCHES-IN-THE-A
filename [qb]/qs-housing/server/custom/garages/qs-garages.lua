--[[
    In this section you will find the configuration of the garage that you have selected, in
    case your system is not found here, you can ask the creator of your garage to add its exports
    in any of these files, or use these files to create your own, that would help our community!

    If you don't need a serverside in your garage, ignore this.
]]

if Config.Garage ~= 'qs-garages' then
    return
end

function addHouseGarage(source, house, garageInfo)
    TriggerClientEvent('qs-garages:addHouseGarage', -1, house, garageInfo)
end

function houseGarageConfig(source, HouseGarages)
    TriggerClientEvent('qs-garages:houseGarageConfig', -1, HouseGarages)
end

AddEventHandler('onResourceStart', function(resourceName)
    if (resourceName == Config.Garage) then
        Wait(1500)
        houseGarageConfig(source, HouseGarages)
    end
end)
