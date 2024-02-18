-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
if not Config.UseRadialMenu then return end

function AddRadialItems()
	if wsb.hasGroup(Config.ambulanceJobs or Config.ambulanceJob) then
		if wsb.framework == 'qb' then
			if wsb.playerData.job.onduty then
				lib.addRadialItem({
					{
						id = 'ems_general',
						label = 'EMS',
						icon = 'ambulance',
						menu = 'ems_menu'
					},
				})
			else
				lib.removeRadialItem('ems_general')
			end
		else
			lib.addRadialItem({
				{
					id = 'ems_general',
					label = 'EMS',
					icon = 'ambulance',
					menu = 'ems_menu'
				},
			})
		end
	else
		lib.removeRadialItem('ems_general')
	end
end

lib.registerRadial({ -- EMS menu
	id = 'ems_menu',
	items = {
		{
			label = 'Diagnose',
			icon = 'stethoscope',
			onSelect = function()
				TriggerEvent('wasabi_ambulance:diagnosePatient')
			end
		},
		{
			label = 'Revive',
			icon = 'heartbeat',
			onSelect = function()
				TriggerEvent('wasabi_ambulance:reviveTarget')
			end
		},
		{
			label = 'Heal',
			icon = 'band-aid',
			onSelect = function()
				TriggerEvent('wasabi_ambulance:healTarget')
			end
		},
		{
			label = 'Sedate',
			icon = 'suitcase-medical',
			onSelect = function()
				TriggerEvent('wasabi_ambulance:useSedative')
			end
		},
		{
			label = 'In/Out Vehicle',
			icon = 'door-open',
			onSelect = function()
				TriggerEvent('wasabi_ambulance:placeInVehicle')
			end
		},
		{
			label = 'Bill Patient',
			icon = 'file-invoice-dollar',
			onSelect = function()
				TriggerEvent('wasabi_ambulance:billPatient')
			end
		},
		{
			label = 'Dispatch',
			icon = 'user-injured',
			onSelect = function()
				TriggerEvent('wasabi_ambulance:dispatchMenu')
			end
		},
	}
})
