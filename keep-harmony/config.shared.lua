--                _
--               | |
--   _____      _| | _____  ___ _ __
--  / __\ \ /\ / / |/ / _ \/ _ \ '_ \
--  \__ \\ V  V /|   <  __/  __/ |_) |
--  |___/ \_/\_/ |_|\_\___|\___| .__/
--                             | |
--                             |_|
-- https://github.com/swkeep

Config = {} or Config

------------------------------------------------------------------
-- Config
------------------------------------------------------------------
-- 🧙‍♂️ keep-harmony
-- General settings
Config.MagicTouch = false
Config.use_progressbar = true
Config.language = 'en'

-- Framework and Resource settings
Config.framework = 'qb' -- [qb / esx]
-- If you're using ps-inventory, set it below to qb-inventory,
-- and then set Config.resource_names.inventory to ps-inventory!
Config.inventory = 'qb-inventory' -- [qb-inventory / ox_inventory]
Config.target = 'qb-target'       -- [qb-target / ox_target]
Config.menu = 'qb-menu'          -- [built-in / qb-menu / keep-menu / ox_lib]
Config.input = 'qb-input'         -- [built-in / qb-input /keep-input / ox_lib]
Config.progressbar = 'qb'         -- [qb / ox_lib]
Config.notification = 'qb'        -- [built-in / qb / esx / ox_lib / custom
Config.emote = 'rpemotes'         -- [dpemotes / rpemotes / scully_emotemenu]

-- Resource Name Mapping
-- If you are using qb-inventory with a different name for instance, if you renamed it to custom-inventory,
-- you probably need to update its name here to ensure it will work!
Config.resource_names = {
    -- This is the "Resource Name," okay!
    -- I saw people who are using esx set this as esx which is wrong!
    -- It should be es_extended instead!
    framework = 'qb-core',
    inventory = 'qb-inventory',
    target = 'qb-target',
    menu = '', -- leave it empty when using built-in
    input = '' -- leave it empty when using built-in
}

-- If these are active, the built-in menu and input will take over these resources
Config.providers = {
    ['qb-menu'] = {
        active = false,
        resource_name = 'qb-menu',
    },
    ['qb-input'] = {
        active = false,
        resource_name = 'qb-input',
    }
}

-- If set to true, it will disable the logos on other scripts of mine.
-- It shows the logo once when Harmony starts, and that's about it.
Config.silentMode = false

-- If `manualDatabaseCheck` is set to true, my scripts won't check the database.
-- Most of my scripts have some sort of auto-importing SQLs into that database,
-- that won't work either, and you'll have to do everything manually!
Config.manualDatabaseCheck = false
