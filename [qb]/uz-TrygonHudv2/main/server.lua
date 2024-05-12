PlayerStress = {}
stressData = {}
Framework = nil
Framework = GetFramework()
Citizen.Await(Framework)
Players = Config.Framework == "ESX" or Config.Framework == "NewESX" and Framework.GetPlayers() or Framework.Functions.GetPlayers()
Callback = Config.Framework == "ESX" or Config.Framework == "NewESX" and Framework.RegisterServerCallback or Framework.Functions.CreateCallback
Citizen.CreateThread(function()
    while Framework == nil do 
        Citizen.Wait(750) 
    end

    Citizen.Wait(2500)

    for _, v in pairs(GetPlayers()) do
        local Player = (Config.Framework == "ESX" or Config.Framework == "NewESX") and Framework.GetPlayerFromId(tonumber(v)) or Framework.Functions.GetPlayer(tonumber(v))
        print(Player.source)
        if Player ~= nil then
            TriggerClientEvent('HudPlayerLoad', tonumber(v))
            Citizen.Wait(74)
        end
    end
end)



Callback('UZPlayer', function(source, cb)
    local count = 0
    local xPlayer, job, label, cash
    local maxClients = GetConvarInt("sv_maxclients", 32)

    if Config.Framework == "ESX" or Config.Framework == "NewESX" then 
        xPlayer = Framework.GetPlayerFromId(source)
        job = xPlayer.job.name
        label = xPlayer.job.grade_label
        cash = xPlayer.getMoney()
    else
        xPlayer = Framework.Functions.GetPlayer(source)
        job = xPlayer.PlayerData.job.name
        label = xPlayer.PlayerData.job.grade.name
        cash = xPlayer.PlayerData.money.cash
    end

    for _, v in pairs(Players) do
        if v ~= nil then count = count + 1 end
    end
    
    local soft = "" .. count .. "/" .. maxClients
    cb(soft, source, job, label, cash)
end)


RegisterCommand(Config.Refresh, function(source)
    TriggerClientEvent('HudPlayerLoad', source)
end)


if Config.Framework == "ESX" or Config.Framework == "NewESX" then     

       RegisterNetEvent('esx:playerLoaded')
       AddEventHandler('esx:playerLoaded', function(src)
           Wait(1000)
           TriggerClientEvent('HudPlayerLoad', src)
       end)


elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then

        RegisterNetEvent('QBCore:Server:OnPlayerLoaded')
        AddEventHandler('QBCore:Server:OnPlayerLoaded', function()
          local source = source
          local Player = Framework.Functions.GetPlayer(source)
          TriggerClientEvent('HudPlayerLoad', source)
      end)


end


RegisterNetEvent('SetStress', function(amount)
    local Player = (Config.Framework == "ESX" or Config.Framework == "NewESX") and Framework.GetPlayerFromId(source) or Framework.Functions.GetPlayer(source)
    local JobName = (Config.Framework == "ESX" or Config.Framework == "NewESX") and Player.job.label or Player.PlayerData.job.label
    local ID = (Config.Framework == "ESX" or Config.Framework == "NewESX") and Player.identifier or Player.PlayerData.citizenid
    local newStress
    if not Player or (Config.DisablePoliceStress and JobName == 'police') then return end
    if not PlayerStress[ID] then PlayerStress[ID] = 0 end
    newStress = PlayerStress[ID] + amount
    if newStress <= 0 then newStress = 0 end
    if newStress > 100 then newStress = 100 end
    PlayerStress[ID] = newStress
    TriggerClientEvent('UpdateStress', source, PlayerStress[ID])
end)

RegisterNetEvent('hud:server:GainStress', function(amount)
    local src = source
    local identifier = GetIdentifier(src)
    if IsWhitelisted(src) then
        return
    end
    local newStress = math.min((tonumber(stressData[identifier]) or 0) + amount, 100)
    newStress = math.max(newStress, 0)
    stressData[identifier] = newStress
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    local src = source
    local identifier = GetIdentifier(src)
    local newStress = math.max((tonumber(stressData[identifier]) or 0) - amount, 0)
    newStress = math.min(newStress, 100)
    stressData[identifier] = newStress
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
end)

function IsWhitelisted(source)
    local player = (Config.Framework == 'ESX' or Config.Framework == 'NewESX') and Framework.GetPlayerFromId(source) or Framework.Functions.GetPlayer(source)
    if player then
        local jobName = (Config.Framework == 'ESX' or Config.Framework == 'NewESX') and player.job.name or player.PlayerData.job.name
        for _, v in pairs(Config.StressWhitelistJobs) do
            if jobName == v then
                return true
            end
        end
    end
    return false
end


function GetIdentifier(source)
    if Config.Framework == "ESX" or Config.Framework == "NewESX" then
        local xPlayer = Framework.GetPlayerFromId(tonumber(source))
        return xPlayer and xPlayer.getIdentifier() or "0"
    else
        local Player = Framework.Functions.GetPlayer(tonumber(source))
        return Player and Player.PlayerData.citizenid or "0"
    end
end




