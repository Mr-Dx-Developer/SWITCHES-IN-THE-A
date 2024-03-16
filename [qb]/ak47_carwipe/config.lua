Config = {}
Config.Locale = 'en'

Config.WipeCooldown 	= 30 	--minutes [minimum 2 minutes]
Config.WarningStarts 	= 1 	--minutes [minimum 1 minutes]
Config.RedAlert 		= 20 	--seconds [minimum 2 seconds]

Config.WhitelistedModels = {
	[`journey`] = true,
}

Config.WhitelistedZones = {
	--{pos = vector3(0, 0, 0), radius = 50.0},
}

Config.Timer = {
	position = {x = 0.91, y = 0.486},
	fontsize = {x = 0.45, y = 0.45},
	box = {x = 0.950, y = 0.5015, width = 0.1, height = 0.035},
}

