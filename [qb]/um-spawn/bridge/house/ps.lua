if not um.property.houses.status or um.property.houses.script ~= 'ps' then return end

Debug('ps-housing for house', 'debug')

lib.callback.register('getHouses', function(source)
    local citizenid = GetCitizenID(GetPlayer(source))
    local houses = MySQL.query.await('SELECT * FROM properties WHERE owner_citizenid = ? AND apartment IS NULL', { citizenid })

    local found = houses[1] ~= nil
    Debug(found and 'Houses: Found Houses' or 'Houses: Not Found')

    return found and houses or false
end)