--------------------------------
------- Created by 5M DEVS -----
-------------------------------- 

Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,["-"] = 84,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["INSERT"] = 121,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config = {}
Config.Locale = 'en'

Config.DrawDistance = 10.0
Config.ZoneSize     = {x = 1.0, y = 1.0, z = 1.0}
Config.MarkerColor  = {r = 27, g = 0, b = 20}
Config.MarkerType   = 27

Config.EnableMoneyWash			= false
Config.QuantityMaximumInVehicle	= 5 
Config.MissCraft                = 10 -- %
Config.requiredCops             = 0
Config.cityPoint                = false
Config.account                  = 'money'

Config.purses = {
        ['fmdbaltotebox'] = 13000,
        ['fmdbalwwalletbox'] = 1800,
        ['fmdbalpsbagbox'] = 22000,
        ['fmdbalpbagbox'] = 32000,
        ['fmdchpbox'] = 1800,
        ['fmdchwbox'] = 22000,
        ['fmdchbbox'] = 13000,
        ['fmdbirpsbox'] = 11800,
        ['fmdbirbbox'] = 22000,
        ['fmdbirapbox'] = 23000,
        ['fmdbirpinkbox'] = 21800,
        ['fmdlvcbbox'] = 21000,
        ['fmdlvtotebox'] = 13000,
        ['fmdlvwalletbox'] = 1800,
        ['fmdlvjunglebox'] = 21000,
        ['fmddiorapbox'] = 13000,
        ['fmddiorbbox'] = 11800,
        ['fmddiorplbox'] = 21000,
        ['fmddiortotebox'] = 11800,
        ['fmddiorptotebox'] = 21000
}

--[[ Config.Zones = {

	BossActions = {
		Pos	 	= { x = -768.962646484375, y = -370.5494384765625, z = 38.962646484375 }, 
		Size	= { x = 1.2, y = 1.2, z = 1.2 },
		Color 	= { r = 220, g = 110, b = 0 },
		Type	= 27
	},

	Leather = {
		Pos   = { x = -775.8857421875, y = -363.8769226074219, z = 38.962646484375 },
		Size  = { x = 1.2, y = 1.2, z = 1.2 },
		Color = { r = 148, g = 232, b = 129 },
		Type  = 27,
 	},

	Closet = {
		Pos   = { x = -772.5626220703125, y = -365.6439514160156, z = 38.962646484375},
		Size  = { x = 1.2, y = 1.2, z = 1.2 },
		Color = { r = 148, g = 232, b = 129 },
		Type  = 27,
	},

	Sheet = {
		Pos   = { x = -766.931884765625, y = -362.24176025390625, z = 38.962646484375 },
		Size  = { x = 1.2, y = 1.2, z = 1.2 },
		Color = { r = 148, g = 232, b = 129 },
		Type  = 27,
	},  

    Sewing = {
		Pos   = { x = -771.1516723632812, y = -360.052734375, z = 38.962646484375 },
		Size  = { x = 1.2, y = 1.2, z = 1.2 },
		Color = { r = 148, g = 232, b = 129 },
		Type  = 27,
	},

	Boxing = {
		Pos   = { x = -769.2659301757812, y = -367.3977966308594, z = 38.962646484375},
		Size  = { x = 1.2, y = 1.2, z = 1.2 },
		Color = { r = 148, g = 232, b = 129 },
		Type  = 27,
	}
} ]]

Config.UseKey = Keys['E']

Boxing = vector3(-769.2659, -367.3977, 38.9626)

Closet = vector3(-772.5626, -365.6439, 38.9626)

Leather = vector3(-775.8857, -363.8769, 38.9626)

Sewing = vector3(-771.1516, -360.0527, 38.9626)

Blueprints = vector3(-766.9318, -362.2417, 38.9626)

BossActions = vector3(-768.9626, -370.5494, 38.9289)




Config.JobBlips = {

}
