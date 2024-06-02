--[[
    - this script needs tgiann-core script to work, you can download the script from your keymaster account
      Start tgiann-core script after es_extented/qb-core script and before tgiann-* scripts
      Adjust the tgiann-core config file according to the framework you are using

    - You need at least $15 Patreon key to stream clothes (https://www.patreon.com/fivem)
    - Add tgiann-naked-assets and tgiann-naked script at the last in server.cfg

    Thx for penis models https://jewlz-modding.tebex.io/
]]

--Admin commands: check server/commands.lua
config.commads = {
    unclothe = "unclothe",
    unclothecolor = "unclothecolor",
    unclothehair = "unclothehair",
    censor = "unclothecensor",
    unclotheErect = "unclotheerect"
}

config.esxUserPerm = "user" -- {"user", "admin", "mod"}

config.text = {
    offClotheMan = "You have to take off your pants",
    offClotheWoman = "You have to take off your pants and t-shirt",
    unclothecolorDecs = "Changes Vagina or Penis Color",
    unclotheDecs = "Takes Off All Clothes",
    unclothehairDecs = "Change Vagine Hair Type",
    undress = "You Need To Be Undressed With The /" .. config.commads.unclothe .. " Command",
    colorMan = "You Can Change The Color Of Your Penis With The /" .. config.commads.unclothecolor .. " Command",
    colorWoman = "You Can Change The Color Of Your Vagina With The /" .. config.commads.unclothecolor .. " Command",
    hairWoman = "You Can Change The Type Of Your Vagina Hair With The /" .. config.commads.unclothehair .. " Command",
    censorCommand = "You can turn censorship on or off with the /" .. config.commads.censor .. " command",
    censorDecs = "Censor naked people",
    censorActive = "Censorship is active",
    censorDeactive = "Censorship disabled",
    unclotheErectDecs = "Force Erect",
    cantUseCommand = "U Can't Use This Command"
}

config.needTakeOff = false      -- You have to take off your clothes to use the undress command
config.censorDefaultOpen = false -- censor command is on by default player first created

config.censorData = {
    man = {
        bone = { x = -0.1, y = 0.15, z = 0.0 },
        markerScale = { x = 0.25, y = 0.25, z = 0.15 },
    },
    woman = {
        vaginaBone = { x = -0.05, y = 0.05, z = 0.0 },
        vaginaMarkerScale = { x = 0.12, y = 0.12, z = 0.12 },
        boobsRightBone = { x = -0.01, y = 0.14, z = -0.16 },
        boobsRightMarkerScale = { x = 0.2, y = 0.2, z = 0.2 },
        boobsLeftBone = { x = -0.01, y = 0.14, z = 0.16 },
        boobsLeftMarkerScale = { x = 0.2, y = 0.2, z = 0.2 },
    }
}

--don't change values ​​if you don't know what you're doing
--don't change values ​​if you don't know what you're doing
config.manUnderwearShort = { -- The underwear number your character wears when you take off your clothes(man pants)
    61,
    --[[
        -- u can add extra numbers like this
        61,62,44,32
    ]]
}

--don't change values ​​if you don't know what you're doing
--don't change values ​​if you don't know what you're doing
config.womanUnderwearBra = { -- The underwear number your character wears when you take off your clothes(woman torso)
    15, 74
}

--don't change values ​​if you don't know what you're doing
--don't change values ​​if you don't know what you're doing
config.womanUnderwearShort = { -- The underwear number your character wears when you take off your clothes(woman pants)
    62, 14
}

config.womanEmptySlot = {
    tshirt = 14,
    torso = 82,
}


config.penisCm = {
    {
        cm = 5, index = 1,
    },
    {
        cm = 9, index = 2,
    },
    {
        cm = 12, index = 3,
    },
    {
        cm = 15, index = 4,
    },
    {
        cm = 19, index = 5,
    },
}


function updateNakedConfig()
    config.penis = {
        {
            erect = config.naked.PenisStart,
            nonErect = config.naked.PenisStart + 5,
        },
        {
            erect = config.naked.PenisStart + 1,
            nonErect = config.naked.PenisStart + 6,
        },
        {
            erect = config.naked.PenisStart + 2,
            nonErect = config.naked.PenisStart + 7,
        },
        {
            erect = config.naked.PenisStart + 3,
            nonErect = config.naked.PenisStart + 8,
        },
        {
            erect = config.naked.PenisStart + 4,
            nonErect = config.naked.PenisStart + 9,
        },
    }

    config.female = {
        {
            vagina = config.naked.vaginaStart,
            boobs = { config.naked.boobsStart, config.naked.boobsStart + 1, config.naked.boobsStart + 2, config.naked.boobsStart + 17, config.naked.boobsStart + 18, },
            vaginaHair = { 0, config.naked.vaginaHairStart, config.naked.vaginaHairStart + 1 }
        },
        {
            vagina = config.naked.vaginaStart + 1,
            boobs = { config.naked.boobsStart + 10, config.naked.boobsStart + 23 },
            vaginaHair = { 0, config.naked.vaginaHairStart, config.naked.vaginaHairStart + 1 }
        },
        {
            vagina = config.naked.vaginaStart + 2,
            boobs = { config.naked.boobsStart, config.naked.boobsStart + 1, config.naked.boobsStart + 2, config.naked.boobsStart + 17, config.naked.boobsStart + 18, },
            vaginaHair = { 0, config.naked.vaginaHairStart, config.naked.vaginaHairStart + 1 }
        },
        {
            vagina = config.naked.vaginaStart + 3,
            boobs = { config.naked.boobsStart + 24 },
            vaginaHair = { 0, config.naked.vaginaHairStart, config.naked.vaginaHairStart + 1 }
        },
        {
            vagina = config.naked.vaginaStart + 4,
            boobs = { config.naked.boobsStart + 25 },
            vaginaHair = { 0, config.naked.vaginaHairStart, config.naked.vaginaHairStart + 1 }
        },
        {
            vagina = config.naked.vaginaStart + 5,
            boobs = { config.naked.boobsStart, config.naked.boobsStart + 1, config.naked.boobsStart + 2, config.naked.boobsStart + 17, config.naked.boobsStart + 18, },
            vaginaHair = { 0, config.naked.vaginaHairStart, config.naked.vaginaHairStart + 1 }
        },
        {
            vagina = config.naked.vaginaStart + 6,
            boobs = { config.naked.boobsStart + 3, config.naked.boobsStart + 4, config.naked.boobsStart + 5 },
            vaginaHair = { 0, config.naked.vaginaHairStart + 2, config.naked.vaginaHairStart + 3 }
        },
        {
            vagina = config.naked.vaginaStart + 7,
            boobs = { config.naked.boobsStart + 7 },
            vaginaHair = { 0, config.naked.vaginaHairStart, config.naked.vaginaHairStart + 1 }
        },
        {
            vagina = config.naked.vaginaStart + 8,
            boobs = { config.naked.boobsStart + 10 },
            vaginaHair = { 0, config.naked.vaginaHairStart, config.naked.vaginaHairStart + 1 }
        },
        {
            vagina = config.naked.vaginaStart + 9,
            boobs = { config.naked.boobsStart + 11 },
            vaginaHair = { 0, config.naked.vaginaHairStart, config.naked.vaginaHairStart + 1 }
        },
        {
            vagina = config.naked.vaginaStart + 10,
            boobs = { config.naked.boobsStart + 12 },
            vaginaHair = { 0, config.naked.vaginaHairStart + 4, config.naked.vaginaHairStart + 5 }
        },
        {
            vagina = config.naked.vaginaStart + 11,
            boobs = { config.naked.boobsStart + 19 },
            vaginaHair = { 0, config.naked.vaginaHairStart + 4, config.naked.vaginaHairStart + 5 }
        },
        {
            vagina = config.naked.vaginaStart + 12,
            boobs = { config.naked.boobsStart + 20, config.naked.boobsStart + 21 },
            vaginaHair = { 0, config.naked.vaginaHairStart + 4, config.naked.vaginaHairStart + 5 }
        },
        {
            vagina = config.naked.vaginaStart + 13,
            boobs = { config.naked.boobsStart + 27 },
            vaginaHair = { 0, config.naked.vaginaHairStart + 4, config.naked.vaginaHairStart + 5 }
        },
        {
            vagina = config.naked.vaginaStart + 14,
            boobs = { config.naked.boobsStart + 28, config.naked.boobsStart + 29 },
            vaginaHair = { 0, config.naked.vaginaHairStart + 4, config.naked.vaginaHairStart + 5 }
        },
        {
            vagina = config.naked.vaginaStart + 15,
            boobs = { config.naked.boobsStart + 29 },
            vaginaHair = { 0, config.naked.vaginaHairStart + 4, config.naked.vaginaHairStart + 5 }
        },
    }
end
