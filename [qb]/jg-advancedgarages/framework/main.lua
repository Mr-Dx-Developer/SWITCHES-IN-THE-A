QBCore, ESX = nil, nil
Framework = {
  Client = {},
  Server = {}
}

if Config.Framework == "QBCore" then
  QBCore = exports['qb-core']:GetCoreObject()

  Framework.VehiclesTable = "player_vehicles"
  Framework.PlayerIdentifier = "citizenid"
  Framework.VehProps = "mods"
elseif Config.Framework == "ESX" then
  ESX = exports["es_extended"]:getSharedObject()

  Framework.VehiclesTable = "owned_vehicles"
  Framework.PlayerIdentifier = "owner"
  Framework.VehProps = "vehicle"
else
  error("You need to set the Config.Framework to either \"QBCore\" or \"ESX\"!")
end
