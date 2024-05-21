local cleaning = false
local antiLagCooldown = 0
local DistAdd, maxSpeed, ShowingOdo, ShowOdo, owned, veh, databasecalc, nosUpdate = 1, 0, false, Config.Odometer.ShowOdo, false, 0, false, false

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
    local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 3.0, 0.0, 1.0), GetEntityCoords(vehicle))
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
		local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0, 0, 2.0), GetEntityCoords(Ped))
		startTempCam(cam)
		if progressBar({label = Loc[Config.Lan]["extras"].flipping, time = 12000, cancel = true, dict = "missfinale_c2ig_11", anim = "pushcar_offcliff_f", flag = 8 }) then
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
	if (Config.Harness.HarnessControl and not HasHarness()) then
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

if GetResourceState("ox_lib"):find("start") then
	lib.onCache('vehicle', function(vehicle)
		if vehicle then TriggerEvent("jim-mechanic:Client:EnteredVehicle")
		else TriggerEvent("jim-mechanic:Client:ExitVehicle") end
	end)
end

local failedToLeave = false

RegisterNetEvent("jim-mechanic:Client:ExitVehicle", function()
	Wait(1000)
	if not failedToLeave then
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
					--ModifyVehicleTopSpeed(veh, defVehStats[plate]["speedMod"])
				end
			end
			antiLagCooldown, damageTimer, purgeCool, DistAdd, maxSpeed = 0, 0, 0, 0, 0
		end
		seatbeltOn, harnessOn, seat, plate = false, false, nil, nil
		if ShowOdo then ExecuteCommand("hideodohud") end
		destroyHarness()
	end
	Wait(100)
	failedToLeave = false
end)

RegisterNetEvent("jim-mechanic:Client:EnteredVehicle", function()
	Wait(1000)
    local Ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(Ped, false)
	local vehIsIn = veh
	local dist = 0
    plate = trim(GetVehicleNumberPlateText(veh))
	model = GetEntityModel(veh)
    owned = IsVehicleOwned(plate)
    seat = GetSeatPedIsIn(veh)
	local newVehBody = GetVehicleBodyHealth(veh)
	local isStopped = IsVehicleStopped(veh)
	local getGravity = 	GetVehicleGravityAmount(veh)
	if veh == 0 or IsThisModelABicycle(model) or IsThisModelATrain(model) then return end -- if bicycle or train, end here
	if Config.System.Debug then
		print("^5Debug^7: ^3EnteredVehicle^7: ^2Player has entered vehicle ^7- ^4Seat^7: ^1"..seat .."^7")
	end

    GetVehicleStatus(VehToNet(veh))
    getDefStats(veh, plate)
	if vehIsIn ~= veh then return end
	Wait(1000)
	-- Grab/Save default vehicle stats at time of entering
	-- This SHOULD be the defaults of the vehicle, not edited

	if VehicleStatus and VehicleStatus[plate] and seat == -1 then
		if VehicleStatus[plate]["carwax"] ~= 0 then
			CreateThread(function() -- Check server time for if it should remove car wax status
				VehicleStatus[plate]["carwax"] = triggerCallback('jim-mechanic:checkWax', plate)
			end)
		end
		if VehicleStatus[plate]["manual"] == 1 then
			TriggerEvent("vlad_gears:activate")
			Wait(50)
			TriggerEvent("vlad_gears:entered_listener")
		else
			TriggerEvent("vlad_gears:deactivate")
			Wait(50)
			TriggerEvent("vlad_gears:entered_listener")
		end
	end

	-- LOOP TO CHECK FOR CRASHES AND WETHER TO EJECT
	CreateThread(function()
		if vehIsIn == veh and GetIsVehicleEngineRunning(veh) and ShowOdo then ExecuteCommand("showodohud") end

		CreateThread(function()
			while vehIsIn == veh and DoesEntityExist(veh) and Config.Odometer.showSpeedometer and ShowOdo do
				updateSpeedometer(veh, model)
				Wait(isStopped and 250 or 140)
			end
		end)

		CreateThread(function()
			local lastSpeed, lastSpeed2, damagedone, frameBodyChange, tick, pauseMenuCheck = 0, 0, false, 0, 0, false
			while vehIsIn == veh do
				vehIsIn = GetVehiclePedIsIn(Ped, false)
				isStopped = IsVehicleStopped(veh)
				-- delay loop when car is stopped
				SetPedHelmet(Ped, false)
				if ShowOdo and DoesEntityExist(veh) then
					if IsPauseMenuActive() or not GetIsVehicleEngineRunning(veh) and pauseMenuCheck == false then
						ExecuteCommand("hideodohud")
						pauseMenuCheck = true
					elseif not IsPauseMenuActive() and GetIsVehicleEngineRunning(veh) and pauseMenuCheck then
						ExecuteCommand("showodohud")
						pauseMenuCheck = false
					end
				end
				updateVehicleHUD(dist, veh, trim(GetVehicleNumberPlateText(veh)), model, DistAdd, seat)
				--Beta Ejection System
				if Config.Harness.HarnessControl then
					if Config.Harness.AltEjection then -- WAY MORE OPTIMIZED
						SetPedConfigFlag(Ped, 32, not HasHarness())
						if not HasHarness() then
							SetFlyThroughWindscreenParams(seatBeltOn() and Config.Harness.minimumSeatBeltSpeed or Config.Harness.minimumSpeed, 1.0, 17.0, 10.0)
						else
							SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0) -- set to max values to stop flying out of vehicle
						end

						if Config.vehFailure.damages then
							local curVehBody = GetVehicleBodyHealth(veh)
							if newVehBody > curVehBody then
								if seat == -1 then
									if Config.vehFailure.damages then
										DamageRandomComponent(veh)
									end
									if Config.vehFailure.increaseEngDamage then
										SetVehicleEngineHealth(veh, GetVehicleEngineHealth(veh) - ((newVehBody - curVehBody) / math.random(1, 2)))
									end
								end
							end
							newVehBody = GetVehicleBodyHealth(veh)
						end
					else
						--Old Ejection System
						local thisFrameSpeed, curVehBody = (GetEntitySpeed(veh) * 2.23694), GetVehicleBodyHealth(veh)
						local minimumSpeed = Config.Harness.minimumSpeed
						local minimumSeatBeltSpeed = Config.Harness.minimumSeatBeltSpeed
						if curVehBody == 1000 and frameBodyChange ~= 0 then frameBodyChange = 0 end
						if frameBodyChange ~= 0 then
							if Config.vehFailure.increaseEngDamage then
								SetVehicleEngineHealth(veh, GetVehicleEngineHealth(veh) - ((newVehBody - curVehBody) / math.random(1, 2)))
							end
							if Config.Harness.HarnessControl and not HasHarness() then
								SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0) -- force gta native to false
								if lastSpeed > (Config.Harness.minimumSpeed or 60) and
								thisFrameSpeed < lastSpeed * 0.75 and
									not damagedone and not isBike(model)
								then
									if frameBodyChange > (Config.Harness.minimumDamage or 15.0) and lastSpeed > (minimumSpeed or 60) then
										if seatBeltOn() and lastSpeed > (minimumSeatBeltSpeed or 110) or
											not seatBeltOn() and lastSpeed > (minimumSpeed or 60)
										then
											EjectFromVehicle(GetEntityVelocity(veh), lastSpeed, frameBodyChange)
										end
									end
									damagedone = true
								end
								if curVehBody < 350.0 and not damagedone then Wait(1000) damagedone = true end
							end
							if seat == -1 and Config.vehFailure.damages then
								DamageRandomComponent(veh)
							end
						end

						if lastSpeed < (Config.Harness.minimumSpeed or 60) then Wait(100) tick = 0 end

						frameBodyChange = newVehBody - curVehBody

						if tick > 0 then tick = tick - 1
							if tick == 1 then lastSpeed = thisFrameSpeed end
						else
							if damagedone then
								damagedone = false
								frameBodyChange, lastSpeed = 0, thisFrameSpeed
							end

							lastSpeed2 = thisFrameSpeed

							if lastSpeed2 > lastSpeed then lastSpeed = thisFrameSpeed
							elseif lastSpeed2 < lastSpeed then tick = 25 end
						end

						if tick < 0 then tick = 0 end

						newVehBody, modifierDensity = GetVehicleBodyHealth(veh), true
					end
				end
				Wait(isStopped and 1000 or (Config.Harness.AltEjection and 500 or 200))
			end
			SetPedHelmet(Ped, true)
			lastSpeed2, lastSpeed, newVehBody, frameBodyChange = 0, 0, 0, 0
		end)
	end)

	if seat == -1 then
		--TriggerServerEvent('jim-mechanic:server:LoadNitrous', plate)
		local prevLoc = GetEntityCoords(veh)
		local nos = {}

		if VehicleStatus[plate] and VehicleStatus[plate]["carwax"] ~= 0 then -- if carwax, clean car
            SetVehicleDirtLevel(veh, 0.0)
            WashDecalsFromVehicle(veh, 1.0)
        end

		if VehicleNitrous[plate] and not Config.Overrides.disableNos then
			nos = { VehicleNitrous[plate].hasnitro, VehicleNitrous[plate].level }
		end
		TriggerEvent('hud:client:UpdateNitrous', nos[1] or false, nos[2] or 0, false) -- Reset Nitrous info

		dist = owned and triggerCallback('jim-mechanic:distGrab', plate) or 0

		-- LOOP TO UPDATE DATABASE WHILE DRIVING
		CreateThread(function()
			while seat == -1 do
				local newCoords = GetEntityCoords(veh)
				DistAdd += CalculateTravelDistanceBetweenPoints(newCoords, prevLoc) * (Config.System.distkph and 0.001 or 0.00062)
				prevLoc = newCoords
				Wait(isStopped and 1000 or 5000)
			end
		end)
		-- FAST LOOP TO UPDATE SHIT WHILE DRIVING
		CreateThread(function()
			while seat == -1 do
				if VehicleStatus[plate] and VehicleStatus[plate].antiLag == 1 then
					HandleAntiLag(veh)
				end
				if Config.vehFailure.damageLimits then -- ported vehfailure damage limits to prevent fires and such
					HandleVehicleDamageLimits(veh, model)
				end
				if Config.vehFailure.PreventRoll and DoesEntityExist(veh) then
					SetVehicleGravityAmount(veh, IsEntityUpsidedown(veh) and not IsEntityInAir(veh) and (getGravity * 5) or getGravity)
				end
				Wait(100)
			end
			if DoesEntityExist(veh) then
				SetVehicleGravityAmount(veh, getGravity)
			end
		end)
	end
end)

function HandleAntiLag(veh)
    if not plate or not VehicleStatus[plate] or VehicleStatus[plate].antiLag ~= 1 then return end
    antiLagCooldown -= 1
    if veh == 0 or not DoesEntityExist(veh) or GetVehicleCurrentGear(veh) == 0 then return end

    if not IsControlPressed(1, 71) and not IsControlPressed(1, 72) -- Not accelerating or reversing
		and not IsEntityInAir(veh) and not NitrousActivated
		and GetIsVehicleEngineRunning(veh) and GetVehicleCurrentRpm(veh) > 0.75 then
        if antiLagCooldown <= 0 then
            TriggerServerEvent("jim-mechanic:server:AntiLag", VehToNet(veh), GetEntityCoords(veh))
            antiLagCooldown = 50 -- Reset cooldown
        end
    end
end

function HandleVehicleDamageLimits(veh, model)
    local damageLimits = Config.vehFailure.damageLimits

    -- Petrol Tank Health Limits
    if GetVehiclePetrolTankHealth(veh) < (damageLimits.petrolTank or 750.0) then
        SetVehiclePetrolTankHealth(veh, damageLimits.petrolTank or 750.0)
        SetVehicleOilLevel(veh, 5.0)
        SetVehicleCanLeakPetrol(veh, false)
        SetVehicleCanLeakOil(veh, false)
    end

    -- Engine Health Limits
    if GetVehicleEngineHealth(veh) <= (damageLimits.engine or 50.0) then
        SetVehicleEngineHealth(veh, damageLimits.engine or 50.0)
        if damageLimits.engineUndriveable then
            SetVehicleUndriveable(veh, true)
        end
    end

    -- Body Health Limits
    if GetVehicleBodyHealth(veh) <= (damageLimits.body or 50) then
        SetVehicleBodyHealth(veh, (damageLimits.body or 50.0) + 1)
    end

    -- Handle Vehicle Submersion
	local isBoat = IsThisModelABoat(model) or IsThisModelAJetski(model)
    if GetEntitySubmergedLevel(veh) >= 0.95 and not isBoat then
		SetVehicleEngineHealth(veh, 40.0)
		SetVehicleBodyHealth(veh, 60.0)
		SetVehicleDoorBroken(veh, 1, true)
		SetVehicleDoorBroken(veh, 6, true)
		SetVehicleDoorBroken(veh, 4, true)
		SetVehicleEngineOn(veh, false, false, true)
    end
end

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

RegisterNetEvent("jim-mechanic:ShowOdo", function() print("^3ShowOdo^7: ^2Odometer toggled^7")
	ShowOdo = not ShowOdo
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		ExecuteCommand(ShowOdo and "showodohud" or "hideodohud")
	end
end)

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
	function EjectFromVehicle(veloc, thisFrameSpeed, frameBodyChange) local Ped = PlayerPedId()
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
		CreateThread(function()
			local Ped = PlayerPedId()
			local veh = GetVehiclePedIsIn(Ped, false)
			while (seatbeltOn or harnessOn) and DoesEntityExist(veh) do
				local attemptingToExit = not IsPedInAnyVehicle(Ped, true) or IsPedJumpingOutOfVehicle(Ped) -- Check if the ped is in the process of exiting the vehicle
				if (harnessOn and not Config.Harness.harnessEasyLeave) or (seatbeltOn and not Config.Harness.seatbeltEasyLeave) then
					if attemptingToExit then
						failedToLeave = true
						SetPedIntoVehicle(Ped, veh, seat)
						triggerNotify(nil, 'You cannot leave the vehicle with your harness/seatbelt on', "success")
					end
				end
				Wait(100)
			end
			TriggerEvent("codem-blackhudv2:seatbelt:toggle", false)
			if GetResourceState("esx_hud"):find("start") and GetResourceState("es_extended"):find("start") then exports["esx_hud"]:SeatbeltState(false) end
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
				if not inProgress then
					inProgress = true
					local shouldToggleHarness = false  -- Declare shouldToggleHarness here
					if VehicleStatus[plate].harness == 1 then
						if (Config.Harness.progOn and not harnessOn) or (Config.Harness.progOff and harnessOn) then
							-- Start of the progress bar logic
							if progressBar({
								label = (not harnessOn and Loc[Config.Lan]["common"].harness or Loc[Config.Lan]["common"].removing),
								time = (not harnessOn and (Config.Harness.timeOn or math.random(4000, 7000)) or (Config.Harness.timeOff or math.random(3000, 5000))),
								cancel = true, anim = "fixing_a_ped", dict = "mini@repair", flag = 48, icon = "harness",
							}) then
								shouldToggleHarness = true
							end
						else
							-- If progress bar conditions are not met, we should still toggle the harness
							shouldToggleHarness = true
						end

						-- Check if we should toggle the harness based on the progress bar result
						if shouldToggleHarness then
							if IsPedInAnyVehicle(Ped) then
								if not harnessOn then createHarness(Ped) end
								harnessOn = not harnessOn
							else
								destroyHarness()
								harnessOn = false
							end
						end
					end

					-- Toggle seatbelt only if the harness toggle was successful or if there's no harness logic involved
					if shouldToggleHarness or VehicleStatus[plate].harness ~= 1 then
						seatbeltOn = not seatbeltOn
						if seatbeltOn then SeatBeltLoop() end
						--Drop your hud seatbelt event here:
						TriggerEvent("seatbelt:client:ToggleSeatbelt")
						TriggerEvent("codem-blackhudv2:seatbelt:toggle", seatbeltOn)
						if GetResourceState("esx_hud"):find("start") and GetResourceState("es_extended"):find("start") then exports["esx_hud"]:SeatbeltState(seatbeltOn) end
						TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, seatbeltOn and "carbuckle" or "carunbuckle", 0.25)
						if Config.Harness.seatbeltNotify then triggerNotify(nil, "Seatbelt "..(seatbeltOn and "on" or "off"), "success") end
					end

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