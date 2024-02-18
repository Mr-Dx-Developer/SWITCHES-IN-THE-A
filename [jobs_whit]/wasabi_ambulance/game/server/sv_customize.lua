-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
ESX, QBCore = nil, nil
if wsb.framework == 'esx' then ESX = exports['es_extended']:getSharedObject() end -- Custom ESX Export?
if wsb.framework == 'qb' then QBCore = exports['qb-core']:GetCoreObject() end     -- Custom QBCore Export?



function MuteDeadPlayer(src, isDead)
    local bool = false
    if isDead then bool = true end
    MumbleSetPlayerMuted(src, bool)
end

if wsb.framework == 'esx' then
    if not Config.ambulanceJob and type(Config.ambulanceJobs) == 'table' then
        for i = 1, #Config.ambulanceJobs do
            local ambulanceJob = Config.ambulanceJobs[i]
            TriggerEvent('esx_society:registerSociety', ambulanceJob, ambulanceJob, 'society_' .. ambulanceJob,
                'society_' .. ambulanceJob, 'society_' .. ambulanceJob, { type = 'public' })
        end
        goto continue
    end
    TriggerEvent('esx_society:registerSociety', Config.ambulanceJob, Config.ambulanceJob, 'society_' ..
    Config.ambulanceJob, 'society_' .. Config.ambulanceJob, 'society_' .. Config.ambulanceJob, { type = 'public' })
    ::continue::
    ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
        if deadPlayers[source] then
            cb(true)
        else
            cb(false)
        end
    end)
    ESX.RegisterServerCallback('wasabi_ambulance:tryRevive', function(source, cb, cost, max, account)
        local players = GetPlayers()
        local ems = 0
        for i = 1, #players, 1 do
            local player = tonumber(players[i])
            if wsb.hasGroup(player, Config.ambulanceJobs or Config.ambulanceJob) then
                ems = ems + 1
            end
        end
        if max then
            if ems > max then
                cb('max')
            end
        end
        if cost then
            local funds = wsb.getPlayerAccountFunds(source, account)
            if funds < cost then
                cb(false)
            else
                wsb.removeMoney(source, account, cost)
                TriggerClientEvent('wasabi_ambulance:revive', source)
                cb('success')
            end
        else
            TriggerClientEvent('wasabi_ambulance:revive', source)
            cb('success')
        end
    end)
end

RegisterNetEvent('wasabi_ambulance:removeItemsOnDeath', function()
    local src = source
    local player = wsb.getPlayer(src)
    if not player then return end
    if wsb.framework == 'qb' then
        player.Functions.ClearInventory()
        MySQL.Async.execute('UPDATE players SET inventory = ? WHERE citizenid = ?',
            { json.encode({}), player.PlayerData.citizenid })
        return
    elseif wsb.framework == 'esx' then
        player.setAccountMoney('money', 0)
        player.setAccountMoney('black_money', 0)
    end

    if Config.Inventory == 'qs' then
        exports['qs-inventory']:ClearInventory(src)
        TriggerClientEvent('wasabi_ambulance:weaponRemove', src)
    elseif Config.Inventory == 'ox' then
        exports.ox_inventory:ClearInventory(src)
    elseif Config.Inventory == 'mf' then
        exports['mf-inventory']:clearInventory(player.identifier)
        exports['mf-inventory']:clearLoadout(player.identifier)
        TriggerClientEvent('wasabi_ambulance:weaponRemove', src)
    elseif Config.Inventory == 'esx' then
        for i = 1, #player.inventory, 1 do
            if player.inventory[i].count > 0 then
                player.removeInventoryItem(player.inventory[i].name, player.inventory[i].count)
            end
        end

        for k, data in pairs(player.getLoadout()) do
            if player.hasWeapon(data.name) then
                player.removeWeapon(data.name)
            end
        end
    else
        print('CONFIGURE YOUR INVENTORY SYSTEM IN "@wasabi_ambulance/server/sv_customize.lua" line ~55')
    end
end)

RegisterNetEvent('wasabi_ambulance:resetThirstHunger', function()
    local src = source
    if wsb.framework ~= 'qb' then return end
    local player = wsb.getPlayer(src)

    player.Functions.SetMetaData('hunger', 100)
    player.Functions.SetMetaData('thirst', 100)

    TriggerClientEvent('hud:client:UpdateNeeds', src, 100, 100)
end)

RegisterNetEvent('wasabi_ambulance:punishPlayer', function(reason)
    local src = source
    wsb.kickPlayer(src,
        string.format(
        'You got kicked!\n\nAuthor: %s\nReason: %s\n\nYou think this punishment was not fair?\nContact our support at discord.gg/',
            GetCurrentResourceName(), reason))

    --[[
        EASYADMIN EXAMPLE
        TriggerEvent('EasyAdmin:addBan', source, reason, 31556926, GetCurrentResourceName())
    --]]
end)


if Config.CompleteDeath.enabled and wsb.framework == 'esx' then
    resetDeathCount = function(xPlayer)
        MySQL.query('UPDATE users SET deaths = @deaths, disabled = @disabled WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier,
            ['@deaths'] = 0,
            ['@disabled'] = 0
        }, function(result)
        end)
    end

    viewDeathCount = function(xPlayer)
        MySQL.query('SELECT deaths FROM users WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        }, function(result)
            local deathCount = result[1].deaths

            TriggerClientEvent('wasabi_bridge:notify', xPlayer.source, 'DEATHCOUNT',
                string.format('Your current deathcount: %s', deathCount), 'inform', 'ban')
        end)
    end

    RegisterNetEvent('wasabi_ambulance:deathCount', function(prot)
        local src = source
        local xPlayer = wsb.getPlayer(src)

        if prot then
            TriggerEvent('wasabi_ambulance:punishPlayer', xPlayer.source, 'wasabi_ambulance:deathCount triggered')
            return
        end

        MySQL.query('SELECT deaths FROM users WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        }, function(result)
            local deathCount = result[1].deaths + 1
            local disable = 0 -- 0 = false / 1 = true

            if deathCount >= Config.CompleteDeath.maxDeaths then
                disable = 1
            end

            MySQL.query('UPDATE users SET deaths = @deaths, disabled = @disabled WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier,
                ['@deaths'] = deathCount,
                ['@disabled'] = disable
            }, function(result)
                if disable == 1 then
                    xPlayer.kick(string.format(
                    'You got kicked!\n\nAuthor: %s\nReason: You reached the max deathcount\nDeathcount: %s/%s\n\nYour character is now disabled.',
                        GetCurrentResourceName(), deathCount, Config.CompleteDeath.maxDeaths))
                end
            end)
        end)
    end)

    ESX.RegisterCommand('viewdeathcount', 'user', function(xPlayer, args, showError)
        viewDeathCount(xPlayer)
    end, false, { help = Strings.viewdeathcount_command_help })

    ESX.RegisterCommand('resetdeathcount', 'admin', function(xPlayer, args, showError)
        resetDeathCount(args.playerId)
    end, true, {
        help = Strings.resetdeathcount_command_help,
        validate = true,
        arguments = {
            { name = 'playerId', help = Strings.resetdeathcount_command_arg, type = 'player' }
        }
    })
end

if wsb.framework == 'esx' then
    if not string.find(GetResourceState('essentialmode'), 'start') then
        -- ESX 1.2+
        ESX.RegisterCommand('reviveall', 'admin', function(xPlayer, args, showError)
            for _, xPlayer in ipairs(ESX.GetExtendedPlayers()) do
                if deadPlayers[xPlayer.source] then
                    TriggerClientEvent('wasabi_ambulance:revive', xPlayer.source)
                end
            end
        end, true, { help = Strings.reviveall_command_help })

        ESX.RegisterCommand('revive', 'admin', function(xPlayer, args, showError)
            args.playerId.triggerEvent('wasabi_ambulance:revive')
            if xPlayer?.source and Config.ReviveLogs then
                TriggerEvent('wasabi_ambulance:logRevive', xPlayer.source, args.playerId.source)
            end
        end, true, {
            help = Strings.revive_command_help,
            validate = true,
            arguments = {
                { name = 'playerId', help = Strings.revive_command_arg, type = 'player' }
            }
        })
        local ver = GetResourceMetadata('es_extended', 'version', 0)
        ver = ver:gsub('%.', '')
        if tonumber(ver) >= 175 then
            ESX.RegisterCommand('revivearea', 'admin', function(xPlayer, args, showError)
                local coords = GetEntityCoords(GetPlayerPed(xPlayer.source))
                local xPlayersNear = ESX.OneSync.GetPlayersInArea(vector3(coords.x, coords.y, coords.z), args.area or 10)
                for k, v in pairs(xPlayersNear) do
                    for _, xPlayers in ipairs(ESX.GetExtendedPlayers()) do
                        if deadPlayers[xPlayers.source] then
                            TriggerClientEvent('wasabi_ambulance:revive', xPlayers.source)
                            if xPlayer?.source and Config.ReviveLogs then
                                TriggerEvent('wasabi_ambulance:logRevive', xPlayer.source, xPlayers.source)
                            end
                        end
                    end
                end
            end, false, {
                help = Strings.revivearea_command_help,
                validate = false,
                arguments = {
                    { name = 'area', help = Strings.revivearea_command_arg, type = 'number' }
                }
            })
        end
    else
        -- ESX 1.1
        TriggerEvent('es:addGroupCommand', 'revive', 'admin', function(source, args, user)
            if args[1] ~= nil then
                local args1 = tonumber(args[1])
                if type(args1) ~= 'number' then return end
                if GetPlayerName(args1) ~= nil then
                    print('wasabi_ambulance: ' .. GetPlayerName(source) .. ' is reviving a player!')
                    TriggerClientEvent('wasabi_ambulance:revive', args1)
                    if source and source ~= 0 and Config.ReviveLogs then
                        TriggerEvent('wasabi_ambulance:logRevive', source, args1)
                    end
                end
            else
                TriggerClientEvent('wasabi_ambulance:revive', source)
                if source and source ~= 0 and Config.ReviveLogs then
                    TriggerEvent('wasabi_ambulance:logRevive', source)
                end
            end
        end, function(source, args, user)
            TriggerClientEvent('chatMessage', source, 'SYSTEM', { 255, 0, 0 }, 'Insufficient Permissions.')
        end, { help = 'Revive a nearby player', params = { { name = 'id' } } })
    end
elseif wsb.framework == 'qb' then
    QBCore.Commands.Add('revive', 'Revive a player', { { name = 'id', help = 'Player ID' } }, false,
        function(source, args)
            local src = source
            if args[1] then
                local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
                if Player then
                    TriggerClientEvent('wasabi_ambulance:revive', Player.PlayerData.source)
                    if source and source ~= 0 and Config.ReviveLogs then
                        TriggerEvent('wasabi_ambulance:logRevive', source, Player.PlayerData.source)
                    end
                end
            else
                TriggerClientEvent('wasabi_ambulance:revive', src)
            end
        end, 'admin')

    QBCore.Commands.Add('kill', 'Kill a player', { { name = 'id', help = 'Player ID' } }, false, function(source, args)
        local src = source
        if args[1] then
            local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if Player then
                TriggerClientEvent('wasabi_ambulance:killPlayer', Player.PlayerData.source)
            end
        else
            TriggerClientEvent('wasabi_ambulance:killPlayer', src)
        end
    end, 'admin')

    RegisterNetEvent('hospital:server:resetHungerThirst', function()
        local src = source
        local player = wsb.getPlayer(src)
        if not player then return end
        player.Functions.SetMetaData('hunger', 100)
        player.Functions.SetMetaData('thirst', 100)
        TriggerClientEvent('hud:client:UpdateNeeds', src, 100, 100)
    end)
end

RevivePlayer = function(target)
    local src = source
    TriggerClientEvent('wasabi_ambulance:revive', target)
    if src and src ~= 0 and Config.ReviveLogs then
        TriggerEvent('wasabi_ambulance:logRevive', src, target)
    end
end
exports('RevivePlayer', RevivePlayer)

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
    if GetInvokingResource() ~= 'monitor' or type(eventData) ~= 'table' or type(eventData.id) ~= 'number' then
        return
    end

    if eventData.id == -1 then
        for _, ids in ipairs(GetPlayers()) do
            local playerId = tonumber(ids)
            if playerId then
                if Player(playerId).state.laststand or Player(playerId).state.dead then
                    TriggerClientEvent('wasabi_ambulance:revive', playerId)
                else
                    TriggerClientEvent('wasabi_ambulance:heal', playerId, true, true)
                end
            end
        end
    else
        if Player(eventData.id).state.laststand or Player(eventData.id).state.dead then
            TriggerClientEvent('wasabi_ambulance:revive', eventData.id)
        else
            TriggerClientEvent('wasabi_ambulance:heal', eventData.id, true, true)
        end
    end
end)
