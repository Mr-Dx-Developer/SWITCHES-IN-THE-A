if Config.Framework == "ESX" then
  -- Player data
  Globals.PlayerData = ESX.GetPlayerData()

  RegisterNetEvent('esx:playerLoaded')
  AddEventHandler('esx:playerLoaded', function(xPlayer)
    Globals.PlayerData = xPlayer
    
    Citizen.CreateThread(function()
      Wait(1000)
      Framework.Client.TriggerCallback("jg-dealerships:server:exit-showroom", function() end)
    end)
  end)

  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
    Globals.PlayerData.job = job
    TriggerEvent("jg-dealerships:client:update-blips-text-uis")
  end)
end
