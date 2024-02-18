Citizen.CreateThread(function() 
    while TwoNa.Framework == nil do
        if Config.Framework == TwoNa.Types.Framework.ESX then
            TwoNa.Framework = exports["es_extended"]:getSharedObject()
        elseif Config.Framework == TwoNa.Types.Framework.QB then
            TwoNa.Framework = exports["qb-core"]:GetCoreObject()
        end

        Citizen.Wait(1)
    end
end)