--=== AMROUR ===--
RegisterNetEvent('jim-mechanic:client:applyArmour', function(data) local Ped = PlayerPedId() local item = Items["car_armor"]
	local remove = false
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }
		lookEnt(vehicle)
		SetVehicleModKit(vehicle, 0)
		propHoldCoolDown("screwdriver") Wait(10)
		if remove == false then
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
					emptyHands(Ped)
					TriggerServerEvent("jim-mechanic:server:DupeWarn", "car armor") return
				end
				qblog("`"..item.label.." - car_armor` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				checkSetVehicleMod(vehicle, 16, -1)
				updateCar(vehicle)
				addItem("car_armor", 1)
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			else
				triggerNotify(nil,  item.label.." "..Loc[Config.Lan]["common"].removed, "error")
			end
		end
		if Config.Overrides.DoorAnimations then SetVehicleDoorShut(vehicle, 4, false) end
		emptyHands(Ped)
	end
end)

--=== BRAKES ===--
RegisterNetEvent('jim-mechanic:client:applyBrakes', function(data) local Ped = PlayerPedId()
	local level, remove = 1, false
	level = data.client.level
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		if not above and not lookAtWheel(vehicle) then return end
		local possMods = checkHSWMods(vehicle)
		local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
		local currentBrakes = GetVehicleMod(vehicle, 12)
		SetVehicleModKit(vehicle, 0)
		propHoldCoolDown("screwdriver") Wait(10)
		if remove == false then
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
					if currentBrakes ~= -1 then addItem("brakes"..currentBrakes+1, 1) end
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
					addItem("brakes"..currentBrakes+1, 1)
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		end
		emptyHands(Ped)
	end
end)

--=== SUSPENSION ===--
RegisterNetEvent('jim-mechanic:client:applySuspension', function(data) local Ped = PlayerPedId() emptyHands(Ped)
	local level, remove = 1, false
	level = data.client.level
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		if not above and not lookAtWheel(vehicle) then return end
		local possMods = checkHSWMods(vehicle)
		local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
		local currentSuspension = GetVehicleMod(vehicle, 15)
		SetVehicleModKit(vehicle, 0)
		propHoldCoolDown("screwdriver") Wait(10)
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
						if tonumber(currentSuspension) ~= -1 then addItem("suspension"..currentSuspension+1, 1) end
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
					addItem("suspension"..currentSuspension+1, 1)
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		end
		emptyHands(Ped)
	end
end)

--=== TRANSMISSION ===--
RegisterNetEvent('jim-mechanic:client:applyTransmission', function(data) local Ped = PlayerPedId() emptyHands(Ped)
	local level, remove = 1, false
	level = data.client.level
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		local possMods = checkHSWMods(vehicle)
		local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }
		if not lookAtEngine(vehicle) then return end
		local currentTrans = GetVehicleMod(vehicle, 13)
		SetVehicleEngineOn(vehicle, false, false, true)
		if Config.Overrides.DoorAnimations then SetVehicleDoorOpen(vehicle, 4, false, false) end
		SetVehicleModKit(vehicle, 0)
		propHoldCoolDown("screwdriver") Wait(10)
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
						if currentTrans ~= -1 then addItem("transmission"..currentTrans+1, 1) end
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
					addItem("transmission"..currentTrans+1, 1)
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		end
	end
	if Config.Overrides.DoorAnimations then SetVehicleDoorShut(vehicle, 4, false) end
	emptyHands(Ped)
end)

--=== TURBO ===--
RegisterNetEvent('jim-mechanic:client:applyTurbo', function(data) local Ped = PlayerPedId() local item = Items["turbo"]
	local remove = false
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }
		SetVehicleModKit(vehicle, 0)
		SetVehicleEngineOn(vehicle, false, false, true)
		if Config.Overrides.DoorAnimations then SetVehicleDoorOpen(vehicle, 4, false, false) end
		propHoldCoolDown("screwdriver") Wait(10)
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
					addItem("turbo", 1)
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		end
		if Config.Overrides.DoorAnimations then SetVehicleDoorShut(vehicle, 4, false) end
		emptyHands(Ped)
	end
end)

--=== ENGINES ===--
RegisterNetEvent('jim-mechanic:client:applyEngine', function(data) local Ped = PlayerPedId() emptyHands(Ped)
	local level, remove = 1, false
	level = data.client.level
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		propHoldCoolDown("screwdriver") Wait(100)
		local possMods = checkHSWMods(vehicle)
		local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }
		if not lookAtEngine(vehicle) then return end
		local currentEngine = GetVehicleMod(vehicle, 11)
		SetVehicleEngineOn(vehicle, false, false, true)
		if Config.Overrides.DoorAnimations then SetVehicleDoorOpen(vehicle, 4, false, false) end
		SetVehicleModKit(vehicle, 0)
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
						if currentEngine ~= -1 then addItem("engine"..currentEngine+1, 1) end
						triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
					else
						triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
					end
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
				end
			end
		else
			local cam = createTempCam(Ped, GetEntityCoords(vehicle))
			local item = Items["engine"..(currentEngine+1)]
			if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "engine"..currentEngine+1, cam = cam }) then
				if (GetVehicleMod(vehicle, 11) ~= currentEngine) then emptyHands(Ped) TriggerServerEvent("jim-mechanic:server:DupeWarn", "engine"..(currentEngine+1)) return end
				if checkSetVehicleMod(vehicle, 11, -1) then
					qblog("`"..item.label.." - engine"..(currentEngine+1).."` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					updateCar(vehicle)
					if currentEngine ~= -1 then addItem("engine"..currentEngine+1, 1) end
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		end
		if Config.Overrides.DoorAnimations then SetVehicleDoorShut(vehicle, 4, false) end
		emptyHands(Ped)
	end
end)

--=== DRIFT TYRES ===--
RegisterNetEvent('jim-mechanic:client:applyDrift', function(data) local Ped = PlayerPedId() local item = Items["drifttires"]
	local remove = false
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
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
				local cam = createTempCam(Ped, GetEntityCoords(vehicle))
				if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then
					qblog("`drifttires - "..item.label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					for i = 0, 4 do SetVehicleTyreFixed(vehicle, i) end
					SetDriftTyresEnabled(vehicle, true)
					updateCar(vehicle)
					removeItem("drifttires", 1)
					if GetVehicleTyresCanBurst(vehicle) ~= 1 then
						addItem("bprooftires", 1)
						SetVehicleTyresCanBurst(vehicle, true)
						triggerNotify(nil, Loc[Config.Lan]["tires"].swap, "success")
					end
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
				end
			else
				local cam = createTempCam(Ped, GetEntityCoords(vehicle))
				if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(7000,10000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then SetVehicleModKit(vehicle, 0)
					if GetDriftTyresEnabled(vehicle) == false then TriggerServerEvent("jim-mechanic:server:DupeWarn", "drifttires") emptyHands(playerPed) return end
					qblog("`drifttires - "..Items["drifttires"].label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					for i = 0, 4 do SetVehicleTyreFixed(vehicle, i) end
					SetDriftTyresEnabled(vehicle, false)
					updateCar(vehicle)
					addItem("drifttires", 1)
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
	local remove = false
	print(json.encode(data, {indent = true}))
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
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
						addItem("drifttires", 1)
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
					addItem("bprooftires", 1)
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
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	if Config.Harness.JobOnly then if not Checks() then return end end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
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
				addItem("harness", 1)
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			end
		end
	end
	emptyHands(Ped)
end)

--=== ANTILAG ===---
RegisterNetEvent('jim-mechanic:client:applyAntiLag', function(data) local Ped = PlayerPedId() local item = Items["antilag"]
	local remove = false
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	if not Checks() then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
		local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		local plate = trim(GetVehicleNumberPlateText(vehicle))
		GetVehicleStatus(VehToNet(vehicle))
		if remove and VehicleStatus[plate]["antilag"] ~= 1 then return end
		if not remove and VehicleStatus[plate]["antilag"] == 1 then triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].already, "error") return end
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
				addItem("antilag", 1)
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
		end
		emptyHands(Ped)
	end
end)