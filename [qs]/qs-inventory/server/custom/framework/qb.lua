if Config.Framework ~= 'qb' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()

userTable = 'players'
Identifier = 'citizenid'
VehicleTable = 'player_vehicles'
WeaponList = QBCore.Shared.Weapons
ItemList = QBCore.Shared.Items

UseCashAsItem = true -- Choose whether to use money as an item
CashItem = 'cash'     -- Choose the money item, it only works if I enable the configurable above

ListAccountsSteal = {
    { account = 'cash', name = 'Cash' },
    -- { account = 'crypto' , name = 'Crypto' },
}

function RegisterServerCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function GetPlayerFromId(source)
    return QBCore.Functions.GetPlayer(source)
end

function GetPlayerFromIdentifier(identifier)
    return QBCore.Functions.GetPlayerByCitizenId(identifier)
end

function PlayerIsAdmin(source)
    if source == 0 then
        return true
    end
    return QBCore.Functions.HasPermission(source, 'god') or IsPlayerAceAllowed(source, 'command') or QBCore.Functions.HasPermission(source, 'admin')
end

function FrameworkGetPlayers()
    return QBCore.Functions.GetPlayers()
end

function GetPlayerIdentifier(source)
    local player = GetPlayerFromId(source)
    return player?.PlayerData?.citizenid
end

function GetJobName(source)
    local player = GetPlayerFromId(source)
    return player.PlayerData.job.name
end

function GetJobGrade(source)
    local player = GetPlayerFromId(source)
    return player.PlayerData.job.grade.level
end

function GetAccountMoney(source, account)
    local player = GetPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    if account == 'black_money' then account = 'crypto' end
    return player.PlayerData.money[account]
end

function AddAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    player.Functions.AddMoney(account, amount)
end

function GetItems(player)
    return player.PlayerData.items
end

function GetItem(player, item)
    return player.Functions.GetItemsByName(item)
end

function RemoveAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    player.Functions.RemoveMoney(account, amount)
end

function GetUserName(identifier)
    local player = GetPlayerFromIdentifier(identifier)
    if player then
        return player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname, {
            citizenid = player.PlayerData.citizenid,
            firstname = player.PlayerData.charinfo.firstname or 'Player',
            lastname = player.PlayerData.charinfo.lastname or '',
            birthdate = player.PlayerData.charinfo.birthdate,
            gender = tonumber(player.PlayerData.charinfo.gender),
            nationality = player.PlayerData.charinfo.nationality,
        }
    end
    return '', {}
end

function IsVehicleOwnedAbleToOpen(plate, id)
    local val = false
    local Player = GetPlayerFromId(id)
    if Player then
        local result = MySQL.Sync.fetchAll('SELECT * FROM  ' .. VehicleTable .. " WHERE `plate` = '" .. plate .. "' LIMIT 1")
        if (result and result[1] ~= nil) then
            if result[1].citizenid == Player?.PlayerData?.citizenid then
                val = true
            else
                val = false
            end
        else
            val = true
        end
        return val
    else
        return val
    end
end

RegisterServerCallback(Config.InventoryPrefix .. ':server:checkDead', function(_, cb, id)
    local Player = QBCore.Functions.GetPlayer(id)
    cb(Player.PlayerData.metadata['isdead'])
end)

-- Don't toch
Accounts = { black_money = 0, money = 0 }
