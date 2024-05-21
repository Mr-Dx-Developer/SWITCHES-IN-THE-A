--==========================================================  Rims
local wheelType = {
	[0] = Loc[Config.Lan]["rims"].label1, [1] = Loc[Config.Lan]["rims"].label2, [2] = Loc[Config.Lan]["rims"].label3, [3] = Loc[Config.Lan]["rims"].label4,
	[4] = Loc[Config.Lan]["rims"].label5, [5] = Loc[Config.Lan]["rims"].label6, [6] = Loc[Config.Lan]["rims"].label15, [7] = Loc[Config.Lan]["rims"].label7,
	[8] = Loc[Config.Lan]["rims"].label8, [9] = Loc[Config.Lan]["rims"].label9, [10] = Loc[Config.Lan]["rims"].label10, [11] = Loc[Config.Lan]["rims"].label11,
	[12] = Loc[Config.Lan]["rims"].label12,
}

RegisterNetEvent('jim-mechanic:client:Rims:Apply', function(data)
	removePropHoldCoolDown() Wait(10)
	local Ped = PlayerPedId()
	local item = Items["rims"]
	local vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) local above = isVehicleLift(vehicle)
	if not above and not lookAtWheel(vehicle) then return end
	local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
	local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
	if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(3000,5000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then SetVehicleModKit(vehicle, 0)
		SetVehicleWheelType(vehicle, tonumber(data.wheeltype))
		if not data.bike then SetVehicleMod(vehicle, 23, tonumber(data.mod), GetVehicleModVariation(vehicle, 23))
		else SetVehicleMod(vehicle, 24, tonumber(data.mod), false) end
		updateCar(vehicle)
		if Config.Overrides.CosmeticItemRemoval then removeItem("rims", 1) else
			if data.mod == -1 then TriggerEvent('jim-mechanic:client:Rims:Check', data) else TriggerEvent('jim-mechanic:client:Rims:SubMenu', data) end
		end
		qblog("`rims - "..item.label.."` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
		triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
	else
		triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].instfail, "error")
	end
	emptyHands(Ped)
end)

RegisterNetEvent('jim-mechanic:client:Rims:ApplyCustomTires', function()
	removePropHoldCoolDown() Wait(10)
	local Ped = PlayerPedId()
	local item = Items["rims"]
	local vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) local above = isVehicleLift(vehicle)
	if not above and not lookAtWheel(vehicle) then return end
	local emote = { anim = above and "idle_b" or "machinic_loop_mechandplayer", dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", flag = above and 1 or 8 }
	local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
	if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(3000,5000), cancel = true, anim = emote.anim, dict = emote.dict, flag = emote.flag, cam = cam }) then
		SetVehicleModKit(vehicle, 0)
		SetVehicleMod(vehicle, 23, GetVehicleMod(vehicle, 23), not GetVehicleModVariation(vehicle, 23))
		updateCar(vehicle)
		TriggerEvent('jim-mechanic:client:Rims:Check')
		triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].installed, "success")
	else
		triggerNotify(nil, item.label.." "..Loc[Config.Lan]["common"].instfail, "error")
	end
	emptyHands(Ped)
end)

RegisterNetEvent('jim-mechanic:client:Rims:Check', function() local Menu, Ped = {}, PlayerPedId()
    local Restrictions = checkRestriction()
	if Config.Main.CosmeticsJob then if not jobChecks() then return end end
	if not enforceRestriction("cosmetics") then return end
	if not locationChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(Ped)) then return end
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end local above = isVehicleLift(vehicle)
	if not above and not lookAtWheel(vehicle) then return end
    if not enforceClassRestriction(searchCar(vehicle).class) then return end
	if DoesEntityExist(vehicle) then
		local cycle = IsThisModelABike(GetEntityModel(vehicle))
		local headertxt =
		(not cycle and br..Loc[Config.Lan]["common"].current..": "..br..(isOx() and br or "")..
		(GetVehicleMod(vehicle, 23) == -1 and Loc[Config.Lan]["common"].stock or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))).." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")" or "")
		if not cycle then
			Menu[#Menu + 1] = { -- Set to "Stock" button
				icon = GetVehicleMod(vehicle, 23) ~= -1 and "fa-solid fa-rotate-left" or nil,
				isMenuHeader = (GetVehicleMod(vehicle, 23) == -1 and GetVehicleMod(vehicle, 24) == -1),
				header = Loc[Config.Lan]["common"].stock, txt = (GetVehicleMod(vehicle, 23) == -1) and Loc[Config.Lan]["common"].current,
				onSelect = function() TriggerEvent("jim-mechanic:client:Rims:Apply", { mod = -1, wheeltype = 0, }) end,
			}
			getDefStats(vehicle, trim(GetVehicleNumberPlateText(vehicle)))
			if GetVehicleMod(vehicle, 23) ~= -1 then
				Menu[#Menu + 1] = {
					isMenuHeader = (GetVehicleMod(vehicle, 23) == -1 and GetVehicleMod(vehicle, 24) == -1),
					header = "Custom Tires",
					txt = GetVehicleModVariation(vehicle, 23) and Loc[Config.Lan]["common"].installed:gsub("%!", "") or Loc[Config.Lan]["common"].notinstall,
					onSelect = function()
						TriggerEvent("jim-mechanic:client:Rims:ApplyCustomTires")
					end,
				}
			end
			for k, v in pairs(wheelType) do
				Menu[#Menu+1] = { arrow = true,	header = v,
					onSelect = function() TriggerEvent("jim-mechanic:client:Rims:Choose", { wheeltype = k, bike = false }) end,
				}
			end
		end
		if cycle then
			Menu[#Menu+1] = { arrow = true, header = Loc[Config.Lan]["rims"].label13,
				onSelect = function() TriggerEvent("jim-mechanic:client:Rims:Choose", { wheeltype = 6, bike = false }) end,
			}
			Menu[#Menu+1] = { arrow = true, header = Loc[Config.Lan]["rims"].label14,
				onSelect = function() TriggerEvent("jim-mechanic:client:Rims:Choose", { wheeltype = 6, bike = true }) end,
			}
		end
		propHoldCoolDown("rims")
		openMenu(Menu, {
			header = searchCar(vehicle).name,
			headertxt = headertxt,
			canClose = true,
			onExit = function() removePropHoldCoolDown() end,
		})
	end
end)

RegisterNetEvent('jim-mechanic:client:Rims:Choose', function(data) local Ped = PlayerPedId()
    local Restrictions = checkRestriction()
	if Config.Main.CosmeticsJob then if not jobChecks() then return end end
	if not enforceRestriction("cosmetics") then return end
	if not locationChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(Ped)) then return end
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end local above = isVehicleLift(vehicle)
	if not above and not lookAtWheel(vehicle) then return end
    if not enforceClassRestriction(searchCar(vehicle).class) then return end
	local validMods = {}
	if DoesEntityExist(vehicle) then
		originalWheel = GetVehicleWheelType(vehicle)
		SetVehicleWheelType(vehicle, tonumber(data.wheeltype))
		for i = 1, (GetNumVehicleMods(vehicle, 23) +1) do
			local modName = GetLabelText(GetModTextLabel(vehicle, 23, (i-1)))
			if not validMods[modName] then
				validMods[modName] = {}
				validMods[modName][#validMods[modName]+1] = { id = (i-1), name = modName }
			elseif validMods[modName] then
				if validMods[modName][1] then
					local name = modName
					if modName == "NULL" then name = modName.." ("..(i-1)..")" end
					validMods[modName][#validMods[modName]+1] = { id = (i-1), name = name.." - Var "..(#validMods[modName]+1)}
				else
					validMods[modName][#validMods[modName]+1] = { id = validMods[modName].id, name = validMods[modName].name.." - Var 1" }
					validMods[modName][#validMods[modName]+1] = { id = (i-1), name = modName.." - Var "..(#validMods[modName]+1) }
				end
			end
		end

		if validMods["NULL"] then validMods[Loc[Config.Lan]["rims"].labelcustom] = validMods["NULL"] validMods["NULL"] = nil end
		local Menu = {}
		local headertxt =
			Loc[Config.Lan]["rims"].menuheader..br.."("..wheelType[data.wheeltype]..")"..br..(isOx() and br or "")..
			Loc[Config.Lan]["common"].current..": "..br..(isOx() and br or "")..
			(GetVehicleMod(vehicle, 23) == -1 and Loc[Config.Lan]["common"].stock or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))..
			" - ("..wheelType[(GetVehicleWheelType(vehicle))]..")")

		if data.wheeltype == 6 then
			Menu[#Menu + 1] = {
				icon = GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) ~= -1 and "fa-solid fa-rotate-left" or "",
				isMenuHeader = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1),
				header = Loc[Config.Lan]["common"].stock, txt = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1) and Loc[Config.Lan]["common"].current,
				onSelect = function() TriggerEvent("jim-mechanic:client:Rims:Apply", { mod = -1, wheeltype = 6, bike = data.bike }) end,
			}
		end
		for k, v in pairsByKeys(validMods) do
			Menu[#Menu + 1] = { arrow = true, header = k, txt = Loc[Config.Lan]["common"].amountoption..#validMods[k],
				onSelect = function() TriggerEvent("jim-mechanic:client:Rims:SubMenu", { mod = v.id, wheeltype = data.wheeltype, wheeltable = validMods[k], bike = data.bike, label = wheelType[data.wheeltype] }) end,
			}
		end
		SetVehicleWheelType(vehicle, originalWheel)
		propHoldCoolDown("rims")
		openMenu(Menu, {
			header = searchCar(vehicle).name,
			headertxt = headertxt,
			onBack = function() TriggerEvent("jim-mechanic:client:Rims:Check") end,
		})
	end
end)

RegisterNetEvent('jim-mechanic:client:Rims:SubMenu', function(data)	local Menu, Ped = {}, PlayerPedId()
    local Restrictions = checkRestriction()
	if Config.Main.CosmeticsJob then if not jobChecks() then return end end
	if not enforceRestriction("cosmetics") then return end
	if not locationChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(Ped)) then return end
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end local above = isVehicleLift(vehicle)
	if not above and not lookAtWheel(vehicle) then return end
    if not enforceClassRestriction(searchCar(vehicle).class) then return end
	if DoesEntityExist(vehicle) then
		local headertxt =
		Loc[Config.Lan]["rims"].menuheader..br.."("..string.upper(data.label)..")"..br..(isOx() and br or "")..
		Loc[Config.Lan]["common"].amountoption..#data.wheeltable..br..(isOx() and br or "")..
		Loc[Config.Lan]["common"].current..": "..br..(isOx() and br or "")..
		(GetVehicleMod(vehicle, 23) == -1 and Loc[Config.Lan]["common"].stock or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))..
		" - ("..wheelType[(GetVehicleWheelType(vehicle))]..")")
		for i = 1, #data.wheeltable do
			Menu[#Menu + 1] = {
				icon = ((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype)) and "fas fa-check",
				isMenuHeader = (GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype),
				header = data.wheeltable[i].name,
				txt = ((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype)) and Loc[Config.Lan]["common"].current,
				onSelect = function() TriggerEvent("jim-mechanic:client:Rims:Apply", { mod = data.wheeltable[i].id, wheeltype = data.wheeltype, wheeltable = data.wheeltable, bike = data.bike, label = data.label }) end,
			}
		end
		propHoldCoolDown("rims")
		openMenu(Menu, {
			header = searchCar(vehicle).name,
			headertxt = headertxt,
			onBack = function() TriggerEvent("jim-mechanic:client:Rims:Choose", { wheeltype = data.wheeltype, bike = data.bike }) end,
		})
	end
end)

CreateThread(function()
	--JDM SPORTS PACK from https://www.gta5-mods.com/vehicles/jdm-rims-pack
	AddTextEntry("0xF9668A07", "Rays TE037")
	AddTextEntry("0xF268CDCF", "Spoon SW388")
	AddTextEntry("0xF4DB3C3D", "5Zigen GN+")
	AddTextEntry("0xEFBD445C", "Mine\'s LM-Evolution")
	AddTextEntry("0xEF0938DB", "Advan GT")
	AddTextEntry("0xEDBA359C", "Enkei Sport RC-T4")
	AddTextEntry("0xEBEDAF71", "Mazdaspeed MS-01")
	AddTextEntry("0xDB417766", "Enkei Tarmac Evo")
	AddTextEntry("0xD290A445", "Rays TE37")
	AddTextEntry("0xD6DB4CC1", "BLITZ BRW Profile 08")
	AddTextEntry("0xD5E61D3B", "Rays TE37V")
	AddTextEntry("0xCCC28AEB", "Work Meister S1")
	AddTextEntry("0xC02DB8B1", "Forgiato Maglia")
	AddTextEntry("0xBF8073EF", "Work Meister L1 3p")
	AddTextEntry("0xB749E7D7", "CST Hyper Zero")
	AddTextEntry("0xB68AC7CF", "Advan GT")
	AddTextEntry("0xB27FBBAF", "SSR Formula Mesh")
	AddTextEntry("0xB3BFAE91", "Rota P45R")
	AddTextEntry("0xB3AACE2D", "SSR Star Shark")
	AddTextEntry("0xAE9A2298", "Work VS-XX")
	AddTextEntry("0xA4635825", "Work DH")
	AddTextEntry("0xA3229E78", "Work Meister CR01")
	AddTextEntry("0x77549955", "BBS RS")
	AddTextEntry("0x75341294", "Works Equip 01")
	AddTextEntry("0x669673D9", "Junction Produce Scara")
	AddTextEntry("0x648744CF", "Work VS-KF")
	AddTextEntry("0x69215F65", "Rays CE28")
	AddTextEntry("0x47984B7F", "Rays TE37 SL")
	AddTextEntry("0x9712C980", "Watanabe RS")
	AddTextEntry("0x8420AF35", "Grenade GX-01")
	AddTextEntry("0x5713E17E", "SSR Speed Star MKIII")
	AddTextEntry("0x4334E708", "Work Equip 40")
	AddTextEntry("0x2159D6ED", "Enkei RPF1")
	AddTextEntry("0x988C8565", "Speedline Corse Challenge")
	AddTextEntry("0x604CCF19", "Enkei ES Tarmac")
	AddTextEntry("0x567E3F09", "BBS LM")
	AddTextEntry("0x461F07C5", "Nismo LM-GT1")
	AddTextEntry("0x218BCEA5", "Mugen RNR")
	AddTextEntry("0x109FA030", "GTR Spec-V & Black Edition")
	AddTextEntry("0x88B32C2A", "Blitz Type03")
	AddTextEntry("0x84A88CD9", "Advan RGII")
	AddTextEntry("0x82F5930A", "Fabulous Expand")
	AddTextEntry("0x80E91952", "Mugen MF10")
	AddTextEntry("0x74D8B607", "Hyperlock HL-06S")
	AddTextEntry("0x70C65D13", "Nismo LM-GT4")
	AddTextEntry("0x56A6CC52", "Buddy Club P1 Racing")
	AddTextEntry("0x35E5E809", "Spoon Cr93")
	AddTextEntry("0x24FEB2A7", "SSR Vienna Kreis")
	AddTextEntry("0x11F8F6C5", "OZ Crono")
	AddTextEntry("0x8B73F26D", "Enkei Apache V")
	AddTextEntry("0x7BA6F10A", "Enkei 6666")
	AddTextEntry("0x5EC0D765", "Weds Kranze Bazreia")
	AddTextEntry("0x5CE23050", "WedsSport SA60m")
	AddTextEntry("0x4AEECEBB", "Rays 57C6")
	AddTextEntry("0x3C809BF2", "SSR Formula Mesh")
	AddTextEntry("0x3B1018AD", "Rays GT-C")
	AddTextEntry("0x2E63C5AD", "Rays RE30")
	AddTextEntry("0x2AC069A1", "SSR MK2r")
	AddTextEntry("0x1CE33E72", "DY Champion")
	AddTextEntry("0x1A933317", "Enkei Racing GTC01")
	AddTextEntry("0x08C6208F", "Enkei RP03")
	AddTextEntry("0x051D191F", "Mugen GP")
	AddTextEntry("0x04A41A26", "Enkei RS05rr")

	--Forgiato PACK from  https://www.gta5-mods.com/vehicles/forgiato-wheels-pack-1-add-on
	AddTextEntry("0x02DDD6C7", "Forgiato Monoleggera Freddo-M (Custom)")
	AddTextEntry("0x03B058DC", "Forgiato Monoleggera Maglia-M (Custom)")
	AddTextEntry("0x0ACD6716", "Forgiato Monoleggera GTR-M")
	AddTextEntry("0x0EC7F0D6", "Forgiato Monoleggera Spacco-M")
	AddTextEntry("0x1E340FAA", "Forgiato Monoleggera Vizzo-M")
	AddTextEntry("0x2F132FA1", "Forgiato MonoLeggera Freddo-M")
	AddTextEntry("0x3C97CAAA", "Forgiato Monoleggera GTR-M (Custom)")
	AddTextEntry("0x4C3FEBC1", "Forgiato Monoleggera Vizzo-M (Custom)")
	AddTextEntry("0x9CF20B5D", "Forgiato Monoleggera Spacco-M (Custom)")
	AddTextEntry("0x18FB0371", "Forgiato Monoleggera Labbro-M (Custom)")
	AddTextEntry("0x279A2276", "Forgiato Ventoso-ECL (Custom)")
	AddTextEntry("0x952CFD9E", "Forgiato Monoleggera Spacco-M (Custom)")
	AddTextEntry("0x85945D7A", "Forgiato Monoleggera Freddo-M (Custom)")
	AddTextEntry("0xBC37CBB7", "Forgiato Monoleggera Vizzo-M (Custom)")
	AddTextEntry("0xBE234E97", "Forgiato Monoleggera Fissato-M")
	AddTextEntry("0xC7E5621B", "Forgiato Monoleggera Fissato-M (Custom)")
	AddTextEntry("0xCDE06F08", "Forgiato Monoleggera Vizzo-M (Custom)")
	AddTextEntry("0xD1C3F500", "Forgiato Monoleggera Maglia-M (Custom)")
	AddTextEntry("0xE0059187", "Forgiato Monoleggera Maglia-M")
	AddTextEntry("0xE05F1405", "Forgiato Monoleggera Tello-M")
	AddTextEntry("0xE2B517BE", "Forgiato Monoleggera Fissato-M (Custom)")
	AddTextEntry("0xF9CD46E1", "Forgiato Ventoso-ECL")
	AddTextEntry("0xF569BC4F", "Forgiato Monoleggera Labbro-M")

	--https://www.gta5-mods.com/vehicles/hq-b-rims-pack
	AddTextEntry('0x01887837', 'VORSTEINER VSE-003 - Black')
	AddTextEntry('0x0275FD6A', 'GNOSIS GS1 - Gray')
	AddTextEntry('0x04E48E2B', 'Rotiform Concave Nue HD - Gray')
	AddTextEntry('0x05C2F495', 'Lexus Wheels Morro - Chrome')
	AddTextEntry('0x0A9F18B4', 'Rotiform BUC - Black')
	AddTextEntry('0x0A850A34', 'VORSTEINER VS190 - Black')
	AddTextEntry('0x0C117DA6', 'HRE RS105 - Black')
	AddTextEntry('0x0CFC1F82', 'Volk Racing CE28N - Gray')
	AddTextEntry('0x0DD98136', 'HRE RS105 - Gray')
	AddTextEntry('0x1B9AAC5F', 'VORSTEINER VS190 - Gray')
	AddTextEntry('0x1C4ABC0B', 'Rotiform BLQ-T - Chrome')
	AddTextEntry('0x2EAEE1BF', 'Rotiform Concave Nue HD - Chrome')
	AddTextEntry('0x3AD5FB35', 'Volk Racing CE28N - Chrome')
	AddTextEntry('0x3B615DAD', 'HRE 945RL - Gray')
	AddTextEntry('0x3E0AF5C7', 'GNOSIS GS1 - Chrome')
	AddTextEntry('0x3F8B6601', 'HRE 945RL - Black')
	AddTextEntry('0x4BE21C25', 'Rotiform DAB - Chrome')
	AddTextEntry('0x4C631C3B', 'Rotiform Concave SJC - Black')
	AddTextEntry('0x4CB88F56', 'Vossen CV3-R - Gray')
	AddTextEntry('0x4CE00672', 'GramLights 57Xtreme - Black')
	AddTextEntry('0x4D47A018', 'VolkRays G25 - Gray')
	AddTextEntry('0x5A2C2E09', 'SEEKER FX - Chrome')
	AddTextEntry('0x5A2CB8BA', 'Rotiform DAB - Gray')
	AddTextEntry('0x5AD02B85', 'Vossen CV3-R - Black')
	AddTextEntry('0x5BD32FE7', 'GNOSIS FCV04 - Gray')
	AddTextEntry('0x5C47AFF4', 'Vossen VPS303 - Black')
	AddTextEntry('0x5E4AB512', 'WEDS Maverick 508s - Gray')
	AddTextEntry('0x6BC757B8', 'ADV5 TSSL - Gray')
	AddTextEntry('0x6C855187', 'WEDS Maverick 508s - Chrome')
	AddTextEntry('0x6F395457', 'VORSTEINER VSR-163 Forged Monoblock - Gray')
	AddTextEntry('0x6FDFCC71', 'Avant Garde F433 - Chrome')
	AddTextEntry('0x7B1AE2E7', 'Enkei RS05RR - Chrome')
	AddTextEntry('0x7BEBFB4C', 'Rotiform Concave SJC - Gray')
	AddTextEntry('0x7CC5F208', 'Equip E10 - Black')
	AddTextEntry('0x7D8FFF80', 'Rotiform SNA - Colored')
	AddTextEntry('0x7D677AF8', 'ADV5 TRACK SPEC SL - Gray')
	AddTextEntry('0x7E6A71FD', 'VORSTEINER VS190 - Chrome')
	AddTextEntry('0x7EB500E2', 'Rotiform BLQ-T - Black')
	AddTextEntry('0x8EBB1D9F', 'ADV5 TRACK SPEC SL - Chrome')
	AddTextEntry('0x9AD8AB99', 'Vossen VPS 316 - Gray')
	AddTextEntry('0x9F59C43B', 'VolkRays G25 - Black')
	AddTextEntry('0x10E1992D', 'Vossen VPS304 - Colored')
	AddTextEntry('0x16B232EE', 'VolkRacing CE28N - Black')
	AddTextEntry('0x16F594D6', 'HRE 797RS - Chrome')
	AddTextEntry('0x22FC32AF', 'GramLights 57Xtreme - Gray')
	AddTextEntry('0x23A4B3FC', 'Avant Garde F433 - Black')
	AddTextEntry('0x26EEC307', 'VORSTEINER VSM313 - Black')
	AddTextEntry('0x28DD5530', 'Rotiform Concave SJC - Chrome')
	AddTextEntry('0x28E4B8B4', 'HRE 797RS - Colored')
	AddTextEntry('0x44A06F33', 'HRE P101 - Chrome')
	AddTextEntry('0x45DF8BE9', 'ADV 08 deepconcave - Gray')
	AddTextEntry('0x59CCB3C3', 'ADV5 TSSL - Black')
	AddTextEntry('0x61C6C916', 'VIP MODULAR VR08 - Chrome')
	AddTextEntry('0x65F6C352', 'Vossen VPS 316 - Chrome')
	AddTextEntry('0x66C03A32', 'BC FORGED RS41 - Chrome')
	AddTextEntry('0x77B866D9', 'Vossen VPS304 - Chrome')
	AddTextEntry('0x86F6F4D7', 'HRE 948RL - Gray')
	AddTextEntry('0x90ABA5F7', 'STANCE SC7 - Gray')
	AddTextEntry('0x96F814D9', 'HRE P101 - Colored')
	AddTextEntry('0x97E118CF', 'Lexus Wheels Morro - Colored')
	AddTextEntry('0x222DC486', 'ADV5 TRACK SPEC SL - Black')
	AddTextEntry('0x656DC244', 'Vossen VPS308 - Black')
	AddTextEntry('0x2206B9F3', 'VORSTEINER VSR-163 Forged Monoblock - Chrome')
	AddTextEntry('0x3421E86E', 'ADV 08 deepconcave - Black')
	AddTextEntry('0x4506EF90', 'iFORGED AEGIS - Chrome')
	AddTextEntry('0x4800F6D4', 'GramLights 57Xtreme - Chrome')
	AddTextEntry('0x6316ABAF', 'INCURVE IC-S10 - Colored')
	AddTextEntry('0x13312AC4', 'Rotiform Concave - Black')
	AddTextEntry('0x13691CB8', 'VORSTEINER VTM-350 - Black')
	AddTextEntry('0x23133D90', 'Vossen VPS303 - Chrome')
	AddTextEntry('0x32454A0D', 'iFORGED AEGIS - Colored')
	AddTextEntry('0x39185EE7', 'Enkei RS05RR - Colored')
	AddTextEntry('0x44158DB4', 'VolkRays G25 - Chrome')
	AddTextEntry('0x54220F2E', 'HRE 945RL - Chrome')
	AddTextEntry('0x766753B8', 'HRE 948RL - Chrome')
	AddTextEntry('0x2084268B', 'HRE RS105 - Chrome')
	AddTextEntry('0x10752115', 'ADV 08 deepconcave - Chrome')
	AddTextEntry('0x44140069', 'GNOSIS FCV04 - Black')
	AddTextEntry('0x95691783', 'Avant Garde F433 - Gray')
	AddTextEntry('0xA06FB567', 'VORSTEINER VSR-163 -Black')
	AddTextEntry('0xA0E43A48', 'Equip E10 - Gray')
	AddTextEntry('0xA82CC641', 'VORSTEINER VTM-350 - Chrome')
	AddTextEntry('0xB5C86F08', 'Rotiform BLQ-T - Gray')
	AddTextEntry('0xB8F5DE9C', 'BC FORGED RS41 - Black')
	AddTextEntry('0xB3046AA8', 'Rotiform DAB - Black')
	AddTextEntry('0xB67362CE', 'VORSTEINER VTM-350 - Gray')
	AddTextEntry('0xB746670C', 'Equip E10 - Chrome')
	AddTextEntry('0xBE777456', 'Vossen VPS303 - Gray')
	AddTextEntry('0xC0F48774', 'STANCE SC7 - Chrome')
	AddTextEntry('0xC1DA6A9D', 'HRE 948RL - Black')
	AddTextEntry('0xC1E183EB', 'ADV5 TSSL - Chrome')
	AddTextEntry('0xC6D00227', 'VORSTEINER VSM-313 - Gray')
	AddTextEntry('0xC8E60B7F', 'SEEKER FX - Black')
	AddTextEntry('0xC35FF370', 'BC FORGED RS41 - Gray')
	AddTextEntry('0xCA188B98', 'WEDS Maverick 508s - Black')
	AddTextEntry('0xD2A20E54', 'ISS RS 5R - Chrome')
	AddTextEntry('0xD3BD9CA2', 'VORSTEINER VSE-003 - Gray')
	AddTextEntry('0xD8DE1740', 'HRE P104 - Black')
	AddTextEntry('0xDB07AFC2', 'SEEKER FX - Gray')
	AddTextEntry('0xDBF02F47', 'Vossen VPS308 - Chrome')
	AddTextEntry('0xDDDF343D', 'GNOSIS FCV04 - Chrome')
	AddTextEntry('0xE4B53E91', 'VORSTEINER VSE-003 - Chrome')
	AddTextEntry('0xE5AE42C3', 'Vossen VPS308 - Gray')
	AddTextEntry('0xE79CB4BD', 'HRE P104 - Gray')
	AddTextEntry('0xE4124DAF', 'VIP MODULAR VR-08 - Gray')
	AddTextEntry('0xE74251FB', 'Rotiform BUC - Chrome')
	AddTextEntry('0xE833464D', 'Vossen VPS 316 - Black')
	AddTextEntry('0xEA6A5973', 'STANCE SC7 - Black')
	AddTextEntry('0xEC33D0E6', 'GNOSIS GS1 - Black')
	AddTextEntry('0xED9B60C1', 'VIP MODULAR VR-08 - Black')
	AddTextEntry('0xF8D4F520', 'Rotiform BUC - Gray')
	AddTextEntry('0xF48A5224', 'ISS RS 5R - Colored')
	AddTextEntry('0xF90A5B8C', 'INCURVE IC-S10 - Chrome')
	AddTextEntry('0xF95BD83B', 'HRE P104 - Chrome')
	AddTextEntry('0xF665E2B2', 'Vossen CV3-R - Chrome')
	AddTextEntry('0xFC1FFCDE', 'Rotiform SNA - Chrome')
	AddTextEntry('0xFCFE6E83', 'VORSTEINER VSM-313 - Chrome')
end)