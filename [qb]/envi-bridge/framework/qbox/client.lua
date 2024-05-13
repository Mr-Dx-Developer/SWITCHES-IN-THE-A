module 'shared/debug'
module 'shared/resource'
module 'shared/utils'
module 'shared/player'

QBX = nil
Version = resource.version(Bridge.FrameworkName)

if not rawget(_G, "lib") then include('ox_lib', 'init') end
include(Bridge.FrameworkName, 'modules/playerdata')
include(Bridge.FrameworkName, 'modules/lib')

Bridge.Debug('Framework', 'QBox', Version)

AddStateBagChangeHandler('isLoggedIn', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(_, _, value)
    if value then
        Framework.SetPlayerData(QBX.PlayerData)
        pcall(Framework.OnPlayerLoaded)
    else
        Framework.Player = {}
        pcall(Framework.OnPlayerUnload)
    end
end)

RegisterNetEvent('QBX:Player:Dropped', function()
    pcall(Framework.OnPlayerUnload)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Player:SetPlayerData', function(PlayerData)
    Framework.SetPlayerData(PlayerData)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Client:OnJobUpdate', function(Job)
    Framework.Player.Job = {}
    Framework.Player.Job.Name = Job.name
    Framework.Player.Job.Label = Job.label
    Framework.Player.Job.Duty = Job.onduty
    Framework.Player.Job.Boss = Job.isboss
    Framework.Player.Job.Grade = {}
    Framework.Player.Job.Grade.Name = Job.grade.name
    Framework.Player.Job.Grade.Level = Job.grade.level
    pcall(Framework.OnJobUpdate)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Client:SetDuty', function(Duty)
    Framework.Player.Job.Duty = Duty
    pcall(Framework.OnJobDutyUpdate)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Client:OnGangUpdate', function(Gang)
    Framework.Player.Gang = {}
    Framework.Player.Gang.Name = Gang.name
    Framework.Player.Gang.Label = Gang.label
    Framework.Player.Gang.Boss = Gang.isboss
    Framework.Player.Gang.Grade = {}
    Framework.Player.Gang.Grade.Name = Gang.grade.name
    Framework.Player.Gang.Grade.Level = Gang.grade.level
    pcall(Framework.OnGangUpdate)
end)

Framework.SetPlayerData = function(PlayerData)
    Framework.Player.Identifier = PlayerData.citizenid
    Framework.Player.Name = PlayerData.name
    if PlayerData.charinfo then
        Framework.Player.Firstname = PlayerData.charinfo.firstname or 'Firstname'
        Framework.Player.Lastname = PlayerData.charinfo.lastname or 'Lastname'
        Framework.Player.DateOfBirth = PlayerData.charinfo.birthdate or '00-00-0000'
        Framework.Player.Gender = (PlayerData.charinfo.gender == 0 and 'm' or 'f')
    end
    Framework.Player.Job = Framework.Player.Job or {}
    if PlayerData.job then
        Framework.Player.Job.Name = PlayerData.job.name
        Framework.Player.Job.Label = PlayerData.job.label
        Framework.Player.Job.Duty = PlayerData.job.onduty
        Framework.Player.Job.Boss = PlayerData.job.isboss
        Framework.Player.Job.Grade = Framework.Player.Job.Grade or {}
        Framework.Player.Job.Grade.Name = PlayerData.job.grade.name
        Framework.Player.Job.Grade.Level = PlayerData.job.grade.level
    end
    Framework.Player.Gang = Framework.Player.Gang or {}
    if PlayerData.gang then
        Framework.Player.Gang.Name = PlayerData.gang.name
        Framework.Player.Gang.Label = PlayerData.gang.label
        Framework.Player.Gang.Boss = PlayerData.gang.isboss
        Framework.Player.Gang.Grade = Framework.Player.Gang.Grade or {}
        Framework.Player.Gang.Grade.Name = PlayerData.gang.grade.name
        Framework.Player.Gang.Grade.Level = PlayerData.gang.grade.level
    end
    if PlayerData.money then
        Framework.Player.Accounts = {}
        for account, amount in pairs(PlayerData.money) do
            Framework.Player.Accounts[account] = amount
        end
    end
    Framework.Player.Metadata = PlayerData.metadata or {}
end

Framework.OnReady(QBX, function()
    Framework.SetPlayerData(QBX.PlayerData)
end)

local function UnpackCallback(arguments, i)
    if not arguments then return end
    local index = i or 1

    if index <= #arguments then
        return arguments[index], UnpackCallback(arguments, index + 1)
    end
end

Framework.CreateCallback = function(name, cb)
    lib.callback.register(name, function(...)
        local p = promise.new()
        cb(function(...) p:resolve({...}) end, ...)
        return UnpackCallback(Citizen.Await(p))
    end)
end

Framework.TriggerCallback = function(name, cb, ...)
    lib.callback(name, false, cb, ...)
end

Framework.SpawnVehicle = function(cb, model, coords, warp)
    Framework.TriggerCallback(('%s:SpawnVehicle'):format(Bridge.Resource), cb, model, coords, warp)
end

Framework.ToggleDuty = function()
    TriggerServerEvent(Bridge.FrameworkPrefix .. ':ToggleDuty')
end

Framework.Notify = function(message, type, length)
    exports[Bridge.FrameworkName]:Notify(message, type, length)
end

Framework.IsPlayerDead = function()
    local PlayerData = QBX.PlayerData
    return (PlayerData.metadata['isdead'] or PlayerData.metadata['inlaststand'])
end

Framework.GetStatus = function(key)
    local PlayerData = QBX.PlayerData
    return Framework.Round(PlayerData.metadata[key], 0)
end

Framework.OpenSociety = function(name, type)
    if type == 'job' and (Framework.Player.Job.Name ~= name or not Framework.Player.Job.Boss) then return end
    if type == 'gang' and (Framework.Player.Gang.Name ~= name or not Framework.Player.Gang.Boss) then return end
    if type == 'job' then
        TriggerEvent('qb-bossmenu:client:OpenMenu')
    elseif type == 'gang' then
        TriggerEvent('qb-gangmenu:client:OpenMenu')
    else
        error('Society Type Must Be Job Or Gang', 0)
    end
end
