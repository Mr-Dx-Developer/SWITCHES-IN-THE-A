um = {}

um.debug = false

um.lang = 'en' -- tr,en,es,zh,fr,hi [or add locales > .lua]

--  If you want the apartment start for new player, set it to true.
-- ?If you make it true, new user does not have an apartment, you force them to choose an apartment
um.forceApartmentStart = true

um.property = {
    apartments = {
        status = true, -- If you want to show the apartment system, set it to true.
        script = 'qb', -- qb, qbx , ps
    },
    houses = {
        status = true, -- If you want to show the house system, set it to true.
        script = 'qs', -- qb, qbx , ps , qs , nolag, bcs
    }
}

-- If you want to show the xmas icon, set it to true or hidden false
um.xmas = {
    status = true,
    url = 'https://media.discordapp.net/attachments/1179152362900832316/1217949831696482335/Watermark.png?ex=6605e32c&is=65f36e2c&hm=439ce1e2692271f3b256b8ae997ba911574f7f874420abefca7b8586551a5708&=&format=webp&quality=lossless&width=1214&height=683',
}

um.main = {
    camera = {
        radius = 2.0, -- Camera distance from the character
        angle = 50, -- Camera angle
        point = 0.1, -- Camera point
        turning = true, -- If you want to turn the camera, set it to true.
        skyspawnPos = -20, -- -100 vertical, -20 horizontal
    },
    ped = {
        status = false, -- Make it true if you want your character to see and walk the path
    },
    bookmark = {
        status = true, -- If you want to show the bookmark system, set it to true.
        money = {
            free = false, -- If you want to bookmark the free money, set it to true.
            amount = math.random(1000, 10000) or 500
        }
    },
    map = true, -- If you want to show other locations [paleto etc], set it to true.
}

--[[
   If your hud appears in spawn menu,
   this is nonsense, remember that hud is not shown without playerLoaded or LocalPlayer loaded,
   but that's ok, that's what this function was made for
--]]
um.hud = function(bool)
    if bool then
        -- Example: exports['myhud']:SetDisplay(false)
        Debug('Hud is hidden', 'debug')
    else
        -- Example: exports['myhud']:SetDisplay(true)
        Debug('Hud is show', 'debug')
    end
end

um.weather = {
    sync = false, -- If you want to sync the weather, set it to true.
    sc = 'qb', -- cd , qb
    type = 'XMAS', -- https://docs.fivem.net/docs/game-references/weather-types/
    time = 23, -- 0 - 23
}

um.coords = {
    ['motel'] = {
        coords = vector4(313.23, -236.72, 53.99, 68.11),
        street = 'Meteor St',
        text = 'Motel St'
    },
    ['hospital'] = {
        coords = vector4(286.42, -602.82, 43.19, 128.92),
        street = 'Elgin Ave Del Perro Fwy',
        text = 'Hospital Ave'
    },
    ['police'] = {
        coords = vector4(400.46, -979.54, 29.39, 270.35),
        street = 'Sinner St Atlee St',
        text = 'Police Station'
    },
    ['sandy'] = {
        coords = vector4(1421.33, 3601.24, 34.85, 297.93),
        street = 'Algonquin Blvd',
        text = 'Sandy Shore'
    },
    ['paleto'] = {
        coords = vector4(-131.32, 6390.86, 31.5, 34.13),
        street = 'Paleto Blvd',
        text = 'Paleto Bay'
    }
}
