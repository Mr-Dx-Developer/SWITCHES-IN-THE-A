SharedObject = GetSharedObject()

if Config.FrameworkType.Active == FrameworkType.ESX then
    FrameworkObject = SharedObject
end

MySQL.ready(function()
    MySQL.Sync.execute([[
        CREATE TABLE IF NOT EXISTS `drunk_stats` (
          `identifier` varchar(128) NOT NULL,
          `drunk_level` float(11) NOT NULL DEFAULT '0',
          `headache_level` float(11) NOT NULL DEFAULT '0',
          `toughness` int(11) NOT NULL DEFAULT '0',
           PRIMARY KEY (`identifier`));
        ]], {})
end)

RegisterNetEvent(TriggerName("UpdateDrunkCache"), function(id, status)
    local sourcePos = GetEntityCoords(GetPlayerPed(source))
    if #(Config.DrinkTable[id].Position - sourcePos) <= 5 then
        TriggerClientEvent(TriggerName("UpdateDrunkCache"), -1, id, status)
    end
end)

RegisterNetEvent(TriggerName("UpdateBusyStatus"), function(id, status)
    local sourcePos = GetEntityCoords(GetPlayerPed(source))
    if #(Config.DrinkTable[id].Position - sourcePos) <= 5 then
        TriggerClientEvent(TriggerName("UpdateBusyStatus"), -1, id, status)
    end
end)

RegisterNetEvent(TriggerName("RemoveBottleAfterTime"), function(netID)
    Wait(1000 * 60 * 2)
    local entity = NetworkGetEntityFromNetworkId(netID)
    for k, v in pairs(Config.DrunkList) do
        if DoesEntityExist(entity) then
            if GetEntityModel(entity) == v.attachmentInfo.objectHash then
                DeleteEntity(entity)
                break
            end
        end
    end
end)