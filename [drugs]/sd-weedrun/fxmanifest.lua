fx_version 'cerulean'
game 'gta5'

name "NoPixel Inspired Oxy Run"
author "Made with love by Samuel#0008"
version "1.0"


shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- change en to your language
	'config.lua',
}

client_scripts {
	'client/main.lua',
	'config.lua'
}

server_scripts {
	'server/main.lua',
	'config.lua'
}
