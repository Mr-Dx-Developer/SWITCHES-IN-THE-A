local QBCore = exports['qb-core']:GetCoreObject()

local Cooldown = false
local checkpackage = true
local packagerecieved = false
players = {}
entities = {}

-- Starting Conditions

RegisterServerEvent('sd-weedrun:server:startr', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.PlayerData.money['cash'] >= Config.RunCost then
		Player.Functions.RemoveMoney('cash', Config.RunCost)
		TriggerClientEvent('weed-generate-sell-loc', src)
		TriggerClientEvent('sd-weedrun:client:signoff', src)
		TriggerClientEvent('sd-weedrun:client:email', src)
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_refund"), 'error')
		if Config.EnableCooldown then
        TriggerEvent('sd-weedrun:server:coolout')
		end
	else
		TriggerClientEvent('QBCore:Notify', source, Lang:t("error.you_dont_have_enough_money"), 'error')
	end
end)


-- Cooldown

RegisterServerEvent('sd-weedrun:server:coolout', function()
    Cooldown = true
    local timer = Config.Cooldown * 1000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
			TriggerClientEvent('sd-weedrun:signin', -1)
            Cooldown = false

        end
    end
end)

RegisterServerEvent('sd-weedrun:server:signoff', function()
	Cooldown = false
end)

QBCore.Functions.CreateCallback("sd-weedrun:server:coolc",function(source, cb)
    if Cooldown then
        cb(true)
    else
        cb(false) 
    end
end)

-- Weed Run Packaging

QBCore.Functions.CreateCallback('sd-weedrun:ItemCheck', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasItem = Player.Functions.GetItemByName(item)

	if hasItem ~= nil then
		if hasItem.amount >= Config.ItemAmount then
		  cb(true)
		else
		  cb(false)
		end
	else
		cb(false)
	end
end)

RegisterServerEvent('weed:processWeed', function()
	local src = source
	local ply = QBCore.Functions.GetPlayer(source)

	ply.Functions.RemoveItem('weedbud', Config.ItemAmount)

	Wait(15000) --15 sn
	TriggerClientEvent('now-can-collect-package', src)
end)


-- Packaging Reward

RegisterServerEvent("sd-weedrun:server:packagereward", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not packagerecieved then
        packagerecieved = false

        Player.Functions.AddItem("weedpackage", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weedpackage"], 'add')
		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.there_u_go"), 'success')

		TriggerClientEvent('sd-weedrun:client:removetarget', src)

    else
        TriggerClientEvent('QBCore:Notify', src, "Error!", "error", 2500)
    end
end)	

-- Weed Run Reward

RegisterServerEvent('package-delivered', function()
	local Player = QBCore.Functions.GetPlayer(source)
	local ply = QBCore.Functions.GetPlayer(source)
	local hasBags = Player.Functions.GetItemByName("markedbills")
	local hasBands = Player.Functions.GetItemByName("bands")
	local hasRolls = Player.Functions.GetItemByName("rolls")
	local itemCount = math.random(Config.MinSpecialReward, Config.MaxSpecialReward)

	local chance = math.random(0,100)

	ply.Functions.RemoveItem('weedpackage', 1)
	ply.Functions.AddMoney('cash', math.random(2500, 4000))

	if chance <= Config.SpecialRewardChance then
		Player.Functions.AddItem(Config.SpecialItem, itemCount)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.SpecialItem], "add", itemCount)
	end

		if Config.CleanMoney then

			if chance < Config.BagChance then
				if hasBags then
					worth = Player.Functions.GetItemByName('markedbills').info.worth
					bagAmount = math.random(Player.Functions.GetItemByName("markedbills").amount)
					Player.Functions.AddMoney('cash', bagAmount*worth)

					Player.Functions.RemoveItem("markedbills", bagAmount)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["markedbills"], "remove")
				end
			end

			if chance < Config.BandChance then
				if hasBands then
					bandAmount = math.random(Player.Functions.GetItemByName("bands").amount)
					Player.Functions.AddMoney('cash', bandAmount*math.random(Config.BandMinPayout, Config.BandMaxPayout))

					Player.Functions.RemoveItem("bands", bandAmount)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["bands"], "remove")
				end
			end

			if chance < Config.RollChance then
				if hasRolls then
					rollAmount = math.random(Player.Functions.GetItemByName("rolls").amount)
					Player.Functions.AddMoney('cash', rollAmount*math.random(Config.RollMinPayout, Config.RollMaxPayout))

					Player.Functions.RemoveItem("rolls", rollAmount)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["rolls"], "remove")
				end
			end

	TriggerClientEvent('sd-weedrun:client:nextdelivery', source)

	end
end)


-- Minimum Cop Callback

QBCore.Functions.CreateCallback('sd-weedrun:server:getCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)




AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end
	for i=1, 1000 do
		if GetPlayerPed(i) ~= 0 then
			players[i] = {}
		end
	end
end)

QBCore.Functions.CreateUseableItem('weedpackage', function(source) 
	TriggerClientEvent('sd-weedrun:client:hasPackage', source) 
end) 


QBCore.Functions.CreateCallback('sd-weedrun:server:hasPackage', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local hasPackage = Player.Functions.GetItemByName("weedpackage")
 
	if hasPackage ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sd-weedrun:server:canCarry', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
 
	if Player.Functions.AddItem("package", 1) then
		cb(true)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['package'], "add")
	else
		cb(false)
	end
end)
