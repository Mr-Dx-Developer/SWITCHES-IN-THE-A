--[[
    Here there is the QBCore replacement (will be useful only on QBCore framework)
]]

Citizen.CreateThread(function() 
    if(Framework.getFramework() ~= "QB-core") then return end
    
    RegisterNetEvent(Utils.eventsPrefix .. ":framework:ready", function() 
        exports[Utils.eventsPrefix]:disableScriptEvent(Utils.eventsPrefix .. ":stash:openStash")
        exports[Utils.eventsPrefix]:disableScriptEvent(Utils.eventsPrefix .. ":armory:openArmory")
        exports[Utils.eventsPrefix]:disableScriptEvent(Utils.eventsPrefix .. ":safe:openSafe")
        exports[Utils.eventsPrefix]:disableScriptEvent(Utils.eventsPrefix .. ":internalProgressBar")
    end)

    -- QBCore stash
    RegisterNetEvent(Utils.eventsPrefix .. ":stash:openStash", function(markerId)
        local stashId = "stash_".. markerId
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashId)
        TriggerEvent('inventory:client:SetCurrentStash', stashId)
    end)

    -- QBCore armory
    RegisterNetEvent(Utils.eventsPrefix .. ":armory:openArmory", function(markerId)
        local armoryId = "armory_".. markerId
        TriggerServerEvent("inventory:server:OpenInventory", "stash", armoryId)
        TriggerEvent('inventory:client:SetCurrentStash', armoryId)
    end)

    -- QBCore safe
    RegisterNetEvent(Utils.eventsPrefix .. ":safe:openSafe", function(markerId)
        local safeId = "safe_".. markerId
        TriggerServerEvent("inventory:server:OpenInventory", "stash", safeId)
        TriggerEvent('inventory:client:SetCurrentStash', safeId)
    end)

    -- QBCore progress bar
    RegisterNetEvent(Utils.eventsPrefix.. ":internalProgressBar", function(time, text)
        QBCore.Functions.Progressbar("jobs_creator_progressbar", text, time - 1000, false, false, {})
    end)

    -- QBCore vehicle keys
    RegisterNetEvent(Utils.eventsPrefix .. ":temporary_garage:vehicleSpawned", function(vehicle, vehicleName, vehiclePlate)
        TriggerEvent("vehiclekeys:client:SetOwner", Framework.trim(vehiclePlate))
    end)
    
    RegisterNetEvent(Utils.eventsPrefix .. ":permanent_garage:vehicleSpawned", function(vehicle, vehicleName, vehiclePlate)
        TriggerEvent("vehiclekeys:client:SetOwner", Framework.trim(vehiclePlate))
    end)
    
    RegisterNetEvent(Utils.eventsPrefix .. ":garage_owned:vehicleSpawned", function(vehicle, vehicleName, vehiclePlate)
        TriggerEvent("vehiclekeys:client:SetOwner", Framework.trim(vehiclePlate))
    end)
end)