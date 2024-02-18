QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    local char = Config.PlateLetters
    char = char + Config.PlateNumbers
    if Config.PlateUseSpace then
        char = char + 1
    end

    if char > 8 then
        print('[Core Credits] Plate exceeds 8 characters! Please fix that in config ')
    end
end)

function setCredits(citizenid, credits)
    exports.oxmysql:update("UPDATE `players` SET `credits`= :credits WHERE `citizenid` = :citizenid", {
        ["credits"] = credits,
        ["citizenid"] = citizenid
    }, function()
    end)
end

function getTasks(citizenid)
    local tasks = ""

    tasks = exports.oxmysql:scalarSync("SELECT `tasks` FROM players WHERE citizenid = :citizenid ", {
        ["citizenid"] = citizenid
    })

    if json.decode(tasks) == nil then
        tasks = {}
    else
        tasks = json.decode(tasks)
    end

    return tasks
end

function getWinnings(citizenid)
    local winnings = ""

    winnings = exports.oxmysql:scalarSync("SELECT `winnings` FROM players WHERE citizenid = :citizenid ", {
        ["citizenid"] = citizenid
    })

    if json.decode(winnings) == nil then
        winnings = {}
    else
        winnings = json.decode(winnings)
    end

    return winnings
end

function getCredits(citizenid)
    return tonumber(exports.oxmysql:scalarSync("SELECT `credits` FROM players WHERE citizenid = :citizenid ", {
        ["citizenid"] = citizenid
    }))
end

exports('getCredits', getCredits)

function giveCredits(citizenid, credits)
    exports.oxmysql:update("UPDATE `players` SET `credits`= `credits` + :credits WHERE `citizenid` = :citizenid", {
        ["credits"] = credits,
        ["citizenid"] = citizenid
    }, function()
    end)
end

exports('giveCredits', giveCredits)

QBCore.Functions.CreateCallback('core_credits:exchange', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:scalar("SELECT `winnings` FROM players WHERE citizenid = :citizenid ", {
        ["citizenid"] = Player.PlayerData.citizenid
    }, function(data)
        local winnings = json.decode(data)

        if winnings[item] > 1 then
            winnings[item] = winnings[item] - 1
        else
            winnings[item] = nil
        end

        exports.oxmysql:update("UPDATE `players` SET `winnings`= :item WHERE `citizenid` = :citizenid", {
            ["item"] = json.encode(winnings),
            ["citizenid"] = Player.PlayerData.citizenid
        }, function()
            giveCredits(Player.PlayerData.citizenid, Config.CaseOpeningItems[item].exchange)
            TriggerClientEvent("core_credits:sendMessage", src, Config.Text["item_exchanged"])
            TriggerClientEvent("core_credits:updateCredits", src)
            cb(true)
        end)
    end)
end)

QBCore.Functions.CreateCallback('core_credits:redeem', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:scalar("SELECT `winnings` FROM players WHERE citizenid = :citizenid ", {
        ["citizenid"] = Player.PlayerData.citizenid
    }, function(data)
        local winnings = json.decode(data)

        if winnings[item] > 1 then
            winnings[item] = winnings[item] - 1
        else
            winnings[item] = nil
        end

        exports.oxmysql:update("UPDATE `players` SET `winnings`= :item WHERE `citizenid` = :citizenid", {
            ["item"] = json.encode(winnings),
            ["citizenid"] = Player.PlayerData.citizenid
        }, function()
            local caseItem = Config.CaseOpeningItems[item]

            if caseItem.type == "car" then
                local plate = ""

                for i = 1, Config.PlateNumbers do
                    plate = plate .. tostring(math.random(0, 9))
                end

                if Config.PlateUseSpace then
                    plate = plate .. " "
                end

                for i = 1, Config.PlateLetters do
                    plate = plate .. string.char(math.random(97, 122))
                end

                local mods =
                    '{"neonEnabled":[false,false,false,false],"modFrame":-1,"modEngine":3,"engineHealth":1000.0,"modSideSkirt":-1,"modFrontBumper":-1,"modOrnaments":-1,"health":995,"modGrille":-1,"modTransmission":2,"plate":"' ..
                        plate ..
                        '","modTrimB":-1,"fuelLevel":45.91801071167,"modDoorSpeaker":-1,"windows":[1,false,false,false,false,1,1,1,1,false,1,false,false],"modSpeakers":-1,"modAerials":-1,"modTurbo":1,"pearlescentColor":67,"modVanityPlate":-1,"modSpoilers":-1,"modAirFilter":-1,"modArchCover":-1,"tyreSmokeColor":[255,255,255],"modEngineBlock":-1,"modHood":-1,"modRightFender":-1,"bodyHealth":997.25,"dirtLevel":4.0228095054626,"wheels":0,"modPlateHolder":-1,"modBrakes":2,"wheelColor":156,"modSteeringWheel":-1,"modFender":-1,"color2":62,"color1":9,"neonColor":[255,0,255],"modExhaust":-1,"modDial":-1,"model":' ..
                        GetHashKey(caseItem.model) ..
                        ',"plateIndex":1,"windowTint":3,"modBackWheels":-1,"tyres":[false,false,false,false,false,false,false],"modTank":-1,"modHydrolic":-1,"modSmokeEnabled":1,"modRearBumper":-1,"modArmor":4,"modFrontWheels":-1,"modRoof":-1,"extras":[],"modAPlate":-1,"modXenon":1,"modLivery":-1,"modDashboard":-1,"modShifterLeavers":-1,"modTrimA":-1,"modTrunk":-1,"modHorns":-1,"modSeats":-1,"modSuspension":3,"modStruts":-1,"modWindows":-1,"doors":[false,false,false,false,false,false]}'

                exports.oxmysql:update(
                    "INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, fuel, engine, body, state) VALUES (:owner, :citizenid, :vehicle, :hash, :mods, :plate, :fuel, :engine, :body, :state)",
                    {
                        ["citizenid"] = Player.PlayerData.citizenid,
                        ["plate"] = plate,
                        ["mods"] = mods,
                        ["license"] = '',
                        ["hash"] = GetHashKey(caseItem.model),
                        ["vehicle"] = caseItem.model,
                        ["fuel"] = 100,
                        ["body"] = 1000,
                        ["engine"] = 1000,
                        ["state"] = 1

                    }, function(rowsChanged)
                    end)
            elseif caseItem.type == "item" then

                Player.Functions.AddItem(caseItem.item, caseItem.count)
            elseif caseItem.type == "weapon" then
                Player.Functions.AddItem(caseItem.weapon, 1)
            elseif caseItem.type == "money" then
                Player.Functions.AddMoney("bank", caseItem.money)
            elseif caseItem.type == "credits" then
                giveCredits(Player.PlayerData.citizenid, caseItem.credits)
            else
                TriggerClientEvent("core_credits:sendMessage", src, "Item type does not exist")
            end

            TriggerClientEvent("core_credits:sendMessage", src, Config.Text["item_redeemed"])
            TriggerClientEvent("core_credits:updateCredits", src)
            cb(true)
        end)
    end)
end)

RegisterServerEvent("core_credits:taskCompleted")
AddEventHandler("core_credits:taskCompleted", function(task)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("core_credits:sendMessage", src, Config.Text["task_completed"])
    giveCredits(Player.PlayerData.citizenid, task.reward)
    TriggerClientEvent("core_credits:updateCredits", src)
end)

RegisterServerEvent("core_credits:updateTasks")
AddEventHandler("core_credits:updateTasks", function(tasks)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:update("UPDATE `players` SET `tasks_completed`= :tasks WHERE `citizenid` = :citizenid", {
        ["tasks"] = json.encode(tasks),
        ["citizenid"] = Player.PlayerData.citizenid
    }, function()
    end)
end)

RegisterServerEvent("core_credits:addWinning")
AddEventHandler("core_credits:addWinning", function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:scalar("SELECT `winnings` FROM players WHERE citizenid = :citizenid ", {
        ["citizenid"] = Player.PlayerData.citizenid
    }, function(data)
        local winnings = json.decode(data)

        if winnings == nil then
            winnings = {}
        end

        if not winnings[item] then
            winnings[item] = 0
        end
        winnings[item] = winnings[item] + 1

        exports.oxmysql:update("UPDATE `players` SET `winnings`= :item WHERE `citizenid` = :citizenid", {
            ["item"] = json.encode(winnings),
            ["citizenid"] = Player.PlayerData.citizenid
        }, function()
            TriggerClientEvent("core_credits:updateCredits", src)
        end)
    end)
end)

RegisterServerEvent("core_credits:removeCredits")
AddEventHandler("core_credits:removeCredits", function(c)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    setCredits(Player.PlayerData.citizenid, getCredits(Player.PlayerData.citizenid) - c)
end)

RegisterServerEvent("core_credits:progressTask")
AddEventHandler("core_credits:progressTask", function(task, progress)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local tasks = exports.oxmysql:scalarSync("SELECT `tasks` FROM players WHERE citizenid = :citizenid ", {
        ["citizenid"] = Player.PlayerData.citizenid
    })

    if json.decode(tasks) == nil then
        tasks = {}
    else
        tasks = json.decode(tasks)
    end

    if tasks[task] then
        tasks[task] = tasks[task] + progress
    else
        tasks[task] = progress
    end

    exports.oxmysql:update("UPDATE `players` SET `tasks`= :tasks WHERE `citizenid` = :citizenid", {
        ["tasks"] = json.encode(tasks),
        ["citizenid"] = Player.PlayerData.citizenid
    }, function()
    end)
end)

RegisterServerEvent("core_credits:buyItem")
AddEventHandler("core_credits:buyItem", function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local shopItem = Config.Shop[item]

    local credits = getCredits(Player.PlayerData.citizenid)

    if shopItem.price <= credits then
        if shopItem.type == "car" then
            local plate = ""

            for i = 1, Config.PlateNumbers do
                plate = plate .. tostring(math.random(0, 9))
            end

            if Config.PlateUseSpace then
                plate = plate .. " "
            end

            for i = 1, Config.PlateLetters do
                plate = plate .. string.char(math.random(97, 122))
            end
            local mods =
                '{"neonEnabled":[false,false,false,false],"modFrame":-1,"modEngine":3,"engineHealth":956.921875,"modSideSkirt":-1,"modFrontBumper":-1,"modOrnaments":-1,"health":995,"modGrille":-1,"modTransmission":2,"plate":"' ..
                    plate ..
                    '","modTrimB":-1,"fuelLevel":45.91801071167,"modDoorSpeaker":-1,"windows":[1,false,false,false,false,1,1,1,1,false,1,false,false],"modSpeakers":-1,"modAerials":-1,"modTurbo":1,"pearlescentColor":67,"modVanityPlate":-1,"modSpoilers":-1,"modAirFilter":-1,"modArchCover":-1,"tyreSmokeColor":[255,255,255],"modEngineBlock":-1,"modHood":-1,"modRightFender":-1,"bodyHealth":997.25,"dirtLevel":4.0228095054626,"wheels":0,"modPlateHolder":-1,"modBrakes":2,"wheelColor":156,"modSteeringWheel":-1,"modFender":-1,"color2":62,"color1":9,"neonColor":[255,0,255],"modExhaust":-1,"modDial":-1,"model":' ..
                    GetHashKey(shopItem.model) ..
                    ',"plateIndex":1,"windowTint":3,"modBackWheels":-1,"tyres":[false,false,false,false,false,false,false],"modTank":-1,"modHydrolic":-1,"modSmokeEnabled":1,"modRearBumper":-1,"modArmor":4,"modFrontWheels":-1,"modRoof":-1,"extras":[],"modAPlate":-1,"modXenon":1,"modLivery":-1,"modDashboard":-1,"modShifterLeavers":-1,"modTrimA":-1,"modTrunk":-1,"modHorns":-1,"modSeats":-1,"modSuspension":3,"modStruts":-1,"modWindows":-1,"doors":[false,false,false,false,false,false]}'

            exports.oxmysql:update(
                "INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, fuel, engine, body, state) VALUES (:owner, :citizenid, :vehicle, :hash, :mods, :plate, :fuel, :engine, :body, :state)",
                {
                    ["citizenid"] = Player.PlayerData.citizenid,
                    ["plate"] = plate,
                    ["mods"] = mods,
                    ["license"] = '',
                    ["hash"] = GetHashKey(shopItem.model),
                    ["vehicle"] = shopItem.model,
                    ["fuel"] = 100,
                    ["body"] = 1000,
                    ["engine"] = 1000,
                    ["state"] = 1

                }, function(rowsChanged)
                end)
        elseif shopItem.type == "item" then
            Player.Functions.AddItem(shopItem.item, shopItem.count)
        elseif shopItem.type == "weapon" then
            Player.Functions.AddItem(shopItem.weapon, 1)
        elseif shopItem.type == "money" then
            Player.Functions.AddMoney("bank", shopItem.money)

        else
            TriggerClientEvent("core_credits:sendMessage", src, "Item type does not exist")
        end

        TriggerClientEvent("core_credits:sendMessage", src, Config.Text["item_purschased"])
        setCredits(Player.PlayerData.citizenid, credits - shopItem.price)
        Wait(500)
        TriggerClientEvent("core_credits:updateCredits", src)
    else
        TriggerClientEvent("core_credits:sendMessage", src, Config.Text["not_enough_credits"])
    end
end)

QBCore.Functions.CreateCallback("core_credits:getInfo", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    exports.oxmysql:query("SELECT * FROM players WHERE citizenid = :citizenid ", {
        ["citizenid"] = Player.PlayerData.citizenid
    }, function(data)
        data = data[1]

        if json.decode(data.tasks) == nil then
            data.tasks = {}
        else
            data.tasks = json.decode(data.tasks)
        end

        if json.decode(data.winnings) == nil then
            data.winnings = {}
        else
            data.winnings = json.decode(data.winnings)
        end

        if json.decode(data.tasks_completed) == nil then
            data.tasks_completed = {}
        else
            data.tasks_completed = json.decode(data.tasks_completed)
        end

        cb({
            credits = data.credits,
            tasks = data.tasks,
            winnings = data.winnings,
            tasks_completed = data.tasks_completed
        })
    end)
end)

RegisterCommand("givecreditsrcon", function(source, args, rawCommand)
    if source == 0 then
        if args[1] ~= nil and args[2] ~= nil then
            local citizen = args[1]
            if Config.OfflineMode then
                local Player = QBCore.Functions.GetPlayer(args[1])
                citizen = Player.PlayerData.citizenid
            end
            giveCredits(citizen, tonumber(args[2]))
            print("Success!")
        else
            print("Wrong syntax")
        end
    end
end, false)

RegisterCommand("setcreditsrcon", function(source, args, rawCommand)
    if source == 0 then
        if args[1] ~= nil and args[2] ~= nil then
            local citizen = args[1]
            if Config.OfflineMode then
                local Player = QBCore.Functions.GetPlayer(args[1])
                citizen = Player.PlayerData.citizenid
            end
            setCredits(citizen, tonumber(args[2]))
            print("Success!")
        else
            print("Wrong syntax")
        end
    end
end, false)

RegisterCommand("givecredits", function(source, args, rawCommand)
    if source ~= 0 then
        local Player = QBCore.Functions.GetPlayer(source)

        if QBCore.Functions.HasPermission(source, 'god') then
            if args[1] ~= nil then
                local Target = QBCore.Functions.GetPlayer(tonumber(args[1]))
                if Target ~= nil then
                    if args[2] ~= nil then
                        giveCredits(Target.PlayerData.citizenid, tonumber(args[2]))
                    else
                        TriggerClientEvent("core_credits:sendMessage", source, Config.Text["wrong_usage"])
                    end
                else
                    TriggerClientEvent("core_credits:sendMessage", source, Config.Text["wrong_usage"])
                end
            else
                TriggerClientEvent("core_credits:sendMessage", source, Config.Text["wrong_usage"])
            end
        else
            TriggerClientEvent("core_credits:sendMessage", source, Config.Text["wrong_usage"])
        end
    end
end, false)

RegisterCommand("setcredits", function(source, args, rawCommand)
    if source ~= 0 then
        local Player = QBCore.Functions.GetPlayer(source)

        if QBCore.Functions.HasPermission(source, 'god') then
            if args[1] ~= nil then
                local Target = QBCore.Functions.GetPlayer(tonumber(args[1]))
                if Target ~= nil then
                    if args[2] ~= nil then
                        setCredits(Target.PlayerData.citizenid, tonumber(args[2]))
                    else
                        TriggerClientEvent("core_credits:sendMessage", source, Config.Text["wrong_usage"])
                    end
                else
                    TriggerClientEvent("core_credits:sendMessage", source, Config.Text["wrong_usage"])
                end
            else
                TriggerClientEvent("core_credits:sendMessage", source, Config.Text["wrong_usage"])
            end
        else
            TriggerClientEvent("core_credits:sendMessage", source, Config.Text["wrong_usage"])
        end
    end
end, false)
