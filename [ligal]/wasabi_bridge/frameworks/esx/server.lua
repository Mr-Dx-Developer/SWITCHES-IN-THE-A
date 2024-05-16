-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local found = GetResourceState('es_extended')
if found ~= 'started' and found ~= 'starting' then return end

ESX = exports['es_extended']:getSharedObject()
WSB = {}
WSB.framework = 'esx'

---@diagnostic disable: duplicate-set-field

function WSB.getCore()
    return ESX
end

function WSB.getPlayer(source)
    return ESX.GetPlayerFromId(source)
end

function WSB.getPlayerFromIdentifier(identifier)
    local player = ESX.GetPlayerFromIdentifier(identifier)
    if not player then return false end
    return player
end

function WSB.getPlayers()
    return ESX.GetExtendedPlayers()
end

function WSB.getAllJobs()
    local jobs = ESX and ESX.Jobs or nil
    local returnTb = {}
    if not jobs or #jobs < 1 then return end
    for k, v in pairs(jobs) do
        returnTb[k] = { label = v.label }
        for a, b in pairs(v.grades) do
            if not returnTb[k].grades then returnTb[k].grades = {} end

            returnTb[k].grades[a] = {
                payment = b and b.salary or nil,
                name = b.name,
                label = (b and b.label) or nil
            }
        end
    end
    return returnTb
end

function WSB.registerCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

function WSB.kickPlayer(source, reason)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.kick(reason)
end

function WSB.hasPermission(source, group)
    local player = WSB.getPlayer(source)
    if not player then return end
    if player.getGroup() ~= group then return false else return true end
end

function WSB.hasGroup(source, filter)
    local player = WSB.getPlayer(source)
    if not player then return end
    local type = type(filter)

    if type == 'string' then
        if player.job.name == filter then
            return player.job.name, player.job.grade
        end
    else
        local tabletype = table.type(filter)

        if tabletype == 'hash' then
            local grade = filter[player.job.name]

            if grade and grade <= player.job.grade then
                return player.job.name, player.job.grade
            end
        elseif tabletype == 'array' then
            for i = 1, #filter do
                if player.job.name == filter[i] then
                    return player.job.name, player.job.grade
                end
            end
        end
    end
end

function WSB.setJob(source, job, grade)
    local player = WSB.getPlayer(source)
    if not player then return end
    player.setJob(job, grade)
end

function WSB.getJobData(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    local job = {
        name = player.job.name,
        label = player.job.label,
        payment = player.job.grade_salary,
        grade = {
            name = player.job.grade_label,
            level = player.job.grade,
        }
    }
    if player.job.grade_name == 'boss' then job.isboss = true end
    return job
end

function WSB.getJobLabel(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.job.label
end

function WSB.toggleDuty(source, job, grade)
    local player = WSB.getPlayer(source)
    if not player then return end
    if job:sub(0, 3) == 'off' then
        local onDuty = string.gsub(job, 'off', '')
        player.setJob(onDuty, grade)
        return 'on'
    else
        player.setJob('off' .. job, grade)
        return 'off'
    end
end

function WSB.isPlayerBoss(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    if player?.job?.grade_name == 'boss' then return true else return false end
end

function WSB.getIdentifier(source)
    local player = WSB.getPlayer(source)
    if not player then return false end
    return player.identifier
end

function WSB.getName(source)
    local player = WSB.getPlayer(source)
    if not player then return false end
    return player.getName()
end

function WSB.registerUsableItem(item, cb)
    ESX.RegisterUsableItem(item, cb)
end

function WSB.hasItem(source, _item)
    local player = WSB.getPlayer(source)
    if not player then return end
    local item = player.getInventoryItem(_item)
    return item?.amount or item?.count or 0
end

function WSB.addItem(source, item, count, slot, metadata)
    local player = WSB.getPlayer(source)
    if not player then return end
    if metadata and not WSB.inventory then
        print(
        '^0[^3WARNING^0] wasabi_bridge has had an item passed with metadata but did not detect your inventory! Issues may occur!')
    end
    return player.addInventoryItem(item, count, metadata, slot)
end

function WSB.addWeapon(source, weapon, ammo)
    local player = WSB.getPlayer(source)
    if not player then return end
    player.addWeapon(weapon, ammo)
end

function WSB.removeItem(source, item, count, slot, metadata)
    local player = WSB.getPlayer(source)
    if not player then return end
    player.removeInventoryItem(item, count, metadata, slot)
end

function WSB.addMoney(source, type, amount)
    if type == 'cash' then type = 'money' end
    local player = WSB.getPlayer(source)
    if not player then return end
    player.addAccountMoney(type, amount)
end

function WSB.removeMoney(source, type, amount)
    if type == 'cash' then type = 'money' end
    local player = WSB.getPlayer(source)
    if not player then return end
    player.removeAccountMoney(type, amount)
end

function WSB.hasLicense(source, license)
    local hasLicense = ''
    TriggerEvent('esx_license:checkLicense', source, license, function(cb)
        hasLicense = cb
    end)
    while hasLicense == '' do Wait(100) end
    return hasLicense
end

function WSB.grantLicense(source, license)
    local player = WSB.getPlayer(source)
    if not player then return end
    local isGranted = ''
    TriggerEvent('esx_license:addLicense', source, license, function(granted)
        isGranted = granted
    end)
    while isGranted == '' do Wait(100) end
    return isGranted
end

function WSB.revokeLicense(source, license)
    local identifier = WSB.getIdentifier(source)
    if not identifier then return false end
    local revoked = ''
    MySQL.update('DELETE FROM user_licenses WHERE type = ? AND owner = ?', { license, identifier }, function(rowsChanged)
        revoked = rowsChanged
    end)
    while revoked == '' do Wait(100) end
    return revoked
end

function WSB.getPlayerAccountFunds(source, type)
    if type == 'cash' then type = 'money' end
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.getAccount(type).money
end

function WSB.getPlayerIdentity(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    local licenseFound
    local data = {
        name = player.getName(),
        job = player.job.label,
        position = player.job.grade_label,
        dob = player.get('dateofbirth') or false,
    }
    if player.get('sex') == 'm' then data.sex = 'male' else data.sex = 'female' end
    if GetResourceState('esx_status') == 'started' then
        TriggerEvent('esx_status:getStatus', source, 'drunk', function(status)
            if status then
                data.drunk = math.floor(status.percent)
            end
        end)
    end
    if GetResourceState('esx_license') == 'started' then
        TriggerEvent('esx_license:getLicenses', source, function(licenses)
            licenseFound = true
            data.licenses = licenses
        end)
    end
    while not licenseFound do Wait(0) end
    return data
end

function WSB.getVehicleOwner(plate)
    local owner
    MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            local identifier = result[1].owner
            MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
                ['@identifier'] = identifier
            }, function(result2)
                if result2[1] then
                    owner = result2[1].firstname .. ' ' .. result2[1].lastname
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
