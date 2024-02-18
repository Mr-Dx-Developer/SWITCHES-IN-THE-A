QBCore = exports['qb-core']:GetCoreObject()

lastRob = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
}
discord = {
    ['webhook'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['name'] = 'rm_fleecaheist',
    ['image'] = 'https://cdn.discordapp.com/avatars/869260464775921675/dea34d25f883049a798a241c8d94020c.png?size=1024'
}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

QBCore.Functions.CreateCallback('fleecaheist:server:checkPoliceCount', function(source, cb)
    local src = source
    local players = QBCore.Functions.GetPlayers()
    local policeCount = 0

    for i = 1, #players do
        local player = QBCore.Functions.GetPlayer(players[i])
        -- if player['job']['name'] == 'police' then
        if (player.PlayerData.job.name == "police" and player.PlayerData.job.onduty) then
         policeCount = policeCount + 1
        end
    end

    if policeCount >= Config['FleecaMain']['requiredPoliceCount'] then
        cb(true)
    else
        cb(false)
        --TriggerClientEvent('fleecaheist:client:showNotification', src, Strings['need_police'])
        TriggerClientEvent('QBCore:Notify', src, Strings['need_police'] , 'error', 3000)
    end
end)

QBCore.Functions.CreateCallback('fleecaheist:server:checkTime', function(source, cb, index)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    
    if (os.time() - lastRob[index]) < Config['FleecaHeist'][index]['nextRob'] and lastRob[index] ~= 0 then
        local seconds = Config['FleecaHeist'][index]['nextRob'] - (os.time() - lastRob[index])
        --TriggerClientEvent('fleecaheist:client:showNotification', src, Strings['wait_nextheist'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
        TriggerClientEvent('QBCore:Notify', src, Strings['wait_nextheist'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'] , 'error', 3000)
        cb(false)
    else
        lastRob[index] = os.time()
        discordLog(GetPlayerName(src) ..  ' - ' .. player.PlayerData.license, ' started the Fleeca Heist!')
        cb(true)
    end
end)

QBCore.Functions.CreateCallback('fleecaheist:server:hasItem', function(source, cb, item)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local playerItem = player.Functions.GetItemByName(item)

    if player and playerItem ~= nil then
        if playerItem.amount >= 1 then
            cb(true, playerItem.label)
        else
            cb(false, playerItem.label)
        end
    else
       -- print('[rm_fleecaheist] you need add required items to server database')
        TriggerClientEvent('QBCore:Notify', src, 'You missing items - bag/drill' , 'error', 5000)

    end
end)

--[[
RegisterNetEvent('fleecaheist:server:policeAlert')
AddEventHandler('fleecaheist:server:policeAlert', function(coords)
    local players = ESX.GetPlayers()
    
    for i = 1, #players do
        local player = ESX.GetPlayerFromId(players[i])
        if player['job']['name'] == 'police' then
            TriggerClientEvent('fleecaheist:client:policeAlert', players[i], coords)
        end
    end
end)
--]]

RegisterServerEvent('fleecaheist:server:rewardItem')
AddEventHandler('fleecaheist:server:rewardItem', function(reward, count)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    if player then
        if reward.item ~= nil then
            if count ~= nil then
                player.Functions.AddItem(reward.item, count)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward.item], "add")
            else
                player.Functions.AddItem(reward.item, reward.count)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward.item], "add")
            end
        else
            if count ~= nil then
                player.Functions.AddMoney("cash", count)
            else
                player.Functions.AddMoney("cash", reward.count)
            end
        end
    end
end)

RegisterServerEvent('fleecaheist:server:sellRewardItems')
AddEventHandler('fleecaheist:server:sellRewardItems', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    if player then
        local totalMoney = 0
        local rewardItems = Config['FleecaMain']['rewardItems']
        
        if player.Functions.GetItemByName(rewardItems['diamondTrolly']['item']) ~= nil then
            local diamondCount = player.Functions.GetItemByName(rewardItems['diamondTrolly']['item']).amount
        if diamondCount > 0 then
            player.Functions.RemoveItem(rewardItems['diamondTrolly']['item'], diamondCount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[rewardItems['diamondTrolly']['item']], "remove")
            player.Functions.AddMoney("cash", rewardItems['diamondTrolly']['sellPrice'] * diamondCount)
            totalMoney = totalMoney + (rewardItems['diamondTrolly']['sellPrice'] * diamondCount)
        end
    end
    if player.Functions.GetItemByName(rewardItems['goldTrolly']['item']) ~= nil then
        local goldCount = player.Functions.GetItemByName(rewardItems['goldTrolly']['item']).amount
        if goldCount > 0 then
            player.Functions.RemoveItem(rewardItems['goldTrolly']['item'], goldCount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[rewardItems['goldTrolly']['item']], "remove")
            player.Functions.AddMoney("cash", rewardItems['goldTrolly']['sellPrice'] * goldCount)
            totalMoney = totalMoney + (rewardItems['goldTrolly']['sellPrice'] * goldCount)
        end
    end

    local chance = math.random(1, 100)
    if chance < 20 then
        Player.Functions.AddItem("cryptostick", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add")
    end

        discordLog(GetPlayerName(src) ..  ' - ' .. player.PlayerData.license, ' Gain $' .. totalMoney .. ' on the Fleeca Heist Buyer!')
       -- TriggerClientEvent('fleecaheist:client:showNotification', src, Strings['total_money'] .. ' $' .. totalMoney)
        TriggerClientEvent('QBCore:Notify', src, Strings['total_money'] .. ' $' .. totalMoney, 'error', 3000)
    end
end)

RegisterServerEvent('fleecaheist:server:doorSync')
AddEventHandler('fleecaheist:server:doorSync', function(index)
    TriggerClientEvent('fleecaheist:client:doorSync', -1, index)
end)

RegisterServerEvent('fleecaheist:server:lootSync')
AddEventHandler('fleecaheist:server:lootSync', function(index, type, k)
    TriggerClientEvent('fleecaheist:client:lootSync', -1, index, type, k)
end)

RegisterServerEvent('fleecaheist:server:modelSync')
AddEventHandler('fleecaheist:server:modelSync', function(index, k, model)
    TriggerClientEvent('fleecaheist:client:modelSync', -1, index, k, model)
end)

RegisterServerEvent('fleecaheist:server:grabSync')
AddEventHandler('fleecaheist:server:grabSync', function(index, k, model)
    TriggerClientEvent('fleecaheist:client:grabSync', -1, index, k, model)
end)

RegisterServerEvent('fleecaheist:server:resetHeist')
AddEventHandler('fleecaheist:server:resetHeist', function(index)
    TriggerClientEvent('fleecaheist:client:resetHeist', -1, index)
end)

RegisterServerEvent('radialmenu:resetFleeca')
AddEventHandler('radialmenu:resetFleeca', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    
    if player then
       -- if player['job']['name'] == 'police' then
            if (player.PlayerData.job.name == "police" and player.PlayerData.job.onduty) then
            TriggerClientEvent('fleecaheist:client:nearBank', src)
            TriggerClientEvent('QBCore:Notify', src, 'Cleared the robbery scene!', 'success', 3000)
            TriggerEvent("qb-log:server:CreateLog", "heistreset", "Fleeca Reset", "red", "**"..GetPlayerName(source) .. "** used the reset on **Fleeca Bank Heist**")
        else
            --TriggerClientEvent('fleecaheist:client:showNotification', src, 'You are not cop / not on duty!')
            TriggerClientEvent('QBCore:Notify', src, 'You are not cop / not on duty', 'error', 3000)
        end
    end
end)

RegisterCommand('pdfleeca', function(source, args)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local isGod = QBCore.Functions.HasPermission(src, 'god')
    
    if player then
       -- if player['job']['name'] == 'police' then
            if (player.PlayerData.job.name == "police" and player.PlayerData.job.onduty) or isGod then
            TriggerClientEvent('fleecaheist:client:nearBank', src)
            TriggerClientEvent('QBCore:Notify', src, 'Cleared the robbery scene!', 'success', 3000)
            TriggerEvent("qb-log:server:CreateLog", "heistreset", "Fleeca Reset", "red", "**"..GetPlayerName(source) .. "** used the reset on **Fleeca Bank Heist**")
        else
            --TriggerClientEvent('fleecaheist:client:showNotification', src, 'You are not cop / not on duty!')
            TriggerClientEvent('QBCore:Notify', src, 'You are not cop / not on duty', 'error', 3000)
        end
    end
end)

function discordLog(name, message)
    local data = {
        {
            ["color"] = '3553600',
            ["title"] = "**".. name .."**",
            ["description"] = message,
        }
    }
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = data, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
end