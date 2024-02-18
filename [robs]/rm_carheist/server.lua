local cars = {entity = {}, plate = {}, lock = {}}
local lastRob = 0
ESX, QBCore = nil
Citizen.CreateThread(function()
    if Config['CarHeist']['framework']['name'] == 'ESX' then
        TriggerEvent(Config['CarHeist']['framework']['eventName'], function(library) 
            ESX = library 
        end)
        ESX.RegisterServerCallback('carheist:server:checkPoliceCount', function(source, cb)
            local src = source
            local players = ESX.GetPlayers()
            local policeCount = 0
        
            for i = 1, #players do
                local player = ESX.GetPlayerFromId(players[i])
                if player['job']['name'] == Config['CarHeist']['setjobForPolice'] then
                    policeCount = policeCount + 1
                end
            end
        
            if policeCount >= Config['CarHeist']['requiredPoliceCount'] then
                cb({status = true})
            else
                cb({status = false})
                TriggerClientEvent('carheist:client:showNotification', src, Strings['need_police'])
            end
        end)
        ESX.RegisterServerCallback('carheist:server:checkTime', function(source, cb, index)
            local src = source
            local player = ESX.GetPlayerFromId(src)
            
            if (os.time() - lastRob) < Config['CarHeist']['nextRob'] and lastRob ~= 0 then
                local seconds = Config['CarHeist']['nextRob'] - (os.time() - lastRob)
                TriggerClientEvent('carheist:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                cb({status = false})
            else
                lastRob = os.time()
                discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' started the Car Heist!')
                cb({status = true})
            end
        end)
        ESX.RegisterServerCallback('carheist:server:hasItem', function(source, cb, data)
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
                print('[rm_carheist] you need add required items to server database')
            end
        end)
    elseif Config['CarHeist']['framework']['name'] == 'QB' then
        while not QBCore do
            pcall(function() QBCore =  exports['qb-core']:GetCoreObject() end)
            if not QBCore then
                pcall(function() QBCore =  exports['qb-core']:GetSharedObject() end)
            end
            if not QBCore then
                TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            end
            Citizen.Wait(1)
        end
        QBCore.Functions.CreateCallback('carheist:server:checkPoliceCount', function(source, cb)
            local src = source
            local players = QBCore.Functions.GetPlayers()
            local policeCount = 0
        
            for i = 1, #players do
                local player = QBCore.Functions.GetPlayer(players[i])
                if player.PlayerData.job.name == Config['CarHeist']['setjobForPolice'] then
                    policeCount = policeCount + 1
                end
            end
        
            if policeCount >= Config['CarHeist']['requiredPoliceCount'] then
                cb({status = true})
            else
                cb({status = false})
                TriggerClientEvent('carheist:client:showNotification', src, Strings['need_police'])
            end
        end)
        QBCore.Functions.CreateCallback('carheist:server:checkTime', function(source, cb, index)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)

            if (os.time() - lastRob) < Config['CarHeist']['nextRob'] and lastRob ~= 0 then
                local seconds = Config['CarHeist']['nextRob'] - (os.time() - lastRob)
                TriggerClientEvent('carheist:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                cb({status = false})
            else
                lastRob = os.time()
                discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' started the Car Heist!')
                cb({status = true})
            end
        end)
        QBCore.Functions.CreateCallback('carheist:server:hasItem', function(source, cb, data)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)
            local playerItem = player.Functions.GetItemByName(data.itemName)
        
            if player then 
                if playerItem ~= nil then
                    if playerItem.amount >= 1 then
                        cb({status = true, label = data.itemName})
                    end
                else
                    cb({status = false, label = data.itemName})
                end
            end
        end)
    end
end)

RegisterServerEvent('carheist:server:removeItem')
AddEventHandler('carheist:server:removeItem', function(item)
    local src = source
    if Config['CarHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        if player then
            player.removeInventoryItem(item, 1)
        end
    elseif Config['CarHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        if player then
            player.Functions.RemoveItem(item, 1)
        end 
    end
end)

RegisterServerEvent('carheist:server:rewardItem')
AddEventHandler('carheist:server:rewardItem', function(item, count, type)
    local src = source

    if Config['CarHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        local whitelistItems = {}

        if player then
            if type == 'money' then
                local sourcePed = GetPlayerPed(src)
                local sourceCoords = GetEntityCoords(sourcePed)
                local dist = #(sourceCoords - Config['CarSetup']['main'])
                if dist > 100.0 then
                    print('[rm_carheist] add money exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                else
                    if Config['CarHeist']['black_money']['status'] then
                        player.addAccountMoney('black_money', count)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. count .. '$ on Car Heist!')
                    else
                        player.addMoney(count)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. count .. '$ on Car Heist!')
                    end
                end
            else
                for k, v in pairs(Config['CarHeist']['rewardItems']) do
                    whitelistItems[v['itemName']] = true
                end

                if whitelistItems[item] then
                    if count then 
                        player.addInventoryItem(item, count)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. item .. ' x' .. count .. ' on Car Heist!')
                    else
                        player.addInventoryItem(item, 1)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. item .. ' x' .. 1 .. ' on Car Heist!')
                    end
                else
                    print('[rm_carheist] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                end
            end
        end
    elseif Config['CarHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        local whitelistItems = {}

        if player then
            if type == 'money' then
                local sourcePed = GetPlayerPed(src)
                local sourceCoords = GetEntityCoords(sourcePed)
                local dist = #(sourceCoords - Config['CarSetup']['main'])
                if dist > 100.0 then
                    print('[rm_carheist] add money exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                else
                    if Config['CarHeist']['black_money']['status'] then
                        player.Functions.AddItem(Config['CarHeist']['black_money']['itemName'], count)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Car Heist!')
                    else
                        player.Functions.AddMoney('cash', count)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Car Heist!')
                    end
                end
            else
                for k, v in pairs(Config['CarHeist']['rewardItems']) do
                    whitelistItems[v['itemName']] = true
                end

                if whitelistItems[item] then
                    if count then 
                        player.Functions.AddItem(item, count)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. item .. ' x' .. count .. ' on Car Heist!')
                    else
                        player.Functions.AddItem(item, 1)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. item .. ' x' .. 1 .. ' on Car Heist!')
                    end
                else
                    print('[rm_carheist] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                end
            end
        end
    end
end)

RegisterServerEvent('carheist:server:sellRewardItems')
AddEventHandler('carheist:server:sellRewardItems', function(rewardCar)
    local src = source

    if Config['CarHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        local totalMoney = 0

        if player then
            for k, v in pairs(Config['CarHeist']['rewardItems']) do
                local playerItem = player.getInventoryItem(v['itemName'])
                if playerItem.count >= 1 then
                    player.removeInventoryItem(v['itemName'], playerItem.count)
                    if Config['CarHeist']['black_money']['status'] then
                        player.addAccountMoney('black_money', playerItem.count * v['sellPrice'])
                    else
                        if Config['CarHeist']['moneyItem']['status'] then
                            player.addInventoryItem(Config['CarHeist']['moneyItem']['itemName'], playerItem.count * v['sellPrice'])
                        else
                            player.addMoney(playerItem.count * v['sellPrice'])
                        end
                    end
                    totalMoney = totalMoney + (playerItem.count * v['sellPrice'])
                end
            end

            if rewardCar then
                if Config['CarHeist']['black_money']['status'] then
                    player.addAccountMoney('black_money', Config['CarSetup']['cars'][rewardCar]['sellPrice'])
                else
                    if Config['CarHeist']['moneyItem']['status'] then
                        player.addInventoryItem(Config['CarHeist']['moneyItem']['itemName'], Config['CarSetup']['cars'][rewardCar]['sellPrice'])
                    else
                        player.addMoney(Config['CarSetup']['cars'][rewardCar]['sellPrice'])
                    end
                end
                totalMoney = totalMoney + Config['CarSetup']['cars'][rewardCar]['sellPrice']
            end

            discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain $' .. math.floor(totalMoney) .. ' on the Car Heist Buyer!')
            TriggerClientEvent('carheist:client:showNotification', src, Strings['total_money'] .. ' $' .. math.floor(totalMoney))
        end
    elseif Config['CarHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        local totalMoney = 0

        if player then
            for k, v in pairs(Config['CarHeist']['rewardItems']) do
                local playerItem = player.Functions.GetItemByName(v['itemName'])
                if playerItem ~= nil and playerItem.amount > 0 then
                    player.Functions.RemoveItem(v['itemName'], playerItem.amount)
                    if Config['CarHeist']['black_money']['status'] then
                        player.Functions.AddItem(Config['CarHeist']['black_money']['itemName'], playerItem.amount * v['sellPrice'])
                    else
                        player.Functions.AddMoney('cash', playerItem.amount * v['sellPrice'])
                    end
                    totalMoney = totalMoney + (playerItem.amount * v['sellPrice'])
                end
            end

            if rewardCar then
                if Config['CarHeist']['black_money']['status'] then
                    player.Functions.AddItem(Config['CarHeist']['black_money']['itemName'], Config['CarSetup']['cars'][rewardCar]['sellPrice'])
                else
                    player.Functions.AddMoney('cash', Config['CarSetup']['cars'][rewardCar]['sellPrice'])
                end
                totalMoney = totalMoney + Config['CarSetup']['cars'][rewardCar]['sellPrice']
            end

            discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain $' .. math.floor(totalMoney) .. ' on the Car Heist Buyer!')
            TriggerClientEvent('carheist:client:showNotification', src, Strings['total_money'] .. ' $' .. math.floor(totalMoney))
        end
    end
end)

RegisterCommand('pdcarheist', function(source, args)
    local src = source

    if Config['CarHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        
        if player then
            if player['job']['name'] == Config['CarHeist']['setjobForPolice'] then
                for i = #cars['entity'], #cars['entity'] - 2, -1 do
                    DeleteEntity(cars['entity'][i])
                    cars['entity'][i] = nil
                end
                TriggerClientEvent('carheist:client:sync', -1, 'resetHeist')
            else
                TriggerClientEvent('carheist:client:showNotification', src, Strings['not_cop'])
            end
        end
    elseif Config['CarHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
    
        if player then
            if player.PlayerData.job.name == Config['CarHeist']['setjobForPolice'] then
                for i = #cars['entity'], #cars['entity'] - 2, -1 do
                    DeleteEntity(cars['entity'][i])
                    cars['entity'][i] = nil
                end
                TriggerClientEvent('carheist:client:sync', -1, 'resetHeist')
            else
                TriggerClientEvent('carheist:client:showNotification', src, Strings['not_cop'])
            end
        end
    end
end)

RegisterNetEvent('carheist:server:spawnCars')
AddEventHandler('carheist:server:spawnCars', function()
    for k, v in pairs(Config['CarSetup']['cars']) do
        cars['entity'][k] = CreateVehicle(v['model'], v['coords'], v['heading'], 1, 0)
        while not DoesEntityExist(cars['entity'][k]) do
            Wait(1)
        end
        cars['plate'][k] = GetVehicleNumberPlateText(cars['entity'][k])
        cars['lock'][k] = true
        SetVehicleBodyHealth(cars['entity'][k], 1000.0)
    end
    TriggerClientEvent('carheist:client:sync', -1, 'getServerTables', {cars, NetworkGetNetworkIdFromEntity(cars['entity'][#cars['entity']])})
end)

RegisterServerEvent('carheist:server:lockVehicle')
AddEventHandler('carheist:server:lockVehicle', function(index)
    cars['lock'][index] = not cars['lock'][index]
    TriggerClientEvent('carheist:client:sync', -1, 'getServerTables', {cars})
end)

RegisterServerEvent('carheist:server:deleteVehicle')
AddEventHandler('carheist:server:deleteVehicle', function(index)
    DeleteEntity(cars['entity'][index])
    cars['entity'][index] = nil
end)

RegisterServerEvent('carheist:server:sync')
AddEventHandler('carheist:server:sync', function(type, args)
    TriggerClientEvent('carheist:client:sync', -1, type, args)
end)

AddEventHandler('onResourceStop', function(name)
    if name == GetCurrentResourceName() then
        for k, v in pairs(cars['entity']) do
            DeleteEntity(v)
        end
    end
end)