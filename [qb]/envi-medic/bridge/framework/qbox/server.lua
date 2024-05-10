module 'shared/debug'
module 'shared/resource'
module 'shared/table'
module 'shared/player'

QBX = nil
Version = resource.version(Bridge.FrameworkName)

include('ox_lib', 'init')
include(Bridge.FrameworkName, 'modules/playerdata')
include(Bridge.FrameworkName, 'modules/lib')

Bridge.Debug('Framework', 'QBox', Version)

AddStateBagChangeHandler('isLoggedIn', nil, function(player, _, value)
    local source = tonumber(player:gsub('player:', ''), 10)
    if not source then return end
    if value then
        pcall(Framework.OnPlayerLoaded, source)
    else
        pcall(Framework.OnPlayerUnload, source)
    end
end)

AddEventHandler('playerDropped', function()
    local src = source
    TriggerClientEvent('QBX:Player:Dropped', src)
    pcall(Framework.OnPlayerUnload, src)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Server:OnJobUpdate', function()
    pcall(Framework.OnJobUpdate, source)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Server:SetDuty', function()
    pcall(Framework.OnJobDutyUpdate, source)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Server:OnGangUpdate', function()
    pcall(Framework.OnGangUpdate, source)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Player:SetPlayerData', function()
    pcall(Framework.OnPlayerDataUpdate, source)
end)

local function UnpackCallback(arguments, i)
    if not arguments then return end
    local index = i or 1

    if index <= #arguments then
        return arguments[index], UnpackCallback(arguments, index + 1)
    end
end

Framework.CreateCallback = function(name, cb)
    lib.callback.register(name, function(source, ...)
        local p = promise.new()
        cb(source, function(...) p:resolve({...}) end, ...)
        return UnpackCallback(Citizen.Await(p))
    end)
end

Framework.TriggerCallback = function(source, name, cb, ...)
    lib.callback(name, source, cb, ...)
end

Framework.CreateUseableItem = function(name, cb)
    exports[Bridge.FrameworkName]:CreateUseableItem(name, function(source, data)
        cb(source, data.name,
            { weight = data.weight, count = data.amount, slot = data.slot, name = data.name, metadata = data.info,
                label = data.label })
    end)
end

Framework.GetPlayer = function(source)
    local src = source
    local Player = exports[Bridge.FrameworkName]:GetPlayer(src)
    if not Player then return nil end
    local self = table.deepclone(Framework.Player)
    self.source = Player.PlayerData.source
    self.Identifier = Player.PlayerData.citizenid
    self.Name = Player.PlayerData.name
    self.Firstname = Player.PlayerData.charinfo.firstname
    self.Lastname = Player.PlayerData.charinfo.lastname
    self.DateOfBirth = Player.PlayerData.charinfo.birthdate or '00-00-0000'
    self.Gender = (Player.PlayerData.charinfo.gender == 0 and 'm' or 'f')
    self.Job.Name = Player.PlayerData.job.name
    self.Job.Label = Player.PlayerData.job.label
    self.Job.Duty = Player.PlayerData.job.onduty
    self.Job.Boss = Player.PlayerData.job.isboss
    self.Job.Grade.Name = Player.PlayerData.job.grade.name
    self.Job.Grade.Level = Player.PlayerData.job.grade.level
    self.Gang.Name = Player.PlayerData.gang.name
    self.Gang.Label = Player.PlayerData.gang.label
    self.Gang.Boss = Player.PlayerData.gang.isboss
    self.Gang.Grade.Name = Player.PlayerData.gang.grade.name
    self.Gang.Grade.Level = Player.PlayerData.gang.grade.level
    self.Metadata = Player.PlayerData.metadata

    self.SetJob = function(job, grade)
        return Player.Functions.SetJob(job, grade)
    end

    self.SetGang = function(gang, grade)
        return Player.Functions.SetGang(gang, grade)
    end

    self.AddMoney = function(type, amount)
        return Player.Functions.AddMoney(type, amount)
    end

    self.RemoveMoney = function(type, amount)
        return Player.Functions.RemoveMoney(type, amount)
    end

    self.GetMoney = function(type)
        return Player.Functions.GetMoney(type)
    end

    self.GetStatus = function(key)
        return Framework.Round(Player.PlayerData.metadata[key], 0)
    end

    self.SetStatus = function(key, value)
        Player.Functions.SetMetaData(key, value)
    end

    self.GetMetaData = function(key)
        if not key then return Player.PlayerData.metadata end
        return Player.Functions.GetMetaData(key)
    end

    self.SetMetaData = function(key, value)
        Player.Functions.SetMetaData(key, value)
    end

    self.HasLicense = function(name)
        return Player.PlayerData.metadata['licences'][name] or false
    end

    self.GetLicenses = function()
        return Player.PlayerData.metadata['licences']
    end

    self.AddLicense = function(name)
        local licences = Player.PlayerData.metadata['licences']
        licences[name] = true
        Player.Functions.SetMetaData("licences", licences)
    end

    self.RemoveLicense = function(name)
        local licences = Player.PlayerData.metadata['licences']
        if licences[name] then
            licences[name] = false
            Player.Functions.SetMetaData("licences", licences)
        end
    end

    return self
end

Framework.GetPlayerByIdentifier = function(identifier)
    return Framework.GetPlayer(exports[Bridge.FrameworkName]:GetPlayerByCitizenId(identifier)?.PlayerData?.source)
end

Framework.DoesJobExist = function(job, grade)
    grade = tostring(grade)
    if job and grade then
        if QBX.Shared.Jobs[job] and QBX.Shared.Jobs[job].grades[grade] then
            return true
        else
            return false
        end
    end
    return false
end

Framework.DoesGangExist = function(gang, grade)
    grade = tostring(grade)
    if gang and grade then
        if QBX.Shared.Gangs[gang] and QBX.Shared.Gangs[gang].grades[grade] then
            return true
        else
            return false
        end
    end
    return false
end

Framework.RegisterSociety = function(name, type)
    if type ~= 'job' and type ~= 'gang' then error('Society Type Must Be Job Or Gang', 0) return end
    if type == 'job' then type = 'boss' end
    local management_funds = Database.scalar('SELECT `job_name` FROM `management_funds` WHERE `job_name` = ?', { name })
    if not management_funds then
        Database.insert('INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES (?, ?, ?)', { name, 0, type })
    end
end

Framework.SocietyGetMoney = function(name, type)
    if type ~= 'job' and type ~= 'gang' then error('Society Type Must Be Job Or Gang', 0) return 0 end
    if type == "job" then
        return exports['qbx_management']:GetAccount(name)
    elseif type == "gang" then
        return exports['qbx_management']:GetGangAccount(name)
    end
    return 0
end

Framework.SocietyAddMoney = function(name, type, amount)
    if type ~= 'job' and type ~= 'gang' then error('Society Type Must Be Job Or Gang', 0) return false end
    if amount < 0 or amount == 0 then return false end
    if type == "job" then
        exports['qbx_management']:AddMoney(name, amount)
        return true
    elseif type == "gang" then
        exports['qbx_management']:AddGangMoney(name, amount)
        return true
    end
    return false
end

Framework.SocietyRemoveMoney = function(name, type, amount)
    if type ~= 'job' and type ~= 'gang' then error('Society Type Must Be Job Or Gang', 0) return false end
    if type == "job" then
        return exports['qbx_management']:RemoveMoney(name, amount)
    elseif type == "gang" then
        return exports['qbx_management']:RemoveGangMoney(name, amount)
    end
    return false
end

Framework.Notify = function(source, message, type, length)
    TriggerClientEvent('ox_lib:notify', source, { description = message, type = type, duration = length })
end

Framework.IsPlayerDead = function(source)
    local Player = exports[Bridge.FrameworkName]:GetPlayer(source)
    return (Player.PlayerData.metadata['isdead'] or Player.PlayerData.metadata['inlaststand'])
end

Framework.CreateCallback(('%s:SpawnVehicle'):format(Bridge.Resource), function(source, cb, model, coords, warp)
    local netId = SpawnVehicle(source, model, coords, warp)
    if not netId or netId == 0 then cb(0) end
    local veh = NetworkGetEntityFromNetworkId(netId)
    if not veh or veh == 0 then cb(0) end
    cb(netId)
end)