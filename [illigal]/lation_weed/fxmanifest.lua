fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'lation_weed'
author 'iamlation'
version '2.0.10'
description 'An advanced & modern weed growing script for ESX & QBCore, with custom props by shoeshuffler!'

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

files {
    'stream/*.ytyp',
    'stream/**/*.ydr'
}

data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'

dependencies {
	'oxmysql',
	'ox_lib'
}

escrow_ignore {
    'config.lua',
    'logs.lua',
    'strings.lua',
    'client/functions.lua',
    'server/functions.lua',
    'bridge/*.lua'
}
dependency '/assetpacks'