onPlayerLoaded(function() GetXenonColour() end)

function GetXenonColour()
    local newxenonColour = triggerCallback('jim-mechanic:GetXenonColour')
    for k, v in pairs(newxenonColour) do xenonColour[k] = v end
    for k, v in pairs(xenonColour) do
		local entity = ensureNetToVeh(k)
        if entity then
            if IsEntityAVehicle(k) then
                if k ~= 0 or DoesEntityExist(k) then
					SetVehicleXenonLightsCustomColor(k, v[1], v[2], v[3])
				end
            end
        end
    end
end
--========================================================== Headlights
RegisterNetEvent('jim-mechanic:client:applyXenons', function() local Ped = PlayerPedId() local item = Items["headlights"]
	if not Checks() then return end
    if GetInPreview() then triggerNotify(nil, Loc[Config.Lan]["previews"].previewing, "error") return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
	local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 0.5, 1.0), 0.0, 0.0, 0.0, 60.00, false, 0) PointCamAtCoord(cam, GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 3.0, 0.5))
	if DoesEntityExist(vehicle) then
		local distanceToL = #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "headlight_l")))
		local distanceToR = #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "headlight_r")))
		local currentEngine = GetVehicleMod(vehicle, 11)
		if GetNumVehicleMods(vehicle,11) == 0 then triggerNotify(nil, Loc[Config.Lan]["common"].noOptions, "error") return end
		if above or (distanceToL <= 1 or distanceToR <= 1) then
			if IsToggleModOn(vehicle, 22) then triggerNotify(nil, Loc[Config.Lan]["common"].already, "error")
			else
				lookEnt(vehicle)
				if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(3000,7000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "headlights", cam = cam }) then SetVehicleModKit(vehicle, 0)
					if IsToggleModOn(vehicle, 22) then TriggerServerEvent("jim-mechanic:server:DupeWarn", "headlights") emptyHands(Ped) return end
					if checkToggleVehicleMod(vehicle, 22, true) then
						qblog("`"..item.label.." - headlights` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
						checkSetVehicleMod(vehicle, 11, currentEngine) -- Attempt to keep the engine as its current level after adding xenons, weird fucking gta game engine
						CreateThread(function()
							SetVehicleLights(vehicle, 2)
							Wait(1000)
							SetVehicleLights(vehicle, 1)
							Wait(200)
							SetVehicleLights(vehicle, 0)
						end)
						updateCar(vehicle)
						removeItem("headlights", 1)
						triggerNotify(nil, Loc[Config.Lan]["common"].installing.." "..item.label, "success")
					end
				else
					triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
				end
				emptyHands(Ped)
			end
		else triggerNotify(nil, Loc[Config.Lan]["common"].closer, "error") end
	end
end)

RegisterNetEvent('jim-mechanic:client:giveXenon', function() local Ped = PlayerPedId()  local item = Items["headlights"]
	if not Checks() then return end
	local vehicle = vehChecks() above = isVehicleLift(vehicle)
	local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
	if DoesEntityExist(vehicle) then
		local distanceToL = #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "headlight_l")))
		local distanceToR = #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "headlight_r")))
		if above or (distanceToR <= 1 or distanceToL <= 1) then
			lookEnt(vehicle)
			if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(3000,7000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "headlights"}) then SetVehicleModKit(vehicle, 0)
				if not IsToggleModOn(vehicle, 22) then TriggerServerEvent("jim-mechanic:server:DupeWarn", "headlights") emptyHands(playerPed) return end
				if checkToggleVehicleMod(vehicle, 22, false) then
					qblog("`"..item.label.." - headlights` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
					SetVehicleXenonLightsColor(vehicle, 0)
					updateCar(vehicle)
					addItem("headlights", 1)
					triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
				end
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].remfail, "error")
			end
			emptyHands(Ped)
		else
			triggerNotify(nil, Loc[Config.Lan]["common"].closer, "error")
		end
	end
end)

RegisterNetEvent('jim-mechanic:client:neonMenu', function() local NeonMenu, bike, Ped = {}, false, PlayerPedId() -- Start
	if not outCar() then return end
    if GetInPreview() then triggerNotify(nil, Loc[Config.Lan]["previews"].previewing, "error") return end
	local vehicle = GetVehiclePedIsIn(Ped) pushVehicle(vehicle)
	if lockedCar(vehicle) then return end
	if Config.Main.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then triggerNotify(nil, Loc[Config.Lan]["common"].owned, "error") return end
	GetVehicleStatus(VehToNet(vehicle))
	if IsThisModelABike(GetEntityModel(vehicle)) or IsThisModelAQuadbike(GetEntityModel(vehicle)) then bike = true end
	if (bike or VehicleStatus[trim(GetVehicleNumberPlateText(vehicle))].underglow == 0) and not IsToggleModOn(vehicle, 22) then triggerNotify(nil, Loc[Config.Lan]["common"].noOptions, "error") return end

	if not bike and VehicleStatus[trim(GetVehicleNumberPlateText(vehicle))].underglow == 1 then
		NeonMenu[#NeonMenu + 1] = { arrow = true, header = Loc[Config.Lan]["xenons"].neonheader2,
			onSelect = function() TriggerEvent("jim-mechanic:client:neonLightsMenu", {bike = bike, vehicle = vehicle}) end,
		}
	end
	if IsToggleModOn(vehicle, 22) then
		NeonMenu[#NeonMenu + 1] = { arrow = true, header = Loc[Config.Lan]["xenons"].neonheader4,
			onSelect = function() TriggerEvent("jim-mechanic:client:xenonMenu", {bike = bike, vehicle = vehicle}) end,
		}
	end
	openMenu(NeonMenu, {
		header = Loc[Config.Lan]["xenons"].neonheader1,
		canClose = true,
		onExit = function() end,
	})
end)

RegisterNetEvent('jim-mechanic:client:neonLightsMenu', function(data) local NeonMenu = {} -- Neon or Xenon
	if not outCar() then return end
    if GetInPreview() then triggerNotify(nil, Loc[Config.Lan]["previews"].previewing, "error") return end
	if not data.bike then
		NeonMenu[#NeonMenu + 1] = { arrow = true, header = Loc[Config.Lan]["xenons"].neonheader2, txt = "",
			onSelect = function() TriggerEvent("jim-mechanic:client:neonToggleMenu", { bike = data.bike, vehicle = data.vehicle }) end,
		}
		NeonMenu[#NeonMenu + 1] = { arrow = true, header = Loc[Config.Lan]["xenons"].neonheader3, txt = "",
			onSelect = function() TriggerEvent("jim-mechanic:client:neonColorMenu", { bike = data.bike, vehicle = data.vehicle }) end,
		}
	end
	openMenu(NeonMenu, {
		header = Loc[Config.Lan]["xenons"].neonheader2,
		onBack = function() TriggerEvent("jim-mechanic:client:neonMenu") end,
	})
end)

RegisterNetEvent('jim-mechanic:client:neonToggleMenu', function(data) -- Underglow Toggles
	local NeonMenu = {}
	local buttons = {
		{ id = -1, head = Loc[Config.Lan]["xenons"].toggle },
		{ id = 2, head = Loc[Config.Lan]["xenons"].front },
		{ id = 1, head = Loc[Config.Lan]["xenons"].right },
		{ id = 3, head = Loc[Config.Lan]["xenons"].back },
		{ id = 0, head = Loc[Config.Lan]["xenons"].left }
	}
	for i = 1, #buttons do
		NeonMenu[#NeonMenu+1] = { icon = buttons[i].id ~= -1 and (IsVehicleNeonLightEnabled(data.vehicle, buttons[i].id) ~= false and "fas fa-check" or "fas fa-x") or nil,
			header = buttons[i].head,
			onSelect = function() TriggerEvent("jim-mechanic:client:applyNeonPostion", { vehicle = data.vehicle, bike = data.bike, id = buttons[i].id, }) end,
		}
    end
	openMenu(NeonMenu, {
		header = Loc[Config.Lan]["xenons"].neonheader3,
		headertxt = Loc[Config.Lan]["xenons"].neontxt1,
		onBack = function() TriggerEvent("jim-mechanic:client:neonLightsMenu", data) end,
	})

end)

RegisterNetEvent('jim-mechanic:client:RGBMenu', function(data) -- Custom Underglow RGB
	local dialog = {}
	local r,g,b = GetVehicleNeonLightsColour(data.vehicle)
	local custom = nil
	if data.xenon then custom, r,g,b = GetVehicleXenonLightsCustomColor(data.vehicle) end
	if Config.System.Menu == "ox" then
		dialog = exports.ox_lib:inputDialog(Loc[Config.Lan]["xenons"].customheader, {
			{ type = 'color', label = "RGB:", format = "rgb", default = "rgb("..r..", "..g..", "..b..")" },
		})
		if dialog then
			dialog[1] = convertOxRGB(dialog[1])
			r, g, b = tonumber(dialog[1][1]) or r, tonumber(dialog[1][2]) or g, tonumber(dialog[1][3]) or b
		end
	else
		dialog = exports['qb-input']:ShowInput({
		header = Loc[Config.Lan]["xenons"].customheader,
		submitText = Loc[Config.Lan]["xenons"].customconfirm,
		inputs = {
			{ type = 'number', name = 'Red', text = 'R' },
			{ type = 'number', name = 'Green', text = 'G' },
			{ type = 'number', name = 'Blue', text = 'B' } } })
		if dialog then
			r, g, b = tonumber(dialog.Red or r), tonumber(dialog.Green or g), tonumber(dialog.Blue or b)
		end
	end
	if r > 255 then r = 255 end
	if g > 255 then g = 255 end
	if b > 255 then b = 255 end
	if data.xenon then
		TriggerServerEvent('jim-mechanic:server:ChangeXenonColour', VehToNet(data.vehicle), {r, g, b})
		SetVehicleXenonLightsColor(data.vehicle, -1)
		updateCar(data.vehicle)
		Wait(100)
		TriggerEvent('jim-mechanic:client:xenonMenu', data)
	else
		TriggerEvent('jim-mechanic:client:applyNeonColor', { vehicle = data.vehicle, bike = data.bike, r = r, g = g , b = b })
	end
end)

RegisterNetEvent('jim-mechanic:client:neonColorMenu', function(data) -- Neon Colour Picker
	local r, g, b = GetVehicleNeonLightsColour(data.vehicle)
	local NeonMenu = {}
	local desc = Loc[Config.Lan]["xenons"].neontxt2..br.."R:"..r.." G:"..g.." B:"..b.."<span style='color:#"..rgbToHex(GetVehicleNeonLightsColour(data.vehicle)):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'> ⯀ </span>"
	if Config.System.Menu == "ox" then
		desc = Loc[Config.Lan]["xenons"].neontxt2..br.."R:"..r.." G:"..g.." B:"..b
	end
	NeonMenu[#NeonMenu + 1] = { arrow = true, header = Loc[Config.Lan]["xenons"].customheader,
		onSelect = function() TriggerEvent("jim-mechanic:client:RGBMenu", data) end,
	}
	for k, v in pairs(Loc[Config.Lan].vehicleNeonOptions) do
		local icon = "" local disabled = false
		if r == v.R and g == v.G and b == v.B then installed = Loc[Config.Lan]["common"].current icon = "fas fa-check" disabled = true else installed = "" end
		NeonMenu[#NeonMenu + 1] = {  icon = icon,  isMenuHeader = disabled, header = v.name, txt = installed,
			onSelect = function() TriggerEvent("jim-mechanic:client:applyNeonColor", { vehicle = data.vehicle, bike = data.bike, r = v.R, g = v.G, b = v.B }) end,
		}
	end

	openMenu(NeonMenu, {
		header = Loc[Config.Lan]["xenons"].neonheader3,
		headertxt = desc,
		onBack = function() TriggerEvent("jim-mechanic:client:neonLightsMenu", data) end,
	})
end)

RegisterNetEvent('jim-mechanic:client:xenonMenu', function(data) -- Xenon Colour Selection
	local stockinstall, stockicon = ""
	local XenonMenu = {}
	local custom, r, g, b = GetVehicleXenonLightsCustomColor(data.vehicle)
	local desc = ""
	data.xenon = true
	if custom then
		desc = Loc[Config.Lan]["xenons"].xenontxt..br.."R:"..r.." G:"..g.." B:"..b.."<span style='color:#"..rgbToHex(r, g, b):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'> ⯀ </span>"
		if Config.System.Menu == "ox" then
			desc = Loc[Config.Lan]["xenons"].xenontxt..br.."R:"..r.." G:"..g.." B:"..b
		end
	else stockinstall = Loc[Config.Lan]["common"].current stockicon = "fas fa-check" end
	if not IsToggleModOn(data.vehicle, 22) then triggerNotify(nil, Loc[Config.Lan]["xenons"].notinstall, "error") else
		XenonMenu[#XenonMenu + 1] = { arrow = true, header = Loc[Config.Lan]["xenons"].customheader,
			onSelect = function() TriggerEvent("jim-mechanic:client:RGBMenu", data) end,
		}
		for k, v in pairs(Loc[Config.Lan].vehicleNeonOptions) do
			local icon = "" local disabled = false
			if r == v.R and g == v.G and b == v.B then  installed = Loc[Config.Lan]["common"].current icon = "fas fa-check" disabled = true
			else installed = ""  end
		XenonMenu[#XenonMenu + 1] = { icon = icon, isMenuHeader = disabled,
				header = v.name, txt = installed,
				onSelect = function() TriggerEvent("jim-mechanic:client:applyXenonColor", { vehicle = data.vehicle, bike = data.bike, R = v.R, G = v.G, B = v.B }) end,
			}
		end
		openMenu(XenonMenu, {
			header = Loc[Config.Lan]["xenons"].neonheader3,
			headertxt = desc,
			onBack = function() TriggerEvent("jim-mechanic:client:neonMenu", data) end,
		})
	end
end)

RegisterNetEvent('jim-mechanic:client:applyNeonPostion', function(data) -- Toggle Underglow Lights
	if GetIsVehicleEngineRunning(data.vehicle) then
		SetVehicleEngineOn(data.vehicle, true, true, true)
	end
	if data.id == -1 then
		if not IsVehicleNeonLightEnabled(data.vehicle, 2) or not IsVehicleNeonLightEnabled(data.vehicle, 1) or not IsVehicleNeonLightEnabled(data.vehicle, 3) or not IsVehicleNeonLightEnabled(data.vehicle, 0) then
			for i = 0, 4 do	SetVehicleNeonLightEnabled(data.vehicle, i, true) Wait(40) end
		else
			for i = 0, 4 do SetVehicleNeonLightEnabled(data.vehicle, i, false) Wait(40) end
		end
	else if IsVehicleNeonLightEnabled(data.vehicle, data.id) then SetVehicleNeonLightEnabled(data.vehicle, data.id, false) else SetVehicleNeonLightEnabled(data.vehicle, data.id, true) end
    end
	updateCar(data.vehicle)
    TriggerEvent("jim-mechanic:client:neonToggleMenu", data)
end)

RegisterNetEvent('jim-mechanic:client:applyNeonColor', function(data) -- Apple Underglow Colours
	if GetIsVehicleEngineRunning(data.vehicle) then
		SetVehicleEngineOn(data.vehicle, true, true, true)
	end
	SetVehicleNeonLightsColour(data.vehicle, data.r, data.g, data.b)
	updateCar(data.vehicle)
	TriggerEvent("jim-mechanic:client:neonColorMenu", data)
end)

RegisterNetEvent('jim-mechanic:client:applyXenonColor', function(data) -- Apple Xenon Colours
	if GetIsVehicleEngineRunning(data.vehicle) then
		SetVehicleEngineOn(data.vehicle, true, true, true)
	end
	if data.stock then
		ClearVehicleXenonLightsCustomColor(data.vehicle)
		SetVehicleXenonLightsColor(data.vehicle, -1)
		TriggerServerEvent('jim-mechanic:server:ChangeXenonStock', VehToNet(data.vehicle))
	else
		SetVehicleXenonLightsColor(data.vehicle, -1)
		SetVehicleXenonLightsCustomColor(data.vehicle, data.R, data.G, data.B)
		TriggerServerEvent('jim-mechanic:server:ChangeXenonColour', VehToNet(data.vehicle), { data.R, data.G, data.B })
	end
	updateCar(data.vehicle)
	Wait(100)
    TriggerEvent("jim-mechanic:client:xenonMenu", data)
end)

RegisterNetEvent('jim-mechanic:client:ChangeXenonColour', function(netId, newColour)
    xenonColour[netId] = newColour
    for k, v in pairs(xenonColour) do
		local netId = ensureNetToVeh(k)
		if not netId or netId == 0 then return end
		SetVehicleXenonLightsCustomColor(netId, v[1], v[2], v[3])
		if Config.System.Debug then
			print("^5Debug^7: ^2Recieving new ^3Xenon Colour ^7[^6"..tostring(netId).."^7] = { ^2RBG ^7= ^6"..v[1].."^7, ^6"..v[2].."^7, ^6"..v[3].." ^7}")
		end
    end
end)

RegisterNetEvent('jim-mechanic:client:ChangeXenonStock', function(netId)
	local netVeh = ensureNetToVeh(netId)
	if not netVeh or netVeh == false then return end
	xenonColour[netId] = nil
	if not netVeh then return end
	if DoesEntityExist(netVeh) and IsEntityAVehicle(netVeh) then
		ClearVehicleXenonLightsCustomColor(netVeh)
		SetVehicleXenonLightsColor(netVeh, -1)
		if Config.System.Debug then print("^5Debug^7: ^2Clearing ^3Xenon Colour for vehicle ^7[^6"..tostring(netVeh).."^7]") end
		xenonColour[netId] = nil
	end
end)

CreateThread(function()
    while true do
        for netId, v in pairs(xenonColour) do
			local veh = ensureNetToVeh(netId)
			if veh and veh ~= 0 then
                if veh ~= 0 and DoesEntityExist(veh) and IsEntityAVehicle(veh) then
                    if Config.System.Debug then print("^5Debug^7: ^2Ensuring ^3Xenon Colour^7[^6"..tostring(veh).."^7] = { ^2RBG ^7= ^6"..v[1].."^7, ^6"..v[2].."^7, ^6"..v[3].." ^7}") end
                    SetVehicleXenonLightsCustomColor(veh, v[1], v[2], v[3])
				end
            end
        end
        Wait(20000)
    end
end)

--=== UNDERGLOW ===--
RegisterNetEvent('jim-mechanic:client:applyUnderglow', function(data) local canEffect = true local Ped = PlayerPedId() local item = Items["underglow"]
	local remove = false
	if data.client.remove == nil then print("You need to update your ox_inv items") return else remove = data.client.remove end
	if not enforceRestriction("perform") then return end
	local vehicle = vehChecks() local above = isVehicleLift(vehicle)
	if DoesEntityExist(vehicle) then
		local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
		local emote = { anim = above and "idle_b" or "fixing_a_ped", dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair", flag = above and 1 or 16 }
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		local plate = trim(GetVehicleNumberPlateText(vehicle))
		GetVehicleStatus(VehToNet(vehicle))
		if remove and  VehicleStatus[plate]["underglow"] ~= 1 then return end
		if not remove and VehicleStatus[plate]["underglow"] == 1 then triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].already, "error") return end
		for _, class in pairs({"Vans", "Cycles", "Boats", "Helicopters", "Commercial", "Trains"}) do
			if searchCar(vehicle).class == class then canEffect = false end
		end
		if not canEffect then return end
		if lockedCar(vehicle) then return end
		lookEnt(vehicle)
		propHoldCoolDown("screwdriver") Wait(10)
		if remove == false then
			if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(5000,7000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "manual", cam = cam }) then
				if VehicleStatus[plate]["underglow"] == 1 then TriggerServerEvent("jim-mechanic:server:DupeWarn", "underglow") return end
				SetVehicleStatus(vehicle, "underglow", 1, true)
				qblog("`"..item.label.." - underglow` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				removeItem("underglow", 1)
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
			end
		else
			if progressBar({label = Loc[Config.Lan]["common"].removing..item.label, time = math.random(5000, 7000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, icon = "harness", cam = cam }) then
				if VehicleStatus[plate].underglow == 0 then TriggerServerEvent("jim-mechanic:server:DupeWarn", "underglow") return end
				SetVehicleStatus(vehicle, "underglow", 0, true)
				SetVehicleNeonLightsColour(vehicle, 255, 255, 255)
				for i = 0, 4 do SetVehicleNeonLightEnabled(vehicle, i, false) Wait(0) end
				qblog("`"..item.label.." - underglow` removed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				updateCar(vehicle)
				addItem("underglow", 1)
				triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].removed, "success")
			end
		end
	end
	emptyHands(Ped)
end)