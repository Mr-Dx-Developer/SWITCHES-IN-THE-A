local boat = {
    entity = nil,
    cfg = {}
}
local lastrob = 0
local start = false
ESX, QBCore = nil
Citizen.CreateThread(function()
    if Config['DrugBoatHeist']['framework']['name'] == 'ESX' then
        TriggerEvent(Config['DrugBoatHeist']['framework']['eventName'], function(library) 
            ESX = library 
        end)
        ESX.RegisterServerCallback('drugboatheist:server:checkPoliceCount', function(source, cb)
            local src = source
            local players = ESX.GetPlayers()
            local policeCount = 0
        
            for i = 1, #players do
                local player = ESX.GetPlayerFromId(players[i])
                if player['job']['name'] == Config['DrugBoatHeist']['setjobForPolice'] then
                    policeCount = policeCount + 1
                end
            end
        
            if policeCount >= Config['DrugBoatHeist']['requiredPoliceCount'] then
                cb({status = true})
            else
                cb({status = false})
                TriggerClientEvent('drugboatheist:client:showNotification', src, Strings['need_police'])
            end
        end)
        ESX.RegisterServerCallback('drugboatheist:server:checkTime', function(source, cb)
            local src = source
            local player = ESX.GetPlayerFromId(src)
            
            if (os.time() - lastrob) < Config['DrugBoatHeist']['nextRob'] and lastrob ~= 0 then
                local seconds = Config['DrugBoatHeist']['nextRob'] - (os.time() - lastrob)
                TriggerClientEvent('drugboatheist:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                cb({status = false})
            else
                lastrob = os.time()
                start = true
                discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' started the Drug Boat Heist!')
                cb({status = true})
            end
        end)
        ESX.RegisterServerCallback('drugboatheist:server:hasItem', function(source, cb, data)
            local src = source
            local player = ESX.GetPlayerFromId(src)
            local playerItem = player.getInventoryItem(data.itemName)
        
            if player and playerItem ~= nil then
                if playerItem.count >= 1 then
                    cb({status = true, label = playerItem.label})
                else
                    cb({status = false, label = playerItem.label})
                end
            else
                print('[rm_drugboatheist] you need add required items to server database')
            end
        end)
    elseif Config['DrugBoatHeist']['framework']['name'] == 'QB' then
        while not QBCore do
            pcall(function() QBCore =  exports[Config['DrugBoatHeist']['framework']['scriptName']]:GetCoreObject() end)
            if not QBCore then
                pcall(function() QBCore =  exports[Config['DrugBoatHeist']['framework']['scriptName']]:GetSharedObject() end)
            end
            if not QBCore then
                TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            end
            Citizen.Wait(1)
        end
        QBCore.Functions.CreateCallback('drugboatheist:server:checkPoliceCount', function(source, cb)
            local src = source
            local players = QBCore.Functions.GetPlayers()
            local policeCount = 0
        
            for i = 1, #players do
                local player = QBCore.Functions.GetPlayer(players[i])
                if player.PlayerData.job.name == Config['DrugBoatHeist']['setjobForPolice'] then
                    policeCount = policeCount + 1
                end
            end
        
            if policeCount >= Config['DrugBoatHeist']['requiredPoliceCount'] then
                cb({status = true})
            else
                cb({status = false})
                TriggerClientEvent('drugboatheist:client:showNotification', src, Strings['need_police'])
            end
        end)
        QBCore.Functions.CreateCallback('drugboatheist:server:checkTime', function(source, cb)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)
            
            if (os.time() - lastrob) < Config['DrugBoatHeist']['nextRob'] and lastrob ~= 0 then
                local seconds = Config['DrugBoatHeist']['nextRob'] - (os.time() - lastrob)
                TriggerClientEvent('drugboatheist:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                cb({status = false})
            else
                lastrob = os.time()
                start = true
                discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' started the Drug Boat Heist!')
                cb({status = true})
            end
        end)
        QBCore.Functions.CreateCallback('drugboatheist:server:hasItem', function(source, cb, data)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)
            local playerItem = player.Functions.GetItemByName(data.itemName)
            local totalWeight = QBCore.Player.GetTotalWeight(player.PlayerData.items)
            local itemInfo = QBCore.Shared.Items[data.rewardItem:lower()]
            local amount = data.rewardCount

            if player then 
                if playerItem ~= nil then
                    if playerItem.amount >= 1 then
                        if (totalWeight + (itemInfo["weight"] * amount)) <= 120000 then
                            cb({status = true, label = data.itemName})
                        else
                            cb({status = false, label = 'Not space!'})
                        end
                    end
                else
                    cb({status = false, label = data.itemName})
                end
            end
        end)
    end
end)

RegisterServerEvent('drugboatheist:server:rewardItem')
AddEventHandler('drugboatheist:server:rewardItem', function(item, count, type)
    local src = source

    if Config['DrugBoatHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        local whitelistItems = {}

        if player then
            if type == 'money' then
                local sourcePed = GetPlayerPed(src)
                local sourceCoords = GetEntityCoords(sourcePed)
                local dist = #(sourceCoords - boat['cfg']['pos'])
                if dist > 300.0 then
                    print('[rm_drugboatheist] add money exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                else
                    if Config['DrugBoatHeist']['black_money']['status'] then
                        player.addAccountMoney('black_money', count)
                    else
                        player.addMoney(count)
                    end
                end
            else
                for k, v in pairs(Config['DrugBoatHeist']['rewardItems']) do
                    whitelistItems[v['itemName']] = true
                end

                if whitelistItems[item] then
                    if count then 
                        player.addInventoryItem(item, count)
                    else
                        player.addInventoryItem(item, 1)
                    end
                else
                    print('[rm_drugboatheist] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                end
            end
        end
    elseif Config['DrugBoatHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        local whitelistItems = {}

        if player then
            if type == 'money' then
                local sourcePed = GetPlayerPed(src)
                local sourceCoords = GetEntityCoords(sourcePed)
                local dist = #(sourceCoords - boat['cfg']['pos'])
                if dist > 300.0 then
                    print('[rm_drugboatheist] add money exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                else
                    if Config['DrugBoatHeist']['black_money']['status'] then
                        player.Functions.AddItem(Config['DrugBoatHeist']['black_money']['itemName'], count)
                    else
                        player.Functions.AddMoney('cash', count)
                    end
                end
            else
                for k, v in pairs(Config['DrugBoatHeist']['rewardItems']) do
                    whitelistItems[v['itemName']] = true
                end

                if whitelistItems[item] then
                    if count then 
                        player.Functions.AddItem(item, count)
                    else
                        player.Functions.AddItem(item, 1)
                    end
                else
                    print('[rm_drugboatheist] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                end
            end
        end
    end
end)

RegisterServerEvent('drugboatheist:server:sellRewardItems')
AddEventHandler('drugboatheist:server:sellRewardItems', function()
    local src = source

    if Config['DrugBoatHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        local totalMoney = 0

        if player then
            for k, v in pairs(Config['DrugBoatHeist']['rewardItems']) do
                local playerItem = player.getInventoryItem(v['itemName'])
                if playerItem.count >= 1 then
                    player.removeInventoryItem(v['itemName'], playerItem.count)
                    if Config['DrugBoatHeist']['black_money']['status'] then
                        player.addAccountMoney('black_money', playerItem.count * v['sellPrice'])
                    else
                        player.addMoney(playerItem.count * v['sellPrice'])
                    end
                    totalMoney = totalMoney + (playerItem.count * v['sellPrice'])
                end
            end

            discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain $' .. math.floor(totalMoney) .. ' on the Drug Boat Heist Buyer!')
            TriggerClientEvent('drugboatheist:client:showNotification', src, Strings['total_money'] .. ' $' .. math.floor(totalMoney))
        end
    elseif Config['DrugBoatHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        local totalMoney = 0

        if player then
            for k, v in pairs(Config['DrugBoatHeist']['rewardItems']) do
                local playerItem = player.Functions.GetItemByName(v['itemName'])
                if playerItem ~= nil and playerItem.amount > 0 then
                    player.Functions.RemoveItem(v['itemName'], playerItem.amount)
                    if Config['DrugBoatHeist']['black_money']['status'] then
                        player.Functions.AddItem(Config['DrugBoatHeist']['black_money']['itemName'], playerItem.amount * v['sellPrice'])
                    else
                        player.Functions.AddMoney('cash', playerItem.amount * v['sellPrice'])
                    end
                    totalMoney = totalMoney + (playerItem.amount * v['sellPrice'])
                end
            end

            discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain $' .. math.floor(totalMoney) .. ' on the Drug Boat Heist Buyer!')
            TriggerClientEvent('drugboatheist:client:showNotification', src, Strings['total_money'] .. ' $' .. math.floor(totalMoney))
        end
    end
end)

RegisterCommand('pddrugboat', function(source, args)
    local src = source

    if Config['DrugBoatHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        
        if player then
            if player['job']['name'] == Config['DrugBoatHeist']['setjobForPolice'] then
                if start then
                    DeleteEntity(boat['entity'])
                    TriggerClientEvent('drugboatheist:client:resetHeist', -1)
                    start = false
                    boat = {
                        entity = nil,
                        cfg = {}
                    }
                end
            else
                TriggerClientEvent('drugboatheist:client:showNotification', src, Strings['not_cop'])
            end
        end
    elseif Config['DrugBoatHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
    
        if player then
            if player.PlayerData.job.name == Config['DrugBoatHeist']['setjobForPolice'] then
                if start then
                    DeleteEntity(boat['entity'])
                    TriggerClientEvent('drugboatheist:client:resetHeist', -1)
                    start = false
                    boat = {
                        entity = nil,
                        cfg = {}
                    }
                end
            else
                TriggerClientEvent('drugboatheist:client:showNotification', src, Strings['not_cop'])
            end
        end
    end
end)

RegisterServerEvent('drugboatheist:server:spawnBoat')
AddEventHandler('drugboatheist:server:spawnBoat', function(cfg)
    local src = source
    boat['entity'] = CreateVehicle(GetHashKey('tug'), cfg['pos'], cfg['heading'], 1, 0)
    SetVehicleNumberPlateText(boat['entity'], 'RAINMAD')
    boat['cfg'] = cfg
    FreezeEntityPosition(boat['entity'], true)
    while not DoesEntityExist(boat['entity']) do
        Citizen.Wait(1)
    end
    TriggerClientEvent('drugboatheist:client:setupBoat', src, cfg, NetworkGetNetworkIdFromEntity(boat['entity']))
    TriggerClientEvent('drugboatheist:client:mainLoop', -1, cfg, NetworkGetNetworkIdFromEntity(boat['entity']))
end)

RegisterServerEvent('drugboatheist:server:sync')
AddEventHandler('drugboatheist:server:sync', function(type, index)
    TriggerClientEvent('drugboatheist:client:sync', -1, type, index)
end)

AddEventHandler('onResourceStop', function (resource)
    if resource == GetCurrentResourceName() then
        DeleteEntity(boat['entity'])
    end
end)