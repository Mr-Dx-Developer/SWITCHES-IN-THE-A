local cleaning = false
local effectTimer = 0
local antiLagCooldown = 0
local DistAdd, maxSpeed, ShowingOdo, ShowOdo, owned, veh, databasecalc, nosUpdate = 0, 0, false, Config.Odometer.ShowOdo, false, 0, false, false

--Vehicle Ejection Variables
local harnessBreakSpeed, newVehBody, curVehBody, frameBodyChange, lastSpeed, lastSpeed2, thisFrameSpeed, tick, damagedone, lastVehicle, modifierDensity = 200, 0, 0, 0, 0, 0, 0, 0, false, nil, true
local seatbeltOn, harnessOn, harnessProp = false, false, nil
local seat = nil
local plate, model = nil, nil

RegisterNetEvent("jim-mechanic:client:CarWax", function(data) local Ped = PlayerPedId()
	if not cleaning then cleaning = true else return end
	triggerNotify(nil, Loc[Config.Lan]["police"].cleaning)
	local vehicle
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) end
	local plate = trim(GetVehicleNumberPlateText(vehicle))
    local cam = createTempCam(Ped, GetEntityCoords(vehicle))
	startTempCam(cam)
	propHoldCoolDown("sponge")
	while cleaning do
		local dirtLevel = GetVehicleDirtLevel(vehicle)
		if dirtLevel >= 1.0 then
			SetVehicleDirtLevel(vehicle, (dirtLevel) - 0.3)
		elseif dirtLevel <= 1.0 then
			SetVehicleDirtLevel(vehicle, 0.0)
			WashDecalsFromVehicle(vehicle, 1.0)
			cleaning = false
			triggerNotify(nil, Loc[Config.Lan]["extras"].clean, "success")
		end
		Wait(300)
	end
	Wait(1000)
	stopTempCam()
	emptyHands(Ped)
	if not cleaning and data.time ~= 0 then
		SetVehicleStatus(plate, "carwax", data.time, true)
	end
	if Config.Overrides.CosmeticItemRemoval and not data.skip then removeItem("cleaningkit", 1) end
end)

--== Car Cleaning ==--
RegisterNetEvent('jim-mechanic:client:cleanVehicle', function(skip) local Ped = PlayerPedId()
	local coords = GetEntityCoords(Ped)
	if not inCar() then return end
	if not nearPoint(coords) then return end
	local vehicle = getClosest(coords) pushVehicle(vehicle) lookEnt(vehicle)
	local plate = trim(GetVehicleNumberPlateText(vehicle))

	if DoesEntityExist(vehicle) then
		local Menu = {}
		Menu[#Menu+1] = { arrow = true, header = Loc[Config.Lan]["carwax"].head1, onSelect = function() TriggerEvent("jim-mechanic:client:CarWax", { time = 0, skip = skip }) end, }
		if Config.Overrides.WaxFeatures then
			GetVehicleStatus(VehToNet(vehicle))
			Menu[#Menu+1] = { arrow = true,
				header = Loc[Config.Lan]["carwax"].head2,
				onSelect = function() TriggerEvent("jim-mechanic:client:CarWax", { time = 86400, skip = skip }) end,
			}
			Menu[#Menu+1] = { arrow = true,
				header = Loc[Config.Lan]["carwax"].head3,
				onSelect = function() TriggerEvent("jim-mechanic:client:CarWax", { time = 172800, skip = skip }) end,
			}
			Menu[#Menu+1] = { arrow = true,
				header = Loc[Config.Lan]["carwax"].head4,
				onSelect = function() TriggerEvent("jim-mechanic:client:CarWax", { time = 273600, skip = skip }) end,
			}
		end
		openMenu(Menu, {
			header = searchCar(vehicle).name,
			headertxt =
			"Class: "..searchCar(vehicle).class or "N/A"..br..(isOx() and br or "")..
			Loc[Config.Lan]["check"].plate..trim(GetVehicleNumberPlateText(vehicle))..
			Loc[Config.Lan]["check"].value..searchCar(vehicle).price..br..(isOx() and br or "")..
			searchDist(vehicle),
			canClose = true,
			onExit = function() end,
		})
	end
end)

--Duct Tape Repair
local repairing = false
RegisterNetEvent('jim-mechanic:quickrepair', function() local Ped = PlayerPedId() local vehicle = nil
	local coords = GetEntityCoords(Ped)
	local repaireng = true
	local repairbody = true
	if repairing then return end
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(coords) pushVehicle(vehicle) end
	if DoesEntityExist(vehicle) then
		local damageTable = {
			engine = GetVehicleEngineHealth(vehicle),
			body = GetVehicleBodyHealth(vehicle),
		}
		if damageTable["engine"] >= Config.DuctTape.MaxDuctEngine then repaireng = false else repaireng = true end
		if Config.DuctTape.DuctTapeBody and damageTable["body"] >= Config.DuctTape.MaxDuctBody then repairbody = false else repairbody = true end
		if repaireng or repairbody then
			lookEnt(vehicle)
			SetVehicleDoorOpen(vehicle, 4, false, false)
			repairing = true
			if progressBar({label = Loc[Config.Lan]["repair"].applyduct, time = 10000, cancel = true, anim = "fixing_a_ped", dict = "mini@repair", flag = 16, icon = "ducttape",}) then
				Wait(1000)
				emptyHands(Ped)
				if Config.DuctTape.DuctSimpleMode then
					SetVehicleEngineHealth(vehicle, Config.DuctTape.MaxDuctEngine)
					SetVehicleBodyHealth(vehicle, Config.DuctTape.MaxDuctBody)
				elseif not Config.DuctTape.DuctSimpleMode then
					if damageTable["engine"] <= 50.0 and damageTable["engine"] <= 200 then SetVehicleEngineHealth(vehicle, 300.0)
					else
						SetVehicleEngineHealth(vehicle, damageTable["engine"] + Config.DuctTape.DuctAmountEngine)
						if GetVehicleEngineHealth(vehicle) > Config.DuctTape.MaxDuctEngine then SetVehicleEngineHealth(vehicle, Config.DuctTape.MaxDuctEngine) end
					end
					if Config.DuctTape.DuctTapeBody then
						if damageTable["body"] <= 50.0 and damageTable["body"] <= 200 then SetVehicleBodyHealth(vehicle, 300.0)
						else SetVehicleBodyHealth(vehicle, damageTable["body"] + Config.DuctTape.DuctAmountBody)
							if GetVehicleBodyHealth(vehicle) > Config.DuctTape.MaxDuctBody then SetVehicleBodyHealth(vehicle, Config.DuctTape.MaxDuctBody) end
						end
					end
				end
				if Config.DuctTape.RemoveDuctTape then removeItem("ducttape", 1) end
			end
			repairing = false
			SetVehicleDoorShut(vehicle, 4, false, false)
			emptyHands(Ped)
		else triggerNotify(nil, Loc[Config.Lan]["repair"].ductfull, "error") end
	else triggerNotify(nil, Loc[Config.Lan]["repair"].nocar, "error") end
end)

--Multipurpose Door command
RegisterNetEvent('jim-mechanic:client:openDoor', function(door) local Ped = PlayerPedId()
	local doornum = tonumber(door)
	if doornum < 0 or doornum > 5 then
		triggerNotify(nil, Loc[Config.Lan]["extras"].doorerr, "error")
		return
	end
	local coords = GetEntityCoords(Ped)
	if not nearPoint(coords) then return end
	local vehicle = nil
	if IsPedSittingInAnyVehicle(Ped) then	vehicle = GetVehiclePedIsIn(Ped, false)
	else vehicle = getClosest(coords) pushVehicle(vehicle) end
	if DoesEntityExist(vehicle) then
		if GetVehicleDoorLockStatus(vehicle) == 2 then
			triggerNotify(nil, Loc[Config.Lan]["extras"].locked, "error")
			return
		else
			if GetVehicleDoorAngleRatio(vehicle, doornum) > 0.0 then SetVehicleDoorShut(vehicle, doornum, false)
			else SetVehicleDoorOpen(vehicle, doornum, false, false) end
		end
	end
end)

RegisterNetEvent("jim-mechanic:flipvehicle", function() local Ped = PlayerPedId()
	local coords = GetEntityCoords(Ped)
	if not inCar() then	return end
	if not nearPoint(coords) then return end
	local vehicle = getClosest(coords) pushVehicle(vehicle)
	if DoesEntityExist(vehicle) then
		lookEnt(vehicle)
		local cam = createTempCam(Ped, GetEntityCoords(vehicle))
		startTempCam(cam)
		if progressBar({label = Loc[Config.Lan]["extras"].flipping, time = 12000, cancel = true, dict = "missfinale_c2ig_11", anim = "pushcar_offcliff_f", flag = 32 }) then
			stopTempCam()
			qblog("used `/flipvehicle`")
			local vehiclecoords = GetEntityCoords(vehicle)
			SetEntityCoords(vehicle, vehiclecoords.x+0.5, vehiclecoords.y+0.5, vehiclecoords.z+1)
			Wait(200)
			SetEntityRotation(vehicle, GetEntityRotation(Ped, 2), 2)
			Wait(500)
			SetVehicleOnGroundProperly(vehicle)
			triggerNotify(nil, Loc[Config.Lan]["extras"].flipped, "success")
		else
			stopTempCam()
			triggerNotify(nil, Loc[Config.Lan]["extras"].failed, "error")
		end
		emptyHands(Ped)
	end
end)

RegisterNetEvent("jim-mechanic:seat", function(seat) local Ped = PlayerPedId()
	if not seat then triggerNotify(nil, Loc[Config.Lan]["extras"].noseat, "error") return end
	local vehicle = GetVehiclePedIsIn(Ped)
	local IsSeatFree = IsVehicleSeatFree(vehicle, tonumber(seat))
	local speed = GetEntitySpeed(vehicle)
	if not HasHarness() then
		local kmh = (speed * 3.6);
		if IsSeatFree then
			if kmh <= 100.0 then
				SetPedIntoVehicle(Ped, vehicle, tonumber(seat))
				triggerNotify(nil, Loc[Config.Lan]["extras"].moveseat..seat.."!")
			else
				triggerNotify(nil, Loc[Config.Lan]["extras"].fastseat)
			end
		else
			triggerNotify(nil, Loc[Config.Lan]["extras"].notseat)
		end
	else
		triggerNotify(nil, Loc[Config.Lan]["extras"].harness, 'error')
	end
end)

local soundTog = false
RegisterNetEvent("jim-mechanic:togglesound", function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
	if not soundTog then soundTog = true
		currentEngine = GetVehicleMod(vehicle, 11)
		local soundTable = {
			[0] = "zorrusso", [1] = "zentorno", [2] = "krieger", [3] = "monster", [4] = "monster",
		}
		ForceVehicleEngineAudio(vehicle, soundTable[currentEngine])
	elseif soundTog then soundTog = false
		ForceVehicleEngineAudio(vehicle, string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
	end
end)


local function hideOdo()
	TriggerEvent("jim-mechanic:client:HideText")
end

local function updateOdo(dist, veh, plate, possMods)
	if not DoesEntityExist(veh) or veh == 0 or veh == nil then return end
	if plate == nil then return end
	local odotext, lights = "", ""
	if dist ~= "" then
		odotext = string.format("%05d", math.floor(dist+DistAdd)).." <b>"..(Config.System.distkph and "Km" or "Mi") .."</b>"
	end
	if Config.System.Debug and seat == -1 then
		maxSpeed = (GetEntitySpeed(veh) > maxSpeed) and GetEntitySpeed(veh) or maxSpeed
		odotext =
		"<br><b>Vehicle Debug Info</b>:"..
		"<br>"..searchCar(veh).name..
		"<br>Class: "..(searchCar(veh).class or "N/A")..
		"<br>"..Loc[Config.Lan]["check"].plate.." "..plate
		..tostring((dist ~= "") and "<br>Dist: "..odotext or "")..
		"<br>DistAdd: "..DistAdd..
		"<br><br><b>Stats</b>:"..
		"<br>Fuel: "..math.ceil(GetVehicleFuelLevel(veh)).."%"..
		"<br>MaxRecordedSpeed: "..math.ceil(maxSpeed * 2.23694)..
		"<br>EstimatedTopSpeed: "..math.ceil(GetVehicleEstimatedMaxSpeed(veh) * 2.23694)..
		"<br>TopSpeedModifier: "..GetVehicleTopSpeedModifier(veh)..
		"<br>RPM: "..string.format("%.2f", GetVehicleCurrentRpm(veh))..
		"<br>Gear:"..GetVehicleCurrentGear(veh)..
		"<br>tankHealth:"..GetVehiclePetrolTankHealth(veh)..
		"<br>oilLevel:"..GetVehicleOilLevel(veh)..
		"<br>EntityID: "..veh..
		"<br>netID: "..VehToNet(veh)..
		"<br>MaxSeats: "..GetVehicleMaxNumberOfPassengers(veh)+1
		--[["<br>HandlingFloat: "..GetVehicleHandlingFloat(veh , "CHandlingData","fMass")..
		"<br>TurboPressure: "..string.format("%.2f", GetVehicleTurboPressure(veh)) ..
		"<br>PowerIncrease: "..string.format("%.2f", GetVehicleCheatPowerIncrease(veh))..
		"<br>SteeringLock: "..GetVehicleHandlingFloat(veh, "CHandlingData", "fSteeringLock")]]

		if not (IsPedInAnyBoat(PlayerPedId()) or IsPedInAnySub(PlayerPedId())) and not (IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId())) then
			local vehcoord = GetEntityCoords(veh)
			local streetname, _ = GetStreetNameAtCoord(vehcoord.x, vehcoord.y, vehcoord.z, veh)
			odotext = odotext.."<br><br>Street Name: "..GetStreetNameFromHashKey(streetname)..
								"<br>onRoad: "..tostring(IsPointOnRoad(GetEntityCoords(veh), veh))
		end

		if IsPedInAnyBoat(PlayerPedId()) or IsPedInAnySub(PlayerPedId()) then
			odotext = odotext.."<br><br>CanAnchorBoatHere: "..tostring(CanAnchorBoatHere(veh))
		end

		if IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
			odotext = odotext.."<br><br>IsEntityInAir: "..tostring(IsEntityInAir(veh))
		end

		if VehicleNitrous[plate] and not Config.Overrides.disableNos then
			odotext = odotext.."<br><br><b>Nitrous</b>:"..
			"<br>NOS: "..tostring((VehicleNitrous[plate].level)).."%"..
			"<br>purgeCool "..purgeCool..
			"<br>NosDamageTimer "..damageTimer
		end


		odotext = odotext..
		"<br><br><b>Vehicle Health</b>:"..
		"<br>Engine: "..math.floor(GetVehicleEngineHealth(veh) / 10).."%"..
		"<br>Body: "..math.floor(GetVehicleBodyHealth(veh) / 10).."%"
		if Config.Repairs.ExtraDamages == true then
			odotext = odotext..
			"<br>"..Loc[Config.Lan]["repair"].oil..": "..math.floor(VehicleStatus[plate]["oil"]).."%"..
			"<br>"..Loc[Config.Lan]["repair"].driveshaft..": "..math.floor(VehicleStatus[plate]["axle"]).."%"..
			"<br>"..Loc[Config.Lan]["repair"].spark..": "..math.floor(VehicleStatus[plate]["spark"]).."%"..
			"<br>"..Loc[Config.Lan]["repair"].battery..": "..math.floor(VehicleStatus[plate]["battery"]).."%"..
			"<br>"..Loc[Config.Lan]["repair"].tank..": "..math.floor(VehicleStatus[plate]["fuel"]).."%"..
			"<br>Damage Effect Timer: ".. (effectTimer / 100)
		end
		odotext = odotext..
		"<br><br><b>Upgrade Levels</b>:"..
		"<br>"..Loc[Config.Lan]["check"].label1.." Lvl "..(GetVehicleMod(veh, 11)+1).."/"..possMods[11]..
		"<br>"..Loc[Config.Lan]["check"].label2.." Lvl "..(GetVehicleMod(veh, 12)+1).."/"..possMods[12]..
		"<br>"..Loc[Config.Lan]["check"].label3.." Lvl "..(GetVehicleMod(veh, 15)+1).."/"..possMods[15]..
		"<br>"..Loc[Config.Lan]["check"].label4.." Lvl "..(GetVehicleMod(veh, 13)+1).."/"..possMods[13]..
		"<br>"..Loc[Config.Lan]["check"].label5.." Lvl "..(GetVehicleMod(veh, 16)+1).."/"..GetNumVehicleMods(veh, 16)..
		"<br>"..Loc[Config.Lan]["check"].label6.." "..tostring(IsToggleModOn(veh, 18))..
		"<br>"..Loc[Config.Lan]["check"].label7.." "..tostring(IsToggleModOn(veh, 22))..
		"<br>"..Loc[Config.Lan]["check"].label8.." "..tostring(GetDriftTyresEnabled(veh))..
		"<br>"..Loc[Config.Lan]["check"].label9.." "..tostring(not GetVehicleTyresCanBurst(veh))..
		"<br><br>Oil Tank: Lvl "..VehicleStatus[plate].oillevel.."/3"..
		"<br>Drive Shaft: Lvl "..VehicleStatus[plate].shaftlevel.."/3"..
		"<br>Cylinder Head: Lvl "..VehicleStatus[plate].cylinderlevel.."/3"..
		"<br>Battery Cables: Lvl "..VehicleStatus[plate].cablelevel.."/3"..
		"<br>Fuel Tank: Lvl "..VehicleStatus[plate].fuellevel.."/3"..
		"<br>Harness: "..VehicleStatus[plate].harness..
		"<br>AntiLag: "..VehicleStatus[plate].antiLag..
		"<br>CarWax: "..VehicleStatus[plate].carwax
	end
	if Config.Odometer.OdoShowIcons or Config.System.Debug then
		local br = "&nbsp;&nbsp;"
		if Config.Odometer.OdoLocation == "right" or Config.Odometer.OdoLocation == "left" then br = "<br>" vert = "horizontal" end
		if Config.Odometer.OdoIconsToShow["engine"] then local engHealth = GetVehicleEngineHealth(veh)
			if engHealth > 700 then
				if Config.Odometer.OdoAlwaysShowIcons then lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height: 2.5vh' src='img/engine.png'>"..br
				else lights = lights.."" end
			elseif engHealth < 700 and engHealth > 350 then
				lights = lights.. "<img style='vertical-align:middle; filter: invert(106%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height: 2.5vh' src='img/engine.png'>"..br
			elseif engHealth < 350 then
				lights = lights.."<img style='vertical-align:middle; filter: invert(16%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height: 2.5vh' src='img/engine.png'>"..br
			end
		end
		if Config.Odometer.OdoIconsToShow["engine"] then local bodHealth = GetVehicleBodyHealth(veh)
			if bodHealth > 700 then
				if Config.Odometer.OdoAlwaysShowIcons then lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height: 2.5vh' src='img/body.png'>"..br
				else lights = lights.."" end
			elseif bodHealth < 700 and bodHealth > 450 then
				lights = lights.. "<img style='vertical-align:middle; filter: invert(106%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height: 2.5vh' src='img/body.png'>"..br
			elseif bodHealth < 350 then
				lights = lights.."<img style='vertical-align:middle; filter: invert(16%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height: 2.5vh' src='img/body.png'>"..br
			end
		end
		if Config.Repairs.ExtraDamages == true then
			for k, v in pairs({"oil", "spark", "axle", "battery"}) do
				if Config.Odometer.OdoIconsToShow[v] then
					if math.floor(VehicleStatus[plate][v]) then
						if math.floor(VehicleStatus[plate][v]) > 70 then
							if Config.Odometer.OdoAlwaysShowIcons then lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height: 2.5vh' src='img/"..v..".png'>"..br
							else lights = lights.."" end
						elseif math.floor(VehicleStatus[plate][v]) < 70 and math.floor(VehicleStatus[plate][v]) > 45 then
							lights = lights.."<img style='vertical-align:middle; filter: invert(106%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height: 2.5vh' src='img/"..v..".png'>"..br
						elseif math.floor(VehicleStatus[plate][v]) < 45 then
							lights = lights.."<img style='vertical-align:middle; filter: invert(16%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height: 2.5vh' src='img/"..v..".png'>"..br
						end
					end
				end
			end
		end
		if Config.Odometer.OdoIconsToShow["headlight"] then
			local headlights = {}
			headlights[1], headlights[2], headlights[3] = GetVehicleLightsState(veh)
			if headlights[2] == 1 then
				if headlights[3] == 0 then
					lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height: 2.5vh' src='img/headlight1.png'>"..br
				elseif headlights[3] == 1 then
					lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height: 2.5vh' src='img/headlight2.png'>"..br
				end
			end
		end
		if Config.Odometer.OdoIconsToShow["wheel"] then
			for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
				if IsVehicleTyreBurst(veh, v, 0) == 1 or IsVehicleTyreBurst(veh, v, 1) == 1 then
					lights = lights.."<img style='vertical-align:middle; filter: invert(16%)  sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height: 2.5vh' src='img/wheel.png'>"..br
					break
				end
			end
		end
		if VehicleNitrous[plate] and not Config.Overrides.disableNos then
			local style
			if purgemode then
				style = "vertical-align:middle; filter: invert(100%); height: 2.5vh"
				lights = lights.."<img style='"..style.."' src='img/purge.png'>"..br
			else
				if purgeCool > 0 then
					lights = lights..purgeCool.."<img style='vertical-align:middle; filter: invert(100%); opacity:0.35; height: 2.5vh' src='img/nos.png'>"..br
				else
					style = "vertical-align:middle; filter: invert(100%); height: 2.5vh"
					if boostLevel == 2 then style = "vertical-align:middle; filter: invert(106%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height: 2.5vh" end
					if boostLevel == 3 then style = "vertical-align:middle; filter: invert(16%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height: 2.5vh" end
					lights = lights.."<img style='"..style.."' src='img/nos.png'>"..br
				end
			end
		end

		if not isBike(model) and VehicleStatus[plate] then
			if Config.Harness.HarnessControl then
				if Config.Odometer.OdoIconsToShow["harness"] then
					if VehicleStatus[plate].harness == 1 then
						local style = ""
						if HasHarness() then style = "vertical-align:middle; filter: invert(100%); opacity: 1;"
						else style = "vertical-align:middle; filter: invert(16%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); opacity: 0.25;" end
						lights = lights.."<img style='"..style.." height: 2.5vh' src='img/harness.png'>"..br
					end
				end
				if Config.Odometer.OdoIconsToShow["seatbelt"] and VehicleStatus[plate].harness == 0 then
					local style = ""
					if seatBeltOn() then style = 'vertical-align:middle; filter: invert(100%); opacity: 1;'
					else style = "vertical-align:middle; filter: invert(106%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); opacity: 0.25;" end
					lights = lights.."<img style='"..style.." height: 2.5vh' src='img/seatbelt.png'>"..br
				end
			end
		end
		TriggerEvent("jim-mechanic:client:DrawText", "<center>"..lights.."<span style='font-size: 0.8em;'>"..odotext.."</span>", tostring(Config.Odometer.OdoLocation))
	end
end

if GetResourceState("ox_lib"):find("start") then
	lib.onCache('vehicle', function(vehicle)
		if vehicle then TriggerEvent("jim-mechanic:Client:EnteredVehicle")
		else TriggerEvent("jim-mechanic:Client:ExitVehicle") end
	end)
end

RegisterNetEvent("jim-mechanic:Client:ExitVehicle", function()
	Wait(1000)
	if Config.System.Debug then print("^5Debug^7: ^3ExitVehicle^7: ^2Player has exited vehicle ^7- ^4Seat^7: ^1"..tostring(seat) .."^7") end
	local veh = GetVehiclePedIsIn(PlayerPedId(), true)
	if seat == -1 then
		if VehicleNitrous[plate] and not Config.Overrides.disableNos then
			TriggerServerEvent('jim-mechanic:server:UpdateNitroLevel', plate, VehicleNitrous[plate].level) -- Update the nos when you are no longer in that vehicle
			forceStopNos() -- Remove any changed effects to the vehicle
		end
		TriggerServerEvent('jim-mechanic:server:UpdateDrivingDistance', plate, math.round(DistAdd))
		if DoesEntityExist(veh) and veh ~= 0 and veh ~= nil and defVehStats[plate] then
			if Config.Overrides.saveOnExit == true and not GetInPreview() then
				local mods = getVehicleProperties(veh)
				if mods.model == model then
					saveStatus(veh)
					TriggerServerEvent('jim-mechanic:updateVehicle', mods, plate)
				end
			end
			--Handling Changes
			if Config.NOS.HandlingChange then
				SetVehicleHandlingFloat(veh, "CHandlingData", "fMass", defVehStats[plate]["hFloat"])
				SetVehicleTurboPressure(veh, defVehStats[plate]["tPressure"])
				SetVehicleCheatPowerIncrease(veh, defVehStats[plate]["pIncrease"])
				ModifyVehicleTopSpeed(veh, defVehStats[plate]["speedMod"])
			end
		end
		effectTimer = 0
		antiLagCooldown = 0
		damageTimer = 0
		purgeCool = 0
		DistAdd = 0
		maxSpeed = 0
	end
	seatbeltOn = false
	harnessOn = false
	hideOdo()
	destroyHarness()
	seat = nil
	plate = nil
end)

RegisterNetEvent("jim-mechanic:Client:EnteredVehicle", function()
	Wait(1000)
	local Ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(Ped)
	plate = trim(GetVehicleNumberPlateText(veh))
	model = GetEntityModel(veh)
	local owned = IsVehicleOwned(plate)
	seat = GetSeatPedIsIn(veh)
	local dist = ""
	if Config.System.Debug then print("^5Debug^7: ^3EnteredVehicle^7: ^2Player has entered vehicle ^7- ^4Seat^7: ^1"..seat .."^7") end

	GetVehicleStatus(VehToNet(veh))
	getDefStats(veh, plate)
	Wait(1000)
	-- Grab/Save default vehicle stats at time of entering
	-- This SHOULD be the defaults of the vehicle, not edited

	if VehicleStatus and VehicleStatus[plate] and VehicleStatus[plate]["carwax"] ~= 0 then
		CreateThread(function() -- Check server time for if it should remove car wax status
			VehicleStatus[plate]["carwax"] = triggerCallback('jim-mechanic:checkWax', plate)
		end)
	end

	-- LOOP TO CHECK FOR CRASHES AND WETHER TO EJECT
	CreateThread(function()
		local possMods = checkHSWMods(veh)
		local wait = 100
		while GetVehiclePedIsIn(Ped, false) == veh and not IsThisModelABicycle(model) do
			if ShowOdo then
				if seat == -1 or Config.Odometer.ShowToAll then updateOdo(dist, veh, plate, possMods) end
			end
			if IsVehicleStopped(veh) then wait = 5000
			else wait = 10
			end -- delay loop when car is stopped
			SetPedHelmet(Ped, false)
			thisFrameSpeed = GetEntitySpeed(veh) * 3.6
			curVehBody = GetVehicleBodyHealth(veh)
			if curVehBody == 1000 and frameBodyChange ~= 0 then
				frameBodyChange = 0
			end
			-- Work out wether should eject based on speed how much damage is done to the body at time of impact
			if frameBodyChange ~= 0 then
				if not HasHarness() then
					if lastSpeed > 110 and thisFrameSpeed < (lastSpeed * 0.75) and not damagedone and not isBike(model) and (Config.Harness.HarnessControl and not HasHarness()) then
						if frameBodyChange > 15.0 then -- if 0.15% damage done
							if seatBeltOn() then
								if lastSpeed > math.random(100, 120) then -- if travelling at more than 100mph
									EjectFromVehicle(GetEntityVelocity(veh), thisFrameSpeed, frameBodyChange)
								end
							else
								if lastSpeed > math.random(50, 70) then -- if travelling at more than 50mph
									EjectFromVehicle(GetEntityVelocity(veh), thisFrameSpeed, frameBodyChange)
								end
							end
						end
						damagedone = true
					end
					if curVehBody < 350.0 and not damagedone then
						damagedone = true
						Wait(1000)
					end
				end
				if seat == -1 and Config.vehFailure.damages then
					DamageRandomComponent(veh) -- Added DamageRandomComponent here to remove need for qb-vehiclefailure
				end
			end
			if lastSpeed < 100 then Wait(100) tick = 0 end
			frameBodyChange = newVehBody - curVehBody
			if tick > 0 then tick -= 1
				if tick == 1 then lastSpeed = thisFrameSpeed end
			else
				if damagedone then damagedone = false frameBodyChange = 0 lastSpeed = thisFrameSpeed end
				lastSpeed2 = thisFrameSpeed
				if lastSpeed2 > lastSpeed then lastSpeed = thisFrameSpeed end
				if lastSpeed2 < lastSpeed then tick = 25 end
			end
			if tick < 0 then tick = 0 end
			newVehBody = GetVehicleBodyHealth(veh)
			if not modifierDensity then modifierDensity = true end
			Wait(wait)
		end
		SetPedHelmet(Ped, true)
		lastSpeed2, lastSpeed, newVehBody, curVehBody, frameBodyChange = 0, 0, 0, 0, 0
	end)

	if seat == -1 then
		--TriggerServerEvent('jim-mechanic:server:LoadNitrous', plate)
		local prevLoc = GetEntityCoords(veh)
		local nos = {}
		damageTimer = 0
		if VehicleStatus[plate]["carwax"] ~= 0 then	SetVehicleDirtLevel(veh, 0.0) WashDecalsFromVehicle(veh, 1.0) end -- if carwax, clean car
		if VehicleNitrous[plate] and not Config.Overrides.disableNos then
			nos = { VehicleNitrous[plate].hasnitro, VehicleNitrous[plate].level }
		end
		TriggerEvent('hud:client:UpdateNitrous', nos[1] or false, nos[2] or 0, false)
		if owned then dist = triggerCallback('jim-mechanic:distGrab', plate) end -- grab milage
		-- LOOP TO UPDATE DATABASE WHILE DRIVING
		CreateThread(function()
			local wait = 1000
			while owned and seat == -1 do
				if not IsVehicleStopped(veh) then
					local newCoords = GetEntityCoords(veh)
					DistAdd += CalculateTravelDistanceBetweenPoints(newCoords, prevLoc) * (Config.System.distkph and 0.001 or 0.00062) -- Work out distance in miles or kph
					prevLoc = newCoords
					wait = 1000
				else wait = 5000 end
				Wait(wait)
			end
		end)
		-- FAST LOOP TO UPDATE SHIT WHILE DRIVING
		CreateThread(function()
			while seat == -1 do
				-- AntiLag featrue loop mixed into this loop to reduce ms
				if plate and VehicleStatus[plate] and VehicleStatus[plate].antiLag == 1 then
					antiLagCooldown -= 1
					if veh ~= 0 and DoesEntityExist(veh) and GetVehicleCurrentGear(veh) ~= 0 then
						if not IsControlPressed(1, 71) and not IsControlPressed(1, 72) and not IsEntityInAir(veh) and not NitrousActivated and GetIsVehicleEngineRunning(veh) then
							if GetVehicleCurrentRpm(veh) > 0.75 then
								antiLagCooldown -= 1
								if antiLagCooldown <= 0 then
									TriggerServerEvent("jim-mechanic:server:AntiLag", VehToNet(veh), GetEntityCoords(veh))
									antiLagCooldown = 300
								end
							end
						end
					end
				end
				if Config.vehFailure.damageLimits then -- ported vehfailure damage limits to prevent fires and such
					local damageLimits = Config.vehFailure.damageLimits
					if GetVehiclePetrolTankHealth(veh) < (damageLimits.petrolTank or 750.0) then
						SetVehiclePetrolTankHealth(veh, (damageLimits.petrolTank or 750.0))
						SetVehicleOilLevel(veh, 5.0)
						SetVehicleCanLeakPetrol(veh, false)
						SetVehicleCanLeakOil(veh, false)
					end
					if GetVehicleEngineHealth(veh) <= (damageLimits.engine or 50) then
						SetVehicleEngineHealth(veh, ((damageLimits.engine + 1 ) or 51))
					end
					if damageLimits.engineUndriveble then
						SetVehicleUndriveable(veh, (GetVehicleEngineHealth(veh) <= (damageLimits.engine or 50)))
					end
					if GetVehicleBodyHealth(veh) <= (damageLimits.body or 50) then
						SetVehicleBodyHealth(veh, ((damageLimits.body + 1 ) or 51))
					end
				end
				if Config.vehFailure.PreventRoll then -- vehiclefailure added loops
					local roll = GetEntityRoll(veh)
					if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(veh) < 2 then
						DisableControlAction(2, 59, true) -- Disable left/right
						DisableControlAction(2, 60, true) -- Disable up/down
					end
				end

				if (harnessOn and not Config.Harness.harnessEasyLeave) or (seatbeltOn and not Config.Harness.seatbeltEasyLeave) then
					DisableControlAction(0, 75, true)
					DisableControlAction(27, 75, true)
				end

				local wait = Config.System.Debug == true and 0 or (Config.vehFailure.PreventRoll and 5 or 100)
				Wait((wait))
			end
		end)
	end
end)

RegisterNetEvent("jim-mechanic:client:AntiLag", function(vehicle, vehPos) -- Separated Antilag because it was lag
	local veh = ensureNetToVeh(vehicle)
	if veh and veh ~= 0 then
		for i = 1, math.random(1, 4) do
			TriggerEvent('jim-mechanic:client:playWithinDistance', vehPos, tostring(math.random(1, 4)))
			CreateVehicleExhaustBackfire(veh)
			Wait(math.random(150,350))
		end
	end
end)

RegisterNetEvent("jim-mechanic:ShowOdo", function() print("^3ShowOdo^7: ^2Odometer toggled^7") ShowOdo = not ShowOdo hideOdo() end)

function destroyHarness()
	if DoesEntityExist(harnessProp) then
		destroyProp(harnessProp)
		harnessProp = nil
	end
end -- function so this can be called in extras.lua
function createHarness(Ped)
	if not DoesEntityExist(harnessProp) then
		local pedCoords = GetEntityCoords(Ped)
		harnessProp = makeProp({prop = "idrp_racing_harness", coords = vec4(pedCoords.x, pedCoords.y, pedCoords.z, 0.0)}, 1, 1)
		if DoesEntityExist(harnessProp) then
			AttachEntityToEntity(harnessProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 24818), 0.02, -0.04, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
		end
	end
end

if Config.Harness.HarnessControl == true then
	-- Functions
	function EjectFromVehicle(veloc) local Ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(Ped, false)
		if DoesEntityExist(veh) and veh ~= 0 then
			if Config.System.Debug then print("Ejecting player from vehicle", speed, damage) end
			local coords = GetOffsetFromEntityInWorldCoords(veh, 1.0, 0.0, 1.0)
			SetEntityCoords(Ped, coords.x, coords.y, coords.z)
			SmashVehicleWindow(veh, 6)
			Wait(1)
			SetPedToRagdoll(Ped, 5511, 5511, 0, 0, 0, 0)
			SetEntityVelocity(Ped, (veloc.x * 2), (veloc.y * 2), (veloc.z * 2))
			if Config.Harness.crashKill then
				local ejectspeed = math.ceil(GetEntitySpeed(Ped) * 8)
				if GetEntityHealth(Ped) - ejectspeed > 0 then SetEntityHealth(Ped, GetEntityHealth(Ped) - ejectspeed)
				elseif GetEntityHealth(Ped) ~= 0 then SetEntityHealth(Ped, 0) end
			end
		end
	end

	local function SeatBeltLoop()
		CreateThread(function() local Ped = PlayerPedId()
			while (seatbeltOn or harnessOn) and IsPedInAnyVehicle(Ped) do
				if (harnessOn and not Config.Harness.harnessEasyLeave) or (seatbeltOn and not Config.Harness.seatbeltEasyLeave) then
					DisableControlAction(0, 75, true)
					DisableControlAction(27, 75, true)
				end
				Wait(5)
			end
			if GetResourceState("esx_hud"):find("start") then
				exports["esx_hud"]:SeatbeltState(false)
			end
			destroyHarness()
		end)
	end

	local inProgress = false
	local function ToggleSeatbelt()
		local Ped = PlayerPedId()
		if IsPedSittingInAnyVehicle(Ped) then
			local veh = GetVehiclePedIsIn(Ped, false)
			local plate = trim(GetVehicleNumberPlateText(veh))
			GetVehicleStatus(VehToNet(veh))
			if isBike(GetEntityModel(veh)) then return end
			CreateThread(function()
				if not inProgress then inProgress = true
					if VehicleStatus[plate].harness == 1 then
						if (Config.Harness.progOn and not harnessOn) or (Config.Harness.progOff and harnessOn) then
							if progressBar({
								label = (not harnessOn and Loc[Config.Lan]["common"].harness or Loc[Config.Lan]["common"].removing),
								time = (not harnessOn and (Config.Harness.timeOn or math.random(4000, 7000)) or (Config.Harness.timeOff or math.random(3000, 5000))),
								cancel = true, anim = "fixing_a_ped", dict = "mini@repair", flag = 48, icon = "harness",
							}) then
								if IsPedInAnyVehicle(Ped) then
									if not harnessOn then createHarness(Ped) end
									harnessOn = not harnessOn
								else
									destroyHarness()
									harnessOn = false
								end
							else
								if not harnessOn then createHarness(Ped) end
								harnessOn = not harnessOn
							end
						else
							if IsPedInAnyVehicle(Ped) then
								if not harnessOn then createHarness(Ped) end
								harnessOn = not harnessOn
							end
						end
					end
					seatbeltOn = not seatbeltOn
					if seatbeltOn then SeatBeltLoop() end
					--Drop your hud seatbelt event here:
					TriggerEvent("seatbelt:client:ToggleSeatbelt")
					if GetResourceState("esx_hud"):find("start") then exports["esx_hud"]:SeatbeltState(seatbeltOn) end
					TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, seatbeltOn and "carbuckle" or "carunbuckle", 0.25)
					if Config.Harness.seatbeltNotify then triggerNotify(nil, "Seatbelt "..(seatbeltOn and "on" or "off"), "success") end
					Wait(500)
					inProgress = false
				end
			end)
		end
	end

	-- Exports
	function HasHarness() return harnessOn end
	function seatBeltOn() return seatbeltOn end
	exports("HasHarness", HasHarness)
	exports("seatBeltOn", seatBeltOn)

	-- Register Key
	RegisterCommand('toggleseatbelt', function() ToggleSeatbelt() end)

	RegisterKeyMapping('toggleseatbelt', 'Toggle Seatbelt', 'keyboard', 'B')
end