---@diagnostic disable: duplicate-set-field
---@diagnostic disable: duplicate-doc-field

if GetResourceState('qb-core') ~= 'started' then return end

Framework = { name = 'qb-core' }
local sharedObject = exports['qb-core']:GetCoreObject()
Framework.object = sharedObject

function Framework.isPlayerLoaded()
    return next(sharedObject.Functions.GetPlayerData()) ~= nil
end

Framework.onPlayerLoaded = function(cb)
    if Framework.isPlayerLoaded() then
        cb()
    end

    AddEventHandler('QBCore:Client:OnPlayerLoaded', cb)
end

Framework.onPlayerLogout = function(cb)
    AddEventHandler('QBCore:Client:OnPlayerUnload', cb)
end

function Framework.getJob()
    if not Framework.isPlayerLoaded() then
        return false
    end

    return sharedObject.Functions.GetPlayerData().job.name
end

function Framework.getJobGrade()
    return sharedObject.Functions.GetPlayerData().job.grade.level
end

Framework.hasItem = sharedObject.Functions.HasItem

Framework.getInventory = function()
    return sharedObject.Functions.GetPlayerData().items
end

function Framework.spawnVehicle(model, coords, heading, cb)
    sharedObject.Functions.SpawnVehicle(model, cb, vector4(coords.x, coords.y, coords.z, heading), true)
end

function Framework.spawnLocalVehicle(model, coords, heading, cb)
    sharedObject.Functions.SpawnVehicle(model, cb, vector4(coords.x, coords.y, coords.z, heading), false)
end

Framework.getIdentifier = function()
    local playerData = sharedObject.GetPlayerData()
    return playerData.citizenid
end

Framework.deleteVehicle = sharedObject.Functions.DeleteVehicle

Framework.getPlayersInArea = sharedObject.Functions.GetPlayersFromCoords