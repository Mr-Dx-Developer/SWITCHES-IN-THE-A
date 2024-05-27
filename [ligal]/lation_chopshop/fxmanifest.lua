fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'lation_chopshop'
author 'iamlation'
version '1.0.11'
description 'An advanced chop shop resource for FiveM'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'bridge/server.lua',
    'server/*.lua',
    'logs.lua'
}

client_scripts {
    'bridge/client.lua',
    'client/*.lua'
}

shared_scripts {
    'config.lua',
    'strings.lua',
    '@ox_lib/init.lua'
}

dependencies {
	'oxmysql',
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