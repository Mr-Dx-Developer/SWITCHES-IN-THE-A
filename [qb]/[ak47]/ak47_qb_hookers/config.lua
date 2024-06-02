QBCore = exports['qb-core']:GetCoreObject()

Config = {}
Config.Locale = 'en'
Config.TargetScript = 'qb-target' --don't change name if using ox_target

Config.CrowdDistance = 50.0

Config.Options = {
	{
		name 		 = 'Blow Job',
		price 		 = {min = 180, max = 230},
		trigger 	 = 'ak47_qb_hookers:blowjob',
		removestress = 35,
	},
	{
		name 		 = 'Vagina Sex',
		price 		 = {min = 400, max = 600},
		trigger 	 = 'ak47_qb_hookers:sex',
		removestress = 75,
	},
	{
		name 		 = 'Anal Sex',
		price 		 = {min = 800, max = 1200},
		trigger 	 = 'ak47_qb_hookers:sex',
		removestress = 75,
	},
	
}

Config.Models = {
	`s_f_y_hooker_01`,
	`s_f_y_hooker_02`,
	`s_f_y_hooker_03`,
}

Config.DispatchAlert = function()
	if GetResourceState('ps-dispatch') == 'started' then
		exports['ps-dispatch']:SuspiciousActivity()
	else
		--custom dispatch code here

	end
end

Config.Notify = function(msg, type)
	QBCore.Functions.Notify(msg, type)
end

Config.RemoveStress = function(stress)
	TriggerServerEvent('hud:server:RelieveStress', stress)
end