fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

author 'Keres & Dév'
description 'Brutal Racing - store.brutalscripts.com'
version '1.0.3'

client_scripts { 
	'config.lua',
	'client-utils.lua',
	'client/*.lua'
}

server_scripts { 
	'config.lua',
	'server-utils.lua',
	'server/*.lua'
}

ui_page 'html/index.html'
files {
	'html/index.html',
	'html/style.css',
	'html/script.js',
	'html/assets/*.png'
}

dependencies { 
    '/server:5181',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 5181
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
}

escrow_ignore {
	'config.lua',
	'server-utils.lua', 
	'client-utils.lua'
}

dependency '/assetpacks'