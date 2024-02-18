fx_version 'cerulean'

game 'gta5'

author 'DRC Scripts'
description 'DRC BURGER SHOT'

version '1.0.1'

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/sh_config.lua',
	'shared/DeliveryCoords.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

files {
	'locales/*.json'
}

escrow_ignore {
	'shared/*.lua',
	'client/cl_Utils.lua',
	'server/sv_Utils.lua',
}
dependency '/assetpacks'