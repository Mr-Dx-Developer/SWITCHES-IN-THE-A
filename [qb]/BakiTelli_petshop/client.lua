local pcode = 0
local petcode = nil
local b = nil
local price = nil
Citizen.CreateThread(function()
		RequestModel(Config.npc)
		while not HasModelLoaded(Config.npc) do Citizen.Wait(1) end
		a = CreatePed(4, Config.npc, Config.npccoord.x,Config.npccoord.y,Config.npccoord.z-1.0, Config.npccoordh, false, false)
		SetPedFleeAttributes(a, 0, 0)
		SetPedDropsWeaponsWhenDead(a, false)
		SetPedDiesWhenInjured(a, false)
		SetEntityInvincible(a , true)
		FreezeEntityPosition(a, true)
		SetBlockingOfNonTemporaryEvents(a, true)
		TaskStartScenarioInPlace(a, Config.npcanim, 0, true)
end)


Citizen.CreateThread(function()
	while true do
		local sleep = 1500
		local playercoord = GetEntityCoords(PlayerPedId())
		local dst = #(playercoord - Config.npccoord)
			if dst < Config.sleepdistance then
				sleep = 1
				if dst < Config.textdistance then
					DrawText3D(Config.npccoord.x, Config.npccoord.y, Config.npccoord.z+0.0, Config.text)
					if dst < Config.controldistance then
						if IsControlJustReleased(0,Config.controlkeys) then
							TriggerServerEvent("sv:getname")
						    SendNUIMessage({action = "openmenu"}) 
							SetNuiFocus(true, true)
						end
					end
				end
			end
		Citizen.Wait(sleep)
	end
end)

RegisterNUICallback("closenui", function ()
	SetNuiFocus(false, false)
	print("discord.gg/chp | leaked by mikaa")
end)


local just_started = true
local spawned_ped = nil
local following = false
local searching = false
local playing_animation = false

RegisterCommand("focus", function ()
	SetNuiFocus(true, true)
end)

RegisterNUICallback("spawnpet", function ()
	spawnped(pcode)
	notify("Successful")
	print("discord.gg/chp | leaked by mikaa")
end)

RegisterNUICallback("vehicle", function ()
	car()
	notify("Successful")
end)

RegisterNUICallback("showpet", function (data)
	id = tonumber(data.id)
	SetEntityVisible(PlayerPedId(), 0)
	cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
	SetCamCoord(cam, Config.shop.cam)
	SetCamRot(cam, Config.shop.rot, 2)
	SetCamActive(cam, true)
	RenderScriptCams(true, true, 500)
	for k,v in pairs(Config.items) do
		if id == k then
		SendNUIMessage({
			action = "changename",
			name = v.name,
			price = v.price
		})
		RequestModel(v.pet_code)
		price = v.price
		petcode = v.pet_code
		while not HasModelLoaded(v.pet_code) do Citizen.Wait(1) end
		b = CreatePed(4, v.pet_code, Config.shop.pedspawn, Config.shop.pedspawn, false, false)
		SetPedFleeAttributes(b, 0, 0)
		SetPedDropsWeaponsWhenDead(b, false)
		SetPedDiesWhenInjured(b, false)
		SetEntityInvincible(b , true)
		FreezeEntityPosition(b, true)
		SetBlockingOfNonTemporaryEvents(b, true)
		end
	end
end)

RegisterNUICallback("cam", function ()
	if DoesCamExist(cam) then
        DestroyCam(cam, true)
		SetEntityVisible(PlayerPedId(), 1)
        RenderScriptCams(false, true, 500)
		DeleteEntity(b) 
        cam = nil
    end
end)

RegisterNUICallback("sit", function ()
	sit(spawned_ped)
	notify("Successful")
end)

RegisterNUICallback("sleep", function ()
	dwn(spawned_ped)
	notify("Successful")
end)

 function spawnped(model)
    if spawned_ped == nil then
        local ped = GetHashKey(model)
        RequestModel(ped)
        while not HasModelLoaded(ped) do
            Citizen.Wait(1)
            RequestModel(ped)
        end
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 2.0, 0.0)
        local dog = CreatePed(28, ped, plyCoords.x, plyCoords.y, plyCoords.z, GetEntityHeading(GetPlayerPed(PlayerId())), 0, 1)
        spawned_ped = dog
		SetBlockingOfNonTemporaryEvents(spawned_ped, true)
        SetPedFleeAttributes(spawned_ped, 0, 0)
		SetPedRelationshipGroupHash(spawned_ped, GetHashKey("k9"))
        local blip = AddBlipForEntity(spawned_ped)
        SetBlipAsFriendly(blip, true)
        SetBlipSprite(blip, 442)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring("MY PET"))
        EndTextCommandSetBlipName(blip)
        NetworkRegisterEntityAsNetworked(spawned_ped)
        GiveWeaponToPed(spawned_ped, GetHashKey("WEAPON_ANIMAL"), 200, true, true);
		pedfallow()
		while not NetworkGetEntityIsNetworked(spawned_ped) do
            NetworkRegisterEntityAsNetworked(spawned_ped)
            Citizen.Wait(1)
        end
    else
        local has_control = false
        RequestNetworkControl(function(cb)
            has_control = cb
        end)
        if has_control then
            SetEntityAsMissionEntity(spawned_ped, true, true)
            DeleteEntity(spawned_ped)
            spawned_ped = nil
        end
    end
end

function pedfallow()
	if spawned_ped ~= nil then
            local has_control = false
            RequestNetworkControl(function(cb)
                has_control = cb
            end)
            if has_control then
	            TaskFollowToOffsetOfEntity(spawned_ped, GetPlayerPed(PlayerId()), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
                SetPedKeepTask(spawned_ped, true)
            end
    end
end

function sit(entity)
	local animdicstart = "creatures@rottweiler@amb@world_dog_sitting@base"
	local animnamestart = "base"
	local animdicend = "creatures@rottweiler@amb@world_dog_sitting@exit"
	local animnameend = "exit"

	if IsEntityPlayingAnim(entity, animdicstart, animnamestart, 3) then
			RequestAnimDict(animdicend)
			while not HasAnimDictLoaded(animdicend) do
				Citizen.Wait(100)
				RequestAnimDict(animdicend)
			end
			TaskPlayAnim(spawned_ped, animdicend, animnameend, 1.0, -1, -1, 2, 0, 0, 0, 0)
			Citizen.Wait(2500)
			TaskFollowToOffsetOfEntity(spawned_ped, GetPlayerPed(PlayerId()), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
			if HasEntityAnimFinished(spawned_ped, animdicend, animnameend, 3) then
			ClearPedSecondaryTask(spawned_ped)
		end
	else
		RequestAnimDict(animdicstart)
		while not HasAnimDictLoaded(animdicstart) do
			Citizen.Wait(100)
			RequestAnimDict(animdicstart)
		end
		TaskPlayAnim(spawned_ped, animdicstart, animnamestart, 1.0, -1, -1, 2, 0, 0, 0, 0)
	end
end

function dwn(entity)
	local animdicstart = "creatures@rottweiler@amb@sleep_in_kennel@"
	local animnamestart = "sleep_in_kennel"
	local animdicend = "creatures@rottweiler@amb@sleep_in_kennel@"
	local animnameend = "exit_kennel"

	if IsEntityPlayingAnim(entity, animdicstart, animnamestart, 3) then
			RequestAnimDict(animdicend)
			while not HasAnimDictLoaded(animdicend) do
				Citizen.Wait(100)
				RequestAnimDict(animdicend)
			end
		TaskPlayAnim(spawned_ped, animdicend, animnameend, 1.0, -1, -1, 2, 0, 0, 0, 0)
		Citizen.Wait(5000)
		TaskFollowToOffsetOfEntity(spawned_ped, GetPlayerPed(PlayerId()), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
		if HasEntityAnimFinished(spawned_ped, animdicend, animnameend, 3) then
			ClearPedSecondaryTask(spawned_ped)
		end
	else
		RequestAnimDict(animdicstart)
		while not HasAnimDictLoaded(animdicstart) do
			Citizen.Wait(100)
			RequestAnimDict(animdicstart)
		end
		TaskPlayAnim(spawned_ped, animdicstart, animnamestart, 1.0, -1, -1, 2, 0, 0, 0, 0)
	end
end


function RequestNetworkControl(callback)
    local netId = NetworkGetNetworkIdFromEntity(spawned_ped)
    local timer = 0
    NetworkRequestControlOfNetworkId(netId)
    while not NetworkHasControlOfNetworkId(netId) do
        Citizen.Wait(1)
        NetworkRequestControlOfNetworkId(netId)
        timer = timer + 1
        if timer == 5000 then
            Citizen.Trace("Control failed")
            callback(false)
            break
        end
    end
    callback(true)
end


function CheckPedRestriction(ped, PedList)
	for i = 1, #PedList do
		if GetHashKey(PedList[i]) == GetEntityModel(ped) then
			return true
		end
	end
	return false
end

function GetClosestVehicleDoor()
	local plyCoords = GetEntityCoords(GetPlayerPed(PlayerId(), false))
	local vehicle = GetClosestVehicle(plyCoords.x, plyCoords.y, plyCoords.z, 5.0, 0, 70)

	local frontleft = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_dside_f"))
	local frontright = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_pside_f"))
	local backleft = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_dside_r"))
	local backright = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_pside_r"))

	local fldistance = GetDistanceBetweenCoords(frontleft['x'], frontleft['y'], frontleft['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)
	local frdistance = GetDistanceBetweenCoords(frontright['x'], frontright['y'], frontright['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)
	local bldistance = GetDistanceBetweenCoords(backleft['x'], backleft['y'], backleft['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)
	local brdistance = GetDistanceBetweenCoords(backright['x'], backright['y'], backright['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)

	if vehicle ~= 0 then
		closest_vehicle = vehicle
		if (fldistance < frdistance and fldistance < bldistance and fldistance < brdistance) then
			-- Front Left
			closest_door_pos = frontleft
			closest_door_name = "Front Left Door"
		elseif (frdistance < fldistance and frdistance < bldistance and frdistance < brdistance) then
			-- Front Right
			closest_door_pos = frontright
			closest_door_name = "Front Right Door"
		elseif (bldistance < fldistance and bldistance < frdistance and bldistance < brdistance) then
			-- Back Left
			closest_door_pos = backleft
			closest_door_name = "Back Left Door"
		elseif(brdistance < fldistance and brdistance < frdistance and brdistance < bldistance) then
			-- Back Right
			closest_door_pos = backright
			closest_door_name = "Back Right Door"
		end
	else
		closest_door_name = "Can't Search"
	end
end

local bindimi = true
function car()
	if spawned_ped ~= nil then
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			if bindimi then 
			bindimi = false
			ClearPedTasks(spawned_ped)
	
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			local vehHeading = GetEntityHeading(vehicle)
	
			TaskGoToEntity(spawned_ped, vehicle, -1, 0.5, 100, 1073741824, 0)
			TaskAchieveHeading(spawned_ped, vehHeading, -1)
	
			RequestAnimDict("creatures@rottweiler@in_vehicle@van")
			RequestAnimDict("creatures@rottweiler@amb@world_dog_sitting@base")
	
			while not HasAnimDictLoaded("creatures@rottweiler@in_vehicle@van") or not HasAnimDictLoaded("creatures@rottweiler@amb@world_dog_sitting@base") do
				Citizen.Wait(1)
			end
	
			TaskPlayAnim(spawned_ped, "creatures@rottweiler@in_vehicle@van", "get_in", 8.0, -4.0, -1, 2, 0.0)
			Citizen.Wait(700)
			ClearPedTasks(spawned_ped)
	
			AttachEntityToEntity(spawned_ped, vehicle, GetEntityBoneIndexByName(vehicle, "seat_pside_r"), 0.0, 0.0, 0.25)
			TaskPlayAnim(spawned_ped, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -4.0, -1, 2, 0.0)
			else	
				local vehicle = GetEntityAttachedTo(spawned_ped)
				local vehPos = GetEntityCoords(vehicle)
				local forwardX = GetEntityForwardVector(vehicle).x * 3.7
				local forwardY = GetEntityForwardVector(vehicle).y * 3.7
				local _, groundZ = GetGroundZFor_3dCoord(vehPos.x, vehPos.y, vehPos.z, 0)
				bindimi = true
				ClearPedTasks(spawned_ped)
				DetachEntity(spawned_ped)
				SetEntityCoords(spawned_ped, vehPos.x - forwardX, vehPos.y - forwardY, groundZ)
			end
		else
			notify("Get Car")
		end
	end
end

RegisterCommand(Config.openmenu, function ()
	TriggerServerEvent("pet:control")
end)

AddEventHandler("pet:cl:control")
RegisterNetEvent("pet:cl:control", function (var,petcodee)
	if var then
	    pcode = petcodee
		SendNUIMessage({action = "open-menu-d"}) 
		SetNuiFocus(true, true)
	else
		notify("You Have No Animal")
	end
end)

AddEventHandler("cl:getname")
RegisterNetEvent("cl:getname", function (name,pricee)
	SendNUIMessage({
		action = "update",
		price = pricee,
		name = name
	})
end)


RegisterNUICallback("box-menu", function ()
	for k,v in pairs(Config.items) do
		if v.cattegory == "dog" then
			SendNUIMessage({
				action = "add-pet",
				name = v.name,
				img =  v.img,
				id = k,
			})
		end
	end
end)

RegisterNUICallback("box-menu2", function ()
	for k,v in pairs(Config.items) do
		if v.cattegory == "cat" then
			SendNUIMessage({
				action = "add-pet",
				name = v.name,
				img =  v.img,
				id = k,
			})
		end
	end
end)

RegisterNUICallback("buy", function ()
	TriggerServerEvent("buy:pet", petcode,price)
end)

RegisterNUICallback("delete", function ()
	SetNuiFocus(false, false)
	DeleteEntity(spawned_ped)
	TriggerServerEvent("delete:pet")
end)

--mikaa leak