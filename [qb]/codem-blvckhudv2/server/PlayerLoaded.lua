RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(src)
    local identifier = GetIdentifier(src)
    CheckPreferencesExist(identifier)
    TriggerClientEvent('codem-blvckhudv2:client:UpdateSettings', src, preferences[identifier])
    if Config.UseStress then
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])

    end
    TriggerClientEvent('codem-blackhudv2:SetForceHide', src, false)
    TriggerClientEvent('codem-blvckhudv2:UpdateNitroData', src, nitro)
    TriggerClientEvent('codem-blvckhudv2:Loaded', src)
end)

RegisterNetEvent('QBCore:Server:OnPlayerLoaded')
AddEventHandler('QBCore:Server:OnPlayerLoaded', function()
    local src = source
    local identifier = GetIdentifier(src)
    CheckPreferencesExist(identifier)
    TriggerClientEvent('codem-blvckhudv2:client:UpdateSettings', src,  preferences[identifier])
    if Config.UseStress then
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])

    end
    TriggerClientEvent('codem-blvckhudv2:UpdateNitroData', src, nitro)
    TriggerClientEvent('codem-blackhudv2:SetForceHide', src, false)
    TriggerClientEvent('codem-blvckhudv2:Loaded', src)

end)