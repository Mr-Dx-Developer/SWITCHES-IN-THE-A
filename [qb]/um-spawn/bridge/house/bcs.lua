if not um.property.houses.status or um.property.houses.script ~= 'bcs' then return end

Debug('bcs_housing for house', 'debug')

lib.callback.register('getHouses', function(source)
    local citizenid = GetCitizenID(GetPlayer(source))
    local houses = exports.bcs_housing:GetOwnedHomes(citizenid)

    local found = houses[1] ~= nil
    Debug(found and 'Houses: Found Houses' or 'Houses: Not Found')

    for i = 1, #houses do
        houses[i].label = houses[i].name
        houses[i].house = houses[i].identifier
    end
    return found and houses or false
end)