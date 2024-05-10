---@diagnostic disable: duplicate-set-field
---@diagnostic disable: duplicate-doc-field

if GetResourceState('qb-core') ~= 'started' then return end

Framework = { name = 'qb-core' }
local sharedObject = exports['qb-core']:GetCoreObject()
Framework.object = sharedObject
QBCore = sharedObject
---@class Player
---@field source number
---@field QBPlayer any
local player = {}

function Framework.getPlayerFromId(id)
    local player = setmetatable({}, { __index = player })
    player.QBPlayer = sharedObject.Functions.GetPlayer(id)

    if not player.QBPlayer then return end

    player.source = id

    return player
end

function Framework.getPlayerFromIdentifier(identifier)
    local player = setmetatable({}, { __index = player })
    player.QBPlayer = sharedObject.Functions.GetPlayerByCitizenId(identifier)

    if not player.QBPlayer then return end

    player.source = player.QBPlayer.PlayerData.source

    return player
end

Framework.registerUsableItem = sharedObject.Functions.CreateUseableItem

Framework.getPlayers = sharedObject.Functions.GetQBPlayers

local ox_inventory = GetResourceState('ox_inventory') == 'started'
local qs_inventory = GetResourceState('qs-inventory') == 'started'

function Framework.getItemLabel(item)
    if ox_inventory then
        return exports.ox_inventory:Items()[item]?.label
    elseif qs_inventory then
        return exports['qs-inventory']:GetItemList()[item]?.label
    end
    return sharedObject.Shared.Items[item]?.label
end

function Framework.getItems()
    if ox_inventory then
        return exports.ox_inventory:Items()
    elseif qs_inventory then
        return exports['qs-inventory']:GetItemList()
    end
    return sharedObject.Shared.Items
end

function player:hasGroup(name)
    return sharedObject.Functions.HasPermission(self.source, name) == name
end

function player:hasOneOfGroups(groups)
    for k,v in pairs(groups) do
        if sharedObject.Functions.HasPermission(self.source, k) then
            return true
        end
    end

    return false
end

function player:addItem(name, count)
    if ox_inventory then
        exports.ox_inventory:AddItem(self.source, name, count or 1)
    else
        self.QBPlayer.Functions.AddItem(name, count or 1)
    end
end

function player:removeItem(name, count)
    if ox_inventory then
        exports.ox_inventory:RemoveItem(self.source, name, count or 1)
    else
        self.QBPlayer.Functions.RemoveItem(name, count or 1)
    end
end

function player:canCarryItem(name, count)
    if ox_inventory then
        exports.ox_inventory:CanCarryItem(self.source, name, count or 1)
    end

    -- No equivalent for QBCore
    return true
end

function player:getItemCount(name)
    if ox_inventory then
        return exports.ox_inventory:GetItemCount(self.source, name)
    else
        return self.QBPlayer.Functions.GetItemByName(name)?.amount or 0
    end
end

function player:hasItem(name)
    return self:getItemCount(name) > 0
end

function player:getAccountMoney(account)
    if account == 'money' then
        return self.QBPlayer.Functions.GetMoney('cash')
    else
        return self.QBPlayer.Functions.GetMoney(account)
    end
end

function player:addAccountMoney(account, amount)
    if account == 'money' then
        self.QBPlayer.Functions.AddMoney('cash', amount)
    else
        self.QBPlayer.Functions.AddMoney(account, amount)
    end
end

function player:removeAccountMoney(account, amount)
    if account == 'money' then
        self.QBPlayer.Functions.RemoveMoney('cash', amount)
    else
        self.QBPlayer.Functions.RemoveMoney(account, amount)
    end
end

function player:getJob()
    return self.QBPlayer.PlayerData.job.name
end

function player:getJobGrade()
    return self.QBPlayer.PlayerData.job.grade.level
end

function player:setJob(name, grade)
    return self.QBPlayer.Functions.SetJob(name, grade)
end

function player:setDuty(value)
    return self.QBPlayer.Functions.SetJobDuty(value)
end

function player:getIdentifier()   
    return self.QBPlayer.PlayerData.citizenid
end

function player:getFirstName()
    return self.QBPlayer.PlayerData.charinfo.firstname
end

function player:getLastName()
    return self.QBPlayer.PlayerData.charinfo.lastname
end