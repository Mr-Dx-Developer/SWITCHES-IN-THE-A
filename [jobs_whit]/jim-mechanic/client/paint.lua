--========================================================== Paint

local spraycan = nil
local Ped = nil
RegisterNetEvent('jim-mechanic:client:Paints:Apply', function(data)
	local coords = GetEntityCoords(Ped)
	local vehicle
	if not IsPedInAnyVehicle(Ped, false) then	vehicle = getClosest(coords) pushVehicle(vehicle) lookEnt(vehicle) else	vehicle = GetVehiclePedIsIn(Ped, false) pushVehicle(vehicle) end
	local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetOffsetFromEntityInWorldCoords(Ped, 3.0, -0.5, 0.5), 0.0, 0.0, 0.0, 60.00, false, 0)
	PointCamAtEntity(cam, Ped)
	local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
	local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
	local paintTable = {
		[Loc[Config.Lan]["paint"].primary] = vehPrimaryColour,
		[Loc[Config.Lan]["paint"].secondary] = vehSecondaryColour,
		[Loc[Config.Lan]["paint"].pearl] = vehPearlescentColour,
		[Loc[Config.Lan]["paint"].wheel] = vehWheelColour,
	}
	colourCheck = paintTable[data.finish]
	if colourCheck == data.id then
		triggerNotify(nil, data.finish.." "..data.name..Loc[Config.Lan]["common"].already, "error")
		TriggerEvent('jim-mechanic:client:Paints:Choose:Paint', data)
	elseif colourCheck ~= data.id then
		if data.paint ~= Loc[Config.Lan]["paint"].dashboard and data.paint ~= Loc[Config.Lan]["paint"].interior then startTempCam(cam) end
		spraycan = makeProp({ prop = "ng_proc_spraycan01b", coords = vec4(0.0, 0.0, 0.0, 0.0)}, 0, 1)
		AttachEntityToEntity(spraycan, Ped, GetPedBoneIndex(Ped, 57005), 0.11, 0.05, -0.06, 28.0, 30.0, 0.0, true, true, false, true, 1, true)
		playAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", nil, 1)
		local time = math.random(10000, 13000)

		Wait(6000)
		stopAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar")
		CreateThread(function()
			loadPtfxDict("core")
			local color = {255, 255, 255}
			UseParticleFxAssetNextCall("core")
			if data.paint == Loc[Config.Lan]["paint"].primary then SetVehicleColours(vehicle, data.id, vehSecondaryColour) color[1], color[2], color[3] = GetVehicleCustomPrimaryColour(vehicle)
			elseif data.paint == Loc[Config.Lan]["paint"].secondary then SetVehicleColours(vehicle, vehPrimaryColour, data.id) color[1], color[2], color[3] = GetVehicleCustomSecondaryColour(vehicle) end
			SetVehicleColours(vehicle, vehPrimaryColour, vehSecondaryColour)
			settask = nil
			local spray = StartParticleFxLoopedOnEntity("ent_amb_steam", spraycan, 0.0, 0.13, 0.0, 90.0, 90.0, 0.0, 0.2, 0.0, 0.0, 0.0)
			SetParticleFxLoopedAlpha(spray, 255.0)
			SetParticleFxLoopedColour(spray, color[1] / 255, color[2] / 255, color[3] / 255)
		end)
		playAnim(isVehicleLift(vehicle) and "amb@prop_human_movie_bulb@idle_a" or "switch@franklin@lamar_tagging_wall", isVehicleLift(vehicle) and "idle_b" or "lamar_tagging_exit_loop_lamar", nil, 1)

		if progressBar({label = Loc[Config.Lan]["common"].installing..data.paint.." "..data.finish.." "..data.name, time = time, cancel = true }) then SetVehicleModKit(vehicle, 0)
			qblog("`paintcan - "..Items["paintcan"].label.." - "..data.paint.." "..data.finish.." "..data.name.."` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
			if data.paint == Loc[Config.Lan]["paint"].primary then ClearVehicleCustomPrimaryColour(vehicle) SetVehicleColours(vehicle, data.id, vehSecondaryColour)
			elseif data.paint == Loc[Config.Lan]["paint"].secondary then ClearVehicleCustomSecondaryColour(vehicle) SetVehicleColours(vehicle, vehPrimaryColour, data.id)
			elseif data.paint == Loc[Config.Lan]["paint"].pearl then SetVehicleExtraColours(vehicle, data.id, vehWheelColour)
			elseif data.paint == Loc[Config.Lan]["paint"].wheel then SetVehicleExtraColours(vehicle, vehPearlescentColour, data.id)
			elseif data.paint == Loc[Config.Lan]["paint"].dashboard then SetVehicleDashboardColour(vehicle, data.id)
			elseif data.paint == Loc[Config.Lan]["paint"].interior then SetVehicleInteriorColour(vehicle, data.id) end
			updateCar(vehicle)
			triggerNotify(nil, data.paint.." "..data.finish.." "..data.name.." "..Loc[Config.Lan]["common"].installed, "success")
			if Config.Overrides.CosmeticItemRemoval then removeItem("paintcan", 1)
			else TriggerEvent('jim-mechanic:client:Paints:Choose:Paint', data) end
			emptyHands(Ped)
			stopTempCam()
		else
			triggerNotify(nil, Loc[Config.Lan]["paint"].menuheader..Loc[Config.Lan]["common"].instfail, "error")
			TriggerEvent('jim-mechanic:client:Paints:Choose:Paint', data)
			emptyHands(Ped)
			stopTempCam()
		end
	end
end)

RegisterNetEvent('jim-mechanic:client:Paints:Check', function()
	if Config.Main.CosmeticsJob then if not jobChecks() then return end end
	if not enforceRestriction("cosmetics") then return end
	if not locationChecks() then return end
	Ped = PlayerPedId()
	local coords = GetEntityCoords(Ped)
	if not nearPoint(coords) then return end
	local vehicle = nil
	if not IsPedInAnyVehicle(Ped, false) then	vehicle = getClosest(coords) pushVehicle(vehicle) lookEnt(vehicle) else vehicle = GetVehiclePedIsIn(Ped, false) pushVehicle(vehicle) end
    if not enforceClassRestriction(searchCar(vehicle).class) then return end
    if GetInPreview() then triggerNotify(nil, Loc[Config.Lan]["previews"].previewing, "error") return end
	if lockedCar(vehicle) then return end
	if Config.Main.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then triggerNotify(nil, Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then

	local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
	local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
	local interiorColor = GetVehicleInteriorColor(vehicle)
	local dashboardColor = GetVehicleDashboardColour(vehicle)

	for k, v in pairs(Loc[Config.Lan]) do
		if tostring(k) == "vehicleResprayOptionsClassic" or tostring(k) == "vehicleResprayOptionsMatte" or tostring(k) == "vehicleResprayOptionsMetals" or tostring(k) == "vehicleResprayOptionsChameleon" then
			for _, paint in pairs(v) do
				local text = ""
				if k == "vehicleResprayOptionsClassic" then text = Loc[Config.Lan]["paint"].metallic end
				if k == "vehicleResprayOptionsMatte" then text = Loc[Config.Lan]["paint"].matte end

				if vehPrimaryColour == paint.id then vehPrimaryColour = text.." "..paint.name end
				if vehSecondaryColour == paint.id then vehSecondaryColour = text.." "..paint.name	end
				if vehPearlescentColour == paint.id then vehPearlescentColour = text.." "..paint.name	end
				if vehWheelColour == paint.id then vehWheelColour = text.." "..paint.name	end
				if interiorColor == paint.id then interiorColor = text.." "..paint.name	end
				if dashboardColor == paint.id then dashboardColor = text.." "..paint.name end
			end
		end
	end

	if type(vehPrimaryColour) == "number" then vehPrimaryColour = Loc[Config.Lan]["common"].stock end
	if type(vehSecondaryColour) == "number" then vehSecondaryColour = Loc[Config.Lan]["common"].stock end
	if type(vehPearlescentColour) == "number" then vehPearlescentColour = Loc[Config.Lan]["common"].stock end
	if type(vehWheelColour) == "number" then vehWheelColour = Loc[Config.Lan]["common"].stock end
	if type(interiorColor) == "number" then interiorColor = Loc[Config.Lan]["common"].stock end
	if type(dashboardColor) == "number" then dashboardColor = Loc[Config.Lan]["common"].stock end
		local PaintMenu = {}
		if not IsPedInAnyVehicle(Ped, false) then
			PaintMenu[#PaintMenu + 1] = { arrow = true,
				header = Loc[Config.Lan]["paint"].primary, txt = Loc[Config.Lan]["common"].current..": "..vehPrimaryColour,
				onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose", Loc[Config.Lan]["paint"].primary) end,
			}
			PaintMenu[#PaintMenu + 1] = { arrow = true,
				header = Loc[Config.Lan]["paint"].secondary, txt = Loc[Config.Lan]["common"].current..": "..vehSecondaryColour,
				onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose", Loc[Config.Lan]["paint"].secondary) end,
			}
			PaintMenu[#PaintMenu + 1] = { arrow = true,
				header = Loc[Config.Lan]["paint"].pearl, txt = Loc[Config.Lan]["common"].current..": "..vehPearlescentColour,
				onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose", Loc[Config.Lan]["paint"].pearl) end,
			}
			PaintMenu[#PaintMenu + 1] = { arrow = true,
				header = Loc[Config.Lan]["paint"].wheel, txt = Loc[Config.Lan]["common"].current..": "..vehWheelColour,
				onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose", Loc[Config.Lan]["paint"].wheel) end,
			}
		else
			PaintMenu[#PaintMenu + 1] = { arrow = true,
				header = Loc[Config.Lan]["paint"].interior, txt = Loc[Config.Lan]["common"].current..": "..interiorColor,
				onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose", Loc[Config.Lan]["paint"].interior) end,
			}
			PaintMenu[#PaintMenu + 1] = { arrow = true,
				header = Loc[Config.Lan]["paint"].dashboard, txt = Loc[Config.Lan]["common"].current..": "..dashboardColor,
				onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose", Loc[Config.Lan]["paint"].dashboard) end,
			}
		end
		openMenu(PaintMenu, {
			header = searchCar(vehicle).name,
			headertxt = Loc[Config.Lan]["paint"].menuheader,
			canClose = true, onExit = function() end, })
	end
end)

RegisterNetEvent('jim-mechanic:client:Paints:Choose', function(data)
	if Config.Main.CosmeticsJob then if not jobChecks() then return end end
	if not locationChecks() then return end
	local coords = GetEntityCoords(Ped)
	if not nearPoint(coords) then return end
	local vehicle = nil
	if not IsPedInAnyVehicle(Ped, false) then	vehicle = getClosest(coords) pushVehicle(vehicle) else
	vehicle = GetVehiclePedIsIn(Ped, false) pushVehicle(vehicle) end

	if DoesEntityExist(vehicle) then
		local PaintMenu = {}
		if data == Loc[Config.Lan]["paint"].primary or data == Loc[Config.Lan]["paint"].secondary then
			local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
			local table = {
				[Loc[Config.Lan]["paint"].primary] = { { GetVehicleCustomPrimaryColour(vehicle) }, colorPrimary },
				[Loc[Config.Lan]["paint"].secondary] = { { GetVehicleCustomSecondaryColour(vehicle) }, colorSecondary }
			}
			local r,g,b = table[data][1][1], table[data][1][2], table[data][1][3]
			PaintMenu[#PaintMenu+1] = { arrow = true,
				header = Loc[Config.Lan]["paintrgb"].rgbP, txt = "[ "..r..", "..g..", "..b.." ]",
				onSelect = function() TriggerEvent("jim-mechanic:client:RGBHexMenu", { paint = data, }) end,
			}
			PaintMenu[#PaintMenu+1] = { arrow = true,
				header = Loc[Config.Lan]["paintrgb"].hexP, txt = "[ #"..rgbToHex(r, g, b):upper().." ]",
				onSelect = function() TriggerEvent("jim-mechanic:client:RGBHexMenu", { paint = data, hex = true }) end,
			}
		end

		PaintMenu[#PaintMenu+1] = { arrow = true,
			header = Loc[Config.Lan]["paint"].classic,
			onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose:Paint", { paint = data, finish = Loc[Config.Lan]["paint"].classic }) end,
		}
		PaintMenu[#PaintMenu+1] = { arrow = true,
			header = Loc[Config.Lan]["paint"].metallic,
			onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose:Paint", { paint = data, finish = Loc[Config.Lan]["paint"].metallic }) end,
		}
		PaintMenu[#PaintMenu+1] = { arrow = true,
			header = Loc[Config.Lan]["paint"].matte,
			onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose:Paint", { paint = data, finish = Loc[Config.Lan]["paint"].matte }) end,
		}
		PaintMenu[#PaintMenu+1] = { arrow = true,
			header = Loc[Config.Lan]["paint"].metals,
			onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose:Paint", { paint = data, finish = Loc[Config.Lan]["paint"].metals }) end,
		}
		if Config.Overrides.ChameleonPaints and (data ~= Loc[Config.Lan]["paint"].interior and data ~= Loc[Config.Lan]["paint"].dashboard) then
			PaintMenu[#PaintMenu+1] = { arrow = true,
				header = Loc[Config.Lan]["paint"].chameleon,
				onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Choose:Paint", { paint = data, finish = Loc[Config.Lan]["paint"].chameleon }) end,
			}
		end
		openMenu(PaintMenu, {
			header = searchCar(vehicle).name,
			headertxt = Loc[Config.Lan]["paint"].menuheader..br..(isOx() and br or "")..data,
			onBack = function() TriggerEvent("jim-mechanic:client:Paints:Check") end,
		})

	end
end)

RegisterNetEvent('jim-mechanic:client:Paints:Choose:Paint', function(data)
    local coords = GetEntityCoords(Ped)
	if not nearPoint(coords) then return end
	local vehicle = nil
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(coords) pushVehicle(vehicle) else vehicle = GetVehiclePedIsIn(Ped, false) pushVehicle(vehicle) end
	local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
	local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
	local colourTable = {
		[Loc[Config.Lan]["paint"].primary] = vehPrimaryColour,
		[Loc[Config.Lan]["paint"].secondary] = vehSecondaryColour,
		[Loc[Config.Lan]["paint"].pearl] = vehPearlescentColour,
		[Loc[Config.Lan]["paint"].wheel] = vehWheelColour,
		[Loc[Config.Lan]["paint"].dashboard] = GetVehicleDashboardColour(vehicle),
		[Loc[Config.Lan]["paint"].interior] = GetVehicleInteriorColour(vehicle),
	}
	colourCheck = colourTable[data.paint]
	if DoesEntityExist(vehicle) then
		local PaintMenu = {}
		local installed = nil
		local paintTable = {
			[Loc[Config.Lan]["paint"].classic] = Loc[Config.Lan].vehicleResprayOptionsClassic,
			[Loc[Config.Lan]["paint"].metallic] = Loc[Config.Lan].vehicleResprayOptionsClassic,
			[Loc[Config.Lan]["paint"].matte] = Loc[Config.Lan].vehicleResprayOptionsMatte,
			[Loc[Config.Lan]["paint"].metals] = Loc[Config.Lan].vehicleResprayOptionsMetals,
			[Loc[Config.Lan]["paint"].chameleon] = Loc[Config.Lan].vehicleResprayOptionsChameleon,
		}
		for k, v in pairs(paintTable[data.finish]) do
			local icon = "" local disabled = false
			if colourCheck == v.id then installed = Loc[Config.Lan]["common"].current icon = "fas fa-check" disabled = true else installed = "" end
			PaintMenu[#PaintMenu + 1] = { icon = icon, isMenuHeader = disabled,
				header = k.." - "..v.name..(Config.System.Debug and " ("..v.id..")" or ""), txt = installed,
				onSelect = function() TriggerEvent("jim-mechanic:client:Paints:Apply", { paint = data.paint, id = v.id, name = v.name, finish = data.finish }) end,
			}
		end

		openMenu(PaintMenu, {
			header = searchCar(vehicle).name,
			headertxt = Loc[Config.Lan]["paint"].menuheader..br..(isOx() and br or "")..data.finish.." "..data.paint,
			onBack = function() TriggerEvent("jim-mechanic:client:Paints:Choose", data.paint) end,
		})
	end
end)

---RGB---
local spraying = false
RegisterNetEvent('jim-mechanic:client:RGBApply', function(data)
	local coords = GetEntityCoords(Ped)
	local vehicle = getClosest(coords)
	local r,g,b = table.unpack({255,255,255})
	local spray = nil
	local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetOffsetFromEntityInWorldCoords(Ped, 3.0, -0.5, 1.5), 0.0, 0.0, 0.0, 60.00, false, 0)
	PointCamAtEntity(cam, vehicle)
	if data.hex then r, g, b = HexTorgb(data.hex) else
	if data.r >= 255 then r = 255 elseif data.r <= 0 then r = 0 else r = data.r end
		if data.g >= 255 then g = 255 elseif data.g <= 0 then g = 0 else g = data.g end
		if data.b >= 255 then b = 255 elseif data.b <= 0 then b = 0 else b = data.b end
	end
	startTempCam(cam)
	spraycan = makeProp({ prop = "ng_proc_spraycan01b", coords = vec4(0.0, 0.0, 0.0, 0.0)}, 0, 1)
	AttachEntityToEntity(spraycan, Ped, GetPedBoneIndex(Ped, 57005), 0.11, 0.05, -0.06, 28.0, 30.0, 0.0, true, true, false, true, 1, true)
	playAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", 2000, 8)
	Wait(2000)
	stopAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", 2000, 8)
	playAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_exit_loop_lamar", 10000, 1)
	Wait(1000)

	local colorPrimary, colorSecondary = GetVehicleColours(vehicle)

	spraycan = makeProp({ prop = `ng_proc_spraycan01b`, coords = vec4(0.0, 0.0, 0.0, 0.0)}, 0, 1)
	AttachEntityToEntity(spraycan, Ped, GetPedBoneIndex(Ped, 57005), 0.11, 0.05, -0.06, 28.0, 30.0, 0.0, true, true, false, true, 1, true)
	CreateThread(function()
		loadPtfxDict("core")
		UseParticleFxAssetNextCall("core")
		spray = StartParticleFxLoopedOnEntity("ent_amb_steam", spraycan, 0.0, 0.13, 0.05, 90.0, 90.0, 0.0, 0.2, 0.0, 0.0, 0.0)
		SetParticleFxLoopedAlpha(spray, 255.0)
		SetParticleFxLoopedColour(spray, r / 255, g / 255, b / 255)
	end)
	-- Set car to white/base coat
	if data.select == Loc[Config.Lan]["paint"].primary then
		SetVehicleCustomPrimaryColour(vehicle, 1.0, 1.0, 1.0)
		SetVehicleColours(vehicle, data.finish, colorSecondary)
	elseif data.select == Loc[Config.Lan]["paint"].secondary then
		SetVehicleCustomSecondaryColour(vehicle, 1.0, 1.0, 1.0)
		SetVehicleColours(vehicle, colorPrimary, data.finish)
	end
	local rd,gd,bd = 255, 255, 255 --Base Coat Numbers
	while rd ~= r or gd ~= g or bd ~= b do
		if rd ~= r then rd -= 1 end
		if gd ~= g then gd -= 1 end
		if bd ~= b then bd -= 1 end
		if data.select == Loc[Config.Lan]["paint"].primary then SetVehicleCustomPrimaryColour(vehicle, rd, gd, bd)
		elseif data.select == Loc[Config.Lan]["paint"].secondary then SetVehicleCustomSecondaryColour(vehicle, rd, gd, bd) end
		Wait(20)
	end
    spraying = false
	stopTempCam()
	updateCar(vehicle)
	SetVehicleModKit(vehicle, 0)
	qblog("`paintcan - "..Items["paintcan"].label.." - {"..r..", "..g..", "..b.."}` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
	if Config.Overrides.CosmeticItemRemoval then removeItem("paintcan", 1)
	else TriggerEvent("jim-mechanic:client:Paints:Choose", data.select) end
	emptyHands(Ped)
end)

RegisterNetEvent('jim-mechanic:client:RGBHexMenu', function(data)
	local vehicle = getClosest(GetEntityCoords(Ped))
	local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
	local format = {}
	local table = {
		[Loc[Config.Lan]["paint"].primary] = { { GetVehicleCustomPrimaryColour(vehicle) }, colorPrimary },
		[Loc[Config.Lan]["paint"].secondary] = { { GetVehicleCustomSecondaryColour(vehicle) }, colorSecondary }
	}
	local r,g,b = table[data.paint][1][1], table[data.paint][1][2], table[data.paint][1][3]
	if Config.System.Menu == "ox" then
		if data.hex then
			format = { type = 'color', label = "HEX:", format = "hex", default = "#"..rgbToHex(GetVehicleCustomPrimaryColour(vehicle)):upper() }
		else
			format = { type = 'color', label = "RGB:", format = "rgb", default = "rgb("..r..", "..g..", "..b..")" }
		end
		dialog = exports.ox_lib:inputDialog(
			(data.hex and Loc[Config.Lan]["paintrgb"].hexP or Loc[Config.Lan]["paintrgb"].rgbP)..br.." ["..data.paint.."]"..br..
			(data.hex and "[#"..rgbToHex(r,g,b):upper().."]" or "["..r..", "..g..", "..b.."]"),
			{ format,
			{ type = "select", options = {
					{ value = "147", label = Loc[Config.Lan]["paint"].classic },
					{ value = "12", label = Loc[Config.Lan]["paint"].matte },
					{ value = "120", label = Loc[Config.Lan]["paintrgb"].chrome }
				}, label = Loc[Config.Lan]["paintrgb"].finish, default = tostring(table[data.paint][2])
			}
		})
		if dialog then
			if data.hex then dialog[1] = dialog[1]:gsub("#", "") r, g, b = HexTorgb(dialog[1])
			else dialog[1] = convertOxRGB(dialog[1]) r, g, b = tonumber(dialog[1][1]) or r, tonumber(dialog[1][2]) or g, tonumber(dialog[1][3]) or b
			end
		end
	else
		local finishes = { type = 'radio', name = 'finish', text = Loc[Config.Lan]["paintrgb"].finish, options = { { value = "147", text = Loc[Config.Lan]["paint"].classic }, { value = "12", text = Loc[Config.Lan]["paint"].matte }, { value = "120", text = Loc[Config.Lan]["paintrgb"].chrome } } }
		if data.hex then
			format = { { type = 'text', name = 'hex', text = "#"..rgbToHex(r, g, b):upper() }, finishes }
		else
			format = { { type = 'number', name = 'r', text = 'R - '..r }, { type = 'number', name = 'g', text = 'G - '..g }, { type = 'number', name = 'b', text = 'B - '..b }, finishes }
		end
			dialog = exports['qb-input']:ShowInput({
				header = "<center>"..(data.hex and Loc[Config.Lan]["paintrgb"].hexP or Loc[Config.Lan]["paintrgb"].rgbP)..br.." ["..data.paint.."]"..br..
						(data.hex and "[ #<span style='color:#"..rgbToHex(r,g,b):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'>"..rgbToHex(r,g,b):upper().." </span>]"
						or "[<span style='color:#"..rgbToHex(r,g,b):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'> "..r.." "..g.." "..b.." </span>]"),
				submitText = Loc[Config.Lan]["xenons"].customconfirm,
				inputs = format }
			)
		if dialog then
			if data.hex then
				local hex = dialog.hex:gsub("#","")
				while string.len(hex) < 6 do hex = hex.."0"	Wait(10) end
				r, g, b = HexTorgb(hex)
			else
				r, g, b = tonumber(dialog.r or (r or 0)), tonumber(dialog.g or (g or 0)), tonumber(dialog.b or (b or 0))
			end
		end
	end
	if dialog then
		if r > 255 then r = 255 end if g > 255 then g = 255 end	if b > 255 then b = 255 end
		TriggerEvent('jim-mechanic:client:RGBApply', { finish = tonumber(dialog.finish or dialog[2]), select = data.paint, r = r, g = g, b = b })
	else
		TriggerEvent("jim-mechanic:client:Paints:Choose", data.paint)
	end
end)