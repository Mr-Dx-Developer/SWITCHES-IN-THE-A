if Config.VehicleGarages ~= "qs-garages" then
    return
end

function getVehsByPlate(source, cb, plate)
    local src = source
    MySQL.Async.fetchAll(
        "SELECT * FROM owned_vehicles WHERE TRIM(`plate`) LIKE CONCAT('%', TRIM(@plate), '%')",
        {["@plate"] = plate},
        function(results)
            veh_datastore = {}
            for key, value in ipairs(results) do
                table.insert(
                    veh_datastore,
                    {
                        ["plate"] = value["plate"],
                        ["owner"] = value["owner"],
                        ["type"] = value["type"],
                        ["model"] = json.decode(value["vehicle"]).model
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
        "SELECT plate, vehicle, stored FROM owned_vehicles WHERE `owner` = @cid",
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
