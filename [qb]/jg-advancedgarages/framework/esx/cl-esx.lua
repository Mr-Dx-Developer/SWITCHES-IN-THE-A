-- Player data
if Config.Framework == "ESX" then
  Globals.PlayerData = ESX.GetPlayerData()

  RegisterNetEvent('esx:playerLoaded')
  AddEventHandler('esx:playerLoaded', function(xPlayer)
    Globals.PlayerData = xPlayer
    createJobGarageBlips()
  end)

  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
    Globals.PlayerData.job = job
    createJobGarageBlips() -- refresh blips
  end)

  -- ESX admincar replacement
  RegisterNetEvent("jg-advancedgarages:client:SetVehicleAsOwned", function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)
    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
    
    if not vehicle or vehicle == 0 then
      return Framework.Client.Notify(Locale.notInsideVehicleError, "error")
    end

    local plate = vehicleProps.plate
    ESX.TriggerServerCallback('jg-advancedgarages:server:GetVehicle', function(veh)
      if veh.plate then
        return Framework.Client.Notify(Locale.vehiclePlateExistsError, "error")
      end
      
      TriggerServerEvent('jg-advancedgarages:server:SetVehicleAsOwned', vehicleProps)
    end, plate)
  end)
end
