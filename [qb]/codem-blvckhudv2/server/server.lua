frameworkObject = nil

function ExecuteSql(query)
    local IsBusy = true
    local result = nil
    if Config.Mysql == "oxmysql" then
        if MySQL == nil then
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.query(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.Mysql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    elseif Config.Mysql == "mysql-async" then   
        MySQL.Async.fetchAll(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end


Citizen.CreateThread(function()
    frameworkObject = GetFrameworkObject()
    if Config.Framework == "esx" then
        frameworkObject.RegisterServerCallback("codem-blvckhudv2:GetMoney", function(source, cb, moneytype)
            local src = source
            local Player = frameworkObject.GetPlayerFromId(src)
            if moneytype == "cash" then
                cb(Player.getMoney())
            else
                cb(Player.getAccount('bank').money)
            end
        end)
    end
end)
preferences = {}

function GetPreferencesData()
    local json_data = LoadResourceFile(GetCurrentResourceName(),  './preferences.json')
    if(json_data == '')then
        json_data = {}
    else
        json_data = json.decode(json_data)
    end
    return json_data
end


RegisterServerEvent('codem-blvckhudv2:RemoveItem')
AddEventHandler('codem-blvckhudv2:RemoveItem', function(item, amount)
    local src = source
    local player = Config.Framework == 'esx' and frameworkObject.GetPlayerFromId(src) or frameworkObject.Functions.GetPlayer(src)
    if Config.Framework == "esx" then
        player.removeInventoryItem(item, amount)
    else
        player.Functions.RemoveItem(item, amount)
    end
end)

Citizen.CreateThread(function()
    while frameworkObject == nil do
        Citizen.Wait(0)
    end
    Citizen.Wait(2000)
    local data = ExecuteSql("SELECT * FROM `codem-hud-data`")
    local newPreferences = {}
    for k,v in pairs(data) do
        newPreferences[v.identifier] = json.decode(v.data)
    end
    local newStress = {}
    for _,v in pairs(data) do
        newStress[v.identifier] = v.stress
    end
    stressData = newStress
    preferences = newPreferences
    for _,v in pairs(GetPlayers()) do
        local player = nil
        if Config.Framework == 'esx' then
            player = frameworkObject.GetPlayerFromId(tonumber(v))
        else
            player = frameworkObject.Functions.GetPlayer(tonumber(v))
        end
        if player ~= nil then
            local identifier = GetIdentifier(v)
            CheckPreferencesExist(identifier)
            if Config.UseStress then
                if stressData[identifier] == nil then
                    stressData[identifier] = 0
                end
                TriggerClientEvent('hud:client:UpdateStress', v, stressData[identifier])
            end
            TriggerClientEvent('codem-blvckhudv2:client:UpdateSettings', v,  preferences[identifier])
            TriggerClientEvent('codem-blackhudv2:SetForceHide', v, false)
            TriggerClientEvent('codem-blvckhudv2:UpdateNitroData', v, nitro)
            TriggerClientEvent('codem-blvckhudv2:Loaded', v)
        end
    end
end)

function CheckPreferencesExist(identifier)
    if preferences[identifier] == nil then
        
        preferences[identifier] = {
            hud = Config.DefaultHud,
            hide = false,
            speedtype = Config.DefaultSpeedUnit,
            maptype = Config.DefaultMap,
            showCompass = true,
            speedometerSize = Config.DefaultSpeedometerSize,
            refreshRate = Config.DefaultRefreshRate,
            showHideBox = false,
            hudSize = Config.DefaultHudSize,
            hudColors = Config.DefaultHudColors,
            positionsData = {
            },
            hideBoxData = {
                health= 100,
                armor= 100,
                water =  100,
                stress= 100,
                hunger= 100,
                stamina= 100,
            },
        }
        ExecuteSql("INSERT INTO `codem-hud-data` (`data`, `identifier`, `stress`) VALUES ('"..json.encode(preferences[identifier]).."', '"..identifier.."', '0')")
        stressData[identifier] = 0
    else
        local updated = false
        local data = preferences[identifier]
        if data.hud == nil then
            data.hud = Config.DefaultHud
            updated = true
        end
        if data.hudColors == nil then
            data.hudColors = Config.DefaultHudColors
            updated = true

        end
        if data.positionsData == nil then
            data.positionsData = {}
            updated = true

        end
        if data.hideBoxData == nil then
            data.hideBoxData = {
                health= 100,
                armor= 100,
                water =  100,
                stress= 100,
                hunger= 100,
                stamina= 100,
            }
            updated = true

        else
            if data.hideBoxData.health == nil then
                data.hideBoxData.health = 100
                updated = true

            end
            if data.hideBoxData.armor == nil then
                data.hideBoxData.armor = 100
                updated = true

            end
            if data.hideBoxData.water == nil then
                data.hideBoxData.water = 100
                updated = true

            end
            if data.hideBoxData.stress == nil then
                data.hideBoxData.stress = 100
                updated = true

            end
            if data.hideBoxData.hunger == nil then
                data.hideBoxData.hunger = 100
                updated = true

            end
            if data.hideBoxData.stamina == nil then
                data.hideBoxData.stamina = 100
                updated = true

            end
        end
        if data.showHideBox == nil then
            data.showHideBox = false
            updated = true

        end
        if data.hide == nil then
            data.hide = false
            updated = true

        end
        if data.refreshRate == nil then
            data.refreshRate = Config.DefaultRefreshRate
            updated = true

        end
        if data.speedtype == nil then
            data.speedtype = Config.DefaultSpeedUnit
            updated = true

        end
        if data.maptype == nil then
            data.maptype = Config.DefaultMap
            updated = true

        end
        if data.showCompass == nil then
            data.showCompass = true
            updated = true

        end
        if data.speedometerSize == nil then
            data.speedometerSize = Config.DefaultSpeedometerSize
            updated = true

        end
        if data.hudSize == nil then
            data.hudSize = Config.DefaultHudSize
            updated = true

        end
        if updated then
            ExecuteSql("UPDATE `codem-hud-data` SET data = '"..json.encode(data).."' WHERE identifier = '"..identifier.."'")
        end
    end
end


if Config.EnableCashAndBankCommands then
    RegisterCommand(Config.CashCommand, function(source)
        if Config.Framework == "esx" then
            local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
            local cashamount = xPlayer.getMoney()
            TriggerClientEvent('codemblvckhudv2:ShowAccounts', source, 'cash', cashamount)
        else
            local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
            local cashamount = Player.PlayerData.money.cash
    
            TriggerClientEvent('codemblvckhudv2:ShowAccounts', source, 'cash', cashamount)
    
        end
    end)
    RegisterCommand(Config.BankCommand, function(source)
        if Config.Framework == "esx" then
            local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
            local bankamount = xPlayer.getAccount('bank')
            if bankamount then
                TriggerClientEvent('codemblvckhudv2:ShowAccounts', source, 'bank', bankamount.money)
            end
        else
            local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
            local bankamount = Player.PlayerData.money.bank
            TriggerClientEvent('codemblvckhudv2:ShowAccounts', source, 'bank', bankamount)
    
        end
    end)
    
end

RegisterServerEvent('seatbelt:server:PlaySound')
AddEventHandler('seatbelt:server:PlaySound', function(action, table)
      for i=1, #table do
        if table[i] then
            
            TriggerClientEvent('seatbelt:client:PlaySound', table[i], action, 0.15)
        end
    end 
end)

function GetIdentifier(source)
    if Config.Framework == "esx" then
        local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
        if xPlayer then
            return xPlayer.getIdentifier()
        else
            return "0"
        end
    else
        local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
        if Player then
            return Player.PlayerData.citizenid
        else
            return "0"
        end
    end
end


RegisterNetEvent('codem-blvckhudv2:UpdateData')
AddEventHandler("codem-blvckhudv2:UpdateData", function(settingstype, val)
    local src = source
    local identifier = GetIdentifier(src)
    CheckPreferencesExist(identifier)
    if preferences[identifier][settingstype] ~= nil then
        if settingstype == 'hudColors' then
            if preferences[identifier].hudColors[preferences[identifier].hud] and preferences[identifier].hudColors[preferences[identifier].hud][val.type] then
                preferences[identifier].hudColors[preferences[identifier].hud][val.type] = val.color
            end
        else
            preferences[identifier][settingstype] = val
        end
        TriggerClientEvent('codem-blvckhudv2:client:UpdateSettings', src, preferences[identifier])
        ExecuteSql("UPDATE `codem-hud-data` SET data = '"..json.encode(preferences[identifier]).."' WHERE identifier = '"..identifier.."'")
    end
end)

RegisterServerEvent('codem-blackhud-v2:server:EjectPlayer')
AddEventHandler('codem-blackhud-v2:server:EjectPlayer', function(table, velocity)
   for i=1, #table do
        if table[i] then
            TriggerClientEvent("codem-blackhud-v2:client:EjectPlayer", table[i], velocity)
        end
    end
end)