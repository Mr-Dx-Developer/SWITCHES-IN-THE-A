local firstLoad = false

function LoadHUD()
    Wait(1000)
    WaitCore()
    WaitPlayer()
    nuiMessage("SET_GIFT_INFORMATIONS", {
        text = Config.Gift.text,
        time = Config.Gift.time,
        enable = Config.Gift.enable,
    })
    TriggerServerEvent('mHud:RequestPlaylists')

    TriggerServerEvent("mHud:UpdatePlayersAmount")
    TriggerServerEvent("mHud:CheckPlayerStress")
    LoadPlayerInformations()
    
    nuiMessage("SET_HUD_LOADED")
    TriggerServerEvent("mHud:StartGiftTimer")
    ShowHud()
end


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    LoadHUD()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    LoadHUD()

end)

CreateThread(function()
    Wait(2000)
    if not firstLoad then
        LoadHUD()
    end
end)

AddEventHandler("playerSpawned", function()
    if not firstLoad then
        firstLoad = true
        if Config.ShowMapWhileWalking then
            DisplayRadar(true)
        else
            DisplayRadar(false)
        end
    end
end)

local isMapHidden = IsRadarHidden()
CreateThread(function()
    while true do
        Wait(1000)
        if IsRadarHidden() then
            if not isMapHidden then
                isMapHidden = true
                setShowMapWalking(false)
            end
        else
            if isMapHidden then
                isMapHidden = false
                setShowMapWalking(true)
            end
        end
    end
end)


