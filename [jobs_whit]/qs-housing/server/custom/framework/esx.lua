--[[
    Hi dear customer or developer, here you can fully configure your server's
    framework or you could even duplicate this file to create your own framework.

    If you do not have much experience, we recommend you download the base version
    of the framework that you use in its latest version and it will work perfectly.
]]

if Config.Framework ~= 'esx' then
    return
end

local legacyEsx = pcall(function()
    ESX = exports['es_extended']:getSharedObject()
end)
if not legacyEsx then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

identifierTypes = 'identifier'
userColumns = 'users'
accountsType = 'accounts'
skinTable = 'users'

-- Five Ward anticheat name
fiveguardresourcename = 'fiveguard'

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(id, xPlayer)
    Wait(500)
    TriggerClientEvent('housing:client:setIplData', id, iplHouses)
end)

function RegisterServerCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

function RegisterUsableItem(name, cb)
    ESX.RegisterUsableItem(name, cb)
end

function GetPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function GetIdentifier(player)
    if not player then return print('There is no player value or you use a very old esx...') end
    return player.getIdentifier('license')
end

function GetCharacterName(source)
    local xPlayer = GetPlayerFromId(source)
    local firstName, lastName
    if xPlayer.get and xPlayer.get('firstName') and xPlayer.get('lastName') then
        firstName = xPlayer.get('firstName')
        lastName = xPlayer.get('lastName')
    else
        local name = MySQL.Sync.fetchAll('SELECT `firstname`, `lastname` FROM `users` WHERE `identifier`=@identifier', { ['@identifier'] = ESX.GetIdentifier(source) })
        firstName, lastName = name[1]?.firstname or ESX.GetPlayerName(source), name[1]?.lastname or ''
    end

    return firstName, lastName
end

function GetJob(player)
    return GetPlayerFromId(player).job
end

function GetJobName(player)
    return GetPlayerFromId(player).job.name
end

function GetJobGrade(player)
    return GetPlayerFromId(player).job.grade
end

function GetPlayers()
    return ESX.GetPlayers()
end

function GetPlayerIdentifier(id)
    return ESX.GetPlayerFromIdentifier(id)
end

function GetMoney(source)
    local xPlayer = GetPlayerFromId(source)
    return xPlayer.getMoney()
end

function AddMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.addAccountMoney('money', price)
end

function RemoveMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.removeAccountMoney('money', price)
end

function GetBankMoney(source)
    local xPlayer = GetPlayerFromId(source)
    return xPlayer.getAccount('bank').money
end

function AddBankMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.addAccountMoney('bank', price)
end

function RemoveBankMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.removeAccountMoney('bank', price)
end

if Config.Inventory == 'ox_inventory' then return end

function GetItem(player, item)
    return player.getInventoryItem(item)
end

function GetItemCount(item)
    return item.count
end

function AddItem(xPlayer, item, count)
    xPlayer.addInventoryItem(item, count)
end

function RemoveItem(xPlayer, item, count)
    xPlayer.removeInventoryItem(item, count)
end
