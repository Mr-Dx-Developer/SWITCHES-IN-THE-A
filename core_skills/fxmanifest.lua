
fx_version 'adamant'

game 'gta5'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/index.css',
	'html/index.js',
	'html/jquery-3.4.1.min.js',
	'html/img/*.png',
	'html/img/skillpoints/*.png',
	'html/sounds/*.mp4',
	'html/sounds/*.wav',
}


client_scripts{
    'config.lua',
    'client/main.lua',
}

server_scripts{
    'config.lua',
    'server/main.lua',
}

lua54 'yes'


escrow_ignore {
  'client/main.lua',
  'server/main.lua',
  'config.lua',
  'stream/*.ytd',
  'DOCS.lua'
}


dependency '/assetpacks'