fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name = 'lation_diving'
author 'iamlation'
version '1.3.5'
description 'An advanced scuba diving job for FiveM'

client_scripts {
    'bridge/client.lua',
    'client/*.lua'
}

server_scripts {
    'bridge/server.lua',
    'server/*.lua',
    'logs.lua'
}

shared_scripts {
    'config.lua',
    'strings.lua',
    '@ox_lib/init.lua'
}

dependencies {
	'ox_lib'
}

escrow_ignore {
    'config.lua',
    'logs.lua',
    'strings.lua',
    'bridge/*.lua',
    'client/functions.lua',
    'server/functions.lua'
}
dependency '/assetpacks'