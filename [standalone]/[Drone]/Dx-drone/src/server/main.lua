local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("bdrone", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)
  TriggerClientEvent("NethushDrones:UseDrone", source)
end)

QBCore.Functions.CreateUseableItem("badrone", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)
  TriggerClientEvent("NethushDrones:UseDrone2", source)
end)

QBCore.Functions.CreateUseableItem("bbdrone", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)
  TriggerClientEvent("NethushDrones:UseDrone3", source)
end)

QBCore.Functions.CreateUseableItem("bcdrone", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)
  TriggerClientEvent("NethushDrones:UseDrone4", source)
end)

QBCore.Functions.CreateUseableItem("bddrone", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)
  TriggerClientEvent("NethushDrones:UseDrone5", source)
end)

QBCore.Functions.CreateUseableItem("policedrone", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)
  TriggerClientEvent("NethushDrones:UseDronepolice", source)
end)

Drones.CanPlayerAfford = function(source,price)
  local xPlayer = ESX.GetPlayerFromId(source)
  for _,account in ipairs(xPlayer.getAccounts()) do
    if account.name == Config.BankAccountName then
      if account.money >= price then
        return true
      else
        return false
      end
    end
  end
  return false
end

Drones.TakePlayerMoney = function(source,amount)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeAccountMoney(Config.BankAccountName,amount)
end

Drones.GivePlayerItem = function(source,item_name,amount)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addInventoryItem(item_name,amount)
end  

Drones.TakeItem = function(source,item_name,item_count)
  local xPlayer = ESX.GetPlayerFromId(source)
  local inventory_item = xPlayer.getInventoryItem(item_name)
  if inventory_item and inventory_item.count >= item_count then
    xPlayer.removeInventoryItem(item_name,item_count)
    return true
  else
    return false
  end
end

Drones.NotifyPlayer = function(source,msg)
  TriggerClientEvent("esx:showNotification",source,msg)
end

Drones.CreatePickup = function(source,drone,pos)
  -- NOTE: This will not work unless you make the changes described in the README.md file, regarding "ESX Pickup Item Changes"
  -- ESX.CreatePickup('item_standard', drone.name, 1, ESX.GetItemLabel(drone.name), pos)
end

if Config.UseESX then
  for _,drone in pairs(Config.Drones) do
    ESX.RegisterUsableItem(drone.name, function(source)
      TriggerClientEvent("Drones:UseDrone",source,drone)
    end)
  end
end