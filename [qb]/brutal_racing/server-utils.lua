-- Buy here: (4€+VAT) https://store.brutalscripts.com
function notification(source, title, text, time, type)
    TriggerClientEvent('brutal_notify:SendAlert', source, title, text, time, type)
end

if Config.Core:upper() == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Core:upper() == 'QBCORE' then
    QBCore = exports['qb-core']:GetCoreObject()
end

function GetPlayerNameFunction(source)
    local name = ''
    if Config.SteamName then
        name = GetPlayerName(source)
    else
        local xPlayer = ESX.GetPlayerFromId(source)
        if Config.Core:upper() == 'ESX' then
            name = xPlayer.getName() or 'No Data'
        else
            name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
        end
    end

    return name
end

function RemoveMoneyFunction(source, amount)
    removed = false

    -- ESX
    if Config.Core:upper() == 'ESX' then
        xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer.getAccount('money').money >= amount then
            xPlayer.removeAccountMoney('money', amount)
            removed = true
        end

    -- QBCore
    elseif Config.Core:upper() == 'QBCORE' then
        xPlayer = QBCore.Functions.GetPlayer(source)

        if xPlayer.PlayerData.money['cash'] >= amount then
            xPlayer.Functions.RemoveMoney('cash', amount)
            removed = true
        end
    end

    return removed
end

function AddMoneyFunction(source, amount)

    -- ESX
    if Config.Core:upper() == 'ESX' then
        xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addAccountMoney('money', amount)
    -- QBCore
    elseif Config.Core:upper() == 'QBCORE' then
        xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddMoney('cash', amount)
    end
end

function StaffCheck(source)
    local staff = false

    if Config.Core:upper() == 'ESX' and Config.IdentifierPermission ~= true then
        local player = ESX.GetPlayerFromId(source)
        local playerGroup = player.getGroup()

        for i, Group in ipairs(Config.AdminGroups) do
            if playerGroup == Group then
                staff = true
                break
            end
        end
    elseif Config.Core:upper() == 'QBCORE' and Config.IdentifierPermission ~= true then
            local player = QBCore.Functions.GetPlayer(source)
            local playerGroup = player.Functions.GetPermission()
    
            for i, Group in ipairs(Config.AdminGroups) do
                if playerGroup == Group then
                    staff = true
                    break
                end
            end
    elseif Config.IdentifierPermission or Config.Core:upper() == 'STANDALONE' then
        for i, a in ipairs(Config.Admins) do
            for x, b in ipairs(GetPlayerIdentifiers(source)) do
                if string.lower(b) == string.lower(a) then
                    staff = true
                    break
                end
            end
        end
    end

    return staff
end