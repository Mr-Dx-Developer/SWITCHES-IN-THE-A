RegisterNetEvent('jim-mechanic:client:Menu', function(editable)
	local ped = PlayerPedId()
	emptyHands(PlayerPedId())
	local coords = GetEntityCoords(ped) local vehicle = nil
	if not nearPoint(coords) then return end
	if not inCar() then return end
	if not IsPedInAnyVehicle(ped, false) then vehicle = getClosest(coords) pushVehicle(vehicle) end
	if lockedCar(vehicle) then return end
	if not DoesEntityExist(vehicle) then return end
	local possMods = checkHSWMods(vehicle)
	if editable then
		if not enforceRestriction("perform") then return end
		if not enforceClassRestriction(searchCar(vehicle).class) then return end
		if not jobChecks() then return end
		if not locationChecks() then return end
	end
	local plate = trim(GetVehicleNumberPlateText(vehicle))
	GetVehicleStatus(VehToNet(vehicle))
	local CheckMenu = {}
	local headertxt = Loc[Config.Lan]["check"].plate
	.." ["..trim(GetVehicleNumberPlateText(vehicle))
	.."]"..br..(isOx() and br or "")
	..Loc[Config.Lan]["check"].value
	..cv(searchCar(vehicle).price)
	..br..(isOx() and br or "")
	..searchDist(vehicle)

	local CheckTable = {
		[1] = { lock = true, part = "nos", head = Loc[Config.Lan]["check"].label58.." "..Loc[Config.Lan]["common"].notinstall, hide = true },
		[2] = { lock = true, part = "engine", desc = Loc[Config.Lan]["common"].stock..": [LVL 0 / "..possMods[11].."]", head = Loc[Config.Lan]["check"].label1 },
		[3] = { lock = true, part = "brakes", desc = Loc[Config.Lan]["common"].stock..": [LVL 0 / "..possMods[12].."]", head = Loc[Config.Lan]["check"].label2 },
		[4] = { lock = true, part = "suspension", desc = Loc[Config.Lan]["common"].stock..": [LVL 0 / "..possMods[15].."]", head = Loc[Config.Lan]["check"].label3 },
		[5] = { lock = true, part = "transmission", desc = Loc[Config.Lan]["common"].stock..": [LVL 0 / "..possMods[13].."]", head = Loc[Config.Lan]["check"].label4 },
		[6] = { lock = true, part = "car_armor", head = Loc[Config.Lan]["check"].label5.." "..Loc[Config.Lan]["common"].stock, },
		[7] = { lock = true, part = "turbo", head = Loc[Config.Lan]["check"].label6.." "..Loc[Config.Lan]["common"].notinstall },
		[8] = { lock = true, part = "headlights", head = Loc[Config.Lan]["check"].label7.." "..Loc[Config.Lan]["common"].notinstall },
		[9] = { lock = true, part = "drifttires", head = Loc[Config.Lan]["check"].label8.." "..Loc[Config.Lan]["common"].notinstall, hide = true  },
		[10] = { lock = true, part = "bprooftires", head = Loc[Config.Lan]["check"].label9.." "..Loc[Config.Lan]["common"].notinstall, hide = true  },
		[11] = { lock = true, part = "antilag", head = Loc[Config.Lan]["check"].label50.." "..Loc[Config.Lan]["common"].notinstall, hide = true  },
		[12] = { lock = true, part = "harness", head = Loc[Config.Lan]["check"].label51.." "..Loc[Config.Lan]["common"].notinstall, hide = true  },
		[13] = { lock = true, part = "manual", head = Items["manual"].label.." "..Loc[Config.Lan]["common"].notinstall, hide = true  },
		[14] = { lock = true, part = "underglow", head = Items["underglow"].label.." "..Loc[Config.Lan]["common"].notinstall, hide = true  },
	}

	--NOS--
	if VehicleNitrous[plate] and not Config.Overrides.disableNos then CheckTable[1].lock = false
		CheckTable[1].head = Loc[Config.Lan]["check"].label58.." "..math.floor(VehicleNitrous[plate].level).."%"
		CheckTable[1].icon = invImg(CheckTable[1].part)
		CheckTable[1].progress = math.floor(VehicleNitrous[plate].level)
	end
	--Engine--
	if possMods[11] == 0 then CheckTable[2].head = Loc[Config.Lan]["check"].label1.." "..Loc[Config.Lan]["check"].unavail CheckTable[2].desc = nil end
	if GetVehicleMod(vehicle, 11) ~= -1 then local lvl = (GetVehicleMod(vehicle, 11)+1) CheckTable[2].lock = false
		CheckTable[2].desc = Items[CheckTable[2].part..lvl].label..": [LVL "..lvl.." / "..possMods[11].."]"
		CheckTable[2].icon = invImg(CheckTable[2].part..lvl)
	end
	--Brakes--
	if possMods[12] == 0 then CheckTable[3].head = Loc[Config.Lan]["check"].label2.." "..Loc[Config.Lan]["check"].unavail CheckTable[3].desc = nil end
	if GetVehicleMod(vehicle, 12) ~= -1 then local lvl = (GetVehicleMod(vehicle, 12)+1) CheckTable[3].lock = false
		CheckTable[3].desc = Items[CheckTable[3].part..lvl].label..": [LVL "..lvl.." / "..possMods[12].."]"
		CheckTable[3].icon = invImg(CheckTable[3].part..lvl)
	end
	--Suspension--
	if possMods[15] == 0 then CheckTable[4].head = Loc[Config.Lan]["check"].label3.." "..Loc[Config.Lan]["check"].unavail CheckTable[4].desc = nil end
	if GetVehicleMod(vehicle, 15) ~= -1 then local lvl = (GetVehicleMod(vehicle, 15)+1) CheckTable[4].lock = false
		CheckTable[4].desc = Items[CheckTable[4].part..lvl].label..": [LVL "..lvl.." / "..possMods[15].."]"
		CheckTable[4].icon = invImg(CheckTable[4].part..lvl)
	end
	--Transmission--
	if possMods[13] == 0 then CheckTable[5].head = Loc[Config.Lan]["check"].label4.." "..Loc[Config.Lan]["check"].unavail CheckTable[5].desc = nil end
	if GetVehicleMod(vehicle, 13) ~= -1 then local lvl = (GetVehicleMod(vehicle, 13)+1) CheckTable[5].lock = false
		CheckTable[5].desc = Items[CheckTable[5].part..lvl].label.." [LVL "..lvl.." / "..possMods[13].."]"
		CheckTable[5].icon = invImg(CheckTable[5].part..lvl)
	end
	--Armor--
	if GetNumVehicleMods(vehicle, 16) == 0 then CheckTable[6].head = Loc[Config.Lan]["check"].label5.." "..Loc[Config.Lan]["check"].unavail CheckTable[6].desc = nil end
	if (GetVehicleMod(vehicle, 16)+1) == GetNumVehicleMods(vehicle, 16) then CheckTable[6].lock = false
		CheckTable[6].head = Loc[Config.Lan]["check"].label5
		CheckTable[6].desc = Loc[Config.Lan]["common"].installed:gsub("!","")
		CheckTable[6].icon = invImg(CheckTable[6].part)
	end
	--Turbo--
	if not IsToggleModOn(vehicle, 18) and GetNumVehicleMods(vehicle,11) ~= 0 then
	elseif IsToggleModOn(vehicle, 18) then CheckTable[7].lock = false
		CheckTable[7].head = Loc[Config.Lan]["check"].label6
		CheckTable[7].desc = Loc[Config.Lan]["common"].installed:gsub("!","")
		CheckTable[7].icon = invImg(CheckTable[7].part)
	elseif GetNumVehicleMods(vehicle,11) == 0 then CheckTable[7].desc = Loc[Config.Lan]["check"].unavail end
	--Xenons--
	local custom, r, g, b = GetVehicleXenonLightsCustomColor(vehicle) local xenonColor = ""
	if not IsToggleModOn(vehicle, 22) and GetNumVehicleMods(vehicle,11) ~= 0 then
	elseif IsToggleModOn(vehicle, 22) then CheckTable[8].lock = false
		CheckTable[8].head = Loc[Config.Lan]["check"].label7
		CheckTable[8].icon = invImg(CheckTable[8].part)
		if Config.System.Menu == "ox" then	CheckTable[8].desc = "R: "..r.." G: "..g.." B: "..b
		else CheckTable[8].desc = "<span style='color:#"..rgbToHex(r, g, b):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'> ⯀ </span> R: "..r.." G: "..g.." B: "..b end
	elseif GetNumVehicleMods(vehicle,11) == 0 then CheckTable[8].desc = Loc[Config.Lan]["check"].unavail  end
	--Drift
	if GetGameBuildNumber() >= 2372 then
		if GetDriftTyresEnabled(vehicle) == 1 then CheckTable[9].head = Items[CheckTable[9].part].label
			CheckTable[9].desc = Loc[Config.Lan]["common"].installed:gsub("!","")
			CheckTable[9].icon = invImg(CheckTable[9].part)
			CheckTable[9].lock = false
		end
	end
	--BulletProof
	if GetVehicleTyresCanBurst(vehicle) == false then CheckTable[10].head = Items[CheckTable[10].part].label
		CheckTable[10].desc = Loc[Config.Lan]["common"].installed:gsub("!","")
		CheckTable[10].icon = invImg(CheckTable[10].part)
		CheckTable[10].lock = false
	end
	--Anitlag
	if not IsThisModelABicycle(GetEntityModel(vehicle)) then
		if VehicleStatus[plate].manual == 1 then CheckTable[13].head = Items[CheckTable[13].part].label
			CheckTable[13].desc = Loc[Config.Lan]["common"].installed:gsub("!","")
			CheckTable[13].icon = invImg(CheckTable[13].part) CheckTable[13].lock = false
		end

		if VehicleStatus[plate].underglow == 1 then CheckTable[14].head = Items[CheckTable[14].part].label
			CheckTable[14].desc = Loc[Config.Lan]["common"].installed:gsub("!","")
			CheckTable[14].icon = invImg(CheckTable[14].part) CheckTable[14].lock = false
		end
		if VehicleStatus[plate].antiLag == 1 then CheckTable[11].head = Items[CheckTable[11].part].label
			CheckTable[11].desc = Loc[Config.Lan]["common"].installed:gsub("!","")
			CheckTable[11].icon = invImg(CheckTable[11].part) CheckTable[11].lock = false
		end
		--Harness
		if VehicleStatus[plate].harness == 1 then CheckTable[12].head = Items[CheckTable[12].part].label
			CheckTable[12].icon = invImg(CheckTable[12].part) CheckTable[12].lock = false end
		if Config.Harness.HarnessControl ~= true then
			CheckTable[12] = nil
		end
		if Config.Repairs.ExtraDamages == true then
			CheckTable[#CheckTable+1] = { lock = VehicleStatus[plate].oillevel == 0, part = "oilp", head = "Oil Pump",
				icon = VehicleStatus[plate].oillevel ~= 0 and invImg("oilp"..VehicleStatus[plate].oillevel) or "",
				desc =  (VehicleStatus[plate].oillevel ~= 0 and Items["oilp"..VehicleStatus[plate].oillevel].label or Loc[Config.Lan]["common"].stock)..": [LVL "..VehicleStatus[plate].oillevel.." / ".."3".."]"
			}
			CheckTable[#CheckTable+1] = { lock = VehicleStatus[plate].shaftlevel == 0, part = "drives", head = "Drive Shaft",
				icon = VehicleStatus[plate].shaftlevel ~= 0 and invImg("drives"..VehicleStatus[plate].shaftlevel) or "",
				desc =  (VehicleStatus[plate].shaftlevel ~= 0 and Items["drives"..VehicleStatus[plate].shaftlevel].label or Loc[Config.Lan]["common"].stock)..": [LVL "..VehicleStatus[plate].shaftlevel.." / ".."3".."]"
			}
			CheckTable[#CheckTable+1] = { lock = VehicleStatus[plate].cylinderlevel == 0, part = "cylind", head = "Cylinder Head",
				icon = VehicleStatus[plate].cylinderlevel ~= 0 and invImg("cylind"..VehicleStatus[plate].cylinderlevel) or "",
				desc =  (VehicleStatus[plate].cylinderlevel ~= 0 and Items["cylind"..VehicleStatus[plate].cylinderlevel].label or Loc[Config.Lan]["common"].stock)..": [LVL "..VehicleStatus[plate].cylinderlevel.." / ".."3".."]"
			}
			CheckTable[#CheckTable+1] = { lock = VehicleStatus[plate].cablelevel == 0, part = "cables", head = "Battery Cables",
				icon = VehicleStatus[plate].cablelevel ~= 0 and invImg("cables"..VehicleStatus[plate].cablelevel) or "",
				desc =  (VehicleStatus[plate].cablelevel ~= 0 and Items["cables"..VehicleStatus[plate].cablelevel].label or Loc[Config.Lan]["common"].stock)..": [LVL "..VehicleStatus[plate].cablelevel.." / ".."3".."]"
			}
			CheckTable[#CheckTable+1] = { lock = VehicleStatus[plate].fuellevel == 0, part = "fueltank", head = "Fuel Tank",
				icon = VehicleStatus[plate].fuellevel ~= 0 and invImg("fueltank"..VehicleStatus[plate].fuellevel) or "",
				desc =  (VehicleStatus[plate].fuellevel ~= 0 and Items["fueltank"..VehicleStatus[plate].fuellevel].label or Loc[Config.Lan]["common"].stock)..": [LVL "..VehicleStatus[plate].fuellevel.." / ".."3".."]"
			}
		end
	end
	for k, v in ipairs(CheckTable) do
		if v.hide and v.lock then else
			local extra = false
			for l, b in pairs({"oilp", "drives", "cylind", "cables", "fueltank"}) do if v.part == b then extra = true end end
			CheckMenu[#CheckMenu+1] = {
				icon = v.icon,
				isMenuHeader = (not editable) or v.lock,
				header = v.head, txt = v.desc,
				onSelect = not v.lock and (function() TriggerEvent("jim-mechanic:client:Menu:Remove", { vehicle = vehicle, mod = v.part, extra = extra }) end),
				progress = v.progress,
				colorScheme = editable and ((v.progress and (v.progress > 80)) and "green.5" or ((v.progress and (v.progress < 30)) and "red.6") or "yellow.5" ) or "gray.0"
			}
		end
	end
	if editable then
		CheckMenu[#CheckMenu+1] = { arrow = true,
			icon = "fas fa-toolbox",
			txt = Loc[Config.Lan]["check"].label10,
			onSelect = function() TriggerEvent("jim-mechanic:client:Menu:List") end,
		}
	end
	propHoldCoolDown("toolbox")
	openMenu(CheckMenu, { header = searchCar(vehicle).name, headertxt = headertxt, canClose = true, onExit = function() removePropHoldCoolDown() end })
end)

RegisterNetEvent('jim-mechanic:client:Menu:List', function() local Ped = PlayerPedId()
	if not nearPoint(GetEntityCoords(Ped)) then return end
	local vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle)
	local CheckMenu = {}
	local exTable = {
		[0] = Loc[Config.Lan]["check"].label15,	[1] = Loc[Config.Lan]["check"].label16,	[2] = Loc[Config.Lan]["check"].label17,	[3] = Loc[Config.Lan]["check"].label18,
		[4] = Loc[Config.Lan]["check"].label19,	[6] = Loc[Config.Lan]["check"].label20,	[7] = Loc[Config.Lan]["check"].label21,	[8] = Loc[Config.Lan]["check"].label22,
		[9] = Loc[Config.Lan]["check"].label23,	[10] = Loc[Config.Lan]["check"].label24, [25] = Loc[Config.Lan]["check"].label25, [26] = Loc[Config.Lan]["check"].label26,
		[27] = Loc[Config.Lan]["check"].label27, [44] = Loc[Config.Lan]["check"].label28, [37] = Loc[Config.Lan]["check"].label29, [39] = Loc[Config.Lan]["check"].label30,
		[40] = Loc[Config.Lan]["check"].label31, [41] = Loc[Config.Lan]["check"].label32, [42] = Loc[Config.Lan]["check"].label33,
	}
	local inTable = {
		[5] = Loc[Config.Lan]["check"].label34,	[25] = Loc[Config.Lan]["check"].label35, [29] = Loc[Config.Lan]["check"].label36, [30] = Loc[Config.Lan]["check"].label37,
		[31] = Loc[Config.Lan]["check"].label38, [32] = Loc[Config.Lan]["check"].label39, [33] = Loc[Config.Lan]["check"].label40, [34] = Loc[Config.Lan]["check"].label41,
		[35] = Loc[Config.Lan]["check"].label42, [36] = Loc[Config.Lan]["check"].label43, [38] = Loc[Config.Lan]["check"].label44, [43] = Loc[Config.Lan]["check"].label45,
		[45] = Loc[Config.Lan]["check"].label46,
	}
	local external, internal = nil
	for k in pairs(exTable) do if GetNumVehicleMods(vehicle, k) ~= 0 then external = true break end end
	for k in pairs(inTable) do if GetNumVehicleMods(vehicle, k) ~= 0 then internal = true break end end

	if external then
		CheckMenu[#CheckMenu+1] = { isMenuHeader = true, disabled = (Config.System.Menu == "ox"), header = Loc[Config.Lan]["check"].label13, title = Loc[Config.Lan]["check"].label13, }
		if GetNumVehicleMods(vehicle, 48) ~= 0 then
			CheckMenu[#CheckMenu+1] = {
				isMenuHeader = true,
				txt = Loc[Config.Lan]["police"].livery.." - [ "..GetNumVehicleMods(vehicle, 48).." "..Loc[Config.Lan]["check"].label12.." ]",
			}
		end
		if GetVehicleLiveryCount(vehicle) ~= -1 then
			CheckMenu[#CheckMenu+1] = {
				isMenuHeader = true,
				txt = Loc[Config.Lan]["police"].livery.." - [ "..GetVehicleLiveryCount(vehicle).." "..Loc[Config.Lan]["check"].label12.." ]",
			}
		end
		for k, v in pairs(exTable) do
			if GetNumVehicleMods(vehicle, k) ~= 0 then
				CheckMenu[#CheckMenu+1] = {
					isMenuHeader = true,
					txt = v..GetNumVehicleMods(vehicle, k).." "..Loc[Config.Lan]["check"].label12.." ]",
				}
			end
		end
	end
	if internal then
		CheckMenu[#CheckMenu+1] = { isMenuHeader = true, header = Loc[Config.Lan]["check"].label14, }
		for k, v in pairs(inTable) do
			if GetNumVehicleMods(vehicle, k) ~= 0 then
				CheckMenu[#CheckMenu+1] = {
					isMenuHeader = true,
					header = "",
					txt = v..GetNumVehicleMods(vehicle, k).." "..Loc[Config.Lan]["check"].label12.." ]",
				}
			end
		end
	end
	local mods = nil
	for k in pairs(exTable) do if GetNumVehicleMods(vehicle, k) ~= 0 then mods = true break end end
	for k in pairs(inTable) do if GetNumVehicleMods(vehicle, k) ~= 0 then mods = true break end end
	if GetVehicleLiveryCount(vehicle) ~= -1 then mods = true end
	if mods then
		propHoldCoolDown("toolbox")
		openMenu(CheckMenu,{
			header = Loc[Config.Lan]["check"].label11..searchCar(vehicle).name,
			headertxt = Loc[Config.Lan]["check"].label10, canClose = true,
			onExit = function() removePropHoldCoolDown() end,
		})
	else
		triggerNotify(nil, Loc[Config.Lan]["common"].noOptions, "error") return
	end
end)

RegisterNetEvent('jim-mechanic:client:Menu:Remove', function(data) local plate = trim(GetVehicleNumberPlateText(vehicle))
	local orgTable = {
		["brakes"] = {
			icon = invImg((GetVehicleMod(data.vehicle, 12)+1) > 0 and "brakes"..(GetVehicleMod(data.vehicle, 12)+1) or ""),
			head = ((GetVehicleMod(data.vehicle, 12)+1) > 0 and Items["brakes"..(GetVehicleMod(data.vehicle, 12)+1)].label or ""),
			event = function() TriggerEvent("jim-mechanic:client:applyBrakes", { client = { mod = data.mod, remove = true}}) end,
		},
		["engine"] = {
			icon = invImg((GetVehicleMod(data.vehicle, 11)+1) > 0 and "engine"..(GetVehicleMod(data.vehicle, 11)+1) or ""),
			head = ((GetVehicleMod(data.vehicle, 11)+1) > 0 and Items["engine"..(GetVehicleMod(data.vehicle, 11)+1)].label or ""),
			event = function() TriggerEvent("jim-mechanic:client:applyEngine", { client = { mod = data.mod, remove = true}}) end,
		},
		["suspension"] = {
			icon = invImg((GetVehicleMod(data.vehicle, 15)+1) > 0 and "suspension"..(GetVehicleMod(data.vehicle, 15)+1) or ""),
			head = ((GetVehicleMod(data.vehicle, 15)+1) > 0 and Items["suspension"..(GetVehicleMod(data.vehicle, 15)+1)].label or ""),
			event = function() TriggerEvent("jim-mechanic:client:applySuspension", { client = { mod = data.mod, remove = true}}) end,
		},
		["transmission"] = {
			icon = invImg((GetVehicleMod(data.vehicle, 13)+1) > 0 and "transmission"..(GetVehicleMod(data.vehicle, 13)+1) or ""),
			head = ((GetVehicleMod(data.vehicle, 13)+1) > 0 and Items["transmission"..(GetVehicleMod(data.vehicle, 13)+1)].label or ""),
			event = function() TriggerEvent("jim-mechanic:client:applyTransmission", { client = { mod = data.mod, remove = true}}) end,
		},
		["car_armor"] = {
			icon = invImg("car_armor"),
			head = Items["car_armor"].label,
			event = function() TriggerEvent("jim-mechanic:client:applyArmour", { client = { mod = data.mod, remove = true}}) end,
		},
		["turbo"] = {
			icon = invImg("turbo"),
			head = Items["turbo"].label,
			event = function() TriggerEvent("jim-mechanic:client:applyTurbo", { client = { mod = data.mod, remove = true}}) end,
		},
		["headlights"] = {
			icon = invImg("headlights"),
			head = Items["headlights"].label,
			event = function() TriggerEvent("jim-mechanic:client:giveXenon", { client = { mod = data.mod, remove = true}}) end,
		},
		["drifttires"] = {
			icon = invImg("drifttires"),
			head = Items["drifttires"].label,
			event = function() TriggerEvent("jim-mechanic:client:applyDrift", { client = { mod = data.mod, remove = true}}) end,
		},
		["bprooftires"] = {
			icon = invImg("bprooftires"),
			head = Items["bprooftires"].label,
			event = function() TriggerEvent("jim-mechanic:client:applyBulletProof", { client = { mod = data.mod, remove = true}}) end,
		},
		["nos"] = {
			icon = invImg("noscan"),
			head = Items["noscan"].label,
			event = function() TriggerEvent("jim-mechanic:client:giveNOS") end,
		},
		["oilp"] = {
			icon = invImg(VehicleStatus[plate].oillevel > 0 and "oilp"..VehicleStatus[plate].oillevel or ""),
			head = (VehicleStatus[plate].oillevel > 0 and Items["oilp"..VehicleStatus[plate].oillevel].label or ""),
			event = function() TriggerEvent("jim-mechanic:client:applyExtraPart", { client = { mod = data.mod, remove = true}}) end,
		},
		["drives"] = {
			icon = invImg(VehicleStatus[plate].shaftlevel > 0 and "drives"..VehicleStatus[plate].shaftlevel or ""),
			head = (VehicleStatus[plate].shaftlevel > 0 and Items["drives"..VehicleStatus[plate].shaftlevel].label or ""),
			event = function() TriggerEvent("jim-mechanic:client:applyExtraPart", { client = { mod = data.mod, remove = true}}) end,
		},
		["cylind"] = {
			icon = invImg(VehicleStatus[plate].cylinderlevel > 0 and "cylind"..VehicleStatus[plate].cylinderlevel or ""),
			head = (VehicleStatus[plate].cylinderlevel > 0 and Items["cylind"..VehicleStatus[plate].cylinderlevel].label or ""),
			event = function() TriggerEvent("jim-mechanic:client:applyExtraPart", { client = { mod = data.mod, remove = true}}) end,
		},
		["cables"] = {
			icon = invImg(VehicleStatus[plate].cablelevel > 0 and "cables"..VehicleStatus[plate].cablelevel or ""),
			head = (VehicleStatus[plate].cablelevel > 0 and Items["cables"..VehicleStatus[plate].cablelevel].label or ""),
			event = function() TriggerEvent("jim-mechanic:client:applyExtraPart", { client = { mod = data.mod, remove = true}}) end,
		},
		["fueltank"] = { icon = invImg(VehicleStatus[plate].fuellevel > 0 and "fueltank"..VehicleStatus[plate].fuellevel or ""),
			head = (VehicleStatus[plate].fuellevel > 0 and Items["fueltank"..VehicleStatus[plate].fuellevel].label or ""),
			event = function() TriggerEvent("jim-mechanic:client:applyExtraPart", { client = { mod = data.mod, remove = true}}) end,
		},
		["harness"] = {
			icon = invImg("harness"),
			head = Items["harness"].label,
			event = function() TriggerEvent("jim-mechanic:client:applyHarness", { client = { remove = true } }) end,
		},
		["antilag"] = {
			icon = invImg("antilag"),
			head = Items["antilag"].label,
			event = function() TriggerEvent("jim-mechanic:client:applyAntiLag", { client = { remove = true } }) end,
		},
		["manual"] = {
			icon = invImg("manual"),
			head = Items["manual"].label,
			event = function() TriggerEvent("jim-mechanic:client:applyManual", { client = { remove = true } }) end,
		},
		["underglow"] = {
			icon = invImg("underglow"),
			head = Items["underglow"].label,
			event = function() TriggerEvent("jim-mechanic:client:applyUnderglow", { client = { remove = true } }) end,
		},
	}
	local CheckMenu = { }
	CheckMenu[#CheckMenu+1] = {
		icon = orgTable[data.mod].icon,
		isMenuHeader = true,
		header = Loc[Config.Lan]["check"].label49..orgTable[data.mod].head.."?",
	}
	CheckMenu[#CheckMenu+1] = {
		icon = "fas fa-circle-check",
		txt = Loc[Config.Lan]["check"].label47,
		onSelect = function() orgTable[data.mod].event() end,
	}
	CheckMenu[#CheckMenu+1] = { icon = "fas fa-circle-xmark",
		txt = Loc[Config.Lan]["check"].label48,
		onSelect = function() TriggerEvent("jim-mechanic:client:Menu", true) end,
	}
	propHoldCoolDown("screwdriver")
	openMenu(CheckMenu, {
		header = searchCar(data.vehicle).name,
		headertxt = Loc[Config.Lan]["check"].plate.." ["..trim(GetVehicleNumberPlateText(data.vehicle)).."]"..br..(isOx() and br or "")..Loc[Config.Lan]["check"].value..cv(searchCar(data.vehicle).price)..br..(isOx() and br or "")..searchDist(data.vehicle),
		onExit = function() removePropHoldCoolDown() end,
	})
end)