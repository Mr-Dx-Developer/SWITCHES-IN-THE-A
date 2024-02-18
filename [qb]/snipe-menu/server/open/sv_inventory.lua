QS = nil
CreateThread(function()
    if Config.Inventory == "qs" and Config.Core == "ESX" then
        TriggerEvent('qs-core:getSharedObject', function(library) QS = library end)
    end
end)


RegisterServerEvent("snipe-menu:server:openInventory", function(playerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        exports.ox_inventory:forceOpenInventory(src, 'player', playerId)
    end
end)

function string.starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
end

RegisterServerEvent('snipe-menu:server:clearInventory', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["clear_inventory_used"]..GetPlayerName(otherPlayerId))
        if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
            local otherPlayer = QBCore.Functions.GetPlayer(otherPlayerId)
            otherPlayer.Functions.ClearInventory()
        elseif Config.Core == "ESX" and Config.Inventory == "qs" then
                local qPlayer = QS.GetPlayerFromId(source)
                qPlayer.ClearInventoryItems()
                -- qPlayer.ClearInventoryWeapons() -- uncomment this line if you also want to remove weapons
        elseif Config.Inventory == "ox" then
            exports.ox_inventory:ClearInventory(otherPlayerId)
        elseif Config.Inventory == "qsv2" then
            exports['qs-inventory']:ClearInventory(otherPlayerId, {})
        else
            print("Snipe-Menu: Invalid Inventory Type, please change it to either 'qb' or 'qs' or 'ox' or qsv2 in config.lua")
        end

    else
        SendLogs(src, "triggered", Config.Locales["inventory_open_event_exploit"])
    end
    
end)

function RegisterStash(jobStashName, slots, size) -- only for ox
    if Config.Inventory == "ox" then
        exports.ox_inventory:RegisterStash(jobStashName, jobStashName, slots, size, false)
    end
end

CreateCallback('snipe-menu:server:getAllItems', function(source, cb)
    if Config.Inventory == "ox" then
        cb(exports.ox_inventory:Items())
    elseif Config.Inventory == "qs" then
        cb(QS.Shared.Items)
    elseif Config.Inventory == "qsv2" then
        local items = exports["qs-inventory"]:GetItemList()
        cb(items)
    end
end)

RegisterServerEvent("snipe-menu:server:giveItem", function(playerId, giveItem, giveAmount)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
            local Player = QBCore.Functions.GetPlayer(playerId)
            local ItemInfo = QBCore.Shared.Items[giveItem]
            local type =  QBCore.Shared.Items[giveItem]["type"]
            if type == "weapon" then
                giveAmount = 1
            end
            local info = GetItemMetadataInfo(src, giveItem, QBCore.Shared.Items[giveItem]["type"])
            if Player.Functions.AddItem(giveItem, giveAmount, false, info) then
                SendLogs(src, "triggered", Config.Locales["give_item_used"]..giveAmount.."x "..ItemInfo.label.." to "..GetPlayerName(playerId))
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[giveItem], "add")
            end
        
        elseif Config.Core == "ESX" and (Config.Inventory == "qs" or Config.Inventory == "qsv2") then
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if string.starts(giveItem, "WEAPON_")  then
                local weaponLabel = ESX.GetWeaponLabel(giveItem)
                xPlayer.addWeapon(string.upper(giveItem), 250)
            else
                xPlayer.addInventoryItem(giveItem, giveAmount)
            end
            SendLogs(src, "triggered", Config.Locales["give_item_used"]..giveAmount.."x "..giveItem.." to "..GetPlayerName(playerId))
        elseif Config.Inventory == "ox" then
            local success, response = exports.ox_inventory:AddItem(playerId, giveItem, giveAmount)
            if not success then
                -- if no slots are available, the value will be "inventory_full"
                return print(response)
            end
            SendLogs(src, "triggered", Config.Locales["give_item_used"]..giveAmount.."x "..giveItem.." to "..GetPlayerName(playerId))
        else
            print("Snipe-Menu: Invalid Inventory Type, please change it to either 'qb' or 'qs' or 'ox' or qsv2 in config.lua")
        end
    else
        SendLogs(src, "exploit", Config.Locales["give_item_exploit_event"])
    end
end)

CreateCallback("snipe-menu:server:getAllStashes", function(source, cb)
    if Config.Inventory == "qb" then
        local result = MySQL.query.await('SELECT id, stash FROM stashitems')
        local returnData = {}
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = v.id,
                    name = v.stash,
                }
            end
            cb(returnData)
        else
            cb(nil)
        end
    elseif Config.Inventory == "qs" then
        local result = MySQL.query.await('SELECT id, stash FROM qs_stash')
        local returnData = {}
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = v.id,
                    name = v.stash,
                }
            end
            cb(returnData)
        else
            cb(nil)
        end
    elseif Config.Inventory == "qsv2" then
        local result = MySQL.query.await('SELECT id, stash FROM inventory_stash')
        local returnData = {}
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = v.id,
                    name = v.stash,
                }
            end
            cb(returnData)
        else
            cb(nil)
        end
    elseif Config.Inventory == "ox" then
        local result = MySQL.query.await('SELECT name FROM ox_inventory')
        local returnData = {}
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = k,
                    name = v.name,
                }
            end
            cb(returnData)
        else
            cb(nil)
        end
    else
        print("Snipe-Menu: Invalid Inventory Type, please change it to either 'qb' or 'qs' or 'ox' in config.lua")
        cb(nil)
    end
end)

