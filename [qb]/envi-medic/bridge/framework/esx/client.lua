module 'shared/debug'
module 'shared/resource'
module 'shared/utils'
module 'shared/player'

ESX = nil
Version = resource.version(Bridge.FrameworkName)

Citizen.CreateThreadNow(function()
    IsExport, ESX = pcall(function()
        return exports[Bridge.FrameworkName]:getSharedObject()
    end)

    if not IsExport then
        while not ESX do
            TriggerEvent(Bridge.FrameworkEvent, function(obj) ESX = obj end)
            Wait(500)
        end
    end
end)

Bridge.Debug('Framework', 'ESX', Version)

local clientCallbacks = {}
RegisterClientCallback = function(name, callback)
    clientCallbacks[name] = callback
end

RegisterNetEvent(Bridge.Resource .. ':TriggerClientCallback', function(name, id, ...)
    if clientCallbacks[name] then
        clientCallbacks[name](function(...)
            TriggerServerEvent(Bridge.Resource .. ':ClientCallback', id, ...)
        end, ...)
    end
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':playerLoaded', function(PlayerData)
    Framework.SetPlayerData(PlayerData)
    pcall(Framework.OnPlayerLoaded)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':onPlayerLogout', function()
    Framework.Player = {}
    pcall(Framework.OnPlayerUnload)
end)

AddEventHandler(Bridge.FrameworkPrefix .. ':setPlayerData', function()
    local PlayerData = ESX.GetPlayerData()
    Framework.SetPlayerData(PlayerData)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':setJob', function(Job)
    Framework.Player.Job = {}
    Framework.Player.Job.Name = Job.name
    Framework.Player.Job.Label = Job.label
    Framework.Player.Job.Duty = Job.onDuty
    Framework.Player.Job.Boss = Job.grade_name == 'boss' and true or false
    Framework.Player.Job.Grade = {}
    Framework.Player.Job.Grade.Name = Job.grade_label
    Framework.Player.Job.Grade.Level = Job.grade
    pcall(Framework.OnJobUpdate)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':setDuty', function(Duty)
    local PlayerData = ESX.GetPlayerData()
    if PlayerData.job.onDuty == Duty then return end
    local Job = PlayerData.job
    Job.onDuty = Duty
    Framework.Player.Job.Duty = Duty
    ESX.SetPlayerData('job', Job)
    pcall(Framework.OnJobDutyUpdate)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':setGang', function(Gang)
    Framework.Player.Gang = {}
    Framework.Player.Gang.Name = Gang.name
    Framework.Player.Gang.Label = Gang.label
    Framework.Player.Gang.Boss = Gang.grade_name == 'boss' and true or false
    Framework.Player.Gang.Grade = {}
    Framework.Player.Gang.Grade.Name = Gang.grade_label
    Framework.Player.Gang.Grade.Level = Gang.grade
    ESX.SetPlayerData('gang', Gang)
    pcall(Framework.OnGangUpdate)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':setMetadata', function(Metadata)
    Framework.Player.Metadata = Metadata
    ESX.SetPlayerData('meta', Metadata)
end)

local isDead = false
AddEventHandler(Bridge.FrameworkPrefix .. ':onPlayerDeath', function()
    isDead = true
end)

AddEventHandler(Bridge.FrameworkPrefix .. ':onPlayerSpawn', function()
    isDead = false
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':setAccountMoney', function(account)
    if not Framework.Player.Accounts then Framework.Player.Accounts = {} end
    if account.name == 'money' then
        Framework.Player.Accounts['cash'] = account.money
    else
        Framework.Player.Accounts[account.name] = account.money
    end
end)

Framework.SetPlayerData = function(PlayerData)
    Framework.Player.Identifier = PlayerData.identifier
    Framework.Player.Name = GetPlayerName(PlayerId())
    Framework.Player.Firstname = PlayerData.firstName
    Framework.Player.Lastname = PlayerData.lastName
    Framework.Player.DateOfBirth = PlayerData.dateofbirth
    Framework.Player.Gender = PlayerData.sex
    Framework.Player.Job = Framework.Player.Job or {}
    if PlayerData.job then
        Framework.Player.Job.Name = PlayerData.job.name
        Framework.Player.Job.Label = PlayerData.job.label
        Framework.Player.Job.Duty = PlayerData.job.onDuty
        Framework.Player.Job.Boss = PlayerData.job.grade_name == 'boss' and true or false
        Framework.Player.Job.Grade = Framework.Player.Job.Grade or {}
        Framework.Player.Job.Grade.Name = PlayerData.job.grade_label
        Framework.Player.Job.Grade.Level = PlayerData.job.grade
    end
    Framework.Player.Gang = Framework.Player.Gang or {}
    if PlayerData.gang then
        Framework.Player.Gang.Name = PlayerData.gang.name
        Framework.Player.Gang.Label = PlayerData.gang.label
        Framework.Player.Gang.Boss = PlayerData.gang.grade_name == 'boss' and true or false
        Framework.Player.Gang.Grade = Framework.Player.Gang.Grade or {}
        Framework.Player.Gang.Grade.Name = PlayerData.gang.grade_label
        Framework.Player.Gang.Grade.Level = PlayerData.gang.grade
    end
    if PlayerData.accounts then
        Framework.Player.Accounts = {}
        for i = 1, #PlayerData.accounts do
            if PlayerData.accounts[i].name == 'money' then
                Framework.Player.Accounts['cash'] = PlayerData.accounts[i].money
            else
                Framework.Player.Accounts[PlayerData.accounts[i].name] = PlayerData.accounts[i].money
            end
        end
    end
    Framework.Player.Metadata = PlayerData.metadata or {}
    TriggerServerEvent(Bridge.FrameworkPrefix .. ':setPlayerData')
    pcall(Framework.OnPlayerDataUpdate)
end

Framework.OnReady(ESX, function()
    local PlayerData = ESX.GetPlayerData()
    Framework.SetPlayerData(PlayerData)
end)

Framework.CreateCallback = function(name, cb)
    local success = pcall(ESX.RegisterClientCallback, name, cb)
    if not success then RegisterClientCallback(name, cb) end
end

Framework.TriggerCallback = function(name, cb, ...)
    ESX.TriggerServerCallback(name, cb, ...)
end

Framework.SpawnVehicle = function(cb, model, coords, warp)
    local ped = PlayerPedId()
    if not coords then coords = GetEntityCoords(ped) end
    local heading = coords.w and coords.w or 0.0
    ESX.Game.SpawnVehicle(model, vector3(coords.x, coords.y, coords.z), heading, function(vehicle)
        if warp then
            while GetVehiclePedIsIn(ped, false) ~= vehicle do
                Wait(0)
                TaskWarpPedIntoVehicle(ped, vehicle, -1)
            end
        end
        cb(NetworkGetNetworkIdFromEntity(vehicle))
    end)
end

Framework.ToggleDuty = function()
    local bool = not Framework.Player.Job.Duty
    TriggerServerEvent(Bridge.FrameworkPrefix .. ':setDuty', bool)
end

Framework.Notify = function(message, type, length)
    ESX.ShowNotification(message, type, length)
end

Framework.IsPlayerDead = function()
    return isDead
end

Framework.CreateCallback(Bridge.Resource .. ':bridge:IsPlayerDead', function(cb)
    cb(Framework.IsPlayerDead())
end)

Framework.GetStatus = function(key)
    local p = promise.new()
    TriggerEvent('esx_status:getStatus', key, function(status)
        p:resolve(Framework.Round(status.val / 10000, 0))
    end)
    return Citizen.Await(p)
end

Framework.OpenSociety = function(name, type)
    if type == 'job' and (Framework.Player.Job.Name ~= name or not Framework.Player.Job.Boss) then return end
    if type == 'gang' and (Framework.Player.Gang.Name ~= name or not Framework.Player.Gang.Boss) then return end
    if type ~= 'job' and type ~= 'gang' then error('Society Type Must Be Job Or Gang', 0) return end
    TriggerEvent('esx_society:openBossMenu', name)
end
