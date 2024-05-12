local QBCore = exports['qb-core']:GetCoreObject()
local pedSliding = false
local UILoaded = false
local startCam = nil
local cam, spawned =  nil, nil
local Characters = {}
local isMenuOpened = false
canRelog = true

RegisterNUICallback('loaded', function(data, cb)
	UILoaded = true
	cb('ok')
end)

CreateThread(function()
	while true do
		Wait(0)
		if NetworkIsSessionStarted() then
			while not UILoaded do
				Wait(1500)
				if not UILoaded then
					SendNUIMessage({action = "loaded"})
				end
			end
			TriggerEvent('vms_multichars:SetupCharacters')
			return
		end
	end
end)

Citizen.CreateThread(function()
	if Config.ChangeCharacterPoint and Config.ChangeCharacterPoint.enable and Config.ChangeCharacterPoint.blip then
		local blipSett = Config.ChangeCharacterPoint.blip
		local blip = AddBlipForCoord(Config.ChangeCharacterPoint.coords)
		SetBlipSprite(blip, blipSett.sprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, blipSett.scale)
		SetBlipColour(blip, blipSett.color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(blipSett.name)
		EndTextCommandSetBlipName(blip)
	end
	local inRange = false
    local shown = false
	while Config.ChangeCharacterPoint and Config.ChangeCharacterPoint.enable do
		inRange = false
		local sleep = true
		if Config.ChangeCharacterPoint then
			local myPed = PlayerPedId()
			local myCoords = GetEntityCoords(myPed)
			local distance = #(myCoords - Config.ChangeCharacterPoint.coords)
			if distance < 20.0 then
				sleep = false
				DrawMarker(Config.ChangeCharacterPoint.marker.id, Config.ChangeCharacterPoint.coords, 0, 0, 0, 0, 0, 0, Config.ChangeCharacterPoint.marker.size, Config.ChangeCharacterPoint.marker.rgba[1], Config.ChangeCharacterPoint.marker.rgba[2], Config.ChangeCharacterPoint.marker.rgba[3], Config.ChangeCharacterPoint.marker.rgba[4], false, false, false, Config.ChangeCharacterPoint.marker.rotate, nil, nil, nil)
				if distance < 1.0 then
					inRange = true
					if IsControlJustPressed(0, 38) then
						inRange = false
						TriggerServerEvent('vms_multichars:relog')
					end
				end
			end
		end
		if inRange and not shown then
            shown = true
			exports['qb-core']:DrawText(Config.Translate['helpnotification.change_character'], 'left')
        elseif not inRange and shown then
            shown = false
            exports['qb-core']:HideText()
        end
		Citizen.Wait(sleep and 1000 or 1)
	end
end)

RegisterNetEvent('vms_multichars:SetupCharacters')
AddEventHandler('vms_multichars:SetupCharacters', function()
	spawned = false
	isMenuOpened = true
	TriggerEvent("vms_multichars:WeatherSync", true)
	DoScreenFadeOut(300)
	startCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
	SetCamCoord(startCam, Config.Spawn.x, Config.Spawn.y, Config.Spawn.z + 350.0)
	SetCamActive(startCam, true)
	PointCamAtCoord(startCam, Config.Spawn.x, Config.Spawn.y, Config.Spawn.z + 350.0)
	SetCamRot(startCam, -90.0, 0.0, -0.0, 2)
	RenderScriptCams(true, true, 0, true, true)
	StartLoop()
	Wait(500)
	ShutdownLoadingScreen()
	ShutdownLoadingScreenNui()
	SetTimecycleModifier('MP_corona_heist_DOF')
    SetTimecycleModifierStrength(1.0)
	TriggerServerEvent("vms_multichars:SetupCharacters")
end)

StartLoop = function()
	hidePlayers = true
	MumbleSetVolumeOverride(PlayerId(), 0.0)
	CreateThread(function()
		local keys = {18, 27, 172, 173, 174, 175, 176, 177, 187, 188, 191, 201, 108, 109}
		while hidePlayers do
			DisableAllControlActions(0)
			for i = 1, #keys do
				EnableControlAction(0, keys[i], true)
			end
			SetEntityVisible(PlayerPedId(), 0, 0)
			SetLocalPlayerVisibleLocally(1)
			SetPlayerInvincible(PlayerId(), 1)
			ThefeedHideThisFrame()
			HideHudComponentThisFrame(11)
			HideHudComponentThisFrame(12)
			HideHudComponentThisFrame(21)
			HideHudAndRadarThisFrame()
			Wait(0)
			local vehicles = GetGamePool('CVehicle')
			for i = 1, #vehicles do
				SetEntityLocallyInvisible(vehicles[i])
			end
		end
		local playerId, playerPed = PlayerId(), PlayerPedId()
		MumbleSetVolumeOverride(playerId, -1.0)
		SetEntityVisible(playerPed, 1, 0)
		SetPlayerInvincible(playerId, 0)
		Wait(10000)
		canRelog = true
	end)
	CreateThread(function()
		local playerPool = {}
		while hidePlayers do
			local players = GetActivePlayers()
			for i = 1, #players do
				local player = players[i]
				if player ~= PlayerId() and not playerPool[player] then
					playerPool[player] = true
					NetworkConcealPlayer(player, true, true)
				end
			end
			Wait(500)
		end
		for k in pairs(playerPool) do
			NetworkConcealPlayer(k, false, false)
		end
	end)
end

SetupCharacter = function(index, cData)
	if spawned == false then
		QBCore.Functions.TriggerCallback('vms_multichars:getSkin', function(model, data)
			local thisModel = tonumber(model) or GetHashKey(model)
			RequestModel(thisModel)
        	while not HasModelLoaded(thisModel) do
				RequestModel(thisModel)
        	    Wait(0)
        	end
			SetPlayerModel(PlayerId(), thisModel)
			SetModelAsNoLongerNeeded(thisModel)
			canRelog = false
			if Characters[index] then
				local data = json.decode(data)
				if Config.SkinManager == "qb-clothing" then
					TriggerEvent('qb-clothing:client:loadPlayerClothing', data, PlayerPedId())
				elseif Config.SkinManager == "fivem-appearance" then
					exports['fivem-appearance']:setPedAppearance(PlayerPedId(), data)
				elseif Config.SkinManager == "illenium-appearance" then
					exports['illenium-appearance']:setPedAppearance(PlayerPedId(), data)
				end
			end
			local playerPed = PlayerPedId()
			SetEntityCoordsNoOffset(playerPed, Config.Spawn.x, Config.Spawn.y, Config.Spawn.z, false, false, false, true)
			NetworkResurrectLocalPlayer(Config.Spawn.x, Config.Spawn.y, Config.Spawn.z, Config.Spawn.w, true, true, false)
			cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
			SetEntityCoords(playerPed, Config.Spawn.x, Config.Spawn.y, Config.Spawn.z, true, false, false, false)
			SetEntityHeading(playerPed, Config.Spawn.w)
			local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0, 1.0, 0.5)
			SetCamActive(cam, true)
			RenderScriptCams(true, false, 1, true, true)
			SetCamCoord(cam, offset.x, offset.y, offset.z)
			PointCamAtCoord(cam, Config.Spawn.x, Config.Spawn.y, Config.Spawn.z + Config.CameraZHeight)
			if not Config.SelectFirstChar then
				SetEntityCoords(playerPed, Config.ToLeft.x, Config.ToLeft.y, Config.ToLeft.z, true, false, false, false)
			end
			SetCamActiveWithInterp(cam, startCam, 2500, true, true)
			DoScreenFadeIn(2000)
		end, cData.citizenid)
		repeat Wait(200) until not IsScreenFadedOut()
		spawned = index
		SendNUIMessage({action = "loadui"})
	elseif Characters[index] then
		TaskPedSlideToCoord(PlayerPedId(), Config.ToLeft.x, Config.ToLeft.y, Config.ToLeft.z)
		local distance = #(GetEntityCoords(PlayerPedId()) - vec(Config.ToLeft.x, Config.ToLeft.y, Config.ToLeft.z))
		while distance > 2.0 do
			distance = #(GetEntityCoords(PlayerPedId()) - vec(Config.ToLeft.x, Config.ToLeft.y, Config.ToLeft.z))
			pedSliding = true
			Citizen.Wait(2)
		end
		QBCore.Functions.TriggerCallback('vms_multichars:getSkin', function(model, data)
			local thisModel = tonumber(model) or GetHashKey(model)
			RequestModel(thisModel)
        	while not HasModelLoaded(thisModel) do
				RequestModel(thisModel)
        	    Wait(0)
        	end
			SetPlayerModel(PlayerId(), thisModel)
			SetModelAsNoLongerNeeded(thisModel)
			local playerPed = PlayerPedId()
			SetPedAoBlobRendering(playerPed, true)
			ResetEntityAlpha(playerPed)
			SetEntityVisible(playerPed,true)
			if isMenuOpened then
				SetEntityCoords(playerPed, Config.FromRight)
				TaskPedSlideToCoord(playerPed, Config.Spawn.x, Config.Spawn.y, Config.Spawn.z, Config.Spawn.w)
			end
			pedSliding = false
			local data = json.decode(data)
			if Config.SkinManager == "qb-clothing" then
				TriggerEvent('qb-clothing:client:loadPlayerClothing', data, PlayerPedId())
			elseif Config.SkinManager == "fivem-appearance" then
				exports['fivem-appearance']:setPedAppearance(PlayerPedId(), data)
			elseif Config.SkinManager == "illenium-appearance" then
				exports['illenium-appearance']:setPedAppearance(PlayerPedId(), data)
			end
		end, cData.citizenid)
		spawned = index
		if isMenuOpened then
			SendNUIMessage({action = "openui", character = Characters[spawned]})
		end
	end
	local playerPed = PlayerPedId()
	SetPedAoBlobRendering(playerPed, true)
	SetEntityAlpha(playerPed, 255)
end

RegisterNetEvent('vms_multichars:SetupUI')
AddEventHandler('vms_multichars:SetupUI', function(data, slots)
	DoScreenFadeOut(0)
	Characters = data
	local Character = next(Characters)
	exports.spawnmanager:forceRespawn()
	if Character == nil then
		SendNUIMessage({ action = "closeui" })
		isMenuOpened = false
		exports.spawnmanager:spawnPlayer({
			x = Config.Spawn.x,
			y = Config.Spawn.y,
			z = Config.Spawn.z,
			heading = Config.Spawn.w,
			model = GetHashKey('mp_m_freemode_01'),
			skipFade = true
		}, function()
			canRelog = false
			local myPed = PlayerPedId()
			SetPedAoBlobRendering(myPed, false)
			DestroyCam(startCam, false)
			SetCamActive(startCam, false)
			startCam = nil
			SetCamActive(cam, false)
			DestroyCam(cam)
			cam = nil
			SetNuiFocus(false, false)
			RenderScriptCams(false, false, 0, true, true)
			FreezeEntityPosition(PlayerPedId(), false)
			TriggerEvent("vms_multichars:WeatherSync", false)
			ClearTimecycleModifier()
			SetEntityAlpha(myPed, 0)
			Wait(2500)
			openIdentity(1)
			Characters, hidePlayers = {}, false
		end)
	else
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = "setupCharacters",
			characters = Characters,
			playerCanDelete = Config.CanDelete,
			slots = slots,
			selectFirstChar = Config.SelectFirstChar
		})
		if spawned == false then
			SetupCharacter(Character, Characters[Character])
		end
	end
end)

RegisterNUICallback('loadSkin', function(data, cb)
	if not pedSliding then
		local playerPed = PlayerPedId()
		SetPedAoBlobRendering(playerPed, true)
		ResetEntityAlpha(playerPed)
		SetupCharacter(data.cData.cid, data.cData)
		cb("ok")
	end
end)

RegisterNUICallback('selectCharacter', function(data, cb)
	ClearPedTasksImmediately(PlayerPedId())
	if pedSliding then
		pedSliding = false
		SendNUIMessage({ action = "closeuiimmediately" })
	else
		SendNUIMessage({ action = "closeui" })
	end
	isMenuOpened = false
	local cData = data.cData
	DestroyCam(startCam, false)
	SetCamActive(startCam, false)
	startCam = nil
	SetCamActive(cam, false)
	DestroyCam(cam)
	cam = nil
	RenderScriptCams(false, false, 0, true, true)
	TriggerServerEvent('vms_multichars:CharacterChosen', cData)
	SetNuiFocus(false, false)
	FreezeEntityPosition(PlayerPedId(), false)
	TriggerEvent("vms_multichars:WeatherSync", false)
    ClearTimecycleModifier()
	Characters, hidePlayers = {}, false
	cb("ok")
end)

RegisterNUICallback('delete', function(data, cb)
	if Config.CanDelete then
		local cData = data.cData
		TriggerServerEvent('vms_multichars:DeleteCharacter', cData.citizenid)
		spawned = false
	else
		TriggerEvent('vms_multichars:notification', Config.Translate['cannot_remove_character'], 5500, 'error')
	end
end)

RegisterNUICallback('register', function(data, cb)
	local GetSlot = function()
		for i = 1, data.slots do
			if not Characters[i] then
				return i
			end
		end
	end
	local slot = GetSlot()
	SendNUIMessage({ action = "closeui" })
	isMenuOpened = false
	exports.spawnmanager:spawnPlayer({
		x = Config.Spawn.x,
		y = Config.Spawn.y,
		z = Config.Spawn.z,
		heading = Config.Spawn.w,
		skipFade = true
	}, function()
		canRelog = false
		DoScreenFadeIn(400)
		Wait(400)
		local myPed = PlayerPedId()
		SetPedAoBlobRendering(myPed, false)
		SetEntityAlpha(myPed, 0)
		DestroyCam(startCam, false)
		SetCamActive(startCam, false)
		startCam = nil
		SetCamActive(cam, false)
		DestroyCam(cam)
		cam = nil
		RenderScriptCams(false, false, 0, true, true)
		SetNuiFocus(false, false)
		FreezeEntityPosition(PlayerPedId(), false)
		TriggerEvent("vms_multichars:WeatherSync", false)
		ClearTimecycleModifier()
		openIdentity(slot)
		Characters, hidePlayers = {}, false
	end)
	SetPedAoBlobRendering(PlayerPedId(), false)
	SetEntityAlpha(PlayerPedId(), 0)
	SetNuiFocus(false, false)
	cb("ok")
end)

RegisterNetEvent('vms_multichars:notification')
AddEventHandler('vms_multichars:notification', function(message, time, type)
	Config.Notification(message, time, type)
end)

RegisterNetEvent('vms_multichars:charcreator', function()
	TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    SetEntityCoords(PlayerPedId(), Config.SpawnLocation.x, Config.SpawnLocation.y, Config.SpawnLocation.z)
	local gender = QBCore.Functions.GetPlayerData().charinfo.gender
	openCharacterCreator(gender)
	TriggerServerEvent('vms_multichars:starterPack')
end)

RegisterNetEvent('vms_multichars:spawnLastLocation', function(coords)
    local myPed = PlayerPedId()
    SetEntityCoords(myPed, coords.x, coords.y, coords.z)
    SetEntityHeading(myPed, coords.w)
    FreezeEntityPosition(myPed, false)
    SetEntityVisible(myPed, true)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    DoScreenFadeIn(250)
end)