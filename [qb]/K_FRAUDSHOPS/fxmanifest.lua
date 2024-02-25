fx_version 'cerulean'
game 'gta5'

description 'K_FRAUDSHOP'
version '1.0.0'


shared_scripts {
    '@es_extended/imports.lua',
    'sh_config.lua'
}

client_scripts {
    'client.lua',
    'cl_config.lua',
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
    'server.lua',
    'client.lua',
}

dependency '/assetpacks'