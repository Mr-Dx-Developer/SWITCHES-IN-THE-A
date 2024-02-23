local function CreateObjectId()
    local objectId = math.random(10000, 99999)
    return objectId
end

-- Props & Grocery Bags:
AddEventHandler('onResourceStart', function(r)
    if GetCurrentResourceName() ~= r then
        return
    end

    local function CreateUsableItem(itemName, propModel, triggerFunction)
        if Config.Core == "qb" then
            QBCore.Functions.CreateUseableItem(itemName, function(source, item)
                local src = source
                local player = QBCore.Functions.GetPlayer(src)
                local objectId = CreateObjectId()
                triggerFunction(src, objectId, propModel, itemName)
            end)
        elseif Config.Core == "esx" then
            ESX.RegisterUsableItem(itemName, function(source)
                local xPlayer = ESX.GetPlayerFromId(source)
                local objectId = CreateObjectId()
                triggerFunction(source, objectId, propModel, itemName)
            end)
        end
    end

    local function ProcessGroceryBag(player, itemName, bagItems)
        Wait(5500)
        local success
    
        if Config.Core == "qb" then
            success = player.Functions.RemoveItem(itemName, 1)
        elseif Config.Core == "esx" then
            success = player.removeInventoryItem(itemName, 1)
        end
    
        if success then
            for bagItemName, amount in pairs(bagItems) do
                if Config.Core == "qb" then
                    player.Functions.AddItem(bagItemName, amount)
                    -- add itembox event or notification here
                elseif Config.Core == "esx" then
                    player.addInventoryItem(bagItemName, amount)
                    -- add itembox event or notification here
                end
            end
        end
    end

    local function CreateGroceryItem(itemName, bagItems)
        if Config.Core == "qb" then
            QBCore.Functions.CreateUseableItem(itemName, function(source, item)
                local player = QBCore.Functions.GetPlayer(source)

                if Shop.GroceryBags then
                    TriggerClientEvent("xmmx_letscookplus:client:openGroceryBag", source, itemName)
                    ProcessGroceryBag(player, itemName, bagItems)
                else
                    print('Lets Cook: Grocery Bags are disabled in the Config. Enable to use or remove from the shop.')
                end
            end)
        elseif Config.Core == "esx" then
            ESX.RegisterUsableItem(itemName, function(source, item)
                local xPlayer = ESX.GetPlayerFromId(source)

                if Shop.GroceryBags then
                    TriggerClientEvent("xmmx_letscookplus:client:openGroceryBag", source, itemName)
                    ProcessGroceryBag(xPlayer, itemName, bagItems)
                else
                    print('Lets Cook: Grocery Bags are disabled in the Config. Enable to use or remove from the shop.')
                end
            end)
        end
    end

    if Config.Core == "qb" or Config.Core == "esx" then
        local items = {
            { name = 'lc_printer',   model = Config.PrinterProp,        func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_partybox',  model = Config.PartyboxProp,       func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_hobo',      model = Config.HoboProp,           func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_grill',     model = Config.GrillProp,          func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_stove',     model = Config.StoveProp,          func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_microwave', model = Config.MicrowaveProp,      func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_juicer',    model = Config.JuicerProp,         func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_coffee',    model = Config.CoffeeProp,         func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_griddle',   model = Config.GriddleProp,        func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_processor', model = Config.ProcessorProp,      func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_toaster',   model = Config.ToasterProp,        func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_fryer',     model = Config.FryerProp,          func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_table',     model = Config.TableProp,          func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_chair',     model = Config.ChairProp,          func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_gazebo',    model = Config.TentProp,           func = 'xmmx_letscookplus:client:spawnProp' },
            { name = 'lc_still',     model = Config.StillProp,          func = 'xmmx_letscookplus:client:spawnProp' },
            -- Add other items as needed

            -- Additional items with unique functions (these do not save to database)
            { name = 'lc_weapbench',     model = Config.WeaponBench,       func = 'xmmx_letscookplus:client:SpawnWeapBench'  },
            { name = 'lc_attabench',     model = Config.AttachmentBench,   func = 'xmmx_letscookplus:client:SpawnAttaBench' }, 
            { name = 'lc_ammobench',     model = Config.AmmoBench,         func = 'xmmx_letscookplus:client:SpawnAmmoBench' }, 
        }

        for _, item in ipairs(items) do
            CreateUsableItem(item.name, item.model, function(src, objectId, propModel, itemName)
                TriggerClientEvent(item.func, src, objectId, propModel, itemName, src)
            end)
        end

        local groceryItems = {
            { name = 'grocerya', bagItems = { lclobstertails = Shop.GroceryAmt, lcbeefpatty = Shop.GroceryAmt, lcrawbeef = Shop.GroceryAmt, lcsausage = Shop.GroceryAmt, lcrawribs = Shop.GroceryAmt, lcrawchicken = Shop.GroceryAmt, lchamslice = Shop.GroceryAmt, lcbeefstrips = Shop.GroceryAmt, lcrawbreast = Shop.GroceryAmt, lcrawsalmon = Shop.GroceryAmt, lcrawfish = Shop.GroceryAmt, lcrawoxtail = Shop.GroceryAmt, lcrawchops = Shop.GroceryAmt, lcseasoning = Shop.GroceryAmt, lcveggiepack = 1 } },
            { name = 'groceryb', bagItems = { lcbutter = Shop.GroceryAmt, lccheese = Shop.GroceryAmt, lcmilk = Shop.GroceryAmt, water_jug = Shop.GroceryAmt, lccreamer = Shop.GroceryAmt, lcpudding = Shop.GroceryAmt, lcicing = Shop.GroceryAmt, lclemon = Shop.GroceryAmt, lcgrapes = Shop.GroceryAmt, lcorange = Shop.GroceryAmt, lcbanana = Shop.GroceryAmt, lcstrawberry = Shop.GroceryAmt, lccorncob = Shop.GroceryAmt, lcpotato = Shop.GroceryAmt, lcdryrice = Shop.GroceryAmt, lcvegoil = Shop.GroceryAmt, lcsugar = Shop.GroceryAmt, lcflour = Shop.GroceryAmt, lcburgerbun = Shop.GroceryAmt, lcbread = 1 } },
            { name = 'groceryc', bagItems = { lcbbqsauce = Shop.GroceryAmt, lcmarinara = Shop.GroceryAmt, lcsyrup = Shop.GroceryAmt, lcjelly = Shop.GroceryAmt, lcpbutter = Shop.GroceryAmt, lcpancakes = Shop.GroceryAmt, lcfrozewaff = Shop.GroceryAmt, lcfrozenpizza = Shop.GroceryAmt, lccheestkpk = Shop.GroceryAmt, lcptartpk = Shop.GroceryAmt, lcvaniwafers = Shop.GroceryAmt, lcmaccheese = Shop.GroceryAmt, lcramenpack = Shop.GroceryAmt, lcteabag = Shop.GroceryAmt, lccoffeepod = Shop.GroceryAmt, lcgteapod = Shop.GroceryAmt, lccocoapod = Shop.GroceryAmt, lcicecubes = 1 } },
            -- Add other grocery items as needed
        }

        for _, item in ipairs(groceryItems) do
            CreateGroceryItem(item.name, item.bagItems)
        end
    else
        print("[XMMX-DEBUG] Invalid Config.Core value. Supported values are 'qb' and 'esx'.")
    end
end)


-- Food & Drink Items:
AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
    if Config.Core == "qb" then
        for k, v in pairs(Cooking) do
            for i = 1, #v do
                for l, b in pairs(v[i]) do
                    if not QBCore.Shared.Items[l] and l ~= "amount" then print("Cooking: Missing Item from QBCore.Shared.Items: '"..l.."'") end
                    if type(b) == "table" then
                        for j, c in pairs(b) do	if not QBCore.Shared.Items[j] then print("Cooking: Missing Item from QBCore.Shared.Items: '"..j.."'") end end
                    end 
                end 
            end 
        end
        
        for k,_ in pairs(QBMeta.DrinksMeta) do
            QBCore.Functions.CreateUseableItem(k, function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)
                TriggerClientEvent("xmmx_letscookplus:consumable:Drink", source, item.name)
            end)
        end

        for k,_ in pairs(QBMeta.EatsMeta) do
            QBCore.Functions.CreateUseableItem(k, function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)
                TriggerClientEvent("xmmx_letscookplus:consumable:Eat", source, item.name)
            end)
        end

        for k,_ in pairs(QBMeta.AlcoholMeta) do
            QBCore.Functions.CreateUseableItem(k, function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)
                TriggerClientEvent("xmmx_letscookplus:consumable:DrinkAlcohol", source, item.name)
            end)
        end
    elseif Config.Core == "esx" then 
        for k, _ in pairs(ESXMeta.EatsMeta) do
            ESX.RegisterUsableItem(k, function(source, item, _)
                local xPlayer = ESX.GetPlayerFromId(source)
                local itemName = k
                TriggerClientEvent('xmmx_letscookplus:consumable:Eat', source, itemName)
                Wait(5000)
                local hungerValue = ESXMeta.EatsMeta[k]
                TriggerClientEvent('esx_status:add', source, 'hunger', hungerValue)
            end)
        end    
    
        for k, _ in pairs(ESXMeta.DrinksMeta) do
            ESX.RegisterUsableItem(k, function(source, item, _)
                local xPlayer = ESX.GetPlayerFromId(source)
                local itemName = k
                TriggerClientEvent('xmmx_letscookplus:consumable:Drink', source, itemName)
                Wait(5000)
                local thirstValue = ESXMeta.DrinksMeta[k]
                TriggerClientEvent('esx_status:add', source, 'thirst', thirstValue)
            end)
        end 
    
        for k, _ in pairs(ESXMeta.AlcoholMeta) do
            ESX.RegisterUsableItem(k, function(source, item, _)
                local xPlayer = ESX.GetPlayerFromId(source)
                local itemName = k
                TriggerClientEvent('xmmx_letscookplus:consumable:DrinkAlcohol', source, itemName)
                Wait(5000)
                local thirstValue = ESXMeta.AlcoholMeta[k]
                TriggerClientEvent('esx_status:add', source, 'thirst', thirstValue)
            end)
        end         
    end
end)