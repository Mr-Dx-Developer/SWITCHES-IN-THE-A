
fx_version 'adamant'
game 'gta5'

author 'c8re'
description 'Monitize your server further'
version '1.4.0'

ui_page 'html/form.html'

lua54 'yes'

files {
	'html/form.html',
	'html/css.css',
	'html/water.png',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
	'html/odometer.js',
	'html/img/*.png',
	'html/img/*.jpg',
}

client_scripts{
	'client/main.lua',
}

shared_scripts {
	'config.lua'
}

server_scripts{
	'@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

escrow_ignore {
  'client/main.lua',
  'server/main.lua',
  'config.lua'
}

dependency '/assetpacks'