fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "um-multicharacter"
author "uyuyorum store"
license 'FiveM Escrow'
version "4.1.2"
description "UM - Multi Character"

shared_scripts {
	'@ox_lib/init.lua',
	'locales/*.lua',
	'list/*.lua',
	'config.lua',
	'framework/custom.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	'framework/getskin.lua',
}

ui_page 'web/build/index.html'

files {
	'web/build/index.html',
	'web/build/assets/*.js',
	'web/build/assets/*.css',
	'web/build/*.png',
	'web/build/filters/*.png',
	'web/build/audio/*.wav',
	'web/build/audio/*.mp3',
}

escrow_ignore {
	'locales/*.lua',
	'list/*.lua',
	'config.lua',
	'server/qb_commands.lua',
	'server/qb_functions.lua',
	'server/qb_logs.lua',
	'server/discord.lua',
	'framework/*.lua',
}

dependencies {
	'ox_lib',
    '/onesync',
}

dependency '/assetpacks'