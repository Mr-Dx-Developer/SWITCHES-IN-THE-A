local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

QBCore = exports['qb-core']:GetCoreObject()

local job = ""
local PlayerLoaded = false
local actionInProgress = false

Citizen.CreateThread(function()

    while QBCore.Functions.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    job = QBCore.Functions.GetPlayerData().job.name
    PlayerLoaded = true
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(JobInfo)
    job = JobInfo.name
end)

RegisterNUICallback("exchange", function(data)
    if not actionInProgress then
        actionInProgress = true
        Citizen.Wait(200)
        local item = data['item']
        QBCore.Functions.TriggerCallback('core_credits:exchange', function(data)
            actionInProgress = false
        end, item)
    end
end)

RegisterNUICallback("redeem", function(data)
    if not actionInProgress then
        actionInProgress = true
        Citizen.Wait(200)
        local item = data['item']
        QBCore.Functions.TriggerCallback('core_credits:redeem', function(data)
            actionInProgress = false
        end, item)
    end
end)

RegisterNUICallback("removeCredits", function(data)
    TriggerServerEvent("core_credits:removeCredits", data["credits"])
end)

RegisterNUICallback("openedTasks", function(data)
    QBCore.Functions.TriggerCallback("core_credits:getInfo", function(info)
        for k, v in pairs(Config.Tasks) do
            if not info.tasks_completed[k] then
                if info.tasks[v.type] == nil then
                    info.tasks[v.type] = 0
                end
                if info.tasks[v.type] >= v.value then
                    info.tasks_completed[k] = true
                    TriggerServerEvent("core_credits:taskCompleted", v)
                    SendNUIMessage({
                        type = "completed"
                    })
                else
                    info.tasks_completed[k] = false
                end
            end
        end

        TriggerServerEvent("core_credits:updateTasks", info.tasks_completed)
    end)
end)

RegisterNUICallback("buyItem", function(data)
    TriggerServerEvent("core_credits:buyItem", data["item"])
end)

RegisterNUICallback("sendMessage", function(data)
    SendTextMessage(Config.Text[data["message"]])
end)

RegisterNUICallback("addWinning", function(data)
    TriggerServerEvent("core_credits:addWinning", data["item"])
end)

RegisterNUICallback("close", function(data)
    TriggerScreenblurFadeOut(1000)
    SetNuiFocus(false, false)
end)

RegisterNetEvent("core_credits:updateCredits")
AddEventHandler("core_credits:updateCredits", function()
    QBCore.Functions.TriggerCallback("core_credits:getInfo", function(info)
        SendNUIMessage({
            type = "credits",
            credits = info.credits,
            task_progress = info.tasks,
            winnings = info.winnings
        })
    end)
end)

RegisterNetEvent("core_credits:sendMessage")
AddEventHandler("core_credits:sendMessage", function(msg)
    SendTextMessage(msg)
end)

function openCredits()
    QBCore.Functions.TriggerCallback("core_credits:getInfo", function(info)
        SendNUIMessage({
            type = "credits",
            credits = info.credits,
            task_progress = info.tasks,
            winnings = info.winnings
        })
    end)

    SetNuiFocus(true, true)
    TriggerScreenblurFadeIn(1000)

    SendNUIMessage({
        type = "open",
        name = string.upper(GetPlayerName(PlayerId())),
        shop_categories = Config.ShopCategories,
        citizenid = QBCore.Functions.GetPlayerData().citizenid,
        lowest_bet = Config.LowestBet,
        header = string.upper(Config.BuyCreditsLink),
        description = Config.BuyCreditsDescription,
        shop_items = Config.Shop,
        shop_def = Config.DefaultCategory,
        tasks = Config.Tasks,
        caseopening_items = Config.CaseOpeningItems
    })
end

RegisterCommand(Config.OpenCommand, function()
    openCredits()
end)

RegisterNetEvent("core_credits:open", function ()
	openCredits()
end)

RegisterKeyMapping(Config.OpenCommand, "Open Credits Menu", "keyboard", Config.OpenKey)

exports('openCredits', openCredits)

local lastrun, run, running = 0, 0, false
local lastdrive, drive, driving = 0, 0, false
local lastfly, fly, flying = 0, 0, false

Citizen.CreateThread(function()
    local cord = GetEntityCoords(PlayerPedId())
    lastrun = cord
    lastdrive = cord

    while true do
        Citizen.Wait(1000)
        if PlayerLoaded then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local speed = GetEntitySpeed(ped)

            if speed > 6.0 and IsPedOnFoot(ped) then
                run = run + #(coords - lastrun)
                lastrun = coords
                running = true
            else
                if running then
                    running = false
                    TriggerServerEvent("core_credits:progressTask", "run", round(run) / 1000)
                    run = 0
                end

                lastrun = coords
            end

            if speed > 10.0 and IsPedInAnyVehicle(ped, false) then
                if IsVehicleOnAllWheels(GetVehiclePedIsIn(ped, false)) then
                    drive = drive + #(coords - lastdrive)
                    lastdrive = coords
                    driving = true
                end
            else
                if driving then
                    driving = false
                    TriggerServerEvent("core_credits:progressTask", "drive", round(drive) / 1000)
                    drive = 0
                end

                lastdrive = coords
            end

            if speed > 10.0 and IsPedInFlyingVehicle(ped) then
                fly = fly + #(coords - lastfly)
                lastfly = coords
                flying = true
            else
                if flying then
                    flying = false
                    TriggerServerEvent("core_credits:progressTask", "fly", round(fly) / 1000)
                    fly = 0
                end

                lastfly = coords
            end
        end
    end
end)

function round(x)
    return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = ((1 / dist) * 2) * (1 / GetGameplayCamFov()) * 100

    if onScreen then
        SetTextColour(255, 255, 255, 255)
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextCentre(true)

        SetTextDropshadow(1, 1, 1, 1, 255)

        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55 * scale, 4)
        local width = EndTextCommandGetWidth(4)

        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end
