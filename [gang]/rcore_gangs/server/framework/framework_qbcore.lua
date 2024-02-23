Framework = Framework or {}

if not Config.Framework or Config.Framework == 0 then
    if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
        Config.Framework = 2
    end
end

if Config.Framework and Config.Framework == 2 then
    if not Config.FrameworkTriggers then
        Config.FrameworkTriggers = {
            notify = 'QBCore:Notify',
            object = 'QBCore:GetObject',
            resourceName = 'qb-core'
        }
    end

    if not Config.FrameworkTriggers.notify or Config.FrameworkTriggers.notify == '' or Config.FrameworkTriggers.notify:lower():strtrim() == 'qbcore' then
        Config.FrameworkTriggers.notify = 'QBCore:Notify'
    end

    if not Config.FrameworkTriggers.object or Config.FrameworkTriggers.object == '' or Config.FrameworkTriggers.object:lower():strtrim() == 'qbcore' then
        Config.FrameworkTriggers.object = 'QBCore:GetObject'
    end

    if not Config.FrameworkTriggers.resourceName or Config.FrameworkTriggers.resourceName == '' or Config.FrameworkTriggers.resourceName:lower():strtrim() == 'qbcore' then
        Config.FrameworkTriggers.resourceName = 'qb-core'
    end

    if not Config.FrameworkSQLTables then
        Config.FrameworkSQLTables = {
            table = 'players',
            identifier = 'citizenid'
        }
    end

    if not Config.FrameworkSQLTables.table or Config.FrameworkSQLTables.table == '' or Config.FrameworkSQLTables.table:lower():strtrim() == 'qbcore' then
        Config.FrameworkSQLTables.table = 'players'
    end

    if not Config.FrameworkSQLTables.identifier or Config.FrameworkSQLTables.identifier == '' or Config.FrameworkSQLTables.identifier:lower():strtrim() == 'qbcore' then
        Config.FrameworkSQLTables.identifier = 'citizenid'
    end
end

if Config.Framework and Config.Framework == 2 then
    Framework.ShowNotification = function(source, text)
        TriggerClientEvent(Config.FrameworkTriggers.notify, source, text)
    end

    Framework.ShowAdvancedNotification = function(source, title, subject, text)
        TriggerClientEvent('rcore_gangs:client:advanced_notification', source, title, subject, text, 'CHAR_DEFAULT', 8)
    end

    Framework.GetPlayers = function()
        return QBCore.Functions.GetPlayers()
    end

    Framework.GetPlayerId = function(source)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player then
            return Player.PlayerData.citizenid
        end
    end

    Framework.GetPlayerMoney = function(source)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player then
            return Player.Functions.GetMoney('cash')
        end
    end

    Framework.AddPlayerMoney = function(source, amount)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player then
            Player.Functions.AddMoney('cash', amount)
        end
    end

    Framework.AddPlayerDirtyMoney = function(source, amount)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player then
            Inventory.AddPlayerItem(source, 'markedbills', 1, false, { worth = amount })
        end
    end

    Framework.RemovePlayerMoney = function(source, amount)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player then
            Player.Functions.RemoveMoney('cash', amount)
        end
    end

    Framework.IsPlayerAllowed = function(source)
        local permissions = QBCore.Functions.GetPermission(source)

        for index, permission in ipairs(Config.CommandPermissions) do
            if IsPlayerAceAllowed(source, permission) or IsPlayerAceAllowed(source, 'command') or permissions[permission] then
                return true
            end
        end

        return false
    end

    Framework.SetPlayerGang = function(source, gang)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player then
            local name = 'none'
            local grade = '0'

            if gang then
                name = gang.tag:lower()

                if Config.RanksGroups then
                    for index, rank in ipairs(Config.RanksGroups[gang.group].ranks) do
                        if gang.rank == rank.label then
                            grade = tostring(index - 1)
                        end
                    end
                else
                    if Config.GangRanks then
                        for index, rank in ipairs(Config.GangRanks) do
                            if gang.rank == rank.label then
                                grade = tostring(index - 1)
                            end
                        end
                    end
                end
            end

            Player.Functions.SetGang(name, grade)
        end
    end

    Framework.CreateGang = function(gang)
        local grades = {}

        if Config.RanksGroups then
            for index, rank in ipairs(Config.RanksGroups[gang.group].ranks) do
                grades[tostring(index - 1)] = { name = rank.label, isboss = rank.leader }
            end
        else
            if Config.GangRanks then
                for index, rank in ipairs(Config.GangRanks) do
                    grades[tostring(index - 1)] = { name = rank.label, isboss = rank.superaccess and true or false }
                end
            end
        end

        QBCore.Functions.AddGang(gang.tag:lower(), { label = gang.name, grades = grades })
    end

    Framework.GetPoliceCount = function()
        local policeCount = 0

        for _, serverId in pairs(QBCore.Functions.GetPlayers()) do
            Wait(0)

            local player = QBCore.Functions.GetPlayer(serverId)

            if player and player.PlayerData.job.name == 'police' and player.PlayerData.job.onduty then
                policeCount += 1
            end
        end

        return policeCount
    end

    Framework.SetVehicleModifications = function(vehicle)
    end
end