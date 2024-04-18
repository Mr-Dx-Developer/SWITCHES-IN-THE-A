fx_version 'cerulean'
games {'gta5'}

author 'ManKind - [https://discord.gg/39fNFepADG]'
description 'Vehicle Keys System'
version '1.4.4'

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'config/config.lua',
}

client_scripts {
	'client/cl_*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/sv_*.lua',
}

files {
	'locales/*.json'
}

dependencies {
    'ox_lib',
	'oxmysql',
	'/onesync',
	'mk_utils'
}

ox_libs { 'locale' }

escrow_ignore {
	'config/config.lua',
	'locales/*.json',
	'itemimage/*.png',
	'Keyfobs.sql',
	'README.md'
}
dependency '/assetpacks'