Config = Config or {}

Config = {

    VersionCheck = true,        -- Enables or Disable Version Checks

    Core = "qb",                -- "qb", "esx", or add your core here and configure below.
    CoreObject = "qb-core",     -- "qb-core", "es_extended", or if custom configure object here.
    Notify = "qb",              -- "qb", "ox", or "chat"
    Debug = false,              -- debug poly zones

    SaveProps = true,           -- Saves the props to database and spawns them for newly connected players.

    UseZones = false,           -- restricts the use of the prop placing menu to configured Locations below.

    TargetSystem = "qb",        -- "qb", "qt", "ox", or configure your own in client/editable.lua.
    TargetDistance = 2.0,       -- distance from props to target and remove them.

    RaycastDistance = 20.0,     -- distance from the player for which the prop can be placed.

    LineColor = { r = 255, g = 165, b = 0, a = 255, },

    Controls = { -- https://docs.fivem.net/docs/game-references/controls/

        command         = "housingprops",
        menuKey         = "F3",     -- Key used to bring up the props menu.
        upKey           = 172,      -- up arrow
        downKey         = 173,      -- down arrow
        rotateLeftKey   = 14,       -- mouse scroll wheel up
        rotateRightKey  = 15,       -- mouse scroll wheel down
        cancelKey       = 194,      -- backspace
        placeKey        = 191,      -- enter key

    },

    ClearPeds = { -- if issue with peds spawning in the studio.
        Active = true,
        Coords = vector3(69.44, -1588.74, 29.6),
        Radius = 35.0,
    },

    Locations = {
    },

    Locales = {
        ["prop_saved"] = "Housing Pack Prop Saved!",
        ["prop_deleted"] = "Housing Pack Prop Deleted from Database!",
        ["not_in_zone"] = "Keybind / Command can only be used inside of Housing Pack",
        ["menu_header"] = "**Housing  Pack**",
        ["prop_error"] = "Error Deleting Prop from Database!",

        ["place_object"] = "Place Object",
        ["rotate_object"] = "Rotate Object",
        ["adjust_height"] = "Adjust Height",
        ["cancel"] = "Cancel",
    },
}

if Config.Core == 'esx' then 
    ESX = exports[Config.CoreObject]:getSharedObject()
elseif Config.Core == 'qb' then 
    QBCore = exports[Config.CoreObject]:GetCoreObject()
elseif Config.Core == 'custom' then 
    -- Configure your Core Object Export here.
end

