fx_version 'cerulean'
game 'gta5'
 
description 'Blackmarket | Made by Rusty'
version '1.1.0'
 
lua54 'yes'

shared_script { 
    'shared/config.lua'
}
 
client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

dependency {
    'qb-menu',
    '/server:4700'
}

escrow_ignore {
    'shared/config.lua'
}


dependency '/assetpacks'