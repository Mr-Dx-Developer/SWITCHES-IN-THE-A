Framework = 2 --[ 1 = ESX / 2 = QBCore / 3 = Other ] Choose your framework

FrameworkTriggers = {
    notify = 'QBCore:Notify', -- [ ESX = 'esx:showNotification' / QBCore = 'QBCore:Notify' ] Set the notification event, if left blank, default will be used
    object = 'QBCore:GetObject', --[ ESX = 'esx:getSharedObject' / QBCore = 'QBCore:GetObject' ] Set the shared object event, if left blank, default will be used (deprecated for QBCore)
    resourceName = 'qb-core', -- [ ESX = 'es_extended' / QBCore = 'qb-core' ] Set the resource name, if left blank, automatic detection will be performed
}

UseOxInventory = nil
DisableMysql = false

-- If True, will use old non-additive rendering style
-- the sprays will look a bit "out of place" and won't blend into it's wall well
UseLegacyRendering = false

Config = {
    -- example config for other persistance durations
    ---- 1/24/60/60 * (60*60) => 1 hour
    ---- 1/24/60/60 * (60*60*6) => 6 hours
    ---- 1/24/60/60 * (60*60*12) => 12 hours
    SPRAY_PERSIST_DAYS = 2, -- days
    SPRAY_PROGRESSBAR_DURATION = 20000,
    SPRAY_REMOVE_DURATION = 30000,

    SPRAY_CHAR_LIMIT = 9,

    Keys = {
        CANCEL = {code = 194, label = 'INPUT_FRONTEND_RRIGHT'},
    },

    Blacklist = {
        'nigger',
        'niger',
        'nigga',
    },

    DisableText = false,


    -- Renders a sphere representing the blacklist zone
    BlacklistZoneDebug = false,

    BlacklistZones = {
        -- {
        --     pos = vector3(449.49, -987.4, 30.68),
        --     range = 30.0,
        -- }
    },

    Text = {
        CANCEL = 'Cancel',
        SPRAY_ERRORS = {
            NOT_FLAT = 'This surface is not flat enough',
            TOO_FAR = 'The surface is too far',
            INVALID_SURFACE = 'It cannot be sprayed on this surface',
            AIM = 'Aim the spray at a flat wall',
            CANT_OVERLAP = 'Graffiti can\'t overlap',
            IN_BLACKLIST_ZONE = 'You can\'t grafitti in this area',
        },
        NO_SPRAY_NEARBY = 'There is no spray nearby to remove',
        NEED_SPRAY = 'You do not have any spray to spray with',
        WORD_LONG = 'Spray word can be at most 9 characters',
        USAGE = 'Usage: /spray',
        NUI_TEXT = {
            ['text'] = 'TEXT',
            ['image'] = 'IMAGE',
            ['word-not-allowed'] = 'This word is not allowed!',
            ['color'] = 'color',
            ['spray'] = 'SPRAY',
            ['click-to-select'] = 'CLICK TO SELECT',
            ['cancel'] = 'CANCEL',
            ['keybind-spray'] = 'Spray',
            ['keybind-change-size'] = 'Change Size',
            ['keybind-back'] = 'Back',
            ['input-placeholder'] = 'Your graffiti text here',
            ['default-graffiti'] = 'GRAFFITI',
            ['save-color'] = 'Save',
        }
    }
}

FONTS = {
    {
        font = 'graffiti1',
        label = 'Next Custom',
        allowed = '^[A-Z0-9\\-.]+$',
        forceUppercase = true,
        allowedInverse = '[^A-Z0-9\\-.]+',
        sizeMult = 0.35,
    },
    {
        font = 'graffiti2',
        label = 'Dripping Marker',
        allowed = '^[A-Za-z0-9]+$',
        allowedInverse = '[^A-Za-z0-9]+',
        sizeMult = 1.0,
    },
    {
        font = 'graffiti6',
        label = 'Barrio Santo',
        forceUppercase = true,
        allowed = '^[A-Z0-9]+$',
        allowedInverse = '[^A-Z0-9]+',
        sizeMult = 0.90,
    },
    {
        font = 'graffiti7',
        label = 'Bomb',
        allowed = '^[A-Z0-9!?]+$',
        forceUppercase = true,
        allowedInverse = '[^A-Z0-9!?]+',
        sizeMult = 0.75,
    },
    {
        font = 'graffiti8',
        label = 'Bombing',
        allowed = '^[A-Z0-9!?+\\-*/]+$',
        forceUppercase = true,
        allowedInverse = '[^A-Z0-9!?+\\-*/]+',
        sizeMult = 1.15,
    },
    {
        font = 'graffiti9',
        label = 'Train Gangsta',
        allowed = '^[A-Z0-9?!]+$',
        forceUppercase = true,
        allowedInverse = '[^A-Z0-9?!]+',
        sizeMult = 0.6,
    },
    {
        font = 'graffiti10',
        label = 'Street Wrister',
        allowed = '^[A-Z0-9!?+\\-*/]+$',
        forceUppercase = true,
        allowedInverse = '[^A-Z0-9!?+\\-*/]+',
        sizeMult = 1.0,
    },
    {
        font = 'graffiti11',
        label = 'Peinture Fraiche',
        allowed = '^[A-Z0-9!?+\\-*/]+$',
        forceUppercase = true,
        allowedInverse = '[^A-Z0-9!?+\\-*/]+',
        sizeMult = 1.0,
    },
    {
        font = 'PricedownGTAVInt',
        label = 'Pricedown',
        allowed = '^[A-Za-z0-9]+$',
        allowedInverse = '[^A-Za-z0-9]+',
        sizeMult = 0.75,
    },
}

IMAGES = {
    {
        dict = 'rcore_graffiti',
        name = 'grove',
        scale = 0.17,
        color = {33, 146, 0},
        gangTags = {'gsf'}, -- Used for capturing territory when using https://store.rcore.cz/package/4913168
        width = 752,
        height = 752,
    },
    {
        dict = 'rcore_graffiti',
        name = 'aztecas',
        scale = 0.17,
        color = {214, 101, 41},
        gangTags = {'aztecas'}, -- Used for capturing territory when using https://store.rcore.cz/package/4913168
        width = 640,
        height = 732,
    },
    {
        dict = 'rcore_graffiti',
        name = 'ballas',
        scale = 0.235,
        color = {142, 7, 198},
        gangTags = {'ballas'}, -- Used for capturing territory when using https://store.rcore.cz/package/4913168
        width = 500,
        height = 544,
    },
    {
        dict = 'rcore_graffiti',
        name = 'vagos',
        scale = 0.47,
        color = {164, 103, 65},
        gangTags = {'vagos'}, -- Used for capturing territory when using https://store.rcore.cz/package/4913168
        width = 272,
        height = 272,
    },
}

FastImageMap = {}
for _, d in pairs(IMAGES) do FastImageMap[d.dict .. d.name] = d end

COLORS = {
    {
        basic = 'WHITE',
        hex = 'ffffff',
        rgb = {255, 255, 255},
    },
    {
        basic = 'RED',
        hex = 'c81912',
        rgb = {200, 25, 18},
    },
    {
        basic = 'RED',
        hex = 'f64b3c',
        rgb = {246, 75, 60},
    },
    {
        basic = 'PINK',
        hex = 'f76a8c',
        rgb = {247, 106, 140},
    },
    {
        basic = 'PINK',
        hex = 'fde2e2',
        rgb = {253, 226, 226},
    },
    {
        basic = 'BLUE',
        hex = '000839',
        rgb = {0, 8, 57},
    },
    {
        basic = 'BLUE',
        hex = '005082',
        rgb = {0, 80, 130},
    },
    {
        basic = 'BLUE',
        hex = '00a8cc',
        rgb = {0, 168, 204},
    },
    {
        basic = 'YELLOW',
        hex = 'ffd31d',
        rgb = {255, 211, 29},
    },
    {
        basic = 'YELLOW',
        hex = 'f5fcc1',
        rgb = {245, 252, 193},
    },
    {
        basic = 'GREEN',
        hex = '2b580c',
        rgb = {43, 88, 12},
    },
    {
        basic = 'GREEN',
        hex = '639a67',
        rgb = {99, 154, 103},
    },
    {
        basic = 'ORANGE',
        hex = 'ea6227',
        rgb = {234, 98, 39},
    },
    {
        basic = 'ORANGE',
        hex = 'ffa41b',
        rgb = {255, 164, 27},
    },
    {
        basic = 'BROWN',
        hex = '442727',
        rgb = {68, 39, 39},
    },
    {
        basic = 'BROWN',
        hex = '9c5518',
        rgb = {156, 85, 24},
    },
    {
        basic = 'PURPLE',
        hex = '844685',
        rgb = {132, 70, 133},
    },
    {
        basic = 'PURPLE',
        hex = 'be79df',
        rgb = {190, 121, 223},
    },
    {
        basic = 'GREY',
        hex = 'cccccc',
        rgb = {204, 204, 204},
    },
    {
        basic = 'GREY',
        hex = '323232',
        rgb = {50, 50, 50},
    },
    {
        basic = 'BLACK',
        hex = '000000',
        rgb = {0, 0, 0},
    },
}

SIMPLE_COLORS = {}

for idx, c in pairs(COLORS) do
    SIMPLE_COLORS[idx] = c.rgb
end

FW_ESX = 1
FW_QBCORE = 2
FW_OTHER = 3