--[[
    Here you have the Logout configuration, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Logout ~= 'esx_multicharacter' then
    return
end

RegisterNetEvent('housing:server:logoutLocation', function()
    local src = source
    TriggerEvent('esx:playerLogout', src)
    print('^4[QS Housing] ^3[Debug]^0: Player ' .. src .. ' disconnected via Housing logout')
end)
