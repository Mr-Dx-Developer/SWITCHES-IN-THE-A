--[[
    Hi dear customer or developer, here you can fully configure your server's
    framework or you could even duplicate this file to create your own framework.

    If you do not have much experience, we recommend you download the base version
    of the framework that you use in its latest version and it will work perfectly.
]]

if Config.Framework ~= 'qb' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()

identifierTypes = 'citizenid'
userColumns = 'players'
accountsType = 'money'
skinTable = 'playerskins'

-- Five Ward anticheat name
fiveguardresourcename = 'fiveguard'

--[[
    If you have an old version of qs-housing, you have all your houses from the SQL "player_houses"
with the column identifier the citizenID of your users, with this configuration you can automatically migrate everything to citizenID
and not need any changes in your scripts.

    You just have to start the server and restart the qs-housing, check your SQL "player_houses"
and you will see that citizenID now has the ids of your users :), once this is done you can leave it false
]]

RegisterNetEvent('QBCore:Client:OnJobUptade')
AddEventHandler('QBCore:Client:OnJobUptade', function(id, xPlayer)
    Wait(500)
    TriggerClientEvent('housing:client:setIplData', id, iplHouses)
    TriggerClientEvent('housing:client:OnJobUpdateBlips')
end)

function RegisterServerCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function RegisterUsableItem(name, cb)
    QBCore.Functions.CreateUseableItem(name, cb)
end

function GetPlayerFromId(player)
    local Player = QBCore.Functions.GetPlayer(player)
    if Player then
        Player.citizenid = Player.PlayerData.citizenid
        Player.identifier = Player.PlayerData.citizenid
        Player.source = Player.PlayerData.source
    end
    return Player
end

function GetIdentifier(player)
    return QBCore.Functions.GetPlayerByCitizenId(player)
end

function GetCharacterName(source)
    local player = GetPlayerFromId(source).PlayerData.charinfo
    return player.firstname, player.lastname
end

function GetJob(player)
    return GetPlayerFromId(player).PlayerData.job
end

function GetJobName(player)
    return GetPlayerFromId(player).PlayerData.job.name
end

function GetJobGrade(player)
    return GetPlayerFromId(player).PlayerData.job.grade.level
end

function GetPlayers()
    return QBCore.Functions.GetPlayers()
end

function GetPlayerIdentifier(id)
    local player = QBCore.Functions.GetPlayerByCitizenId(id)
    if player then
        player.source = player.PlayerData.source
    end
    return player
end

function GetMoney(source)
    local xPlayer = GetPlayerFromId(source)
    return xPlayer.PlayerData.money['cash']
end

function AddMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.Functions.AddMoney('cash', price)
end

function RemoveMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.Functions.RemoveMoney('cash', price)
end

function GetBankMoney(source)
    local xPlayer = GetPlayerFromId(source)
    return xPlayer.PlayerData.money['bank']
end

function AddBankMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.Functions.AddMoney('bank', price)
end

function RemoveBankMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.Functions.RemoveMoney('bank', price)
end

if Config.Inventory == 'ox_inventory' then return end

function GetItem(player, item)
    return player.Functions.GetItemByName(item)
end

function GetItemCount(item)
    return item.amount
end

function AddItem(xPlayer, item, count)
    xPlayer.Functions.AddItem(item, count)
end

function RemoveItem(xPlayer, item, count)
    xPlayer.Functions.RemoveItem(item, count)
end
