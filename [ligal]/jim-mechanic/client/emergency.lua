local Enable = Config.Emergency.CosmeticTable
local cosmeticTable = { -- Don't touch if you don't know what this does
    { id = 48, header = Loc[Config.Lan]["livery"].menuheader, enable = Enable["Liverys"], },
    { header = Loc[Config.Lan]["livery"].menuheader, oldLiv = Enable["OldLiverys"] },
    { header = Loc[Config.Lan]["livery"].menuoldheader, roofLiv = Enable["RoofLiverys"] },
    { header = Loc[Config.Lan]["horns"].menuheader, horn = Enable["Horn"] },
    { id = 7, header = Loc[Config.Lan]["hood"].menuheader, enable = Enable["Hood"], },
    { id = 4, header = Loc[Config.Lan]["exhaust"].menuheader, enable = Enable["Exhaust"], },
    { id = 5, header = Loc[Config.Lan]["rollcage"].menuheader, enable = Enable["RollCage"], },
    { id = 10, header = Loc[Config.Lan]["roof"].menuheader, enable = Enable["Roof"], },
    { id = 0, header = Loc[Config.Lan]["spoilers"].menuheader, enable = Enable["Spoiler"], },
    { id = 32, header = Loc[Config.Lan]["seat"].menuheader, enable = Enable["Seats"], },
    { id = 25, header = Loc[Config.Lan]["plates"].label1, enable = Enable["PlateHolder"], },
    { id = 26, header = Loc[Config.Lan]["plates"].label2, enable = Enable["VanityPlate"], },
    { header = Loc[Config.Lan]["plates"].label3, plate = Enable["CustomPlate"] },
    { id = 3, header = Loc[Config.Lan]["skirts"].menuskirt, enable = Enable["Skirts"], },
    { id = 9, header = Loc[Config.Lan]["skirts"].menuRF, enable = Enable["RightFender"], },
    { id = 8, header = Loc[Config.Lan]["skirts"].menuLF, enable = Enable["LeftFender"], },
    { id = 6, header = Loc[Config.Lan]["bumpers"].menugrille, enable = Enable["Grille"], },
    { id = 1, header = Loc[Config.Lan]["bumpers"].menuFBumper, enable = Enable["FrontBumper"], },
    { id = 2, header = Loc[Config.Lan]["bumpers"].menuBBumper, enable = Enable["BackBumper"], },
    { id = 27, header = Loc[Config.Lan]["exterior"].label1, enable = Enable["TrimA"], },
    { id = 44, header = Loc[Config.Lan]["exterior"].label2, enable = Enable["TrimB"], },
    { id = 37, header = Loc[Config.Lan]["exterior"].label3, enable = Enable["Trunk"], },
    { id = 39, header = Loc[Config.Lan]["exterior"].label4, enable = Enable["EngineBlock"], },
    { id = 40, header = Loc[Config.Lan]["exterior"].label5, enable = Enable["Filter"], },
    { id = 41, header = Loc[Config.Lan]["exterior"].label6, enable = Enable["Struts"], },
    { id = 38, header = Loc[Config.Lan]["exterior"].label7, enable = Enable["Hydraulics"], },
    { id = 42, header = Loc[Config.Lan]["exterior"].label8, enable = Enable["ArchCovers"], },
    { id = 45, header = Loc[Config.Lan]["exterior"].label9, enable = Enable["FuelTank"], },
    { id = 43, header = Loc[Config.Lan]["exterior"].label10, enable = Enable["Aerials"], },
    { id = 28, header = Loc[Config.Lan]["interior"].label2, enable = Enable["Ornaments"], },
    { id = 29, header = Loc[Config.Lan]["interior"].label3, enable = Enable["DashBoard"], },
    { id = 30, header = Loc[Config.Lan]["interior"].label4, enable = Enable["Dials"], },
    { id = 31, header = Loc[Config.Lan]["interior"].label5, enable = Enable["DoorSpeakers"], },
    { id = 33, header = Loc[Config.Lan]["interior"].label6, enable = Enable["SteeringWheels"], },
    { id = 34, header = Loc[Config.Lan]["interior"].label7, enable = Enable["ShifterLeavers"], },
    { id = 35, header = Loc[Config.Lan]["interior"].label8, enable = Enable["Plaques"], },
    { id = 36, header = Loc[Config.Lan]["interior"].label9, enable = Enable["Speakers"], },
    { header = Loc[Config.Lan]["police"].extras, extra = Enable["Extras"] },
    { header = Loc[Config.Lan]["windows"].menuheader, window = Enable["WindowTints"] },
}
local wheelType = {
	[0] = Loc[Config.Lan]["rims"].label1, [1] = Loc[Config.Lan]["rims"].label2, [2] = Loc[Config.Lan]["rims"].label3, [3] = Loc[Config.Lan]["rims"].label4,
	[4] = Loc[Config.Lan]["rims"].label5, [5] = Loc[Config.Lan]["rims"].label6, [6] = Loc[Config.Lan]["rims"].label15, [7] = Loc[Config.Lan]["rims"].label7,
	[8] = Loc[Config.Lan]["rims"].label8, [9] = Loc[Config.Lan]["rims"].label9, [10] = Loc[Config.Lan]["rims"].label10, [11] = Loc[Config.Lan]["rims"].label11,
	[12] = Loc[Config.Lan]["rims"].label12,
}
local carMeta = {}

local bench = {}
CreateThread(function()
	for k, v in pairs(Config.Emergency.Locations) do
		if v.prop then bench[#bench+1] = makeProp({ prop = "gr_prop_gr_bench_03a", coords = vec4(v.coords.x, v.coords.y, v.coords.z-1.37, v.coords.a)}, 1, 0) end
		createBoxTarget({"bench"..k, vec3(v.coords.x, v.coords.y, v.coords.z-1), 1.2, 4.2, { name="bench"..k, heading = v.coords.a, debugPoly=Config.System.Debug, minZ = v.coords.z-1, maxZ = v.coords.z+1.4, }, },
			{ { action = function() TriggerEvent("jim-mechanic:client:Emergency:Check") end, icon = "fas fa-cogs", label = Loc[Config.Lan]["police"].userepair, job = Config.Emergency.Jobs, }, },5.0)
	end
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Check', function()
    local Menu, vehicle, Ped, coords = {}, nil, PlayerPedId(), GetEntityCoords(PlayerPedId())
	--if Config.Main.CosmeticsJob then if not jobChecks() then return end end
	if not IsPedInAnyVehicle(Ped, false) then
        vehicle = getClosest(coords)
        pushVehicle(vehicle)
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
        pushVehicle(vehicle)
    end
    carMeta = { ["search"] = searchCar(vehicle).name, ["class"] = searchCar(vehicle).class, ["plate"] = trim(GetVehicleNumberPlateText(vehicle)), ["price"] = searchCar(vehicle).price, ["dist"] = searchDist(vehicle), }

	--if Config.Main.isVehicleOwned and not IsVehicleOwned(carMeta.plate) then triggerNotify(nil, Loc[Config.Lan]["common"].owned, "error") return end
    local possMods = checkHSWMods(vehicle)
    GetVehicleStatus(VehToNet(vehicle))
    if Config.Emergency.LockEmergency then
        if carMeta.class ~= "Emergency" then
            triggerNotify(nil, Loc[Config.Lan]["police"].restrict, "error")
            return
        end
    end
	if DoesEntityExist(vehicle) then
        if Config.System.Debug then
            Menu[#Menu+1] = {
                icon = "fas fa-bug",
                header = "Vehicle Death (Debug)",
                onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Damage") end,
            }
        end
        local hideRepair = false
        if Config.Emergency.requireDutyCheck then
            hideRepair = triggerCallback('jim-mechanic:mechCheck')
        end
        if hideRepair ~= true then
            if Config.Emergency.CosmeticTable["Repair"] then
                Menu[#Menu+1] = {
                    icon = "fas fa-wrench",
                    header = Loc[Config.Lan]["police"].repair,
                    onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Repair") end,
                }
            end
        end
        if Config.Emergency.CosmeticTable["Paints"] then
            Menu[#Menu+1] = { arrow = true,
                icon = "fas fa-paint-roller",
                header = Loc[Config.Lan]["paint"].menuheader,
                onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Paints") end,
            }
        end
        if Config.Emergency.PreformaceTable["Engine"] then local id = 11
            local installed = (GetVehicleMod(vehicle, id) + 1 ~= 0 and "LVL: "..GetVehicleMod(vehicle, id)+1 or Loc[Config.Lan]["common"].stock)
            Menu[#Menu+1] = { arrow = true,
                header = Loc[Config.Lan]["repair"].engine, txt = "["..(possMods[id] +1)..Loc[Config.Lan]["common"].menuinstalled..installed,
                onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Choose", { perform = true, id = id, header = Loc[Config.Lan]["repair"].engine }) end,
            }
        end
        if Config.Emergency.PreformaceTable["Brakes"] then
            local label = Loc[Config.Lan]["check"].label2:gsub(":", "") local id = 12
            local installed = (GetVehicleMod(vehicle, id)+1 ~= 0 and "LVL: "..GetVehicleMod(vehicle, id)+1 or Loc[Config.Lan]["common"].stock)
            Menu[#Menu+1] = { arrow = true,
                header = label, txt = "["..(possMods[id]+1)..Loc[Config.Lan]["common"].menuinstalled..installed,
                onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Choose", { perform = true, id = id, header = label }) end,
            }
        end
        if Config.Emergency.PreformaceTable["Suspension"] then
            local label = Loc[Config.Lan]["check"].label3:gsub(":", "") local id = 15
            if GetNumVehicleMods(vehicle, id) ~= 0 then
                local installed = (GetVehicleMod(vehicle, id)+1 ~= 0 and "LVL: "..GetVehicleMod(vehicle, id)+1 or Loc[Config.Lan]["common"].stock)
                Menu[#Menu+1] = { arrow = true,
                    header = label, txt = "["..(possMods[id]+1)..Loc[Config.Lan]["common"].menuinstalled..installed,
                    onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Choose", { perform = true, id = id, header = label }) end,
                }
            end
        end
        if Config.Emergency.PreformaceTable["Transmission"] then
            local label = Loc[Config.Lan]["check"].label4:gsub(":", "") local id = 13
            if GetNumVehicleMods(vehicle, id) ~= 0 then
                local installed = (GetVehicleMod(vehicle, id)+1 ~= 0 and "LVL: "..GetVehicleMod(vehicle, id)+1 or Loc[Config.Lan]["common"].stock)
                Menu[#Menu+1] = { arrow = true,
                    header = label, txt = "["..(possMods[id]+1)..Loc[Config.Lan]["common"].menuinstalled..installed,
                    onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Choose", { perform = true, id = id, header = label }) end,
                }
            end
        end
        if Config.Emergency.PreformaceTable["Armour"] then
            local label = Loc[Config.Lan]["check"].label5:gsub(":", "") local id = 16
            if GetNumVehicleMods(vehicle, id) ~= 0 then
                local installed = Loc[Config.Lan]["common"].stock
                if GetVehicleMod(vehicle, id) > -1 then installed = Loc[Config.Lan]["common"].installed:gsub("!","") end
                Menu[#Menu+1] = {
                    arrow = true,
                    header = label, txt = installed,
                    onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Toggles", { id = id, header = label }) end,
                }
            end
        end
        if Config.Emergency.PreformaceTable["Turbo"] then
            local label = Loc[Config.Lan]["check"].label6:gsub(":", "") local id = 18
            local installed = Loc[Config.Lan]["common"].stock
            if IsToggleModOn(vehicle, id) then installed = Loc[Config.Lan]["common"].installed:gsub("!","") end
            Menu[#Menu+1] = {
                arrow = true,
                header = label, txt = installed,
                onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Toggles", { id = id, header = label }) end,
            }
        end
        if Config.Emergency.PreformaceTable["Harness"] and Config.Harness.HarnessControl then
            Menu[#Menu+1] = {
                arrow = true,
                header = Loc[Config.Lan]["check"].label51:gsub(":", ""),
                txt = VehicleStatus[carMeta.plate]["harness"] == 1 and Loc[Config.Lan]["common"].installed:gsub("!","") or Loc[Config.Lan]["common"].notinstall,
                onSelect = function()
                    triggerNotify(nil,
                    (VehicleStatus[carMeta.plate]["harness"] == 1 and Loc[Config.Lan]["common"].removing or Loc[Config.Lan]["common"].installing)..Loc[Config.Lan]["check"].label51:gsub(":", ""),
                    "success")
                    SetVehicleStatus(vehicle, "harness", VehicleStatus[carMeta.plate]["harness"] == 1 and 0 or 1)
                    Wait(100)
                    TriggerEvent("jim-mechanic:client:Emergency:Check")
                end,
            }
        end
        if Config.Emergency.CosmeticTable["Rims"] then
            Menu[#Menu+1] = {
                arrow = true,
                header = Loc[Config.Lan]["rims"].menuheader, txt = (not cycle and Loc[Config.Lan]["common"].current..": "..br..(isOx() and br or "")..
                (GetVehicleMod(vehicle, 23) == -1 and Loc[Config.Lan]["common"].stock or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))).." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")" or ""),
                onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Rims:Check") end,
            }
        end
        for k, v in pairs(cosmeticTable) do
            -- If specific items paramters, show extra categories
            if (v.roofLiv and GetVehicleRoofLiveryCount(vehicle) >= 1) or (v.oldLiv and GetVehicleLiveryCount(vehicle) >= 1) or v.plate or v.extra or v.window or v.horn then local txt, canDo, extraCount = "", true, 0
                if v.roofLiv then txt = "["..(GetVehicleRoofLiveryCount(vehicle)-1)..Loc[Config.Lan]["common"].menuinstalled..GetVehicleRoofLivery(vehicle) end
                if v.oldLiv then txt = "["..(GetVehicleLiveryCount(vehicle)-1)..Loc[Config.Lan]["common"].menuinstalled..GetVehicleLivery(vehicle) end
                if v.plate then for _, b in pairs(Loc[Config.Lan].vehiclePlateOptions) do
                    if GetVehicleNumberPlateTextIndex(vehicle) == b.id then txt = "["..GetNumberOfVehicleNumberPlates(vehicle)..Loc[Config.Lan]["common"].menuinstalled..b.name break
                    else txt = "["..GetNumberOfVehicleNumberPlates(vehicle)..Loc[Config.Lan]["common"].menuinstalled..Loc[Config.Lan]["common"].stock end end
                end
                if v.horn then for _, b in pairs(Loc[Config.Lan].vehicleHorns) do
                    if GetVehicleMod(vehicle, 14) == b.id then txt = "["..(#Loc[Config.Lan].vehicleHorns)..Loc[Config.Lan]["common"].menuinstalled..b.name break
                    else txt = "["..(#Loc[Config.Lan].vehicleHorns)..Loc[Config.Lan]["common"].menuinstalled..Loc[Config.Lan]["common"].stock end end
                end
                if v.extra then for i = 0, 14 do if DoesExtraExist(vehicle, i) then canDo = true extraCount += 1 end end txt = "[ "..extraCount.." "..Loc[Config.Lan]["check"].label12.." ]"
                    if extraCount == 0 then canDo = false end
                end
                if canDo then
                    Menu[#Menu+1] = { arrow = true,
                        header = v.header, txt = txt,
                        onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Choose", v) end,
                    }
                end
            end
            if v.enable and GetNumVehicleMods(vehicle, v.id) >= 1 then
                local installed = GetLabelText(GetModTextLabel(vehicle, v.id, GetVehicleMod(vehicle, v.id))) if installed == "NULL" then installed = Loc[Config.Lan]["common"].stock else end
                Menu[#Menu+1] = { arrow = true,
                    header = v.header, txt = "["..(GetNumVehicleMods(vehicle, v.id)+1)..Loc[Config.Lan]["common"].menuinstalled..installed,
                    onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Choose", v) end,
                }
            end

        end

        if (isOx() and countTable(Menu) ~= 0) or (Config.System.Menu == "qb" and countTable(Menu) ~= 2) then
            openMenu(Menu, { header = carMeta.search, headertxt = Loc[Config.Lan]["police"].header, canClose = true, onExit = function() end, })
        else
            triggerNotify(nil, Loc[Config.Lan]["common"].noOptions, "error")
        end
	end
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Toggles', function(data) local Ped = PlayerPedId()
	local vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle)
	if DoesEntityExist(vehicle) then
		SetVehicleModKit(vehicle, 0)
		if progressBar({label = Loc[Config.Lan]["common"].installing, time = 1000, cancel = true }) then
            if data.id == 16 then
                if GetVehicleMod(vehicle, data.id) < GetNumVehicleMods(vehicle, 16)-1 then
                    checkSetVehicleMod(vehicle, data.id, GetNumVehicleMods(vehicle, 16)-1)
                    triggerNotify(nil, Items["car_armor"].label.." "..Loc[Config.Lan]["common"].installed, "success")
                else
                    checkSetVehicleMod(vehicle, data.id, -1)
                    triggerNotify(nil, Items["car_armor"].label.." "..Loc[Config.Lan]["common"].removed, "error")
                end
            end
            if data.id == 18 then
                if not IsToggleModOn(vehicle, data.id) then
                    if checkToggleVehicleMod(vehicle, data.id, true) then
                        updateCar(vehicle)
                        triggerNotify(nil, Items["turbo"].label.." "..Loc[Config.Lan]["common"].installed, "success")
                    else
                        triggerNotify(nil, Items["turbo"].label..Loc[Config.Lan]["common"].instfail, "error")
                    end
                else
                    if checkToggleVehicleMod(vehicle, data.id, false) then
                        updateCar(vehicle)
                        triggerNotify(nil, Items["turbo"].label.." "..Loc[Config.Lan]["common"].removed, "success")
                    else
                        triggerNotify(nil, Items["turbo"].label..Loc[Config.Lan]["common"].remfail, "error")
                    end
                end
            end
            TriggerEvent("jim-mechanic:client:Emergency:Check")
        else
            triggerNotify(nil, Item["turbo"].label..Loc[Config.Lan]["common"].remfail, "error")
        end
	end
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Choose', function(data) local validMods, Menu, vehicle, Ped, coords = {}, {}, nil, PlayerPedId(), GetEntityCoords(PlayerPedId())
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(coords) pushVehicle(vehicle) else vehicle = GetVehiclePedIsIn(Ped, false) pushVehicle(vehicle) end
    local stockinstall, stockDisabled, stockIcon = "", false, ""
	if DoesEntityExist(vehicle) then
        local possMods = checkHSWMods(vehicle)
        --Pick which set of mods to look through
        if data.roofLiv then
            if GetVehicleRoofLivery(vehicle) <= 0 then stockinstall = Loc[Config.Lan]["common"].current stockDisabled = true end
            for i = 0, GetVehicleRoofLiveryCount(vehicle)-1 do local txt, disabled, icon = "", false, ""
                if GetVehicleRoofLivery(vehicle) == (i) then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                if i ~= 0 then validMods[i] = { mod = i, name = "Livery "..i, roofLiv = true, install = txt, disabled = disabled, icon = icon, header = data.header } end
            end
        elseif data.oldLiv then
            if GetVehicleLivery(vehicle) == 0 then stockinstall = Loc[Config.Lan]["common"].current stockDisabled = true end
            for i = 0, GetVehicleLiveryCount(vehicle)-1 do local txt, disabled, icon = "", false, ""
                if GetVehicleLivery(vehicle) == (i) then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                if i ~= 0 then validMods[i] = { mod = i, name = "Livery "..i..(Config.System.Debug and " oldLiv" or ""), oldLiv = true, install = txt, disabled = disabled, icon = icon, header = data.header } end
            end
        elseif data.plate then
            if GetVehicleNumberPlateTextIndex(vehicle) <= 0 then stockinstall = Loc[Config.Lan]["common"].current stockDisabled = true end
            for l, b in pairs(Loc[Config.Lan].vehiclePlateOptions) do local txt, disabled, icon = "", false, ""
                if GetVehicleNumberPlateTextIndex(vehicle) == b.id then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                validMods[l] = { mod = b.id, name = b.name, plate = true, install = txt, disabled = disabled, icon = icon, header = data.header }
            end
        elseif data.window then
            if GetVehicleWindowTint(vehicle) <= 0 then stockinstall = Loc[Config.Lan]["common"].current stockDisabled = true end
            for l, b in pairs(Loc[Config.Lan].vehicleWindowOptions) do local txt, disabled, icon = "", false, ""
                if GetVehicleWindowTint(vehicle) == b.id then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                validMods[l] = { mod = b.id, name = b.name, window = true, install = txt, disabled = disabled, icon = icon, header = data.header }
            end
        elseif data.horn then
            if GetVehicleMod(vehicle, 14) == -1 then stockinstall = Loc[Config.Lan]["common"].current stockIcon = "fas fa-check" stockDisabled = true end
            for l, b in pairs(Loc[Config.Lan].vehicleHorns) do local txt, disabled, icon = "", false, ""
                if GetVehicleMod(vehicle, 14) == b.id then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                validMods[l] = { mod = b.id, id = 14, name = b.name, horn = true, install = txt, disabled = disabled, icon = icon, header = data.header }
            end
        elseif data.extra then
            for i = 0, 14 do
                if DoesExtraExist(vehicle, i) then hadMod = true
                if IsVehicleExtraTurnedOn(vehicle, i) then icon = "fas fa-check" else icon = "" end
                validMods[i] = { mod = i, name = "Extra "..i, extra = true, install = txt, disabled = disabled, icon = icon, header = data.header } end
            end
        elseif data.perform then
            for i = 1, possMods[data.id] do  local txt, disabled, icon = "", false, ""
                if GetVehicleMod(vehicle, data.id) == (i-1) then
                    txt = Loc[Config.Lan]["common"].current
                    disabled = true
                    icon = "fas fa-check"
                end
                validMods[i] = { mod = (i-1), id = data.id, name = data.header.." Lvl "..i, perform = true, install = txt, disabled = disabled, icon = icon, header = data.header }
            end
        else
            if GetVehicleMod(vehicle, data.id) == -1 then stockinstall = Loc[Config.Lan]["common"].current stockIcon = "fas fa-check" stockDisabled = true end
            for i = 1, GetNumVehicleMods(vehicle, data.id) do local txt, disabled, icon = "", false, ""
                if GetVehicleMod(vehicle, data.id) == (i-1) then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                validMods[i] = { mod = (i - 1), id = data.id, name = GetLabelText(GetModTextLabel(vehicle, data.id, (i - 1))), install = txt, disabled = disabled, icon = icon, header = data.header }
            end
        end
        if not data.horn and not data.plate and not data.extra then
            Menu[#Menu+1] = { icon = not stockDisabled and "fa-solid fa-rotate-left" or "fas fa-check",
                isMenuHeader = stockDisabled,
                header = "0 - "..Loc[Config.Lan]["common"].stock, txt = stockinstall,
                onSelect = function()
                    TriggerEvent("jim-mechanic:client:Emergency:Apply", { mod = -1, header = data.header, id = data.id, plate = data.plate, window = data.window, oldLiv = data.oldLiv, roofLiv = data.roofLiv, extra = data.extra, perform = data.perform })
                end,
            }
        elseif data.horn then
            data.veh = vehicle
            Menu[#Menu+1] = {
                header = "Test Horn",
                onSelect = function()
                    StartVehicleHorn(data.veh, 2000, "HELDDOWN", true)
                    TriggerEvent('jim-mechanic:client:Emergency:Choose', data)
                end,
            }
        end
		for l, b in pairsByKeys(validMods) do
			Menu[#Menu+1] = {
                icon = b.icon or "fa-solid fa-rotate-left", isMenuHeader = b.disabled, disabled = (Config.System.Menu == "ox" and b.disabled),
				header = l.." - "..b.name, txt = b.install,
                onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Apply", b) end,
			}
		end
		openMenu(Menu, {
            header = carMeta.search,
            headertxt = Loc[Config.Lan]["police"].header..br..(isOx() and br or "")..Loc[Config.Lan]["common"].amountoption..#validMods+1,
            onBack = function() TriggerEvent("jim-mechanic:client:Emergency:Check", data) end,
        })
	end
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Apply', function(data) local Ped = PlayerPedId()
    if not data.mod then data.mod = -1 end
    --Specific Modifiers to adjust for specifc GTA bullshit
	local vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle)
	local modName = GetLabelText(GetModTextLabel(vehicle, tonumber(data.id), tonumber(data.mod)))
	if modName == "NULL" or (data.plate or data.oldLiv or data.roof or data.window) then modName = "" end
	if data.id and GetVehicleMod(vehicle, tonumber(data.id)) == tonumber(data.mod) then
        triggerNotify(nil, modName..Loc[Config.Lan]["common"].already, "error") TriggerEvent('jim-mechanic:client:Emergency:Choose', data)
	else
        if data.horn then local horn = GetVehicleMod(vehicle, 14) SetVehicleMod(vehicle, 14, data.mod) StartVehicleHorn(vehicle, 2000, "HELDDOWN", false) SetVehicleMod(vehicle, 14, horn) end
		if progressBar({label = Loc[Config.Lan]["common"].installing..modName, time = 1000, cancel = true }) then
			local success = Loc[Config.Lan]["common"].installed:gsub("!","")
            if data.roofLiv then if data.mod == -1 then data.mod = 0 end SetVehicleRoofLivery(vehicle, data.mod)
            elseif data.oldLiv then if data.mod == -1 then data.mod = nil end SetVehicleLivery(vehicle, data.mod) SetVehicleMod(vehicle, 48, -1, false)
            elseif data.plate then if data.mod == -1 then data.mod = 0 end SetVehicleNumberPlateTextIndex(vehicle, data.mod)
            elseif data.window then if data.mod == -1 then data.mod = 0 end SetVehicleWindowTint(vehicle, tonumber(data.mod)) success = Loc[Config.Lan]["common"].installed
            elseif data.extra then
                local veh = getDamages(vehicle)
                if IsVehicleExtraTurnedOn(vehicle, data.mod) then SetVehicleExtra(vehicle, data.mod, 1)
                else
                    SetVehicleExtra(vehicle, data.mod, 0)
                    SetVehicleFixed(vehicle)
                    SetVehicleDeformationFixed(vehicle)
                    if GetResourceState("qs-advancedgarages"):find("start") then exports["qs-advancedgarages"]:RepairNearestVehicle() end
                end
                doCarDamage(vehicle, veh)
                Wait(100)
                SetVehicleEngineHealth(vehicle, veh.engine)
                SetVehicleBodyHealth(vehicle, veh.body)
            else
                if not checkSetVehicleMod(vehicle, tonumber(data.id), tonumber(data.mod)) then triggerNotify(nil, Loc[Config.Lan]["check"].unavail, "error") return end
            end
            updateCar(vehicle)
            TriggerEvent('jim-mechanic:client:Emergency:Choose', data)
            triggerNotify(nil, success, "success")
        else
            triggerNotify(nil, Loc[Config.Lan]["common"].notinstall, "error")
        end
		emptyHands(Ped)
        Wait(500)
        if Config.Overrides.DoorAnimations then for i = 0, 5 do SetVehicleDoorShut(vehicle, i, false) end end
	end
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Repair', function() local Ped = PlayerPedId() local vehicle = GetVehiclePedIsIn(Ped, false) pushVehicle(vehicle)
    local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 3.0, 0.0, 1.0), GetEntityCoords(vehicle))
    startTempCam(cam)
	local wait = 1000 local currentFuel = GetVehicleFuelLevel(vehicle)
    FreezeEntityPosition(vehicle, true)
	triggerNotify(nil, Loc[Config.Lan]["manual"].tyres)
	for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
		if IsVehicleTyreBurst(vehicle, v, false) == 1 or IsVehicleTyreBurst(vehicle, v, true) == 1 then SetVehicleTyreFixed(vehicle, v) Wait(wait) end
	end
    SetVehicleOnGroundProperly(vehicle)
	triggerNotify(nil, Loc[Config.Lan]["manual"].doors)
	for i = 0, 5 do if not IsVehicleDoorDamaged(vehicle, i) then SetVehicleDoorBroken(vehicle, i, true) Wait(wait) end end
	triggerNotify(nil, Loc[Config.Lan]["police"].engine)
	SetVehicleEngineHealth(vehicle, 1000.0)
	SetVehicleBodyHealth(vehicle, 1000.0)
	Wait(2000)
	triggerNotify(nil, Loc[Config.Lan]["police"].body)
	if Config.Repairs.ExtraDamages == true then
        TriggerServerEvent("jim-mechanic:server:fixAllPart", carMeta.plate)
	end
    SetVehicleDeformationFixed(vehicle)
	SetVehicleFixed(vehicle)
    if GetResourceState("qs-advancedgarages"):find("start") then exports["qs-advancedgarages"]:RepairNearestVehicle() end
    Wait(2000)
	triggerNotify(nil, Loc[Config.Lan]["police"].cleaning)
	local cleaning = true
	while cleaning do
		if GetVehicleDirtLevel(vehicle) >= 1.0 then SetVehicleDirtLevel(vehicle, (tonumber(GetVehicleDirtLevel(vehicle))) - 0.8)
		elseif GetVehicleDirtLevel(vehicle) <= 1.0 then SetVehicleDirtLevel(vehicle, 0.0) cleaning = false end
		Wait(300)
	end
	triggerNotify(nil, Loc[Config.Lan]["police"].complete, "success")
	FreezeEntityPosition(vehicle, false)
    SetVehicleFuelLevel(vehicle, currentFuel)
    updateCar(vehicle)
    stopTempCam()
	TriggerEvent('jim-mechanic:client:Emergency:Menu')
end)

-- Debugging Damage Test --
RegisterNetEvent('jim-mechanic:client:Emergency:Damage', function(data)
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

	SetVehicleEngineHealth(vehicle, 40.0)
    SetVehicleBodyHealth(vehicle, 200.0)
	SetVehicleDirtLevel(vehicle, 14.5)
    SetVehicleFuelLevel(vehicle, 10.0)

    SetVehicleTyreBurst(vehicle, 0, true, 990.0)
    SetVehicleTyreBurst(vehicle, 1, false, 990.0)
    SetVehicleTyreBurst(vehicle, 2, true, 990.0)
    SetVehicleTyreBurst(vehicle, 3, false, 990.0)
    SetVehicleTyreBurst(vehicle, 4, true, 990.0)
    SetVehicleTyreBurst(vehicle, 5, false, 990.0)
    SetVehicleTyreBurst(vehicle, 45, true, 990.0)
    SetVehicleTyreBurst(vehicle, 47, false, 990.0)

    SetVehicleDoorBroken(vehicle, 1, true)
    SetVehicleDoorBroken(vehicle, 6, true)
    SetVehicleDoorBroken(vehicle, 4, true)

    SmashVehicleWindow(vehicle, 0)
    SmashVehicleWindow(vehicle, 1)
    SmashVehicleWindow(vehicle, 2)
    SmashVehicleWindow(vehicle, 3)
    SmashVehicleWindow(vehicle, 4)

	if Config.Repairs.ExtraDamages == true then
		local DamageComponents = { "oil", "axle", "battery", "fuel", "spark", }
		for _, name in pairs(DamageComponents) do
			SetVehicleStatus(vehicle, name, 20.0, true)
		end
	end
	TriggerEvent('jim-mechanic:client:Emergency:Menu')
	updateCar(vehicle)
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Paints', function() local Ped = PlayerPedId() local vehicle = nil
	if not IsPedInAnyVehicle(Ped, false) then return else vehicle = GetVehiclePedIsIn(Ped, false) end
	if DoesEntityExist(vehicle) then pushVehicle(vehicle)
	local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
	local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
	local interiorColor = GetVehicleInteriorColor(vehicle)
	local dashboardColor = GetVehicleDashboardColour(vehicle)
	for k, v in pairs(Loc[Config.Lan]) do
		if tostring(k) == "vehicleResprayOptionsClassic" or tostring(k) == "vehicleResprayOptionsMatte" or tostring(k) == "vehicleResprayOptionsMetals" or tostring(k) == "vehicleResprayOptionsChameleon" then
			for _, paint in pairs(v) do local text = ""
				if k == "vehicleResprayOptionsClassic" then text = Loc[Config.Lan]["paint"].metallic end
				if k == "vehicleResprayOptionsMatte" then text = Loc[Config.Lan]["paint"].matte end
				if vehPrimaryColour == paint.id then vehPrimaryColour = text.." "..paint.name end
				if vehSecondaryColour == paint.id then vehSecondaryColour = text.." "..paint.name	end
				if vehPearlescentColour == paint.id then vehPearlescentColour = text.." "..paint.name	end
				if vehWheelColour == paint.id then vehWheelColour = text.." "..paint.name	end
				if interiorColor == paint.id then interiorColor = text.." "..paint.name	end
				if dashboardColor == paint.id then dashboardColor = text.." "..paint.name	end
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
    PaintMenu[#PaintMenu + 1] = { arrow = true,
        header = Loc[Config.Lan]["paint"].primary, txt = Loc[Config.Lan]["common"].current..": "..vehPrimaryColour,
        onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Paints:Choose", Loc[Config.Lan]["paint"].primary) end,
    }
    PaintMenu[#PaintMenu + 1] = { arrow = true,
        header = Loc[Config.Lan]["paint"].secondary, txt = Loc[Config.Lan]["common"].current..": "..vehSecondaryColour,
        onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Paints:Choose", Loc[Config.Lan]["paint"].secondary) end,
    }
    PaintMenu[#PaintMenu + 1] = { arrow = true,
        header = Loc[Config.Lan]["paint"].pearl, txt = Loc[Config.Lan]["common"].current..": "..vehPearlescentColour,
        onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Paints:Choose", Loc[Config.Lan]["paint"].pearl) end,
    }
    PaintMenu[#PaintMenu + 1] = { arrow = true,
        header = Loc[Config.Lan]["paint"].wheel, txt = Loc[Config.Lan]["common"].current..": "..vehWheelColour,
        onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Paints:Choose", Loc[Config.Lan]["paint"].wheel) end,
    }
    openMenu(PaintMenu, {
        header = carMeta.search,
        headertxt = Loc[Config.Lan]["paint"].menuheader,
        onBack = function() TriggerEvent("jim-mechanic:client:Emergency:Check", data) end,
    })
	end
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Paints:Choose', function(data) local Ped = PlayerPedId() local vehicle = nil
	if not IsPedInAnyVehicle(Ped, false) then return else vehicle = GetVehiclePedIsIn(Ped, false) end
	if DoesEntityExist(vehicle) then
		local Menu = {}
		Menu[#Menu+1] = { arrow = true,
            header = Loc[Config.Lan]["paint"].metallic, title = Loc[Config.Lan]["paint"].metallic,
            onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Paints:Choose:Colour", { paint = data, finish = Loc[Config.Lan]["paint"].metallic }) end, }
		Menu[#Menu+1] = { arrow = true,
            header = Loc[Config.Lan]["paint"].matte, title = Loc[Config.Lan]["paint"].matte,
            onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Paints:Choose:Colour", { paint = data, finish = Loc[Config.Lan]["paint"].matte }) end, }
		Menu[#Menu+1] = { arrow = true,
            header = Loc[Config.Lan]["paint"].metals, title = Loc[Config.Lan]["paint"].metals,
			onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Paints:Choose:Colour", { paint = data, finish = Loc[Config.Lan]["paint"].metals }) end, }

        openMenu(Menu, {
            header = carMeta.search,
            headertxt = Loc[Config.Lan]["paint"].menuheader..br..(isOx() and br or "")..data,
            onBack = function() TriggerEvent("jim-mechanic:client:Emergency:Paints", data) end,
        })
	end
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Paints:Choose:Colour', function(data) local Ped = PlayerPedId() local vehicle = nil
	if not IsPedInAnyVehicle(Ped, false) then return else vehicle = GetVehiclePedIsIn(Ped, false) end
    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
	local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
	if data.paint == Loc[Config.Lan]["paint"].primary then colourCheck = vehPrimaryColour end
	if data.paint == Loc[Config.Lan]["paint"].secondary then colourCheck = vehSecondaryColour end
	if data.paint == Loc[Config.Lan]["paint"].pearl then colourCheck = vehPearlescentColour end
	local PaintMenu = {}
	local paintTable = {
		[Loc[Config.Lan]["paint"].metallic] = Loc[Config.Lan].vehicleResprayOptionsClassic,
		[Loc[Config.Lan]["paint"].matte] = Loc[Config.Lan].vehicleResprayOptionsMatte,
		[Loc[Config.Lan]["paint"].metals] = Loc[Config.Lan].vehicleResprayOptionsMetals,
	}
	for k, v in pairs(paintTable[data.finish]) do local current = (colourCheck == v.id)
		PaintMenu[#PaintMenu+1] = { icon = current and "fas fa-check", isMenuHeader = current,
			header = k.." - "..v.name, txt = current and Loc[Config.Lan]["common"].current,
            onSelect = function()
                TriggerEvent("jim-mechanic:client:Emergency:Paints:Apply", { paint = data.paint, id = v.id, name = v.name, finish = data.finish })
            end,
        }
	end
    openMenu(PaintMenu, {
        header = carMeta.search,
        headertxt = Loc[Config.Lan]["paint"].menuheader..br..(isOx() and br or "")..data.finish.." "..data.paint,
        onBack = function() TriggerEvent("jim-mechanic:client:Emergency:Paints:Choose", data.paint) end,
    })
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Paints:Apply', function(data)
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false) pushVehicle(vehicle)
	local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
	local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
	if data.paint == Loc[Config.Lan]["paint"].primary then SetVehicleColours(vehicle, data.id, vehSecondaryColour)
	elseif data.paint == Loc[Config.Lan]["paint"].secondary then SetVehicleColours(vehicle, vehPrimaryColour, data.id)
    elseif data.paint == Loc[Config.Lan]["paint"].interior then SetVehicleInteriorColor(vehicle, data.id)
    elseif data.paint == Loc[Config.Lan]["paint"].dashboard then SetVehicleDashboardColor(vehicle, data.id)
    elseif data.paint == Loc[Config.Lan]["paint"].pearl then SetVehicleExtraColours(vehicle, data.id, vehWheelColour) end
    updateCar(vehicle)
	TriggerEvent('jim-mechanic:client:Emergency:Paints:Choose:Colour', data)
end)

AddEventHandler('onResourceStop', function(r)
	if r == GetCurrentResourceName() then
		for k, v in pairs(Config.Emergency.Locations) do exports['qb-target']:RemoveZone("bench"..k) end
		for i = 1, #bench do DeleteEntity(bench[i])	end
	end
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Rims:Apply', function(data) local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	if progressBar({label = Loc[Config.Lan]["common"].installing, time = 1000, cancel = true }) then
        SetVehicleWheelType(vehicle, tonumber(data.wheeltype))
        if not data.bike then
            SetVehicleMod(vehicle, 23, tonumber(data.mod), GetVehicleModVariation(vehicle, 23)) else SetVehicleMod(vehicle, 24, tonumber(data.mod), false)
        end
    else
    end
    if data.mod == -1 then
        TriggerEvent('jim-mechanic:client:Emergency:Rims:Check', data) else TriggerEvent('jim-mechanic:client:Emergency:Rims:SubMenu', data)
    end
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Rims:ApplyCustomTires', function(data) local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	if progressBar({label = Loc[Config.Lan]["common"].installing, time = 1000, cancel = true }) then
        SetVehicleMod(vehicle, 23, GetVehicleMod(vehicle, 23), not GetVehicleModVariation(vehicle, 23))
    else
    end
    TriggerEvent('jim-mechanic:client:Emergency:Rims:Check')
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Rims:Check', function() local Menu, Ped = {}, PlayerPedId() local vehicle = nil
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
    local cycle = IsThisModelABike(GetEntityModel(vehicle))

	if not cycle then
		Menu[#Menu + 1] = {
			icon = GetVehicleMod(vehicle, 23) ~= -1 and "fa-solid fa-rotate-left" or nil,
			isMenuHeader = (GetVehicleMod(vehicle, 23) == -1),
			header = Loc[Config.Lan]["common"].stock,
			txt = (GetVehicleMod(vehicle, 23) == -1) and Loc[Config.Lan]["common"].current or "",
			onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Rims:Apply", { mod = -1 , wheeltype = 0 }) end,
		}
        if GetVehicleMod(vehicle, 23) ~= -1 then
            Menu[#Menu + 1] = {
                isMenuHeader = (GetVehicleMod(vehicle, 23) == -1 and GetVehicleMod(vehicle, 24) == -1),
                header = "Custom Tires",
                txt = GetVehicleModVariation(vehicle, 23) and Loc[Config.Lan]["common"].installed:gsub("%!", "") or Loc[Config.Lan]["common"].notinstall,
                onSelect = function()
                    TriggerEvent("jim-mechanic:client:Emergency:Rims:ApplyCustomTires")
                end,
            }
        end
		for k, v in pairs(wheelType) do
			Menu[#Menu+1] = { arrow = true, header = v,
				onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Rims:Choose", { wheeltype = k, bike = false }) end,
			}
		end
	end
	if cycle then
		Menu[#Menu+1] = { arrow = true, header = Loc[Config.Lan]["rims"].label13,
			onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Rims:Choose", { wheeltype = 6, bike = false }) end,
		}
		Menu[#Menu+1] = { arrow = true, header = Loc[Config.Lan]["rims"].label14,
			onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Rims:Choose", { wheeltype = 6, bike = true }) end,
		}
	end
	local headertxt =
		(not cycle and br..Loc[Config.Lan]["common"].current..": "..br..(isOx() and br or "")..
		(GetVehicleMod(vehicle, 23) == -1 and Loc[Config.Lan]["common"].stock or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))).." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")" or "")
	openMenu(Menu, {
		header = carMeta["search"],
		headertxt = headertxt,
		onBack = function() TriggerEvent("jim-mechanic:client:Emergency:Check") end,
	})
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Rims:Choose', function(data) local vehicle, validMods, originalWheel, Menu, Ped = {}, {}, 0, {}, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	originalWheel = tonumber(GetVehicleWheelType(vehicle))
	SetVehicleWheelType(vehicle, tonumber(data.wheeltype))
	for i = 1, (GetNumVehicleMods(vehicle, 23) +1) do
		local modName = GetLabelText(GetModTextLabel(vehicle, 23, (i-1)))
		if not validMods[modName] then
			validMods[modName] = {}
			validMods[modName][#validMods[modName]+1] = { id = (i-1), name = modName, }
		elseif validMods[modName] then
			if validMods[modName][1] then
				local name = modName
				if modName == "NULL" then name = modName.." ("..(i-1)..")" end
				validMods[modName][#validMods[modName]+1] = { id = (i-1), name = name.." - Var "..(#validMods[modName]+1), }
			else
				validMods[modName][#validMods[modName]+1] = { id = validMods[modName].id, name = validMods[modName].name.." - Var 1",  }
				validMods[modName][#validMods[modName]+1] = { id = (i-1), name = modName.." - Var "..(#validMods[modName]+1), }
			end
		end
	end

	if validMods["NULL"] then validMods[Loc[Config.Lan]["rims"].labelcustom] = validMods["NULL"] validMods["NULL"] = nil end

	if data.wheeltype == 6 then
		Menu[#Menu + 1] = {
			icon = GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) ~= -1 and "fa-solid fa-rotate-left" or "",
			isMenuHeader = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1),
			header = Loc[Config.Lan]["common"].stock,
			txt = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1) and Loc[Config.Lan]["common"].current,
			onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Rims:Apply", { mod = -1, wheeltype = 6, bike = data.bike }) end,
		}
	end

	for k, v in pairsByKeys(validMods) do
		Menu[#Menu + 1] = { arrow = true,
			header = k, txt = Loc[Config.Lan]["common"].amountoption..#validMods[k],
			onSelect = function() TriggerEvent("jim-mechanic:client:Emergency:Rims:SubMenu", { mod = v.id, wheeltype = data.wheeltype, wheeltable = validMods[k], bike = data.bike, label = wheelType[data.wheeltype] }) end,
		}
	end
	SetVehicleWheelType(vehicle, originalWheel)

	local headertxt =
	Loc[Config.Lan]["rims"].menuheader..br.."("..wheelType[data.wheeltype]..")"..br..(isOx() and br or "")..
	Loc[Config.Lan]["common"].current..": "..br..(isOx() and br or "")..
	(GetVehicleMod(vehicle, 23) == -1 and Loc[Config.Lan]["common"].stock or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))..
	" - ("..wheelType[(GetVehicleWheelType(vehicle))]..")")

	openMenu(Menu, {
		header = carMeta["search"],
		headertxt = headertxt,
		onBack = function() TriggerEvent("jim-mechanic:client:Emergency:Rims:Check") end,
	})
end)

RegisterNetEvent('jim-mechanic:client:Emergency:Rims:SubMenu', function(data)	local Menu, Ped = {}, PlayerPedId()
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end

	for i=1, #data.wheeltable do
		Menu[#Menu + 1] = {
			icon =((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype)) and "fas fa-check",
			isMenuHeader = (GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype),
			header = data.wheeltable[i].name,
			txt = ((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype)) and Loc[Config.Lan]["common"].current,
			onSelect = function()
				TriggerEvent("jim-mechanic:client:Emergency:Rims:Apply", { mod = data.wheeltable[i].id, wheeltype = data.wheeltype, wheeltable = data.wheeltable, bike = data.bike, label = data.label })
			end,
		}
	end
	local headertxt =
		Loc[Config.Lan]["rims"].menuheader..br.."("..string.upper(data.label)..")"..br..(isOx() and br or "")..
		Loc[Config.Lan]["common"].amountoption..#data.wheeltable..br..(isOx() and br or "")..
		Loc[Config.Lan]["common"].current..": "..br..(isOx() and br or "")..
		(GetVehicleMod(vehicle, 23) == -1 and Loc[Config.Lan]["common"].stock or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))..
		" - ("..wheelType[(GetVehicleWheelType(vehicle))]..")")
	openMenu(Menu, {
		header = carMeta["search"],
		headertxt = headertxt,
		onBack = function() TriggerEvent("jim-mechanic:client:Emergency:Rims:Choose", { wheeltype = data.wheeltype, bike = data.bike } ) end,
	})
end)