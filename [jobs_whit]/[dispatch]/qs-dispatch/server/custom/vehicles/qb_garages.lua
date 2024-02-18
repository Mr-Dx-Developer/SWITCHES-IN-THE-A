if Config.VehicleGarages ~= "qb_garages" then
    return
end

function getVehsByPlate(source, cb, plate)
    local src = source
    local player = GetPlayerFromId(src)
    MySQL.Async.fetchAll(
        "SELECT * FROM " .. Config.vehiclesTable .. " WHERE TRIM(`plate`) LIKE CONCAT('%', TRIM(@plate), '%')",
        {["@plate"] = plate},
        function(results)
            veh_datastore = {}
            DebugPrint(results)
            for key, value in ipairs(results) do
                table.insert(
                    veh_datastore,
                    {
                        ["plate"] = value["plate"],
                        ["owner"] = value["citizenid"],
                        ["type"] = value["type"],
                        ["model"] = value["vehicle"]
                    }
                )
            end
            cb(veh_datastore)
        end
    )
end
RegisterServerCallback("qs-dispatch:getVehsByPlate", getVehsByPlate)

function getCars(a, cb, data)
    MySQL.Async.execute(
        "SELECT plate, vehicle, stored FROM " .. Config.vehiclesTable .. " WHERE `citizenid` = @cid",
        {["@cid"] = data.identifier},
        function(results)
            local vehicles = {}
            for key, value in ipairs(results) do
                table.insert(
                    vehicles,
                    {
                        ["plate"] = value["plate"],
                        ["owner"] = value["citizenid"],
                        ["type"] = value["type"],
                        ["model"] = value["vehicle"]
                    }
                )
            end
            cb(vehicles)
        end
    )
end
RegisterServerCallback("qs-dispatch:getCars", getCars)
