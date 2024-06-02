Settings = {
    botToken = "MTIwNjc4MjU4NTU3Mzg3NTc5Mg.GbmIBT.Zxe3ZKHaYBGb0gnY6TeDzkGfgCQTrTal7W_jrk", -- https://discord.com/developers/applications
    screenShotWebhook = "https://discord.com/api/webhooks/1219357279711662151/lTGfJEQmjlznbnAZbJLQ96rhMd6f6hAmwfA5XpYzYt_0pK4FVkG8JoThMX7srxNFOqBl"
}

RegisterNetEvent('7n_admin:openInventory')
AddEventHandler('7n_admin:openInventory', function (target)
    -- here is your inventer open trigger
end)




















Citizen.CreateThread(function()
    -- not here
    while true do
        if Settings["botToken"] == "" then
            print("Please check settings.lua")
        end
        Citizen.Wait(3000)
    end
end)