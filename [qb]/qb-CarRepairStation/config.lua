Config = {}
Config.Locale = 'en' --en, tw

Config.RepairTime = 4000
Config.EnableSoundEffect = true
Config.Blips = true

-- if you want repair for free, set cost to false
Config.Stations = {
	--{x = -30.96, y = -1047.7, z = 28.4, cost = false},
	--{x = -211.05, y = -1323.78, z = 30.89, cost = false}
	{x = -80.18901062011719, y = -1319.235107421875, z = 29.07763671875, cost = 1500},
	{x = 252.1977996826172, y = -769.8857421875, z = 30.7457275390625, cost = 1500},
	{x = 103.479, y = 6622.048, z = 30.8, cost = 1500},
	{x = -182.6, y = -1303.15, z =  30.82, cost = 1500}

}


Locales = {}

function _(str, ...)  -- Translate string

	if Locales[Config.Locale] ~= nil then

		if Locales[Config.Locale][str] ~= nil then
			return string.format(Locales[Config.Locale][str], ...)
		else
			return 'Translation [' .. Config.Locale .. '][' .. str .. '] does not exist'
		end

	else
		return 'Locale [' .. Config.Locale .. '] does not exist'
	end

end

function _U(str, ...) -- Translate string first char uppercase
	return tostring(_(str, ...):gsub("^%l", string.upper))
end