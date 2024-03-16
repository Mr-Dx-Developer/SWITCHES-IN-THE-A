local QBCore = exports['qb-core']:GetCoreObject()
local oxyStarted = false
local Cooldown = false
players = {}
entities = {}

RegisterServerEvent('sd-oxyrun:server:SetOccupied', function(route)
	Config.Routes[route].info.occupied = true
	TriggerClientEvent('sd-oxyrun:client:SetOccupied', -1, route)
end)

-- Starting Conditions

RegisterServerEvent('sd-oxyrun:server:startr', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.PlayerData.money['cash'] >= Config.RunCost then
		TriggerClientEvent("sd-oxyrun:client:sendToOxy", src)
	else
		TriggerClientEvent('QBCore:Notify', source, Lang:t("error.you_dont_have_enough_money"), 'error')
	end
end)

RegisterServerEvent('sd-oxyrun:server:TakeMoney', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveMoney('cash', Config.RunCost)

	if Config.EnableCooldown then
        TriggerEvent('sd-oxyrun:server:coolout')
	end
end)

-- Cooldown

RegisterServerEvent('sd-oxyrun:server:coolout', function()
    Cooldown = true
    local timer = Config.Cooldown * 1000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            Cooldown = false
        end
    end
end)

QBCore.Functions.CreateCallback("sd-oxyrun:server:coolc",function(source, cb)
    if Cooldown then
        cb(true)
    else
        cb(false) 
    end
end)

-- Minimum Cop Callback

QBCore.Functions.CreateCallback('sd-oxyrun:server:getCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)


RegisterNetEvent("sd-oxyrun:server:sendCar")
AddEventHandler("sd-oxyrun:server:sendCar", function(Routes)
	if oxyStarted == false then
		TriggerClientEvent("sd-oxyrun:createOxyVehicle", source, Routes)
		
	end
end)

RegisterNetEvent("sd-oxyrun:server:deliver")
AddEventHandler("sd-oxyrun:server:deliver", function()
	local Player = QBCore.Functions.GetPlayer(source)
	local hasPackage = Player.Functions.GetItemByName("package")
	local hasBags = Player.Functions.GetItemByName("markedbills")
	local hasBands = Player.Functions.GetItemByName("bands")
	local hasRolls = Player.Functions.GetItemByName("rolls")

	local chance = math.random(0,100)

	if hasPackage then
		if Config.PrintChance then
		print(chance)
	    end
		if Config.GiveItem then
			local chance = math.random(1, 100)
			local itemCount = math.random(Config.MinItemReward, Config.MaxItemReward)
			local itemCount2 = math.random(Config.MinSpecialReward, Config.MaxSpecialReward)

            Player.Functions.AddItem(Config.ItemReward, itemCount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.ItemReward], "add", itemCount)
			
			if chance <= Config.SpecialRewardChance then
				Player.Functions.AddItem(Config.SpecialItem, itemCount2)
				TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.SpecialItem], "add", itemCount2)
			end
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
		end
	
		Player.Functions.RemoveItem("package", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['package'], "remove")
	end
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

AddEventHandler('onResourceStop', function(resource)
	if resource ~= GetCurrentResourceName() then
		return
	end
	CleanUp()
end)

function CleanUp()
	for _, entity in ipairs(entities) do
		if DoesEntityExist(entity) then
			DeleteEntity(entity)
		end
	end
	for k,v in pairs(players) do
	end
	players = {}
	entities = {}
	oxyStarted = false
end

QBCore.Functions.CreateUseableItem('package', function(source) 
	TriggerClientEvent('sd-oxyrun:client:hasPackage', source) 
end) 


QBCore.Functions.CreateCallback('sd-oxyrun:server:hasPackage', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local hasPackage = Player.Functions.GetItemByName("package")
 
	if hasPackage ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sd-oxyrun:server:canCarry', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
 
	if Player.Functions.AddItem("package", 1) then
		cb(true)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['package'], "add")
	else
		cb(false)
	end
end)