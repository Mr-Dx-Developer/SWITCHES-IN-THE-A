local cosmeticTable = {
    ["tint_supplies"] = { { header = Loc[Config.Lan]["windows"].menuheader, window = true } },
    ["horn"] = { { header = Loc[Config.Lan]["horns"].menuheader, horn = true } },
    ["hood"] = { { id = 7, header = Loc[Config.Lan]["hood"].menuheader }, },
    ["exhaust"] = { { id = 4, header = Loc[Config.Lan]["exhaust"].menuheader }, },
    ["rollcage"] = { { id = 5, header = Loc[Config.Lan]["rollcage"].menuheader }, },
    ["roof"] = { { id = 10, header = Loc[Config.Lan]["roof"].menuheader, }, },
    ["spoiler"] = { { id = 0, header = Loc[Config.Lan]["spoilers"].menuheader, }, },
    ["seat"] = { { id = 32, header = Loc[Config.Lan]["seat"].menuheader, }, },
    ["customplate"] = {
        { id = 25, header = Loc[Config.Lan]["plates"].label1, },
        { id = 26, header = Loc[Config.Lan]["plates"].label2, },
        { header = Loc[Config.Lan]["plates"].label3, plate = true },
    },
    ["skirts"] = {
        { id = 3, header = Loc[Config.Lan]["skirts"].menuskirt, },
        { id = 9, header = Loc[Config.Lan]["skirts"].menuRF, },
        { id = 8, header = Loc[Config.Lan]["skirts"].menuLF, },
    },
    ["livery"] = {
        { id = 48, header = Loc[Config.Lan]["livery"].menuheader, },
        { header = Loc[Config.Lan]["livery"].menuheader, oldLiv = true },
        { header = Loc[Config.Lan]["livery"].menuoldheader, roofLiv = true },
    },
    ["bumper"] = {
        { id = 6, header = Loc[Config.Lan]["bumpers"].menugrille, },
        { id = 1, header = Loc[Config.Lan]["bumpers"].menuFBumper, },
        { id = 2, header = Loc[Config.Lan]["bumpers"].menuBBumper, },
    },
    ["externals"] = {
        { id = 27, header = Loc[Config.Lan]["exterior"].label1, },
        { id = 44, header = Loc[Config.Lan]["exterior"].label2, },
        { id = 37, header = Loc[Config.Lan]["exterior"].label3, },
        { id = 39, header = Loc[Config.Lan]["exterior"].label4, },
        { id = 40, header = Loc[Config.Lan]["exterior"].label5, },
        { id = 41, header = Loc[Config.Lan]["exterior"].label6, },
        { id = 38, header = Loc[Config.Lan]["exterior"].label7, },
        { id = 42, header = Loc[Config.Lan]["exterior"].label8, },
        { id = 45, header = Loc[Config.Lan]["exterior"].label9, },
        { id = 43, header = Loc[Config.Lan]["exterior"].label10, },
        { header = Loc[Config.Lan]["police"].extras, extra = true },
    },
    ["internals"] = {
        { id = 28, header = Loc[Config.Lan]["interior"].label2, },
        { id = 29, header = Loc[Config.Lan]["interior"].label3, },
        { id = 30, header = Loc[Config.Lan]["interior"].label4, },
        { id = 31, header = Loc[Config.Lan]["interior"].label5, },
        { id = 33, header = Loc[Config.Lan]["interior"].label6, },
        { id = 34, header = Loc[Config.Lan]["interior"].label7, },
        { id = 35, header = Loc[Config.Lan]["interior"].label8, },
        { id = 36, header = Loc[Config.Lan]["interior"].label9, },
    },
}

RegisterNetEvent('jim-mechanic:client:Cosmetic:Check', function(data) local validMods, Menu, vehicle, Ped = {}, {}, nil, PlayerPedId()
    local part = data.name
    local Restrictions = checkRestriction()
	if Config.Main.CosmeticsJob then if not jobChecks() then return end end
	if not enforceRestriction("cosmetics") then return end
	if not locationChecks() then return end
	if not inCar() then return end
    if GetInPreview() then triggerNotify(nil, Loc[Config.Lan]["previews"].previewing, "error") return end
	if not nearPoint(GetEntityCoords(Ped)) then return end
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) lookEnt(vehicle) end
    if not enforceClassRestriction(searchCar(vehicle).class) then return end
	if lockedCar(vehicle) then return end
	if Config.Main.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then triggerNotify(nil, Loc[Config.Lan]["common"].owned, "error") return end
	if DoesEntityExist(vehicle) then
        for k, v in pairs(cosmeticTable[part]) do
            cosmeticTable[part][k].part = part
            if GetNumVehicleMods(vehicle, v.id) >= 1 and (not v.oldLiv and not v.roofLiv and not v.plate and not v.extra and not v.window and not v.horn) then
                local installed = GetLabelText(GetModTextLabel(vehicle, v.id, GetVehicleMod(vehicle, v.id))) if installed == "NULL" then installed = Loc[Config.Lan]["common"].stock else end
                Menu[#Menu+1] = { arrow = true,
                    header = v.header, txt = "["..(GetNumVehicleMods(vehicle, v.id)+1)..Loc[Config.Lan]["common"].menuinstalled..installed,
                    onSelect = function() TriggerEvent("jim-mechanic:client:Cosmetic:Choose", v) end,
                }
            end
            -- If specific items paramters, show extra categories
            if (v.roofLiv and GetVehicleRoofLiveryCount(vehicle) > 1) or (v.oldLiv and GetVehicleLiveryCount(vehicle) > 1) or v.plate or v.extra or v.window or v.horn then local txt, canDo, extraCount = "", true, 0
                if v.roofLiv then txt = "["..(GetVehicleRoofLiveryCount(vehicle)-1)..Loc[Config.Lan]["common"].menuinstalled..GetVehicleRoofLivery(vehicle) end
                if v.oldLiv then txt = "["..(GetVehicleLiveryCount(vehicle)-1)..Loc[Config.Lan]["common"].menuinstalled..GetVehicleLivery(vehicle) end
                if v.plate then for _, b in pairs(Loc[Config.Lan].vehiclePlateOptions) do
                    if GetVehicleNumberPlateTextIndex(vehicle) == b.id then
                        txt = "["..GetNumberOfVehicleNumberPlates(vehicle)..Loc[Config.Lan]["common"].menuinstalled..b.name break
                    else
                        txt = "["..GetNumberOfVehicleNumberPlates(vehicle)..Loc[Config.Lan]["common"].menuinstalled..Loc[Config.Lan]["common"].stock
                    end
                end
                end
                if v.horn then for _, b in pairs(Loc[Config.Lan].vehicleHorns) do
                    if GetVehicleMod(vehicle, 14) == b.id then txt = "["..(#Loc[Config.Lan].vehicleHorns)..Loc[Config.Lan]["common"].menuinstalled..b.name break
                    else txt = "["..(#Loc[Config.Lan].vehicleHorns)..Loc[Config.Lan]["common"].menuinstalled..Loc[Config.Lan]["common"].stock end end
                end
                local extraCount = 0
                if v.extra then for i = 0, 20 do if DoesExtraExist(vehicle, i) then canDo = true extraCount += 1 end end
                    txt = "[ "..extraCount.." "..Loc[Config.Lan]["check"].label12.." ]"
                end
                if canDo then
                    Menu[#Menu+1] = { arrow = true, header = v.header, txt = txt,
                    onSelect = function() TriggerEvent("jim-mechanic:client:Cosmetic:Choose", v) end,
                }
                end
            end
        end
        if countTable(Menu) ~= 0 then
            propHoldCoolDown(part)
            openMenu(Menu, { header = searchCar(vehicle).name, headertxt = Loc[Config.Lan]["check"].label10, canClose = true, onExit = function() removePropHoldCoolDown() end, })
        else
            triggerNotify(nil, Loc[Config.Lan]["common"].noOptions, "error")
        end
	end
end)

RegisterNetEvent('jim-mechanic:client:Cosmetic:Choose', function(data) local validMods, Menu, vehicle, Ped = {}, {}, nil, PlayerPedId()
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(Ped)) then return end
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end
    local stockinstall, stockDisabled, stockIcon = "", false, ""
	if DoesEntityExist(vehicle) then
        --Pick which set of mods to look through
        if data.roofLiv then
            if GetVehicleRoofLivery(vehicle) <= 0 then stockinstall = Loc[Config.Lan]["common"].current stockIcon = "fas fa-check" stockDisabled = true end
            for i = 0, GetVehicleRoofLiveryCount(vehicle)-1 do local txt, disabled, icon = "", false, ""
                if GetVehicleRoofLivery(vehicle) == (i) then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                if i ~= 0 then validMods[i] = { mod = i, name = "Livery "..i, part = data.part, roofLiv = true, install = txt, disabled = disabled, icon = icon } end
            end
        elseif data.oldLiv then
            if GetVehicleLivery(vehicle) == 0 then stockinstall = Loc[Config.Lan]["common"].current stockIcon = "fas fa-check" stockDisabled = true end
            for i = 0, GetVehicleLiveryCount(vehicle)-1 do local txt, disabled, icon = "", false, ""
                if GetVehicleLivery(vehicle) == (i) then  txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                if i ~= 0 then validMods[i] = { mod = i, name = "Livery "..i..(Config.System.Debug and " oldLiv" or ""), part = data.part, oldLiv = true, install = txt, disabled = disabled, icon = icon } end
            end
        elseif data.plate then
            if GetVehicleNumberPlateTextIndex(vehicle) <= 0 then stockinstall = Loc[Config.Lan]["common"].current stockIcon = "fas fa-check" stockDisabled = true end
            for l, b in pairs(Loc[Config.Lan].vehiclePlateOptions) do local txt, disabled, icon = "", false, ""
                if GetVehicleNumberPlateTextIndex(vehicle) == b.id then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                validMods[l] = { mod = b.id, name = b.name, part = data.part, plate = true, install = txt, disabled = disabled, icon = icon }
            end
        elseif data.window then
            if GetVehicleWindowTint(vehicle) <= 0 then stockinstall = Loc[Config.Lan]["common"].current stockIcon = "fas fa-check" stockDisabled = true end
            for l, b in pairs(Loc[Config.Lan].vehicleWindowOptions) do local txt, disabled, icon = "", false, ""
                if GetVehicleWindowTint(vehicle) == b.id then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                validMods[l] = { mod = b.id, name = b.name, part = data.part, window = true, install = txt, disabled = disabled, icon = icon }
            end
        elseif data.horn then
            if GetVehicleMod(vehicle, 14) == -1 then stockinstall = Loc[Config.Lan]["common"].current stockIcon = "fas fa-check" stockDisabled = true end
            for l, b in pairs(Loc[Config.Lan].vehicleHorns) do local txt, disabled, icon = "", false, ""
                if GetVehicleMod(vehicle, 14) == b.id then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                validMods[l] = { mod = b.id, id = 14, name = b.name, part = data.part, horn = true, install = txt, disabled = disabled, icon = icon }
            end
        elseif data.extra then
            for i = 0, 14 do
                if DoesExtraExist(vehicle, i) then hadMod = true
                if IsVehicleExtraTurnedOn(vehicle, i) then icon = "fas fa-check" else icon = "" end
                validMods[i] = { mod = i, name = "Extra "..i, extra = true, install = txt, part = data.part, disabled = disabled, icon = icon, header = data.header } end
            end
        else
            if GetVehicleMod(vehicle, data.id) == -1 then stockinstall = Loc[Config.Lan]["common"].current stockIcon = "fas fa-check" stockDisabled = true end
            for i = 1, GetNumVehicleMods(vehicle, data.id) do local txt, disabled, icon = "", false, ""
                if GetVehicleMod(vehicle, data.id) == (i-1) then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
                validMods[i] = { mod = (i - 1), id = data.id, name = GetLabelText(GetModTextLabel(vehicle, data.id, (i - 1))), part = data.part, install = txt, disabled = disabled, icon = icon }
            end
        end
        if not data.horn and not data.plate and not data.extra then
            Menu[#Menu+1] = { icon = not stockDisabled and "fa-solid fa-rotate-left" or "fas fa-check",
                isMenuHeader = stockDisabled,
                header = "0 - "..Loc[Config.Lan]["common"].stock, txt = stockinstall,
                onSelect = function()
                    TriggerEvent("jim-mechanic:client:Cosmetic:Apply", { mod = -1, id = data.id, part = data.part, plate = data.plate, window = data.window, oldLiv = data.oldLiv, roofLiv = data.roofLiv, extra = data.extra, header = data.header })
                end,
            }
        end
        if data.horn then
            data.veh = vehicle
            Menu[#Menu+1] = {
                header = "Test Horn",
                onSelect = function()
                    StartVehicleHorn(data.veh, 2000, "HELDDOWN", false)
                    Wait(1000)
                    TriggerEvent('jim-mechanic:client:Cosmetic:Choose', data)
                end,
            }
        end
		for l, b in pairs(validMods) do
			Menu[#Menu+1] = {
                icon = b.icon, isMenuHeader = b.disabled,
				header = l.." - "..b.name, txt = b.install,
                onSelect = function() b.header = data.header TriggerEvent("jim-mechanic:client:Cosmetic:Apply", b) end,
			}
		end
        openMenu(Menu, {
            header = searchCar(vehicle).name,
            headertxt = data.header..br..(isOx() and br or "")..Loc[Config.Lan]["common"].amountoption..countTable(validMods),
            onExit = function() removePropHoldCoolDown() end,
            onBack = function() TriggerEvent("jim-mechanic:client:Cosmetic:Check", { name = data.part } ) end,
        })
	end
end)

RegisterNetEvent('jim-mechanic:client:Cosmetic:Apply', function(data) local Ped = PlayerPedId()
    removePropHoldCoolDown() Wait(10)
    local emote = { dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flag = 8 }
    if not data.mod then data.mod = -1 end
    --Specific Modifiers to adjust for specifc GTA bullshit
	local vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) lookEnt(vehicle)
    local above = isVehicleLift(vehicle)
    local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
    local modName = GetLabelText(GetModTextLabel(vehicle, tonumber(data.id), tonumber(data.mod)))
	if modName == "NULL" or (data.plate or data.oldLiv or data.roof or data.window) then modName = Loc[Config.Lan]["exterior"].stockMod end
    if (data.plate or data.oldLiv or data.roof or data.window) then modName = data.name or "" end
	if data.id and GetVehicleMod(vehicle, tonumber(data.id)) == tonumber(data.mod) then
        triggerNotify(nil, modName..Loc[Config.Lan]["common"].already, "error") TriggerEvent('jim-mechanic:client:Cosmetic:Check', data.part)
	else
        -- Emote fixes
        if data.part == "livery" then if not above then ExecuteCommand("e clean") emote = {} end if not data.oldLiv and not data.roofLiv then SetVehicleLivery(vehicle, nil) end end
        if data.part == "roof" or data.part == "spoiler" then emote = { task = "WORLD_HUMAN_WELDING" } end
        if data.window and not above then ExecuteCommand("e maid") emote = {} end
        if data.horn then local horn = GetVehicleMod(vehicle, 14) SetVehicleMod(vehicle, 14, data.mod) StartVehicleHorn(vehicle, 2000, "HELDDOWN", false) SetVehicleMod(vehicle, 14, horn) end
        if above then emote = { dict = "amb@prop_human_movie_bulb@idle_a", anim = "idle_b", flag = 1 } end
		if progressBar({label = Loc[Config.Lan]["common"].installing..modName, time = math.random(3000,5000), cancel = true, dict = emote.dict, anim = emote.anim, flag = emote.flag, task = emote.task, icon = data.part, cam = cam }) then
			local success = Loc[Config.Lan]["common"].installed:gsub("!","")
            if data.roofLiv then if data.mod == -1 then data.mod = 0 end SetVehicleRoofLivery(vehicle, data.mod)
            elseif data.oldLiv then SetVehicleLivery(vehicle, data.mod) SetVehicleMod(vehicle, 48, -1, false)
            elseif data.plate then
                if data.mod == -1 then data.mod = 0 end
                SetVehicleNumberPlateTextIndex(vehicle, data.mod)
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
            qblog("`"..data.part.." - "..--[[Items[data.part].label..]]"` changed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
            updateCar(vehicle)

            if data.extra or Config.Overrides.CosmeticItemRemoval == false then
                print("item extra or not allowed to remove items")
                TriggerEvent('jim-mechanic:client:Cosmetic:Choose', data)
            else
                removeItem(data.part, 1)
            end

            triggerNotify(nil, success, "success")
        else
            triggerNotify(nil, Loc[Config.Lan]["common"].notinstall, "error")
        end
		emptyHands(Ped)
        Wait(500)
        if Config.Overrides.DoorAnimations then for i = 0, 5 do SetVehicleDoorShut(vehicle, i, false) end end
	end
end)

RegisterNetEvent('jim-mechanic:client:Horn:Test', function(data)
	StartVehicleHorn(data.veh, 2000, "HELDDOWN", false)
    Wait(1000)
	TriggerEvent('jim-mechanic:client:Cosmetic:Choose', data)
end)

RegisterNetEvent('jim-mechanic:client:Tires:Check', function() local Ped = PlayerPedId()
	if Config.Main.CosmeticsJob then if not jobChecks() then return end end
	if not locationChecks() then return end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(Ped)) then return end
	local vehicle = nil
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end
    if DoesEntityExist(vehicle) then
        if not lookAtWheel(vehicle) then return end
        if lockedCar(vehicle) then return end
        if Config.Main.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then triggerNotify(nil, Loc[Config.Lan]["common"].owned, "error") return end
        local r, g, b = GetVehicleTyreSmokeColor(vehicle)
        local smokeTable = {
            { header = Loc[Config.Lan]["smoke"].black, r = 1, g = 1, b = 1 },
            { header = Loc[Config.Lan]["smoke"].white, r = 255, g = 255, b = 255 },
            { header = Loc[Config.Lan]["smoke"].blue, r = 2, g = 21, b = 255 },
            { header = Loc[Config.Lan]["smoke"].eblue, r = 3, g = 83, b = 255 },
            { header = Loc[Config.Lan]["smoke"].mgreen, r = 0, g = 255, b = 140 },
            { header = Loc[Config.Lan]["smoke"].lgreen, r = 94, g = 255, b = 1 },
            { header = Loc[Config.Lan]["smoke"].yellow, r = 255, g = 255, b = 0 },
            { header = Loc[Config.Lan]["smoke"].gshower, r = 255, g = 150, b = 0 },
            { header = Loc[Config.Lan]["smoke"].orange, r = 255, g = 62, b = 1 },
            { header = Loc[Config.Lan]["smoke"].red, r = 255, g = 1, b = 1 },
            { header = Loc[Config.Lan]["smoke"].ppink, r = 255, g = 50, b = 100 },
            { header = Loc[Config.Lan]["smoke"].hpink, r = 255, g = 5, b = 190 },
            { header = Loc[Config.Lan]["smoke"].purple, r = 35, g = 1, b = 255 },
            { header = Loc[Config.Lan]["smoke"].blacklight, r = 15, g = 3, b = 255 },
        }
        propHoldCoolDown("tyre")
        local Menu = {}
		Menu[#Menu+1] = { icon = "fas fa-palette",
            header = Loc[Config.Lan]["smoke"].custom,
            onSelect = function() TriggerEvent("jim-mechanic:client:smokeCustomMenu") end,
        }
		Menu[#Menu+1] = { icon = "fas fa-eraser",
            header = Loc[Config.Lan]["smoke"].remove, txt = ((r == 0) and (g == 0) and (b == 0)) and Loc[Config.Lan]["common"].current,
            onSelect = function() TriggerEvent("jim-mechanic:client:Tires:Apply", { R = 0, G = 0, B = 0 }) end,
        }
        for _, v in pairs(smokeTable) do
            Menu[#Menu+1] = {
                isMenuHeader = ((r == v.r) and (g == v.g) and (b == v.b)),
                header = v.header,
                txt = ((r == v.r) and (g == v.g) and (b == v.b)) and Loc[Config.Lan]["common"].current,
                onSelect = not ((r == v.r) and (g == v.g) and (b == v.b)) and (function() TriggerEvent("jim-mechanic:client:Tires:Apply", { R = v.r, G = v.g, B = v.b }) end),
            }
        end
        openMenu(Menu, {
            header = searchCar(vehicle).name,
            headertxt = Loc[Config.Lan]["smoke"].menuheader,
            canClose = true,
            onExit = function() end,
        })
    end
end)

RegisterNetEvent('jim-mechanic:client:Tires:Apply', function(data) local item = Items["tires"] local Ped = PlayerPedId()
    removePropHoldCoolDown() Wait(10)
	local vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle)
    local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
	spraying = true
	local r, g, b = GetVehicleTyreSmokeColor(vehicle)
	if r == data.R and g == data.G and b == data.B then
		triggerNotify(nil, Loc[Config.Lan]["smoke"].already, "error")
		TriggerEvent('jim-mechanic:client:Tires:Check')
	else
		time = math.random(3000,5000)
		local fwd = GetEntityForwardVector(Ped)
		local coords = GetEntityCoords(Ped) + fwd * 0.5 + vec3(0.0, 0.0, -0.5)
		CreateThread(function()
			while spraying do
				RequestNamedPtfxAsset("scr_recartheft")
				while not HasNamedPtfxAssetLoaded("scr_recartheft") do Wait(0) end
				local heading = GetEntityHeading(vehicle)
				UseParticleFxAssetNextCall("scr_recartheft")
				SetParticleFxNonLoopedColour(data.R / 255, data.G / 255, data.B / 255)
				SetParticleFxNonLoopedAlpha(1.0)
				local spray = StartNetworkedParticleFxNonLoopedAtCoord("scr_wheel_burnout", GetEntityCoords(Ped), 0.0, 0.0, heading+180.0, 0.6, 0.0, 0.0, 0.0)
				Wait(500)
			end
		end)
        if progressBar({label = Loc[Config.Lan]["common"].installing..item.label, time = math.random(3000,5000), cancel = true, dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flag = 8, cam = cam }) then SetVehicleModKit(vehicle, 0)
			if checkToggleVehicleMod(vehicle, 20, true) then
				qblog("`tires - "..Items["tires"].label.." - {"..data.R ..", "..data.G..", "..data.B.."}` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
				SetVehicleTyreSmokeColor(vehicle, data.R, data.G, data.B)
				updateCar(vehicle)
				if Config.Overrides.CosmeticItemRemoval == true then removeItem("tires", 1)
				else TriggerEvent('jim-mechanic:client:Tires:Check') end
				triggerNotify(nil,item.label.." "..Loc[Config.Lan]["common"].installed, "success")
			else
				triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
			end
		else
			triggerNotify(nil, item.label..Loc[Config.Lan]["common"].instfail, "error")
        end
        emptyHands(Ped)
        spraying = false
	end
end)

RegisterNetEvent('jim-mechanic:client:smokeCustomMenu', function()
    local dialog = nil
    local inputs = {
        { type = 'number', isRequired = true, name = 'R', text = 'R', description = "R", min = 0, max = 255, },
        { type = 'number', isRequired = true, name = 'G', text = 'G', description = "G", min = 0, max = 255, },
        { type = 'number', isRequired = true, name = 'B', text = 'B', description = "B", min = 0, max = 255, } }
	if Config.System.Menu == "ox" then dialog = exports.ox_lib:inputDialog( Loc[Config.Lan]["smoke"].custom, inputs)
    else dialog = exports['qb-input']:ShowInput({ header = Loc[Config.Lan]["smoke"].custom, submitText = "Submit", inputs = inputs, }) end
    if dialog or dialog[1] then
        if not (dialog.R or dialog[1]) or not (dialog.G or dialog[2]) or not (dialog.B or dialog[3]) then return end
        local data = { R = tonumber(dialog.R or dialog[1]), G = tonumber(dialog.G or dialog[2]), B = tonumber(dialog.B or dialog[3]) }
		TriggerEvent('jim-mechanic:client:Tires:Apply', data)
    end
end)