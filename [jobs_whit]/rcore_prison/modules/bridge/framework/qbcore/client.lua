local clothing = {
    state = nil,
    data = {}
}

-- Note: No idea how to fix it (now)
-- Some-how throwing issues when not defined when player unloaded / loaded

DeletePeds = function() end
SpawnPeds = function() end

CreateThread(function()
    if Prison.Framework == nil or Prison.Framework == 2 or Prison.Framework == 0 then
        if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
            Prison.Framework = 2
        end
    end

    Wait(0)

    if Prison.Framework == 2 then
        if Prison.FrameworkTriggers['resourceNameClothing'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['resourceNameClothing'])) == 'qbcore' then
            Prison.FrameworkTriggers['resourceNameClothing'] = 'qb-clothing'
        end

        if Prison.FrameworkTriggers['playerUnloadedClient'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['playerUnloadedClient'])) == 'qbcore' then
            Prison.FrameworkTriggers['playerUnloadedClient'] = 'QBCore:Client:OnPlayerUnload'
        end

        if Prison.FrameworkTriggers['playerLoadedClient'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['playerLoadedClient'])) == 'qbcore' then
            Prison.FrameworkTriggers['playerLoadedClient'] = 'QBCore:Client:OnPlayerLoaded'
        end

        if Prison.FrameworkTriggers.resourceName == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['resourceNameClothing'])) == 'qbcore' then
            Prison.FrameworkTriggers.resourceName = 'qb-core'
        end


        AddEventHandler(Prison.FrameworkTriggers.playerUnloadedClient, function()
            if clothing and clothing.state then
                -- clothing = nil
            end
        end)

        AddEventHandler(Prison.FrameworkTriggers.playerLoadedClient, function()
            local ped = PlayerPedId()
            local time = GetGameTimer()

            while (not HasCollisionLoadedAroundEntity(ped) and (GetGameTimer() - time) < 5000) do
                Wait(0)
            end

            SetTimeout(1000, function()
                TriggerServerEvent('rcore_prison:requestInternalLoad')
            end)

            if clothing and clothing.state == 'relog' then
                SetTimeout(2000, function()
                    Bridge.SetOutfit(clothing.state, clothing.data)
                end)
            end
        end)
    end
end)
