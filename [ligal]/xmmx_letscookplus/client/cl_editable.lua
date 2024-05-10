local alcoholCount = 0

local emotes = {
    ["lclemonlobster"]      = "eat", -- can add custom emotes for food/drink items here.
    ["lccheeseburger"]      = "eat",
    ["lcsausagedog"]        = "eat",
    ["lcgumbo"]             = "eat",
    ["lcoxtails"]           = "eat",
    ["lcmaccheesy"]         = "eat",
    ["lchotcakes"]          = "eat",
    ["lcricebowl"]          = "eat",
    ["lcramennoodle"]       = "eat",
    ["lcquickpizza"]        = "eat",
    ["lcribs"]              = "eat",
    ["lclegquarter"]        = "eat",
    ["lcsteak"]             = "eat",
    ["lcgrillcorn"]         = "eat",
    ["lcgrillveggies"]      = "eat",
    ["lctoast"]             = "eat",
    ["lcpoptart"]           = "eat",
    ["lctoasti"]            = "eat",
    ["lchamtoastie"]        = "eat",
    ["lcfriedchicken"]      = "eat",
    ["lccheesesticks"]      = "eat",
    ["lcfrenchfries"]       = "eat",
    ["lclambchops"]         = "eat",
    ["lcfriedfish"]         = "eat",
    ["lcsalmon"]            = "eat",
    ["lcbstirfry"]          = "eat",
    ["lcchickensand"]       = "eat",
    ["lcbffriedrice"]       = "eat",
    ["lcckfriedrice"]       = "eat",
    ["lcapplesauce"]        = "eat",
    ["lcnanacream"]         = "eat",
    ["lcberrycream"]        = "eat",
    ["lcchoccream"]         = "eat",
    ["lcbpudding"]          = "eat",
    ['lcmshine_melon']      = "eat",
    ["lcgrapejuice"]        = "drink",
    ["lcapplejuice"]        = "drink",
    ["lcorangejuice"]       = "drink",
    ["lcnanasmoothie"]      = "drink",
    ["lcberrysmoothie"]     = "drink",
    ["lccuptea"]            = "drink",
    ["lccupcoffee"]         = "coffee",
    ["lchotcocoa"]          = "coffee",
    ["lcgreentea"]          = "coffee",
    ["lccappucino"]         = "coffee",
    ["lcpepshrimp"]         = "eat",
    ["lccurrgoat"]          = "eat",
    ["lcricepeas"]          = "eat",
    ["lcyellrice"]          = "eat",
    ["lcwhite_lighting"]    = "whiskey",
    ["lcsour_watermelon"]   = "whiskey",
    ["lcmountain_java"]     = "whiskey",
    ["lcstrawberry_shine"]  = "whiskey",
    ["lcblkberry_shine"]    = "whiskey",
}

RegisterNetEvent('xmmx_letscookplus:consumable:Eat')
AddEventHandler('xmmx_letscookplus:consumable:Eat', function(itemName)
    if emotes[itemName] then ExecuteCommand('e '..emotes[itemName]) end
    local data = {
        label = (Config.Core == "qb") and (Locales[Config.Language].progress["eating"]..QBCore.Shared.Items[itemName].label) or Locales[Config.Language].progress["eating"],
        time = 12000,
        icon = itemName,
    }
    ProgressConsume(data.label, data.time, function() 
        if Config.Core == "qb" then 
            itemToggle(false, itemName, 1)
            ExecuteCommand('e c')
            TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBMeta.EatsMeta[itemName])
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        elseif Config.Core == "esx" then 
            itemToggle(false, itemName, 1)
            ExecuteCommand('e c')
        end        
    end, function() 
        ExecuteCommand('e c')
    end, data.icon)
    if Config.ItemsCraft then 
        local craftingItems = Config.CraftingItems
        local randomItem = craftingItems[math.random(1, #craftingItems)]
        itemToggle(true, randomItem, Config.CraftAmts)                
    end
end)

RegisterNetEvent('xmmx_letscookplus:consumable:Drink')
AddEventHandler('xmmx_letscookplus:consumable:Drink', function(itemName)
    if emotes[itemName] then ExecuteCommand('e '..emotes[itemName]) end
    local data = {
        label = (Config.Core == "qb") and (Locales[Config.Language].progress["drinking"]..QBCore.Shared.Items[itemName].label) or Locales[Config.Language].progress["drinking"],
        time = 12000,
        icon = itemName,
    }
    ProgressConsume(data.label, data.time, function() 
        if Config.Core == "qb" then 
            itemToggle(false, itemName, 1)
            ExecuteCommand('e c')
            TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBMeta.DrinksMeta[itemName])
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        elseif Config.Core == "esx" then
            itemToggle(false, itemName, 1) 
            ExecuteCommand('e c')
        end        
    end, function() 
        ExecuteCommand('e c')
    end, data.icon)
    if Config.ItemsCraft then 
        local craftingItems = Config.CraftingItems
        local randomItem = craftingItems[math.random(1, #craftingItems)]
        itemToggle(true, randomItem, Config.CraftAmts)                
    end
end)

RegisterNetEvent('xmmx_letscookplus:consumable:DrinkAlcohol')
AddEventHandler('xmmx_letscookplus:consumable:DrinkAlcohol', function(itemName)
    if emotes[itemName] then ExecuteCommand('e '..emotes[itemName]) end
    local data = {
        label = (Config.Core == "qb") and (Locales[Config.Language].progress["drinking"]..QBCore.Shared.Items[itemName].label) or Locales[Config.Language].progress["drinking"],
        time = 12000,
        icon = itemName,
    }
    ProgressConsume(data.label, data.time, function() 
        if Config.Core == "qb" then 
            itemToggle(false, itemName, 1)
            ExecuteCommand('e c')
            TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBMeta.AlcoholMeta[itemName])
            alcoholCount = alcoholCount + 1
            if alcoholCount >= 1 and alcoholCount < 4 then
                TriggerEvent("evidence:client:SetStatus", "alcohol", 200) 
                MoonshineEffect()                                  
            elseif alcoholCount >= 4 then
                TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
                MoonshineEffect()                                   
            end
        elseif Config.Core == "esx" then 
            itemToggle(false, itemName, 1)
            ExecuteCommand('e c')
            alcoholCount = alcoholCount + 1
            if alcoholCount >= 1 and alcoholCount < 4 then
                MoonshineEffect()                                 
            elseif alcoholCount >= 4 then
                MoonshineEffect()                                   
            end
        end        
    end, function() 
        ExecuteCommand('e c')
    end, data.icon)
    if Config.ItemsCraft then 
        local craftingItems = Config.CraftingItems
        local randomItem = craftingItems[math.random(1, #craftingItems)]
        itemToggle(true, randomItem, Config.CraftAmts)                
    end
end)