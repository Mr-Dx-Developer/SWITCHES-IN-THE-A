-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local found = GetResourceState('qb-core')
if found ~= 'started' and found ~= 'starting' then return end

QBCore = exports['qb-core']:GetCoreObject()
WSB = {}
WSB.framework = 'qb'

---@diagnostic disable: duplicate-set-field

function WSB.getCore()
    return QBCore
end

function WSB.getPlayer(source)
    return QBCore.Functions.GetPlayer(source)
end

function WSB.getPlayerFromIdentifier(identifier)
    local player = QBCore.Functions.GetPlayerByCitizenId(identifier)
    if not player then return false end
    return player
end

function WSB.getPlayers()
    return QBCore.Functions.GetPlayers()
end

function WSB.getAllJobs()
    local jobs = QBCore and QBCore.Shared and QBCore.Shared.Jobs or nil
    local returnTb = {}
    if not jobs or #jobs < 1 then return end
    for k,v in pairs(jobs) do
        returnTb[k] = { label = v.label }
        for a,b in pairs(v.grades) do
            if not returnTb[k].grades then returnTb[k].grades = {} end
            local payment = 0
            if b then
                if b.salary then
                    payment = b.salary
                elseif b.payment then
                    payment = b.payment
                end
            end
            returnTb[k].grades[a] = {
                payment = payment,
                name = b.name,
                label = (b and b.label) or b.name
            }
        end
    end
    return returnTb
end

function WSB.registerCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function WSB.kickPlayer(source, reason)
    QBCore.Functions.Kick(source, reason, true, true)
end

function WSB.hasPermission(source, group)
    return QBCore.Functions.HasPermission(source, group) or false
end

function WSB.hasGroup(source, filter)
    local groups = { 'job', 'gang' }
    local player = WSB.getPlayer(source)
    if not player then return end
    local type = type(filter)

    if type == 'string' then
        for i = 1, #groups do
            local data = player.PlayerData[groups[i]]

            if data and data.name == filter then
                return data.name, data.grade.level
            end
        end
    else
        local tabletype = table.type(filter)

        if tabletype == 'hash' then
            for i = 1, #groups do
                local data = player.PlayerData[groups[i]]
                local grade = filter[data.name]

                if data and grade and grade <= data.grade.level then
                    return data.name, data.grade.level
                end
            end
        elseif tabletype == 'array' then
            for i = 1, #filter do
                local group = filter[i]

                for j = 1, #groups do
                    local data = player.PlayerData[groups[j]]

                    if data and data.name == group then
                        return data.name, data.grade.level
                    end
                end
            end
        end
    end
end

function WSB.setJob(source, job, grade)
    local player = WSB.getPlayer(source)
    if not player then return end
    player.Functions.SetJob(job, grade)
end

function WSB.getJobData(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    local job = player.PlayerData.job
    return job
end

function WSB.getJobLabel(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.PlayerData.job.label
end

function WSB.toggleDuty(source, _job, _grade)
    local player = WSB.getPlayer(source)
    if not player then return end
    if player.PlayerData.job.onduty then
        player.Functions.SetJobDuty(false)
        return 'off'
    else
        player.Functions.SetJobDuty(true)
        return 'on'
    end
end

function WSB.isPlayerBoss(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    if player?.PlayerData?.job?.isboss then return true else return false end
end

function WSB.getIdentifier(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.PlayerData.citizenid
end

function WSB.getName(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.PlayerData.charinfo.firstname..' '..player.PlayerData.charinfo.lastname
end

function WSB.registerUsableItem(item, cb)
    QBCore.Functions.CreateUseableItem(item, cb)
end

function WSB.hasItem(source, _item)
    local player = WSB.getPlayer(source)
    if not player then return end
    local item = player.Functions.GetItemByName(_item)
    return item?.count or item?.amount or 0
end

function WSB.addItem(source, item, count, slot, metadata)
    local player = WSB.getPlayer(source)
    if not player then return end
    local giveItem = player.Functions.AddItem(item, count, slot, metadata)
    item = player.Functions.GetItemByName(item)
    if item?.count then item.count = count elseif item?.amount then item.amount = count end
    TriggerClientEvent('inventory:client:ItemBox', source,  item, 'add')
    return giveItem
end

function WSB.addWeapon(source, weapon, ammo)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.Functions.AddItem(weapon, 1, nil, nil)
end

function WSB.removeItem(source, item, count, slot, metadata)
    local player = WSB.getPlayer(source)
    if not player then return end
    player.Functions.RemoveItem(item, count, slot, metadata)
end

function WSB.addMoney(source, type, amount)
    if type == 'money' then type = 'cash' end
    local player = WSB.getPlayer(source)
    if not player then return end
    player.Functions.AddMoney(type, amount)
end

function WSB.removeMoney(source, type, amount)
    if type == 'money' then type = 'cash' end
    local player = WSB.getPlayer(source)
    if not player then return end
    player.Functions.RemoveMoney(type, amount)
end

function WSB.hasLicense(source, license)
    local player = WSB.getPlayer(source)
    if not player then return end
    local licenses = player.PlayerData.metadata['licences']
    if licenses and licenses[license] then return true end
    return false
end

function WSB.grantLicense(source, license)
    local player = WSB.getPlayer(source)
    if not player then return false end
    local licenses = player.PlayerData.metadata['licences']
    if licenses and licenses[license] then return false end
    if not licenses then licenses = {} end
    licenses[license] = true
    player.Functions.SetMetaData('licences', licenses)
    return true
end

function WSB.revokeLicense(source, license)
    local targetPlayer = WSB.getPlayer(source)
    if not targetPlayer then return end
    local Oldlicenses = targetPlayer.PlayerData.metadata['licences']
    if not Oldlicenses[license] then return end
    local licenses = {}
    for k,v in pairs(Oldlicenses) do
        if k ~= license then
            licenses[k] = v
        end
    end
    targetPlayer.Functions.SetMetaData('licences', licenses)
end

function WSB.getPlayerAccountFunds(source, type)
    if type == 'money' then type = 'cash' end
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.PlayerData.money[type]
end

WSB.getPlayerIdentity = function(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    local data = {
        name = player.PlayerData.charinfo.firstname..' '..player.PlayerData.charinfo.lastname,
        job = player.PlayerData.job.label,
        position = player.PlayerData.job.grade.name,
        dob = player.PlayerData.charinfo.birthdate,
        licenses = {}
    }
    if player.PlayerData.charinfo.gender == 1 then
        data.sex = 'female'
    else
        data.sex = 'male'
    end
    if player.PlayerData.metadata['licences'] then
        for k,v in pairs(player.PlayerData.metadata['licences']) do
            if v then
                data.licenses[#data.licenses + 1] = {
                    type = k
                }
            end
        end
    end
    return data
end

function WSB.getVehicleOwner(plate)
    local owner
    MySQL.Async.fetchAll('SELECT citizenid FROM player_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            local identifier = result[1].citizenid
            MySQL.Async.fetchAll('SELECT charinfo FROM players WHERE citizenid = @identifier', {
                ['@identifier'] = identifier
            }, function(result2)
                if result2[1] then
                    local charData = json.decode(result2[1].charinfo)
                    owner = charData.firstname..' '..charData.lastname
                else
                    owner = false
                end
            end)
        else
            owner = false
        end
    end)
    while owner == nil do Wait(0) end
    return owner
end
