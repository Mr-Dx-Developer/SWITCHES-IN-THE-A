local QBCore = exports['qb-core']:GetCoreObject()


local weedAttach = {
	['animDict'] = 'anim@heists@narcotics@trash',
	['animName'] = 'drop_side',
	['model'] = 'hei_prop_heist_weed_block_01',
	['bone'] = 28422,
	['x'] = 0.01,
	['y'] = -0.02,
	['z'] = -0.12,
	['xR'] = 0.0,
	['yR'] = 0.0,
	['zR'] = 0.0,
	['vertexIndex'] = 0,
}


local isOnDeliveryTask = false
local CurrentDeliveryNPC = nil
local finishedDelivery = 0
local currentCollected = 0
local maxCollect = 5

onRun = false
delievered = true

gettingBox = false
amountOfBox = 0

local spawnedPeds = {}

local CurrentCops = 0

local bliptable = {}

-- Cop Minimum Amount

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)


-- Ped Creation

function SetupWeedBoss()
	BossHash = Config.BossPed[math.random(#Config.BossPed)]
	loc = Config.BossLocation[math.random(#Config.BossLocation)]
	QBCore.Functions.LoadModel(BossHash)
    local Boss = CreatePed(0, BossHash, loc.x, loc.y, loc.z-1.0, loc.w, false, false)
    SetPedFleeAttributes(Boss, 0, 0)
    SetPedDiesWhenInjured(Boss, false)
    TaskStartScenarioInPlace(Boss, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
    SetPedKeepTask(Boss, true)
    SetBlockingOfNonTemporaryEvents(Boss, true)
    SetEntityInvincible(Boss, true)
    FreezeEntityPosition(Boss, true)
end

function CreatePeds()
	SetupWeedBoss()
end

CreateThread(function()
    CreatePeds()
end)

-- Target Exports

CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.BossPed, {
        options = {
            { 
				type = "client",
				event = "sd-weedrun:client:checkitem",
				icon = "fas fa-circle",
				label = Lang:t("target.weedboss"),

            },
            { 
                type = "client", 
				event = "sd-weedrun:client:packagegoods",
				icon = "fas fa-box",
				label = Lang:t("target.package_goods"),
			},
			
        },
        distance = 3.0 
    })

end)

-- Police Alert

function policeAlert()
	-- exports['qb-dispatch']:Oxy() -- Project-SLoth qb-dispatch
	-- TriggerServerEvent('police:server:policeAlert', 'Suspicious Hand-off') -- Regular qbcore
	-- These are just examples, you will have to implement your own system!
end

-- Sign in Event

RegisterNetEvent('sd-weedrun:client:checkitem')
AddEventHandler('sd-weedrun:client:checkitem', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
            TriggerEvent('sd-weedrun:client:start')
        else
			QBCore.Functions.Notify(Lang:t("error.no_packages"), 'error')
        end
    end, "weedpackage")
end)

RegisterNetEvent('sd-weedrun:client:start', function ()
    QBCore.Functions.TriggerCallback("sd-weedrun:server:getCops", function(enoughCops)
        if enoughCops >= Config.MinimumPolice then
            QBCore.Functions.TriggerCallback("sd-weedrun:server:coolc",function(isCooldown)
                if not isCooldown then
					if Config.EnableAnimation then
						TriggerEvent('animations:client:EmoteCommandStart', {Config.Animation})
					end
                    QBCore.Functions.Progressbar("search_register", Lang:t("progress.preparing_run"), 5000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                    }, {}, {}, function() -- Done
						if Config.EnableAnimation then
							TriggerEvent('animations:client:EmoteCommandStart', {"c"})
						end
                        TriggerServerEvent('sd-weedrun:server:startr')
                    end, function() -- Cancel
                        QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("error.someone_recently_did_this"), 'error')
					if Config.EnableAnimation then
						TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					end
                end            
            end)
        else
            QBCore.Functions.Notify(Lang:t("error.cannot_do_this_right_now"), 'error')
        end
    end)
end)

-- Sign Out Event

RegisterNetEvent('sd-weedrun:client:signoff', function()

	exports['qb-target']:RemoveTargetModel(Config.BossPed, {
		Lang:t("target.weedboss"),
	})

	exports['qb-target']:AddTargetModel(Config.BossPed, {
		options = {
			{
				type = "client",
				event = "sd-weedrun:client:endRun",
				icon = "fas fa-circle",
				label = Lang:t("target.sign_out_target"),

			}
		},
		distance = 2.0
	})
end)

-- Sign In Event on Cooldown

RegisterNetEvent('sd-weedrun:signin', function()
	exports['qb-target']:RemoveTargetModel(Config.BossPed, {
		Lang:t("target.sign_out_target")
	})

	exports['qb-target']:AddTargetModel(Config.BossPed, {
		options = {
			{
				type = "client",
				event = "sd-weedrun:client:endRun2",
				icon = "fas fa-circle",
				label = Lang:t("target.sign_out_target2"),
	
			}
		},
		distance = 2.0
	})
end)

-- Sign Off Event after Cooldown

RegisterNetEvent('sd-weedrun:client:endRun2', function()  
	ClearAllBlipRoutes()

	for _,v in pairs(bliptable) do
		RemoveBlip(v)
	end

	QBCore.Functions.Notify(Lang:t("error.sign_out"), 'error')

	exports['qb-target']:AddTargetModel(Config.BossPed, {
		options = {
			{
				type = "client",
				event = "sd-weedrun:client:checkitem",
				icon = "fas fa-circle",
				label = Lang:t("target.weedboss"),
	
			}
		},
		distance = 2.0
	})

	exports['qb-target']:RemoveTargetModel(Config.BossPed, {
		Lang:t("target.sign_out_target2")
	})

end)

-- Sign On Event on Cooldown

RegisterNetEvent('sd-weedrun:client:endRun', function()  
	ClearAllBlipRoutes()

	for _,v in pairs(bliptable) do
		RemoveBlip(v)
	end

	DeleteEntity(CurrentDeliveryNPC)
	DeleteEntity(weedObject)

	TriggerServerEvent('sd-weedrun:server:signoff')

	QBCore.Functions.Notify(Lang:t("error.sign_out"), 'error')

exports['qb-target']:AddTargetModel(Config.BossPed, {
	options = {
		{
			type = "client",
			event = "sd-weedrun:client:checkitem",
			icon = "fas fa-circle",
			label = Lang:t("target.weedboss"),

		}
	},
	distance = 2.0
})

exports['qb-target']:RemoveTargetModel(Config.BossPed, {
	Lang:t("target.sign_out_target")
})

end)

-- Weed Run Main

RegisterNetEvent('sd-weedrun:client:nextdelivery', function()
	ClearAllBlipRoutes()
	for _,v in pairs(bliptable) do
		RemoveBlip(v)
	end
	if finishedDelivery ~= 10 then
		isOnDeliveryTask = false

		QBCore.Functions.Notify("Drive to the next handoff location", 'success')
		TriggerEvent('weed-generate-sell-loc')

	else

	end
end)

RegisterNetEvent('weed-generate-sell-loc', function()
	ClearAllBlipRoutes()
	for _,v in pairs(bliptable) do
		RemoveBlip(v)
	end
	CreateThread(function()
		while true do
			Wait(200)
			if IsPedInAnyVehicle(PlayerPedId()) then
				isOnDeliveryTask = true
				break
			end
		end
	end)

	local hash, name = PedReturn()
	local generateCoords = genCoord()

	while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(1) 
	end

	blipolustur(generateCoords.x, generateCoords.y, 514, 25, 0.7, 'Client')

	Wait(22000)
	DeleteEntity(CurrentDeliveryNPC)
	DeleteEntity(weedObject)
  
	CurrentDeliveryNPC = CreatePed(4, hash, generateCoords.x, generateCoords.y, generateCoords.z, generateCoords.w, false, false)
	SetEntityInvincible(CurrentDeliveryNPC, true)
	SetBlockingOfNonTemporaryEvents(CurrentDeliveryNPC, true)


	exports['qb-target']:AddTargetModel({name}, {
		options = {
			{
				event = "sd-weedrun:client:deliverPackage",
				icon = "fas fa-hand-holding",
				label = Lang:t("target.deliver_package"),

				canInteract = function()
					if delievered then return true else return false end 
				end

			}
		},
		distance = 2.0
	})
	end)

PedReturn = function()
	local peds = {
		'ig_money',
		'a_m_y_beachvesp_02',
		'a_m_y_breakdance_01',
		'ig_car3guy1',
		'a_m_y_business_03',
		's_m_m_cntrybar_01',
		'ig_devin',
		'ig_dreyfuss',
		'a_m_m_fatlatin_01',
		'u_m_y_baygor',
	}
	local generateModel = math.random(1, #peds)
	local retval = GetHashKey(peds[generateModel])
	return retval, peds[generateModel]
end

genCoord = function()
	local sayi = math.random(1, #Config.handoffPeds)
	if sayi == oldugum_bolge then
		if sayi == 15 then
			sayi = sayi - 1
		else
			sayi = sayi + 1
		end
		ClearAllBlipRoutes()
	else
		ClearAllBlipRoutes()
	end

	local retval = Config.handoffPeds[sayi]
	return retval
end

LoadPropDict = function(model)
	while not HasModelLoaded(GetHashKey(model)) do
		RequestModel(GetHashKey(model))
		Wait(10)
	end
end

loadAnimDict = function(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(1)
	end
end

function blipolustur(x, y, sprite, colour, scale, text)
	local blip = AddBlipForCoord(x, y)
	SetBlipSprite(blip, sprite)
	SetBlipColour(blip, colour)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, scale)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
	SetBlipRoute(blip, true)
	table.insert(bliptable, blip)
end

RegisterNetEvent('onReceiveItem', function(item, amount, nonStacking, itemdata)
	if item == 'weedpackage' then
		local Prop = "hei_prop_heist_box"
		local bone = 60309
		PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack({0.025, 0.08, 0.255, -145.0, 290.0, 0.0})
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		if not HasModelLoaded(Prop) then
			LoadPropDict(Prop)
		end
		prop = CreateObject(GetHashKey(Prop), x, y, z+0.2, true, true, true)
		AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), bone), PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6, true, true, false, true, 1, true)
		SetModelAsNoLongerNeeded(Prop)
		elimde = true
		CreateThread(function()
			while collected do
				if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 1) then
					loadAnimDict("anim@heists@box_carry@") 
					TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, -1, 51, 0, false, false, false)
				end

				if not collected then
					return
				end
				Wait(500)
			end
		end)
	end 
end)


-- Weed Packaging

RegisterNetEvent('sd-weedrun:client:packagegoods', function()
	QBCore.Functions.TriggerCallback("sd-weedrun:ItemCheck", function(result)
		if result then
			exports['qb-target']:RemoveTargetModel(Config.BossPed, {
				Lang:t("target.package_goods"),
			})

			QBCore.Functions.Notify(Lang:t("error.stay_near"), 'error')
			Wait(500)
			TriggerServerEvent('weed:processWeed')
		else
			QBCore.Functions.Notify(Lang:t("error.no_green"), 'error')
		end
	end, Config.Item)

end)

RegisterNetEvent('now-can-collect-package', function()
	QBCore.Functions.Notify(Lang:t("success.collect_package"), 'success')
	exports['qb-target']:AddTargetModel(Config.BossPed, {
		options = {
			{
				event = "collect-weed",
				icon = "fas fa-box",
				label = Lang:t("target.collect_goods"),
			}
		},
		distance = 2.0
	})
end)

RegisterNetEvent('collect-weed', function()

	exports['qb-target']:AddTargetModel(Config.BossPed, {
		options = {
			{
				event = "sd-weedrun:client:packagegoods",
				icon = "fas fa-box",
				label = Lang:t("target.package_goods"),
			}
		},
		distance = 2.0
	})

	TriggerServerEvent('sd-weedrun:server:packagereward')

end)


RegisterNetEvent('sd-weedrun:client:removetarget', function()
	exports['qb-target']:RemoveTargetModel(Config.BossPed, {
		Lang:t("target.collect_goods"),
	})
end)

RegisterNetEvent('sd-weedrun:client:checkPackage', function()
Wait(23000)
delievered = true
end)

RegisterNetEvent("sd-weedrun:client:deliverPackage")
AddEventHandler("sd-weedrun:client:deliverPackage", function()
	if holdingBox then
		PlayAmbientSpeech1(CurrentDeliveryNPC, 'Chat_State', 'Speech_Params_Force')
		TaskTurnPedToFaceEntity(CurrentDeliveryNPC, PlayerPedId(), 0)
		holdingBox = false
		delievered = false

		QBCore.Functions.Progressbar("search_register", Lang:t("progress.weighing_package"), 2500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {
		}, {}, {}, function() -- Done

		PlayAmbientSpeech1(CurrentDeliveryNPC, 'GENERIC_THANKS', 'Speech_Params_Force')
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})

		TriggerEvent('sd-weedrun:client:checkPackage')

		QBCore.Functions.Progressbar("search_register", Lang:t("progress.counting_bills"), 2500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {

		}, {}, {}, function() -- Done

			if math.random(1,100) <= Config.CallCopsChance then
				policeAlert()
			end
                
			RequestAnimDict('anim@heists@box_carry@')
			while not HasAnimDictLoaded('anim@heists@box_carry@') do
				Wait(0)
			end
			ClearPedTasksImmediately(CurrentDeliveryNPC)
			RequestModel(weedAttach.model)
			while not HasModelLoaded(weedAttach.model) do
				Wait(0)
			end
			local plyCoords = GetEntityCoords(PlayerPedId())
			local weedObject = CreateObjectNoOffset(weedAttach.model, plyCoords.x, plyCoords.y, plyCoords.z - 5.0, 1, 1, 0)
			SetObjectAsNoLongerNeeded(weedObject)
			AttachEntityToEntity(
				weedObject, CurrentDeliveryNPC, GetPedBoneIndex(CurrentDeliveryNPC, weedAttach.bone), 
				weedAttach.x, weedAttach.y, weedAttach.z, weedAttach.xR, weedAttach.yR, weedAttach.zR, 1, 1, 0, 0, 2, 1
			)
			TaskPlayAnim(CurrentDeliveryNPC, 'anim@heists@box_carry@', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			TaskWanderStandard(CurrentDeliveryNPC, 10.0, 10)
			finishedDelivery = finishedDelivery + 1
			
		    TriggerServerEvent('package-delivered')

	end)
end)

	else
		QBCore.Functions.Notify(Lang:t("error.no_package"), 'error')
	end
end)

RegisterNetEvent("sd-weedrun:client:hasPackage")
AddEventHandler("sd-weedrun:client:hasPackage", function()
	local ped = PlayerPedId()

	QBCore.Functions.TriggerCallback('sd-weedrun:server:hasPackage', function(hasItems)
		if hasItems then
			TriggerEvent('animations:client:EmoteCommandStart', {"box"})
			holdingBox = true
		elseif holdingBox and not hasItems then
			TriggerEvent('animations:client:EmoteCommandStart', {"box"})
			Wait(250)
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			holdingBox = false
		end
	end)
end)
 
-- Resource Cleanup

AddEventHandler('onResourceStop', function(r)
    if r == GetCurrentResourceName()
    then

			exports['qb-target']:RemoveTargetModel(Config.BossPed, {
				Lang:t("target.sign_out_target")
			})

			exports['qb-target']:RemoveTargetModel(Config.BossPed, {
				Lang:t("target.sign_out_target2")
			})

			DeleteEntity(CurrentDeliveryNPC)
			DeleteEntity(weedObject)

        end
    end)

-- E-Mail Creation

RegisterNetEvent('sd-weedrun:client:email', function() 
	if Config.SendEmail then
		QBCore.Functions.Notify(Lang:t("success.send_email_right_now"), 'success')
	RunStart()
	end
end)

function RunStart()
	Citizen.Wait(2000)
	TriggerServerEvent('qb-phone:server:sendNewMail', {
	sender = Lang:t('mailstart.sender'),
	subject = Lang:t('mailstart.subject'),
	message = Lang:t('mailstart.message'),
	})
	Citizen.Wait(3000)
end