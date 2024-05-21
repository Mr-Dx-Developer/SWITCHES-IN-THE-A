vehDatabase = "player_vehicles"
if ESX ~= nil then vehDatabase = "owned_vehicles"
elseif Ox ~= nil then vehDatabase = "vehicles" end

function searchDist(vehicle)
	local dist = triggerCallback('jim-mechanic:distGrab', trim(GetVehicleNumberPlateText(vehicle)))
	if dist ~= "" then
		dist = Loc[Config.Lan]["functions"].distance.." "..string.format("%05d", math.floor(dist)).." "..(Config.System.distkph and "Km" or "Mi")
	end
    return dist
end

function getClosest(coords)
	local vehs = { 71, 0, 2, 4, 6, 7, 23, 127, 260, 2146, 2175, 12294, 16834, 16386, 20503, 32768, 67590, 67711, 98309, 100359 }
	for _, v in pairs(vehs) do if GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, v) ~= 0 then vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, v) break end end
	return vehicle
end

local updateDelay = {}
function updateCar(vehicle)
    if DoesEntityExist(vehicle) and vehicle ~= 0 and vehicle ~= nil then
		local newProps = getVehicleProperties(vehicle)
		setVehicleProperties(vehicle, newProps)
        updateDelay[vehicle] = { delay = (Config.Overrides.updateServerDelay / 10) or 2, mods = newProps }
        if Config.System.Debug then
            print("^5Debug^7: ^2Updating database timer started/reset^7: '^6" ..updateDelay[vehicle].mods.plate.."^7' - ^4"..(updateDelay[vehicle].delay * 10).." ^2Seconds^7.")
        end
    else
        if Config.System.Debug then
            print("^5Debug^7: ^1ERROR^7 - ^2Attempted to add vehicle to update timer but vehicle entity recieved was ^7'^1nil^7'")
        end
    end
end

function forceUpdateCar(vehicle, mods)
    if IsVehicleOwned(mods.plate) then
        TriggerServerEvent('jim-mechanic:updateVehicle', mods, trim(mods.plate)) -- Attempt to update database mods
        if Config.System.Debug then print("^5Debug^7: ^2Updating database mods of vehicle^7: '^6" ..mods.plate.."^7'") end
        saveStatus(vehicle) -- Attempt to update status damages
    end
    TriggerServerEvent("jim-mechanic:server:updateCar", VehToNet(vehicle), mods) --Update everyone with the new changes (helps syncing)
end

CreateThread(function()
    while true do
        for veh in pairs(updateDelay) do
            if updateDelay[veh].delay then updateDelay[veh].delay -= 1
                if updateDelay[veh].delay <= 0 then
                    if DoesEntityExist(veh) and veh ~= 0 and veh ~= nil then
                        forceUpdateCar(veh, updateDelay[veh].mods)
                    end
                    updateDelay[veh] = nil
                end
            end
        end
        Wait(10000)
    end
end)

RegisterNetEvent("jim-mechanic:forceProperties", function(vehicle, props, src) -- This forces updates of the vehicle from the person who updated it
    if src ~= GetPlayerServerId(PlayerId()) then
        local netID = ensureNetToVeh(vehicle)
        if netID ~= 0 and DoesEntityExist(netID) then
            setVehicleProperties(netID, props)
        end
    end
end)

function inCar()
	local inCar = false
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		triggerNotify(nil, Loc[Config.Lan]["functions"].inCar, "error")
		inCar = false
	else inCar = true end
	return inCar
end

function outCar()
	local outCar = false
	if not IsPedSittingInAnyVehicle(PlayerPedId()) then
		triggerNotify(nil, Loc[Config.Lan]["functions"].outCar, "error")
		outCar = false
	else outCar = true end
	return outCar
end

function lockedCar(vehicle)
	local locked = false
	if GetVehicleDoorLockStatus(vehicle) >= 2 then
		triggerNotify(nil, Loc[Config.Lan]["functions"].locked, "error")
		locked = true
	else locked = false end
	return locked
end

function nearPoint(coords)
	if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then triggerNotify(nil, Loc[Config.Lan]["functions"].nearby, "error") near = false
	else near = true end
	return near
end

function locationChecks()
	local check = true
	if Config.Main.JobLocationRequired then
		if inLocation == "" then check = false
			triggerNotify(nil, Loc[Config.Lan]["functions"].shop, "error")
		end
	end
	return check
end

function previewLocationChecks()
	if not inpreview then triggerNotify(nil, "Can't Check Mods Here", "error") end
	return inpreview
end

function jobChecks()
	local check = true
	if Config.Main.ItemRequiresJob == true then check = false
		for _, v in pairs(Config.Main.JobRoles) do
			if hasJob(v) then check = true break end
		end
		if check == false then triggerNotify(nil, Loc[Config.Lan]["functions"].mechanic, "error") end
	end
	return check
end

function previewJobChecks()
	local check = false
	for _, v in pairs(Config.Main.JobRoles) do
		if hasJob(v) then check = true break end
	end
	if check == false then
		triggerNotify(nil, Loc[Config.Lan]["functions"].mechanic, "error")
	end
	return check
end

function qblog(text)
	--[[local Player = Core.Functions.GetPlayerData()
	TriggerServerEvent('qb-log:server:CreateLog', 'vehicleupgrades', GetCurrentResourceName() .. " - "..Player.charinfo.firstname.." "..Player.charinfo.lastname.."("..Player.source..") ["..Player.citizenid.."]", 'blue',	text)
	if Config.System.Debug then print("^5QBLog Message^7: ^3"..GetCurrentResourceName() .. " - "..Player.charinfo.firstname.." "..Player.charinfo.lastname.."("..Player.source..") ["..Player.citizenid.."]^7", text) end
]]
end

function Checks()
	if not jobChecks() then return false end
	if not locationChecks() then return false end
	if not inCar() then return false end
	if not nearPoint(GetEntityCoords(PlayerPedId())) then return false end
	return true
end

function vehChecks()
	local vehicle = nil
	local Ped = PlayerPedId()
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end
	if lockedCar(vehicle) then return end
	if Config.Main.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then triggerNotify(nil, Loc[Config.Lan]["common"].owned, "error") return end
	return vehicle
end

function lookAtWheel(vehicle)
	local found = false local Pos = nil
	for _, v in pairs({"wheel_lf","wheel_rf","wheel_lm1","wheel_rm1","wheel_lm2","wheel_rm2","wheel_lm3","wheel_rm3","wheel_lr", "wheel_rr"}) do
		Pos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))
		if #(GetEntityCoords(PlayerPedId()) - Pos) <= 1.5 then	found = true break end
	end
	lookEnt(Pos)
	if not found then triggerNotify(nil, Loc[Config.Lan]["common"].nearwheel, "error") else return found end
end

function lookAtEngine(vehicle)
	local found = false local Pos = nil
	for _, v in pairs({"engine"}) do
		if (#(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))) <= 2.0) and (GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v)) ~= vec3(0,0,0)) then
			Pos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v)) found = true break
		else found = true Pos = vehicle end
	end
	lookEnt(Pos)
	if not found then triggerNotify(nil, Loc[Config.Lan]["common"].nearengine, "error") else return found end
end

function trim(value) if not value then return nil end return (string.gsub(value, '^%s*(.-)%s*$', '%1')) end

function emptyHands(playerPed, dpemote)
	if dpemote ~= nil then ExecuteCommand("c") ClearPedTasks(playerPed)
	else ClearPedTasks(playerPed) end
	for k, v in pairs(GetGamePool('CObject')) do
		for _, model in pairs({`prop_sponge_01`, `prop_weld_torch`, `prop_rag_01`, `prop_fib_clipboard`, `v_ind_cs_toolbox4`, `p_amb_clipboard_01`, `ng_proc_spraycan01b`, `idrp_racing_harness`}) do
			if GetEntityModel(v) == model then
				if IsEntityAttachedToEntity(playerPed, v) then
					unloadModel(model)
					DeleteObject(v)
					DetachEntity(v, 0, 0)
					SetEntityAsMissionEntity(v, true, true)
					Wait(100)
					DeleteEntity(v)
				end
			end
		end
	end
end

function getDamages(vehicle) local veh = { engine = 0, body = 0, windows = {}, doors = {}, wheels = {} }
	veh.engine = GetVehicleEngineHealth(vehicle)
	veh.body = GetVehicleBodyHealth(vehicle)
	for i = 0, 6 do
		veh.windows[i] = IsVehicleWindowIntact(vehicle, i)
	end
	for i = 0, 6 do
		veh.doors[i] = IsVehicleDoorDamaged(vehicle, i)
	end
	for i = 0, 15 do
		if IsVehicleTyreBurst(vehicle, i, false) then
			if IsVehicleTyreBurst(vehicle, i, true) then
				veh.wheels[i] = true
			else
				veh.wheels[i] = false
			end
		end
	end
	return veh
end

function doCarDamage(currentVehicle, veh)
	veh.engine += 0.0 veh.body += 0.0
	if veh.engine < 200.0 then veh.engine = 200.0 end if veh.engine > 1000.0 then veh.engine = 1000.0 end
	if veh.body < 150.0 then veh.body = 150.0 end if veh.body > 1000.0 then veh.body = 1000.0 end
    SetVehicleEngineHealth(currentVehicle, veh.engine)
    for k, v in pairs(veh.windows) do
        if v then return end
        RemoveVehicleWindow(currentVehicle, k)
    end
    for k, v in pairs(veh.doors) do
        if not v then return end
        SetVehicleDoorBroken(currentVehicle, k, true)
    end
	for k in pairs(veh.wheels) do
		SetVehicleTyreBurst(currentVehicle, 0, veh.wheels[k], 990.0)
	end
end

function nosBar(level, colour)
    local colour = colour
	local colours = {
		["dark.0"] = "#C1C2C5", ["dark.1"] = "#A6A7AB", ["dark.2"] = "#909296", ["dark.3"] = "#5C5F66", ["dark.4"] = "#373A40", ["dark.5"] = "#2C2E33", ["dark.6"] = "#25262B", ["dark.7"] = "#1A1B1E", ["dark.8"] = "#141517", ["dark.9"] = "#101113",
		["gray.0"] = "#F8F9FA", ["gray.1"] = "#F1F3F5", ["gray.2"] = "#E9ECEF", ["gray.3"] = "#DEE2E6", ["gray.4"] = "#CED4DA", ["gray.5"] = "#ADB5BD", ["gray.6"] = "#868E96", ["gray.7"] = "#495057", ["gray.8"] = "#343A40", ["gray.9"] = "#212529",
		["red.0"] = "#FFF5F5", ["red.1"] = "#FFE3E3", ["red.2"] = "#FFC9C9", ["red.3"] = "#FFA8A8", ["red.4"] = "#FF8787", ["red.5"] = "#FF6B6B", ["red.6"] = "#FA5252", ["red.7"] = "#F03E3E", ["red.8"] = "#E03131", ["red.9"] = "#C92A2A",
		["pink.0"] = "#FFF0F6", ["pink.1"] = "#FFDEEB", ["pink.2"] = "#FCC2D7", ["pink.3"] = "#FAA2C1", ["pink.4"] = "#F783AC", ["pink.5"] = "#F06595", ["pink.6"] = "#E64980", ["pink.7"] = "#D6336C", ["pink.8"] = "#C2255C", ["pink.9"] = "#A61E4D",
		["grape.0"] = "#F8F0FC", ["grape.1"] = "#F3D9FA", ["grape.2"] = "#EEBEFA", ["grape.3"] = "#E599F7", ["grape.4"] = "#DA77F2", ["grape.5"] = "#CC5DE8", ["grape.6"] = "#BE4BDB", ["grape.7"] = "#AE3EC9", ["grape.8"] = "#9C36B5", ["grape.9"] = "#862E9C",
		["violet.0"] = "#F3F0FF", ["violet.1"] = "#E5DBFF", ["violet.2"] = "#D0BFFF", ["violet.3"] = "#B197FC", ["violet.4"] = "#9775FA", ["violet.5"] = "#845EF7", ["violet.6"] = "#7950F2", ["violet.7"] = "#7048E8", ["violet.8"] = "#6741D9", ["violet.9"] = "#5F3DC4",
		["indigo.0"] = "#EDF2FF", ["indigo.1"] = "#DBE4FF", ["indigo.2"] = "#BAC8FF", ["indigo.3"] = "#91A7FF", ["indigo.4"] = "#748FFC", ["indigo.5"] = "#5C7CFA", ["indigo.6"] = "#4C6EF5", ["indigo.7"] = "#4263EB", ["indigo.8"] = "#3B5BDB", ["indigo.9"] = "#364FC7",
		["blue.0"] = "#E7F5FF", ["blue.1"] = "#D0EBFF", ["blue.2"] = "#A5D8FF", ["blue.3"] = "#74C0FC", ["blue.4"] = "#4DABF7", ["blue.5"] = "#339AF0", ["blue.6"] = "#228BE6", ["blue.7"] = "#1C7ED6", ["blue.8"] = "#1971C2", ["blue.9"] = "#1864AB",
		["cyan.0"] = "#E3FAFC", ["cyan.1"] = "#C5F6FA", ["cyan.2"] = "#99E9F2", ["cyan.3"] = "#66D9E8", ["cyan.4"] = "#3BC9DB", ["cyan.5"] = "#22B8CF", ["cyan.6"] = "#15AABF", ["cyan.7"] = "#1098AD", ["cyan.8"] = "#0C8599", ["cyan.9"] = "#0B7285",
		["teal.0"] = "#E6FCF5", ["teal.1"] = "#C3FAE8", ["teal.2"] = "#96F2D7", ["teal.3"] = "#63E6BE", ["teal.4"] = "#38D9A9", ["teal.5"] = "#20C997", ["teal.6"] = "#12B886", ["teal.7"] = "#0CA678", ["teal.8"] = "#099268", ["teal.9"] = "#087F5B",
		["green.0"] = "#EBFBEE", ["green.1"] = "#D3F9D8", ["green.2"] = "#B2F2BB", ["green.3"] = "#8CE99A", ["green.4"] = "#69DB7C", ["green.5"] = "#51CF66", ["green.6"] = "#40C057", ["green.7"] = "#37B24D", ["green.8"] = "#2F9E44", ["green.9"] = "#2B8A3E",
		["lime.0"] = "#F4FCE3", ["lime.1"] = "#E9FAC8", ["lime.2"] = "#D8F5A2", ["lime.3"] = "#C0EB75", ["lime.4"] = "#A9E34B", ["lime.5"] = "#94D82D", ["lime.6"] = "#82C91E", ["lime.7"] = "#74B816", ["lime.8"] = "#66A80F", ["lime.9"] = "#5C940D",
		["yellow.0"] = "#FFF9DB", ["yellow.1"] = "#FFF3BF", ["yellow.2"] = "#FFEC99", ["yellow.3"] = "#FFE066", ["yellow.4"] = "#FFD43B", ["yellow.5"] = "#FCC419", ["yellow.6"] = "#FAB005", ["yellow.7"] = "#F59F00", ["yellow.8"] = "#F08C00", ["yellow.9"] = "#E67700",
		["orange.0"] = "#FFF4E6", ["orange.1"] = "#FFE8CC", ["orange.2"] = "#FFD8A8", ["orange.3"] = "#FFC078", ["orange.4"] = "#FFA94D", ["orange.5"] = "#FF922B", ["orange.6"] = "#FD7E14", ["orange.7"] = "#F76707",["orange.8"] = "#E8590C",["orange.9"] = "#D9480F"
	}

    if not colour then colour = "green.5" end
	if level > 100 then level = 100 end
	if level < 0 then level = 0 end
	if level <= 71 and level > 31 then colour = "yellow.7"
	elseif level <= 31 then colour = "red.8" end
    if not string.find(colour, "%.") then colour = colour..".5" end
    local uniquename = keyGen()
    local barstring =
    '<style>.container { width: 6vw ; background-color: '..colours["dark.0"]..'; border-radius: 5px; }'..
    '.'..uniquename..' { text-align: right; padding-top: 0.3vh; padding-bottom: 0.3vh; color:white; width:'..tostring(math.ceil(level))..'%; background-color: '..colours[colour]..'; border-radius: 5px; }'..
    '</style>'..
    '<div class="container">'..
    '<div class="'..uniquename..' html"></div>'..
    '</div>'
    return barstring
end

function checkRestriction() local Ped = PlayerPedId()
	local restrictions = nil, nil, nil
	for _, v in pairs(Config.Locations) do
		if inLocation == v.designatedName then
			if v.Restrictions and v.Restrictions then restrictions = v.Restrictions	end
			break
		end
	end
	if restrictions ~= nil then return restrictions
	else return false end
end

function enforceRestriction(type)
    local Restrictions = checkRestriction()
	local restrictionTable = {}
	if Config.Main.JobLocationRequired and Restrictions then
        for k, v in pairs (Restrictions.Allow) do restrictionTable[v] = true end
        if not restrictionTable[type] then
			local typeTable = {
				["perform"] = "You can't change performance in this location",
				["cosmetics"] = "You can't change cosmetics in this location" ,
				["nos"] = "You can't change NOS in this location",
				["repairs"] = "You can't repair in this location",
			}
			triggerNotify(nil, typeTable[type], "error") return false end
	end
	return true
end

function enforceClassRestriction(class)
    local Restrictions = checkRestriction()
	local restrictionTable = {}
	if Config.Main.JobLocationRequired and Restrictions then
        for k, v in pairs(Restrictions.Vehicle) do restrictionTable[v] = true end
        if not restrictionTable[class] then
			triggerNotify(nil, "You can't modify "..class.." at this location", "error") return false end
	end
	return true
end

function convertOxRGB(string)
	string = string:gsub("rgb", "["):gsub("%(", '"'):gsub(",", '","'):gsub("%)", '"]'):gsub("%s", "")
	string = json.decode(string)
	return string
end

function checkHSWMods(vehicle)
	SetVehicleModKit(vehicle, 0)
	local possMods = {
		[12] = GetNumVehicleMods(vehicle, 12),
		[15] = GetNumVehicleMods(vehicle, 15),
		[13] = GetNumVehicleMods(vehicle, 13),
		[11] = GetNumVehicleMods(vehicle, 11)
	}
	local currentMods = {
		[12] = GetVehicleMod(vehicle, 12),
		[15] = GetVehicleMod(vehicle, 15),
		[13] = GetVehicleMod(vehicle, 13),
		[11] = GetVehicleMod(vehicle, 11)
	}
	for k, v in pairs(possMods) do
		for i = 1, v do
			SetVehicleMod(vehicle, k, i-1)
			if GetVehicleMod(vehicle, k) == i-1 then
				possMods[k] = i
				SetVehicleMod(vehicle, k, currentMods[k], nil)
			else
				break
			end
		end
	end
	return possMods
end

RegisterNetEvent('vehiclemod:client:fixEverything', function()
    if (IsPedInAnyVehicle(PlayerPedId(), false)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            local plate = trim(GetVehicleNumberPlateText(veh))
            TriggerServerEvent("vehiclemod:server:fixEverything", plate)
        end
    end
end)

if Config.vehFailure.repairKits then
	RegisterNetEvent('jim-mechanic:vehFailure:RepairVehicle', function(data)
		local item, full = data.client.item, data.client.full
		local vehicle = nil
		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end
		if lockedCar(vehicle) then return end
		if #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine"))) >= 2.0 then return end
		SetVehicleDoorOpen(vehicle, 4, false, false)
		local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
		if progressBar({ label = Loc[Config.Lan]["repair"].repairing, time = 10000, cancel = true, dict = 'mini@repair', anim = 'fixing_a_player', flag = 1, icon = item, cam = cam }) then
			if full then
				SetVehicleEngineHealth(vehicle, 1000.0)
				SetVehicleBodyHealth(vehicle, 1000.0)
				SetVehiclePetrolTankHealth(vehicle, 1000.0)
				SetVehicleDeformationFixed(vehicle)
				SetVehicleFixed(vehicle)
				if GetResourceState("qs-advancedgarages"):find("start") then exports["qs-advancedgarages"]:RepairNearestVehicle() end
			else
				SetVehicleEngineHealth(vehicle, GetVehicleEngineHealth(vehicle) + 100)
				SetVehicleBodyHealth(vehicle, GetVehicleBodyHealth(vehicle) + 100)
			end
			removeItem(item, 1)
			ClearPedTasks(PlayerPedId())
		else
			ClearPedTasks(PlayerPedId())
		end
		SetVehicleDoorShut(vehicle, 4, false)
	end)
end

if Config.vehFailure.fixCommand then
	RegisterNetEvent('jim-mechanic:client:fixEverything', function() local vehicle = nil local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped, false) then
			vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) lookEnt(vehicle)
		else
			vehicle = GetVehiclePedIsIn(Ped, false) pushVehicle(vehicle)
		end
		SetVehicleUndriveable(vehicle, false)
		WashDecalsFromVehicle(vehicle, 1.0)
		SetVehicleEngineHealth(vehicle, 1000.0)
		SetVehicleBodyHealth(vehicle, 1000.0)
		SetVehiclePetrolTankHealth(vehicle, 1000.0)
		SetVehicleDirtLevel(vehicle, 0.0)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleFixed(vehicle)
		if GetResourceState("qs-advancedgarages"):find("start") then exports["qs-advancedgarages"]:RepairNearestVehicle() end
		for i = 0, 5 do SetVehicleTyreFixed(vehicle, i) end
		for i = 0, 7 do FixVehicleWindow(vehicle, i) end
		SetVehicleFuelLevel(vehicle, 100.0)
		TriggerServerEvent("jim-mechanic:server:fixEverything", trim(GetVehicleNumberPlateText(vehicle)), ensureNetToVeh(vehicle))
		saveStatus(vehicle)
		pushVehicle(vehicle)
	end)
end

function addMaterials(item)
	for recItem, recAmount in pairs(MaterialRecieve[item]) do
		local math = math.random(math.floor((recAmount/2)+0.5), recAmount)
		if math ~= 0 then
			addItem(recItem, math)
		end
	end
end