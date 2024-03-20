if GetResourceState('qbx_core') ~= 'started' then return end

Debug('qbx_core found', 'debug')

QBX = exports.qbx_core

-- Server
if IsDuplicityVersion() then

    function GetPlayer(src)
        local attempts = 10
        local delay = 1000

        local player = QBX:GetPlayer(src)
        while not player and attempts > 0 do
            Debug('Waiting for player data...')
            Wait(delay)
            player = QBX:GetPlayer(src)
            attempts = attempts - 1
        end

        if not player then
            Debug('Failed to get player data after several attempts.')
            return nil
        end

        return player
    end


    function GetCitizenID(player)
        return player.PlayerData.citizenid or Debug('Failed to get CitizenID')
    end

end

-- Client
function GetPlayerDataQB()
    return QBX:GetPlayerData() or Debug('Failed to get playerdata')
end

function GetLastLocation()
    return GetPlayerDataQB().position or Debug('Failed to get last location')
end

function GetInside()
    return GetPlayerDataQB().metadata["inside"] or nil or Debug('Failed to get inside meta')
end

function OnPlayerLoaded(bool)
    local resetInsideMeta = bool or false
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    Debug('OnPlayerLoaded')
    if resetInsideMeta then
        TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
        TriggerServerEvent('ps-housing:server:resetMetaData')
        Debug('Reset Inside Meta')
    end
end

function InsideHouseorApartments()
    local meta = GetInside()
    if meta.house ~= nil then
        local houseId = meta.house
        TriggerEvent('qb-houses:client:LastLocationHouse', houseId)
        Debug('Player Inside House | ' .. '| ' .. houseId)
    elseif meta.apartment.apartmentType ~= nil or meta.apartment.apartmentId ~= nil then
        local apartmentType = meta.apartment.apartmentType
        local apartmentId = meta.apartment.apartmentId
        Debug('Player Inside Apartment | ' .. '| ' .. apartmentType .. ' | ' .. apartmentId)
        TriggerEvent('qb-apartments:client:LastLocationHouse', apartmentType, apartmentId)
    elseif meta.property_id ~= nil then
        TriggerServerEvent('ps-housing:server:resetMetaData')
    end
end