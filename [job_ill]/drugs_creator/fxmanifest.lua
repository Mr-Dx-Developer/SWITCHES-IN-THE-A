author 'jaksam1074'

version '5.6.3' -- SCRIPT VERSION

client_scripts {
    -- Callbacks
    "utils/callbacks/cl_callbacks.lua",

    -- Integrations
    'integrations/sh_integrations.lua',
    'integrations/cl_integrations.lua',

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/cl_miscellaneous.lua",

    -- Targeting
    "utils/targeting/cl_targeting.lua",

    -- Settings
    "utils/settings/cl_settings.lua",

    -- Dialogs
    "utils/dialogs/**/cl_*.lua",

    -- Framework
    'utils/framework/sh_framework.lua',
    'utils/framework/cl_framework.lua',

    -- Police
    'utils/police/cl_police.lua',    

    -- Interaction points
    "client/interaction_points.lua",

    -- Locales
    'locales/*.lua',

    -- Script
    'client/main.lua',
    'client/fields.lua',
    'client/laboratories.lua',
    'client/crafting_recipes.lua',
    'client/harvestable_items.lua',
    'client/drugs_effects.lua',
    'client/special_effects.lua',
    'client/pocket_craftings.lua',

    -- Script - Sellings
    'client/boat_selling.lua',
    'client/plane_selling.lua',
    'client/npc_selling.lua',
    'client/narcos.lua',
    'client/pushers.lua',
}

server_scripts{
    -- Warnings
    "utils/warnings/sv_*.lua",

    -- Callbacks
    "utils/callbacks/sv_callbacks.lua",
    
    -- Integrations
    'integrations/sh_integrations.lua',
    'integrations/sv_integrations.lua',

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/sv_miscellaneous.lua",

    -- Settings
    "utils/settings/sv_settings.lua",
    
    -- Dialogs
    "utils/dialogs/**/sv_*.lua",

    -- Framework
    'utils/framework/sh_framework.lua',
    'utils/framework/sv_framework.lua',    

    -- Police
    'utils/police/sv_police.lua',    
    
    -- Dependency
    '@mysql-async/lib/MySQL.lua',

    -- Locales
    'locales/*.lua',
    
    -- Database creation
    'utils/database/database.lua',
    
    -- Wrapper
    "utils/wrapper/sv_wrapper.lua",

    -- Script
    'server/main.lua',
    'server/drugs_effects.lua',
    'server/harvestable_items.lua',
    'server/crafting_recipes.lua',
    'server/laboratories.lua',
    'server/fields.lua',
    'server/pocket_craftings.lua',

    -- Script - Sellings
    'server/plane_selling.lua',
    'server/boat_selling.lua',
    'server/npc_selling.lua',
    'server/narcos.lua',
    'server/pushers.lua',
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/index.css",
    "html/index.js",
    "html/menu_translations/*.json",
    "utils/dialogs/**/*.js",
    "utils/dialogs/**/*.css",
    'html/assets/**/*.*',
}

lua54 "yes"

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/L1_1.ytyp' 

files {
    'stream/L1_1.ytyp',
    'stream/L1_1.ydr',
}

fx_version 'cerulean' --- this is NOT the script version
game 'gta5'

dependencies {
    '/server:4752',
    '/onesync'
}

escrow_ignore {
    "locales/*.lua",
    "integrations/*.lua",

    "client/drugs_effects.lua",
}
dependency '/assetpacks'