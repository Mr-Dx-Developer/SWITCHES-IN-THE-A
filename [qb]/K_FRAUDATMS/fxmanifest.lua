fx_version 'cerulean'
game 'gta5'

description 'K_FRAUDATMS'
version '1.0.0'


shared_scripts {
    '@es_extended/imports.lua',
    'sh_config.lua'
}


client_scripts {
    'cl_config.lua',
    'client.lua',
}

server_scripts {
    'server.lua',
    'sv_config.lua'
}


lua54 'yes'

escrow_ignore {
    'cl_config.lua',
    'sh_config.lua',
    'sv_config.lua',
    'client.lua',
    'server.lua',
}

dependency '/assetpacks'