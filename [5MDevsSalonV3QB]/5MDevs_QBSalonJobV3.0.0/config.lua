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

Config.DrawDistance = 1.5
Config.ZoneSize     = {x = 1.0, y = 1.0, z = 1.0}
Config.MarkerColor  = {r = 27, g = 0, b = 20}
Config.MarkerType   = 27

Config.EnableMoneyWash			= false
Config.QuantityMaximumInVehicle	= 5 
Config.MissCraft                = 10 -- %
Config.requiredCops             = 0
Config.cityPoint                = false
Config.account                  = 'money'

Config.Blips = {
	Blip = {
		Pos		= { x = 184.0171, y = -245.0745, z = 53.0705 }, 
		Sprite	= 0,
		Display	= 0,
		Scale	= 0.0,
		Color	= 2
	}
}

Config.Boxes = vector3(68.00439453125, -1454.835205078125, 29.2967529296875)

Dyes = vector3(66.19779968261719, -1453.2923583984375, 29.3135986328125)

Dyes2 = vector3(64.45714569091797, -1451.77587890625, 29.3135986328125)

Dyes3 = vector3(63.05934143066406, -1450.24609375, 29.3304443359375)

Sink = vector3(61.74066162109375, -1448.3868408203125, 29.3304443359375)

Sink2 = vector3(60.55384826660156, -1447.199951171875, 29.3472900390625)

Sink3 = vector3(59.129669189453125, -1445.841796875, 29.3472900390625)

Boxing = vector3(67.95165252685547, -1447.4373779296875, 29.2967529296875)

BossActions = vector3(63.74505615234375, -1441.4637451171875, 29.2967529296875)




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
