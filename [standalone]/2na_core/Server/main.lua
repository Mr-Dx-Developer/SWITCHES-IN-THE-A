TwoNa = {}
TwoNa.Callbacks = {}
TwoNa.Players = {}
TwoNa.Framework = nil
TwoNa.Functions = TwoNaShared.Functions
TwoNa.Types = TwoNaShared.Types
TwoNa.Vehicles = nil
TwoNa.Config = Config
TwoNa.MySQL = {
    Async = {},
    Sync = {}
}

TwoNa.RegisterServerCallback = function(name, func) 
    TwoNa.Callbacks[name] = func
end

TwoNa.TriggerCallback = function(name, source, payload, cb) 
    if not cb then 
        cb = function() end
    end

    if TwoNa.Callbacks[name] then 
        TwoNa.Callbacks[name](source, payload, cb)
    end
end

TwoNa.MySQL.Async.Fetch = function(query, variables, cb) 
    if not cb or type(cb) ~= 'function' then 
        cb = function() end
    end

    if Config.Database.Name == "MYSQL-ASYNC" then
        return exports["mysql-async"]:mysql_fetch_all(query, variables, cb) 
    elseif Config.Database.Name == "OXMYSQL" then
        return exports["oxmysql"]:prepare(query, variables, cb) 
    end
end

TwoNa.MySQL.Sync.Fetch = function(query, variables) 
    local result = {}
    local finishedQuery = false
    local cb = function(r) 
        result = r
        finishedQuery = true
    end

    if Config.Database.Name == "MYSQL-ASYNC" then
        exports["mysql-async"]:mysql_fetch_all(query, variables, cb) 
    elseif Config.Database.Name == "OXMYSQL" then
        exports["oxmysql"]:execute(query, variables, cb)
    end

    while not finishedQuery do
        Citizen.Wait(0)
    end

    return result
end

TwoNa.MySQL.Async.Execute = function(query, variables, cb) 
    if Config.Database.Name == "MYSQL-ASYNC" then
        return exports["mysql-async"]:mysql_execute(query, variables, cb) 
    elseif Config.Database.Name == "OXMYSQL" then
        return exports["oxmysql"]:update(query, variables, cb)
    end
end

TwoNa.MySQL.Sync.Execute = function(query, variables) 
    local result = {}
    local finishedQuery = false
    local cb = function(r) 
        result = r
        finishedQuery = true
    end

    if Config.Database.Name == "MYSQL-ASYNC" then
        exports["mysql-async"]:mysql_execute(query, variables, cb) 
    elseif Config.Database.Name == "OXMYSQL" then
        exports["oxmysql"]:execute(query, variables, cb)
    end

    while not finishedQuery do
        Citizen.Wait(0)
    end
    
    return result
end

TwoNa.IsPlayerAvailable = function(source) 
    local available = false

    if type(source) == 'number' then 
        if Config.Framework.Name == "ESX" then
            available = TwoNa.Framework.GetPlayerFromId(source) ~= nil
        elseif Config.Framework.Name == "QBCore" then
            available = TwoNa.Framework.Functions.GetPlayer(source) ~= nil
        end
    elseif type(source) == 'string' then
        if Config.Framework.Name == "ESX" then
            available = TwoNa.Framework.GetPlayerFromIdentifier(identifier) ~= nil
        elseif Config.Framework.Name == "QBCore" then
            available = TwoNa.Framework.Functions.GetSource(identifier) ~= nil
        end
    end

    return available
end

TwoNa.GetPlayerIdentifier = function(source)
    if TwoNa.IsPlayerAvailable(source) then
        if Config.Framework.Name == "ESX" then
            local xPlayer = TwoNa.Framework.GetPlayerFromId(source)
            return xPlayer.getIdentifier()
        elseif Config.Framework.Name == "QBCore" then
            return TwoNa.Framework.Functions.GetIdentifier(source, 'license')
        end
    else
        return nil
    end
end

TwoNa.GetCharacterIdentifier = function(source)
    if TwoNa.IsPlayerAvailable(source) then
        if Config.Framework.Name == "ESX" then
            local xPlayer = TwoNa.Framework.GetPlayerFromId(source)
            return xPlayer.identifier
        elseif Config.Framework.Name == "QBCore" then
            return TwoNa.Framework.Functions.GetPlayer(source).PlayerData.citizenid
        end
    else
        return nil
    end
end

TwoNa.CreatePlayer = function(xPlayer) 
    local player = {}

    if not xPlayer then 
        return nil
    end

    if Config.Framework.Name == "ESX" then 
        player.name = xPlayer.getName()
        player.accounts = {}
        for _,v in ipairs(xPlayer.getAccounts()) do 
            if v.name == 'bank' then 
                player.accounts["bank"] = v.money
            elseif v.name == 'money' then
                player.accounts["cash"] = v.money
            end
        end
        if xPlayer.variables.sex == 'm' then 
            player.gender = 'male' 
        else
            player.gender = 'female'
        end
        player.job = {
            name = xPlayer.getJob().name,
            label = xPlayer.getJob().label
        }
        player.birth = xPlayer.variables.dateofbirth

        player.getBank = function() 
            return xPlayer.getAccount("bank").money 
        end
        player.getMoney = xPlayer.getMoney
        player.addBank = function(amount) 
            xPlayer.addAccountMoney('bank', tonumber(amount)) 
        end
        player.addMoney = function(amount)
            xPlayer.addMoney(tonumber(amount))
        end
        player.removeBank = function(amount) 
            xPlayer.removeAccountMoney('bank', tonumber(amount)) 
        end
        player.removeMoney = function(amount) 
            xPlayer.removeMoney(tonumber(amount))
        end
    elseif Config.Framework.Name == "QBCore" then
        player.name = xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname
        player.accounts = {
            bank =  xPlayer.PlayerData.money.bank,
            cash = xPlayer.PlayerData.money.cash
        }
        if xPlayer.PlayerData.charinfo.gender == 0 then 
            player.gender = 'male'
        else
            player.gender = 'female'
        end
        player.job = {
            name = xPlayer.PlayerData.job.name,
            label = xPlayer.PlayerData.job.label
        }
        player.birth = xPlayer.PlayerData.charinfo.birthdate

        player.getBank = function() 
            return xPlayer.Functions.GetMoney("bank")
        end
        player.getMoney = function()
            return xPlayer.Functions.GetMoney("cash") 
        end
        player.addBank = function(amount)
            return xPlayer.Functions.AddMoney("bank", amount, "") 
        end
        player.addMoney = function(amount)
            return xPlayer.Functions.AddMoney("cash", amount, "") 
        end
        player.removeBank = function(amount) 
            return xPlayer.Functions.RemoveMoney("bank", amount, "")
        end
        player.removeMoney = function(amount) 
            return xPlayer.Functions.RemoveMoney("cash", amount, "")
        end
    end

    return player
end

TwoNa.GetPlayer = function(source)
    if TwoNa.IsPlayerAvailable(source) then 
        local xPlayer = nil

        if Config.Framework.Name == "ESX" then
            xPlayer = TwoNa.Framework.GetPlayerFromId(source)
        elseif Config.Framework.Name == "QBCore" then
            xPlayer = TwoNa.Framework.Functions.GetPlayer(source)
        end

        return TwoNa.CreatePlayer(xPlayer)
    else
        return nil
    end
end

TwoNa.GetPlayerFromIdentifier = function(identifier) 
    if TwoNa.IsPlayerAvailable(identifier) then 
        local xPlayer = nil

        if Config.Framework.Name == "ESX" then
            xPlayer = TwoNa.Framework.GetPlayerFromIdentifier(identifier)
        elseif Config.Framework.Name == "QBCore" then
            xPlayer = TwoNa.Framework.Functions.GetPlayer(TwoNa.Framework.Functions.GetSource(identifier))
        end

        return TwoNa.CreatePlayer(xPlayer)
    else
        return nil
    end
end

TwoNa.GetPlayerFromCharacterIdentifier = function(charIdentifier)
    local xPlayer = nil 
    if Config.Framework.Name == "ESX" then
        for _, player in ipairs(TwoNa.Framework.GetExtendedPlayers()) do 
            if player.identifier == charIdentifier then
                xPlayer = player 
                break
            end
        end
    elseif Config.Framework.Name == "QBCore" then
        for _, player in ipairs(TwoNa.Framework.Functions.GetPlayers()) do 
            player = TwoNa.Framework.Functions.GetPlayer(player)
            if player.PlayerData.citizenid == charIdentifier then 
                xPlayer = player
            end
        end

    end

    return TwoNa.CreatePlayer(xPlayer)
end 

TwoNa.GetAllVehicles = function(force)
    if TwoNa.Vehicles and not force then 
        return TwoNa.Vehicles
    end

    local vehicles = {}

    if Config.Framework.Name == "ESX" then
        local data = TwoNa.MySQL.Sync.Fetch("SELECT * FROM vehicles", {})

        for k, v in ipairs(data) do 
            vehicles[v.model] = {
                model = v.model,
                name = v.name,
                category = v.category,
                price = v.price
            }
        end
        
    elseif Config.Framework.Name == "QBCore" then 
        for k,v in pairs(TwoNa.Framework.Shared.Vehicles) do
            vehicles[k] = {
                model = k,
                name = v.name,
                category = v.category,
                price = v.price
            } 
        end
    end

    TwoNa.Vehicles = vehicles

    return vehicles
end

TwoNa.GetVehicleByName = function(name) 
    local vehicles = TwoNa.GetAllVehicles(false)
    local targetVehicle = nil

    for k,v in pairs(vehicles) do
        if v.name == name then 
            targetVehicle = v
            break
        end
    end 

    return targetVehicle
end

TwoNa.GetVehicleByHash = function(hash) 
    local vehicles = TwoNa.GetAllVehicles(false)
    local targetVehicle = nil

    for k,v in pairs(vehicles) do
        if GetHashKey(v.model) == hash then 
            targetVehicle = v
            break
        end
    end

    return targetVehicle
end

TwoNa.GetPlayerVehicles = function(source) 
    local identifier = TwoNa.GetPlayerIdentifier(source)

    if identifier then 
        local vehicles = TwoNa.GetAllVehicles(false)
        local playerVehicles = {}

        if Config.Framework.Name == "ESX" then
            local data = TwoNa.MySQL.Sync.Fetch("SELECT * FROM owned_vehicles WHERE owner = @identifier", { ["@identifier"] = identifier })

            for k,v in ipairs(data) do
                local vehicleDetails = TwoNa.GetVehicleByHash(json.decode(v.vehicle).model)

                if not vehicleDetails then 
                    vehicleDetails = {
                        name = nil,
                        model = json.decode(v.vehicle).model,
                        category = nil,
                        price = nil
                    }
                end

                table.insert(playerVehicles, {
                    name = vehicleDetails.name,
                    model = vehicleDetails.model,
                    category = vehicleDetails.category,
                    plate = v.plate,
                    fuel = v.fuel or 100,
                    price = vehicleDetails.price,
                    properties = json.decode(v.vehicle),
                    stored = v.stored,
                    garage = v.garage or nil
                })
            end
        elseif Config.Framework.Name == "QBCore"  then
            local data = TwoNa.MySQL.Sync.Fetch("SELECT * FROM player_vehicles WHERE license = @identifier", { ["@identifier"] = identifier })

            for k,v in ipairs(data) do
                if v.stored == 1 then
                    v.stored = true
                else
                    v.stored = false 
                end

                table.insert(playerVehicles, {
                    name = vehicles[v.vehicle].name,
                    model = vehicles[v.vehicle].model,
                    category = vehicles[v.vehicle].category,
                    plate = v.plate,
                    fuel = v.fuel,
                    price = vehicles[v.vehicle].price or -1,
                    properties = json.decode(v.mods),
                    stored = v.stored,
                    garage = v.garage
                })
            end
        end

        return playerVehicles
    else
        return nil
    end
end

TwoNa.UpdatePlayerVehicle = function(source, plate, vehicleData) 
    local identifier = TwoNa.GetPlayerIdentifier(source)

    if identifier then 
        local playerVehicles = TwoNa.GetPlayerVehicles(source)
        local targetVehicle = nil

        for k,v in ipairs(playerVehicles) do
             if v.plate == plate then
                targetVehicle = v 
            end
        end

        if not targetVehicle then 
            return false
        end

        local query = nil
        if Config.Framework.Name == "ESX" then
            query = "UPDATE owned_vehicles SET vehicle = @props, stored = @stored, garage = @garage WHERE owner = @identifier AND plate = @plate"
        elseif Config.Framework.Name == "QBCore" then
            query = "UPDATE player_vehicles SET mods = @props, stored = @stored, garage = @garage WHERE license = @identifier AND plate = @plate"
        end

        if query then 
            TwoNa.MySQL.Sync.Execute(query, {
            ["@props"] = json.encode(vehicleData.properties or targetVehicle.properties),
            ["@stored"] = vehicleData.stored,
            ["@garage"] = vehicleData.garage,
            ["@identifier"] = identifier,
            ["@plate"] = plate
            })

            return true
        else
            return false
        end

    else
        return false
    end
end

TwoNa.UpdateVehicleOwner = function(plate, target) 
    local identifier = TwoNa.GetPlayerIdentifier(target)

    if not identifier then 
        return false
    end

    local query = nil
    if Config.Framework.Name == "ESX" then
        query = "UPDATE owned_vehicles SET owner = @newOwner WHERE plate = @plate" 
    elseif Config.Framework.Name == "QBCore" then
        query = "UPDATE player_vehicles SET license = @newOwner WHERE plate = @plate"
    end

    if query then 
        TwoNa.MySQL.Sync.Execute(query, { ["@newOwner"] = identifier, ["@plate"] = plate })

        return true
    else
        return false
    end
end

TwoNa.RegisterUsableItem = function(name, action) 
    if Config.Framework.Name == "ESX" then 
        TwoNa.Framework.RegisterUsableItem(name, function(source)
            local xPlayer = TwoNa.Framework.GetPlayerFromId(source)
            action(TwoNa.CreatePlayer(xPlayer), source)
        end)
    elseif Config.Framework.Name == 'QBCore' then
        TwoNa.Framework.Functions.CreateUseableItem(name, function(source)
            local xPlayer = TwoNa.Framework.Functions.GetPlayer(source)
            action(TwoNa.CreatePlayer(xPlayer), source)
        end)
    end
end

TwoNa.CheckUpdate = function()
    PerformHttpRequest("https://api.github.com/repos/tunasayin/2na_core/releases/latest", function(errorCode, rawData, headers) 
        if rawData ~= nil then
            local data = json.decode(tostring(rawData))
            local version = string.gsub(data.tag_name, "v", ""):gsub("%.", "")
            local installedVersion = GetResourceMetadata(GetCurrentResourceName(), "version", 0):gsub("%.", "")

            if tonumber(installedVersion) < tonumber(version) then
                TwoNa.Functions.Log("^3An update is available! You can download the update from this link: " .. data.html_url .. "^7") 
            end
        end
    end)
end

exports("getSharedObject", function() 
    return TwoNa
end)