Core = nil

if Config['Core']:upper() == 'ESX' then
    local _esx_ = 'new' -- 'new' / 'old'

    if _esx_ then
        Core = exports['es_extended']:getSharedObject()
    else
        while Core == nil do
            TriggerEvent('esx:getSharedObject', function(obj) Core = obj end)
            Citizen.Wait(0)
        end
    end

    LoadedEvent = 'esx:playerLoaded'
    onPlayerDeath = 'esx:onPlayerDeath'
    JobUpdateEvent = 'esx:setJob'
    TSCB = Core.TriggerServerCallback

    function GetPlayerJobDatas()
        return Core.GetPlayerData().job
    end

    function GetClosestPlayerFunction()
        return Core.Game.GetClosestPlayer()
    end

    function GetClosestVehicleFunction(coords, modelFilter)
        return Core.Game.GetClosestVehicle(coords, modelFilter)
    end

elseif Config['Core']:upper() == 'QBCORE' then
    Core = exports['qb-core']:GetCoreObject()

    LoadedEvent = 'QBCore:Client:OnPlayerLoaded'
    JobUpdateEvent = 'QBCore:Client:OnJobUpdate'
    TSCB = Core.Functions.TriggerCallback

    function GetPlayerJobDatas()
        return Core.Functions.GetPlayerData().job
    end

    function GetClosestPlayerFunction()
        return Core.Functions.GetClosestPlayer()
    end

    function GetClosestVehicleFunction(coords, modelFilter)
        return Core.Functions.GetClosestVehicle(coords, modelFilter)
    end

end