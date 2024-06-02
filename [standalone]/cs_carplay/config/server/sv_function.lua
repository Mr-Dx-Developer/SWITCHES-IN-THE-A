if CodeStudio.ServerType == "QB" then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif CodeStudio.ServerType == "ESX" then 
    ESX = exports['es_extended']:getSharedObject()
end


if CodeStudio.Main.UseWithItem.Enable then 
    if CodeStudio.ServerType == 'ESX' then
        ESX.RegisterUsableItem(CodeStudio.Main.UseWithItem.Item, function(source)
            TriggerClientEvent('cs:carPlay:openUI', source)
        end)
    elseif CodeStudio.ServerType == 'QB' then
        QBCore.Functions.CreateUseableItem(CodeStudio.Main.UseWithItem.Item, function(source)
            TriggerClientEvent('cs:carPlay:openUI', source)
        end)
    end
end


-- This function will check for owned vehicles --

function checkOwnedVehicle(plate, callback)
    local tableName = CodeStudio.Main.RadioInstall.Options.Vehicles_Table
    local query = 'SELECT * FROM ' .. tableName .. ' WHERE plate = ? LIMIT 1'
    
    MySQL.Async.fetchAll(query, { plate }, function(result)
        if result and #result > 0 then
            callback(true)
        else
            callback(false)
        end
    end)
end



-- Get Player Name + Identifier [For Playlist Feature]---


function GetIdentifier(source, idtype)
    local identifiers = GetPlayerIdentifiers(source)
    for _, identifier in pairs(identifiers) do
        if string.find(identifier, idtype) then
            return identifier
        end
    end
    return nil
end

function GetPlayerData(src)
    if CodeStudio.ServerType == 'QB' then
        local Player = QBCore.Functions.GetPlayer(src)
        local pData = {
            ident = Player.PlayerData.citizenid,
            name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
        }
        return pData
    elseif CodeStudio.ServerType == 'ESX' then
        local Player = ESX.GetPlayerFromId(src)
        local pData = {
            ident = Player.identifier,
            name = Player.getName()
        }
        return pData
    else
        --Standlone [You can Edit this accoirdingly] --

        local identifier = GetIdentifier(src, 'license')
        local pData = {
            ident = identifier,
            name = GetPlayerName(src)
        }
        return pData
    end
end

function GetPlayer_Job(src)
    if CodeStudio.ServerType == 'QB' then
        local Player = QBCore.Functions.GetPlayer(src)
        local job = Player.PlayerData.job.name
        return job
    elseif CodeStudio.ServerType == 'ESX' then
        local Player = ESX.GetPlayerFromId(src)
        local job = Player.job.name
        return job
    else
        --Standlone [You can Edit this accoirdingly] --
        return false
    end
end


-- Radio Installer Item --


-- If you are using a standalone, use events to achieve the same functionality --

if CodeStudio.Main.RadioInstall.Options.RadioItem then
    if CodeStudio.ServerType == 'ESX' then
        ESX.RegisterUsableItem(CodeStudio.Main.RadioInstall.Options.RadioInstallerItem, function(source)
            TriggerClientEvent('cs:carPlay:installRadio', source)
        end)
    elseif CodeStudio.ServerType == 'QB' then
        QBCore.Functions.CreateUseableItem(CodeStudio.Main.RadioInstall.Options.RadioInstallerItem, function(source)
            TriggerClientEvent('cs:carPlay:installRadio', source)
        end)
    end
end

-- Function to Check if Player have RadioItem [*Required Item for Radio Installation]--

function checkRadioItem(src, callback)
    local radioItem = CodeStudio.Main.RadioInstall.Options.RadioItem

    if CodeStudio.ServerType == 'ESX' then
        local Player = ESX.GetPlayerFromId(src)
        local itemCount = Player.getInventoryItem(radioItem).count
        if itemCount > 0 then
            callback(true)
        else
            callback(false)
        end
    elseif CodeStudio.ServerType == 'QB' then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.GetItemByName(radioItem) ~= nil then
            callback(true)
        else
            callback(false)
        end
    end
end


--- Function to Add/Remove RadioItem during Radio Installation--

function RadioInstallRemove(playerID, remove)
    local src = playerID
    local radioItem = CodeStudio.Main.RadioInstall.Options.RadioItem
    if remove then
        if CodeStudio.ServerType == 'ESX' then
            local Player = ESX.GetPlayerFromId(src)
            Player.removeInventoryItem(radioItem, 1)
        elseif CodeStudio.ServerType == 'QB' then
            local Player = QBCore.Functions.GetPlayer(src)
            Player.Functions.RemoveItem(radioItem, 1)
        end

        -- exports['qs-inventory']:RemoveItem(src, radioItem, 1)
    else
        if CodeStudio.ServerType == 'ESX' then
            local Player = ESX.GetPlayerFromId(src)
            Player.addInventoryItem(radioItem, 1)
        elseif CodeStudio.ServerType == 'QB' then
            local Player = QBCore.Functions.GetPlayer(src)
            Player.Functions.AddItem(radioItem, 1)
        end
        
        -- exports['qs-inventory']:AddItem(src, radioItem, 1)
    end
end



-- Discord Log --

function SendDiscordLog(src, musicURL)
    local webHook = CodeStudio.DiscordLog.Play_Webhook
    local Player = GetPlayerData(src)
    local embedData = {
        {
            ['title'] = 'Started Playing',
            ['color'] = 16776960,
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = 'Player: '..Player.name..
            '\nPlayer ID: '..src..
            '\nPlayer Identifier: '..Player.ident..
            '\nMusic Played: '..musicURL,
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'Music Player', embeds = embedData}), { ['Content-Type'] = 'application/json' })
end