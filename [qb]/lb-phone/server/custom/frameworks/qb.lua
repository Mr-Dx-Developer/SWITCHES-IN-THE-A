if Config.Framework ~= "qb" then
    return
end

debugprint("Loading QB")
QB = exports["qb-core"]:GetCoreObject()
debugprint("QB loaded")

---@param source number
---@return string|nil
function GetIdentifier(source)
    return QB.Functions.GetPlayer(source)?.PlayerData.citizenid
end

---Check if a player has a phone with a specific number
---@param source any
---@param number string
---@return boolean
function HasPhoneItem(source, number)
    if not Config.Item.Require then
        return true
    end

    if Config.Item.Unique then
        return HasPhoneNumber(source, number)
    end

    if GetResourceState("ox_inventory") == "started" then
        return (exports.ox_inventory:Search(source, "count", Config.Item.Name) or 0) > 0
    elseif GetResourceState("qs-inventory") then
        local exportExists, result = pcall(function()
            return exports["qs-inventory"]:GetItemTotalAmount(source, Config.Item.Name)
        end)

        if exportExists then
            return (result or 0) > 0
        end
    end

    local qPlayer = QB.Functions.GetPlayer(source)
    local hasPhone = (qPlayer.Functions.GetItemByName(Config.Item.Name)?.amount or 0) > 0
    if not hasPhone then
        return false
    end

    return MySQL.Sync.fetchScalar("SELECT 1 FROM phone_phones WHERE id=@id AND phone_number=@number", {
        ["@id"] = GetIdentifier(source),
        ["@number"] = number
    }) ~= nil
end

---Register an item as usable
---@param item string
---@param cb function
function CreateUsableItem(item, cb)
	QB.Functions.CreateUseableItem(item, cb)
end

---Get a player's character name
---@param source any
---@return string # Firstname
---@return string # Lastname
function GetCharacterName(source)
    local ch = QB.Functions.GetPlayer(source).PlayerData.charinfo
    return ch.firstname, ch.lastname
end

---Get an array of player sources with a specific job
---@param job string
---@return table # Player sources
function GetEmployees(job)
    local employees = {}
    local players = QB.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v?.PlayerData.job.name == job and v.PlayerData.job.onduty then
            employees[#employees+1] = v.PlayerData.source
        end
    end
    return employees
end

---Get the bank balance of a player
---@param source any
---@return integer
function GetBalance(source)
    return QB.Functions.GetPlayer(source)?.Functions.GetMoney("bank") or 0
end

---Add money to a player's bank account
---@param source any
---@param amount integer
---@return boolean # Success
function AddMoney(source, amount)
    local qPlayer = QB.Functions.GetPlayer(source)
    if not qPlayer or amount < 0 then
        return false
    end

    qPlayer.Functions.AddMoney("bank", math.floor(amount + 0.5), "lb-phone")
    return true
end

---Remove money from a player's bank account
---@param source any
---@param amount integer
---@return boolean # Success
function RemoveMoney(source, amount)
    if amount < 0 or GetBalance(source) < amount then
        return false
    end

    QB.Functions.GetPlayer(source)?.Functions.RemoveMoney("bank", math.floor(amount + 0.5), "lb-phone")
    return true
end

---Send a message to a player
---@param source number
---@param message string
function Notify(source, message)
    TriggerClientEvent("QBCore:Notify", source, message)
end

-- GARAGE APP

---@param source number
---@return VehicleData[] vehicles An array of vehicles that the player owns
function GetPlayerVehicles(source)
    local vehicles = MySQL.Sync.fetchAll("SELECT * FROM player_vehicles WHERE citizenid = @citizenid", {
        ["@citizenid"] = GetIdentifier(source)
    })

    local toSend = {}

    for i = 1, #vehicles do
        local vehicle = vehicles[i] or {}
        if GetResourceState("cd_garage") == "started" then
            vehicle.state = vehicle.in_garage
            vehicle.garage = vehicle.garage_id
            vehicle.type = vehicle.garage_type
        elseif GetResourceState("loaf_garage") == "started" then
            vehicle.state = 1
        elseif GetResourceState("jg-advancedgarages") == "started" then
            vehicle.state = vehicle.in_garage
            vehicle.garage = vehicle.garage_id

            if vehicle.impound == 1 and vehicle.impound_data then
                vehicle.state = 2
                vehicle.garage = "Impound"

                local impoundInfo = json.decode(vehicle.impound_data)
                vehicle.impoundReason = impoundInfo and {
                    reason = impoundInfo.reason and #impoundInfo.reason > 0 and impoundInfo.reason or nil,
                    retrievable = ConvertJSTimestamp and ConvertJSTimestamp(impoundInfo.retrieval_date) or nil,
                    price = impoundInfo.retrieval_cost,
                    impounder = impoundInfo.charname
                }
            end
        elseif GetResourceState("qs-advancedgarages") == "started" then
            if vehicle.type == "vehicle" then
                vehicle.type = "car"
            end
        end

        local location = "unknown"
        if vehicle.state == 0 then
            location = "out"
        elseif vehicle.state == 1 or vehicle.state == true then
            location = vehicle.garage or "Garage"
        elseif vehicle.state == 2 then
            location = vehicle.garage or "Impound"
        end

        local newCar = {
            plate = vehicle.plate,
            type = QB.Shared.Vehicles[vehicle.hash]?.category or vehicle.type or "car",
            location = location,
            impounded = vehicle.state == 2,
            statistics = {
                engine = math.floor(vehicle.engine / 10 + 0.5),
                body = math.floor(vehicle.body / 10 + 0.5),
                fuel = vehicle.fuel
            },
            impoundReason = vehicle.impoundReason
        }

        newCar.model = tonumber(vehicle.hash)

        toSend[#toSend+1] = newCar
    end

    return toSend
end

---Get a specific vehicle
---@param source number
---@param plate string
---@return table? vehicleData
function GetVehicle(source, plate)
    local storedColumn, storedValue, outValue = "state", 1, 0
    if GetResourceState("cd_garage") == "started" or GetResourceState("jg-advancedgarages") == "started" then
        storedColumn = "in_garage"
    end

    local res = MySQL.Sync.fetchAll(([[
        SELECT plate, mods, `hash`, fuel
        FROM player_vehicles
        WHERE citizenid = @citizenid AND plate = @plate AND `%s`=@stored
    ]]):format(storedColumn), {
        ["@citizenid"] = GetIdentifier(source),
        ["@plate"] = plate,
        ["@stored"] = storedValue
    })

    local vehicle = res[1]
    if not vehicle then
        return
    end

    MySQL.Async.execute(("UPDATE player_vehicles SET `%s`=@outValue WHERE plate=@plate"):format(storedColumn), {
        ["@plate"] = plate,
        ["@outValue"] = outValue
    })

    vehicle.model = tonumber(vehicle.hash)

    return vehicle
end

-- todo
function IsAdmin(source)
    return IsPlayerAceAllowed(source, "command.lbphone_admin") == 1
end

QB.Commands.Add("toggleverified", "Toggle verified for a user profile", {
    {
        name = "app",
        help = "The app: trendy, instapic or birdy"
    },
    {
        name = "username",
        help = "The profile username"
    },
    {
        name = "verified",
        help = "The verified state, 1 or 0"
    }
}, true, function(_, args)
    local app, username, verified = args[1], args[2], tonumber(args[3])

    local allowedApps = {
        ["twitter"] = true,
        ["instagram"] = true,
        ["tiktok"] = true,
        ["birdy"] = true,
        ["trendy"] = true,
        ["instapic"] = true
    }

    if not allowedApps[app:lower()] or (not username) or (verified ~= 1 and verified ~= 0) then
        return
    end

    ToggleVerified(app, username, verified == 1)
end, "admin")

QB.Commands.Add("changepassword", "Change a user's password", {
    {
        name = "app",
        help = "The app: trendy, instapic or birdy"
    },
    {
        name = "username",
        help = "The profile username"
    },
    {
        name = "password",
        help = "The new password"
    }
}, true, function(_, args)
    local app, username, password = args[1], args[2], args[3]

    local allowedApps = {
        ["twitter"] = true,
        ["instagram"] = true,
        ["tiktok"] = true,
        ["birdy"] = true,
        ["trendy"] = true,
        ["instapic"] = true
    }

    if not allowedApps[app:lower()] then
        return
    end

    if not username then
        return
    end

    if not password then
        return
    end

    ChangePassword(app, username, password)
end, "admin")

-- Company / services app

---@param source number
---@return string
function GetJob(source)
    return QB.Functions.GetPlayer(source)?.PlayerData.job.name or "unemployed"
end

function RefreshCompanies()
    local openJobs = {}
    local players = QB.Functions.GetQBPlayers()

    for _, v in pairs(players) do
        if not v?.PlayerData.job.onduty then
            goto continue
        end

        local job = v.PlayerData.job.name

        if not openJobs[job] then
            openJobs[job] = true
        end

        ::continue::
    end

    for i = 1, #Config.Companies.Services do
        local jobData = Config.Companies.Services[i]

        Config.Companies.Services[i].open = openJobs[jobData.job] or false
    end
end

lib.RegisterCallback("phone:services:getPlayerData", function(_, cb, player)
    local first, last = GetCharacterName(player)

    cb({
        name = first .. " " .. last,
        id = GetIdentifier(player),
    })
end)

local function getSocietyMoney(job)
    local success, res = pcall(function()
        return exports["qb-management"]:GetAccount(job)
    end)

    if success then
        return res
    end

    return exports["qb-banking"]:GetAccountBalance(job)
end

lib.RegisterCallback("phone:services:getAccount", function(source, cb)
    local job = GetJob(source)

    cb(getSocietyMoney(job))
end)

lib.RegisterCallback("phone:services:addMoney", function(source, cb, amount)
    local job = GetJob(source)

    if amount < 0 or GetBalance(source) < amount then
        return false
    end

    local success, _ = pcall(function()
        return exports["qb-management"]:AddMoney(job, amount)
    end)

    if success or exports["qb-banking"]:AddMoney(job, amount) then
        RemoveMoney(source, amount)
    end

    cb(getSocietyMoney(job))
end)

lib.RegisterCallback("phone:services:removeMoney", function(source, cb, amount)
    local job = GetJob(source)

    if amount < 0 or getSocietyMoney(job) < amount then
        return
    end

    local success, res = pcall(function()
        return exports["qb-management"]:RemoveMoney(job, amount)
    end)

    if not success then
        res = exports["qb-banking"]:RemoveMoney(job, amount)
    end

    if res then
        AddMoney(source, amount)
    end

    cb(getSocietyMoney(job))
end)

if Config.QBMailEvent then
    local function sendQBMail(phoneNumber, data)
        if not phoneNumber then
            return
        end

        local address = exports["lb-phone"]:GetEmailAddress(phoneNumber)

        if not address then
            return
        end

        local actions
        if data.button?.enabled then
            actions = {
                {
                    label = "button",
                    data = {
                        event = data.button.buttonEvent,
                        isServer = false,
                        data = {
                            qbMail = true,
                            data = data.button.buttonData
                        }
                    }
                }
            }
        end

        exports["lb-phone"]:SendMail({
            to = address,
            sender = data.sender,
            subject = data.subject,
            message = data.message,
            actions = actions
        })
    end

    RegisterNetEvent("qb-phone:server:sendNewMail", function(data)
        local phoneNumber = GetEquippedPhoneNumber(source)

        sendQBMail(phoneNumber, data)
    end)

    RegisterNetEvent("qb-phone:server:sendNewMailToOffline", function(citizenid, data)
        local phoneNumber = GetEquippedPhoneNumber(citizenid)

        sendQBMail(phoneNumber, data)
    end)

    AddEventHandler("__cfx_export_qb-phone_sendNewMailToOffline", function(citizenid, data)
        local phoneNumber = GetEquippedPhoneNumber(citizenid)

        sendQBMail(phoneNumber, data)
    end)
end

if Config.Crypto.QBit then
    lib.RegisterCallback("phone:crypto:getOtherQBitWallet", function(source, cb, otherNumber)
        local otherSrc = GetSourceFromNumber(otherNumber)
        if not otherSrc then
            return cb(false)
        end

        local otherPlayer = QB.Functions.GetPlayer(otherSrc)
        if not otherPlayer then
            return cb(false)
        end

        cb(otherPlayer.PlayerData.metadata.walletid)
    end)
end
