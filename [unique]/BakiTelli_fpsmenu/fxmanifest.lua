fx_version 'adamant'

game 'gta5'


version '1.5.4'

ui_page 'html/ui.html'

client_scripts {
	'client.lua',
	'config.lua',
}

server_scripts {
	'server.lua',
	'config.lua',
}


files {
	'html/ui.html',
	'html/*.css',
	'html/*.js',
	'html/img/*.png',
	'html/img/*.jpg',
}

lua54 'yes'

escrow_ignore {
	'shared/*.lua'
}

