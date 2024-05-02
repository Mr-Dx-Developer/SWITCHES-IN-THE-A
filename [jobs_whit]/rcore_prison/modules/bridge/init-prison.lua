function GetSharedObjectSafe()
	local promise_ = promise:new()
	local object = nil

	local resourceName = Prison.FrameworkTriggers.resourceName ~= '' and Prison.FrameworkTriggers.resourceNam

	if Prison.Framework == 1 and IsScriptLoaded('es_extended') or IsScriptLoaded('es_extended') or (Prison.Framework == 1 and resourceName and IsScriptLoaded(resourceName)) then
		xpcall(function()
			object = exports[resourceName or 'es_extended']['getSharedObject' or 'GetSharedObject' or 'getSharedObject']()
			promise_:resolve(object)
		end, function(error)
			local ESX = nil
			local tries = 3

			LoadEsx = function()
				if tries == 0 then
					dbg.debug(
					"Could not load any Es_extended object you need to correct the event name or change export name!")
					return
				end

				tries = tries - 1

				if ESX == nil then
					SetTimeout(100, LoadEsx)
				end

				TriggerEvent(Prison.FrameworkTriggers.object, function(obj)
					ESX = obj
				end)
			end

			LoadEsx()

			object = ESX
			promise_:resolve(object)
		end)
	end

	if Prison.Framework == 2 and IsScriptLoaded('qb-core') or IsScriptLoaded('qb-core') or (Prison.Framework == 2 and resourceName and IsScriptLoaded(resourceName)) then
		xpcall(function()
			object = exports[resourceName or 'qb-core']['GetCoreObject']()
			promise_:resolve(object)
		end, function(error)
			xpcall(function()
				object = exports[resourceName or 'qb-core']['GetSharedObject']()
				promise_:resolve(object)
			end, function(error)
				local QBCore = nil
				local tries = 3

				LoadQBCore = function()
					if tries == 0 then
						dbg.debug(
						"Could not load any QB-Core object you need to correct the event name or change export name!")
						return
					end

					tries = tries - 1

					if QBCore == nil then
						SetTimeout(100, LoadQBCore)
					end

					TriggerEvent(Prison.FrameworkTriggers.object, function(obj)
						QBCore = obj
					end)
				end

				LoadQBCore()

				object = QBCore
				promise_:resolve(object)
			end)
		end)
	end

	if Prison.Framework == 0 or not Prison.Framework then
		promise_:resolve(object)
	end

	Citizen.Await(promise_)

	return object or {}
end

GetSupportedPhone = function()
	local retval = nil

	if IsScriptLoaded('gksphone') then
		retval = 'gksphone'
	elseif IsScriptLoaded('gcphone') then
		retval = 'gcphone'
	elseif IsScriptLoaded('qb-phone') then
		retval = 'qb-phone'
	elseif IsScriptLoaded('npwd') then
		retval = 'npwd'
	elseif IsScriptLoaded('high-phone') then
		retval = 'high-phone'
	elseif IsScriptLoaded('qs-smartphone') then
		retval = 'qs-smartphone'
	elseif IsScriptLoaded('lb-phone') then
		retval = 'lb-phone'
	end

	return retval
end

-- DONT TOUCH THIS !!!
-- DONT TOUCH THIS !!!
-- DONT TOUCH THIS !!!

shared = {
	data = {},
	preset = nil,
	phone = GetSupportedPhone(),
	SQL = 'unk',
	inventory = 'unk',
	framework = 'unk',
	interaction = 'unk',
}

CreateThread(function()
	local retval = {
		name = nil,
		data = {}
	}

	for resourceName, resourcePreset in pairs(Prison.Presets.Maps) do
		if IsScriptLoaded(resourceName) then
			retval.name, retval.data = resourcePreset, getInteriorData(resourcePreset)
			break
		end
	end

	if not retval.data or not retval.name then
		retval.name = 'standalone'
		retval.data = getInteriorData('standalone')
	end

	if not retval.name then
		return warn(('Failed to load prison preset file, see config for supported maps or add own one.'))
	else
		if shared.preset == 'gabz' then
			if not IsScriptLoaded('rcore_prison_models_gabz') then
				dbg.info(
				'Detected GABZ prison, but for Cigarette production, its required to load [rcore_prison_models_gabz]')
			end
		end

		shared.preset, shared.data = retval.name, retval.data
	end
end)


function getInteriorData(name)
	local file = ('data/presets/%s.lua'):format(name)
	local datafile = LoadResourceFile(GetCurrentResourceName(), file)
	local path = ('@@%s/%s'):format(GetCurrentResourceName(), file)

	if not datafile then
		return {}
	end

	local func, err = load(datafile, path)

	if not func or err then
		---@diagnostic disable-next-line: return-type-mismatch
		return warn('Failed to fetch interior data!')
	end

	return func()
end

if IsDuplicityVersion() then
	Bridge = {
		JailStates = {
			['jailed'] = true,
			['cw'] = true,
		}
	}


	ContactPrisonersFriends = function(serverId)
		local player = Bridge.GetPlayer(serverId)

		if not player then
			return -- WIP
		end
	end

	SyncZones = function(source)
		if pastAreas and Utils.tablesize(pastAreas) > 0 then
			dbg.debug('Found zones to resync for you. [%s]', GetPlayerName(source))

			for idx, v in pairs(Zones.vertGroups) do
				TriggerClientEvent('rcore_prison:registerZoneForTarget', source, source, {
					models = Zones.models,
					zones = Zones.vertGroups[idx],
					idx = idx,
				})
			end
		else
			dbg.debug('Nothing resync was find. [%s]', GetPlayerName(source))
		end
	end

	InternalCharacterLoaded = function(source, loadType)
		local player = Bridge.GetPlayer(source)

		if not player then
			return
		end

		ContactPrisonersFriends(source)

		local charId = player.charid

		local prisoner = GetPrisonerData(charId)

		if not prisoner then
			return
		end

		local time = GetPrisonerTimeLeft(charId)

		if not time then
			return
		end

		if CanPrisonerBeReleased(charId) then
			dbg.debug('Prisoner named [%s] was released with SID [%s]', prisoner.prisonerName, source)
			-- Note: It takes a while for loading ox user on last position. (1 sec prox)
			if shared.framework == 'OX' then
				SetTimeout(1000, function()
					ReleasePrisonerInFrontOfPrison(source, charId)
				end)
			else
				ReleasePrisonerInFrontOfPrison(source, charId)
			end
		else
			if prisoner.serverId == nil then
				prisoner.serverId = source
			end

			local prisonAccount = GetPrisonerAccount(player.charid)

			if prisonAccount then
				LevelDebug(3, 'Syncing accounts for user [%s]', prisoner.prisonerName)
				SyncAccountData(source, prisonAccount)
				cfxSetState(prisoner.serverId, 'PrisonAccount', prisonAccount)
			end

			local label = nil
			local idx = nil

			if prisoner.state == 'jailed' then
				label = l('PRISONER_WELCOME_BACK') .. ' [' .. SecondsToClock(time) .. ']'
			else
				idx = getUserCW(source)
				label = l('CW_WELCOME_BACK') .. ' [' .. time .. ']'

				if CWUsers[idx] and CWUsers[idx].position then
					TriggerClientEvent('rcore_prison:setBlipWaypoint', source, source, {
						coords = CWUsers[idx].position,
						name = l('COMMUNITY_SERVICE_BLIP_LABEL'),
						sprite = 652,
						scale = 0.8,
						color = 0,
						type = 'cw'
					})
				end

				Bridge.HandleAutoJailTimeout(source)
			end

			if prisoner.state == 'jailed' then
				GlobalState[('%s:count'):format('Prisoners')] = Utils.tablesize(Prisoners)
			end

			TriggerClientEvent('rcore_prison:playerLoaded', source, prisoner)

			Bridge.HandleCuffs(source)

			Bridge.Notify(source, {
				title = l('WARDEN_TITLE'),
				subtitle = l('PRISON_TITLE'),
				description = label,
			})

			SetPrisonerJailTime(source, time, 'restore', prisoner.state)
			HandleOnlineSentence('init', source, time)

			LevelDebug(3, 'User cannot be released [%s] with SID [%s] | %s', prisoner.prisonerName, source,
				prisoner.state)
		end
	end

	NotifyActivities = function()
		local retval = nil

		for jobId, v in pairs(PrisonerJobs) do
			if v.state == 'WAITING' then
				retval = v.name
				break
			end
		end

		if retval == nil then
			retval = 'none'
		end

		return retval
	end

	AddEventHandler('rcore_prison:prisonerState', function(data)
		local data = data
		local state = data and data.state or nil
		local playerId = data.serverId

		if state == 'released' then
			Bridge.HandleCuffs(data.serverId)
			dbg.debug('Prisoner [%s] was released from Prison with SID [%s]', data.userName, playerId)
		elseif state == 'jailed' then
			local jobName = NotifyActivities()

			Bridge.HandleCuffs(playerId)

			if jobName then
				Bridge.Notify(playerId, {
					title = l('WARDEN_TITLE'),
					subtitle = l('PRISON_TITLE'),
					description = l('FREE_JOB_LABEL') .. jobName,
					position = 'top',
					lenght = 4000,
					style = {
						backgroundColor = '#141517',
						color = '#909296'
					}
				})
			end

			dbg.debug('Prisoner [%s] was put in prison with SID [%s] in place [%s]', data.prisoner.name,
				data.serverId, data.prisoner.cellId)
		end
	end)

	if Prison.Commands.State then
		if Prison.CS.ModuleState then
			RegisterCommand(Prison.Commands.startcs, function(source, args, rawCommand)
				local arg = args

				local target = tonumber(arg[1])
				local perollNumber = tonumber(arg[2])
				local perollReason = tostring(arg[3])

				if not Bridge.IsUserAllowedToPerform(source, Prison.Commands.startcs) then
					return Bridge.Notify(source, {
						title = '/startcs',
						subtitle = l('PRISON_TITLE'),
						description = l('JOB_CHECK_REQUIREMENT'),
						position = 'top',
						lenght = 4000,
						style = {
							backgroundColor = '#141517',
							color = '#909296'
						},
					})
				end

				if not perollNumber then
					perollNumber = Prison.CS.DefaultPeroll
				end

				if perollNumber and perollNumber > 0 and target and GetPlayerPed(target) > 0 then
					TriggerEvent('rcore_prison:startSentence', {
						issuedBy = {
							serverId = source
						},
						target = {
							serverId = target,
							time = perollNumber,
							state = 'cw',
							reason = perollReason,
						}
					})
				else
					Bridge.Notify(source, {
						title = '/jail',
						subtitle = l('PRISON_TITLE'),
						description = l('COMMAND_SPECIFY_TARGET'),
						position = 'top',
						lenght = 4000,
						style = {
							backgroundColor = '#141517',
							color = '#909296'
						},
					})
				end
			end)
		end


		function isPrisonerAtGuard(copSID, targetSID)
			if not copSID then
				return false
			end

			if not targetSID then
				return false
			end

			if not Prison.CheckJailCommandDist then
				return true
			end

			local retval = false

			local mePed = GetPlayerPed(copSID)
			local targetPed = GetPlayerPed(targetSID)

			local meCoords = GetEntityCoords(mePed)
			local targetCoords = GetEntityCoords(targetPed)

			local dist = #(targetCoords - meCoords)

			if dist <= Prison.PrisonerJailCheckDist then
				retval = true
			end

			if copSID == targetSID then
				retval = true
			end

			return retval
		end

		RegisterCommand(Prison.Commands.Dashboard, function(source, args, rawCommand)
			local player = Bridge.GetPlayer(source)

			if not Bridge.IsUserAllowedToPerform(source, Prison.Commands.Dashboard) then
				return Bridge.Notify(source, {
					title = '/jail',
					subtitle = l('PRISON_TITLE'),
					description = l('JOB_CHECK_REQUIREMENT'),
					position = 'top',
					lenght = 4000,
					style = {
						backgroundColor = '#141517',
						color = '#909296'
					},
				})
			end

			local data = {
				name = player.name,
				job = {
					grade = player.job and player.job.grade or 'Unk',
					grade_label = player.job and player.job.grade_label or 'Unk',
					name = player.job and player.job.name or 'Unk'
				}
			}

			TriggerClientEvent('rcore_prison:openApp', source, source, data)
		end)


		RegisterCommand(Prison.Commands.Jail, function(source, args, rawCommand)
			local arg = args
			local serverId = source

			local target = tonumber(arg[1])
			local time = tonumber(arg[2])
			local jailReason = tostring(arg[3])

			if jailReason == nil then
				jailReason = 'unspecified'
			end

			if not Bridge.IsUserAllowedToPerform(serverId, Prison.Commands.Jail) then
				return Bridge.Notify(serverId, {
					title = '/jail',
					subtitle = l('PRISON_TITLE'),
					description = l('JOB_CHECK_REQUIREMENT'),
					position = 'top',
					lenght = 4000,
					style = {
						backgroundColor = '#141517',
						color = '#909296'
					},
				})
			end

			if time and time > 0 and target then
				if GetPlayerPed(target) > 0 then
					if isPrisonerAtGuard(serverId, target) then
						TriggerEvent('rcore_prison:startSentence', {
							issuedBy = {
								serverId = serverId
							},
							target = {
								serverId = target,
								time = time,
								state = 'jailed',
								reason = jailReason,
							}
						})
					else
						Bridge.Notify(source, {
							title = '/jail',
							subtitle = l('PRISON_TITLE'),
							description = l('PRISONER_FAR_AWAY'),
							position = 'top',
							lenght = 4000,
							style = {
								backgroundColor = '#141517',
								color = '#909296'
							},
						})
					end
				else
					Bridge.Notify(source, {
						title = '/jail',
						subtitle = l('PRISON_TITLE'),
						description = l('USER_NOT_ONLINE'),
						position = 'top',
						lenght = 4000,
						style = {
							backgroundColor = '#141517',
							color = '#909296'
						},
					})
				end
			else
				Bridge.Notify(source, {
					title = '/jail',
					subtitle = l('PRISON_TITLE'),
					description = l('COMMAND_SPECIFY_TARGET'),
					position = 'top',
					lenght = 4000,
					style = {
						backgroundColor = '#141517',
						color = '#909296'
					},
				})
			end
		end, false)

		RegisterCommand(Prison.Commands.Unjail, function(source, args, rawCommand)
			local arg = args
			local serverId = source

			local target = tonumber(arg[1])

			if target == 'me' then
				target = tonumber(source)
			end

			if not Bridge.IsUserAllowedToPerform(serverId, Prison.Commands.Unjail) then
				return Bridge.Notify(serverId, {
					title = '/unjail',
					subtitle = l('PRISON_TITLE'),
					description = l('JOB_CHECK_REQUIREMENT'),
					position = 'top',
					lenght = 4000,
					style = {
						backgroundColor = '#141517',
						color = '#909296'
					},
				})
			end

			local player = Bridge.GetPlayer(target)

			if not player then
				return
			end

			local prisonerData = GetPrisonerData(player.charid)

			if not prisonerData then
				Bridge.Notify(serverId, {
					title = '/unjail',
					subtitle = l('PRISON_TITLE'),
					description = l('UNJAIL_REQUIRED_JAILED_USER'),
					position = 'top',
					lenght = 4000,
					style = {
						backgroundColor = '#141517',
						color = '#909296'
					},
				})

				return
			end

			if target and GetPlayerPed(target) > 0 then
				ReleasePrisonerInFrontOfPrison(target, player.charid)
			else
				Bridge.Notify(serverId, {
					title = '/unjail',
					subtitle = l('PRISON_TITLE'),
					description = l('COMMAND_SPECIFY_TARGET'),
					position = 'top',
					lenght = 4000,
					style = {
						backgroundColor = '#141517',
						color = '#909296'
					},
				})
			end
		end, false)
	else
		return dbg.debug('You need to hook event [rcore_prison:startSentence] for script usage.')
	end

	Bridge.GetItem = function()
		return dbg.debug('[GetItem] You need to hook own inventory for this function.')
	end

	Bridge.RemoveItem = function()
		return dbg.debug('[RemoveItem] You need to hook own inventory for this function.')
	end

	Bridge.AddItem = function()
		return dbg.debug('[AddItem] You need to hook own inventory for this function.')
	end

	Bridge.GetInventoryItems = function()
		return dbg.debug('[GetInventoryItems] You need to hook own inventory for this function.')
	end

	Bridge.ReturnPrisonerItems = function(serverId, charId)
		return dbg.debug('[ReturnPrisonerItems] You need to hook own inventory for this function.')
	end

	Bridge.TakePrisonerItems = function(serverId, charId)
		return dbg.debug('[TakePrisonerItems] You need to hook own inventory for this function.')
	end

	Bridge.Notify = function(serverId, data)
		return
	end

	Bridge.GetPlayer = function(serverId)
		return dbg.debug('[GetPlayer] You need to hook own notify for this function.')
	end

	Bridge.IsUserAllowedToPerform = function(serverId)
		return dbg.debug('[IsUserAllowedToPerform] You need to hook into your framework.')
	end

	Bridge.TransferCreditToMoney = function(serverId, charid)
		return dbg.debug('[TransferCreditToMoney] You need to hook into your framework')
	end

	Bridge.HandleCuffs = function()
		return dbg.debug('[HandleCuffs] You need to hook HandleCuffs into your framework')
	end

	Bridge.ConvertToMinutes = function(value)
		local retval = 0

		if value and value >= 0 then
			retval = value * 60
		end

		return tonumber(retval)
	end

	Bridge.Notify = function(serverId, data)
		if Prison.Notify.DefaultNotify then
			TriggerClientEvent(Prison.Notify.event, serverId, data)
		else
			TriggerClientEvent(Prison.FrameworkTriggers.notify, serverId, data.description, data.type)
		end
	end
else
	Bridge = {}

	TASK_LABEL_MAP = {
		['canteen']           = l('CANTEEN_LABEL_INTERACT'),
		['lobby']             = l('LOBBY_LABEL_INTERACT'),
		['booth']             = l('BOOTH_LABEL_INTERACT'),
		['jobs']              = l('JOBS_LABEL_INTERACT'),
		['package_cigarette'] = l('CIGAR_PACKAGE_LABEL_INTERACT'),
		['situps']            = l('SITUPS_PACKAGE_LABEL_INTERACT'),
		['cranks']            = l('CRANKS_PACKAGE_LABEL_INTERACT'),
		['muslechin']         = l('MUSLECHIN_PACKAGE_LABEL_INTERACT'),
		['account']           = l('ACCOUNT_CREATE_LABEL_INTERACT')
	}


	Suggestions = {
		State = Prison.Commands.Suggestions,
		Commands = {
			['startcs_command']   = {
				command_label = l('COMMAND_STARTCS_LABEL'),
				command_desc = l('COMMAND_STARTCS_DESC'),
				params = {
					{ name = 'serverId',                             help = l('COMMAND_STARTCS_PARAM_TARGET_HELP') },
					{ name = l('COMMAND_STARTCS_PARAM_PEROLL_AMOUNT'), help = l('COMMAND_STARTCS_PARAM_PEROLL_HELP') },
				}
			},
			['jail_command']      = {
				command_label = l('COMMAND_JAIL_LABEL'),
				command_desc = l('COMMAND_JAIL_DESC'),
				params = {
					{ name = l('COMMAND_JAIL_PARAM_TARGET_LABEL'),    help = l('COMMAND_JAIL_PARAM_TARGET_DESC') },
					{ name = l('COMMAND_JAIL_PARAM_TIME_LABEL'),      help = l('COMMAND_JAIL_PARAM_TIME_DESC') },
					{ name = l('COMMAND_JAIL_PARAM_JAIL_REASON_TITLE'), help = l('COMMAND_JAIL_PARAM_JAIL_REASON_DESC') }
				}
			},
			['unjail_command']    = {
				command_label = l('COMMAND_UNJAIL_LABEL'),
				command_desc = l('COMMAND_UNJAIL_DESC'),
				params = {
					{ name = l('COMMAND_UNJAIL_PARAM_LABEL'), help = l('COMMAND_UNJAIL_PARAM_DESC') },
				}
			},
			['dashboard_command'] = {
				command_label = l('COMMAND_DASHBOARD_LABEL'),
				command_desc = l('COMMAND_DASHBOARD_DESC'),
				params = {}
			}
		},
	}

	function Bridge.getClosestPlayer(maxDist, includePlayer)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		local players = GetActivePlayers()
		local closestDistance = maxDist or 5.0
		local closestPlayer = -1

		for i = 1, #players, 1 do
			local playerId = players[i]

			if (playerId ~= PlayerId() or includePlayer) and playerId ~= -1 then
				local pos = GetEntityCoords(GetPlayerPed(playerId))
				local distance = #(pos - coords)

				if distance < closestDistance then
					closestPlayer = GetPlayerServerId(playerId)
					closestDistance = distance
				end
			end
		end

		return closestPlayer, closestDistance
	end

	function Bridge.getNearbyPlayers(coords, maxDistance, includePlayer)
		local players = GetActivePlayers()
		local nearby = {}
		local count = 0

		local maxDistance = maxDistance or 5.0

		for i = 1, #players do
			local playerId = players[i]

			if playerId ~= PlayerId() or includePlayer then
				local playerPed = GetPlayerPed(playerId)
				local playerCoords = GetEntityCoords(playerPed)
				local playerName = GetPlayerName(playerId)
				local distance = #(coords - playerCoords)

				if distance < maxDistance then
					count += 1
					nearby[count] = {
						serverId = GetPlayerServerId(playerId),
						name = Prison.Dashboard.AddSentence.ShowNames and playerName or ''
					}
				end
			end
		end

		if count <= 0 then
			dbg.debug('Failed to fetch closest players in area.')
		end

		return nearby
	end

	Bridge.RegisterCommandSuggestions = function()
		if Suggestions.State then
			for k, v in pairs(Suggestions.Commands) do
				local params = v.params or nil

				if params then
					TriggerEvent('chat:addSuggestion', v.command_label, v.command_desc, params)
				end
			end
		end
	end

	Bridge.GymAPI = function(percent, exerciseName)
		TriggerEvent('rcore_prison:client:heartbeat', {
			actionType = 'GYM',
			data = {
				percent = percent,
				exerciseName = exerciseName
			}
		})
	end

	Bridge.SetEntryOutfit = function()
		return dbg.debug('[SetEntryOutfit] You need to hook into your clothing script')
	end

	Bridge.ResetPrisoner = function(data, state)
		Bridge.HandleResetPrisoner(data, state)

		Prisoner = {}

		ActiveState = false

		DisplayRadar(true)

		ClearAllHelpMessages()
		BusyspinnerOff()

		NetworkEndTutorialSession()

		ClearInterval('jail_time')
		ClearInterval('jail_activity')

		SetTimeout(2000, function()
			ClearInterval('jail_time')
			ClearInterval('jail_activity')

			NetworkEndTutorialSession()

			ClearAllHelpMessages()
			BusyspinnerOff()
		end)
	end


	Bridge.HandleCloseMenuInterval = function(place)
		SetInterval('target_menu_interval', Prison.Target.CheckMenuDistInterval, function()
			local plyPed = PlayerPedId()
			local plyCoords = GetEntityCoords(plyPed)

			local place = place
			local dist = glm.distance(place, plyCoords)

			if dist >= Prison.Target.CheckMenuDist then
				Frontend:CloseMenu()
				ClearInterval('target_menu_interval')
			end
		end)
	end

	AddEventHandler('rcore_prison:performTask', function(received)
		local taskData = received.taskData
		local taskType = taskData and taskData.task.type or nil
		local idx = taskData and taskData.idx or nil

		if idx then
			CLOSEST_PLACE = idx
		end

		if taskData then
			SetInteractionByType(taskType, taskData.task)

			if taskType ~= 'gym' then
				Bridge.HandleCloseMenuInterval(taskData.task.coords)
			end
		end
	end)

	Bridge.BlockPool = function()
		local radiusSize = 20.0
		local centerPoint = vec3(1643.163086, 2529.749756, 45.564835)
		local prisonMin, prisonMax = vec3(1265.648, 2346.0022, 36.56355), vec3(1955.37378, 2837.94, 72.65112)

		ClearAreaOfPeds(centerPoint.x, centerPoint.y, centerPoint.z, radiusSize * 10, false)

		if Prison.HandleNPCPoolState then
			if not DoesScenarioBlockingAreaExist(prisonMin, prisonMax) then
				AddScenarioBlockingArea(centerPoint - radiusSize, centerPoint + radiusSize, false, true, true, true)
				AddPopMultiplierArea(centerPoint - radiusSize, centerPoint + radiusSize, 0.0, 0.0, false)
				SetPedNonCreationArea(centerPoint - radiusSize, centerPoint + radiusSize)
				SetAllVehicleGeneratorsActiveInArea(prisonMin, prisonMax, false, false)
				ClearAreaOfPeds(centerPoint.x, centerPoint.y, centerPoint.z, radiusSize * 10, false)
			end
		end
	end

	provideExport('HandleNPCPool', GetCurrentResourceName(), Bridge.BlockPool)

	Bridge.HandlePrisonMap = function(actionType)
		if not Prison.RenderPrisonMap then return end

		dbg.debug(
		'Loading prison map, it might conflict cayo perico map if you are using it.\n Go to configs/config.lua - RenderPrisonMap and set it to false if you dont want to use it.')

		if actionType == 'init' then
			while true do
				Wait(0)
				SetRadarAsInteriorThisFrame("V_FakePrison", 1700.0, 2580.0, 0.0, 0)
				SetRadarAsExteriorThisFrame()
			end
		end
	end

	Bridge.CreateBlip = function(data)
		if not data.sprite then
			return
		end

		local blip = AddBlipForCoord(data.coords.x, data.coords.y)

		if not Blips[blip] then
			Blips[blip] = {
				type = data.type or 'unk',
				idx = blip
			}
		end

		SetBlipDisplay(blip, 4)
		SetBlipCategory(blip, 10)

		SetBlipSprite(blip, data.sprite)
		SetBlipScale(blip, data.scale)
		SetBlipColour(blip, data.color)

		SetTextFont(getFontId())

		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(data.name)
		EndTextCommandSetBlipName(blip)
	end

	fontId = 0

	function getFontId()
		return fontId
	end

	function InvokeDistanceInteract()
		Bridge.RegisterInteract()
	end

	CreateThread(function()
		collectgarbage("collect")

		if not shared.data.interaction then
			return warn('Failed to get interaction data.\n Check your preset in rcore_prison/data/presets/' ..
			shared.preset .. '.lua')
		end

		AddTextEntry('RCORE_PRISON_START_JOB', l('START_JOB'))

		RegisterFontFile('firesans')
		fontId = RegisterFontId('Fire Sans')

		dbg.debug('Setting up font named [%s]', fontId)

		if Prison.CS.ModuleState then
			local data = {}

			if Prison.CS.Blip.enable then
				data.blip = {
					state = Prison.CS.Blip.enable,
					name = l('PRISONER_CS_LABEL'),
					sprite = Prison.CS.Blip.sprite or 643,
					scale = Prison.CS.Blip.scale or 1.0,
					color = 0,
				}
			end

			data.npc = {
				model = Prison.CS.NPC.model,
				heading = Prison.CS.NPC.heading,
				anim = nil
			}

			data.marker = {
				renderState = false,
				rgba = vec4(255, 255, 255, 255),
				size = vec3(0.5, 0.5, 0.5),
				type = 0
			}

			data.coords = Prison.CS.Place
			data.type = 'community_service'
			data.name = l('COMMUNITY_SERVICE_LABEL')

			table.insert(shared.data.interaction, data)
		end

		if Prison.Target.ModuleState then
			SetTimeout(1000, function()
				if IsScriptLoaded('ox_target') then
					DefineOxTarget(shared.data.interaction)
				elseif IsScriptLoaded('qb-target') then
					DefineQbTarget(shared.data.interaction)
				elseif IsScriptLoaded('qtarget') then
					DefineQTarget(shared.data.interaction)
				end
			end)
		else
			InvokeDistanceInteract()
		end

		Bridge.RegisterBlipsAndNPC()
		Bridge.BlockPool()
		Bridge.RegisterCommandSuggestions()
		Bridge.HandlePrisonMap('init')
	end)

	Bridge.RegisterInteract = function()
		if shared.interaction == 'unk' or not shared.interaction then
			AddTextEntry('RCORE_PRISON_NPC_INTERACT_ACCOUNT', l('PRISON_CHECK_ACCOUNT'))
			AddTextEntry('RCORE_PRISON_NPC_INTERACT_CANTEEN', l('PRISON_CHECK_CANTEEN'))
			AddTextEntry('RCORE_PRISON_NPC_INTERACT_LOBBY', l('PRISON_CHECK_LOBBY'))
			AddTextEntry('RCORE_PRISON_NPC_INTERACT_BOOTH', l('PRISON_CHECK_BOOTH'))
			AddTextEntry('RCORE_PRISON_NPC_INTERACT_JOB', l('PRISON_CHECK_JOB'))
			AddTextEntry('RCORE_PRISON_NPC_INTERACT_PACKAGE', l('PRISON_CHECK_PACKAGE'))
			AddTextEntry('RCORE_PRISON_NPC_INTERACT_GYM', l('PRISON_CHECK_GYM'))
			AddTextEntry('RCORE_PRISON_NPC_INTERACT_DEALER', l('PRISON_CHECK_DEALER'))
			AddTextEntry('RCORE_PRISON_NPC_INTERACT_CW', l('PRISON_CHECK_CW'))

			HandleJailCache('init')
			HandleJailInteraction('init')
		else
			dbg.debug('Interaction type is [%s]', shared.interaction)
		end
	end

	Bridge.RegisterBlipsAndNPC = function()
		if not shared.data.interaction then
			return
		end

		for _, data in pairs(shared.data.interaction) do
			if data.npc then
				SpawnNpc({
					model = data.npc.model,
					heading = data.npc.heading,
					coords = data.coords,
					anim = data.npc.anim or nil,
				})
			end

			if data.blip and data.blip.state then
				Bridge.CreateBlip({
					type = 'interact',
					coords = data.coords or nil,
					sprite = data.blip.sprite or nil,
					scale = data.blip.scale or 0.5,
					color = data.blip.color or 0,
					name = data.blip.name or 'unk',
					shortRange = data.blip.shortRange or false
				})
			end
		end
	end

	Bridge.GetSkinType = function()
		local retval = 'unk'

		if IsScriptLoaded(Prison.FrameworkTriggers.resourceNameClothing) then
			retval = Prison.FrameworkTriggers.resourceNameClothing
		elseif IsScriptLoaded('fivem-appearance') then
			retval = 'fivem-appearance'
		elseif IsScriptLoaded('illenium-appearance') then
			retval = 'illenium-appearance'
		elseif IsScriptLoaded('skinchanger') then
			retval = 'skinchanger'
		elseif IsScriptLoaded('qb-clothing') then
			retval = 'qb-clothing'
		elseif not IsScriptLoaded(Prison.FrameworkTriggers.resourceNameClothing) then
			if IsScriptLoaded('fivem-appearance') then
				retval = 'fivem-appearance'
			elseif IsScriptLoaded('skinchanger') then
				retval = 'skinchanger'
			elseif IsScriptLoaded('qb-clothing') then
				retval = 'qb-clothing'
			end

			Prison.FrameworkTriggers.resourceNameClothing = retval
		else
			retval = 'unk'
		end

		if not retval then
			Prison.OutfitSkipSelection = true
			retval = 'unk'
			dbg.critical('Unknown clothing script, loading Skip outfit selection!')
		end

		return retval
	end

	RegisterNetEvent(Prison.Notify.event, function(data)
		Bridge.Notify(data)
	end)

	if Prison.Notify.DefaultNotify then
		Bridge.Notify = function(data)
			local settings = data

			local icon = settings.icon or "CHAR_DEFAULT"
			local type = settings.type or 1
			local text = settings.description or ""
			local title = settings.title or ""
			local subTitle = settings.subtitle or ""

			SetNotificationTextEntry("STRING")
			AddTextComponentString(text)
			SetTextFont(getFontId())
			SetNotificationMessage(icon, icon, true, type, title, subTitle)
			DrawNotification(false, true)
		end
	else
		Bridge.Notify = function(data)
			if Framework and Framework.Functions then
				return TriggerEvent('QBCore:Notify', data.description, data.type)
			elseif Framework and Framework.ShowNotification then
				return Framework.ShowNotification(data.description, data.type, 3000)
			else
				local settings = data

				local icon = settings.icon or "CHAR_DEFAULT"
				local type = settings.type or 1
				local text = settings.description or ""
				local title = settings.title or ""
				local subTitle = settings.subtitle or ""
	
				SetNotificationTextEntry("STRING")
				AddTextComponentString(text)
				SetTextFont(getFontId())
				SetNotificationMessage(icon, icon, true, type, title, subTitle)
				DrawNotification(false, true)
			end
		end
	end

	HandlePrologTeleport = function()
		local plyPed = PlayerPedId()
		local placeCoords = shared.data.outfitMenu
		local fixedZ = GetEntityHeightAboveGround(plyPed)
		local retval = nil

		SetEntityCoords(plyPed, placeCoords.x, placeCoords.y, placeCoords.z - fixedZ)
		SetEntityHeading(plyPed, placeCoords.w)

		local time = GetGameTimer()

		RequestCollisionAtCoord(placeCoords.x, placeCoords.y, placeCoords.z)

		local interiorId = GetInteriorAtCoords(placeCoords.x, placeCoords.y, placeCoords.z)

		if interiorId then
			SetInteriorActive(interiorId, true)
		end

		while (not HasCollisionLoadedAroundEntity(plyPed) and (GetGameTimer() - time) < 5000) do
			Wait(0)

			RequestCollisionAtCoord(placeCoords.x, placeCoords.y, placeCoords.z)

			if GetGameTimer() - time > 5000 then
				break
			end
		end

		Wait(0)

		if placeCoords then
			retval = PrepareClothingCamera()
		end

		SetCameraLookAtPos()

		return retval
	end

	Bridge.SelectOutfit = function(plyPed, data)
		Clothing.SetUserOutfit(data, 'selectOutfit')
	end

	Bridge.HandleStandaloneClothing = function()
		NetworkEndTutorialSession()

		SetTimeout(2000, function()
			NetworkEndTutorialSession()
		end)
	end

	Bridge.HandleJailTime = function(jailType)
		SetTimeout(1250, function()
			NetworkEndTutorialSession()
		end)

		if jailType == 'jailed' then
			local randomOutfit = Clothing.SelectRandomOutfit()

			if randomOutfit then
				Clothing.SetUserOutfit(randomOutfit, 'relog')
			end
		end
	end

	Bridge.HandleResetPrisoner = function(data, state)
		SetTimeout(1250, function()
			NetworkEndTutorialSession()
		end)

		TriggerEvent('rcore_prison:hudState', 'released', true)

		if state == 'jailed' then
			Clothing.SetUserOutfit(data, 'release')
		end

		Frontend:CloseMenu()
	end
end
