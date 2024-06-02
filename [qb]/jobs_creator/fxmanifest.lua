version '7.10.2'

author 'jaksam1074'

shared_scripts {
    "shared/shared.lua"
}

client_scripts {
    -- Callbacks
    "utils/callbacks/cl_callbacks.lua",

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/cl_miscellaneous.lua",

    -- Targeting
    "utils/targeting/cl_targeting.lua",

    -- Integrations
    'integrations/sh_*.lua',
    'integrations/cl_*.lua',

    -- Settings
    "utils/settings/cl_settings.lua",

    -- Dialogs
    "utils/dialogs/**/cl_*.lua",

    -- Framework
    'utils/framework/sh_framework.lua',
    'utils/framework/cl_framework.lua',

    -- Locales
    "locales/*",
    
    -- Actual client files
    'client/actions/*.lua',
    'client/markers/*.lua',
    'client/main.lua',
    'client/nui_callbacks.lua'
}

server_scripts {
    -- Warnings
    "utils/warnings/sv_*.lua",

    -- Dependency
    '@mysql-async/lib/MySQL.lua',
    
    -- Callbacks
    "utils/callbacks/sv_callbacks.lua",

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/sv_miscellaneous.lua",

    -- Integrations
    'integrations/sh_*.lua',
    'integrations/sv_*.lua',    

    -- Settings
    "utils/settings/sv_settings.lua",

    -- Dialogs
    "utils/dialogs/**/sv_*.lua",

    -- Framework
    'utils/framework/sh_framework.lua',
    'utils/framework/sv_framework.lua',    

    -- Locales
    'locales/*.lua',
    
    -- Database creation
    'utils/database/database.lua',
    
    -- Actual server files
    'server/main.lua',
    'server/code_integrator.lua',
    'server/functions.lua',
    'server/actions.lua',
    'server/markers/*.lua',
}

ui_page 'html/index.html'

files {
    'html/menu_translations/*.json',
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/assets/**/*.*',
    "utils/dialogs/**/*.js",
    "utils/dialogs/**/*.css",
}

fx_version 'cerulean'
game 'gta5'

dependencies {
    '/onesync',
    '/server:4752'
}

lua54 'yes' 

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/L1_1.ytyp' 

files {
    'stream/L1_1.ytyp',
    'stream/L1_1.ydr',
}

escrow_ignore {
    -- Integration files
    "integrations/*.lua",

    -- Locales
    "locales/*.lua",

    -- Exceptions 
    "client/actions/actions.lua",
    "client/markers/garage_owned.lua",
    "server/markers/garage_owned.lua",
}
dependency '/assetpacks'