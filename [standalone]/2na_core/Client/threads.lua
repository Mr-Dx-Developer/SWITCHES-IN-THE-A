Citizen.CreateThread(function() 
    while TwoNa.Framework == nil do
        if Config.Framework then 
            TwoNa.Framework = Config.Framework.GetFramework()
        end

        Citizen.Wait(1)
    end
end)