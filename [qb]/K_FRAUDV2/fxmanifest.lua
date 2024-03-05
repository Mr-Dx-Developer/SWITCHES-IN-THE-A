fx_version 'cerulean'
game 'gta5'

description 'K_FRAUDV2'
version '1.0.1'


client_scripts {
    'cl_config.lua',
    'client/client.lua',
    'client/functions.lua',
}

shared_scripts {
    'sh_config.lua',
    'locales.lua'
}

server_scripts {
    'server/server.lua',
    'sv_config.lua'
}


lua54 'yes'


escrow_ignore {
    'cl_config.lua',
    'sh_config.lua',
    'sv_config.lua',
    'client/functions.lua',
    'locales.lua',
    'readme.lua',
}
  

dependency '/assetpacks'