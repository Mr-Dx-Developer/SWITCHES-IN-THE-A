Config = {}
Config.Locale = 'en'

Config.Whitelistedjobs = { -- No jamming for this job
    -- police = true,
    -- sheriff = true,
}

Config.Weapons = { -- minimum value 0, maximum value 100. more weapons: https://wiki.rage.mp/index.php?title=Weapons
    [`weapon_pistol`]       = {JamChance = 40, UnjamChance = 30},
    [`weapon_assaultrifle`] = {JamChance = 30, UnjamChance = 30},
}

