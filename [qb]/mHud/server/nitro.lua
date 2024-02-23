

CreateThread(function()
    while not Core do
        Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterUsableItem("nitrous", function(source)
            TriggerClientEvent('mHud:LoadNitrous', source)
        end)
    else
        Core.Functions.CreateUseableItem("nitrous", function(source)
            TriggerClientEvent('mHud:LoadNitrous', source)
        end)
    end
end)

RegisterNetEvent('mHud:server:LoadNitrous', function(Plate)
    TriggerClientEvent('mHud:client:LoadNitrous', -1, Plate)
end)

RegisterNetEvent('mHud:server:SyncFlames', function(netId)
    TriggerClientEvent('mHud:client:SyncFlames', -1, netId, source)
end)

RegisterNetEvent('mHud:server:UnloadNitrous', function(Plate)
    TriggerClientEvent('mHud:client:UnloadNitrous', -1, Plate)
end)

RegisterNetEvent('mHud:server:UpdateNitroLevel', function(Plate, level)
    TriggerClientEvent('mHud:client:UpdateNitroLevel', -1, Plate, level)
end)

RegisterNetEvent('mHud:server:StopSync', function(plate)
    TriggerClientEvent('mHud:client:StopSync', -1, plate)
end)

RegisterNetEvent('mHud:server:removeItem', function()
    local src = source
    DeleteItem(source, {
        name = "nitrous",
        reqAmount = 1,
    })
end)

RegisterCommand('nitro', function(source)
    TriggerClientEvent('mHud:LoadNitrous', source)
end)