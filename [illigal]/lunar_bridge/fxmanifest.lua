-- Resource Metadata
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lunar Scripts'
description 'Bridge module'
version '1.2.5'

-- What to run
escrow_ignore {
    'dispatch/client.lua',
    'dispatch/server.lua',
    'config/cl_edit.lua',
    'config/config.lua',
    'framework/**/**'
}

files {
    'framework/**/*.lua',
    'web/**/*'
}

ui_page 'web/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'config/config.lua',
}

client_scripts {
    'framework/**/client.lua',

    'prompts/api.lua',
    'prompts/prompt.lua',
    'prompts/main.lua',

    'config/cl_edit.lua',
    'dispatch/client.lua',
    'utils/cl_main.lua',
    'client/main.lua'
}

server_scripts {
    'framework/**/server.lua',
    'dispatch/server.lua',
    'utils/sv_main.lua',
    'server/main.lua'
}
dependency '/assetpacks'