-- Don't forget to modify server.lua and add your players Steam or License to Whitelist

Config = {
	SpawnCommand = 'baby:spawn', -- Spawn baby
	CarryArm = 'baby:arm', -- Carry on arm
	CarryShoulders = 'baby:shoulders', -- Carry on shoulders
	Scare = 'baby:scare', -- Scare the baby
	Despawn = 'baby:despawn', -- Despawn baby 
	
	MaxDistance = 40.0, -- Max distance before the baby TP to you
	AnimKey = 74, -- Key for toggle shoulders anim, so you can do other animation. H by default
	
	NoWeapons = true, -- Block player from using weapons or punch while carrying the baby
	
	Lang = {
		['far_away'] = 'Kid is too far away',
		['not_whitelisted'] = "You don't have permission",
	}
}

--	Your Notification System
RegisterNetEvent('av_baby:notification')
AddEventHandler('av_baby:notification', function(msg)
--	print(msg)
--	exports['mythic_notify']:SendAlert(type,msg)
end)