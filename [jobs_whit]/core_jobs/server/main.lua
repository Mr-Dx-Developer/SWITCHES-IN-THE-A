QBCore = exports['qb-core']:GetCoreObject()



RegisterServerEvent('core_jobs:selectVehicle')
AddEventHandler('core_jobs:selectVehicle', function(car, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveMoney("cash", tonumber(price))

end)

RegisterServerEvent('core_jobs:returnVehicle')
AddEventHandler('core_jobs:returnVehicle', function(price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddMoney("cash", tonumber(price))

end)

RegisterServerEvent('core_jobs:selectClothes')
AddEventHandler('core_jobs:selectClothes', function(clothes, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveMoney("cash", tonumber(price))

end)




--- Get Players Money 
QBCore.Functions.CreateCallback('core_jobs:getMoney', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    cash = Player.PlayerData.money['cash']
    cb(cash)

end)
---- END


---- Add THUNTER items
RegisterServerEvent('core_jobs:addGold')
AddEventHandler('core_jobs:addGold', function(lootfound)

    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.AddItem(lootfound, 1)
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[lootfound], "add")
    
end)
--- END




----- SELL ITEMS

RegisterServerEvent('core_jobs:sellGold')
AddEventHandler('core_jobs:sellGold', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k,v in pairs(Config.Jobs.TreasureJob.items) do

        local loot = Player.Functions.GetItemByName(k)
        if loot ~= nil and loot.amount > 0 then
            price = v.price*loot.amount
            Player.Functions.AddMoney("cash", tonumber(price))
            Player.Functions.RemoveItem(k, loot.amount)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[k], "remove")
        
        end
    end    
    if loot == nil then 
        TriggerClientEvent('QBCore:Notify', src, Config.Text['noloot'])
    end
end)


RegisterServerEvent('core_jobs:sellFish')
AddEventHandler('core_jobs:sellFish', function(PriceCatched)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if PriceCatched >= 100 then
        Player.Functions.AddMoney("cash", tonumber(PriceCatched))
    else 
        TriggerClientEvent('QBCore:Notify', src, Config.Text['nofish'])
    end   
end)


RegisterServerEvent('core_jobs:sellCargo')
AddEventHandler('core_jobs:sellCargo', function(price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddMoney("cash", tonumber(price)) 
end)

RegisterServerEvent('core_jobs:sellScrap')
AddEventHandler('core_jobs:sellScrap', function(price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddMoney("cash", tonumber(price)) 
end)


----- END



----- ADD XP 

RegisterServerEvent('core_jobs:addXp')
AddEventHandler('core_jobs:addXp', function(xpfound)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.HaveCoreSkills == true then
        exports['core_skills']:AddExperience(source, Config.ExperienceFromThunter)
    end
    Player.Functions.SetMetaData("thunterxp", Player.PlayerData.metadata["thunterxp"]+(xpfound))
end)


RegisterServerEvent('core_jobs:addfishXp')
AddEventHandler('core_jobs:addfishXp', function(XpCatched)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.HaveCoreSkills == true then
        exports['core_skills']:AddExperience(source, Config.ExperienceFromFisher)
    end
    Player.Functions.SetMetaData("fisherxp", Player.PlayerData.metadata["fisherxp"]+(XpCatched))

end)

RegisterServerEvent('core_jobs:addCargoXp')
AddEventHandler('core_jobs:addCargoXp', function(xpgain)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.HaveCoreSkills == true then
        exports['core_skills']:AddExperience(source, Config.ExperienceFromCargo)
    end
    Player.Functions.SetMetaData("cargoxp", Player.PlayerData.metadata["cargoxp"]+(xpgain))

end)

RegisterServerEvent('core_jobs:addScrapXp')
AddEventHandler('core_jobs:addScrapXp', function(xpgain)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.HaveCoreSkills == true then
        exports['core_skills']:AddExperience(source, Config.ExperienceFromScrap)
    end
    Player.Functions.SetMetaData("scrapxp", Player.PlayerData.metadata["scrapxp"]+(xpgain))

end)

--- END


-------- TASKS REWARDS

RegisterServerEvent('core_jobs:addThunterRewards')
AddEventHandler('core_jobs:addThunterRewards', function(getxp, reward)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.HaveCoreSkills == true then
        exports['core_skills']:AddExperience(source, getxp)
    end

    Player.Functions.SetMetaData("thunterxp", Player.PlayerData.metadata["thunterxp"]+(getxp))
    Player.Functions.AddMoney("cash", tonumber(reward))

end)

RegisterServerEvent('core_jobs:addFisherRewards')
AddEventHandler('core_jobs:addFisherRewards', function(getxp, reward)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.HaveCoreSkills == true then
        exports['core_skills']:AddExperience(source, getxp)
    end

    Player.Functions.SetMetaData("fisherxp", Player.PlayerData.metadata["fisherxp"]+(getxp))
    Player.Functions.AddMoney("cash", tonumber(reward))

end)

RegisterServerEvent('core_jobs:addCargoRewards')
AddEventHandler('core_jobs:addCargoRewards', function(getxp, reward)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.HaveCoreSkills == true then
        exports['core_skills']:AddExperience(source, getxp)
    end

    Player.Functions.SetMetaData("cargoxp", Player.PlayerData.metadata["cargoxp"]+(getxp))
    Player.Functions.AddMoney("cash", tonumber(reward))

end)

RegisterServerEvent('core_jobs:addScrapRewards')
AddEventHandler('core_jobs:addScrapRewards', function(getxp, reward)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.HaveCoreSkills == true then
        exports['core_skills']:AddExperience(source, getxp)
    end

    Player.Functions.SetMetaData("scrapxp", Player.PlayerData.metadata["scrapxp"]+(getxp))
    Player.Functions.AddMoney("cash", tonumber(reward))

end)
--- END