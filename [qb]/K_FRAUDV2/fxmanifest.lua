fx_version 'cerulean'
game 'gta5'

description 'K_FRAUDV2'
version '1.0.5'


shared_scripts {
    --'@es_extended/imports.lua',
    'sh_config.lua',
    'locales.lua'
}

client_scripts {
    'cl_config.lua',
    'client/client.lua',
    'client/functions.lua',
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
}
  


dependency '/assetpacks'