--- server side

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("srestart", "restart the server [GOD ONLY]", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('QBCore:Client:PvpHasToggled', -1)
    TriggerEvent('qb-restart')
end, "god")


RegisterNetEvent('restart:server', function()
    if QBCore.Functions.HasPermission(source, "god") then
    local Players = QBCore.Functions.GetPlayers()
    for i=1, #Players, 1 do
        DropPlayer(Players[i], "server is restarting")
    end
    Citizen.Wait(10000)
    os.exit()
    end
end)

RegisterNetEvent('qb-restart')
AddEventHandler('qb-restart', function()
    hold = true
    Wait(1)
    TriggerClientEvent('qb-restart:server', -1, hold)
end)