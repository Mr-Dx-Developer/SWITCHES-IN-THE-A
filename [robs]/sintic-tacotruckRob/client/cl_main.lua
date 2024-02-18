local QBCore = exports['qb-core']:GetCoreObject()
local CanDelivery = false
local CheckInV = false
local CheckInVDelivery = false
local randomIndex = math.random(#Config['Rob']['DeliverLocCfg'])
local deliveryLocation = Config['Rob']['DeliverLocCfg'][randomIndex]

Citizen.CreateThread(function()
  loadModel(Config['Rob']['Startpedmodel'])
  startped = CreatePed(4, GetHashKey(Config['Rob']['Startpedmodel']), Config['Rob']['StartLocCfg'], Config['Rob']['StartLocHeadingCfg'], false, true)
  FreezeEntityPosition(startped, true)
  SetEntityInvincible(startped, true)
  SetBlockingOfNonTemporaryEvents(startped, true)
end)

Citizen.CreateThread(function()
  while true do
      local ped = PlayerPedId()
      local pedCo = GetEntityCoords(ped)
      local sleep = 1000
      local dist = #(pedCo - Config['Rob']['StartLocCfg'])

      if dist <= 5.0 then
          sleep = 1
          if dist <= 3.0 then
              ShowHelpNotification('Press ~INPUT_CONTEXT~ to Start Taco Truck Robbery')
              if IsControlJustPressed(0, 38) then
                CheckStartRob()
              end
          end
      end
      Citizen.Wait(sleep)
  end
end)

function CheckStartRob()
  QBCore.Functions.TriggerCallback('sin-Tacotrcukrob:server:checkTime', function(time)
      if time then
          TacoTruckBlip = addBlip(Config['Rob']['TruckSpawnCfg'], 67, 1, 'Truck Locaion')
          QBCore.Functions.Notify('Taco Truck Robbery Started. Check Truck Locaion in Map')
          SpawnGuardsandTruck()
          ClearArea(Config['Rob']['TruckSpawnCfg'], 50.0)

      end
  end)
end

function SpawnGuardsandTruck()
  local ped = PlayerPedId()

  while true do
      local ped = PlayerPedId()
      local pedCo = GetEntityCoords(ped)
      local dist = #(pedCo - Config['Rob']['TruckSpawnCfg'])
      if dist <= 250.0 then
          break
      end
      Wait(1)
  end

  SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
  AddRelationshipGroup('TacoGuardPeds')

  loadModel(GetHashKey(Config['Rob']['TacoTruck']))
  Tacotruck = CreateVehicle(GetHashKey(Config['Rob']['TacoTruck']), Config['Rob']['TruckSpawnCfg'], Config['Rob']['TruckSpawnHeadingCfg'], true, true)

  SetVehicleOnGroundProperly(Tacotruck)
  SetVehicleNumberPlateText(Tacotruck, "SINFTUCK")

  for k, guardCfg in ipairs(Config['Rob']['GuardCfg']) do

    loadModel(guardCfg.pedmodel)
    local guardPed = CreatePed(4, GetHashKey(guardCfg.pedmodel), guardCfg.vector, guardCfg.w, false, true)
    SetEntityHeading(guardPed, guardCfg.w)
    NetworkRegisterEntityAsNetworked(guardPed)
      networkID = NetworkGetNetworkIdFromEntity(guardPed)
      SetNetworkIdCanMigrate(networkID, true)
      SetNetworkIdExistsOnAllMachines(networkID, true)
      SetEntityAsMissionEntity(guardPed)
      SetEntityVisible(guardPed, true)
      SetPedRelationshipGroupHash(guardPed, GetHashKey("TacoGuardPeds"))
      SetPedAccuracy(guardPed, 50)
      SetPedArmour(guardPed, 100)
      SetPedCanSwitchWeapon(guardPed, true)
      SetPedDropsWeaponsWhenDead(guardPed, false)
      SetPedFleeAttributes(guardPed, 0, false)
      GiveWeaponToPed(guardPed, GetHashKey(guardCfg.weapon), 250, false, false)
      SetPedRandomComponentVariation(guardPed, 0)
      SetPedRandomProps(guardPed)
      SetPedCombatAttributes(guardPed, 46, true)
      SetPedAlertness(guardPed, 3)
      TaskGuardCurrentPosition(guardPed, 5.0, 5.0, 1)
      Wait(50)
  end

  SetRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
  SetRelationshipBetweenGroups(0, GetHashKey("TacoGuardPeds"), GetHashKey("TacoGuardPeds"))
  SetRelationshipBetweenGroups(5, GetHashKey("TacoGuardPeds"), GetHashKey("PLAYER"))
  SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("TacoGuardPeds"))
  RemoveBlip(TacoTruckBlip)
  TriggerServerEvent('sin-Tacotrcukrob:server:policeAlert', Config['Rob']['TruckSpawnCfg'])
  CheckInV = true
  CheckInVehicle()
  Delivery()

end

function CheckInVehicle()
  while CheckInV do
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if GetVehicleNumberPlateText(vehicle) == "SINFTUCK" then
      DeliveryBlip = addBlip(deliveryLocation.vector, 162, 5, 'Delivery Location')
      SetNewWaypoint(deliveryLocation.vector.x,deliveryLocation.vector.y)
      CheckInV = false
      CheckInVDelivery = true
    end
    Citizen.Wait(1000)
  end
end

function Delivery()
  while CheckInVDelivery do

    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local pedCoords = GetEntityCoords(ped)
    local distance = #(pedCoords - deliveryLocation.vector)
    local sleep = 1000

    if(distance < 6) then
      sleep = 1
      ShowHelpNotification('Press ~INPUT_CONTEXT~ to Deliver')
      if IsControlJustPressed(0, 38) then
        if GetVehicleNumberPlateText(vehicle) == "SINFTUCK" then
          RemoveBlip(DeliveryBlip)
          DeleteEntity(Tacotruck)
          DeletePed(guardPed)
          TriggerServerEvent('sin-Tacotrcukrob:server:rewardItem', deliveryLocation.sellprice, deliveryLocation.item, deliveryLocation.itemamount)
          QBCore.Functions.Notify('Sold for $'..deliveryLocation.sellprice, 'success')
          QBCore.Functions.Notify('You recived ' .. ' '..deliveryLocation.item, 'success')
          QBCore.Functions.Notify(deliveryLocation.itemamount.. "Items", "success")
          CheckInVDelivery = false
        else
          QBCore.Functions.Notify('Not Right Vehicle')
        end
      end
    end

    Citizen.Wait(sleep)
  end
end

function loadModel(model)
	if type(model) == 'number' then
		model = model
	else
		model = GetHashKey(model)
	end
	while not HasModelLoaded(model) do
		RequestModel(model)
		Citizen.Wait(0)
	end
end

function ShowHelpNotification(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function addBlip(coords, sprite, colour, text)
  local blip = AddBlipForCoord(coords)
  SetBlipSprite(blip, sprite)
  SetBlipColour(blip, colour)
  SetBlipScale(blip, 0.8)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(text)
  EndTextCommandSetBlipName(blip)
  return blip
end

AddEventHandler('onResourceStop', function(name)
  if name == GetCurrentResourceName() then
      DeleteEntity(Tacotruck)
      DeletePed(guardPed)
  end
end)

RegisterNetEvent('sin-Tacotrcukrob:client:policeAlert')
AddEventHandler('sin-Tacotrcukrob:client:policeAlert', function(targetCoords)
    local P_0 = 250
    local P_1 = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 50.0)

    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)

    TriggerServerEvent('police:server:policeAlert', 'Taco Truck Robbery in progress.')

    SetBlipHighDetail(P_1, true)
    SetBlipColour(P_1, 1)
    SetBlipAlpha(P_1, P_0)
    SetBlipAsShortRange(P_1, true)

    while P_0 ~= 0 do
        Citizen.Wait(500)
        P_0 = P_0 - 1
        SetBlipAlpha(P_1, P_0)

        if P_0 == 0 then
            RemoveBlip(P_1)
            return
        end
    end
end)