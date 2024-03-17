fx_version 'cerulean'
game 'gta5'
description 'AV Baby'
version '1.0.0'
lua54 'on'

files {
	'peds.meta'
}

data_file 'PED_METADATA_FILE' 'peds.meta'

client_scripts {
	'config.lua',
	'client.lua'
}

server_scripts {
	'config.lua',
	'server.lua'
}