PlayerJob = {}

onPlayerLoaded(function()
	if GetResourceState(QBExport):find("start") then
		Core.Functions.GetPlayerData(function(PlayerData)
			for _, v in pairs(Config.Main.JobRoles) do
				if hasJob(v) then
					havejob = true
					onDuty = PlayerData.job.onduty
				end
			end
		end)
	else
		for _, v in pairs(Config.Main.JobRoles) do
			if hasJob(v) then
				havejob = true
			end
		end
		onDuty = false
	end
	Wait(5000)
	makeLocs()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    onDuty = JobInfo.onduty
end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	Wait(500)
	if GetVehiclePedIsIn(PlayerPedId()) ~= 0 then TriggerEvent("jim-mechanic:Client:EnteredVehicle") end
	if GetResourceState(QBExport):find("start") then
		Core.Functions.GetPlayerData(function(PlayerData)
			for _, v in pairs(Config.Main.JobRoles) do
				if hasJob(v) then
					havejob = true
					onDuty = PlayerData.job.onduty
				end
			end
		end)
	else
		for _, v in pairs(Config.Main.JobRoles) do
			if hasJob(v) then
				havejob = true
			end
		end
		onDuty = false
	end
	makeLocs()
end)

local Prop, Targets, locsCreated = {}, {}, false
function makeLocs()
	if locsCreated then return end
	for k, v in pairs(Config.Locations) do local JobLocation = nil
	local loc = Config.Locations[k]
	if loc.Enabled then
	--Zone Creation
		Config.Locations[k].designatedName = "MechZone-"..k.."-"..loc.job
		local bossroles = makeBossRoles(loc.job or loc.gang)
		createPoly({
			points = loc.zones,
			name = Config.Locations[k].designatedName,
			onEnter = function()
				inLocation = Config.Locations[k].designatedName
				repairStashName = loc.job.."Safe"
				if Config.System.Debug then print("^5Debug^7: ^3Entered ^2Mech Zone^7: (^6"..Config.Locations[k].designatedName.."^7)") end
				if Config.Previews.PreviewLocation then inpreview = true end
				if Config.Main.JobLocationRequired then
					if loc.job ~= nil and hasJob(loc.job) then
						if loc.autoClock.enter and not onDuty then
							toggleDuty()
						end
					end
				end
				-- Crafting on enter
				if Config.StoreCraft.Crafting then
					if loc.crafting then
						for l, b in pairs(loc.crafting) do
							local name = "MechCraft: "..k..l
							local restrict = nil
							if loc.Restrictions and loc.Restrictions.Allow[1] then restrict = loc.Restrictions.Allow end
							local options = {
								{ action = function()
									TriggerEvent("jim-mechanic:client:Crafting:Menu", { job = loc.job, coords = b.coords.xyz, restrict = restrict, stashName = Config.StoreCraft.StashCraft and repairStashName }) end,
									icon = "fas fa-cogs",
									label = Loc[Config.Lan]["crafting"].menuheader,
									job = loc.job,
								},
							}
							if b.prop then
								Prop[name] = makeProp({coords = vec4(b.coords.x, b.coords.y, b.coords.z, b.coords.w), prop = "gr_prop_gr_bench_03b"}, 1, 0)
								createEntityTarget(Prop[name], options, 2.0)
							else
								Targets[name] =
								createBoxTarget({name, vec3(b.coords.x, b.coords.y, b.coords.z-1), b.w or 3.6, b.d or 0.8, { name=name, heading = b.coords.w, debugPoly=Config.System.Debug, minZ=b.coords.z-1.0, maxZ=b.coords.z+1.0 }, },
									options, 2.0)
							end
						end
					end
				end
				-- Stores on enter
				if Config.StoreCraft.Stores then
					if loc.store then
						for l, b in pairs(loc.store) do local name = "MechStore: "..k..l
							local restrict = nil if loc.Restrictions and loc.Restrictions.Allow[1] then restrict = loc.Restrictions.Allow end
							local options = {
								{ action = function()
									TriggerEvent("jim-mechanic:client:Store:Menu", { job = loc.job, restrict = restrict }) end,
									icon = "fas fa-cogs",
									label = Loc[Config.Lan]["stores"].browse,
									job = loc.job
								},
							}
							if b.prop then
								Prop[name] = makeProp({coords = vec4(b.coords.x, b.coords.y, b.coords.z, b.coords.w), prop = "gr_prop_gr_bench_04b"}, 1, 0)
								createEntityTarget(Prop[name], options, 2.0)
							else
								Targets[name] =
								createBoxTarget({name, vec3(b.coords.x, b.coords.y, b.coords.z-1), b.w or 3.6, b.d or 0.8, { name=name, heading = b.coords.w, debugPoly=Config.System.Debug, minZ=b.coords.z-1.0, maxZ=b.coords.z+1.0 }, },
									options, 2.0)
							end
						end
					end
				end
				--Make Cash Register Locations
				if loc.payments then
					for l, b in pairs(loc.payments) do local name = "MechReceipt: "..k..l
						if l ~= "img" then
							local options = {
								{ action = function() TriggerEvent("jim-payments:client:Charge", { job = loc.job, img = loc.payments.img }) end, icon = "fas fa-credit-card", label = Loc[Config.Lan]["payments"].charge, job = loc.job, },
								(Config.General.showClockInTill and { action = function() toggleDuty() end, job = loc.job, gang = loc.gang, icon = "fas fa-user-check", label = "Duty Toggle", } or nil),
								(Config.General.showBossMenuTill and { action = function() TriggerEvent("qb-bossmenu:client:OpenMenu") end, job = loc.job and bossroles, gang = loc.gang and bossroles, icon = "fas fa-list", label = "Open Bossmenu", } or nil),
							}
							if b.prop then
								Prop[name] = makeProp({prop = "prop_till_03", coords = vec4(b.coords.x, b.coords.y, b.coords.z+1.03, b.coords.w+180.0)}, 1, false)
								createEntityTarget(Prop[name], options, 2.0)
							else
								Targets[name] =
								createBoxTarget({name, vec3(b.coords.x, b.coords.y, b.coords.z), (b.w or 0.5), (b.d or 0.5), { name=name, heading = b.coords.w, debugPoly=Config.System.Debug, minZ=b.coords.z-0.1, maxZ=b.coords.z+0.4 },},
									options, 2.0 )
							end
						end
					end
				end
				--Make Mechanic Stash locations
				if loc.stash then
					for l, b in pairs(loc.stash) do local name = "MechSafe: "..k..l
						local options = {
							{ action = function()
								openStash({ job = loc.job, stash = repairStashName, stashOptions = { slots = 50, maxweight = 400000 }} ) end,
								icon = "fas fa-cogs",
								label = Loc[Config.Lan]["repair"].browse,
								job = loc.job
							},
						}
						if b.prop then
							Prop[name] = makeProp({coords = vec4(b.coords.x, b.coords.y, b.coords.z, b.coords.w), prop = "prop_ld_int_safe_01"}, 1, 0)
							createEntityTarget(Prop[name], options, 2.0)
						else
							Targets[name] =
							createBoxTarget({name, vec3(b.coords.x, b.coords.y, b.coords.z), b.w or 3.6, b.d or 0.8, { name=name, heading = b.coords.w, debugPoly=Config.System.Debug, minZ=b.coords.z-0.1, maxZ=b.coords.z+1.0 },},
								options, 2.0 )
						end
					end
				end
				--Make Manual Clockin locations
				if loc.clockin then
					for l, b in pairs(loc.clockin) do local name = "MechClock: "..k..l
						if type(b) ~= "boolean" then
							if loc.job then
								if Jobs and not Jobs[loc.job] then print("^5Debug^7: ^1Can't find the job ^7'^6"..loc.job.."^7' ^1in the core shared files^7") else
									local options = {
										{ action = function() toggleDuty() end, icon = "fas fa-clipboard", label = "Duty Toggle", job = loc.job },
										{ action = function() TriggerEvent("qb-bossmenu:client:OpenMenu") end, icon = "fas fa-list", label = "Open Bossmenu", job = loc.job and bossroles, gang = loc.gang and bossroles, },
									}
									if b.prop then
										Prop[name] = makeProp({prop = "prop_laptop_01a", coords = vec4(b.coords.x, b.coords.y, b.coords.z+1.03, b.coords.w+180.0)}, 1, false)
										createEntityTarget(Prop[name], options, 2.0)
									else
										Targets[name] =
										createBoxTarget({name, b.coords.xyz, (b.w or 0.45), (b.d or 0.4), { name=name, heading = b.coords.w, debugPoly=Config.System.Debug, minZ=b.coords.z-0.1, maxZ=b.coords.z+0.4 }}, options, 2.0)
									end
								end
							end
						end
					end
				end

				--NosRefill Locations
				if loc.nosrefill and not Config.Overrides.disableNos then
					for l, b in pairs(loc.nosrefill) do local name = "MechNos: "..k..l
						local options = {
							{ action = function() TriggerEvent("jim-mechanic:client:NosRefill", { coords = b.coords, tank = Prop[name], society = loc.job }) end, item = "noscan", icon = "fas fa-gauge-high", label = "NOS ($"..Config.NOS.NosRefillCharge..")", },
						}
						Prop[name] = makeProp({prop = "prop_byard_gastank02", coords = vec4(b.coords.x, b.coords.y, b.coords.z, b.coords.w+180.0)}, 1, false)
						createEntityTarget(Prop[name], options, 2.0)
					end
				end


				if loc.carLift and Config.CarLifts.Enable == true then
					for l, b in pairs(loc.carLift) do local name = "MechLift: "..k..l
						local options = {
							[1] = { action = function() TriggerEvent("jim-mechanic:client:lift", { num = 1, lift = name, dir = "up", sound = Config.CarLifts.Sound, location = Config.Locations[k].designatedName }) end, icon = "fas fa-gauge-high", label = "UP", },
							[2] = { action = function() TriggerEvent("jim-mechanic:client:lift", { num = 2, lift = name, dir = "down", sound = Config.CarLifts.Sound, location = Config.Locations[k].designatedName }) end, icon = "fas fa-gauge-high", label = "DOWN", },
						}
						if b.use or b.useMLOLift then
							local currentPylons, currentLift, targetOffset = 0, 0, nil
							for k, v in pairs(Config.CarLifts.CarLiftUse) do
								currentPylons = GetClosestObjectOfType(b.coords.x, b.coords.y, b.coords.z, 4.0, k, false, 0, 0)
								currentLift = GetClosestObjectOfType(GetEntityCoords(currentPylons), 3.0, v.lift, false, 0, 0)
								targetOffSet = GetOffsetFromEntityInWorldCoords(currentPylons, v.offset)
								if Config.System.Debug then print(currentPylons, currentLift) end
								if currentPylons ~= 0 then break end
							end
							if currentPylons ~= 0 and currentLift ~= 0 then
								if GetEntityCoords(currentLift).z >= GetEntityCoords(currentPylons).z+2.1 then
									local coords = GetEntityCoords(currentLift) SetEntityCoords(currentLift, coords.x, coords.y,  GetEntityCoords(currentPylons).z+2.1) end
								lift[name] = { lift = currentLift,
									loc = (GetEntityCoords(currentPylons).z == GetEntityCoords(currentLift).z) and "down" or "up",
									moving = false, bottom = GetEntityCoords(currentPylons).z, top = GetEntityCoords(currentPylons).z + 2.1
								}
								removeEntityTarget(currentPylons)
								createEntityTarget(currentPylons, options, 2.0)
							end
						else
							if lift[name] == nil then
								for _, v in pairs(Config.CarLifts.CarLiftModelReplace) do CreateModelHide(b.coords.x, b.coords.y, b.coords.z, 3.0, v, true) end
								Prop[name.."pylon"] = makeProp({prop = "carlift_pylons", coords = vec4(b.coords.x, b.coords.y, b.coords.z, b.coords.w+90.0)}, 1, false)
								--local targetOffSet = GetOffsetFromEntityInWorldCoords(Prop[name.."pylon"], -0.2, -1.6, 0.0)
								Prop[name.."lift"] = makeProp({prop = "carlift_frame", coords = vec4(b.coords.x, b.coords.y, b.coords.z, b.coords.w+90.0)}, 1, false)
								lift[name] = { lift = Prop[name.."lift"], loc = "down", moving = false, bottom = GetEntityCoords(Prop[name.."lift"]).z, top = GetEntityCoords(Prop[name.."lift"]).z + 2.1 }
								createEntityTarget(Prop[name.."pylon"], options, 2.0)
							end
						end
					end
					TriggerServerEvent("jim-mechanic:server:lift:SendSync")
				end
			end,
			onExit = function()
				inLocation = ""
				if Config.System.Debug then print("^5Debug^7: ^3Exited ^2Mech Zone^7: (^6"..Config.Locations[k].designatedName.."^7)") end
				if Config.Previews.PreviewLocation then inpreview = false end
				if Config.Main.JobLocationRequired then
					if loc.job ~= nil and hasJob(loc.job) then
						if loc.autoClock.exit and onDuty then
							toggleDuty()
						end
					end
				end

				if Config.StoreCraft.Crafting then
					if loc.crafting then
						for l, b in pairs(loc.crafting) do local name = "MechCraft: "..k..l
							if b.prop then
								if Prop[name] ~= nil then
									destroyProp(Prop[name])
									removeEntityTarget(Prop[name])
								end
							else
								removeZoneTarget(Targets[name])
							end
						end
					end
				end

				if Config.StoreCraft.Stores then
					if loc.store then
						for l, b in pairs(loc.store) do local name = "MechStore: "..k..l
							if b.prop then
								destroyProp(Prop[name])
								removeEntityTarget(Prop[name])
							else
								removeZoneTarget(Targets[name])
							end
						end
					end
				end

				--Make Cash Register Locations
				if loc.payments then
					for l, b in pairs(loc.payments) do local name = "MechReceipt: "..k..l
						if l ~= "img" then
							if b.prop then
								destroyProp(Prop[name])
								removeEntityTarget(Prop[name])
							else
								removeZoneTarget(Targets[name])
							end
						end
					end
				end

				--Make Mechanic Stash locations
				if loc.stash then
					for l, b in pairs(loc.stash) do local name = "MechSafe: "..k..l
						if b.prop then
							destroyProp(Prop[name])
							removeEntityTarget(Prop[name])
						else
							removeZoneTarget(Targets[name])
						end
					end
				end

				--Make Manual Clockin locations
				if loc.clockin then
					for l, b in pairs(loc.clockin) do local name = "MechClock: "..k..l
						if type(b) ~= "boolean" then
							if loc.job then
								if b.prop then
									destroyProp(Prop[name])
									removeEntityTarget(Prop[name])
								else
									removeZoneTarget(Targets[name])
								end
							end
						end
					end
				end

				--NosRefill Locations
				if loc.nosrefill and not Config.Overrides.disableNos then
					for l, b in pairs(loc.nosrefill) do local name = "MechNos: "..k..l
						destroyProp(Prop[name])
						removeEntityTarget(Prop[name])
					end
				end
			end,
			debug = Config.System.Debug
		})
		--Manual Repair Bench
		if loc.manualRepair then
			for l, b in pairs(loc.manualRepair) do local name = "RepairBench: "..k..l
				local options = {
					{ action = function() TriggerEvent("jim-mechanic:client:Manual:Menu", { society = loc.job }) end, icon = "fas fa-cogs", label = Loc[Config.Lan]["police"].userepair, },
				}
				if b.prop then
					Prop[name] = makeProp({coords = vec4(b.coords.x, b.coords.y, b.coords.z-1.37, b.coords.w), prop = type(b.prop) == "boolean" and "gr_prop_gr_bench_03a" or b.prop}, 1, 0)
					createEntityTarget(Prop[name], options, 5.0 )
				else
					Targets[name] =
					createBoxTarget({name, vec3(b.coords.x, b.coords.y, b.coords.z-1), (b.w or 1.2), (b.d or 4.2), { name=name, heading = b.coords.w, debugPoly=Config.System.Debug, minZ=b.coords.z-1, maxZ=b.coords.z+0.4 },},
						options, 5.0 )
				end
			end
		end
		--Blip Creation
		if loc.blip then
			local blip = loc.blip
			if Config.Main.LocationBlips then
				makeBlip({
					coords = blip.coords,
					sprite = blip.sprite or 446,
					col = blip.color,
					scale = blip.scale,
					disp = blip.disp,
					category = blip.cat,
					name = blip.label,
					preview = (blip.previewImg and blip.previewImg) or (loc.payments.img and loc.payments.img) or nil,
				})
			end
		end
		if loc.garage then TriggerServerEvent("jim-jobgarage:server:syncAddLocations", { job = loc.job, garage = loc.garage }) end

	end  end
	locsCreated = true
end

--[[
--Thread for finding locations of existing pylons/lifts
CreateThread(function()
	local objects = GetGamePool('CObject')
	for i = 1, #objects, 1 do
		if GetEntityModel(objects[i]) == `imp_prop_impexp_postlift` then
			local coords = GetOffsetFromEntityInWorldCoords(objects[i], 0.0, 1.5, 0.0)
			local heading = GetEntityHeading(objects[i])-90
			coords = vec4(coords.x, coords.y, coords.z, heading)
			--Prop[#Prop+1] = makeProp({prop = "prop_fnclink_06gatepost", coords = coords }, 1, false)
			print("{ coords = "..coords.." },")
			Wait(1000)
		end
	end
end)
]]

----- CRAFTING STUFF -------
RegisterNetEvent('jim-mechanic:client:Crafting:Menu', function(data)
	local Menu = {}
	local restrictionTable = {}
	if data.restrict then for i = 1, #data.restrict do restrictionTable[data.restrict[i]] = true end end
	if data.restrict and not restrictionTable["tools"] then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["crafting"].toolheader, txt = #Crafting.Tools.Recipes..Loc[Config.Lan]["crafting"].numitems,
			onSelect = function()
				craftingMenu({ job = data.job, craftable = Crafting.Tools, coords = data.coords.xyz, stashName = data.stashName, onBack = function() TriggerEvent("jim-mechanic:client:Crafting:Menu", data) end, })
			end,
		} end
	if data.restrict and not restrictionTable["repairs"] then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["crafting"].repairheader, txt = #Crafting.Repairs.Recipes..Loc[Config.Lan]["crafting"].numitems,
			onSelect = function()
				craftingMenu({ job = data.job, craftable = Crafting.Repairs, coords = data.coords.xyz, stashName = data.stashName, onBack = function() TriggerEvent("jim-mechanic:client:Crafting:Menu", data) end, })
			end,
		} end
	if data.restrict and not restrictionTable["perform"] then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["crafting"].performheader, txt = #Crafting.Perform.Recipes..Loc[Config.Lan]["crafting"].numitems,
			onSelect = function()
				craftingMenu({ job = data.job, craftable = Crafting.Perform, coords = data.coords.xyz, stashName = data.stashName, onBack = function() TriggerEvent("jim-mechanic:client:Crafting:Menu", data) end, })
			end,
		} end
	if data.restrict and not restrictionTable["cosmetics"] then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["crafting"].cosmetheader, txt = #Crafting.Cosmetic.Recipes..Loc[Config.Lan]["crafting"].numitems,
			onSelect = function()
				craftingMenu({ job = data.job, craftable = Crafting.Cosmetic, coords = data.coords.xyz, stashName = data.stashName, onBack = function() TriggerEvent("jim-mechanic:client:Crafting:Menu", data) end, })
			end,
		} end
	if data.restrict and not restrictionTable["nos"] and not Config.Overrides.disableNos then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["crafting"].nosheader, txt = #Crafting.Nos.Recipes..Loc[Config.Lan]["crafting"].numitems,
			onSelect = function()
				craftingMenu({ job = data.job, craftable = Crafting.Nos, coords = data.coords.xyz, stashName = data.stashName, onBack = function() TriggerEvent("jim-mechanic:client:Crafting:Menu", data) end, })
			end,
		} end
    openMenu(Menu, { header = Loc[Config.Lan]["crafting"].menuheader, canClose = true, })
	lookEnt(data.coords)
end)

------ Nos Refill -------
local refilling = false
RegisterNetEvent('jim-mechanic:client:NosRefill', function(data) local Ped = PlayerPedId()
	if refilling then return end local cash = 0
	if GetResourceState(OXInv):find("start") then
		if hasItem("money", Config.NOS.NosRefillCharge) then
			cash = Config.NOS.NosRefillCharge
		end
	else
		cash = getPlayer().Cash
	end
	if cash >= Config.NOS.NosRefillCharge then
		refilling = true
		local coords = GetOffsetFromEntityInWorldCoords(data.tank, 0, 0.5, 0.02)
		local prop = makeProp({prop = "v_ind_cs_gascanister", coords = vec4(coords.x, coords.y, coords.z+1.03, GetEntityHeading(data.tank))}, 1, 1)
		local cam = createTempCam(Ped, GetEntityCoords(prop))
		lookEnt(coords)
		--if not IsPedHeadingTowardsPosition(Ped, coords, 20.0) then TaskTurnPedToFaceCoord(Ped, coords, 1500) Wait(1500) end
		if #(coords - GetEntityCoords(Ped)) > 1.3 then TaskGoStraightToCoord(Ped, coords, 0.5, 400, 0.0, 0) Wait(400) end

		UseParticleFxAssetNextCall('core')
		local gas = StartParticleFxLoopedOnEntity('ent_sht_steam', prop, 0.02, 0.00, 0.42, 0.0, 0.0, 0.0, 0.1, 0, 0, 0)
		if progressBar({label = "Refilling "..Items["nos"].label, time = 7000, cancel = true, task = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", cam = cam }) then
			qblog("Purchased a NOS refill")
			TriggerServerEvent("jim-mechanic:chargeCash", Config.NOS.NosRefillCharge, data.society)
			removeItem("noscan", 1)
			addItem( "nos", 1)
		end
		DeleteObject(prop)
		emptyHands(Ped)
		StopParticleFxLooped(gas)
		prop = nil gas = nil
		refilling = false
	else
		triggerNotify(nil, "Not enough cash", "error") return
	end
end)

------ Store Stuff ------
-- Menu to pick the store
RegisterNetEvent('jim-mechanic:client:Store:Menu', function(data)
	lookEnt(data.coords)
	local Menu = {}
	local restrictionTable = {}
	if data.restrict then for i = 1, #data.restrict do restrictionTable[data.restrict[i]] = true end end
	if data.restrict and not restrictionTable["nos"] and not Config.Overrides.disableNos then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["stores"].nos,
			onSelect = function()
				openShop({ shop = "nosShop", items = Stores.NosItems, job = data.job })
			end,
		} end
	if data.restrict and not restrictionTable["tools"] then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["stores"].tools, onSelect = function()
			openShop({ shop = "toolShop", items = Stores.ToolItems, job = data.job })
		end,
	} end
	if data.restrict and not restrictionTable["repairs"] then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["stores"].repairs,
		onSelect = function()
			openShop({ shop = "repairShop", items = Stores.RepairItems, job = data.job })
		end,
	} end
	if data.restrict and not restrictionTable["perform"] then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["stores"].perform,
		onSelect = function()
			openShop({ shop = "performShop", items = Stores.PerformItems, job = data.job })
		end,
	} end
	if data.restrict and not restrictionTable["cosmetics"] then else
		Menu[#Menu + 1] = { arrow = true, header = Loc[Config.Lan]["stores"].cosmetic,
		onSelect = function()
			openShop({ shop = "cosmeticShop", items = Stores.CosmeticItems, job = data.job })
		end,
	} end
	openMenu(Menu, { header = Loc[Config.Lan]["crafting"].menuheader, onExit = function() end, })
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	emptyHands(PlayerPedId())
	unloadModel("carlift_pylons")
	unloadModel("carlift_frame")
	for k in pairs(Prop) do DeleteEntity(Prop[k]) end
	for k in pairs(Targets) do removeZoneTarget(k) end
end)