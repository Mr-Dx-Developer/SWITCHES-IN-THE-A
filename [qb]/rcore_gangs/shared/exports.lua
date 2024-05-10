-- SHARED EXPORTS --
exports('IsPlayerBagged', function(source)
    return IsPlayerBagged(source)
end)

exports('IsPlayerRestrained', function(source)
    return IsPlayerRestrained(source)
end)

exports('IsPlayerEscorted', function(source)
    return IsPlayerEscorted(source)
end)

exports('GetZoneAtPosition', function(position)
    return GetZoneAtPosition(position)
end)

-- DEPRECATED (BACK SUPPORT ONLY)
exports('GetGangZoneAtCoords', function(position)
    return GetZoneAtPosition(position)
end)

-- SERVER EXPORTS --
if IsDuplicityVersion() then
    exports('GetPlayerGang', function(source)
        return GetPlayerGang(source)
    end)

    exports('GetGangAtZone', function(zone)
        if type(zone) == 'table' then
            if not zone.name then
                return
            end

            return GetGangAtZone(zone)
        end

        if type(zone) == 'string' then
            if not Config.GangZones[zoneName] then
                return nil
            end

            return GetGangAtZone(Config.GangZones[zoneName])
        end

        return nil
    end)

    -- DEPRECATED (BACK SUPPORT ONLY)
    exports('GetZoneOwnerGangId', function(zoneName)
        if not Config.GangZones[zoneName] then
            return nil
        end

        local zone = Config.GangZones[zoneName]
        local gang = GetGangAtZone(zone)

        return gang and gang.id or nil
    end)

    AddEventHandler('rcore_gangs:server:increase_loyalty', function(src, reason, modifier)
        if not src then
            return
        end

        local playerPed = GetPlayerPed(src)
        local playerPos = GetEntityCoords(playerPed)

        local zone = GetZoneAtPosition(playerPos)

        if zone then
            IncreaseLoyalty(src, zone, reason, modifier, Config.IncreaseMultipliers[reason])
        end
    end)

    AddEventHandler('rcore_gangs:server:decrease_loyalty', function(src, reason, modifier)
        if not src then
            return
        end

        local playerPed = GetPlayerPed(src)
        local playerPos = GetEntityCoords(playerPed)

        local zone = GetZoneAtPosition(playerPos)

        if zone then
            DecreaseLoyalty(src, zone, reason, modifier, Config.DecreaseMultipliers[reason])
        end
    end)

    -- DEPRECATED (BACK SUPPORT ONLY)
    AddEventHandler('rcore_gangs:SellDrugs', function(src)
        TriggerEvent('rcore_gangs:server:increase_loyalty', src, 'DRUGS', 1.0)
    end)

    -- DEPRECATED (BACK SUPPORT ONLY)
    AddEventHandler('rcore_gangs:IncreaseLoyalty', function(src, type, strength)
        TriggerEvent('rcore_gangs:server:increase_loyalty', src, type, 1.0)
    end)

    -- DEPRECATED (BACK SUPPORT ONLY)
    AddEventHandler('rcore_gangs:DecreaseLoyalty', function(src, type, gang)
        TriggerEvent('rcore_gangs:server:decrease_loyalty', src, type, 1.0)
    end)
end

-- CLIENT EXPORTS --
if not IsDuplicityVersion() then
    exports('GetPlayerGang', function()
        return Gang
    end)
end