fx_version 'cerulean'
game 'gta5'

author 'Kypos'

discription 'Intimacy/Sleep/Pregancy script'
version '1.0.4'

shared_scripts {
   --- '@es_extended/imports.lua',
    'shared.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua',
    'client/functions.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

lua54 'yes'


escrow_ignore {
    'config.lua',
}
  
dependency '/assetpacks'