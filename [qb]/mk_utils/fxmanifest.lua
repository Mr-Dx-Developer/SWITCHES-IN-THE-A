fx_version 'cerulean'
games {'gta5'}

author 'ManKind - [https://discord.gg/39fNFepADG]'
description 'Utils for ManKind Scripts'
version '1.0.2'

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua'
}

client_scripts {
	'client/cl_*.lua',
	'bridge/client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'bridge/server/*.lua',
	'server/sv_*.lua',
}

dependencies {
	'/onesync',
    'ox_lib',
	'oxmysql',
}

ox_libs { 'locale' }

ui_page 'web/build/index.html'

files {
	'web/build/sounds/*.ogg',
	'web/build/index.html',
	'web/build/**/*',
	'locales/*.json',
}

escrow_ignore {
	'locales/*.json',
	'bridge/client/*.lua',
	'bridge/server/*.lua',
	'client/cl_vehicles.lua',
	'client/cl_target.lua',
	'web/build/sounds/*.ogg',
	'README.md',
}
dependency '/assetpacks'