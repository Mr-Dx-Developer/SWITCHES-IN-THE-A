fx_version 'adamant'
game 'gta5'
author 'Lucid#3604'
description 'codem'

shared_script 'config.lua'

client_scripts {
    'client/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua',
}

ui_page 'html/index.html'
files {
    'html/index.html',
    'html/index.js',
    'html/style.css',
    'html/assets/sound/*.mp3',
    'html/assets/fonts/*.ttf',
    'html/assets/fonts/*.OTF',
    'html/assets/icons/*.png',
    'html/assets/icons/*.svg',
    'html/assets/icons/*.jpg',
    'html/assets/icons/*.jpeg',
    'html/assets/settings/*.png',
    'html/lib/*.js',
}


lua54 'yes'

escrow_ignore {
	'config.lua',
}

dependency '/assetpacks'