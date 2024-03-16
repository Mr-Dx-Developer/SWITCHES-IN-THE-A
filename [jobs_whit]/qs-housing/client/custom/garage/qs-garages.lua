--[[
    In this section you will find the configuration of the garage that you have selected, in
    case your system is not found here, you can ask the creator of your garage to add its exports
    in any of these files, or use these files to create your own, that would help our community!
]]

if Config.Garage ~= 'qs-garages' then
    return
end

function setHouseGarage(closesthouse, hasKey)
    TriggerEvent('qs-garages:setHouseGarage', closesthouse, hasKey)
end
