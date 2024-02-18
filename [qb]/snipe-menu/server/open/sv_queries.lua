CreateCallback("snipe-menu:server:getOfflinePlayers", function(source, cb)
    local addedLicenses = {}
    local returnData = {}
    if Config.Core == "QBCore" then
        local player = MySQL.query.await('SELECT DISTINCT license, name FROM players')
        if player ~= nil then
            for k, v in pairs(player) do
                returnData[#returnData + 1] = {
                    id = v.license,
                    name = v.name
                }
            end
        end
    elseif Config.Core == "ESX" then
        local player = MySQL.query.await('SELECT DISTINCT identifier, firstname, lastname FROM users')
        if player ~= nil then
            
            for k, v in pairs(player) do
                local extracted = v.identifier
                if string.match(v.identifier, ":") then
                    extracted = string.match(v.identifier, ":(.*)")
                end
                if not addedLicenses[extracted] then
                    returnData[#returnData + 1] = {
                        id = "license:"..extracted,
                        name = v.firstname .. " " .. v.lastname
                    }
                    addedLicenses[extracted] = true
                end
            end
        end
    end
    cb(returnData)
end)

CreateCallback("snipe-menu:server:getAllOwnedVehicles", function(source, cb)
    if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
        local result = MySQL.query.await('SELECT plate, vehicle FROM player_vehicles')
        local returnData = {}
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = v.vehicle,
                    name = v.plate,
                }
            end
            cb(returnData)
        else
            cb(nil)
        end
    elseif Config.Core == "ESX" and Config.Inventory == "qs" then
            local result = MySQL.query.await('SELECT plate FROM owned_vehicles')
            local returnData = {}
            if result ~= nil then
                for k, v in pairs(result) do
                    returnData[#returnData + 1] = {
                        id = k,
                        name = v.plate,
                    }
                end
                cb(returnData)
            else
                cb(nil)
            end
    elseif Config.Inventory == "qsv2" then
        local result = MySQL.query.await('SELECT plate FROM inventory_trunk')
        local returnData = {}
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = k,
                    name = v.plate,
                }
            end
        else
            returnData = nil
        end

        local result = MySQL.query.await('SELECT plate FROM inventory_glovebox')
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = k,
                    name = v.plate,
                }
            end
        else
            returnData = nil
        end
        cb(returnData)
        
    elseif Config.Inventory == "ox" then
        local query = 'SELECT plate FROM owned_vehicles where trunk != "NULL" OR glovebox != "NULL"'
        if Config.Core == "QBCore" then
            query = 'SELECT plate FROM player_vehicles where trunk != "NULL" OR glovebox != "NULL"'
        end
        local result = MySQL.query.await(query)
        local returnData = {}
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = k,
                    name = v.plate,
                }
            end
            cb(returnData)
        else
            cb(nil)
        end
    else
        print("Snipe-Menu: Invalid Inventory Type, please change it to either 'qb' or 'qs' or 'ox' in config.lua")
        print("Snipe-Menu: Invalid Core, please change it to either 'QBCore' or 'ESX' in config.lua")
        cb(nil)
    end
end)
