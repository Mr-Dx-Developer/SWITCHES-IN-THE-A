--[[
    Here you have the Logout configuration, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Logout ~= 'drop' then
    return
end

RegisterNetEvent('housing:server:logoutLocation', function()
    local src = source
    TriggerClientEvent('housing:client:exitHouse', src)
    if Config.Framework == 'esx' then
        dropESX(src)
    end
    Wait(1000)
    DropPlayer(src, 'You have been disconnected from the server')
    print('^4[QS Housing] ^3[Debug]^0: Player ' .. src .. ' disconnected via Housing logout')
end)

function dropESX(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.updateCoords(xPlayer.getCoords())
end
