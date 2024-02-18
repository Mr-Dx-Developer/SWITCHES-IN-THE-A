--[[
    Hi dear customer or developer, here you can fully configure your server's
    framework or you could even duplicate this file to create your own framework.

    If you do not have much experience, we recommend you download the base version
    of the framework that you use in its latest version and it will work perfectly.
]]
if Config.Framework ~= "esx" then
    return
end

local legacyEsx =
    pcall(
        function()
            ESX = exports["es_extended"]:getSharedObject()
        end
    )

if not legacyEsx then
    TriggerEvent(
        "esx:getSharedObject",
        function(obj)
            ESX = obj
        end
    )
end

identifierTypes = "identifier"
userColumns = "users"
accountsType = "accounts"
skinTable = "users"

RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
    "esx:playerLoaded",
    function(id, xPlayer)
        Citizen.Wait(500)
    end
)

function RegisterServerCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

function RegisterUsableItem(name, cb)
    ESX.RegisterUsableItem(name, cb)
end

function GetPlayerFromIdentifier(identifier)
    return ESX.GetPlayerFromIdentifier(identifier) -- attempt to get player
end

function GetPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function GetCharacterRPData(source)
    local xPlayer = GetPlayerFromId(source)
    if (xPlayer == nil) then
        return {
            firstName = Lang('UNKNOWN'),
            lastName = Lang('UNKNOWN'),
            callsign = Lang('UNKNOWN'),
            identifier = Lang('UNKNOWN')
        }
    end
    if (ESX == nil) then
        return {
            firstName = Lang('UNKNOWN'),
            lastName = Lang('UNKNOWN'),
            callsign = Lang('UNKNOWN'),
            identifier = Lang('UNKNOWN')
        }
    end
    local firstName, lastName, callsign
    local callsignres =
        MySQL.Sync.fetchAll(
            "SELECT `callsign` FROM `dispatch_callsigns` WHERE `identifier` = @identifier;",
            { ["identifier"] = xPlayer.identifier }
        )
    DebugPrint(callsignres)
    if callsignres[1] then
        callsign = callsignres[1].callsign or "UNK"
    else
        callsign = "UNK"
    end
    if xPlayer.get and xPlayer.get("firstName") and xPlayer.get("lastName") then
        firstName = xPlayer.get("firstName")
        lastName = xPlayer.get("lastName")
    else
        local result =
            MySQL.Sync.fetchAll(
                "SELECT `firstname`, `lastname` FROM `users` WHERE `identifier` = @identifier",
                { ["@identifier"] = xPlayer.identifier }
            )
        if not result[1] then
            return {
                firstName = GetPlayerName(source),
                lastName = "",
                callsign = callsign,
                identifier = xPlayer.identifier
            }
        end
        firstName, lastName = result[1]?.firstname or GetPlayerName(source), result[1]?.lastname or ""
    end
    DebugPrint({ firstName = firstName, lastName = lastName, callsign = callsign, identifier = xPlayer.identifier })
    return { firstName = firstName, lastName = lastName, callsign = callsign, identifier = xPlayer.identifier }
end

function GetJob(player)
    return GetPlayerFromId(player).job
end

function GetJobName(player)
    local playerObj = GetPlayerFromId(player)
    if playerObj and playerObj.job and playerObj.job.name then
        return playerObj.job.name
    else
        return Lang('UNKNOWN')
    end
end

function GetJobGrade(player)
    local playerObj = GetPlayerFromId(player)
    if playerObj and playerObj.job and playerObj.job.grade then
        return playerObj.job.grade
    else
        return Lang('UNKNOWN')
    end
end

function GetJobGradeName(player)
    return ""
end

function GetPlayers()
    return ESX.GetPlayers()
end

function GetPlayerIdentifier(id)
    return ESX.GetPlayerFromId(id)?.identifier
end

function GetMoney(source)
    local xPlayer = GetPlayerFromId(source)
    return xPlayer.getMoney()
end

function AddMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.addAccountMoney("money", price)
end

function RemoveMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.removeAccountMoney("money", price)
end

function GetBankMoney(source)
    local xPlayer = GetPlayerFromId(source)
    return xPlayer.getAccount("bank").money
end

function AddBankMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.addAccountMoney("bank", price)
end

function RemoveBankMoney(source, price)
    local xPlayer = GetPlayerFromId(source)
    xPlayer.removeAccountMoney("bank", price)
end

function CreateUseableItem(name, cb)
    ESX.RegisterUsableItem(name, function(playerId)
        cb(playerId)
    end)
end

function getPlayersByNameAndLastName(source, cb, data)
    DebugPrint(data)
    local namePattern = "%" .. (data.name or "") .. "%"
    local lastNamePattern = "%" .. (data.lastname or "") .. "%"
    MySQL.Async.fetchAll(
        "SELECT * FROM users WHERE firstname LIKE @name AND lastname LIKE @lastname LIMIT 90;",
        { ["@name"] = namePattern, ["@lastname"] = lastNamePattern },
        function(results)
            playersDatastore = {}
            for key, value in ipairs(results) do
                table.insert(
                    playersDatastore,
                    {
                        ["identifier"] = value["identifier"],
                        ["name"] = value["firstname"],
                        ["lastname"] = value["lastname"],
                        ["sex"] = value["sex"]
                    }
                )
            end
            cb(playersDatastore)
        end
    )
end

RegisterServerCallback("qs-dispatch:getPlayersByNameAndLastName", getPlayersByNameAndLastName)

function getPlayerByIdentifier(source, cb, data)
    DebugPrint(data)
    local playerIdentifier = data.playerID
    MySQL.Async.fetchAll(
        "SELECT * FROM users WHERE identifier = @playerIdentifier LIMIT 1;",
        { ["@playerIdentifier"] = playerIdentifier },
        function(results)
            if results[1] then
                cb(
                    {
                        ["identifier"] = results[1]["identifier"],
                        ["name"] = results[1]["firstname"],
                        ["lastname"] = results[1]["lastname"],
                        ["sex"] = results[1]["sex"]
                    }
                )
            else
                cb(nil)
            end
        end
    )
end

RegisterServerCallback("qs-dispatch:getPlayerByIdentifier", getPlayerByIdentifier)
