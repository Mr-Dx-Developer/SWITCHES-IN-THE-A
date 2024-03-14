fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'Keres & Dév'
description 'Brutal Boxing - store.brutalscripts.com'
version '1.0.6'

client_scripts { 
	'config.lua',
	'core/client-core.lua',
	'cl_utils.lua',
	'client/*.lua'
}

server_scripts { 
	'@mysql-async/lib/MySQL.lua', 
	'config.lua',
	'core/server-core.lua',
	'server/*.lua'
}

export 'isBoxing'

shared_script {
	'@ox_lib/init.lua'
}

ui_page "html/index.html"
files {
	"html/index.html",
	"html/style.css",
	"html/script.js"
}

dependencies { 
    '/server:5181',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 5181
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
}

escrow_ignore {
	'config.lua',
	'cl_utils.lua',
	'core/client-core.lua',
	'core/server-core.lua',
}
dependency '/assetpacks'