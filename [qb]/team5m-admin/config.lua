Config = {}
Config.Locale = {}

Config.weaponWithItem = false

Config.framework = "qb"

Config.command = "admin"
Config.key = "F9"
Config.supportCommands = {
    "ticket",
    "support"
}
Config.language = "english" -- english, deutsch, custom
Config.reviveTrigger = "wasabi_ambulance"

Config.supportCategories = {
    "Bug",
    "Hack",
    "Information"
}

Config.Admins = {
    [1] = {
        identifier = "discord:981738978015313930",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [2] = {
        identifier = "discord:1144911208303034440",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [3] = {
        identifier = "license:a42affb2332cb775ca0fd3d8bf8c52947eb9efdd",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [4] = {
        identifier = "license:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [5] = {
        identifier = "license:8601d9b7e1fab1f7008d9ca44176ceddd04353bc",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [6] = {
        identifier = "license:4f83247d910711f9d44dc67fc9f2f90f13f1f62d",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [7] = {
        identifier = "discord:662207311665954826",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [8] = {
        identifier = "discord:1110069724143951923",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [9] = {
        identifier = "discord:933914762197213265",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [10] = {
        identifier = "discord:1012094569321615401",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [11] = {
        identifier = "discord:1112074297930956911",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [12] = {
        identifier = "discord:1051260760992522320",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [13] = {
        identifier = "discord:1228785757972598784",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [14] = {
        identifier = "discord:965294234053787648",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    },
    [15] = {
        identifier = "discord:995401533241958590",
        rank = "Admin",
        tagLabel = "[ADMIN]",
        tagColor = "~r~", -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
    }
    

}


Config.weapons = {
    [1] = {
        name = "weapon_pistol",
        label = "Pistol",
        components = { -- https://wiki.rage.mp/index.php?title=Weapons_Components
            "COMPONENT_PISTOL_CLIP_02",
            "COMPONENT_AT_PI_FLSH",
            "COMPONENT_AT_PI_SUPP_02",
        }
    },
    [2] = {
        name = "weapon_appistol",
        label = "AP Pistol",
        components = { -- https://wiki.rage.mp/index.php?title=Weapons_Components
            "COMPONENT_PISTOL_CLIP_02",
            "COMPONENT_AT_PI_FLSH",
            "COMPONENT_AT_PI_SUPP_02",
        }
    }
}

Config.noclipControls = { -- https://docs.fivem.net/docs/game-references/controls/
    goUp = 85, -- [Q]
    goDown = 48, -- [Z]
    turnLeft = 34, -- [A]
    turnRight = 35, -- [D]
    goForward = 32,  -- [W]
    goBackward = 33, -- [S]
    changeSpeed = 21, -- [L-Shift]
}