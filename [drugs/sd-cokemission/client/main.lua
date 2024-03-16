local QBCore = exports['qb-core']:GetCoreObject()

blackout = false

local CurrentCops = 0

-- Cop Minimum Amount

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

-- Ped Creation

pedhash = GetHashKey('s_m_y_dealer_01')

pedhash2 = GetHashKey('s_m_y_uscg_01')

function SetupRunPed(coords)
	RequestModel(`s_m_y_uscg_01`)
	  while not HasModelLoaded(`s_m_y_uscg_01`) do
	  Wait(1)
    end
    cokeman = CreatePed(2, `s_m_y_uscg_01`, coords.x, coords.y, coords.z-1.0, coords.w, false, false)
    SetPedFleeAttributes(cokeman, 0, 0)
    SetPedDiesWhenInjured(cokeman, false)
    TaskStartScenarioInPlace(cokeman, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
    SetPedKeepTask(cokeman, true)
    SetBlockingOfNonTemporaryEvents(cokeman, true)
    SetEntityInvincible(cokeman, true)
    FreezeEntityPosition(cokeman, true)
end

function SetupProcessingPed(coords)
	RequestModel(`s_m_y_dealer_01`)
	  while not HasModelLoaded(`s_m_y_dealer_01`) do
	  Wait(1)
    end
    cokeman2 = CreatePed(2, `s_m_y_dealer_01`, coords.x, coords.y, coords.z-1.0, coords.w, false, false)
    SetPedFleeAttributes(cokeman2, 0, 0)
    SetPedDiesWhenInjured(cokeman2, false)
    TaskStartScenarioInPlace(cokeman2, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
    SetPedKeepTask(cokeman2, true)
    SetBlockingOfNonTemporaryEvents(cokeman2, true)
    SetEntityInvincible(cokeman2, true)
    FreezeEntityPosition(cokeman2, true)
end

function CreatePeds()
    for i = 1, #Config.Peds do
        if Config.Peds[i].type == 'cokeman' then
            SetupRunPed(Config.Peds[i].position, i)
        end
        if Config.Peds[i].type == 'cokeman2' then
            SetupProcessingPed(Config.Peds[i].position, i)
        end
    end
end

CreateThread(function()
    if Config.DisableBlackoutRequirement then
        exports['qb-target']:AddTargetModel({pedhash2}, {
            options = {
                {
                    type = "client",
                    event = "sd-cokemission:client:start",
                    icon = "fas fa-user-secret",
                    label = "Pay me $100,000 :)",
    
                },
            },
            distance = 2.0
        })
    end
    CreatePeds()
end)

-- Blip Creation

Citizen.CreateThread(function()
	for _, info in pairs(Config.BlipLocation) do
		if Config.UseBlip then
	   		info.blip = AddBlipForCoord(info.x, info.y, info.z)
	   		SetBlipSprite(info.blip, info.id)
	   		SetBlipDisplay(info.blip, 4)
	   		SetBlipScale(info.blip, 0.6)	
	   		SetBlipColour(info.blip, info.colour)
	   		SetBlipAsShortRange(info.blip, true)
	   		BeginTextCommandSetBlipName("STRING")
	   		AddTextComponentString(' '.. info.title)
	   		EndTextCommandSetBlipName(info.blip)
	 	end
   	end	
end)


-- Police Alert

function policeAlert()
	-- exports['qb-dispatch']:BankRobbery() -- Project-SLoth qb-dispatch
	-- TriggerServerEvent('police:server:policeAlert', 'Bobcat Robbery') -- Regular qbcore
    -- These are just examples, you'll have to implement your own police alert system!
end 

-- Start!

RegisterNetEvent('sd-cokemission:client:start', function ()
	QBCore.Functions.TriggerCallback("sd-cokemission:server:getCops", function(enoughCops)
    if enoughCops >= Config.MinimumPolice then
        QBCore.Functions.TriggerCallback("sd-cokemission:server:coolc",function(isCooldown)
            if not isCooldown then
                QBCore.Functions.Progressbar("search_register", "Talking to..", 2200, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                }, {}, {}, function() -- Done
                    TriggerServerEvent('sd-cokemission:server:startr')
                end, function() -- Cancel
                    QBCore.Functions.Notify("Cancelled", 'error')
                end)
            else
                QBCore.Functions.Notify("Someone Recently did this.", 'error')
            end
        end)
    else
        QBCore.Functions.Notify("Cannot do this right now.", 'error')
	end
end)
end)

-- Sell Packages

RegisterNetEvent('sd-cokemission:client:targetexport', function()

if Config.EnableSelling then
exports['qb-target']:AddTargetModel('s_m_y_uscg_01', {
    options = {
        { 
            type = "client",
            event = "sd-cokemission:SellItemCheck",
            icon = "fas fa-box",
            label = "Hand in Packages"

        },
    },
    distance = 3.0 
})
end

end)


RegisterNetEvent('sd-cokemission:SellItemCheck', function()
    QBCore.Functions.TriggerCallback("QBCore:HasItem", function(hasItem)
        if hasItem then
            SellCoke()
        else
            QBCore.Functions.Notify("You don't have any Packages", 'error')
        end
    end, Config.SellItem)
end)

function SellCoke()
	QBCore.Functions.Progressbar("search_register", "Handing in Packages", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = 'mp_arresting',
		anim = 'a_uncuff',
		flags = 16,
    }, {}, {}, function()
        TriggerServerEvent("sd-cokemission:SellPackages")
		ClearPedTasks(GetPlayerPed(-1))
	end, function()
	    ClearPedTasks(GetPlayerPed(-1))
	end)     
end


-- Vehicle Creation

local function SetCarItemsInfo()
    local items = {}
    for k, item in pairs(Config.Package) do
        local itemInfo = QBCore.Shared.Items[item.name:lower()]
        items[item.slot] = {
            name = itemInfo["name"],
            amount = tonumber(item.amount),
            info = item.info,
            label = itemInfo["label"],
            description = itemInfo["description"] and itemInfo["description"] or "",
            weight = itemInfo["weight"],
            type = itemInfo["type"],
            unique = itemInfo["unique"],
            useable = itemInfo["useable"],
            image = itemInfo["image"],
            slot = item.slot,
        }
    end
    Config.Package = items
    Config.Package2 = items
    Config.Package3 = items
end

-- Boat Spawn

RegisterCommand('boatspawntest', function()
    TriggerEvent('sd-cokemission:client:boatactivate')
end)


RegisterNetEvent('sd-cokemission:client:boatactivate', function()
    if Config.EnableBoat then

    local DrawCoord = 1
        if DrawCoord == 1 then
        VehicleCoords = Config.Boatspawn
    end

boatblip = AddBlipForCoord(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z)
SetBlipSprite(boatblip, 427)
SetBlipScale(boatblip, 0.75)
SetBlipColour(boatblip, 3)
SetBlipAsShortRange(boatblip, true)
SetBlipRoute(boatblip, false)

RequestModel(`dinghy`)
while not HasModelLoaded(`dinghy`) do
Citizen.Wait(0)
end

ClearAreaOfVehicles(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, 15.0, false, false, false, false, false)
transport = CreateVehicle(`dinghy`, VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, 52.0, true, true)
     end
end)

RegisterNetEvent('sd-cokemission:server:runactivate', function()

blip = AddBlipForCoord(-3420.95, 1707.15, 0.5)
SetBlipSprite(blip, 306)
SetBlipScale(blip, 0.75)
SetBlipColour(blip, 3)
SetBlipRoute(blip, false)
SetBlipAsShortRange(blip, true)

blip2 = AddBlipForCoord(-3598.39, 888.52, 0.16)
SetBlipSprite(blip2, 306)
SetBlipScale(blip2, 0.75)
SetBlipColour(blip2, 3)
SetBlipRoute(blip2, false)
SetBlipAsShortRange(blip2, true)

blip3 = AddBlipForCoord(-3085.08, 2819.58, 0.0)
SetBlipSprite(blip3, 306)
SetBlipScale(blip3, 0.75)
SetBlipColour(blip3, 3)
SetBlipRoute(blip3, false)
SetBlipAsShortRange(blip3, true)

local DrawCoord = 1
    if DrawCoord == 1 then
    VehicleCoords2 = Config.CarSpawn
end

local DrawCoord = 1
    if DrawCoord == 1 then
    VehicleCoords3 = Config.CarSpawn2
end

local DrawCoord = 1
    if DrawCoord == 1 then
    VehicleCoords4 = Config.CarSpawn3
end

    RequestModel(`voodoo`)
    while not HasModelLoaded(`voodoo`) do
    Citizen.Wait(0)
    end

    RequestModel(`virgo3`)
    while not HasModelLoaded(`virgo3`) do
    Citizen.Wait(0)
    end

    RequestModel(`dukes3`)
    while not HasModelLoaded(`dukes3`) do
    Citizen.Wait(0)
    end

    ClearAreaOfVehicles(VehicleCoords2.x, VehicleCoords2.y, VehicleCoords2.z, 15.0, false, false, false, false, false)
    ClearAreaOfVehicles(VehicleCoords3.x, VehicleCoords3.y, VehicleCoords3.z, 15.0, false, false, false, false, false)
    ClearAreaOfVehicles(VehicleCoords4.x, VehicleCoords4.y, VehicleCoords4.z, 15.0, false, false, false, false, false)

    car1 = CreateVehicle(`voodoo`, VehicleCoords2.x, VehicleCoords2.y, VehicleCoords2.z, 52.0, true, true)
    car2 = CreateVehicle(`virgo3`, VehicleCoords3.x, VehicleCoords3.y, VehicleCoords3.z, 52.0, true, true)
    car3 = CreateVehicle(`dukes3`, VehicleCoords4.x, VehicleCoords4.y, VehicleCoords4.z, 52.0, true, true)

    SetCarItemsInfo()
    TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(car1), Config.Package)
    TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(car2), Config.Package2)
    TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(car3), Config.Package3)

end)

RegisterNetEvent('sd-cokemission:client:information', function ()
    TriggerEvent('sd-cokemission:ptfxparticle')
    TriggerEvent('sd-cokemission:ptfxparticle2')
    TriggerEvent('sd-cokemission:ptfxparticle3')
end)

-- Flare Creation

RegisterNetEvent("sd-cokemission:ptfxparticle", function(method)
    local ptfx

    RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded("core") do
        Wait(1)
    end
        ptfx = vector3(-3420.95, 1707.15, 0.5)
    SetPtfxAssetNextCall("core")
    local effect = StartParticleFxLoopedAtCoord("exp_grd_flare", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(2000000) 
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("sd-cokemission:ptfxparticle2", function(method)
    local ptfx

    RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded("core") do
        Wait(1)
    end
        ptfx = vector3(-3598.39, 888.52, 0.16)
    SetPtfxAssetNextCall("core")
    local effect = StartParticleFxLoopedAtCoord("exp_grd_flare", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(2000000) 
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("sd-cokemission:ptfxparticle3", function(method)
    local ptfx

    RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded("core") do
        Wait(1)
    end
        ptfx = vector3(-3085.08, 2819.58, 0.0)
    SetPtfxAssetNextCall("core")
    local effect = StartParticleFxLoopedAtCoord("exp_grd_flare", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(2000000) 
    StopParticleFxLooped(effect, 0)
end)

-- Coke Brick Breaking Down

RegisterNetEvent('sd-cokemission:client:checkcoke')
AddEventHandler('sd-cokemission:client:checkcoke', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("search_register", "Breaking down..", 3000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mp_arresting',
                anim = 'a_uncuff',
                flags = 16,
            }, {}, {}, function() -- Done
        TriggerServerEvent('coke:breakdownCoke', src)
		TriggerEvent('QBCore:Notify', src, "Successfully broken down..", "success", 2500)
            end)
        else
			QBCore.Functions.Notify("Error!", 'error')
        end
    end, "coke_brick")
end)

-- Sealedpackage processing

RegisterNetEvent('sd-cokemission:client:checkitem')
AddEventHandler('sd-cokemission:client:checkitem', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
            TriggerServerEvent('coke:processCoke')
        else
			QBCore.Functions.Notify("You don't have any sealed packages.", 'error')
        end
    end, "sealedpackage")
end)

RegisterNetEvent('sd-cokemission:now-can-collect-package', function()
    QBCore.Functions.Notify("You can collect your items now.", 'success')
	exports['qb-target']:AddTargetModel({pedhash}, {
		options = {
			{
				event = "collect-coke",
				icon = "fas fa-box",
				label = "Collect Items",
			}
		},
		distance = 2.0
	})
end)

RegisterNetEvent('collect-coke', function()

	exports['qb-target']:AddTargetModel({pedhash}, {
		options = {
			{
				event = "sd-cokemission:client:checkitem",
				icon = "fas fa-box",
				label = "Process Packages",
			}
		},
		distance = 2.0
	})

	TriggerServerEvent('sd-cokemission:server:packagereward')

end)


RegisterNetEvent('sd-cokemission:client:removetarget', function()
	exports['qb-target']:RemoveTargetModel({pedhash}, {
		'Collect Items'
	})
end)

RegisterNetEvent('sd-cokemission:client:removetarget2', function()    
    exports['qb-target']:RemoveTargetModel({pedhash}, {
        'Process Packages'
    })
end)

RegisterNetEvent('sd-cokemission:client:removetarget3', function()    
    exports['qb-target']:RemoveTargetModel({pedhash2}, {
        'Hand in Packages'
    })
end)

-- Event End

RegisterNetEvent('sd-cokemission:client:end', function()
    QBCore.Functions.Notify("You've signed off", 'error')

    exports['qb-target']:AddTargetModel({pedhash2}, {
        options = {
            {
                type = "client",
                event = "sd-cokemission:client:start",
                icon = "fas fa-user-secret",
                label = "Pay me $100,000 :)",

            },
        },
        distance = 2.0
    })

    exports['qb-target']:RemoveTargetModel({pedhash2}, {
        'Sign Out'
    })

    exports['qb-target']:RemoveTargetModel({pedhash2}, {
        'Hand in Packages'
    })
    
    TriggerEvent('sd-cokemission:client:endRun')
end)


RegisterNetEvent('sd-cokemission:client:endRun', function()


    RemoveBlip(blip)
    RemoveBlip(blip2)
    RemoveBlip(blip3)
    RemoveBlip(boatblip)
    
    RemoveBlip(carBlip1)
    RemoveBlip(carBlip2)
    RemoveBlip(carBlip3)
    RemoveBlip(boatBlip)

end)

-- Blackout Start

RegisterNetEvent('sd-blackout:client:blackoutsync', function()
    blackout = true
end)

RegisterNetEvent('sd-blackout:client:interactionsync', function()
    TriggerEvent('sd-cokemission:client:addtarget', -1)
end)

RegisterNetEvent('sd-cokemission:client:addtarget', function()

    exports['qb-target']:AddTargetModel({pedhash2}, {
        options = {
            {
                type = "client",
                event = "sd-cokemission:client:start",
                icon = "fas fa-user-secret",
                label = "Pay me $100,000 :)",

            },
        },
        distance = 2.0
    })

end)

RegisterNetEvent('sd-blackout:client:startblackout', function ()
	QBCore.Functions.TriggerCallback("sd-blackout:server:getCops", function(enoughCops)
    if enoughCops >= Config.MinimumPolice then
        QBCore.Functions.TriggerCallback("sd-blackout:server:coolc",function(isCooldown2)
            if not isCooldown2 then
                QBCore.Functions.Progressbar("search_register", "Preparing Explosive", 3000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
					animDict = 'mp_arresting',
					anim = 'a_uncuff',
					flags = 16,
                }, {}, {}, function() -- Done
                    bombanime()
                    TriggerEvent("sd-blackout:client:blackout")
					TriggerServerEvent('sd-blackout:server:startr')
                    TriggerServerEvent('sd-blackout:server:blackoutsync')
                    TriggerServerEvent('sd-blackout:server:interactionsync')
                end, function() -- Cancel
                    QBCore.Functions.Notify("Cancelled", 'error')
                end)
            else
                QBCore.Functions.Notify("Someone Recently did this.", 'error')
            end
        end)
    else
        QBCore.Functions.Notify("Cannot do this right now.", 'error')
	end
end)
end)

-- Planting Bomb

RegisterNetEvent('sd-blackout:client:bombplant')
AddEventHandler('sd-blackout:client:bombplant', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
        if hasItem then
            TriggerEvent('sd-blackout:client:startblackout')			
            Citizen.Wait(1000)
        else
            QBCore.Functions.Notify("You dont have C4!", 'error')
        end
    end, "c4_bomb")
end)

-- Explosion

RegisterNetEvent('sd-blackout:client:lightsoff', function()
TriggerEvent("chat:addMessage", {
    color = {255, 255, 255},
    -- multiline = true,
    template = '<div style="padding: 15px; margin: 15px; background-color: rgba(180, 117, 22, 0.9); border-radius: 15px;"><i class="far fa-building"style="font-size:15px"></i> | {0} </font></i></b></div>',
    args = {"City Power is currently out, we're working on restoring it!"}
})

    exports['qb-target']:RemoveZone("Bomb")

end)

RegisterNetEvent('sd-blackout:client:blackout')
AddEventHandler('sd-blackout:client:blackout', function()
	Citizen.Wait(10500)
    AddExplosion(651.39, 100.92, 80.74, 2, 100000.0, true, false, 4.0)
	Citizen.Wait(1000)
	AddExplosion(695.380, 148.735, 84.2194, 29, 6000000000000000000000000000000000000000000.0, true, false, 2.5)
        Citizen.Wait(800)
        AddExplosion(677.273, 118.022, 84.2194, 29, 600000000000000000000000.0, true, false, 2.5)
        Citizen.Wait(800)
        AddExplosion(661.905, 123.143, 84.2194, 29, 600000000000000000000000.0, true, false, 2.5)
        Citizen.Wait(800)
        AddExplosion(703.672, 108.393, 84.2194, 29, 600000000000000000000000.0, true, false, 2.5)
        Citizen.Wait(800)
        TriggerServerEvent('sd-blackout:server:lightsoff')

	Citizen.Wait(500)
	TriggerServerEvent("qb-weathersync:server:toggleBlackout", -1)
end)

-- Blackout Restoration

RegisterNetEvent('sd-blackout:client:lightson', function()
	TriggerEvent("chat:addMessage", {
        color = {255, 255, 255},
        -- multiline = true,
        template = '<div style="padding: 15px; margin: 15px; background-color: rgba(180, 117, 22, 0.9); border-radius: 15px;"><i class="far fa-building"style="font-size:15px"></i> | {0} </font></i></b></div>',
        args = {"Power has been restored!"}
	})

        TriggerServerEvent("qb-weathersync:server:toggleBlackout", -1)

end)
	
-- Explosive Plant Animation

function bombanime()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 162.54)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(651.79, 100.88, 80.84, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 651.79, 100.88, 80.84,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("ch_prop_ch_explosive_01a"), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)

    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["c4_bomb"], "remove")
    TriggerServerEvent("QBCore:Server:RemoveItem", "c4_bomb", 1) 
    QBCore.Functions.Notify("The explosive has been planted! Run away!", 'success')

    NetworkStopSynchronisedScene(bagscene)
    Citizen.Wait(2000)
    ClearPedTasks(ped)
    StopParticleFxLooped(effect, 0)
    DeleteObject(bomba)
end

-- Sign off Event

RegisterNetEvent('sd-cokemission:client:signoff', function()

	exports['qb-target']:AddTargetModel({pedhash2}, {
		options = {
			{
				type = "client",
				event = "sd-cokemission:client:end",
				icon = "fas fa-circle",
				label = "Sign Out",

			}
		},
		distance = 2.0
	})

    exports['qb-target']:RemoveTargetModel({pedhash2}, {
		"Pay me $100,000 :)"
	})

end)

-- Blackout Target Exports

exports["qb-target"]:AddCircleZone("Bomb", vector3(651.99, 101.11, 81.16), 2.0, {
    name = "Bomb",
    useZ = true,
    --debugPoly=true
    }, {
        options = {
            {
                type = "client",
                event = "sd-blackout:client:bombplant",
                icon = "fas fa-bomb",
                label = "Plant Explosive"
            },
        },
        distance = 2.0
    })

-- Ped Interaction Export

exports['qb-target']:AddTargetModel('s_m_y_dealer_01', {
        options = {
            {
				type = "client",
				event = "sd-cokemission:client:checkitem",
				icon = "fas fa-box",
				label = "Process Packages",

            }
        },
        distance = 3.0 
    })

-- E-Mail Creation

RegisterNetEvent('sd-cokemission:client:email', function() 
	if Config.SendEmail then
        QBCore.Functions.Notify("I'll send an e-mail right now!", 'success')
    CokeStart()
	end
end)

function CokeStart()
	Citizen.Wait(2000)
	TriggerServerEvent('qb-phone:server:sendNewMail', {
	sender = ('Unknown'),
	subject = ('Mystery Package Pickup'),
	message = ('With the Cities power being down and city officials being distracted, A friend of mine has been able to refill hidden underwater stashes across the west coast of LS, these have been marked with a flare. To get there, you can steal a boat from the Alamo Sea, or you can use your own. I have marked all the neccessary locations on your GPS. Bring those packages back to me. Good Luck!'),
	})
	Citizen.Wait(3000)
end