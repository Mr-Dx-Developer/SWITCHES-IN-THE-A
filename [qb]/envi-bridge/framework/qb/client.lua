module 'shared/debug'
module 'shared/resource'
module 'shared/utils'
module 'shared/player'

QBCore = nil
Version = resource.version(Bridge.FrameworkName)

Citizen.CreateThreadNow(function()
    IsExport, QBCore = pcall(function()
        return exports[Bridge.FrameworkName]:GetCoreObject()
    end)

    if not IsExport then
        while not QBCore do
            TriggerEvent(Bridge.FrameworkEvent, function(obj) QBCore = obj end)
            Wait(500)
        end
    end
end)

Bridge.Debug('Framework', 'QBCore', Version)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Client:UpdateObject', function()
    QBCore = exports[Bridge.FrameworkName]:GetCoreObject()
    for k, v in pairs(QBCore.Shared.Items) do
        local item = {}
        if not v.name then v.name = k end
        item.name = v.name
        item.label = v.label
        item.description = v.description
        item.stack = not v.unique and true
        item.weight = v.weight or 0
        item.close = v.shouldClose == nil and true or v.shouldClose
        item.image = v.image
        item.type = v.type
        Framework.Items[v.name] = item
    end
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Client:OnPlayerLoaded', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    Framework.SetPlayerData(PlayerData)
    pcall(Framework.OnPlayerLoaded)
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Client:OnPlayerUnload', function()
    Framework.Player = {}
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

Framework.OnReady(QBCore, function()
    Framework.SetPlayerData(QBCore.Functions.GetPlayerData())
end)

Framework.CreateCallback = function(name, cb)
    QBCore.Functions.CreateClientCallback(name, cb)
end

Framework.TriggerCallback = function(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb, ...)
end

Framework.SpawnVehicle = function(cb, model, coords, warp)
    Framework.TriggerCallback(Bridge.FrameworkPrefix .. ':Server:SpawnVehicle', cb, model, coords, warp)
end

Framework.ToggleDuty = function()
    TriggerServerEvent(Bridge.FrameworkPrefix .. ':ToggleDuty')
end

Framework.Notify = function(message, type, length)
    if type == "info" then type = 'primary' end
    QBCore.Functions.Notify(message, type, length)
end

Framework.IsPlayerDead = function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    return (PlayerData.metadata['isdead'] or PlayerData.metadata['inlaststand'])
end

Framework.GetStatus = function(key)
    local PlayerData = QBCore.Functions.GetPlayerData()
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