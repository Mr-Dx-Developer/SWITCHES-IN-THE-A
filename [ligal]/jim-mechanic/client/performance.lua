--=== AMROUR ===--
RegisterNetEvent('jim-mechanic:client:applyArmour', function(data) local Ped = PlayerPedId() local item = Items["car_armor"]
	removePropHoldCoolDown()
    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove

	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks()
	local above = isVehicleLift(vehicle)
	if not DoesEntityExist(vehicle) then return end

	local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
    if not enforceClassRestriction(searchCar(vehicle).class) then return end

	local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }

    lookEnt(vehicle)
    SetVehicleModKit(vehicle, 0)
    propHoldCoolDown("screwdriver") Wait(10)

	if not remove then
		if GetNumVehicleMods(vehicle, 16) == 0 then	triggerNotify(nil, Loc[Config.Lan]["common"].cant, "error") return end
		if GetVehicleMod(vehicle, 16)+1 == GetNumVehicleMods(vehicle, 16) then triggerNotify(nil, item.label..Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			if Config.Overrides.DoorAnimations then SetVehicleDoorOpen(vehicle, 4, false, false) end
			if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "car_armor", cam = cam}) then
				if (GetVehicleMod(vehicle, 16) == GetNumVehicleMods(vehicle, 16)-1) or (not hasItem("car_armor", 1)) then
					emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "car_armor") return end
				qblog("`"..item.label.." - car_armor` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				checkSetVehicleMod(vehicle, 16, GetNumVehicleMods(vehicle, 16)-1)
				updateCar(vehicle)
				removeItem("car_armor", 1)
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
			else
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].instfail, "error")
			end
		end
	else
		if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "car_armor", cam = cam}) then
			if (GetVehicleMod(vehicle, 16) == -1) then
				emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "car armor") return
			end
			qblog("`"..item.label.." - car_armor` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
			checkSetVehicleMod(vehicle, 16, -1)
			updateCar(vehicle)
			if Config.Overrides.receiveMaterials and MaterialRecieve["car_armor"] then
				addMaterials("car_armor")
			else
				addItem("car_armor", 1)
			end
			triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
		else
			triggerNotify(nil,  item.label.." "..Loc[Config.Lan]["common"].removed, "error")
		end
	end
	if Config.Overrides.DoorAnimations then SetVehicleDoorShut(vehicle, 4, false) end
end)

--=== TURBO ===--
RegisterNetEvent('jim-mechanic:client:applyTurbo', function(data) local Ped = PlayerPedId() local item = Items["turbo"]
	removePropHoldCoolDown()
    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove

	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks()
	local above = isVehicleLift(vehicle)
	if not DoesEntityExist(vehicle) then return end

	local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
    if not enforceClassRestriction(searchCar(vehicle).class) then return end

	local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }

    lookEnt(vehicle)
    SetVehicleModKit(vehicle, 0)
    propHoldCoolDown("screwdriver") Wait(10)
	SetVehicleEngineOn(vehicle, false, false, true)
	if Config.Overrides.DoorAnimations then SetVehicleDoorOpen(vehicle, 4, false, false) end
	if remove == false then
		if not lookAtEngine(vehicle) then return end
		if GetNumVehicleMods(vehicle, 11) == 0 then triggerNotify(nil, Loc[Config.Lan]["common"].noOptions, "error") return end
		if IsToggleModOn(vehicle, 18) then triggerNotify(nil, item.label..Loc[Config.Lan]["common"].already, "error") else
			if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "turbo", cam = cam}) then
				if (IsToggleModOn(vehicle, 18)) or (not hasItem("turbo", 1)) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "turbo") return end
				if checkToggleVehicleMod(vehicle, 18, true) then
					qblog("`"..item.label.." - turbo` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					updateCar(vehicle)
					removeItem("turbo", 1)
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
			end
		end
	else
		if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "turbo", cam = cam}) then
			if (not IsToggleModOn(vehicle, 18)) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "turbo") return end
			if checkToggleVehicleMod(vehicle, 18, false) then
				qblog("`"..Items["turbo"].label.." - turbo` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				if Config.Overrides.receiveMaterials and MaterialRecieve["turbo"] then
					addMaterials("turbo")
				else
					addItem("turbo", 1)
				end
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		else
			triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
		end
	end
	if Config.Overrides.DoorAnimations then SetVehicleDoorShut(vehicle, 4, false) end
end)

--=== BRAKES ===--
RegisterNetEvent('jim-mechanic:client:applyBrakes', function(data) local Ped = PlayerPedId()
	local level = 1
	level = data.client.level

    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove

	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks()
	local above = isVehicleLift(vehicle)
	if not DoesEntityExist(vehicle) then return end

	local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
    if not enforceClassRestriction(searchCar(vehicle).class) then return end

	local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }

    lookEnt(vehicle)
    SetVehicleModKit(vehicle, 0)
    propHoldCoolDown("screwdriver") Wait(10)

	local possMods = checkHSWMods(vehicle)
	local currentBrakes = GetVehicleMod(vehicle, 12)

	if not remove then
		local item = Items["brakes"..level+1]
		if GetNumVehicleMods(vehicle, 12) == 0 or level > possMods[12] then triggerNotify(nil, Loc[Config.Lan]["common"].cant, "error") return end
		if GetVehicleMod(vehicle, 12) == level then triggerNotify(nil, item.label..Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "brakes"..level+1, cam = cam}) then
				if (GetVehicleMod(vehicle, 12) ~= currentBrakes) or (not hasItem("brakes"..(level+1), 1)) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "brakes"..(currentBrakes+1))  return end
				qblog("`"..Items["brakes"..level+1].label.." - brakes"..level+1 .."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				checkSetVehicleMod(vehicle, 12, level)
				updateCar(vehicle)
				removeItem("brakes"..level+1, 1)
				if Config.Overrides.receiveMaterials and MaterialRecieve["brakes"..currentBrakes+1] then
					addMaterials("brakes"..currentBrakes+1)
				else
					addItem("brakes"..currentBrakes+1, 1)
				end
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
			else
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].instfail, "error")
			end
		end
	else
		local item = Items["brakes"..currentBrakes+1]
		if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "brakes"..currentBrakes+1, cam = cam }) then
			if (GetVehicleMod(vehicle, 12) ~= currentBrakes) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "brakes"..(currentBrakes+1)) return end
			if checkSetVehicleMod(vehicle, 12, -1) then
				qblog("`"..item.label.." - brakes"..currentBrakes+1 .."` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				if Config.Overrides.receiveMaterials and MaterialRecieve["brakes"..currentBrakes+1] then
					addMaterials("brakes"..currentBrakes+1)
				else
					addItem("brakes"..currentBrakes+1, 1)
				end
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			end
		else
			triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
		end
	end
end)

--=== SUSPENSION ===--
RegisterNetEvent('jim-mechanic:client:applySuspension', function(data) local Ped = PlayerPedId()
	local level = 1
	level = data.client.level

    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove

	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks()
	local above = isVehicleLift(vehicle)
	if not DoesEntityExist(vehicle) then return end

	local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
    if not enforceClassRestriction(searchCar(vehicle).class) then return end

	local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }

    lookEnt(vehicle)
    SetVehicleModKit(vehicle, 0)
    propHoldCoolDown("screwdriver") Wait(10)

	local possMods = checkHSWMods(vehicle)
	local currentSuspension = GetVehicleMod(vehicle, 15)

	if not remove then
		local item = Items["suspension"..level+1]
		if GetNumVehicleMods(vehicle, 15) == 0 or (level+1) > possMods[15] then triggerNotify(nil, Loc[Config.Lan]["common"].cant, "error") return end
		if currentSuspension == level then triggerNotify(nil, item.label..Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			if progressBar({ label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "suspension"..level+1, cam = cam }) then
				if (GetVehicleMod(vehicle, 15) ~= currentSuspension) or (not hasItem("suspension"..level+1, 1)) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "suspension"..(currentSuspension+1)) return end
				if checkSetVehicleMod(vehicle, 15, level) then
					qblog("`"..item.label.." - suspension"..(level+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					updateCar(vehicle)
					removeItem("suspension"..level+1, 1)
					if tonumber(currentSuspension) ~= -1 then
						if Config.Overrides.receiveMaterials and MaterialRecieve["suspension"..currentSuspension+1] then
							addMaterials("suspension"..currentSuspension+1)
						else
							addItem("suspension"..currentSuspension+1, 1, 1)
						end
					end
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
			end
		end
	else
		local item = Items["suspension"..currentSuspension+1]
		if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "suspension"..currentSuspension+1, cam = cam}) then
			if (GetVehicleMod(vehicle, 15) ~= currentSuspension) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "suspension"..(currentSuspension+1)) return end
			qblog("`"..Items["suspension"..(currentSuspension+1)].label.." - suspension"..(currentSuspension+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
			if checkSetVehicleMod(vehicle, 15, -1) then
				updateCar(vehicle)
				if Config.Overrides.receiveMaterials and MaterialRecieve["suspension"..currentSuspension+1] then
					addMaterials("suspension"..currentSuspension+1)
				else
					addItem("suspension"..currentSuspension+1, 1, 1)
				end
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		else
			triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
		end
	end
end)

--=== TRANSMISSION ===--
RegisterNetEvent('jim-mechanic:client:applyTransmission', function(data) local Ped = PlayerPedId()
	local level = 1
	level = data.client.level

    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove

	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks()
	local above = isVehicleLift(vehicle)
	if not DoesEntityExist(vehicle) then return end

	local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
    if not enforceClassRestriction(searchCar(vehicle).class) then return end

	local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }

    lookEnt(vehicle)
    SetVehicleModKit(vehicle, 0)
    propHoldCoolDown("screwdriver") Wait(10)

	local possMods = checkHSWMods(vehicle)
	local currentTrans = GetVehicleMod(vehicle, 13)

	if remove == false then
		local item = Items["transmission"..level+1]
		if (GetNumVehicleMods(vehicle, 13) == 0 or (level+1) > possMods[13]) then triggerNotify(nil, Loc[Config.Lan]["common"].cant, "error") return end
		if currentTrans == level then triggerNotify(nil, Items["transmission"..level+1].label.." "..Loc[Config.Lan]["common"].already, "error") else
			if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "transmission"..level+1, cam = cam}) then
				if (GetVehicleMod(vehicle, 13) ~= currentTrans) or (not hasItem("transmission"..(level+1))) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "transmission"..(currentTrans+1))  return end
				if checkSetVehicleMod(vehicle, 13, level) then
					qblog("`"..Items["transmission"..(level+1)].label.." - transmission"..(level+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					updateCar(vehicle)
					removeItem("transmission"..level+1, 1)
					if currentTrans ~= -1 then
						if Config.Overrides.receiveMaterials and MaterialRecieve["transmission"..currentTrans+1] then
							addMaterials("transmission"..currentTrans+1)
						else
							addItem("transmission"..currentTrans+1, 1)
						end
					end
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
			end
		end
	else
		local item = Items["transmission"..currentTrans+1]
		if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "transmision"..currentTrans+1, cam = cam}) then
			if (GetVehicleMod(vehicle, 13) ~= currentTrans) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "transmission"..(currentTrans+1)) return end
			if checkSetVehicleMod(vehicle, 13, -1) then
				qblog("`"..item.label.." - transmission"..(currentTrans+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				if Config.Overrides.receiveMaterials and MaterialRecieve["transmission"..currentTrans+1] then
					addMaterials("transmission"..currentTrans+1)
				else
					addItem("transmission"..currentTrans+1, 1, 1)
				end
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		else
			triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
		end
	end
	if Config.Overrides.DoorAnimations then SetVehicleDoorShut(vehicle, 4, false) end
end)

--=== ENGINES ===--
RegisterNetEvent('jim-mechanic:client:applyEngine', function(data) local Ped = PlayerPedId()
	local level = 1
	level = data.client.level

    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove

	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks()
	local above = isVehicleLift(vehicle)
	if not DoesEntityExist(vehicle) then return end

	local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
    if not enforceClassRestriction(searchCar(vehicle).class) then return end

	local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }

	if not lookAtEngine(vehicle) then return end
    SetVehicleModKit(vehicle, 0)
    propHoldCoolDown("screwdriver") Wait(10)

	local possMods = checkHSWMods(vehicle)
	local currentEngine = GetVehicleMod(vehicle, 11)
	SetVehicleEngineOn(vehicle, false, false, true)
	if Config.Overrides.DoorAnimations then SetVehicleDoorOpen(vehicle, 4, false, false) end

	if remove == false then
		local item = Items["engine"..level+1]
		if (GetNumVehicleMods(vehicle, 11) == 0 or (level+1) > possMods[11]) then triggerNotify(nil, Loc[Config.Lan]["common"].cant, "error") return end
		if GetVehicleMod(vehicle, 11) == level then triggerNotify(nil, item.label..Loc[Config.Lan]["common"].already, "error") else
			if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "engine"..level+1, cam = cam }) then
				if (GetVehicleMod(vehicle, 11) ~= currentEngine) or (not hasItem("engine"..(level+1), 1)) then TriggerServerEvent("jim-mechanic:server:DupeWarn", "engine"..(currentEngine+1)) emptyHands(playerPed) return end
				if checkSetVehicleMod(vehicle, 11, level) then
					qblog("`"..item.label.." - engine"..(level+1).."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					updateCar(vehicle)
					removeItem("engine"..level+1, 1)
					if currentEngine ~= -1 then
						if Config.Overrides.receiveMaterials and MaterialRecieve["engine"..currentEngine+1] then
							addMaterials("engine"..currentEngine+1)
						else
							addItem("engine"..currentEngine+1, 1)
						end
					end
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
			end
		end
	else
		local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
		local item = Items["engine"..(currentEngine+1)]
		if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "engine"..currentEngine+1, cam = cam }) then
			if (GetVehicleMod(vehicle, 11) ~= currentEngine) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "engine"..(currentEngine+1)) return end
			if checkSetVehicleMod(vehicle, 11, -1) then
				qblog("`"..item.label.." - engine"..(currentEngine+1).."` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				if currentEngine ~= -1 then
					if Config.Overrides.receiveMaterials and MaterialRecieve["engine"..currentEngine+1] then
						addMaterials("engine"..currentEngine+1)
					else
						addItem("engine"..currentEngine+1, 1)
					end
				end
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		else
			triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
		end
	end
	if Config.Overrides.DoorAnimations then SetVehicleDoorShut(vehicle, 4, false) end
end)

--=== DRIFT TYRES ===--
RegisterNetEvent('jim-mechanic:client:applyDrift', function(data) local Ped = PlayerPedId() local item = Items["drifttires"]
    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove
	if GetGameBuildNumber() < 2372 then return end
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		if lockedCar(vehicle) then return end
		if Config.Main.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then triggerNotify(nil, Loc[Config.Lan]["common"].owned, "error") return end
		if not above and not lookAtWheel(vehicle) then return end
		local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
		if GetNumVehicleMods(vehicle,11) == 0 then triggerNotify(nil, Loc[Config.Lan]["common"].noOptions, "error") return end
		if GetDriftTyresEnabled(vehicle) ~= false and remove == false then triggerNotify(nil, Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			SetVehicleModKit(vehicle, 0)
			propHoldCoolDown("screwdriver") Wait(10)
			if remove == false then
				local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
				if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then
					qblog("`drifttires - "..item.label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					for i = 0, 4 do SetVehicleTyreFixed(vehicle, i) end
					SetDriftTyresEnabled(vehicle, true)
					updateCar(vehicle)
					removeItem("drifttires", 1)
					if GetVehicleTyresCanBurst(vehicle) ~= 1 then
						if Config.Overrides.receiveMaterials and MaterialRecieve["bprooftires"] then
							addMaterials("bprooftires")
						else
							addItem("bprooftires", 1)
						end
						SetVehicleTyresCanBurst(vehicle, true)
						triggerNotify(nil, Loc[Config.Lan]["tires"].swap, "success")
					end
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
				end
			else
				local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
				if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then SetVehicleModKit(vehicle, 0)
					if GetDriftTyresEnabled(vehicle) == false then TriggerServerEvent("jim-mechanic:server:DupeWarn", "drifttires") emptyHands(playerPed) return end
					qblog("`drifttires - "..Items["drifttires"].label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					for i = 0, 4 do SetVehicleTyreFixed(vehicle, i) end
					SetDriftTyresEnabled(vehicle, false)
					updateCar(vehicle)
					if Config.Overrides.receiveMaterials and MaterialRecieve["drifttires"] then
						addMaterials("drifttires")
					else
						addItem("drifttires", 1)
					end
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
				end
			end
			emptyHands(Ped)
		end
	end
end)

--=== BULLET PROOF TYRES ===--
RegisterNetEvent('jim-mechanic:client:applyBulletProof', function(data) local Ped = PlayerPedId() local item = Items["bprooftires"]
    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		if not above and not lookAtWheel(vehicle) then return end
		local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
		if lockedCar(vehicle) then return end
		if GetNumVehicleMods(vehicle,11) == 0 then triggerNotify(nil, Loc[Config.Lan]["common"].noOptions, "error") return end
		if GetVehicleTyresCanBurst(vehicle) == false and remove == false then triggerNotify(nil, item.label..Loc[Config.Lan]["common"].already, "error") else
			SetVehicleEngineOn(vehicle, false, false, true)
			propHoldCoolDown("screwdriver") Wait(10)
			if remove == false then
				if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then SetVehicleModKit(vehicle, 0)
					if GetVehicleTyresCanBurst(vehicle) == false then TriggerServerEvent("jim-mechanic:server:DupeWarn", "bprooftires") return end
					qblog("`bprooftires - "..item.label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					for i = 0, 4 do SetVehicleTyreFixed(vehicle, i) end
					SetVehicleTyresCanBurst(vehicle, false)
					updateCar(vehicle)
					removeItem("bprooftires", 1)
					if GetDriftTyresEnabled(vehicle) ~= false then
						if Config.Overrides.receiveMaterials and MaterialRecieve["drifttires"] then
							addMaterials("drifttires")
						else
							addItem("drifttires", 1)
						end
						SetDriftTyresEnabled(vehicle, false)
						triggerNotify(nil, Loc[Config.Lan]["tires"].swap2, "success")
					end
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
				end
			else
				if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then SetVehicleModKit(vehicle, 0)
					if GetVehicleTyresCanBurst(vehicle) ~= false then TriggerServerEvent("jim-mechanic:server:DupeWarn", "bprooftires") return end
					qblog("`bprooftires - "..item.label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					for i = 0, 4 do SetVehicleTyreFixed(vehicle, i) end
					SetVehicleTyresCanBurst(vehicle, true)
					updateCar(vehicle)
					if Config.Overrides.receiveMaterials and MaterialRecieve["bprooftires"] then
						addMaterials("bprooftires")
					else
						addItem("bprooftires", 1)
					end
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
				end
			end
			emptyHands(Ped)
		end
	end
end)

--=== HARNESS ===--
RegisterNetEvent('jim-mechanic:client:applyHarness', function(data) local canEffect = true local Ped = PlayerPedId() local item = Items["harness"]
	local remove = false
    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove
	if not enforceRestriction("perform") then return end
	if Config.Harness.JobOnly then if not Checks() then return end end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
		local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		local plate = trim(GetVehicleNumberPlateText(vehicle))
		GetVehicleStatus(VehToNet(vehicle))
		if remove and  VehicleStatus[plate]["harness"] ~= 1 then return end
		if not remove and VehicleStatus[plate]["harness"] == 1 then triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].already, "error") return end
		for _, class in pairs({"Vans", "Cycles", "Boats", "Helicopters", "Commercial", "Trains"}) do
			if searchCar(vehicle).class == class then canEffect = false end
		end
		if not canEffect then return end
		if lockedCar(vehicle) then return end
		lookEnt(vehicle)
		propHoldCoolDown("screwdriver") Wait(10)
		if remove == false then
			if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(5000,7000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "harness", cam = cam }) then
				if VehicleStatus[plate]["harness"] == 1 then TriggerServerEvent("jim-mechanic:server:DupeWarn", "harness") return end
				SetVehicleStatus(vehicle, "harness", 1, true)
				qblog("`"..item.label.." - harness` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				removeItem("harness", 1)
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
			end
		else
			if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(5000, 7000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "harness", cam = cam }) then
				if VehicleStatus[plate].harness == 0 then TriggerServerEvent("jim-mechanic:server:DupeWarn", "harness") return end
				SetVehicleStatus(vehicle, "harness", 0, true)
				qblog("`"..item.label.." - harness` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				if Config.Overrides.receiveMaterials and MaterialRecieve["harness"] then
					addMaterials("harness")
				else
					addItem("harness", 1)
				end
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			end
		end
	end
	emptyHands(Ped)
end)

--=== ANTILAG ===---
RegisterNetEvent('jim-mechanic:client:applyAntiLag', function(data) local Ped = PlayerPedId() local item = Items["antilag"]
	removePropHoldCoolDown()
    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
		local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		local plate = trim(GetVehicleNumberPlateText(vehicle))
		GetVehicleStatus(VehToNet(vehicle))
		if remove and VehicleStatus[plate].antiLag ~= 1 then return end
		if not remove and VehicleStatus[plate].antiLag == 1 then triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].already, "error") return end
		if lockedCar(vehicle) then return end
		if not IsToggleModOn(vehicle, 18) then triggerNotify(nil, Loc[Config.Lan]["nos"].notinstalled, "error") return end
		lookAtEngine(vehicle)
		if lockedCar(vehicle) then return end
		SetVehicleEngineOn(vehicle, false, false, true)
		propHoldCoolDown("screwdriver") Wait(10)
		if remove == false then
			if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then SetVehicleModKit(vehicle, 0)
				if VehicleStatus[plate].antiLag == 1 then TriggerServerEvent("jim-mechanic:server:DupeWarn", "antilag") return end
				SetVehicleStatus(vehicle, "antiLag", 1)
				qblog("`antilag - "..item.label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				removeItem("antilag", 1)
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		else
			if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then SetVehicleModKit(vehicle, 0)
				if VehicleStatus[plate].antiLag ~= 1 then TriggerServerEvent("jim-mechanic:server:DupeWarn", "antlLag") return end
				SetVehicleStatus(vehicle, "antiLag", 0, true)
				qblog("`antilag - "..item.label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				if Config.Overrides.receiveMaterials and MaterialRecieve["antilag"] then
					addMaterials("antilag")
				else
					addItem("antilag", 1)
				end
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		end
	end
end)

--=== MANUAL TRANSMISSION ===--
RegisterNetEvent('jim-mechanic:client:applyManual', function(data) local canEffect = true local Ped = PlayerPedId() local item = Items["manual"]
	removePropHoldCoolDown()
    if data.client.remove == nil then print("You need to update your ox_inv items") return end
    local remove = data.client.remove
	if not enforceRestriction("perform") then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local class = searchCar(vehicle).class
		if class == "Commercial" or class == "Helicopters" or class == "Boats" or class == "Cycles" or class == "Vans" or not GetResourceState("vlad_gears"):find("start") then
			triggerNotify(nil, Loc[Config.Lan].common["cant"], "error")
			return
		end
		local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
		local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		local plate = trim(GetVehicleNumberPlateText(vehicle))
		GetVehicleStatus(VehToNet(vehicle))
		if remove and  VehicleStatus[plate]["manual"] ~= 1 then return end
		if not remove and VehicleStatus[plate]["manual"] == 1 then triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].already, "error") return end
		for _, class in pairs({"Vans", "Cycles", "Boats", "Helicopters", "Commercial", "Trains"}) do
			if searchCar(vehicle).class == class then canEffect = false end
		end
		if not canEffect then return end
		if lockedCar(vehicle) then return end
		lookEnt(vehicle)
		propHoldCoolDown("screwdriver") Wait(10)
		if remove == false then
			if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(5000,7000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "manual", cam = cam }) then
				if VehicleStatus[plate]["manual"] == 1 then TriggerServerEvent("jim-mechanic:server:DupeWarn", "manual") return end
				SetVehicleStatus(vehicle, "manual", 1, true)
				qblog("`"..item.label.." - manual` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				removeItem("manual", 1)
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
			end
		else
			if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(5000, 7000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "harness", cam = cam }) then
				if VehicleStatus[plate].manual == 0 then TriggerServerEvent("jim-mechanic:server:DupeWarn", "manual") return end
				SetVehicleStatus(vehicle, "manual", 0, true)
				qblog("`"..item.label.." - manual` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				if Config.Overrides.receiveMaterials and MaterialRecieve["manual"] then
					addMaterials("manual")
				else
					addItem("manual", 1)
				end
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			end
		end
	end
end)