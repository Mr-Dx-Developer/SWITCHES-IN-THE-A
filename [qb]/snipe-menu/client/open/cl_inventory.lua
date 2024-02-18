function OpenStash(stashName, owner)
    if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
            maxweight = 1000000,
            slots = 100,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stashName)
    elseif Config.Core == "ESX" and Config.Inventory == "qs" then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
            maxweight = 1000000,
            slots = 100,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stashName)
    elseif Config.Inventory == "ox" then
        if owner ~= "" then
            exports.ox_inventory:openInventory('stash', { id = stashName, owner = owner })
        else
            exports.ox_inventory:openInventory('stash', stashName)
        end
            -- exports.ox_inventory:openInventory('stash', stashName)
    elseif Config.Inventory == "qsv2" then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
            maxweight = 1000000,
            slots = 100,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stashName)
    else
        print("Snipe-Menu: Invalid Inventory Type, please change it to either 'qb' or 'qs' or 'ox' or qsv2 in config.lua")
    end
end

function OpenTrunk(vehicle, plate)
    if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
            local vehicleClass = GetVehicleClassFromName(GetHashKey(vehicle) --[[ Hash ]])
            local other = {
                maxweight = 120000,
                slots = 50,
            }
            TriggerServerEvent("inventory:server:OpenInventory", "trunk", plate, other)
            TriggerEvent("inventory:client:SetCurrentTrunk", plate)
        
    elseif Config.Core == "ESX" and Config.Inventory == "qs" then
        local other = {
            maxweight = 120000,
            slots = 50,
        }
        TriggerServerEvent("inventory:server:OpenInventory", "trunk", plate, other)
        TriggerEvent("inventory:client:SetCurrentTrunk", plate)
    elseif Config.Inventory == "ox" then
        -- doesnt work. need to fix (panel has been manually disabled for ox users)
        exports.ox_inventory:openInventory('trunk', {id='trunk'..plate})
    elseif Config.Inventory == "qsv2" then
        local other = {
            maxweight = 120000,
            slots = 50,
        }
        TriggerServerEvent("inventory:server:OpenInventory", "trunk", plate, other)
        TriggerEvent("inventory:client:SetCurrentTrunk", plate)
    else
        print("Snipe-Menu: Invalid Inventory Type, please change it to either 'qb' or 'qs' or 'ox' or qsv2 in config.lua")
    end
    
end

function OpenGlovebox(plate)
    if hasAdminPerms then
        if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
            TriggerServerEvent("inventory:server:OpenInventory", "glovebox", plate, other)
            TriggerEvent("inventory:client:SetCurrentGlovebox", plate)
        elseif Config.Core == "ESX" and Config.Inventory == "qs" then
                TriggerServerEvent("inventory:server:OpenInventory", "glovebox", plate, other)
                TriggerEvent("inventory:client:SetCurrentGlovebox", plate)
        elseif Config.Inventory == "ox" then
                -- doesnt work. need to fix (panel has been manually disabled for ox users)
            exports.ox_inventory:openInventory('glovebox', {id='glove'..plate})
        elseif Config.Inventory == "qsv2" then
            TriggerServerEvent("inventory:server:OpenInventory", "glovebox", plate, other)
            TriggerEvent("inventory:client:SetCurrentGlovebox", plate)
        else
            print("Snipe-Menu: Invalid Inventory Type, please change it to either 'qb' or 'qs' or 'ox' or qsv2 in config.lua")
        end
    end
end

function openJobStash(data)
        if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", data.jobStashName, {
                maxweight = data.size,
                slots = data.slots,
            })
            TriggerEvent("inventory:client:SetCurrentStash", data.jobStashName)
        elseif Config.Core == "ESX" and Config.Inventory == "qs" then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", data.jobStashName, {
                maxweight = data.size,
                slots = data.slots,
            })
            TriggerEvent("inventory:client:SetCurrentStash", data.jobStashName)
        elseif Config.Inventory == "ox" then
            exports.ox_inventory:openInventory('stash', data.jobStashName)
        elseif Config.Inventory == "qsv2" then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", data.jobStashName, {
                maxweight = data.size,
                slots = data.slots,
            })
            TriggerEvent("inventory:client:SetCurrentStash", data.jobStashName)
        else
            print("Snipe-Menu: Invalid Inventory Type, please change it to either 'qb' or 'qs' or 'ox' or qsv2 in config.lua")
        end

    
end