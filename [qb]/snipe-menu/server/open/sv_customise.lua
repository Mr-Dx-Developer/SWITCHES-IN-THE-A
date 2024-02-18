QBCore = nil
ESX = nil
invalid = false

local bottoken = "" -- Add your bot token here
local serverid = "" -- Add your discord server id here

if Config.Core == "QBCore" then
    TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.CoreFolderName]:GetCoreObject()
    end
elseif Config.Core == "ESX" then
    local status, errorMsg = pcall(function() ESX = exports[Config.CoreFolderName]:getSharedObject() end)
    if (ESX == nil) then
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
else
    print("^1[Invalid Core] ^0You have You have not selected the right Config.Core in framework.lua ^0!")
    invalid = true
end

local function GetPlayerIdentifiersList(source, type)
    local identifiers = GetPlayerIdentifiers(source)
    for _, identifier in pairs(identifiers) do
        if string.find(identifier, type) then
            return identifier
        end
    end
    return nil
end


RegisterServerEvent("snipe-menu:server:setjob", function(playerid, job, grade)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["set_job_used"]..GetPlayerName(playerid).." "..job.." "..grade)
        if Config.Phone == "renewed" then
            local otherPlayer = QBCore.Functions.GetPlayer(playerid)
            otherPlayer.Functions.SetJob(job, grade)
            exports['qb-phone']:hireUser(job, otherPlayer.PlayerData.citizenid, grade)
        else
            if Config.Core == "QBCore" then
                local otherPlayer = QBCore.Functions.GetPlayer(playerid)
                otherPlayer.Functions.SetJob(job, grade)
            elseif Config.Core == "ESX" then
                local otherPlayer = ESX.GetPlayerFromId(playerid)
                otherPlayer.setJob(job, grade)
            end
        end
    else
        SendLogs(src, "exploit", Config.Locales["set_job_exploit_event"])
    end
end)

RegisterServerEvent("snipe-menu:server:setGang", function(playerid, gang, grade)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["set_gang_used"]..GetPlayerName(playerid).." "..gang.." "..grade)
        local otherPlayer = QBCore.Functions.GetPlayer(playerid)
        otherPlayer.Functions.SetGang(gang, grade)
    else
        SendLogs(src, "exploit", Config.Locales["set_gang_exploit_event"])
    end
end)

RegisterServerEvent("snipe-menu:server:giveMoney", function(playerid, amount, type)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["give_money_used"]..GetPlayerName(playerid).." "..amount.." "..type)
        if Config.Core == "QBCore" then
            local otherPlayer = QBCore.Functions.GetPlayer(playerid)
            otherPlayer.Functions.AddMoney(type, amount)
        elseif Config.Core == "ESX" then
            local otherPlayer = ESX.GetPlayerFromId(playerid)
            if type == "cash" then
                otherPlayer.addMoney(amount)
            else
                otherPlayer.addAccountMoney(type, amount)
            end
        end
    else
        SendLogs(src, "exploit", Config.Locales["give_money_exploit_event"])
    end
end)

RegisterServerEvent("snipe-menu:server:banPlayer", function(playerId, time, reason, timeForBan)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "bans", Config.Locales["ban_player_used"]..GetPlayerName(playerId).." reason: "..reason.. " for: "..timeForBan)
        local license = GetPlayerIdentifiersList(playerId, "license")
        local discord = GetPlayerIdentifiersList(playerId, "discord")
        local ip = GetPlayerIdentifiersList(playerId, "ip")
        time = tonumber(time)
        local totalBanTime = tonumber(os.time() + time)
        if totalBanTime > 2147483647 then
            totalBanTime = 2147483647
        end
        local timeTable = os.date('*t', totalBanTime)
        MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            GetPlayerName(playerId),
            license,
            discord,
            ip,
            reason,
            totalBanTime,
            GetPlayerName(src)
        })
        if totalBanTime >= 2147483647 then
            DropPlayer(playerId, "You have been permanently banned for "..reason.." by "..GetPlayerName(src)..". Join our discord for more information: "..Config.Discord)
        else
            DropPlayer(playerId, "You have been banned for "..reason.." by "..GetPlayerName(src)..". Your ban expires on "..timeTable['day'] .. '/' .. timeTable['month'] .. '/' .. timeTable['year'] .. ' ' .. timeTable['hour'] .. ':' .. timeTable['min']  .."Join our discord for more information: "..Config.Discord)
        end
    else
        SendLogs(src, "exploit", Config.Locales["ban_player_exploit_event"])
    end
end)


RegisterServerEvent("snipe-menu:server:banOfflinePlayer", function(license, time, reason, timeForBan, name)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "bans", Config.Locales["ban_player_used"].." offline player name: "..name.. " reason: "..reason.. " for: "..timeForBan)
        time = tonumber(time)
        local totalBanTime = tonumber(os.time() + time)
        if totalBanTime > 2147483647 then
            totalBanTime = 2147483647
        end
        local timeTable = os.date('*t', totalBanTime)
        MySQL.insert('INSERT INTO bans (name, license, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?)', {
            name,
            license,
            reason,
            totalBanTime,
            GetPlayerName(src)
        })
    else
        SendLogs(src, "exploit", Config.Locales["ban_player_exploit_event"])
    end
end)

function GetUserRoles(discordid)
    local data = nil
    local colonIndex = string.find(discordid, ":")
    discordid = string.sub(discordid, colonIndex + 1)
    PerformHttpRequest(string.format("https://discordapp.com/api/guilds/%s/members/%s", serverid, discordid), function(statusCode, response, headers)
        if statusCode == 200 then
            response = json.decode(response)
            data = response['roles']
        end
        if statusCode == 404 then
            data = false
        end
    end, 'GET', "", {["Content-Type"] = "application/json", ["Authorization"] = "Bot "..bottoken})

    while data == nil do
        Wait(0)
    end

    return data
end 

function HasPerms(source)
    while not permsLoaded do
        Wait(100)
    end
    local discordRoles = nil
    local discordid = nil
    if bottoken ~= "" and serverid ~= "" then
        discordid = GetPlayerIdentifiersList(source, "discord")
        local tries = 5
        discordRoles = GetUserRoles(discordid)
        while (not discordRoles) and tries > 0 do
            discordRoles = GetUserRoles(discordid)
            tries = tries - 1
            Wait(500)
        end
    end
    local returnValue = {false, ""}
    for k, v in pairs(perms) do
        local identifiers = GetPlayerIdentifiers(source)
        for _, id in pairs(identifiers) do
            if id == k then
                return {true, v}
            end
        end
        if Config.Core == "ESX" then
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer ~= nil then
                if xPlayer.identifier == k then
                    return {true, v}
                end
            end
        end
        if Config.Core == "QBCore" then
            local xPlayer = QBCore.Functions.GetPlayer(source)
            if xPlayer ~= nil then
                if xPlayer.PlayerData.citizenid == k then
                    return {true, v}
                end
            end
        end
        
        if discordid then
            if discordRoles and next(discordRoles) then
                for _, role in pairs(discordRoles) do
                    if role == k then
                        return {true, v}
                    end
                end
            end
        end
    end
    return returnValue
end

--[[
    If you have more items that have metadata, add them here. 
]]--
function GetItemMetadataInfo(src, item, type)
    local info = {}
    local Player = QBCore.Functions.GetPlayer(src)
    if item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif type == "weapon" then
        info.serie = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
        info.quality = 100
    elseif item == "harness" then
        info.uses = 20
    elseif item == "markedbills" then
        info.worth = math.random(5000, 10000)
    elseif item == "printerdocument" then
        info.url = "https://cdn.discordapp.com/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png"
    end
    return info
end

function ShowNotification(src, msg, type)
    if Config.Core == "QBCore" then
        TriggerClientEvent(Config.Core..':Notify', src, msg, type)
    elseif Config.Core == "ESX" then
        TriggerClientEvent('esx:showNotification', src, msg)
    end
end

local function isAdmin(src)
    return onlineAdmins[src]
end

exports('isAdmin', isAdmin)

CreateThread(function()
    Wait(2000)
    if Config.Debug then
        local badgerStarted = "^1Not Running^0"
        if GetResourceState("Badger_Discord_API") == "started" then
            badgerStarted = "^2Running^0"
        end
        print('^6-----------------------^0')
        print("^1[Snipe-Menu]^0: ^2Initialised!^0")
        print("^1[Snipe-Menu]^0: ^2Framework:^0 "..Config.Core.."")
        print("^1[Snipe-Menu]^0: ^2Phone Selected:^0 "..Config.Phone.."")
        print("^1[Snipe-Menu]^0: ^2Badger Discord Working:^0 "..badgerStarted.."")
        print("^1[Snipe-Menu]^0: ^2Fuel Script:^0 "..Config.Fuel.."")
        for k, v in pairs(onlineAdmins) do
            print("^1[Snipe-Menu]^0: ^2Admins Online^0 (Player Id:"..k.."): "..GetPlayerName(k).."")
        end
        print('^6-----------------------^0')
    end
end)
