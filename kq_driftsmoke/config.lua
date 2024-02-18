Config = {}

Config.debug = false


----------------------
--	Smoke Settings  --
----------------------

-- The threshold of loss of traction at which the smoke will start appearing (6.0 is a good value)
Config.driftThreshold = 6.0

-- Scale multiplier of the smoke, to make all smoke larger increase this value
Config.scaleMultiplier = 1

-- Whether or not to use colored smoke, when false cars with custom tire smoke will still produce white smoke
Config.allowColoredSmoke = true

-- Value between 0 and 100 | Defines the density of the smoke
Config.smokeDensity = 90

-- Opacity of the smoke
Config.smokeOpacity = 0.35


----------------------
--	   Burnouts     --
----------------------

-- Whether or not to enlarge the smoke during a burnout
Config.bigBurnoutSmoke = true

-- Whether or not to keep making the smoke larger as the burnout continues
Config.growBurnoutSmoke = true

-- Maximum size of the burnout
Config.maxBurnoutSmokeMultiplier = 1.6



----------------------
--	     Other      --
----------------------

-- Whether or not to enable /startsmoke and /stopsmoke commands
Config.toggleCommands = true

-- Whether or not you want smoke to be produced on offroad surfaces like dirt
Config.smokeOffroad = false

-- Surfaces where smoke will always be produced
-- To check the surface you're on you can do /surface with debug mode enabled
Config.roadSurfaces = {
    1, 3, 4, 12
}

-- Whether or not only allow certain vehicles to produce the smoke
Config.whitelist = {
    useWhitelist = false,
    vehicles = {
        'silvia',
        'brz13',
        'zion3',
        'tampa2',
        'futo',
        'yosemite2',
    }
}

-- Whether or not to only enable drift smoke for vehicles that have drift tires (KuzQuality.com/(COMING SOON))
Config.onlyWithDriftTires = false
