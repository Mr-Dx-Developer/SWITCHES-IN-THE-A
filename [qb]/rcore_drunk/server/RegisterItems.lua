IsPlayerBusyDrinking = {}
CoolDownTester = {}

function OnUseSuperVodka(source)
    TriggerClientEvent(TriggerName("ShowSelector"), source)
end

function AlcoholTester(source)
    if CoolDownTester[source] then
        return
    end
    CoolDownTester[source] = true
    CreateThread(function()
        Wait(6000)
        CoolDownTester[source] = nil
    end)

    TriggerClientEvent(TriggerName("TakeSelfTest"), source)
    FrameworkObject.GetPlayerFromId(source).removeInventoryItem("breath_alcohol_tester", 1)
end

if Config.ox_inv then
    exports("supervodka", function(event, item, inventory, slot, data)
        if event ~= "usingItem" then
            return
        end

        local source = inventory.id
        OnUseSuperVodka(source)
    end)

    exports("breath_alcohol_tester", function(event, item, inventory, slot, data)
        if event ~= "usingItem" then
            return
        end
        local source = inventory.id
        AlcoholTester(source)
    end)

    for k, v in pairs(Config.DrunkList) do
        exports(v.name, function(event, item, inventory, slot, data)
            if event ~= "usingItem" then
                return
            end

            local source = inventory.id
            if not IsPlayerBusyDrinking[source] then
                IsPlayerBusyDrinking[source] = true
                FrameworkObject.GetPlayerFromId(source).removeInventoryItem(v.name, 1)
                TriggerClientEvent(TriggerName("EquipPlayerDrink"), source, v)
            end
        end)
    end
end

OnObjectLoaded(function()
    Wait(1000)
    if not Config.ox_inv then
        if FrameworkObject then
            if FrameworkObject.RegisterUsableItem then
                FrameworkObject.RegisterUsableItem("supervodka", OnUseSuperVodka)
                FrameworkObject.RegisterUsableItem("breath_alcohol_tester", AlcoholTester)
            end
        end
    end

    if Config.FrameworkType.Active == FrameworkType.CUSTOM then

        RegisterCommand("alcoholtester", function(source)
            if CoolDownTester[source] then
                return
            end
            CoolDownTester[source] = true
            CreateThread(function()
                Wait(6000)
                CoolDownTester[source] = nil
            end)

            TriggerClientEvent(TriggerName("TakeSelfTest"), source)
        end, false)

        for k, v in pairs(Config.DrunkList) do
            RegisterCommand(v.name, function(source)
                if not IsPlayerBusyDrinking[source] then
                    IsPlayerBusyDrinking[source] = true
                    FrameworkObject.GetPlayerFromId(source).removeInventoryItem(v.name, 1)
                    TriggerClientEvent(TriggerName("EquipPlayerDrink"), source, v)
                end
            end, false)
        end
    else
        if not Config.ox_inv then
            for k, v in pairs(Config.DrunkList) do
                FrameworkObject.RegisterUsableItem(v.name, function(source)
                    if not IsPlayerBusyDrinking[source] then
                        IsPlayerBusyDrinking[source] = true
                        FrameworkObject.GetPlayerFromId(source).removeInventoryItem(v.name, 1)
                        TriggerClientEvent(TriggerName("EquipPlayerDrink"), source, v)
                    end
                end)
            end
        end
    end
end)

RegisterNetEvent(TriggerName("SetPlayerBusyDrinkStatus"), function(status)
    IsPlayerBusyDrinking[source] = status
end)