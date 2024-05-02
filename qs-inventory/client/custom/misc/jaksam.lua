if not GetResourceState('jobs_creator') == 'missing' then
    return
end

Warning('Started the compatibility module with jobs_creator')

CreateThread(function()
    local other = {}
    other.maxweight = 100000 -- Custom weight stash.
    other.slots = 50         -- Custom slots spaces.

    RegisterNetEvent('jobs_creator:stash:openStash', function(markerId)
        local stashId = 'job_stash_' .. markerId

        TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'stash', stashId, other)
        TriggerEvent(Config.InventoryPrefix .. ':client:SetCurrentStash', stashId)
    end)

    RegisterNetEvent('jobs_creator:safe:openSafe', function(markerId)
        local safeId = 'job_safe_' .. markerId

        TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'stash', safeId, other)
        TriggerEvent(Config.InventoryPrefix .. ':client:SetCurrentStash', safeId)
    end)

    RegisterNetEvent('jobs_creator:armory:openArmory', function(markerId)
        local armoryId = 'job_armory_' .. markerId

        TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'stash', armoryId, other)
        TriggerEvent(Config.InventoryPrefix .. ':client:SetCurrentStash', armoryId)
    end)

    RegisterNetEvent('jobs_creator:framework:ready', function()
        -- Disables the default script search (otherwise there would be 2 searches)
        exports['jobs_creator']:disableScriptEvent('jobs_creator:actions:search:searchPlayer')
    end)

    RegisterNetEvent('jobs_creator:actions:search:searchPlayer', function(targetServerId)
        TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'otherplayer', targetServerId)
    end)
end)
