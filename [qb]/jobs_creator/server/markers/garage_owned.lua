local function parkAllVehicles()
    if(not config.parkAllOwnedVehiclesOnRestart) then return end

    if(Framework.getFramework() == "ESX") then
        MySQL.Async.execute("UPDATE owned_vehicles SET `stored` = 1 WHERE `stored` = 0")
    elseif(Framework.getFramework() == "QB-core") then
        MySQL.Async.execute("UPDATE player_vehicles SET `state` = 1 WHERE `state` = 0")
    end
end
RegisterNetEvent(Utils.eventsPrefix .. ":framework:ready", parkAllVehicles)

local function getPlayerOwnedVehicles(playerId, cb, markerId)
    local identifier = Framework.getPlayerCharIdentifier(playerId)

    local spawnPoints = JobsCreator.Markers[markerId].data.spawnPoints

    if(Framework.getFramework() == "ESX") then
        MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE `owner`=@identifier", {
            ["@identifier"] = identifier
        }, function(results)
            cb(results, spawnPoints)
        end)
    elseif(Framework.getFramework() == "QB-core") then
        MySQL.Async.fetchAll("SELECT * FROM player_vehicles WHERE citizenid=@citizenid", {
            ["@citizenid"] = identifier
        }, function(results)
            cb(results, spawnPoints)
        end)
    end
end
RegisterServerCallback(Utils.eventsPrefix .. ":garage_owned:getVehicles", getPlayerOwnedVehicles)

local function garageOwnedUpdateVehicleProps(playerId, cb, markerId, props, plate)
    local identifier = Framework.getPlayerCharIdentifier(playerId)

    local trimmedPlate = Framework.trim(plate)

    if(Framework.getFramework() == "ESX") then
        MySQL.Async.fetchScalar("SELECT vehicle FROM owned_vehicles WHERE (plate=@plate OR plate=@trimmedPlate) AND `owner`=@identifier", {
            ["@identifier"] = identifier,
            ["@plate"] = plate,
            ["@trimmedPlate"] = trimmedPlate
        }, function(oldProps)
            if(oldProps) then
                oldProps = json.decode(oldProps)

                if(oldProps.model ~= props.model) then
                    cb(false)
                    return
                end

                MySQL.Async.execute("UPDATE owned_vehicles SET vehicle=@props, `stored`=1 WHERE (plate=@plate OR plate=@trimmedPlate) AND `owner`=@identifier", {
                    ["@props"] = json.encode(props),
                    ["@plate"] = plate,
                    ["@trimmedPlate"] = trimmedPlate,
                    ["@identifier"] = identifier,
                }, function(affectedRows)    
                    cb(affectedRows > 0)
                end)
                
            else
                cb(false)
            end
        end)
    elseif(Framework.getFramework() == "QB-core") then
        MySQL.Async.fetchScalar("SELECT mods FROM player_vehicles WHERE (plate=@plate OR plate=@trimmedPlate) AND `citizenid`=@citizenid", {
            ["@citizenid"] = identifier,
            ["@plate"] = plate,
            ["@trimmedPlate"] = trimmedPlate
        }, function(oldProps)
            if(oldProps) then
                oldProps = json.decode(oldProps)

                if(oldProps.model ~= props.model) then
                    cb(false)
                    return
                end

                MySQL.Async.execute("UPDATE player_vehicles SET mods = @props, state = 1 WHERE (plate=@plate OR plate=@trimmedPlate) AND citizenid=@citizenid", {
                    ["@props"] = json.encode(props),
                    ["@plate"] = plate,
                    ["@trimmedPlate"] = trimmedPlate,
                    ["@citizenid"] = identifier,
                }, function(affectedRows)
                    cb(affectedRows > 0)
                end)
                
            else
                cb(false)
            end
        end)
    end
end
RegisterServerCallback(Utils.eventsPrefix .. ":garage_owned:updateVehicleProps", garageOwnedUpdateVehicleProps)

local function spawnedVehicle(plate)
    local playerId = source
    local identifier = Framework.getPlayerCharIdentifier(playerId)

    if(Framework.getFramework() == "ESX") then
        MySQL.Async.execute("UPDATE owned_vehicles SET `stored`=0 WHERE plate=@plate AND `owner`=@identifier", {
            ["@plate"] = plate,
            ["@identifier"] = identifier,
        })
    elseif(Framework.getFramework() == "QB-core") then
        MySQL.Async.execute("UPDATE player_vehicles SET `state`=0 WHERE citizenid=@citizenid AND plate=@plate", {
            ["@citizenid"] = identifier,
            ["@plate"] = plate,
        })
    end
end
RegisterNetEvent(Utils.eventsPrefix .. ':garage_owned:spawnedVehicle', spawnedVehicle)