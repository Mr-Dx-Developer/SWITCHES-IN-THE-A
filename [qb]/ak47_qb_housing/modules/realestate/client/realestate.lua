if Config.Commands.realestate then
    RegisterCommand(Config.Commands.realestate, function()
        if PlayerData and PlayerData.job and PlayerData.job.name == Config.Realestate.Job and PlayerData.job.isboss then
            TriggerEvent("qb-bossmenu:client:OpenMenu")
        end
    end)
end