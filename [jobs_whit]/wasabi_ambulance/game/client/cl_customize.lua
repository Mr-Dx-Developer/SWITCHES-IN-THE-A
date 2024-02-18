-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
ESX = nil
QBCore = nil
if wsb.framework == 'esx' then
	ESX = exports['es_extended']:getSharedObject() -- Custom esx object?
end
if wsb.framework == 'qb' then
	QBCore = exports['qb-core']:GetCoreObject()
end

IsDispatched = false
local canRespawn = false
----------------------------------------------------------------
-- Customize text ui, notifications, target and more with the --
-- "wasabi_bridge" dependency in the "customize" directory    --
-- "wasabi_bridge/customize/cl_customize.lua"                 --
----------------------------------------------------------------


RegisterNetEvent('wasabi_ambulance:resetStatus', function() -- Set your own custom hunger/thirst reset logic?
	if wsb.framework == 'esx' then
		TriggerEvent('esx_status:set', 'hunger', 1000000)
		TriggerEvent('esx_status:set', 'thirst', 1000000)
	elseif wsb.framework == 'qb' then
		TriggerServerEvent('QBCore:Server:SetMetaData', 'hunger', 100)
		TriggerServerEvent('QBCore:Server:SetMetaData', 'thirst', 100)
	end
	if Config.MythicHospital then
		TriggerEvent('mythic_hospital:client:RemoveBleed')
		TriggerEvent('mythic_hospital:client:ResetLimbs')
	end
end)

RegisterNetEvent('wasabi_ambulance:customInjuryClear', function()
	-- Set your own custom injury clear logic?
	-- Good for 3rd party injury scripts
	-- will be triggered on all revive events
end)

SetCarFuel = function(vehicle, value)
	if Config.FuelSystem == 'ox' then
		Entity(vehicle).state.fuel = value
	elseif Config.FuelSystem == 'legacy' then
		exports.LegacyFuel.SetFuel(vehicle, value)
	else
		SetVehicleFuelLevel(vehicle, value)
	end
end

SendDistressSignal = function() -- Edit distress signal to implement custom dispatch
	TriggerEvent('wasabi_bridge:notify', Strings.distress_sent_title, Strings.distress_sent_desc, 'success')
	local ped = cache.ped
	local myPos = GetEntityCoords(ped)
	if Config.phoneDistress == 'gks' then
		local GPS = 'GPS: ' .. myPos.x .. ', ' .. myPos.y
		ESX.TriggerServerCallback('gksphone:namenumber', function(Races)
			local name = Races[2].firstname .. ' ' .. Races[2].lastname
			TriggerServerEvent('gksphone:gkcs:jbmessage', name, Races[1].phone_number, 'Emergency aid notification', '',
				GPS, '["ambulance"]', false)
		end)
	elseif Config.phoneDistress == 'qs' then
		local jobs = Config.ambulanceJobs or Config.ambulanceJob
		if jobs and type(jobs) == 'table' then
			for i = 1, #jobs do
				TriggerServerEvent('qs-smartphone:server:sendJobAlert', {
					message = 'Injured person',
					location = vector3(myPos.x, myPos.y, myPos.z)
				}, jobs[i])
			end
			goto continue
		end
		TriggerServerEvent('qs-smartphone:server:sendJobAlert', {
			message = 'Injured person',
			location = vector3(myPos.x, myPos.y, myPos.z)
		}, jobs)
		::continue::
		TriggerServerEvent('qs-smartphone:server:AddNotifies', {
			head = "Injured person",
			msg = 'Injured person',
			app = 'business'
		})
	elseif Config.phoneDistress == 'd-p' then
		local jobs = Config.ambulanceJobs or Config.ambulanceJob
		if jobs and type(jobs) == 'table' then
			for i = 1, #jobs do
				TriggerEvent('d-phone:client:message:senddispatch', 'Unconscious person', jobs[i])
			end
			goto continue
		end
		TriggerEvent('d-phone:client:message:senddispatch', 'Unconscious person', jobs)
		::continue::
		TriggerEvent('d-notification', 'Service Message sended', 5000, 'success')
	elseif Config.phoneDistress == 'lb' then
		local jobs = Config.ambulanceJobs or Config.ambulanceJob
		if jobs and type(jobs) == 'table' then
			for i = 1, #jobs do
				exports["lb-phone"]:SendCompanyMessage(jobs[i], 'Unconscious person')
				exports["lb-phone"]:SendCompanyCoords(jobs[i])
			end
		end
	else
		TriggerServerEvent('wasabi_ambulance:onPlayerDistress') -- To add your own dispatch, comment this line out and add into here
	end
end

AddEventHandler('wasabi_ambulance:changeClothes', function(data)
	local gender = wsb.getGender()
	if not gender or gender == 0 or gender == 'm' then gender = 'male' end
	if gender == 'f' or gender == 1 then gender = 'female' end
	if data == 'civ_wear' then
		RemoveClothingProps()
		RequestCivilianOutfit()
		return
	end
	if type(data) ~= 'table' then return end
	SaveCivilianOutfit()
	RemoveClothingProps()
	if data[gender] and data[gender].clothing and next(data[gender].clothing) then
		for _, clothing in pairs(data[gender].clothing) do
			SetPedComponentVariation(cache.ped, clothing.component, clothing.drawable, clothing.texture, 0)
		end
	end
	if data[gender] and data[gender].props and next(data[gender].props) then
		for _, prop in pairs(data[gender].props) do
			SetPedPropIndex(cache.ped, prop.component, prop.drawable, prop.texture, true)
		end
	end
end)

-- Death screen related editables
function StartDeathTimer()
	local deathTrigger = false
	canRespawn = false
	if not Config.DisableDeathAnimation then
		SetGameplayCamRelativeHeading(-360)
	end
	local earlySpawnTimer = math.floor(Config.RespawnTimer / 1000)
	local bleedoutTimer = math.floor(Config.BleedoutTimer / 1000)
	-- Null
	SendReactMessage('display', json.encode({
		component = 'deathScreen',
		show = true,
		initialData = {
			counter = earlySpawnTimer,
			dispatched = false,
			canRespawn = canRespawn,
			type = Config.DeathScreenType
		},
	}))

	CreateThread(function()
		while earlySpawnTimer > 0 and isDead do
			Wait(1000)
			if not wsb.playerLoaded then
				HideDeathNui()
				break
			end
			if earlySpawnTimer > 0 then
				earlySpawnTimer = earlySpawnTimer - 1
				if not IsCheckedIn and isDead then
					-- Null
					SendReactMessage('update', json.encode({
						component = 'deathScreen',
						newData = {
							counter = earlySpawnTimer,
							dispatched = IsDispatched or false,
							canRespawn = canRespawn,
							type = Config.DeathScreenType
						},
					}))
				else
					HideDeathNui()
					break
				end
			end
		end
		while bleedoutTimer > 0 and isDead do
			if not deathTrigger then
				SendReactMessage('playerDied', json.encode(true))
				deathTrigger = true
			end
			if isDead == 'laststand' then SetEntityHealth(cache.ped, 0) end
			Wait(1000)
			if not wsb.playerLoaded then
				HideDeathNui()
				break
			end
			if bleedoutTimer > 0 then
				bleedoutTimer = bleedoutTimer - 1
				if not IsCheckedIn and isDead then
					-- Null
					SendReactMessage('update', json.encode({
						component = 'deathScreen',
						newData = {
							counter = bleedoutTimer,
							dispatched = IsDispatched or false,
							canRespawn = canRespawn,
							type = Config.DeathScreenType
						},
					}))
				else
					HideDeathNui()
					break
				end
			end
		end
	end)


	CreateThread(function()
		local timeHeld = 0
		while earlySpawnTimer > 0 and isDead do
			Wait(0)
			if not IsDispatched then
				if IsControlJustReleased(0, 47) then --Old 47
					IsDispatched = true
					SendDistressSignal()
				end
			else
				Wait(1000)
			end
		end
		while bleedoutTimer > 0 and isDead do
			Wait(0)
			if not IsDispatched then
				if IsControlJustReleased(0, 47) then --Old 47
					IsDispatched = true
					SendDistressSignal()
				end
			end
			if not canRespawn then
				SendReactMessage('update', json.encode({
					component = 'deathScreen',
					newData = {
						counter = bleedoutTimer,
						dispatched = IsDispatched or false,
						canRespawn = true,
						type = Config.DeathScreenType
					},
				}))
				canRespawn = true
			end
			if not IsCheckedIn then
				if IsControlPressed(0, 38) and timeHeld > 60 then
					HideDeathNui()
					StartRPDeath()
					break
				end
				if IsControlPressed(0, 38) then
					timeHeld = timeHeld + 1
				else
					timeHeld = 0
				end
			else
				Wait(1000)
			end
		end
		if bleedoutTimer < 1 and isDead then
			HideDeathNui()
			StartRPDeath()
		end
	end)
end

function OnPlayerDeath(stagetwo)
	if not isDead or isDead ~= 'dead' then
		isDead = 'dead'
		TriggerServerEvent('wasabi_ambulance:setDeathStatus', 'dead', true)
		DrugIntake = {}
		if not stagetwo then
			StartDeathTimer()
		end
		startDeathAnimation(false)
	else
		startDeathAnimation(true)
	end
	if Config.CompleteDeath.enabled and wsb.framework == 'esx' then
		TriggerServerEvent('wasabi_ambulance:deathCount')
	end
end

-- Job menu edits?
function OpenJobMenu()
	if not wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob) then return end
	if isPlayerDead() then return end
	if not wsb.isOnDuty() then return end
	Options = {
		{
			title = Strings.dispatch,
			description = Strings.dispatch_desc,
			icon = 'truck-medical',
			arrow = true,
			event = 'wasabi_ambulance:dispatchMenu',
			disabled = isPlayerDead() == true
		},
		{
			title = Strings.diagnose_patient,
			description = Strings.diagnose_patient_desc,
			icon = 'stethoscope',
			arrow = false,
			event = 'wasabi_ambulance:diagnosePatient',
			disabled = isPlayerDead() == true
		},
		{
			title = Strings.revive_patient,
			description = Strings.revive_patient_desc,
			icon = 'kit-medical',
			arrow = false,
			event = 'wasabi_ambulance:reviveTarget',
			disabled = isPlayerDead() == true
		},
		{
			title = Strings.heal_patient,
			description = Strings.heal_patient_desc,
			icon = 'bandage',
			arrow = false,
			event = 'wasabi_ambulance:healTarget',
			disabled = isPlayerDead() == true
		},
		{
			title = Strings.place_patient,
			description = Strings.place_patient_desc,
			icon = 'car',
			arrow = false,
			event = 'wasabi_ambulance:placeInVehicle',
			disabled = isPlayerDead() == true
		}
	}
	if Config.EnviPrescriptions.enabled then
		local _job, grade = wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob)
		if grade and grade >= Config.EnviPrescriptions.minRank then
			Options[#Options + 1] = {
				title = Strings.prescription_menu,
				description = Strings.prescription_menu_desc,
				icon = 'pills',
				arrow = true,
				event = 'envi-prescriptions:openPrescriptionsMenu',
				disabled = isPlayerDead() == true
			}
		end
	end
	Options[#Options + 1] = {
		title = Strings.sedate_patient,
		description = Strings.sedate_patient_desc,
		icon = 'syringe',
		arrow = false,
		event = 'wasabi_ambulance:useSedative',
		disabled = isPlayerDead() == true
	}
	Options[#Options + 1] = {
		title = Strings.toggle_stretcher,
		description = Strings.toggle_stretcher_desc,
		icon = 'bed',
		arrow = false,
		event = 'wasabi_ambulance:toggleStretcher',
		disabled = isPlayerDead() == true
	}

	if Config?.wasabi_crutch?.crutchInJobMenu then
		Options[#Options + 1] = {
			title = Strings.menu_crutch,
			description = Strings.menu_crutch_desc,
			icon = 'crutch',
			arrow = false,
			event = 'wasabi_ambulance:crutchMenu',
			disabled = isPlayerDead() == true
		}

		Options[#Options + 1] = {
			title = Strings.menu_remove_crutch,
			description = Strings.menu_remove_crutch_desc,
			icon = 'crutch',
			arrow = false,
			event = 'wasabi_ambulance:crutchRemoveMenu',
			disabled = isPlayerDead() == true
		}
	end
	if Config?.wasabi_crutch?.chairInJobMenu then
		Options[#Options + 1] = {
			title = Strings.menu_chair,
			description = Strings.menu_chair_desc,
			icon = 'wheelchair',
			arrow = false,
			event = 'wasabi_ambulance:chairMenu',
			disabled = isPlayerDead() == true
		}

		Options[#Options + 1] = {
			title = Strings.menu_remove_chair,
			description = Strings.menu_remove_chair_desc,
			icon = 'wheelchair',
			arrow = false,
			event = 'wasabi_ambulance:chairRemoveMenu',
			disabled = isPlayerDead() == true
		}
	end

	if Config.billingSystem then
		Options[#Options + 1] = {
			title = Strings.bill_patient,
			description = Strings.bill_patient_desc,
			icon = 'file-invoice',
			arrow = false,
			event = 'wasabi_ambulance:billPatient',
			disabled = isPlayerDead() == true
		}
	end
	if Config.MobileMenu.enabled then
		OpenMobileMenu('ems_job_menu', Strings.JobMenuTitle, Options)
	else
		lib.registerContext({
			id = 'ems_job_menu',
			title = Strings.JobMenuTitle,
			options = Options
		})
		lib.showContext('ems_job_menu')
	end
end
