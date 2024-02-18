-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
LoopStarted, BreakLoop, InVehicle, DisableKeys = nil, nil, nil, nil, {}

AddEventHandler('wasabi_bridge:onPlayerSpawn', function()
	while not wsb?.playerLoaded do Wait(1000) end
	Wait(5500) -- For slow PCs?
	local checkInjuryTime = lib.callback.await('wasabi_crutch:checkInjuryTime', 100)
	if checkInjuryTime and checkInjuryTime?.crutch then
		TriggerEvent('wasabi_crutch:giveCrutch', checkInjuryTime.time)
	elseif checkInjuryTime and checkInjuryTime?.chair then
		TriggerEvent('wasabi_crutch:giveChair', checkInjuryTime.time)
	end
end)

RegisterNetEvent('wasabi_bridge:onPlayerDeath', function()
	if Config.disableOnDeath.crutch then
		TriggerServerEvent('wasabi_crutch:updateCrutch', false, cache.serverId)
	end
	if Config.disableOnDeath.wheelchair then
		TriggerServerEvent('wasabi_crutch:updateChair', false, cache.serverId)
	end
end)

lib.onCache('vehicle', function(vehicle)
    InVehicle = vehicle
end)

RegisterNetEvent('wasabi_crutch:giveCrutch', function(time)
	StartCrutchLoop(time)
end)

RegisterNetEvent('wasabi_crutch:giveChair', function(time)
	StartChairLoop(time)
end)

RegisterNetEvent('wasabi_crutch:breakLoop', function()
	if not LoopStarted then return end
	BreakLoop = true
end)

RegisterNetEvent('wasabi_crutch:givePlayerCrutch', function(item)
	if Config.jobRequirement.enabled then
		local found
		for i=1, #Config.jobRequirement.jobs do
			if wsb.hasGroup(Config.jobRequirement.jobs[i]) then
				found = true
				break
			end
		end
		if not found then
			TriggerEvent('wasabi_bridge:notify', Strings.not_authorized, Strings.not_authorized_desc, 'error')
		else
			OpenCrutchMenu(item)
		end
	else
		OpenCrutchMenu(item)
	end
end)

RegisterNetEvent('wasabi_crutch:givePlayerChair', function(item)
	if Config.jobRequirement.enabled then
		local found
		for i=1, #Config.jobRequirement.jobs do
			if wsb.hasGroup(Config.jobRequirement.jobs[i]) then
				found = true
				break
			end
		end
		if not found then
			TriggerEvent('wasabi_bridge:notify', Strings.not_authorized, Strings.not_authorized_desc, 'error')
		else
			OpenChairMenu(item)
		end
	else
		OpenChairMenu(item)
	end
end)

CreateThread(function()
	while true do
		local sleep = 1500
		if DisableKeys?.crutch then
			sleep = 0
			DisableControlAction(0, 21, true)
			DisableControlAction(0, 22, true)
			DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
			DisablePlayerFiring(cache.playerId, true)
		end
		if DisableKeys?.chair then
			sleep = 0
			DisableControlAction(0, 75, true)
			DisableControlAction(27, 75, true)
			DisablePlayerFiring(cache.playerId, true)
		end
		Wait(sleep)
	end
end)

