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
Config.cityPoint                = true
Config.account                  = 'money'

Config.Blips = {
	Blip = {
		Pos		= { x = -1248.7252197265625, y = -795.2439575195312, z = 18.6307373046875 },
		Sprite	= 496,
		Display	= 4,
		Scale	= 1.0,
		Color	= 2
	}
}

Boxes = vector3(-1246.839599609375,-799.081298828125,18.6307373046875)

Dyes = vector3(-1248.3033447265625,-788.6505737304688,18.6307373046875)

Dyes2 = vector3(-1246.945068359375,-790.3912353515625,18.6307373046875)

Dyes3 = vector3(-1245.6131591796875,-792.1318359375,18.6307373046875)

Sink = vector3(-1252.3385009765625,-796.4571533203125,18.6307373046875)

Sink2 = vector3(-1253.96044921875,-794.3735961914062,18.6307373046875)

Sink3 = vector3(-1255.3978271484375,-792.5406494140625,18.6307373046875)

Boxing = vector3(-1251.9296875,-784.8659057617188,18.6307373046875)

BossActions = vector3(-1244.927490234375,-788.0966796875,18.6307373046875)




Config.EnterExitKey = Keys['E']

BoxSalonMarkerText = 'Press ~INPUT_CONTEXT~ to grab boxes.'
DyeSalonMarkerText = 'Press ~INPUT_CONTEXT~ to grab basic color dyes.'
Dye2SalonMarkerText = 'Press ~INPUT_CONTEXT~ to grab vibrant color dyes.'
Dye3SalonMarkerText = 'Press ~INPUT_CONTEXT~ to grab dyes for curly hair.'
SinkSalonMarkerText = 'Press ~INPUT_CONTEXT~ to dye hair basic color.'
Sink2SalonMarkerText = 'Press ~INPUT_CONTEXT~ to dye hair vibrant color.'
Sink3SalonMarkerText = 'Press ~INPUT_CONTEXT~ to dye curly hair.'
BoxingSalonMarkerText = 'Press ~INPUT_CONTEXT~ to box basic bundles.'
Boxing2SalonMarkerText = 'Press ~INPUT_CONTEXT~ to box vibrant bundles.'
Boxing3SalonMarkerText = 'Press ~INPUT_CONTEXT~ to box curly bundles.'

ParkText = 'Press ~INPUT_CONTEXT~ to Park or modify your Salon'
Config.UseKey = Keys['E']



Config.JobBlips = {

}
