Config = {}
Translation = {}

Translation = {
    ['de'] = {
        ['DJ_interact'] = 'Drücke ~g~E~s~, um auf das DJ Pult zuzugreifen',
        ['title_does_not_exist'] = '~r~Dieser Titel existiert nicht!',
    },

    ['en'] = {
        ['DJ_interact'] = 'Press ~g~E~s~, to access the DJ desk',
        ['title_does_not_exist'] = '~r~This title does not exist!',
    }
}

Config.Locale = 'en'

Config.useESX = false -- can not be disabled without changing the callbacks
Config.enableCommand = false

Config.enableMarker = true -- purple marker at the DJ stations

Config.DJPositions = {
    {
        name = 'Vanilla',
        pos = vector3(117.1, -1281.45, 29.26),
        requiredJob = nil, -- example: requiredJob = "dj" 
        range = 25.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },

    {
        name = 'Bahama',
        pos = vector3(-1378.73, -629.1, 30.63),
        requiredJob = nil, -- example: requiredJob = "dj" 
        range = 25.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },
{
        name = 'cayo',
        pos = vector3(4893.18, -4904.88, 3.49),
        requiredJob = nil, -- example: requiredJob = "dj" 
        range = 25.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },
    {
        name = 'mamas',
        pos = vector3(-1388.6505126953125,-605.6835327148438,31.5040283203125),
        requiredJob = nil, -- example: requiredJob = "dj" 
        range = 25.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },
    {
        name = 'blue',
        pos = vector3(-317.1560363769531,-1382.2548828125,31.6556396484375),
        requiredJob = nil, -- example: requiredJob = "dj" 
        range = 25.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },
    {
        name = 'res',
        pos = vector3(-1297.4637451171875,-1036.786865234375,13.154541015625),
        requiredJob = nil, -- example: requiredJob = "dj" 
        range = 25.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },
    {
        name = 'leg',
        pos = vector3(120.61978149414062,-1281.5867919921875,29.4652099609375),
        requiredJob = nil, -- example: requiredJob = "dj" 
        range = 25.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },
    {
        name = 'party',
        pos = vector3(-2817.059326171875, 4364.99365234375, 4.88134765625),
        requiredJob = nil, -- example: requiredJob = "dj" 
        range = 25.0, 
        volume = 1.0 --[[ do not touch the volume! --]]
    },
    
	
	
}