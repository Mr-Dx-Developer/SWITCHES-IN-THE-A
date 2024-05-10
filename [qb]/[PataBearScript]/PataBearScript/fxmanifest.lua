fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'PataBearScriptV2'
version '2.0'
description 'Bear script&props'
author 'Patatichette and Sarish for PataMods'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/img/*.*',
	'html/debug.js',
	'html/app.js',
	'html/style.css'
}

-- ui_page 'dist/menuv.html'
shared_scripts {
	
	"config/debug.lua",
	"config/config.lua",
	"config/lang/*.lua",
	
}

client_scripts {
	"config/BabyConfig.lua",
	"config/client/target.lua",
	"config/client/client.lua",
    'client/client.lua',
    'client/ui.lua',
}

server_scripts {
	"config/server/server.lua",
	"server/server.lua",
}

escrow_ignore {
	"config/*.*",
    "config/**/*.*",
	'READ ME IMPORTANT PLEASE.txt',
 }
dependency '/assetpacks'