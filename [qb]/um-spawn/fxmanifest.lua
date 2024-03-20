fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "um-spawn"
author "uyuyorum {um}"
version "1.3.1"
description 'A spawn menu beyond dreams'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
	'utils/*.lua',
	'bridge/**/**'
}

client_scripts {
	'locales/*.lua',
	'main/client/**'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'main/server/*.lua'
}

ui_page 'web/build/index.html'

files {
	'web/build/index.html',
	'web/build/assets/*.js',
	'web/build/assets/*.css',
	'web/build/properties/**'
}

escrow_ignore {
	'config.lua',
	'locales/*.lua',
	'utils/*.lua',
	'bridge/**/**',
	'main/client/functions.lua',
	'main/client/spawn.lua',
	'main/client/bookmark.lua',
	'main/server/bookmark.lua'
}
dependency '/assetpacks'