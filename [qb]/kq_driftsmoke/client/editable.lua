function IsWhitelisted(vehicle)
    for index, value in ipairs(Config.whitelist.vehicles) do
        if GetHashKey(value) == GetEntityModel(vehicle) then
            return true
        end
    end

    return false
end

if Config.toggleCommands then
    RegisterCommand('stopsmoke', function(source, args)
        smokeActive = false
    end)
    
    RegisterCommand('startsmoke', function(source, args)
        smokeActive = true
    end)
end
