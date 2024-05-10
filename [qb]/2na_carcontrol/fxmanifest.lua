fx_version 'adamant'

game 'gta5'

author 'Tuna#1565'
description 'Car control script.'

version '1.0.0'

shared_scripts {
	'Config.lua',
	'Common/*.lua'
}

client_scripts {
	'Client/*.lua'
}

server_scripts {
	'Server/*.lua'
}

ui_page 'UI/index.html'

files {
    'UI/index.html',
    'UI/scripts/*.js',
    'UI/styles/*.css',
	'UI/img/*.png',
	'UI/img/*.jpg',
	'UI/img/*.svg',
	'UI/fonts/*.otf',
	'UI/fonts/*.ttf'
}

dependency '2na_core'