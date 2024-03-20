local function setPlayerPosition(coords)
    local ped = cache.ped
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.w or coords.a or coords.h or GetEntityHeading(cache.ped))
    FreezeEntityPosition(ped, false)
end

local function destroyCamera()
    DestroyStableCam(true)
    DestroyCoordsCam(true)
end

local function setPlace(data)
    local placeType = data.place
    if placeType == 'lastloc' then
        setPlayerPosition(GetLastLocation())
        OnPlayerLoaded()
        InsideHouseorApartments()
    elseif placeType == 'coords' then
        setPlayerPosition(GetEntityCoords(cache.ped))
        OnPlayerLoaded(true)
    elseif placeType == 'properties' then
        OnPlayerLoaded()
        if data.id ~= nil then
            TriggerServerEvent('ps-housing:server:enterProperty', tostring(data.type))
            TriggerEvent("qb-apartments:client:LastLocationHouse", data.type, data.id)
            Debug('Apartments: | Properties Name: '.. data.id .. ' | | ' .. 'Properties Type:' ..data.type)
        else
            TriggerEvent('Housing:enterHome', data.type)
            TriggerServerEvent('ps-housing:server:enterProperty', tostring(data.type))
            TriggerEvent("qb-houses:client:LastLocationHouse", data.type)
            Debug('Houses: | Properties Name: '.. data.type)
        end
        Wait(500)
    elseif placeType == 'bookmarks' then
        setPlayerPosition(data.coords)
        OnPlayerLoaded(true)
    elseif placeType == 'rentApartment' then
        OnPlayerLoaded()
        TriggerServerEvent("ps-housing:server:createNewApartment", data.label)
        TriggerServerEvent("apartments:server:CreateApartment", data.type, data.label)
        Debug('Rent Apartment: ' ..data.type)
    end
end

RegisterNUICallback('spawn', function(data, cb)
    local place = data.place
    CloseNui(place)
    DoScreenFadeOut(250)
    Wait(500)
    destroyCamera()
    setPlace(data)
    Debug('Location: ' ..place.. ' Spawned')
    Wait(500)
    DoScreenFadeIn(1000)
    um.hud(false)
    if place ~= 'properties' and place ~= 'rentApartment' then
        MoveToPlayerFromSky()
    end
    cb(1 or 'ok')
end)