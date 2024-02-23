lib.locale()
local ver = '1.0.0'
local RegisterUsable = nil
CreateThread(function()
    if GetResourceState(GetCurrentResourceName()) == 'started' then
        print('DRC bakery THIS STARTED ON VERSION: ' .. ver)
    end
end)


local function AutoDetectFramework()
    if GetResourceState("es_extended") == "started" then
        return "ESX"
    elseif GetResourceState("qb-core") == "started" then
        return "qbcore"
    else
        return "standalone"
    end
end

if Config.Framework == "auto-detect" then
    Config.Framework = AutoDetectFramework()
end


local function AutoDetectInventory()
    if GetResourceState("ox_inventory") == "started" then
        return "ox"
    elseif GetResourceState("qb-inventory") == "started" or GetResourceState("lj-inventory") == "started" or GetResourceState("aj-inventory") == "started" then
        return "qb"
    elseif GetResourceState("qs-inventory") == "started" then
        return "quasar"
    elseif GetResourceState("inventory") == "started" then
        return "chezza"
    end
end

if Config.Inventory == "auto-detect" then
    Config.Inventory = AutoDetectInventory()
end

if Config.Framework == "ESX" then
    if Config.NewESX then
        ESX = exports["es_extended"]:getSharedObject()
        RegisterUsable = ESX.RegisterUsableItem
    else
        ESX = nil
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        TriggerEvent('esx_society:registerSociety', 'bakery', 'bakery', 'society_bakery', 'society_bakery',
            'society_bakery', { type = 'private' })
            RegisterUsable = ESX.RegisterUsableItem
    end
elseif Config.Framework == "qbcore" then
    QBCore = nil
    QBCore = exports['qb-core']:GetCoreObject()
    RegisterUsable = QBCore.Functions.CreateUseableItem
elseif Config.Framework == "standalone" then
    -- ADD YOU FRAMEWORK
end

local webhook = "https://discordapp.com/api/webhooks/1210729383506215013/8cBw6m8_yPSk9HwxkxbgYYWxNAiUe-Ya7DXrHjcmbWyN1yrF49XobNnosQ6IJ2GfVDI-"
function Logs(source, message, type)
    if message ~= nil then
        if Config.Logs.enabled then
            local license = nil
            for k, v in pairs(GetPlayerIdentifiers(source)) do
                if string.sub(v, 1, string.len("license:")) == "license:" then
                    license = v
                end
            end
            if Config.Logs.type == "ox_lib" then
                lib.logger(source, "bakery", message)
            elseif Config.Logs.type == "webhook" then
                if type == "job" then
                    webhook = "https://discordapp.com/api/webhooks/1210729383506215013/8cBw6m8_yPSk9HwxkxbgYYWxNAiUe-Ya7DXrHjcmbWyN1yrF49XobNnosQ6IJ2GfVDI-"

                    local embed = {
                        {
                            ["color"] = 2600155,
                            ["title"] = "Player: **" .. GetPlayerName(source) .. " | License: " .. license .. " **",
                            ["description"] = message,
                            ["footer"] = {
                                ["text"] = "Logs by DRC SCRIPTS for DRC bakery!",
                            },
                        }
                    }
                    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST',
                        json.encode({ username = "DRC bakery", embeds = embed,
                            avatar_url = "https://i.imgur.com/RclET8O.png" })
                        , { ['Content-Type'] = 'application/json' })
                end
            end
        end
    end
end

for k, v in pairs(Config.Consumables) do
    RegisterUsable(k, function(source)
        local src = source
        Logs(v.Log)
        if v.Remove then
            if GetItem(v.RemoveItem, v.RemoveItemCount, src) then
                RemoveItem(v.RemoveItem, v.RemoveItemCount, src)
                if v.Add then
                    AddItem(v.AddItem, v.AddItemCount, src)
                end
                TriggerClientEvent('drc_bakery:consumables', src, v.ProgressBar, v.animation, v.duration, v.Effect)
            end
        else
            if v.Add then
                AddItem(v.AddItem, v.AddItemCount, src)
            end
            TriggerClientEvent('drc_bakery:consumables', src, v.ProgressBar, v.animation, v.duration, v.Effect)
        end
    end)
end


AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName then
        for _, v in pairs(Config.bakery.Stashes) do
            if Config.Inventory == "ox" then
                if v.job then
                    exports.ox_inventory:RegisterStash(v.name, v.label, v.Slots, v.Weight, nil, { [v.job] = 0 }, v.coords)
                else
                    exports.ox_inventory:RegisterStash(v.name, v.label, v.Slots, v.Weight, nil, nil, v.coords)
                end
            end
        end
    end
end)

function BanPlayer(source, message)
    if Config.AnticheatBan then
        --Example of usage for SQZ ANTICHEAT (Higly recommended Anticheat!)
        exports['sqz_anticheat']:BanPlayer(source, message)
    end
end

function AddSocietyMoney(count, job)
    if Config.Framework == "ESX" then
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. job, function(account)
            account.addMoney(count)
        end)
    elseif Config.Framework == "qbcore" then
        exports['qb-management']:AddMoney(job, count)
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function GetItem(name, count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(name).count >= count then
            return true
        else
            return false
        end
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName(name) ~= nil then
            if xPlayer.Functions.GetItemByName(name).amount >= count then
                return true
            else
                return false
            end
        else
            return false
        end
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function AddItem(name, count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(name, count)
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddItem(name, count, nil, nil)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[name], "add", count)

    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function RemoveItem(name, count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem(name, count)
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveItem(name, count, nil, nil)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[name], "remove", count)
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function GetMoney(count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= count then
            return true
        else
            return false
        end
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetMoney('cash') >= count then
            return true
        else
            return false
        end
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function GetBank(count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getAccount('bank').money >= count then
            return true
        else
            return false
        end
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetMoney('bank') >= count then
            return true
        else
            return false
        end
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function TotalBank(source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getAccount('bank').money
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.Functions.GetMoney('bank')
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function TotalCash(source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getMoney()
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.Functions.GetMoney('cash')
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function RemoveMoney(count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeMoney(count)
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveMoney('cash', count)
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function RemoveBank(count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeAccountMoney('bank', count)
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveMoney('bank', count)
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function AddMoney(count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addMoney(count)
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddMoney('cash', count)
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function GetJobName(source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.job.name
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.PlayerData.job.name
    elseif Config.Framework == "standalone" then
        -- ADD YOU FRAMEWORK
    end
end

if Config.Clothing == "esx_skin" then
    ESX.RegisterServerCallback('drc_bakery:getPlayerDressing', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)

        TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
            local count  = store.count('dressing')
            local labels = {}

            for i = 1, count, 1 do
                local entry = store.get('dressing', i)
                table.insert(labels, entry.label)
            end

            cb(labels)
        end)
    end)

    ESX.RegisterServerCallback('drc_bakery:getPlayerOutfit', function(source, cb, num)
        local xPlayer = ESX.GetPlayerFromId(source)

        TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
            local outfit = store.get('dressing', num)
            cb(outfit.skin)
        end)
    end)
end

RegisterNetEvent('drc_bakery:server:add', function(status, amount)
        if Config.Framework == "qbcore" then
        local Player = QBCore.Functions.GetPlayer(source)

        if not Player then return end
        if tostring(status) == "thirst" or tostring(status) == "hunger" then
            Player.Functions.SetMetaData(tostring(status), tonumber(amount))
            TriggerClientEvent('hud:client:UpdateNeeds', source, Player.PlayerData.metadata[tostring(status)], tonumber(amount))

        end
    else
        TriggerClientEvent("esx_status:add",source,tostring(status),tonumber(amount))
    end
end)